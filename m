Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A24102D5A77
	for <lists+qemu-devel@lfdr.de>; Thu, 10 Dec 2020 13:25:47 +0100 (CET)
Received: from localhost ([::1]:41458 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1knL10-0006jl-Ld
	for lists+qemu-devel@lfdr.de; Thu, 10 Dec 2020 07:25:46 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:51450)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1knKR6-0001bI-14
 for qemu-devel@nongnu.org; Thu, 10 Dec 2020 06:48:40 -0500
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f]:37177)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1knKQu-000782-DH
 for qemu-devel@nongnu.org; Thu, 10 Dec 2020 06:48:39 -0500
Received: by mail-wr1-x42f.google.com with SMTP id i9so5163798wrc.4
 for <qemu-devel@nongnu.org>; Thu, 10 Dec 2020 03:48:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=a8vaLctK4xh8/h9+I+zTsDJHrnJBsf4D9mh0G81TSRM=;
 b=kk24dxQbeCzEw0F3Ypof3T2WNXQDc3yk7IcNqUcuSQ3GpqoCTv6xD3MRpon5zIMGS0
 TMStgxP9HaULmGodeh9cDaRXuVyYyQ4ENodyX4E83IMPLotc27akbyV/1SMMdiI7SCio
 N/IZ6KQxnVH4O2cBFeC+lQGbmRD/Cw4+jTpGHtfPQdsuOsZXNmGkIJ3BIbkJqHNRAc+a
 re5+WfmmCW0bm8ydjzK/Z3STp05tHsuMHYu6sYy5Caxmq17WR02LmxXvKTRLAKH0w6ze
 8CFqnQx3Gwt+uN678cwal7HP2pVwSZIVzhXGhRMFfJczK4NCa1bwamR7FxaF/H3AjCc0
 pdRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=a8vaLctK4xh8/h9+I+zTsDJHrnJBsf4D9mh0G81TSRM=;
 b=dAAEcS4Nj+q7ZLq7dXu/cQSt15n7t0gKHUdRpKm0fP4gSNAFzu3X+HzZ+Yoltbwi2K
 vyDOdtYcpQ4UXiI/uXCBPivzIXllRmhE6dZfH3InFNUksLjQ12j6Ik5eMxrK+NhrAy1P
 3btEQEoQoUvFWs1rSG92zgq4YEtukiZYT6pIcvw/xSBF09zVJmjRTEuEwmGVwGL9XbdD
 fSA717YBVBphbZ5J+7u5BDYwoTp9FNvcQbY2cNN2TayOmmea062f8jdfIjcq2ijVEF+L
 GF6i9bqzB8L5Dn5OrDyTpBNZYIZUwbQKnNsVRVUlDp5JPgdebibKvEhuKocpoiSZnvMF
 Ntjw==
X-Gm-Message-State: AOAM5319ERrDkWs/g57CE8teOgggEsEg6FKLTNXnDIteQ5nmuKoTY+M3
 ZJCv0beEO9YoaPenHmxtJhvUm8yqRuSwHg==
X-Google-Smtp-Source: ABdhPJxnmROWTYMpuwy/aF9Y16cLHDkgG9xEK0cdVIj0PkftbUHQOPzWOvv/TicHElrV9+tLwPHbpg==
X-Received: by 2002:adf:b194:: with SMTP id q20mr7880994wra.199.1607600906359; 
 Thu, 10 Dec 2020 03:48:26 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id g192sm9304725wme.48.2020.12.10.03.48.25
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 10 Dec 2020 03:48:25 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 24/36] target/arm: Implement FPCXT_S fp system register
Date: Thu, 10 Dec 2020 11:47:44 +0000
Message-Id: <20201210114756.16501-25-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20201210114756.16501-1-peter.maydell@linaro.org>
References: <20201210114756.16501-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42f;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x42f.google.com
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

Implement the new-in-v8.1M FPCXT_S floating point system register.
This is for saving and restoring the secure floating point context,
and it reads and writes bits [27:0] from the FPSCR and the
CONTROL.SFPA bit in bit [31].

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-id: 20201119215617.29887-14-peter.maydell@linaro.org
---
 target/arm/translate-vfp.c.inc | 58 ++++++++++++++++++++++++++++++++++
 1 file changed, 58 insertions(+)

