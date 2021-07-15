Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D3D13C9C38
	for <lists+qemu-devel@lfdr.de>; Thu, 15 Jul 2021 11:54:48 +0200 (CEST)
Received: from localhost ([::1]:50034 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m3y4t-000506-3n
	for lists+qemu-devel@lfdr.de; Thu, 15 Jul 2021 05:54:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33176)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1m3y3v-0003zS-Vt
 for qemu-devel@nongnu.org; Thu, 15 Jul 2021 05:53:47 -0400
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331]:42554)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1m3y3t-0004n3-7d
 for qemu-devel@nongnu.org; Thu, 15 Jul 2021 05:53:47 -0400
Received: by mail-wm1-x331.google.com with SMTP id
 a23-20020a05600c2257b0290236ec98bebaso768935wmm.1
 for <qemu-devel@nongnu.org>; Thu, 15 Jul 2021 02:53:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=wFJf/yglS6TdA51aTCmXDBY4DJy7bf3bOZXxC/X4XSA=;
 b=Xi7jdqnfiGroyI4BSGwtYHdcOoG2gw82po7hnnsoTdT+YBACSZ7mBH4Z3QV0Yngx2i
 0pRoqqFiQGHsoBarG/HbddhfEw6h8+R7JIsMtpi6++vEQGGWP3kBQrtqjLtydvVjDdxz
 dVFY6xteFk09UmfyV8RfMIyaPj8TvyQzwfPCqcQxNNm7LVKNvMiTKMV8AmeYhspR+UKG
 bn2jaZ1b4+QNbW6hXAeLEdehNjYpbogcd5oKdB8VblR4e4k/V/DvHbyMkiFpeBuaI312
 IH9V2349/g8T+B6ZMlZ1sXbGfiLJ46ic2/ahEBGjiMVarDsVZ2CbNg9zZCn/GN0i2W0x
 VPXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=wFJf/yglS6TdA51aTCmXDBY4DJy7bf3bOZXxC/X4XSA=;
 b=bqwu3pOB+4qduItoqCeWGEPm1D62ZncRNar9EQXQQe023Vhp42kYhXXSHKJg6nll9c
 XW4gMxNxyMbGJMmj0rmU8aXn0IHLCitajMj3Y7pEoEUeOC22V2CHxri1fYbYgWWe/udr
 0u1KGeotjFEyo+4/1j2Vlz2MaTizTcOHW3Vh49F2mj2ofRwnG+tZdVzmuAvU5/5jbytB
 rUnySwl61y88qxTb+vEEftlBDzqVo9Ngkm0zTXxtDGmlHVRhWMPXEg01ZU86ht4mr7jN
 ry8/PziYa1dk5O+fuHon6rDAfwyhsN6PD1uyke+/53Rqlo8T99AG5tu6P0FsbPDPVWOV
 vShQ==
X-Gm-Message-State: AOAM532s+8xc/SWP4Swz14fJRI0riGwyukMKXKsDCvWduuSkbx8NGlOh
 9ni4hJQS05v7llkXlOn4c2QMYmWDipdXrlyQ
X-Google-Smtp-Source: ABdhPJzxrd4lem4/ouZzbhie8fxu9c6fF1mBOMbMhk0iCQgya52WGrrIu3nJrRw0j3ndfJbHNOkh8g==
X-Received: by 2002:a1c:9807:: with SMTP id a7mr3505859wme.129.1626342823412; 
 Thu, 15 Jul 2021 02:53:43 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id b20sm5106241wmj.7.2021.07.15.02.53.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 15 Jul 2021 02:53:43 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH] target/arm: Remove duplicate 'plus1' function from Neon and
 SVE decode
