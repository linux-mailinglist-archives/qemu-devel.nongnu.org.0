Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BB3974B382C
	for <lists+qemu-devel@lfdr.de>; Sat, 12 Feb 2022 22:15:03 +0100 (CET)
Received: from localhost ([::1]:35296 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nIzjS-0002Qq-6a
	for lists+qemu-devel@lfdr.de; Sat, 12 Feb 2022 16:15:02 -0500
Received: from eggs.gnu.org ([209.51.188.92]:54444)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mithi@mithi.net>) id 1nIxa3-0004OG-Ov
 for qemu-devel@nongnu.org; Sat, 12 Feb 2022 13:57:11 -0500
Received: from zoidberg.org ([88.198.6.61]:50981 helo=heapsort.de)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <mithi@mithi.net>) id 1nIxa1-00009D-4j
 for qemu-devel@nongnu.org; Sat, 12 Feb 2022 13:57:11 -0500
Received: from localhost (ip-037-201-137-078.um10.pools.vodafone-ip.de
 [::ffff:37.201.137.78])
 (AUTH: PLAIN mithi, TLS: TLSv1/SSLv3,256bits,AES256-GCM-SHA384)
 by cthulhu.zoidberg.org with ESMTPSA; Sat, 12 Feb 2022 19:57:04 +0100
 id 00000000002A1CAA.62080300.00001F5D
From: Thomas Jansen <mithi@mithi.net>
To: 
Subject: [PATCH] net/eth: Don't consider ESP to be an IPv6 option header
Date: Sat, 12 Feb 2022 19:56:41 +0100
Message-Id: <20220212185641.387900-1-mithi@mithi.net>
X-Mailer: git-send-email 2.34.1
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: 7bit
X-Mime-Autoconverted: from 8bit to 7bit by courier 0.73
Received-SPF: none client-ip=88.198.6.61; envelope-from=mithi@mithi.net;
 helo=heapsort.de
X-Spam_score_int: -8
X-Spam_score: -0.9
X-Spam_bar: /
X-Spam_report: (-0.9 / 5.0 requ) BAYES_00=-1.9, FORGED_SPF_HELO=1,
 SPF_HELO_PASS=-0.001, SPF_NONE=0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Sat, 12 Feb 2022 16:14:00 -0500
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Thomas Jansen <mithi@mithi.net>, Jason Wang <jasowang@redhat.com>,
 Dmitry Fleytman <dmitry.fleytman@gmail.com>,
 "open list:All patches CC here" <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The IPv6 option headers all have in common that they start with some
common fields, in particular the type of the next header followed by the
extention header length. This is used to traverse the list of the
options. The ESP header does not follow that format, which can break the
IPv6 option header traversal code in eth_parse_ipv6_hdr().

The effect of that is that network interfaces such as vmxnet3 that use
the following call chain
  eth_is_ip6_extension_header_type
  eth_parse_ipv6_hdr
  net_tx_pkt_parse_headers
  net_tx_pkt_parse
  vmxnet3_process_tx_queue
to send packets from the VM out to the host will drop packets of the
following structure:
  Ethernet-Header(IPv6-Header(ESP(encrypted data)))

Note that not all types of network interfaces use the net_tx_pkt_parse
function though, leading to inconsistent behavior regarding sending
those packets. The e1000 network interface for example does not suffer
from this limitation.

By not considering ESP to be an IPv6 header we can allow sending those
packets out to the host on all types of network interfaces.

Fixes: 75020a702151 ("Common definitions for VMWARE devices")
Resolves: https://gitlab.com/qemu-project/qemu/-/issues/149
Buglink: https://bugs.launchpad.net/qemu/+bug/1758091
Signed-off-by: Thomas Jansen <mithi@mithi.net>
---
 net/eth.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/net/eth.c b/net/eth.c
index fe876d1a55..f074b2f9f3 100644
--- a/net/eth.c
+++ b/net/eth.c
@@ -389,7 +389,6 @@ eth_is_ip6_extension_header_type(uint8_t hdr_type)
     case IP6_HOP_BY_HOP:
     case IP6_ROUTING:
     case IP6_FRAGMENT:
-    case IP6_ESP:
     case IP6_AUTHENTICATION:
     case IP6_DESTINATON:
     case IP6_MOBILITY:
-- 
2.34.1