diff --git a/target/arm/translate-vfp.c.inc b/target/arm/translate-vfp.c.inc
index bb1c41413e7..808b4077054 100644
--- a/target/arm/translate-vfp.c.inc
+++ b/target/arm/translate-vfp.c.inc
@@ -662,6 +662,14 @@ static FPSysRegCheckResult fp_sysreg_checks(DisasContext *s, int regno)
             return false;
         }
         break;
+    case ARM_VFP_FPCXT_S:
+        if (!arm_dc_feature(s, ARM_FEATURE_V8_1M)) {
+            return false;
+        }
+        if (!s->v8m_secure) {
+            return false;
+        }
+        break;
     default:
         return FPSysRegCheckFailed;
     }
@@ -713,6 +721,26 @@ static bool gen_M_fp_sysreg_write(DisasContext *s, int regno,
         tcg_temp_free_i32(tmp);
         break;
     }
+    case ARM_VFP_FPCXT_S:
+    {
+        TCGv_i32 sfpa, control, fpscr;
+        /* Set FPSCR[27:0] and CONTROL.SFPA from value */
+        tmp = loadfn(s, opaque);
+        sfpa = tcg_temp_new_i32();
+        tcg_gen_shri_i32(sfpa, tmp, 31);
+        control = load_cpu_field(v7m.control[M_REG_S]);
+        tcg_gen_deposit_i32(control, control, sfpa,
+                            R_V7M_CONTROL_SFPA_SHIFT, 1);
+        store_cpu_field(control, v7m.control[M_REG_S]);
+        fpscr = load_cpu_field(vfp.xregs[ARM_VFP_FPSCR]);
+        tcg_gen_andi_i32(fpscr, fpscr, FPCR_NZCV_MASK);
+        tcg_gen_andi_i32(tmp, tmp, ~FPCR_NZCV_MASK);
+        tcg_gen_or_i32(fpscr, fpscr, tmp);
+        store_cpu_field(fpscr, vfp.xregs[ARM_VFP_FPSCR]);
+        tcg_temp_free_i32(tmp);
+        tcg_temp_free_i32(sfpa);
+        break;
+    }
     default:
         g_assert_not_reached();
     }
@@ -756,6 +784,36 @@ static bool gen_M_fp_sysreg_read(DisasContext *s, int regno,
         tcg_gen_andi_i32(tmp, tmp, FPCR_NZCV_MASK);
         storefn(s, opaque, tmp);
         break;
+    case ARM_VFP_FPCXT_S:
+    {
+        TCGv_i32 control, sfpa, fpscr;
+        /* Bits [27:0] from FPSCR, bit [31] from CONTROL.SFPA */
+        tmp = tcg_temp_new_i32();
+        sfpa = tcg_temp_new_i32();
+        gen_helper_vfp_get_fpscr(tmp, cpu_env);
+        tcg_gen_andi_i32(tmp, tmp, ~FPCR_NZCV_MASK);
+        control = load_cpu_field(v7m.control[M_REG_S]);
+        tcg_gen_andi_i32(sfpa, control, R_V7M_CONTROL_SFPA_MASK);
+        tcg_gen_shli_i32(sfpa, sfpa, 31 - R_V7M_CONTROL_SFPA_SHIFT);
+        tcg_gen_or_i32(tmp, tmp, sfpa);
+        tcg_temp_free_i32(sfpa);
+        /*
+         * Store result before updating FPSCR etc, in case
+         * it is a memory write which causes an exception.
+         */
+        storefn(s, opaque, tmp);
+        /*
+         * Now we must reset FPSCR from FPDSCR_NS, and clear
+         * CONTROL.SFPA; so we'll end the TB here.
+         */
+        tcg_gen_andi_i32(control, control, ~R_V7M_CONTROL_SFPA_MASK);
+        store_cpu_field(control, v7m.control[M_REG_S]);
+        fpscr = load_cpu_field(v7m.fpdscr[M_REG_NS]);
+        gen_helper_vfp_set_fpscr(cpu_env, fpscr);
+        tcg_temp_free_i32(fpscr);
+        gen_lookup_tb(s);
+        break;
+    }
     default:
         g_assert_not_reached();
     }
-- 
2.20.1


