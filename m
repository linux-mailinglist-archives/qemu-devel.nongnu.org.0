Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A311E6A2824
	for <lists+qemu-devel@lfdr.de>; Sat, 25 Feb 2023 10:16:50 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pVqeC-0005AY-HM; Sat, 25 Feb 2023 04:15:16 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pVqe9-00056q-VB
 for qemu-devel@nongnu.org; Sat, 25 Feb 2023 04:15:13 -0500
Received: from mail-pl1-x62e.google.com ([2607:f8b0:4864:20::62e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pVqe6-0001Zu-FX
 for qemu-devel@nongnu.org; Sat, 25 Feb 2023 04:15:13 -0500
Received: by mail-pl1-x62e.google.com with SMTP id n6so493728plf.5
 for <qemu-devel@nongnu.org>; Sat, 25 Feb 2023 01:15:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=TdAJOX1FcZjtnyq2ALvPntQgs+t2YDMFFecOsF1aMGk=;
 b=O4jCvlHR2r1wDVtn7QyjIb2xOlr3J2SytMzTx+Sf/Ekxg6j9b+Kv/tg4QSxvSV1HVH
 ciIVeuco2Vo4vSXg7Y8dklcFibQroxafbP0iAokjBOULufO7l4QL+ARJP1PTU2eZ0zPY
 8Qe9xihpqztIFfNveJMePm9Ere7o+TYMHsjGxyzwM/tGwuVizfGKnlLOg7ABCZhggxGz
 Ey5IS2IVyGWasPx/6gf789fVD/6FQJt5XRMgTqzNYZVqOuJsB8U46Ssa0heY6k0V8b0G
 yKmb+tXdMtl6lZnbV+o5xnY8ajkQZi7Q8GVIjCZEBOLsH+84MHIQREGauI8h+zsplaPu
 pVrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=TdAJOX1FcZjtnyq2ALvPntQgs+t2YDMFFecOsF1aMGk=;
 b=4XvYSFW9VX20P11LQZavfUwiqVzTpkvOwWiw+G5kDBycujQjKjO5Tk2Qq6i+GLaAZY
 DklCXpp8AUetcn3DtHHj4DC3HtcsB3blA3/SR+QYrGDtLxmKg9J8mYMRF1Yt7a5JY8ie
 3tDB695M5R5zXmdzBJpYPoFhaC0P7S1pbxN/zPm0yiSHZY9yVYxzLJuIoWHeIkteoSch
 nZ3DLV3MittKbagpaPakqdMszk3Cr4lF1YvWr4OHXkoof1VJCFo5i+226Ikd+f2+MHXd
 MK+w/FQTLMg3Ua//xHk3riORU/5qxPO6ZaoBRCXLlDh8MT95Ar1Dvd2TtnkU8o9P5cOF
 qi4A==
X-Gm-Message-State: AO0yUKWKfRH2CbQMt+pN4zDlHMlodlm+M+/oXgcxYNhb/WZjdAws906e
 zPhbkzxXIePDj+Mc33En2qBYAOVs19Xl90OsR6I=
X-Google-Smtp-Source: AK7set+bFC80dpiI6km/s7BhS/Q4lnHpyAWZ/qzLVUoTo+xFNy9updf3uDCOUlfD7syYNQkzHTzLSg==
X-Received: by 2002:a17:902:f683:b0:19a:7604:f265 with SMTP id
 l3-20020a170902f68300b0019a7604f265mr23307909plg.39.1677316509121; 
 Sat, 25 Feb 2023 01:15:09 -0800 (PST)
Received: from stoup.. (rrcs-173-198-77-218.west.biz.rr.com. [173.198.77.218])
 by smtp.gmail.com with ESMTPSA id
 je12-20020a170903264c00b0019607aeda8bsm831101plb.73.2023.02.25.01.15.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 25 Feb 2023 01:15:08 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-ppc@nongnu.org, qemu-riscv@nongnu.org,
 qemu-s390x@nongnu.org, jcmvbkbc@gmail.com, kbastian@mail.uni-paderborn.de,
 ysato@users.sourceforge.jp, gaosong@loongson.cn, jiaxun.yang@flygoat.com,
 tsimpson@quicinc.com, ale@rev.ng, mrolnik@gmail.com,
 edgar.iglesias@gmail.com
Subject: [PATCH 14/76] target/arm: Drop tcg_temp_free from translator-sme.c
Date: Fri, 24 Feb 2023 23:13:25 -1000
Message-Id: <20230225091427.1817156-15-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230225091427.1817156-1-richard.henderson@linaro.org>
References: <20230225091427.1817156-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62e;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
 target/arm/translate-sme.c | 28 ----------------------------
 1 file changed, 28 deletions(-)

diff --git a/target/arm/translate-sme.c b/target/arm/translate-sme.c
index 7b87a9df63..e3adba314e 100644
--- a/target/arm/translate-sme.c
+++ b/target/arm/translate-sme.c
@@ -97,7 +97,6 @@ static TCGv_ptr get_tile_rowcol(DisasContext *s, int esz, int rs,
     /* Add the byte offset to env to produce the final pointer. */
     addr = tcg_temp_new_ptr();
     tcg_gen_ext_i32_ptr(addr, tmp);
-    tcg_temp_free_i32(tmp);
     tcg_gen_add_ptr(addr, addr, cpu_env);
 
     return addr;
@@ -166,11 +165,6 @@ static bool trans_MOVA(DisasContext *s, arg_MOVA *a)
             h_fns[a->esz](t_za, t_zr, t_za, t_pg, t_desc);
         }
     }
-
-    tcg_temp_free_ptr(t_za);
-    tcg_temp_free_ptr(t_zr);
-    tcg_temp_free_ptr(t_pg);
-
     return true;
 }
 
