Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 579665E960E
	for <lists+qemu-devel@lfdr.de>; Sun, 25 Sep 2022 22:51:14 +0200 (CEST)
Received: from localhost ([::1]:59432 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ocYam-0002sl-Ll
	for lists+qemu-devel@lfdr.de; Sun, 25 Sep 2022 16:51:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43016)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mcascell@redhat.com>)
 id 1ocYVL-0000MU-Aw
 for qemu-devel@nongnu.org; Sun, 25 Sep 2022 16:45:35 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:31672)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mcascell@redhat.com>)
 id 1ocYVG-0000gf-P6
 for qemu-devel@nongnu.org; Sun, 25 Sep 2022 16:45:32 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1664138728;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=G85a1UWkiVHMpqTYuu2+R25oSBYe4UWW84jebp9crDg=;
 b=DF+YUzDpwvWohuSXA0J7bWPYHHvpikYDHDIBBP2jNVsDB4wt5A4cSrwsiqFpZ0sXn5Yn5v
 BCtEb3G4kgi4wYXajl7tm840sEyTXCsiVjQThX4ttaBiyEKEq1zt7/sUmEZg6FAcJPkfib
 IrOm87YtWT0SUPkaMwO38An0ckiFLv0=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-158-i9aEtF1yN72_YCnosbxozA-1; Sun, 25 Sep 2022 16:45:24 -0400
X-MC-Unique: i9aEtF1yN72_YCnosbxozA-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 4FF55101A528;
 Sun, 25 Sep 2022 20:45:24 +0000 (UTC)
Received: from f36-work.redhat.com (unknown [10.39.192.52])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 7F9CE40C6EC2;
 Sun, 25 Sep 2022 20:45:21 +0000 (UTC)
From: Mauro Matteo Cascella <mcascell@redhat.com>
To: qemu-devel@nongnu.org
Cc: mcascell@redhat.com,
	kraxel@redhat.com,
	tangpeng@qianxin.com
Subject: [PATCH] ui/vnc-clipboard: fix integer underflow in
 vnc_client_cut_text_ext
Date: Sun, 25 Sep 2022 22:45:11 +0200
Message-Id: <20220925204511.1103214-1-mcascell@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.2
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mcascell@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Extended ClientCutText messages start with a 4-byte header. If len < 4,
an integer underflow occurs in vnc_client_cut_text_ext. The result is
used to decompress data in a while loop in inflate_buffer, leading to
CPU consumption and denial of service. Prevent this by checking dlen in
protocol_client_msg.

Fixes: CVE-2022-3165
Fixes: 0bf41cab93e5 ("ui/vnc: clipboard support")
Reported-by: TangPeng <tangpeng@qianxin.com>
Signed-off-by: Mauro Matteo Cascella <mcascell@redhat.com>
---
Extended Clipboard Pseudo-Encoding:
https://github.com/rfbproto/rfbproto/blob/master/rfbproto.rst#extended-clipboard-pseudo-encoding

 ui/vnc.c | 11 ++++++++---
 1 file changed, 8 insertions(+), 3 deletions(-)

diff --git a/ui/vnc.c b/ui/vnc.c
index 6a05d06147..acb3629cd8 100644
--- a/ui/vnc.c
+++ b/ui/vnc.c
@@ -2442,8 +2442,8 @@ static int protocol_client_msg(VncState *vs, uint8_t *data, size_t len)
         if (len == 1) {
             return 8;
         }
+        uint32_t dlen = abs(read_s32(data, 4));
         if (len == 8) {
-            uint32_t dlen = abs(read_s32(data, 4));
             if (dlen > (1 << 20)) {
                 error_report("vnc: client_cut_text msg payload has %u bytes"
                              " which exceeds our limit of 1MB.", dlen);
@@ -2456,8 +2456,13 @@ static int protocol_client_msg(VncState *vs, uint8_t *data, size_t len)
         }
 
         if (read_s32(data, 4) < 0) {
-            vnc_client_cut_text_ext(vs, abs(read_s32(data, 4)),
-                                    read_u32(data, 8), data + 12);
+            if (dlen < 4) {
+                error_report("vnc: malformed payload (header less than 4 bytes)"
+                             " in extended clipboard pseudo-encoding.");
+                vnc_client_error(vs);
+                break;
+            }
+            vnc_client_cut_text_ext(vs, dlen, read_u32(data, 8), data + 12);
             break;
         }
         vnc_client_cut_text(vs, read_u32(data, 4), data + 8);
-- 
2.37.3


