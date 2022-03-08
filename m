Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B3E34D0DE9
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Mar 2022 03:16:42 +0100 (CET)
Received: from localhost ([::1]:33434 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nRPOz-0008M7-NC
	for lists+qemu-devel@lfdr.de; Mon, 07 Mar 2022 21:16:41 -0500
Received: from eggs.gnu.org ([209.51.188.92]:54700)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nRP3G-0006YP-P0
 for qemu-devel@nongnu.org; Mon, 07 Mar 2022 20:54:14 -0500
Received: from [2607:f8b0:4864:20::1032] (port=51034
 helo=mail-pj1-x1032.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nRP3E-0007wX-Vn
 for qemu-devel@nongnu.org; Mon, 07 Mar 2022 20:54:14 -0500
Received: by mail-pj1-x1032.google.com with SMTP id m22so15800916pja.0
 for <qemu-devel@nongnu.org>; Mon, 07 Mar 2022 17:54:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=owkMefn9Rs0Trnlpmao1AdHxZNK3Dx+GWwlPm0/xHZM=;
 b=XRhLAyAB0YQXZzO90nmdtmDLStL/XBvqdADso/i/ohP+PNbY2rmNLoFpZsIyvLQz04
 rS8UYfbg4CWyYFXlz23cNwp3na5sp/odh8pw0Mz09avALnZOqOxfXDhx7rsuz9r93SxH
 mvgHRCFReq68UF9awLq+h/ZEe9zTKPtRG5qY8VceOPUghAvS68wpqmR2EgIz8KG8MXFU
 alBYq7sic66YO9RMh+0pCm6KU9VZy7laGF3e+rDdHg13umx6GAOEEfENVTSDpCSk2Ho2
 +5a6c8X5vygCQQo80GHRb8g/+Jd+aC189btDsFSpDcbfYFdxGAj2wCfVkpSyrGnsIGuU
 eAqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=owkMefn9Rs0Trnlpmao1AdHxZNK3Dx+GWwlPm0/xHZM=;
 b=YQEkA5OlzSu9XBLnrJ8XT30ylTV9HxinrOcqx/YL7uNCauxZJik7G/d9GTyUDngSCj
 R1Wb9/VzCtUXn8IrdubnpV+aTzOMNIV+EaYLZ4rZJyhvWdMnYC57AJgfn+WWp44ZHan2
 qH1NlYOfsysfUEEe3L/TASJP2WrPLZd86ghwM3MCFI0da/UP1hWoRscezaSCtxh7d3Ga
 UvvtzwjGmgKYQPqx0wDuBkwmUDX8yd6td8pA/wTvgsB24GKtN7fSZr7cU0lUSEK8CA4e
 eNn1CGx+m015+co6fpCCbfRIdVGvyA1cvMMSoFOqQmN/huhLOXPBGVLbZTT/uuW6qLRW
 TDvw==
X-Gm-Message-State: AOAM531RDHX2M0cUO9qdb8fXbTjuOMFqwZZCDe/z7dWfaPWD5/LSYdY8
 eKCfbOIV6ClNaUz60bCKptm6vWgKwsg7Yg==
X-Google-Smtp-Source: ABdhPJwYl2OPEsUB0c9Y4LbT02Ra6QhbvzfYUQjstdAURD9TgCSj1+sqJBhcsOJZMT/OXsKUWx8qIw==
X-Received: by 2002:a17:902:be0d:b0:151:6b8b:b3a5 with SMTP id
 r13-20020a170902be0d00b001516b8bb3a5mr15917478pls.27.1646704451419; 
 Mon, 07 Mar 2022 17:54:11 -0800 (PST)
Received: from localhost.localdomain (cpe-50-113-46-110.hawaii.res.rr.com.
 [50.113.46.110]) by smtp.gmail.com with ESMTPSA id
 bh3-20020a056a02020300b00378b62df320sm12775221pgb.73.2022.03.07.17.54.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 07 Mar 2022 17:54:11 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 07/11] target/s390x: vxeh2: vector {load,
 store} byte reversed elements
Date: Mon,  7 Mar 2022 15:53:54 -1000
Message-Id: <20220308015358.188499-8-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220308015358.188499-1-richard.henderson@linaro.org>
References: <20220308015358.188499-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::1032
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::1032;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1032.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: qemu-s390x@nongnu.org, Richard Henderson <richard.henderson@linar.org>,
 dmiller423@gmail.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: David Miller <dmiller423@gmail.com>

Signed-off-by: David Miller <dmiller423@gmail.com>
Message-Id: <20220307020327.3003-6-dmiller423@gmail.com>
[rth: Split out elements (plural) from element (scalar)
      Use tcg little-endian memory ops, plus hswap and wswap.]
Signed-off-by: Richard Henderson <richard.henderson@linar.org>
---
 target/s390x/tcg/translate_vx.c.inc | 101 ++++++++++++++++++++++++++++
 target/s390x/tcg/insn-data.def      |   4 ++
 2 files changed, 105 insertions(+)

diff --git a/target/s390x/tcg/translate_vx.c.inc b/target/s390x/tcg/translate_vx.c.inc
index ac807122a3..9a82401d71 100644
--- a/target/s390x/tcg/translate_vx.c.inc
+++ b/target/s390x/tcg/translate_vx.c.inc
@@ -457,6 +457,56 @@ static DisasJumpType op_vlrep(DisasContext *s, DisasOps *o)
     return DISAS_NEXT;
 }
 
