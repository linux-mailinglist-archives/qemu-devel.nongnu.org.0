Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 26F6C6AABD1
	for <lists+qemu-devel@lfdr.de>; Sat,  4 Mar 2023 19:20:39 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pYWTX-0006Sp-IH; Sat, 04 Mar 2023 13:19:19 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pYWTQ-0006Ny-0g
 for qemu-devel@nongnu.org; Sat, 04 Mar 2023 13:19:12 -0500
Received: from mail-pg1-x534.google.com ([2607:f8b0:4864:20::534])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pYWTL-0003ML-P9
 for qemu-devel@nongnu.org; Sat, 04 Mar 2023 13:19:10 -0500
Received: by mail-pg1-x534.google.com with SMTP id d10so3280517pgt.12
 for <qemu-devel@nongnu.org>; Sat, 04 Mar 2023 10:19:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1677953946;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=kN7X/63OjI0YxgXw6QQNze3Fb3vk89R3yYS7zsFK+48=;
 b=w12u4z/4LCbFtvkOwPKPCzcvO9oiTYvafcTUuuhpoy41g8caHlLFn2sLCU/Gfte1YI
 3/w6KTYbe2R4dA41h8ph5dszpbGytSeOehb9xjUPtGHaoixHY4fwC7vB91MPs1HFoyNs
 7wX+EpK8fwYpwDz/J/Os6spEinahpfL9zT7NIoF7UterIklhilHxyCF790SV+iO1lcfA
 cyz8qFHIPRvpSwQUxU6JqDl3wU/W3bZLPFfhxrqD43RdDXLcpcrKvEvFEPBKBUl5Wbi3
 IQn5LS6lll9/OhtQsZVufqGumC44Rfdg2dk1cHSabRoE6lVIBBz+DYOx+sl38YNE0Dfe
 W5Ig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1677953946;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=kN7X/63OjI0YxgXw6QQNze3Fb3vk89R3yYS7zsFK+48=;
 b=Wlp5eRiVKkjImx1OlphVioyoueTa2VLN6BX9kMnMHlTByXrjpmdSBerg89Uygv/rpY
 ohxbIifjx1PuEVbUxqzsH2TNsxDVw2i/ep5A/tBuxsaWC8g6WM8TQ2WKurvJkxZ9TFNP
 vPfVwsq0DthRWOOIbvLelm+FeUMceWtOZN8jxODmB4aDVphq3JUpYm3gwFb6Bd4SNZSZ
 oK1GWKgD8YUPqOGAY/Ggf0fVjtK7C5zsSRZLgPTegPtiZ0oYs2NaLNTrqMGLIHilUZ7J
 J6hutJ1MOt7eeU4m5xeKWFF86dOl7hb/ggk/WNpWHsr4nto+aR9drJDUDlPxcrwGZtcO
 ogUA==
X-Gm-Message-State: AO0yUKW1KseHdu59w3uCyfPk2WpU31ReAyu/27mNXlNFR3sZYqMavPV3
 3vXYKDrpYDSqoDO+6AymT/joA9/xgqBfMYh4bwoCQQ==
X-Google-Smtp-Source: AK7set/eNW9qhsNrKlSHC6X53pkJas4428ZSMlqCuYFwj3sL+UvE8eYzExw7/iveomOuaiqF1q4Hbg==
X-Received: by 2002:a62:4ecb:0:b0:593:f191:966 with SMTP id
 c194-20020a624ecb000000b00593f1910966mr5132742pfb.1.1677953946476; 
 Sat, 04 Mar 2023 10:19:06 -0800 (PST)
Received: from stoup.. ([2602:ae:154a:9f01:62b1:64d8:8207:f04e])
 by smtp.gmail.com with ESMTPSA id
 25-20020aa79259000000b005d866d184b5sm3529668pfp.46.2023.03.04.10.19.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 04 Mar 2023 10:19:06 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Aurelien Jarno <aurelien@aurel32.net>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>
Subject: [PATCH v3 05/20] target/mips: Drop tcg_temp_free from mxu_translate.c
Date: Sat,  4 Mar 2023 10:18:45 -0800
Message-Id: <20230304181900.1097116-6-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230304181900.1097116-1-richard.henderson@linaro.org>
References: <20230304181900.1097116-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::534;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x534.google.com
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

Translators are no longer required to free tcg temporaries.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
Cc: Philippe Mathieu-Daudé <philmd@linaro.org>
Cc: Aurelien Jarno <aurelien@aurel32.net>
Cc: Jiaxun Yang <jiaxun.yang@flygoat.com>
Cc: Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>
---
 target/mips/tcg/mxu_translate.c | 51 ---------------------------------
 1 file changed, 51 deletions(-)

diff --git a/target/mips/tcg/mxu_translate.c b/target/mips/tcg/mxu_translate.c
index f52244e1b2..8703b0cef4 100644
--- a/target/mips/tcg/mxu_translate.c
+++ b/target/mips/tcg/mxu_translate.c
@@ -513,8 +513,6 @@ static void gen_mxu_s32i2m(DisasContext *ctx)
     } else if (XRa == 16) {
         gen_store_mxu_cr(t0);
     }
