Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F33955B379
	for <lists+qemu-devel@lfdr.de>; Sun, 26 Jun 2022 20:22:46 +0200 (CEST)
Received: from localhost ([::1]:52686 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o5WuD-0001Tu-8h
	for lists+qemu-devel@lfdr.de; Sun, 26 Jun 2022 14:22:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40638)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1o5WSE-0005hW-2k
 for qemu-devel@nongnu.org; Sun, 26 Jun 2022 13:53:50 -0400
Received: from mail.ilande.co.uk ([2001:41c9:1:41f::167]:45312)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1o5WSC-0000xc-Kg
 for qemu-devel@nongnu.org; Sun, 26 Jun 2022 13:53:49 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=ilande.co.uk; s=20220518; h=Subject:Content-Transfer-Encoding:MIME-Version:
 References:In-Reply-To:Message-Id:Date:To:From:Sender:Reply-To:Cc:
 Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=DdfsgBk5Hv35aSUZHdyDtgQuMj2it9QBOMnBaPOa99g=; b=hvbzfHimgZFDaMikV1823xxWuw
 WxBwQ4GJ+JRRvAW8HfaKRMHCJFdpMgNMc+n6SY5C3Bk0q+ys+3GOggUt4hpa0nyRWsSLoRrdCMRnD
 ss27St2U/URs4BCBBSOQZLWZ/vkorOa5QZwjFoB84a2lcJMQIR2WkJNNk78bUVuhquw7O/qZNeT59
 ttoG7KkLTPrU2kGO02Wa2LIOV86F5j1kcqzkfQiHkw/N5y1S/WA0RQG7zGSMQK93gwSNzPlhuZMns
 kD2mQkBceZMVksv0L2SF9mn0rNYGWfoY0tsXrtLZdL4LBpF89lh506TRuSwYBSwD1p2M4u1MuNk2s
 QWOgal/iI4ztox4axuP1AUsi0a3VdOIgWbC80oihleiHcdO/RAlI6B/jb8VReNS9GdNbPATIMcX52
 F0TKO/vOZKFLcu2hAvhBkc05vEG9YbAHsPj3b7Bg2kquNdTv4E1MfyV1knvklpR8RIU80O/cB5Bo9
 wikdnuySKQQRH6ZsLDAEOqfRyj3ZYwR85wfvHnWzkcEA6u+lJQg6JCUeJGW34w78NFogSRs5Fx0Go
 SmJDCFFGcyV+xjeEcQbEyOKFDO4STcBd/Y2Nss1Bi79rQ488EVHf073sL6KPNLAl2PHuuwc4W0Dxf
 utsp0tsB27eajR32EUu2UkYeGuSjbV3Xvem8+JYDA=;
Received: from [2a00:23c4:8ba4:e500:b82f:56f9:46d7:80ab] (helo=kentang.home)
 by mail.ilande.co.uk with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.92) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1o5WMT-0007KY-Kl; Sun, 26 Jun 2022 18:47:57 +0100
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
To: richard.henderson@linaro.org,
	qemu-devel@nongnu.org
Date: Sun, 26 Jun 2022 18:45:31 +0100
Message-Id: <20220626174531.969187-56-mark.cave-ayland@ilande.co.uk>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220626174531.969187-1-mark.cave-ayland@ilande.co.uk>
References: <20220626174531.969187-1-mark.cave-ayland@ilande.co.uk>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a00:23c4:8ba4:e500:b82f:56f9:46d7:80ab
X-SA-Exim-Mail-From: mark.cave-ayland@ilande.co.uk
Subject: [PULL 55/55] artist: set memory region owners for buffers to the
 artist device
X-SA-Exim-Version: 4.2.1 (built Wed, 08 May 2019 21:11:16 +0000)
X-SA-Exim-Scanned: Yes (on mail.ilande.co.uk)
Received-SPF: pass client-ip=2001:41c9:1:41f::167;
 envelope-from=mark.cave-ayland@ilande.co.uk; helo=mail.ilande.co.uk
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

This fixes the output of "info qom-tree" so that the buffers appear as children
of the artist device, rather than underneath the "unattached" container.

Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Message-Id: <20220624160839.886649-1-mark.cave-ayland@ilande.co.uk>
Reviewed-by: Helge Deller <deller@gmx.de>
---
 hw/display/artist.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/display/artist.c b/hw/display/artist.c
index eadaef0d46..fde050c882 100644
--- a/hw/display/artist.c
+++ b/hw/display/artist.c
@@ -1358,7 +1358,7 @@ static void artist_create_buffer(ARTISTState *s, const char *name,
 {
     struct vram_buffer *buf = s->vram_buffer + idx;
 
-    memory_region_init_ram(&buf->mr, NULL, name, width * height,
+    memory_region_init_ram(&buf->mr, OBJECT(s), name, width * height,
                            &error_fatal);
     memory_region_add_subregion_overlap(&s->mem_as_root, *offset, &buf->mr, 0);
 
-- 
2.30.2


