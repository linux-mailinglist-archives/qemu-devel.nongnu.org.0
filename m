Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 51BF2560179
	for <lists+qemu-devel@lfdr.de>; Wed, 29 Jun 2022 15:37:47 +0200 (CEST)
Received: from localhost ([::1]:58600 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o6Xt3-0001tP-51
	for lists+qemu-devel@lfdr.de; Wed, 29 Jun 2022 09:37:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33142)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1o6X1O-00015c-6O; Wed, 29 Jun 2022 08:42:18 -0400
Received: from mail.ilande.co.uk ([2001:41c9:1:41f::167]:51348)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1o6X1M-0004nK-Mx; Wed, 29 Jun 2022 08:42:17 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=ilande.co.uk; s=20220518; h=Subject:Content-Transfer-Encoding:MIME-Version:
 References:In-Reply-To:Message-Id:Date:To:From:Sender:Reply-To:Cc:
 Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=FktKrWeYblH+m2tmJ/Ud3sYKQg5y1+6oYN1pBqNHqPw=; b=Sqab7QIPrdIVLqHadRB9H5VmyB
 ApA1faKWYWcPDmBs08BHeg8gwSifYGJZGXhoQTVXiGZbTNoTpe7wu9c/rXfDOAyzXXz14pjaKNZXe
 xm5QrS5CkaZ0ofzxvRoyf/JRRQvrYIB1URmy1slxBmVERkQEOCmXDPl1lSeC9Vga+VXfcSLThSeRj
 OPa1Tfgw3yQNDc19/K4wbCWEis5vfzkV9gwi2pjhul+WEr+dzD0kcmx+fVd/Pe/zjPvvZzScRNdT6
 QmLb4/5WvexmZ+FUpZJ7QKhDJB8so73S4gjoD83Lfb1x2E89CBcZ9Rtg0Z+gH6JXroO/Ns2lPnjMI
 DWDd+/FUBOTAx2MY9KNDOgsJKawgmFb5XjIslYEMURdNENfxP56TCR650MiJj2Yrg1SDMhmj1HLOk
 mTHo47pG81w/I0LZL/6EQEYBCg9oLHMhzuKzIyXJuoru+vs6PwRGcRLQrudkujSJfbYX7AMioLHHX
 cnYldjDG+1PavNkwXzGj6iN5KfU/NpqlsJR+sOEihL541y8pjHTdfvnJU7edSUF3NHZxoZP5P9nqT
 K+7n9SFMrDOQE6woOC71UhOp8tUIfL+VdL8XyTAglwaeSwaC/6ScsYdcEa4XyroxsPxvu4wHnAMtb
 MtYvcdlnAzEZklxAWP946Y6yy6X0Okc0cZJVTBxr0=;
Received: from [2a00:23c4:8ba4:e500:b82f:56f9:46d7:80ab] (helo=kentang.home)
 by mail.ilande.co.uk with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.92) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1o6Wzi-0002tZ-1U; Wed, 29 Jun 2022 13:40:38 +0100
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
To: richard.henderson@linaro.org, deller@gmx.de, svens@stackframe.org,
 mst@redhat.com, pbonzini@redhat.com, peter.maydell@linaro.org,
 hpoussin@reactos.org, aleksandar.rikalo@syrmia.com, f4bug@amsat.org,
 qemu-devel@nongnu.org, qemu-arm@nongnu.org
Date: Wed, 29 Jun 2022 13:40:17 +0100
Message-Id: <20220629124026.1077021-32-mark.cave-ayland@ilande.co.uk>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220629124026.1077021-1-mark.cave-ayland@ilande.co.uk>
References: <20220629124026.1077021-1-mark.cave-ayland@ilande.co.uk>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a00:23c4:8ba4:e500:b82f:56f9:46d7:80ab
X-SA-Exim-Mail-From: mark.cave-ayland@ilande.co.uk
Subject: [PATCH 31/40] lasips2: switch register memory region to
 DEVICE_BIG_ENDIAN
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

The LASI device (and so also the LASIPS2 device) are only used for the HPPA
B160L machine which is a big endian architecture.

Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
---
 hw/input/lasips2.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/input/lasips2.c b/hw/input/lasips2.c
index 09d909c843..7bf6077b58 100644
--- a/hw/input/lasips2.c
+++ b/hw/input/lasips2.c
@@ -245,7 +245,7 @@ static const MemoryRegionOps lasips2_reg_ops = {
         .min_access_size = 1,
         .max_access_size = 4,
     },
-    .endianness = DEVICE_NATIVE_ENDIAN,
+    .endianness = DEVICE_BIG_ENDIAN,
 };
 
 static void lasips2_realize(DeviceState *dev, Error **errp)
-- 
2.30.2


