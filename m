Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E48E5681F6
	for <lists+qemu-devel@lfdr.de>; Wed,  6 Jul 2022 10:45:44 +0200 (CEST)
Received: from localhost ([::1]:43508 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o90fG-0003xM-MO
	for lists+qemu-devel@lfdr.de; Wed, 06 Jul 2022 04:45:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48852)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o90Ky-0005qT-Iz
 for qemu-devel@nongnu.org; Wed, 06 Jul 2022 04:24:45 -0400
Received: from mail-pj1-x1029.google.com ([2607:f8b0:4864:20::1029]:43640)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o90Kv-0000NL-0B
 for qemu-devel@nongnu.org; Wed, 06 Jul 2022 04:24:42 -0400
Received: by mail-pj1-x1029.google.com with SMTP id
 o5-20020a17090a3d4500b001ef76490983so10557931pjf.2
 for <qemu-devel@nongnu.org>; Wed, 06 Jul 2022 01:24:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=5diXjDkZ8lDduwnyqU3jDTWthnVlvOOyK5gnN0aC3a8=;
 b=jHXmjjrAnDXE13PnVBQ4Ifm1qsZZM0yNxU+6tt2spDd2XIJE3Cq3W8LZtNyL4iPcSh
 mA7zq03/uNLU3lQDz8IdmwPmcu89Rvp5gYI+hxOo9yYDBI1arLtbrZMnUuI02xsF1TQa
 XOHnbBrcFW4yFlZ4Fps4BJxk8mdnkGwXW6Djjo6aPvpXOQyX0RPfcqyyMLudXHY9DING
 E7QZxCaA48e0OPJRlqKJWvj3v1FDFpJNzI5mpakrYOigiW4/ldzSZ/FK9W2Sewn3atGN
 YKj9oz9Atqtj7I7sUL/tFwg3yq3QACbjC4ABPMrltJ1F6ajWQU0mPuafTEd7jmFwg6M6
 El3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=5diXjDkZ8lDduwnyqU3jDTWthnVlvOOyK5gnN0aC3a8=;
 b=n6W5lmonrYBuec26P9A3uKUFXFSqWyAroNoHlNpxxU/AGaoY66N84xT9QCU3/EemN6
 DH5WqHzdZpqwBR5EfumHTfDW+NQjSaCHrH4A/JbNkfXTA5pWMh06yKP5Gg8qTUlknSPy
 ZCmK7ty9UCi6Wbf4Wa9FxCpufdBGgDV2rwaGs36Mqqiuz7hQNrfpk2VBGtAqQn8X59+G
 24OyhKADXkwFik1WT+gL8MPp0Gu6mmwWkEePiGO3GGcMPVcO85gfS6HK4iU4sfUZnZei
 /J0n1ZOqBJCS4DK+un9f/11o0JKGiUDvXTVC3MVPBFAH37E9gGzg6YN+WwalCUaWHk8p
 iClg==
X-Gm-Message-State: AJIora/1b1uHzJAzED3USE8ugahUJ3bTD+IcOPkpodpaNEbxtHwVPpQy
 /97oG2XVd21+GGji4MNaLOhy4GNbIx3m3rE4
X-Google-Smtp-Source: AGRyM1vUlSv7DG/j2NMJUP6ebiV8LQmsJsNRokhZb8vJSneZM2WXc2t5MisiFiAysVNk2EQs8AwZvg==
X-Received: by 2002:a17:90b:3b85:b0:1ec:d979:ca42 with SMTP id
 pc5-20020a17090b3b8500b001ecd979ca42mr48372072pjb.209.1657095879693; 
 Wed, 06 Jul 2022 01:24:39 -0700 (PDT)
Received: from stoup.. ([122.255.60.245]) by smtp.gmail.com with ESMTPSA id
 t17-20020a170902e85100b00162529828aesm25199256plg.109.2022.07.06.01.24.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 06 Jul 2022 01:24:39 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>
Subject: [PATCH v5 09/45] target/arm: Mark SMMLA, UMMLA,
 USMMLA as non-streaming
Date: Wed,  6 Jul 2022 13:53:35 +0530
Message-Id: <20220706082411.1664825-10-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220706082411.1664825-1-richard.henderson@linaro.org>
References: <20220706082411.1664825-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1029;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1029.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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

Mark these as a non-streaming instructions, which should trap
if full a64 support is not enabled in streaming mode.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/sme-fa64.decode |  1 -
 target/arm/translate-sve.c | 12 ++++++------
 2 files changed, 6 insertions(+), 7 deletions(-)

diff --git a/target/arm/sme-fa64.decode b/target/arm/sme-fa64.decode
index b5eaa2d0fa..3260ea2d64 100644
--- a/target/arm/sme-fa64.decode
+++ b/target/arm/sme-fa64.decode
@@ -59,7 +59,6 @@ FAIL    0001 1110 0111 1110 0000 00-- ---- ----   # FJCVTZS
 #       --11 1100 --1- ---- ---- ---- ---- --10   # Load/store FP register (register offset)
 #       --11 1101 ---- ---- ---- ---- ---- ----   # Load/store FP register (scaled imm)
 
-FAIL    0100 0101 --0- ---- 1001 10-- ---- ----   # SMMLA, UMMLA, USMMLA
 FAIL    0100 0101 --1- ---- 1--- ---- ---- ----   # SVE2 string/histo/crypto instructions
 FAIL    1000 010- -00- ---- 10-- ---- ---- ----   # SVE2 32-bit gather NT load (vector+scalar)
 FAIL    1000 010- -00- ---- 111- ---- ---- ----   # SVE 32-bit gather prefetch (vector+imm)
diff --git a/target/arm/translate-sve.c b/target/arm/translate-sve.c
index d5aad53923..9bbf44f008 100644
--- a/target/arm/translate-sve.c
+++ b/target/arm/translate-sve.c
@@ -7302,12 +7302,12 @@ TRANS_FEAT(FMLALT_zzxw, aa64_sve2, do_FMLAL_zzxw, a, false, true)
 TRANS_FEAT(FMLSLB_zzxw, aa64_sve2, do_FMLAL_zzxw, a, true, false)
 TRANS_FEAT(FMLSLT_zzxw, aa64_sve2, do_FMLAL_zzxw, a, true, true)
 
-TRANS_FEAT(SMMLA, aa64_sve_i8mm, gen_gvec_ool_arg_zzzz,
-           gen_helper_gvec_smmla_b, a, 0)
-TRANS_FEAT(USMMLA, aa64_sve_i8mm, gen_gvec_ool_arg_zzzz,
-           gen_helper_gvec_usmmla_b, a, 0)
-TRANS_FEAT(UMMLA, aa64_sve_i8mm, gen_gvec_ool_arg_zzzz,
-           gen_helper_gvec_ummla_b, a, 0)
+TRANS_FEAT_NONSTREAMING(SMMLA, aa64_sve_i8mm, gen_gvec_ool_arg_zzzz,
+                        gen_helper_gvec_smmla_b, a, 0)
+TRANS_FEAT_NONSTREAMING(USMMLA, aa64_sve_i8mm, gen_gvec_ool_arg_zzzz,
+                        gen_helper_gvec_usmmla_b, a, 0)
+TRANS_FEAT_NONSTREAMING(UMMLA, aa64_sve_i8mm, gen_gvec_ool_arg_zzzz,
+                        gen_helper_gvec_ummla_b, a, 0)
 
 TRANS_FEAT(BFDOT_zzzz, aa64_sve_bf16, gen_gvec_ool_arg_zzzz,
            gen_helper_gvec_bfdot, a, 0)
-- 
2.34.1


