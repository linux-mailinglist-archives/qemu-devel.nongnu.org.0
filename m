Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3EAC1343D94
	for <lists+qemu-devel@lfdr.de>; Mon, 22 Mar 2021 11:15:12 +0100 (CET)
Received: from localhost ([::1]:38546 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lOHaZ-00051w-90
	for lists+qemu-devel@lfdr.de; Mon, 22 Mar 2021 06:15:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56372)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1lOHUR-0008Cx-1Z
 for qemu-devel@nongnu.org; Mon, 22 Mar 2021 06:08:51 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:53689)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1lOHUP-0002ze-7v
 for qemu-devel@nongnu.org; Mon, 22 Mar 2021 06:08:50 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1616407727;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=3dBzoKJlvgjTGvi/faJhenRp8OgRptOI1KtvNjSDRYw=;
 b=JlSgzdNENaYBtm2ib0qMfj4HYHZPa4yKtYAQgPL5kxrASmk/TOiadV46UVBAUGZTOBNRIP
 m/rlD4hhIf6nC+UUHFIYO4ajj0dVrU+SZLcV8MyMvRxSwIAXCCc2sejHp2chcxV2tsMN3P
 F8581orjju0HCGcqYOKRA2APdVMqOv4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-215-7hrjFTewMLCL6Yn9CsH-xA-1; Mon, 22 Mar 2021 06:08:45 -0400
X-MC-Unique: 7hrjFTewMLCL6Yn9CsH-xA-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 7C5131009472;
 Mon, 22 Mar 2021 10:08:44 +0000 (UTC)
Received: from jason-ThinkPad-T430s.redhat.com (ovpn-12-83.pek2.redhat.com
 [10.72.12.83])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 28DBF5D9CD;
 Mon, 22 Mar 2021 10:08:37 +0000 (UTC)
From: Jason Wang <jasowang@redhat.com>
To: qemu-devel@nongnu.org,
	peter.maydell@linaro.org
Subject: [PULL 08/13] net/eth: Simplify _eth_get_rss_ex_dst_addr()
Date: Mon, 22 Mar 2021 18:08:07 +0800
Message-Id: <1616407692-693-9-git-send-email-jasowang@redhat.com>
In-Reply-To: <1616407692-693-1-git-send-email-jasowang@redhat.com>
References: <1616407692-693-1-git-send-email-jasowang@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jasowang@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=jasowang@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Jason Wang <jasowang@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Philippe Mathieu-Daudé <philmd@redhat.com>

The length field is already contained in the ip6_ext_hdr structure.
Check it direcly in eth_parse_ipv6_hdr() before calling
_eth_get_rss_ex_dst_addr(), which gets a bit simplified.

Reviewed-by: Miroslav Rezanina <mrezanin@redhat.com>
Reviewed-by: Stefano Garzarella <sgarzare@redhat.com>
Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Signed-off-by: Jason Wang <jasowang@redhat.com>
---
 net/eth.c | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/net/eth.c b/net/eth.c
index c8babfa..06badd1 100644
--- a/net/eth.c
+++ b/net/eth.c
@@ -407,9 +407,7 @@ _eth_get_rss_ex_dst_addr(const struct iovec *pkt, int pkt_frags,
 {
     struct ip6_ext_hdr_routing *rthdr = (struct ip6_ext_hdr_routing *) ext_hdr;
 
-    if ((rthdr->rtype == 2) &&
-        (rthdr->len == sizeof(struct in6_address) / 8) &&
-        (rthdr->segleft == 1)) {
+    if ((rthdr->rtype == 2) && (rthdr->segleft == 1)) {
 
         size_t input_size = iov_size(pkt, pkt_frags);
         size_t bytes_read;
@@ -528,10 +526,12 @@ bool eth_parse_ipv6_hdr(const struct iovec *pkt, int pkt_frags,
         }
 
         if (curr_ext_hdr_type == IP6_ROUTING) {
-            info->rss_ex_dst_valid =
-                _eth_get_rss_ex_dst_addr(pkt, pkt_frags,
-                                         ip6hdr_off + info->full_hdr_len,
-                                         &ext_hdr, &info->rss_ex_dst);
+            if (ext_hdr.ip6r_len == sizeof(struct in6_address) / 8) {
+                info->rss_ex_dst_valid =
+                    _eth_get_rss_ex_dst_addr(pkt, pkt_frags,
+                                             ip6hdr_off + info->full_hdr_len,
+                                             &ext_hdr, &info->rss_ex_dst);
+            }
         } else if (curr_ext_hdr_type == IP6_DESTINATON) {
             info->rss_ex_src_valid =
                 _eth_get_rss_ex_src_addr(pkt, pkt_frags,
-- 
2.7.4


