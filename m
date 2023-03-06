Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 010286AB40B
	for <lists+qemu-devel@lfdr.de>; Mon,  6 Mar 2023 01:52:51 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pYyyW-0004ox-MW; Sun, 05 Mar 2023 19:45:12 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pYyxn-0002zy-10
 for qemu-devel@nongnu.org; Sun, 05 Mar 2023 19:44:27 -0500
Received: from mail-pj1-x1032.google.com ([2607:f8b0:4864:20::1032])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pYyxi-0007MG-MK
 for qemu-devel@nongnu.org; Sun, 05 Mar 2023 19:44:25 -0500
Received: by mail-pj1-x1032.google.com with SMTP id
 x20-20020a17090a8a9400b00233ba727724so9711265pjn.1
 for <qemu-devel@nongnu.org>; Sun, 05 Mar 2023 16:44:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1678063459;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=sGckcAd8KrkWUx1ApDFxDLHhhOLWQ/0K4f2UW/fGtYI=;
 b=o3DQvBKz4ut2Hdx63/d48retH+AL/a3mQkvTzFeHgPhGZ/HFw4AXMskVPhPRAZAkQ0
 6uPNtjRd/5zu2apF4AsLwsf7OMxco+KqpR3chL4Qxs2ek2Q5/oOeG1O9ay2FXIpq+2KR
 cNQCeieWt0brBK2SIBDQ5UzmaRdHPK38wYxWdcusZjJsS/UStT3lNf4Z1iydrgPIKeUd
 ZKsa7uLHlzYyYa7x6DkQnJAG+2ztsEyRECnVVQEGNUOZcMhwfoymBPLEVc2bEMb7hYBZ
 fGLfikFob62omf+Sud8cWXdXdDlJM4T4bN0SlT2AaNA03bgctaF3wJCVJXv/l4bvINN8
 hFMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678063459;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=sGckcAd8KrkWUx1ApDFxDLHhhOLWQ/0K4f2UW/fGtYI=;
 b=xPRVSLlVZaCivTo9F/vLKQSCyV8b/EGj7juUtm61VXewwdWDKvnXFn79OL4vQmGgZ0
 bKFIlLKcIacMdEVuOCIRa8u697f1BQ4+UFhBoQhAJu5Dy4cnxQxYmhHsnItKrNkCcKvI
 sTHKgAfe8GUF/GXu+VSaPcFz6y036+I5NPS41tX/7Ux+9XWsMNOfv//yM1EtBNAMTGkn
 At96Mo6nBvu10aR2OxgVNtsI0Tt765v/BvQQL12CKMf0Z5Qv11QYnFdx6xiu2kVLI1Kt
 PTnaY8m8QdbizXzcjd0VjJEVXd7tJP3+kvuzweqAgB4QJqUrCBj5MCfBoDYfPM8E7IMQ
 5Lng==
X-Gm-Message-State: AO0yUKVBlvsl/Zk4p8M/kKHEC4+i51ONxT74qFGaIeCt412hsJgCFj5K
 b8nsj4gmtMOHVzNgtQp8+af9NHVqUfeUs42Mk/g5yA==
X-Google-Smtp-Source: AK7set+1mEUTQwkbs3Q7n7ZmsQiCR1XwkX7qclX/cYttjekGOhLjmlLxpv8onhokcFxYA+vkMnYSdQ==
X-Received: by 2002:a05:6a20:3954:b0:cb:af96:ace7 with SMTP id
 r20-20020a056a20395400b000cbaf96ace7mr11535880pzg.46.1678063459308; 
 Sun, 05 Mar 2023 16:44:19 -0800 (PST)
Received: from stoup.. ([2602:ae:154a:9f01:87cc:49bb:2900:c08b])
 by smtp.gmail.com with ESMTPSA id
 x52-20020a056a000bf400b005895f9657ebsm5045726pfu.70.2023.03.05.16.44.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 05 Mar 2023 16:44:18 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org,
	Taylor Simpson <tsimpson@quicinc.com>
Subject: [PULL 71/84] target/hexagon/idef-parser: Use gen_tmp for
 gen_pred_assign
Date: Sun,  5 Mar 2023 16:39:41 -0800
Message-Id: <20230306003954.1866998-72-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230306003954.1866998-1-richard.henderson@linaro.org>
References: <20230306003954.1866998-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1032;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1032.google.com
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

The allocation is immediately followed by tcg_gen_mov_i32,
so the initial assignment of zero is discarded.

Reviewed-by: Taylor Simpson <tsimpson@quicinc.com>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/hexagon/idef-parser/parser-helpers.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/target/hexagon/idef-parser/parser-helpers.c b/target/hexagon/idef-parser/parser-helpers.c
index be979dac86..760e499149 100644
--- a/target/hexagon/idef-parser/parser-helpers.c
+++ b/target/hexagon/idef-parser/parser-helpers.c
@@ -1743,7 +1743,7 @@ void gen_pred_assign(Context *c, YYLTYPE *locp, HexValue *left_pred,
              "Predicate assign not allowed in ternary!");
     /* Extract predicate TCGv */
     if (is_direct) {
-        *left_pred = gen_tmp_value(c, locp, "0", 32, UNSIGNED);
+        *left_pred = gen_tmp(c, locp, 32, UNSIGNED);
     }
     /* Extract first 8 bits, and store new predicate value */
     OUT(c, locp, "tcg_gen_mov_i32(", left_pred, ", ", &r, ");\n");
-- 
2.34.1


