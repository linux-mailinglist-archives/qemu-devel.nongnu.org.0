Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DCC24E354A
	for <lists+qemu-devel@lfdr.de>; Tue, 22 Mar 2022 01:14:54 +0100 (CET)
Received: from localhost ([::1]:58580 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nWSAm-0003eT-B7
	for lists+qemu-devel@lfdr.de; Mon, 21 Mar 2022 20:14:53 -0400
Received: from eggs.gnu.org ([209.51.188.92]:41678)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dmiller423@gmail.com>)
 id 1nWS1N-0007qr-Oj; Mon, 21 Mar 2022 20:05:12 -0400
Received: from [2607:f8b0:4864:20::830] (port=39566
 helo=mail-qt1-x830.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dmiller423@gmail.com>)
 id 1nWS1I-0007IH-QH; Mon, 21 Mar 2022 20:05:09 -0400
Received: by mail-qt1-x830.google.com with SMTP id bp39so1574948qtb.6;
 Mon, 21 Mar 2022 17:05:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=c/CNNhr3O8bRruapUwC/N07EbHp20m17a7yruJrE0LA=;
 b=PTA/0HSE4MQQoc/tNpSPGOJsvSgvLt5O8Aa2ZlQ6y+6KQRdbrl6DEw22KUMZSOX9SY
 0RJdILfeHBqKBmiKYsvMicsOmb7f6U5O6rO8ZgSH7CrDedhoVYPnWhGQRdt06A0W1RBN
 zDbUqD4uCSl1F1wKQMVj+T6lWwAB5WCogpjxlzBCJ8fU4wun6pxMktSS6lQfQuD01awB
 avhz4wvbpNWcZbx/9ybam7rm8v8gx48rVD6C4/gngK4yChff+mfxvDA7q2GXKBy3pMRB
 Skoe/YsiZfN6EOj5qo9PdpfbOcKpw+iFr5pbvdnKePOAmIyEttDLMPma2X7BaYKxM0cM
 NSpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=c/CNNhr3O8bRruapUwC/N07EbHp20m17a7yruJrE0LA=;
 b=nWiP7c2Bo+X3r/nynkJuQEq5qjm8x3bMRimVZu/L/q/K4y6y5+xpkBwJmn+VXiKYWs
 NVoDDVfJ+x+5zUaeo0nXMtoVSnWjPa8zEHEgUIVReI68aQwfYo/QqU2jZu13xVjdwOvF
 c3RHnmERnKpYMkaosZxRSMsbuNWyk0MQSs+JqcbnpZ8YHFjLawLl0QynRWhqwG9PRDA9
 71TYDkNeA0bpRnF7RjqUY4Q0v7cjjcDhG8CjXRPmc6LM9OoHsDCF/L5XKnr1/ymeXv4I
 +Fz9r3aFB8aSVe1q6CxoAJFFpmwQ+OctspHinu4H/vi8Ssd38rHe+A4xCr5GFP74Th7q
 Qg0Q==
X-Gm-Message-State: AOAM530sPio25dKlCUlU0jxUreYgx+o+11slwXrDgdqKMPIC7ggCbj+M
 x/vw+bF8sfgmQ2ioqgFcZAfhLIx5+bY/gA==
X-Google-Smtp-Source: ABdhPJzZurDmxvvdhBKYjBNsUJOMutE8rFxj0IpovRRvVLPzcq48218eXyTowjCUEdbs9gqVyNiLkw==
X-Received: by 2002:ac8:7d16:0:b0:2e1:e825:ec84 with SMTP id
 g22-20020ac87d16000000b002e1e825ec84mr17893887qtb.433.1647907500185; 
 Mon, 21 Mar 2022 17:05:00 -0700 (PDT)
Received: from localhost.localdomain (mont-dyn-146-104.pwrtc.com.
 [205.174.146.104]) by smtp.gmail.com with ESMTPSA id
 a129-20020a376687000000b0067d186d953bsm8214038qkc.121.2022.03.21.17.04.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 21 Mar 2022 17:04:59 -0700 (PDT)
From: David Miller <dmiller423@gmail.com>
To: qemu-s390x@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH v4 07/11] target/s390x: vxeh2: vector {load,
 store} byte reversed elements
Date: Mon, 21 Mar 2022 20:04:37 -0400
Message-Id: <20220322000441.26495-8-dmiller423@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220322000441.26495-1-dmiller423@gmail.com>
References: <20220322000441.26495-1-dmiller423@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::830
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::830;
 envelope-from=dmiller423@gmail.com; helo=mail-qt1-x830.google.com
X-Spam_score_int: -3
X-Spam_score: -0.4
X-Spam_bar: /
X-Spam_report: (-0.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001, PDS_HP_HELO_NORDNS=0.659,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: thuth@redhat.com, david@redhat.com, cohuck@redhat.com,
 richard.henderson@linaro.org, farman@linux.ibm.com,
 David Miller <dmiller423@gmail.com>, pasic@linux.ibm.com,
 borntraeger@linux.ibm.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: David Miller <dmiller423@gmail.com>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/s390x/tcg/insn-data.def      |   4 +
 target/s390x/tcg/translate_vx.c.inc | 115 ++++++++++++++++++++++++++++
 2 files changed, 119 insertions(+)

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
diff --git a/target/s390x/tcg/translate_vx.c.inc b/target/s390x/tcg/translate_vx.c.inc
index 0bef1200e3..284ee4362c 100644
--- a/target/s390x/tcg/translate_vx.c.inc
+++ b/target/s390x/tcg/translate_vx.c.inc
@@ -457,6 +457,63 @@ static DisasJumpType op_vlrep(DisasContext *s, DisasOps *o)
     return DISAS_NEXT;
 }
 
+static DisasJumpType op_vlbr(DisasContext *s, DisasOps *o)
+{
+    const uint8_t es = get_field(s, m3);
+    TCGv_i64 t0, t1;
+
+    if (es < ES_16 || es > ES_128) {
+        gen_program_exception(s, PGM_SPECIFICATION);
+        return DISAS_NORETURN;
+    }
+
+    t0 = tcg_temp_new_i64();
+    t1 = tcg_temp_new_i64();
+
+
+    if (es == ES_128) {
+        tcg_gen_qemu_ld_i64(t1, o->addr1, get_mem_index(s), MO_LEUQ);
+        gen_addi_and_wrap_i64(s, o->addr1, o->addr1, 8);
+        tcg_gen_qemu_ld_i64(t0, o->addr1, get_mem_index(s), MO_LEUQ);
+        goto write;
+    }
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
+    case ES_128:
+        break;
+    default:
+        g_assert_not_reached();
+    }
+
+write:
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
@@ -998,6 +1055,64 @@ static DisasJumpType op_vst(DisasContext *s, DisasOps *o)
     return DISAS_NEXT;
 }
 
+static DisasJumpType op_vstbr(DisasContext *s, DisasOps *o)
+{
+    const uint8_t es = get_field(s, m3);
+    TCGv_i64 t0, t1;
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
+
+
+    if (es == ES_128) {
+        read_vec_element_i64(t1, get_field(s, v1), 0, ES_64);
+        read_vec_element_i64(t0, get_field(s, v1), 1, ES_64);
+        goto write;
+    }
+
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
+    case MO_128:
+        break;
+    default:
+        g_assert_not_reached();
+    }
+
+write:
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
-- 
2.34.1