Date: Thu, 15 Jul 2021 10:53:41 +0100
Message-Id: <20210715095341.701-1-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::331;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x331.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The Neon and SVE decoders use private 'plus1' functions to implement
"add one" for the !function decoder syntax.  We have a generic
"plus_1" function in translate.h, so use that instead.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/neon-ls.decode     | 4 ++--
 target/arm/neon-shared.decode | 2 +-
 target/arm/sve.decode         | 2 +-
 target/arm/translate-neon.c   | 5 -----
 target/arm/translate-sve.c    | 5 -----
 5 files changed, 4 insertions(+), 14 deletions(-)

diff --git a/target/arm/neon-ls.decode b/target/arm/neon-ls.decode
index 0a2a0e15db5..c5f364cbc00 100644
--- a/target/arm/neon-ls.decode
+++ b/target/arm/neon-ls.decode
@@ -41,8 +41,8 @@ VLD_all_lanes  1111 0100 1 . 1 0 rn:4 .... 11 n:2 size:2 t:1 a:1 rm:4 \
                vd=%vd_dp
 
 # Neon load/store single structure to one lane
-%imm1_5_p1 5:1 !function=plus1
-%imm1_6_p1 6:1 !function=plus1
+%imm1_5_p1 5:1 !function=plus_1
+%imm1_6_p1 6:1 !function=plus_1
 
 VLDST_single   1111 0100 1 . l:1 0 rn:4 .... 00 n:2 reg_idx:3 align:1 rm:4 \
                vd=%vd_dp size=0 stride=1
diff --git a/target/arm/neon-shared.decode b/target/arm/neon-shared.decode
index df80e6ebf66..8e6bd0b61f0 100644
--- a/target/arm/neon-shared.decode
+++ b/target/arm/neon-shared.decode
@@ -38,7 +38,7 @@
 # which is 0 for fp16 and 1 for fp32 into a MO_* constant.
 # (Note that this is the reverse of the sense of the 1-bit size
 # field in the 3same_fp Neon insns.)
-%vcadd_size    20:1 !function=plus1
+%vcadd_size    20:1 !function=plus_1
 
 VCMLA          1111 110 rot:2 . 1 . .... .... 1000 . q:1 . 0 .... \
                vm=%vm_dp vn=%vn_dp vd=%vd_dp size=%vcadd_size
diff --git a/target/arm/sve.decode b/target/arm/sve.decode
index a62c169f1a8..c60b9f0fec5 100644
--- a/target/arm/sve.decode
+++ b/target/arm/sve.decode
@@ -22,7 +22,7 @@
 ###########################################################################
 # Named fields.  These are primarily for disjoint fields.
 
-%imm4_16_p1     16:4 !function=plus1
+%imm4_16_p1     16:4 !function=plus_1
 %imm6_22_5      22:1 5:5
 %imm7_22_16     22:2 16:5
 %imm8_16_10     16:5 10:3
diff --git a/target/arm/translate-neon.c b/target/arm/translate-neon.c
index a45616cb631..c53ab20fa48 100644
--- a/target/arm/translate-neon.c
+++ b/target/arm/translate-neon.c
@@ -28,11 +28,6 @@
 #include "translate.h"
 #include "translate-a32.h"
 
-static inline int plus1(DisasContext *s, int x)
-{
-    return x + 1;
-}
-
 static inline int neon_3same_fp_size(DisasContext *s, int x)
 {
     /* Convert 0==fp32, 1==fp16 into a MO_* value */
diff --git a/target/arm/translate-sve.c b/target/arm/translate-sve.c
index 35d838aa068..bc91a641711 100644
--- a/target/arm/translate-sve.c
+++ b/target/arm/translate-sve.c
@@ -70,11 +70,6 @@ static int tszimm_shl(DisasContext *s, int x)
     return x - (8 << tszimm_esz(s, x));
 }
 
-static inline int plus1(DisasContext *s, int x)
-{
-    return x + 1;
-}
-
 /* The SH bit is in bit 8.  Extract the low 8 and shift.  */
 static inline int expand_imm_sh8s(DisasContext *s, int x)
 {
-- 
2.20.1


