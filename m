Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E3D542B4B63
	for <lists+qemu-devel@lfdr.de>; Mon, 16 Nov 2020 17:39:01 +0100 (CET)
Received: from localhost ([::1]:43618 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kehWu-0005dt-LZ
	for lists+qemu-devel@lfdr.de; Mon, 16 Nov 2020 11:39:00 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:58396)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1keh3k-0000Kw-Us
 for qemu-devel@nongnu.org; Mon, 16 Nov 2020 11:08:52 -0500
Received: from mail-wr1-x442.google.com ([2a00:1450:4864:20::442]:46213)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1keh3i-0007uh-W3
 for qemu-devel@nongnu.org; Mon, 16 Nov 2020 11:08:52 -0500
Received: by mail-wr1-x442.google.com with SMTP id d12so19230731wrr.13
 for <qemu-devel@nongnu.org>; Mon, 16 Nov 2020 08:08:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=dp5OeL6zHEFo/uQpmEKWaIqQytKKS/VgbFkbBy3hcaw=;
 b=IdU4QEqqmWyARGX4JKZYUnL0BsVET5qYtXhvbuzAbSFX7R5I0lGyweXso7QJq3AeuM
 nt42dP3t77zQqIUDMulTXZO/3feEtrMercIRFmhHu3WgaYXYa2Zlx9v8n/uE6DczH1gS
 hqmZVMcRZQh4dFHNHDKBW0RD6D2FlWBnnFp3DDkncw8uUnLzzSZ06PJXR3twAb9bs0Mg
 m93f9pM+/0zVX13Jk/2/dgUmF7OPq7Dtt7kpS0gON6Cbo0hKBwDVtYBQ1rpQYQIPswUt
 62JVGMTM0WZNXZscJSwGSQ4DBFR+lWx5IWFoS5w8H9b8rXyaO+fseviJuoB6brYIrlJv
 kEHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=dp5OeL6zHEFo/uQpmEKWaIqQytKKS/VgbFkbBy3hcaw=;
 b=j9WO1P7E1VLajUn2lLl9ZWIuwnu61hnPrXHl21Chv/ch9xUMi8WsarDUdQMWnj+Nzf
 8/5PDi0UhTUz3CxmoA1XUWyZWHXORvBLBHuP1BkY6GirHFkpgQ10Ymrb5Ixlypuu6ygK
 R4trVRICyGvuuEOio++8t5TBE1h22QtF3GEo/9pYfOeMFoydH2PkXO/9JsxcC4JJxNAc
 kQ/N/81L9Qy8QHUNiUpb9ICQNmj4vt1dqi9fke62DdVc/L35hL5CgSwVx+jR1WddERRa
 Yes8U97YLcQWorxsOlmtol9HucyMbVNhTLfc7grvQnar5nxznEsDKRT5iecl4Aq8sxD+
 vEvw==
X-Gm-Message-State: AOAM5332HBBPUY/hZv9ZMtMFZOhsLEFW6a4R7mq8M7OdUFCBs0Z8n5tX
 8MCZxVX4nGvL0uHKpou/NUkaDg==
X-Google-Smtp-Source: ABdhPJxPgu5YtJ4RXlZOloCjuaI+uAxeKxmN49fMDapf+VP/ets5rjS9cXPdKvD0xfXxQKrHilCrTw==
X-Received: by 2002:a5d:46c6:: with SMTP id g6mr21212627wrs.170.1605542929780; 
 Mon, 16 Nov 2020 08:08:49 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id g20sm20116975wmh.20.2020.11.16.08.08.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 16 Nov 2020 08:08:49 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH 13/15] target/arm: Implement FPCXT_S fp system register
Date: Mon, 16 Nov 2020 16:08:29 +0000
Message-Id: <20201116160831.31000-14-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20201116160831.31000-1-peter.maydell@linaro.org>
References: <20201116160831.31000-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::442;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x442.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
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
---
 target/arm/translate-vfp.c.inc | 58 ++++++++++++++++++++++++++++++++++
 1 file changed, 58 insertions(+)

diff --git a/target/arm/translate-vfp.c.inc b/target/arm/translate-vfp.c.inc
index 6bc07992eb4..c7ae306f12f 100644
--- a/target/arm/translate-vfp.c.inc
+++ b/target/arm/translate-vfp.c.inc
@@ -662,6 +662,14 @@ static fp_sysreg_check_result fp_sysreg_checks(DisasContext *s, int regno)
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
         return fp_sysreg_check_failed;
     }
@@ -712,6 +720,26 @@ static bool gen_M_fp_sysreg_write(DisasContext *s, int regno,
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
@@ -755,6 +783,36 @@ static bool gen_M_fp_sysreg_read(DisasContext *s, int regno,
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


