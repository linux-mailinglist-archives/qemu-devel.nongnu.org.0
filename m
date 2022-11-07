Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BFBFF620462
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Nov 2022 01:00:49 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1osC1l-0005d2-EP; Mon, 07 Nov 2022 18:59:41 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1osC1g-0005Wk-JY
 for qemu-devel@nongnu.org; Mon, 07 Nov 2022 18:59:36 -0500
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1osC1e-0003ry-T8
 for qemu-devel@nongnu.org; Mon, 07 Nov 2022 18:59:36 -0500
Received: by mail-wr1-x42e.google.com with SMTP id y16so18466817wrt.12
 for <qemu-devel@nongnu.org>; Mon, 07 Nov 2022 15:59:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=huU0VtkMiJEhV5c3xPWAeqKcLpg8EFCkMWMz+PzPUtI=;
 b=gNlKTYHdGBUZGFMZ6eQY1b9PHiBxIkQurnAquU5vC/BYROMNxRKniKEK8feo/aoR1G
 3v/sjVoMD4PxHvdqJWFso1PElunRvSaGs9BmS/uOyV5dR5c+NJLzcQhAXDFwL590yp4q
 BHsRG0zkwaandXCVt+YekrCmFmQx1o4niBBCE2fHvOsSmodmWFZGFeReBmwgYfqNrYzu
 rieQ8wB19/jYEOiN1Bunsqzkh7cjCZgAebpXEqSkQyqs3DCQXosp39elGPksGm16qycB
 RBsxN4b+D4elvwzvH6yRPMBNpMycBySmmYIPy/9SzrW2/ZylO0JXQdJc4/aVk4cdoGWP
 OT0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=huU0VtkMiJEhV5c3xPWAeqKcLpg8EFCkMWMz+PzPUtI=;
 b=uVvVZ8blW+BXPdgthosoDbBSghIYEIxFSeOpreQoz888F0AHP3J/WE1Nuy12HxCjSG
 lXCus0M0Gf4i878njbV1gOayi/yiTe/yud0Ych/o5S6yizT6KasfD0AImCDpFLn8zNYW
 Pj63tQT/mkdAKESSfiiCSDAzPybIZUvcE7arumgO9QED2g8KNWrz1Z7UZjWguPWcifTg
 c2hBYdME7/Z0Ax8me2reWcrTm5fiSRLOZbnOT98KIjv3y75OK0qxuqEIk2lZBuegVlTq
 b/CCy3x7atHz4SC483UkaLik+3I1o6LU/qeo3qJbOUZkQdzvzKtN8QRFxoTxqoNCUhkD
 N16w==
X-Gm-Message-State: ACrzQf22kpUN2f+bURF4Il0MEkcxqpCdCigf1Ka7Q21tE/7hZITq3PXA
 FKmRfBV8zeTJ4bfqOA5wPAFhrWaNB4aeaA==
X-Google-Smtp-Source: AMsMyM5ZySQ+VrGxY+5Qg1NBjKFim0u9O0MGdasAXrhw1XWmLpBIJTwfySz7Z+C3s30xmtGvKzN/XQ==
X-Received: by 2002:adf:de8e:0:b0:236:ea40:47ef with SMTP id
 w14-20020adfde8e000000b00236ea4047efmr22781708wrl.519.1667865573356; 
 Mon, 07 Nov 2022 15:59:33 -0800 (PST)
Received: from localhost.localdomain ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 u8-20020a05600c19c800b003c6f8d30e40sm13859437wmq.31.2022.11.07.15.59.32
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Mon, 07 Nov 2022 15:59:33 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Aurelien Jarno <aurelien@aurel32.net>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>,
 Vince Del Vecchio <Vince.DelVecchio@mediatek.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Thomas Huth <thuth@redhat.com>
Subject: [PULL 14/14] MAINTAINERS: Inherit from nanoMIPS
Date: Tue,  8 Nov 2022 00:58:22 +0100
Message-Id: <20221107235822.71458-15-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221107235822.71458-1-philmd@linaro.org>
References: <20221107235822.71458-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42e;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x42e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

6 months ago Stefan Pejic stepped in as nanoMIPS maintainer
(see commit a 8e0e23445a "target/mips: Undeprecate nanoMIPS
ISA support in QEMU"), however today his email is bouncing:

  ** Message blocked **

  Your message to stefan.pejic@syrmia.com has been blocked. See technical details below for more information.

  The response from the remote server was:
  550 5.4.1 Recipient address rejected: Access denied. AS(201806281) [DBAEUR03FT030.eop-EUR03.prod.protection.outlook.com]

To avoid unmaintained code, I feel forced to merge this code
back with the generic MIPS section.

Historical references:
- https://lore.kernel.org/qemu-devel/TY0PR03MB679726901BD6C6BE40114A2FE2A79@TY0PR03MB6797.apcprd03.prod.outlook.com/
- https://lore.kernel.org/qemu-devel/b858a20e97b74e7b90a94948314d0008@MTKMBS62N2.mediatek.inc/

Cc: Vince Del Vecchio <Vince.DelVecchio@mediatek.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <49f41916-687f-b9e5-2de7-9c658fe0d4c7@linaro.org>
Tested-by: Thomas Huth <thuth@redhat.com>
Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Message-Id: <20221101114458.25756-6-philmd@linaro.org>
---
 MAINTAINERS | 8 +-------
 1 file changed, 1 insertion(+), 7 deletions(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index 4adf8c65db..86bcd07a31 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -237,16 +237,10 @@ R: Jiaxun Yang <jiaxun.yang@flygoat.com>
 R: Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>
 S: Odd Fixes
 F: target/mips/
-F: disas/mips.c
+F: disas/*mips.c
 F: docs/system/cpu-models-mips.rst.inc
 F: tests/tcg/mips/
 
-MIPS TCG CPUs (nanoMIPS ISA)
-M: Stefan Pejic <stefan.pejic@syrmia.com>
-S: Maintained
-F: disas/nanomips.*
-F: target/mips/tcg/*nanomips*
-
 NiosII TCG CPUs
 M: Chris Wulff <crwulff@gmail.com>
 M: Marek Vasut <marex@denx.de>
-- 
2.38.1


