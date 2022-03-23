Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DF3BF4E540C
	for <lists+qemu-devel@lfdr.de>; Wed, 23 Mar 2022 15:10:46 +0100 (CET)
Received: from localhost ([::1]:48010 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nX1hG-0003hs-0D
	for lists+qemu-devel@lfdr.de; Wed, 23 Mar 2022 10:10:46 -0400
Received: from eggs.gnu.org ([209.51.188.92]:54676)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dmiller423@gmail.com>)
 id 1nX1Uk-0007SM-6e; Wed, 23 Mar 2022 09:57:50 -0400
Received: from [2607:f8b0:4864:20::f35] (port=38622
 helo=mail-qv1-xf35.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dmiller423@gmail.com>)
 id 1nX1Uh-0000wb-PU; Wed, 23 Mar 2022 09:57:49 -0400
Received: by mail-qv1-xf35.google.com with SMTP id jo24so1241205qvb.5;
 Wed, 23 Mar 2022 06:57:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=pegrEZ8A/7bIC/lICpFu1YdJJdXlK0vV+Slctwq2uUk=;
 b=pezIfAsJzXSS2saUuNPGWpl4jSxXyEZL/ACwb2YQtkoE804i5A6nR9b5r/c2zRObkv
 QJcKQVCFmwD6mMGeuwUH0ViOh8VgzBLDzVgjUuBBgDLQonNn8eroK7W2H2IA50IPfGAA
 avg0r4HtfRKWFG+iT+F02ofcAA5X05dChBc2ChudFkoRjLbGR7yuYt4+h+2n+ADKzqFb
 sn5aVqKZthJrBAJfedNqngOp4u3CNcLUYFbHcm61yFfxaSzlLONCmmjkAB1hO4eBY/CX
 D/5rAo55L9F0Ucfh8nrkDaVCyzxmy4CfRgmmINjlhSKw2SPDY17NrVq3KUUazRbmAo5m
 FZ8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=pegrEZ8A/7bIC/lICpFu1YdJJdXlK0vV+Slctwq2uUk=;
 b=EP6H5jdvjOzGmg+dh05KJ8rIKoxhn/QGEJtQncltfGWOR8KOEjTX0qfOz0F79io/PJ
 lnA9UwpQzR1bwIc8bjlEcExu8ioOCSL5yUrrmFlO4Q6+OOwvS6qGU1jBXoGuzV1uXhxn
 JJkGvENRBRjLO9AHQJYeP3z3s3sKaJbUdJOZQh8esA5zvfbSsoNzcNER3Qy1LV8KNEA/
 lEpOrB2HkAnScgjfzRUNw9a9ZFoI8zA0ne0U2HsWwFQEnWa4jFOjzmaQC7r7SQ5ytFnk
 x/CfYan+4K32U+onLNFxC7zw1nxZSAxQAhK0rqylyl2lPtFVmUZ+n8kWeCDpt1P/vGoQ
 6HhA==
X-Gm-Message-State: AOAM531hwARxVl/EKVPNUGgC0HKLkOtqDVVvxSbMFhMU3eqI/XS7/DAD
 cz9rr4qhP9bjoKJVTflX3JYwentNdBq8cA==
X-Google-Smtp-Source: ABdhPJzOw+kpAgNyH1oR+TJZV3dnzfOGBOznmxwh6h7BRKqFg98NiQhBkYVDVdA6Deiia4pm1HQOsQ==
X-Received: by 2002:ad4:5de1:0:b0:441:609d:7ba4 with SMTP id
 jn1-20020ad45de1000000b00441609d7ba4mr1204821qvb.57.1648043866519; 
 Wed, 23 Mar 2022 06:57:46 -0700 (PDT)
Received: from localhost.localdomain (mont-dyn-146-104.pwrtc.com.
 [205.174.146.104]) by smtp.gmail.com with ESMTPSA id
 t128-20020a37aa86000000b0060ddf2dc3ecsm20907qke.104.2022.03.23.06.57.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 23 Mar 2022 06:57:46 -0700 (PDT)
From: David Miller <dmiller423@gmail.com>
To: qemu-s390x@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH v5 07/11] target/s390x: vxeh2: vector {load,
 store} byte reversed elements
Date: Wed, 23 Mar 2022 09:57:18 -0400
Message-Id: <20220323135722.1623-8-dmiller423@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220323135722.1623-1-dmiller423@gmail.com>
References: <20220323135722.1623-1-dmiller423@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::f35
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::f35;
 envelope-from=dmiller423@gmail.com; helo=mail-qv1-xf35.google.com
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
Reviewed-by: David Hildenbrand <david@redhat.com>
---
 target/s390x/tcg/insn-data.def      |   4 +
 target/s390x/tcg/translate_vx.c.inc | 113 ++++++++++++++++++++++++++++
 2 files changed, 117 insertions(+)

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
index 0bef1200e3..c0b4a5b9ed 100644
--- a/target/s390x/tcg/translate_vx.c.inc
+++ b/target/s390x/tcg/translate_vx.c.inc
@@ -457,6 +457,62 @@ static DisasJumpType op_vlrep(DisasContext *s, DisasOps *o)
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
@@ -998,6 +1054,63 @@ static DisasJumpType op_vst(DisasContext *s, DisasOps *o)
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