-
-    tcg_temp_free(t0);
 }
 
 /*
@@ -537,8 +535,6 @@ static void gen_mxu_s32m2i(DisasContext *ctx)
     }
 
     gen_store_gpr(t0, Rb);
-
-    tcg_temp_free(t0);
 }
 
 /*
@@ -613,9 +609,6 @@ static void gen_mxu_s8ldd(DisasContext *ctx)
     }
 
     gen_store_mxu_gpr(t0, XRa);
-
-    tcg_temp_free(t0);
-    tcg_temp_free(t1);
 }
 
 /*
@@ -664,11 +657,6 @@ static void gen_mxu_d16mul(DisasContext *ctx)
     }
     gen_store_mxu_gpr(t3, XRa);
     gen_store_mxu_gpr(t2, XRd);
-
-    tcg_temp_free(t0);
-    tcg_temp_free(t1);
-    tcg_temp_free(t2);
-    tcg_temp_free(t3);
 }
 
 /*
@@ -741,11 +729,6 @@ static void gen_mxu_d16mac(DisasContext *ctx)
     }
     gen_store_mxu_gpr(t3, XRa);
     gen_store_mxu_gpr(t2, XRd);
-
-    tcg_temp_free(t0);
-    tcg_temp_free(t1);
-    tcg_temp_free(t2);
-    tcg_temp_free(t3);
 }
 
 /*
@@ -821,15 +804,6 @@ static void gen_mxu_q8mul_q8mulsu(DisasContext *ctx)
 
     gen_store_mxu_gpr(t0, XRd);
     gen_store_mxu_gpr(t1, XRa);
-
-    tcg_temp_free(t0);
-    tcg_temp_free(t1);
-    tcg_temp_free(t2);
-    tcg_temp_free(t3);
-    tcg_temp_free(t4);
-    tcg_temp_free(t5);
-    tcg_temp_free(t6);
-    tcg_temp_free(t7);
 }
 
 /*
@@ -860,9 +834,6 @@ static void gen_mxu_s32ldd_s32lddr(DisasContext *ctx)
     tcg_gen_qemu_ld_tl(t1, t1, ctx->mem_idx, MO_TESL ^ (sel * MO_BSWAP));
 
     gen_store_mxu_gpr(t1, XRa);
-
-    tcg_temp_free(t0);
-    tcg_temp_free(t1);
 }
 
 
@@ -1125,9 +1096,6 @@ static void gen_mxu_D16MAX_D16MIN(DisasContext *ctx)
         tcg_gen_shri_i32(t0, t0, 16);
         /* finally update the destination */
         tcg_gen_or_i32(mxu_gpr[XRa - 1], mxu_gpr[XRa - 1], t0);
-
-        tcg_temp_free(t1);
-        tcg_temp_free(t0);
     } else if (unlikely(XRb == XRc)) {
         /* both operands same -> just set destination to one of them */
         tcg_gen_mov_i32(mxu_gpr[XRa - 1], mxu_gpr[XRb - 1]);
@@ -1161,9 +1129,6 @@ static void gen_mxu_D16MAX_D16MIN(DisasContext *ctx)
         tcg_gen_shri_i32(t0, t0, 16);
         /* finally update the destination */
         tcg_gen_or_i32(mxu_gpr[XRa - 1], mxu_gpr[XRa - 1], t0);
-
-        tcg_temp_free(t1);
-        tcg_temp_free(t0);
     }
 }
 
@@ -1226,9 +1191,6 @@ static void gen_mxu_Q8MAX_Q8MIN(DisasContext *ctx)
             /* finally update the destination */
             tcg_gen_or_i32(mxu_gpr[XRa - 1], mxu_gpr[XRa - 1], t0);
         }
-
-        tcg_temp_free(t1);
-        tcg_temp_free(t0);
     } else if (unlikely(XRb == XRc)) {
         /* both operands same -> just set destination to one of them */
         tcg_gen_mov_i32(mxu_gpr[XRa - 1], mxu_gpr[XRb - 1]);
@@ -1266,9 +1228,6 @@ static void gen_mxu_Q8MAX_Q8MIN(DisasContext *ctx)
             /* finally update the destination */
             tcg_gen_or_i32(mxu_gpr[XRa - 1], mxu_gpr[XRa - 1], t0);
         }
-
-        tcg_temp_free(t1);
-        tcg_temp_free(t0);
     }
 }
 
@@ -1384,9 +1343,6 @@ static void gen_mxu_S32ALNI(DisasContext *ctx)
                 tcg_gen_shri_i32(t1, t1, 24);
 
                 tcg_gen_or_i32(mxu_gpr[XRa - 1], t0, t1);
-
-                tcg_temp_free(t1);
-                tcg_temp_free(t0);
             }
             break;
         case MXU_OPTN3_PTN2:
@@ -1410,9 +1366,6 @@ static void gen_mxu_S32ALNI(DisasContext *ctx)
                 tcg_gen_shri_i32(t1, t1, 16);
 
                 tcg_gen_or_i32(mxu_gpr[XRa - 1], t0, t1);
-
-                tcg_temp_free(t1);
-                tcg_temp_free(t0);
             }
             break;
         case MXU_OPTN3_PTN3:
@@ -1436,9 +1389,6 @@ static void gen_mxu_S32ALNI(DisasContext *ctx)
                 tcg_gen_shri_i32(t1, t1, 8);
 
                 tcg_gen_or_i32(mxu_gpr[XRa - 1], t0, t1);
-
-                tcg_temp_free(t1);
-                tcg_temp_free(t0);
             }
             break;
         case MXU_OPTN3_PTN4:
@@ -1598,7 +1548,6 @@ bool decode_ase_mxu(DisasContext *ctx, uint32_t insn)
         }
 
         gen_set_label(l_exit);
-        tcg_temp_free(t_mxu_cr);
     }
 
     return true;
-- 
2.34.1