+static DisasJumpType op_vlbr(DisasContext *s, DisasOps *o)
+{
+    const uint8_t es = get_field(s, m3);
+    TCGv_i64 t0, t1, tt;
+
+    if (es < ES_16 || es > ES_128) {
+        gen_program_exception(s, PGM_SPECIFICATION);
+        return DISAS_NORETURN;
+    }
+
+    t0 = tcg_temp_new_i64();
+    t1 = tcg_temp_new_i64();
+
+    /* Begin with byte reversed doublewords... */
+    tcg_gen_qemu_ld_i64(t0, o->addr1, get_mem_index(s), MO_LEUQ);
+    gen_addi_and_wrap_i64(s, o->addr1, o->addr1, 8);
+    tcg_gen_qemu_ld_i64(t1, o->addr1, get_mem_index(s), MO_LEUQ);
+
+    /*
+     * For 16 and 32-bit elements, the doubleword bswap also reversed
+     * the order of the elements.  Perform a larger order swap to put
+     * them back into place.  For the 128-bit "element", finish the
+     * bswap by swapping the doublewords.
+     */
+    switch (es) {
+    case ES_16:
+        tcg_gen_hswap_i64(t0, t0);
+        tcg_gen_hswap_i64(t1, t1);
+        break;
+    case ES_32:
+        tcg_gen_wswap_i64(t0, t0);
+        tcg_gen_wswap_i64(t1, t1);
+        break;
+    case ES_64:
+        break;
+    case ES_128:
+        tt = t0, t0 = t1, t1 = tt;
+        break;
+    default:
+        g_assert_not_reached();
+    }
+
+    write_vec_element_i64(t0, get_field(s, v1), 0, ES_64);
+    write_vec_element_i64(t1, get_field(s, v1), 1, ES_64);
+
+    tcg_temp_free(t0);
+    tcg_temp_free(t1);
+    return DISAS_NEXT;
+}
+
 static DisasJumpType op_vle(DisasContext *s, DisasOps *o)
 {
     const uint8_t es = s->insn->data;
@@ -998,6 +1048,57 @@ static DisasJumpType op_vst(DisasContext *s, DisasOps *o)
     return DISAS_NEXT;
 }
 
