Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4270B4B4097
	for <lists+qemu-devel@lfdr.de>; Mon, 14 Feb 2022 05:04:14 +0100 (CET)
Received: from localhost ([::1]:33014 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nJSaz-00029e-Cr
	for lists+qemu-devel@lfdr.de; Sun, 13 Feb 2022 23:04:13 -0500
Received: from eggs.gnu.org ([209.51.188.92]:59862)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1nJSVF-00024R-PD
 for qemu-devel@nongnu.org; Sun, 13 Feb 2022 22:58:17 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:55705)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1nJSVE-0008Dz-1L
 for qemu-devel@nongnu.org; Sun, 13 Feb 2022 22:58:17 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1644811095;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=wQpLZ2QkOYtAJ8AmiNv/VQWFHBhdsPuE6aFYHLgAT54=;
 b=G8svqjpADa7MX/TCJ1aXStgGeoWMfKMxEwNOiaDwuwZf3CwrCf6D17nidphFLvzOZ7/bfs
 C+UhJ5NEUYBeFIF8sEd/HuB6RX7WMEHtPY9qj0B+Y3u9HWtvDh7SaBiJGfQ3bbqwDUu7b2
 ubGKqCl47T2jgGDlbrtM+hx8YEmt3g4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-630-2rsMBLGiPyuZPV7bNa0LhQ-1; Sun, 13 Feb 2022 22:58:11 -0500
X-MC-Unique: 2rsMBLGiPyuZPV7bNa0LhQ-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id EE58E814245;
 Mon, 14 Feb 2022 03:58:10 +0000 (UTC)
Received: from localhost.localdomain (ovpn-13-241.pek2.redhat.com
 [10.72.13.241])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 189EB5DB8B;
 Mon, 14 Feb 2022 03:58:08 +0000 (UTC)
From: Jason Wang <jasowang@redhat.com>
To: qemu-devel@nongnu.org,
	peter.maydell@linaro.org
Subject: [PATCH 8/8] net/eth: Don't consider ESP to be an IPv6 option header
Date: Mon, 14 Feb 2022 11:57:41 +0800
Message-Id: <20220214035741.70990-8-jasowang@redhat.com>
In-Reply-To: <20220214035741.70990-1-jasowang@redhat.com>
References: <20220214035741.70990-1-jasowang@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jasowang@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=jasowang@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
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
Cc: Thomas Jansen <mithi@mithi.net>, Jason Wang <jasowang@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Thomas Jansen <mithi@mithi.net>

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
Signed-off-by: Jason Wang <jasowang@redhat.com>
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
2.32.0 (Apple Git-132)