@@ -237,10 +231,6 @@ static bool trans_LDST1(DisasContext *s, arg_LDST1 *a)
 
     fns[a->esz][be][a->v][mte][a->st](cpu_env, t_za, t_pg, addr,
                                       tcg_constant_i32(desc));
-
-    tcg_temp_free_ptr(t_za);
-    tcg_temp_free_ptr(t_pg);
-    tcg_temp_free_i64(addr);
     return true;
 }
 
@@ -260,8 +250,6 @@ static bool do_ldst_r(DisasContext *s, arg_ldstr *a, GenLdStR *fn)
     base = get_tile_rowcol(s, MO_8, a->rv, imm, false);
 
     fn(s, base, 0, svl, a->rn, imm * svl);
-
-    tcg_temp_free_ptr(base);
     return true;
 }
 
@@ -286,11 +274,6 @@ static bool do_adda(DisasContext *s, arg_adda *a, MemOp esz,
     pm = pred_full_reg_ptr(s, a->pm);
 
     fn(za, zn, pn, pm, tcg_constant_i32(desc));
-
-    tcg_temp_free_ptr(za);
-    tcg_temp_free_ptr(zn);
-    tcg_temp_free_ptr(pn);
-    tcg_temp_free_ptr(pm);
     return true;
 }
 
@@ -318,11 +301,6 @@ static bool do_outprod(DisasContext *s, arg_op *a, MemOp esz,
     pm = pred_full_reg_ptr(s, a->pm);
 
     fn(za, zn, zm, pn, pm, tcg_constant_i32(desc));
-
-    tcg_temp_free_ptr(za);
-    tcg_temp_free_ptr(zn);
-    tcg_temp_free_ptr(pn);
-    tcg_temp_free_ptr(pm);
     return true;
 }
 
@@ -346,12 +324,6 @@ static bool do_outprod_fpst(DisasContext *s, arg_op *a, MemOp esz,
     fpst = fpstatus_ptr(FPST_FPCR);
 
     fn(za, zn, zm, pn, pm, fpst, tcg_constant_i32(desc));
-
-    tcg_temp_free_ptr(za);
-    tcg_temp_free_ptr(zn);
-    tcg_temp_free_ptr(pn);
-    tcg_temp_free_ptr(pm);
-    tcg_temp_free_ptr(fpst);
     return true;
 }
 
-- 
2.34.1


