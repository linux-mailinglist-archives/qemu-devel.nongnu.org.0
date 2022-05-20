Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D83452E817
	for <lists+qemu-devel@lfdr.de>; Fri, 20 May 2022 10:54:19 +0200 (CEST)
Received: from localhost ([::1]:56652 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nryOo-0000jw-8W
	for lists+qemu-devel@lfdr.de; Fri, 20 May 2022 04:54:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50262)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nryEH-0004eJ-TK
 for qemu-devel@nongnu.org; Fri, 20 May 2022 04:43:25 -0400
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331]:54027)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nryEG-0000dq-89
 for qemu-devel@nongnu.org; Fri, 20 May 2022 04:43:25 -0400
Received: by mail-wm1-x331.google.com with SMTP id p189so4158875wmp.3
 for <qemu-devel@nongnu.org>; Fri, 20 May 2022 01:43:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=5feKW7i1IZnmMlhHxIUEq2OpW0lCNJGHr98ysF/4oF4=;
 b=df4b/lGByY3q6Hpmqr2QhPdOWESEgJF7KCSVYkcYuyozaZm8zTrlJdHeqsWs7o5btJ
 0cuS8J2KLUyXOqUI3RCQ+3PP1Vc/84fEQhg3ZrBEkATXyPP/UsuN5FlTCF+Fg77Ote9i
 kakwao9dRyAeKlQyNdXLYQES5cyfqEjfyrRxs12uVVVe5SKeTAcB5JPTNfArK1RwC2Tt
 obwmcTF1yvc1+8jw1c6MtmZkPLXYdEbyQnzaNBmvl9NvRgF7/Pg62y6l8SzLCfo6Me2U
 RmtyJGu8O4hxszsirildcxCWpdWfdocorAyJG3Xd2WrX2RI/BA2jgzN62gJgl7wVl3Aw
 vBRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=5feKW7i1IZnmMlhHxIUEq2OpW0lCNJGHr98ysF/4oF4=;
 b=Ihnv2LOrpOb4+rxwDhLe+cyHGmOZ1E9x5egfB7VAxHnpPej6WWwcRHr666MiGGBF1q
 e/8l7JwzrrnggGx2djGmRr9lCR9l2kcAufiDn6IuJ/FUfog06Ww47bnyIDUDvx6V/Yj1
 HnPcXzzIzSd+QqVBJezyREWH+gJqerwA06taIKk6Kx3sA/XXv1tebZ9IBYp73iYDJZWh
 OFGK66qeNrNkn75eHAfU2+oWKINwp9OV+fRgJd2CrYn9+ngdaL+0SpqX3ZMWj+H5hNav
 Vi5nTTERVuIORI2y1qcLv5rnW6JJjJvDQr2ELwUdunhQAsWuwbYiV6TKlhI2zgnBvao9
 olCQ==
X-Gm-Message-State: AOAM5321qufFzPIj0zfY5p/RvtY73YYrQlOcEd+bZAbbM4epy0Wy0DCD
 CGXidEnX1P0SbcRYe3lv3PKXug==
X-Google-Smtp-Source: ABdhPJzZmBYjtvHP/QfYuPZtJCh3qsWkDKxumZfpcsCyrjmWI0XqfQck6IHYjj0PlQuQWiLKlJRNJQ==
X-Received: by 2002:a05:600c:3c86:b0:397:9a4:fa06 with SMTP id
 bg6-20020a05600c3c8600b0039709a4fa06mr7673636wmb.43.1653036202647; 
 Fri, 20 May 2022 01:43:22 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 l16-20020a1c7910000000b003972dcfb614sm1513139wme.14.2022.05.20.01.43.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 20 May 2022 01:43:22 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Cc: Richard Henderson <richard.henderson@linaro.org>
Subject: [PATCH] docs/system/arm: Add FEAT_HCX to list of emulated features
Date: Fri, 20 May 2022 09:43:20 +0100
Message-Id: <20220520084320.424166-1-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::331;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x331.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

In commit 5814d587fe861fe9 we added support for emulating
FEAT_HCX (Support for the HCRX_EL2 register). However we
forgot to add it to the list in emulated.rst. Correct the
omission.

Fixes: 5814d587fe861fe9 ("target/arm: Enable FEAT_HCX for -cpu max")
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
Oops, missed this during review...

 docs/system/arm/emulation.rst | 1 +
 1 file changed, 1 insertion(+)

diff --git a/docs/system/arm/emulation.rst b/docs/system/arm/emulation.rst
index 3e95bba0d24..49cc3e8340e 100644
--- a/docs/system/arm/emulation.rst
+++ b/docs/system/arm/emulation.rst
@@ -29,6 +29,7 @@ the following architecture extensions:
 - FEAT_FRINTTS (Floating-point to integer instructions)
 - FEAT_FlagM (Flag manipulation instructions v2)
 - FEAT_FlagM2 (Enhancements to flag manipulation instructions)
+- FEAT_HCX (Support for the HCRX_EL2 register)
 - FEAT_HPDS (Hierarchical permission disables)
 - FEAT_I8MM (AArch64 Int8 matrix multiplication instructions)
 - FEAT_IDST (ID space trap handling)
-- 
2.25.1


