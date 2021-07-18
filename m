Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E108A3CC93B
	for <lists+qemu-devel@lfdr.de>; Sun, 18 Jul 2021 14:59:22 +0200 (CEST)
Received: from localhost ([::1]:54882 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m56OA-0006TJ-0d
	for lists+qemu-devel@lfdr.de; Sun, 18 Jul 2021 08:59:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44616)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1m56Bn-0003lN-H3
 for qemu-devel@nongnu.org; Sun, 18 Jul 2021 08:46:37 -0400
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431]:46919)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1m56Bl-0003XY-9v
 for qemu-devel@nongnu.org; Sun, 18 Jul 2021 08:46:35 -0400
Received: by mail-wr1-x431.google.com with SMTP id d12so18003755wre.13
 for <qemu-devel@nongnu.org>; Sun, 18 Jul 2021 05:46:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=QvY0gKKZL10jBfuPwPcboRpWsIz2uDoO8+xuVhr3OFg=;
 b=MHwydVp12Vd5PIPS4pwg/PGYXGBOZYPh8sJFnUsh7yY+c3rp38j+2fTpuncA+rz4M6
 3MZXairKFVDBexGJrQhzYiW6gNkRntpUY4mJXbn2WnVryPiDF6LCDQbCYr291wU20495
 YqTGQMYzcQJF3Vl91AyQjb9h1BdtWD6sNzGQI2xDfmm5FPyDCaGcGg2cnZdsLoybJoum
 8q5hEU0n84x4FddpIYLCsaYLxk8B4a65txrSCOcZ+Iut3aNCMqHaM+H4X/hrLxA5n65M
 uSKguh8tQVk5oiThojel61PdVXlW/mfg3x12B8paZYFJxkHuQIEYqao2arbJB2ltNdcw
 GgIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=QvY0gKKZL10jBfuPwPcboRpWsIz2uDoO8+xuVhr3OFg=;
 b=tQaOKFdxgTS/hj5bnqNEEpxdLYojt6x1BMbGpovSxbKvCIrkWO8jaRNwJraQfOcaS+
 pibyPKvZ4no/D6AS3oeTqYYbcC8hMmPzaFO3Jkjpy3cASb+7BTcOnsyXwE2VPJovLUbr
 YcO6zgkXsJPW6XwamXBE8uDkT8tH1hxjb2Fl/CT6MtG3YENjGD4goIQ7Z3LPckmAtKJH
 4igzoW3fQkzu6WG7aNZ41EDLYNWitQ7N6cUIyPCBCcmHahM86tia8SjwrkpAX2cLaQUQ
 59dy4x+tOgEG+pvPPZGkmwngufQKPwtXkMBpR6eixZDrIxXsd9iQBJq6dCGtCj/bny9O
 g8Jg==
X-Gm-Message-State: AOAM533KNvnz1pFC0Q8+uw6KXbbamtV0O0hrmjvTyLSf2ja73iE6l1H7
 vEjK7rTBNbV1Jifiitxv4Qct+Zp4MnVxqw==
X-Google-Smtp-Source: ABdhPJxTLk3gWpxTacnsed9qwc2RltEs2pXZcrB1N3fh0ZCQRAEEOXTnYZ/KVrS1RGa6SeFNUb2vew==
X-Received: by 2002:a5d:6dac:: with SMTP id u12mr24124196wrs.153.1626612391981; 
 Sun, 18 Jul 2021 05:46:31 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id l23sm4053391wme.22.2021.07.18.05.46.31
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 18 Jul 2021 05:46:31 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 12/12] target/arm: Remove duplicate 'plus1' function from Neon
 and SVE decode
Date: Sun, 18 Jul 2021 13:46:21 +0100
Message-Id: <20210718124621.13395-13-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210718124621.13395-1-peter.maydell@linaro.org>
References: <20210718124621.13395-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::431;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x431.google.com
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
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Message-id: 20210715095341.701-1-peter.maydell@linaro.org
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


