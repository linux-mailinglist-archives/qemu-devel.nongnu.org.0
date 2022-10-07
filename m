Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 353605F72B3
	for <lists+qemu-devel@lfdr.de>; Fri,  7 Oct 2022 04:14:27 +0200 (CEST)
Received: from localhost ([::1]:51584 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ogcsb-0006Mg-SW
	for lists+qemu-devel@lfdr.de; Thu, 06 Oct 2022 22:14:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36622)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <luzhipeng@cestc.cn>)
 id 1ogcrX-0004j5-F9
 for qemu-devel@nongnu.org; Thu, 06 Oct 2022 22:13:19 -0400
Received: from [106.39.185.57] (port=58040 helo=smtp.cecloud.com)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <luzhipeng@cestc.cn>) id 1ogcrU-0001nD-D7
 for qemu-devel@nongnu.org; Thu, 06 Oct 2022 22:13:19 -0400
Received: from localhost (localhost [127.0.0.1])
 by smtp.cecloud.com (Postfix) with ESMTP id 324D2FC0204;
 Fri,  7 Oct 2022 10:13:08 +0800 (CST)
X-MAIL-GRAY: 0
X-MAIL-DELIVERY: 1
X-ANTISPAM-LEVEL: 2
X-ABS-CHECKED: 0
Received: from localhost.localdomain (unknown [110.188.55.41])
 by smtp.cecloud.com (postfix) whith ESMTP id
 P51403T281470664831344S1665108786465498_; 
 Fri, 07 Oct 2022 10:13:08 +0800 (CST)
X-IP-DOMAINF: 1
X-UNIQUE-TAG: <35ae28d301d28745bd8b5eb8e179c3f0>
X-RL-SENDER: luzhipeng@cestc.cn
X-SENDER: luzhipeng@cestc.cn
X-LOGIN-NAME: luzhipeng@cestc.cn
X-FST-TO: qemu-devel@nongnu.org
X-RCPT-COUNT: 3
X-SENDER-IP: 110.188.55.41
X-ATTACHMENT-NUM: 0
X-System-Flag: 0
From: luzhipeng <luzhipeng@cestc.cn>
To: qemu-devel <qemu-devel@nongnu.org>
Cc: Gerd Hoffmann <kraxel@redhat.com>,
	lu zhipeng <luzhipeng@cestc.cn>
Subject: [PATCH RESEND] cirrus_vga: fix potential memory overflow
Date: Fri,  7 Oct 2022 10:12:54 +0800
Message-Id: <20221007021254.1295-1-luzhipeng@cestc.cn>
X-Mailer: git-send-email 2.34.0.windows.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 106.39.185.57 (failed)
Received-SPF: pass client-ip=106.39.185.57; envelope-from=luzhipeng@cestc.cn;
 helo=smtp.cecloud.com
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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

From: lu zhipeng <luzhipeng@cestc.cn>

Signed-off-by: lu zhipeng <luzhipeng@cestc.cn>
---
 hw/display/cirrus_vga.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/display/cirrus_vga.c b/hw/display/cirrus_vga.c
index 3bb6a58698..2577005d03 100644
--- a/hw/display/cirrus_vga.c
+++ b/hw/display/cirrus_vga.c
@@ -834,7 +834,7 @@ static void cirrus_bitblt_cputovideo_next(CirrusVGAState * s)
                    word alignment, so we keep them for the next line */
                 /* XXX: keep alignment to speed up transfer */
                 end_ptr = s->cirrus_bltbuf + s->cirrus_blt_srcpitch;
-                copy_count = s->cirrus_srcptr_end - end_ptr;
+                copy_count = MIN(s->cirrus_srcptr_end - end_ptr, CIRRUS_BLTBUFSIZE);
                 memmove(s->cirrus_bltbuf, end_ptr, copy_count);
                 s->cirrus_srcptr = s->cirrus_bltbuf + copy_count;
                 s->cirrus_srcptr_end = s->cirrus_bltbuf + s->cirrus_blt_srcpitch;
-- 
2.31.1