+static DisasJumpType op_vstbr(DisasContext *s, DisasOps *o)
+{
+    const uint8_t es = get_field(s, m3);
+    TCGv_i64 t0, t1, tt;
+
+    if (es < ES_16 || es > ES_128) {
+        gen_program_exception(s, PGM_SPECIFICATION);
+        return DISAS_NORETURN;
+    }
+
+    /* Probe write access before actually modifying memory */
+    gen_helper_probe_write_access(cpu_env, o->addr1, tcg_constant_i64(16));
+
+    t0 = tcg_temp_new_i64();
+    t1 = tcg_temp_new_i64();
+    read_vec_element_i64(t0, get_field(s, v1), 0, ES_64);
+    read_vec_element_i64(t1, get_field(s, v1), 1, ES_64);
+
+    /*
+     * For 16 and 32-bit elements, the doubleword bswap below will
+     * reverse the order of the elements.  Perform a larger order
+     * swap to put them back into place.  For the 128-bit "element",
+     * finish the bswap by swapping the doublewords.
+     */
+    switch (es) {
+    case MO_16:
+        tcg_gen_hswap_i64(t0, t0);
+        tcg_gen_hswap_i64(t1, t1);
+        break;
+    case MO_32:
+        tcg_gen_wswap_i64(t0, t0);
+        tcg_gen_wswap_i64(t1, t1);
+        break;
+    case MO_64:
+        break;
+    case MO_128:
+        tt = t0, t0 = t1, t1 = tt;
+        break;
+    default:
+        g_assert_not_reached();
+    }
+
+    tcg_gen_qemu_st_i64(t0, o->addr1, get_mem_index(s), MO_LEUQ);
+    gen_addi_and_wrap_i64(s, o->addr1, o->addr1, 8);
+    tcg_gen_qemu_st_i64(t1, o->addr1, get_mem_index(s), MO_LEUQ);
+
+    tcg_temp_free(t0);
+    tcg_temp_free(t1);
+    return DISAS_NEXT;
+}
+
 static DisasJumpType op_vste(DisasContext *s, DisasOps *o)
 {
     const uint8_t es = s->insn->data;
diff --git a/target/s390x/tcg/insn-data.def b/target/s390x/tcg/insn-data.def
index b524541a7d..ee6e1dc9e5 100644
--- a/target/s390x/tcg/insn-data.def
+++ b/target/s390x/tcg/insn-data.def
@@ -1027,6 +1027,8 @@
     F(0xe756, VLR,     VRR_a, V,   0, 0, 0, 0, vlr, 0, IF_VEC)
 /* VECTOR LOAD AND REPLICATE */
     F(0xe705, VLREP,   VRX,   V,   la2, 0, 0, 0, vlrep, 0, IF_VEC)
+/* VECTOR LOAD BYTE REVERSED ELEMENTS */
+    F(0xe606, VLBR,    VRX,   VE2, la2, 0, 0, 0, vlbr, 0, IF_VEC)
 /* VECTOR LOAD ELEMENT */
     E(0xe700, VLEB,    VRX,   V,   la2, 0, 0, 0, vle, 0, ES_8, IF_VEC)
     E(0xe701, VLEH,    VRX,   V,   la2, 0, 0, 0, vle, 0, ES_16, IF_VEC)
@@ -1079,6 +1081,8 @@
     F(0xe75f, VSEG,    VRR_a, V,   0, 0, 0, 0, vseg, 0, IF_VEC)
 /* VECTOR STORE */
     F(0xe70e, VST,     VRX,   V,   la2, 0, 0, 0, vst, 0, IF_VEC)
+/* VECTOR STORE BYTE REVERSED ELEMENTS */
+    F(0xe60e, VSTBR,    VRX,   VE2, la2, 0, 0, 0, vstbr, 0, IF_VEC)
 /* VECTOR STORE ELEMENT */
     E(0xe708, VSTEB,   VRX,   V,   la2, 0, 0, 0, vste, 0, ES_8, IF_VEC)
     E(0xe709, VSTEH,   VRX,   V,   la2, 0, 0, 0, vste, 0, ES_16, IF_VEC)
-- 
2.25.1


