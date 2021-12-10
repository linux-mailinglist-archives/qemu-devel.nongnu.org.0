Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D686B46FCEC
	for <lists+qemu-devel@lfdr.de>; Fri, 10 Dec 2021 09:43:13 +0100 (CET)
Received: from localhost ([::1]:34584 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mvbUm-0006O8-V7
	for lists+qemu-devel@lfdr.de; Fri, 10 Dec 2021 03:43:12 -0500
Received: from eggs.gnu.org ([209.51.188.92]:33090)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1mvaoN-0006PJ-0i
 for qemu-devel@nongnu.org; Fri, 10 Dec 2021 02:59:26 -0500
Received: from [2607:f8b0:4864:20::429] (port=36547
 helo=mail-pf1-x429.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1mvaoJ-0006wg-TD
 for qemu-devel@nongnu.org; Fri, 10 Dec 2021 02:59:22 -0500
Received: by mail-pf1-x429.google.com with SMTP id n26so7788635pff.3
 for <qemu-devel@nongnu.org>; Thu, 09 Dec 2021 23:59:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=r1PDrJurekp2wH3fJ/RTfcDQtMF0yVqNfYlitdBh62M=;
 b=hvManDjf7xomierP51vkytvL3gEoyQSyCHJpxv0KHdZc1zy9shL2PiE3bPSKu8Sak2
 XJESm95enY18qied4U5mpVagrbmScqREjIL98OCSIUPsoMltbClvg9TlODLxhYhwB+YO
 5tDpstocaaaC1+Ov0spUIdTUI/ooEN3UgR2SRzxW1+QQ4HAVTNtHevIOJ9qhg5rizHON
 ZOQN5PfxnP1MhOxhtVv7y5nRs4SDiQKfzVOtU/gZ3LrfJE237VrRhhRseOzzT19BmvRo
 wBOLraMj0fL71GG2855T2bb69HXFUXaaEqA6fcBiBmSERwxwDFHBLWyjCOtIBs87539u
 RO3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=r1PDrJurekp2wH3fJ/RTfcDQtMF0yVqNfYlitdBh62M=;
 b=wMJDgybrjiNkAm+3bxQf2uP5BOky9c2uOkiVXOoaDc/NGB9d9p8qsT5JftV7noWDSk
 e1sH0+aKtxAYDKWHuAj2jfge3qDazUXCxfZrNxl0+0pgUr6tbspf7SgUmilzpYh9a5go
 T1e9N5BqL0vLawj3MeVZqf3XEAalutM5Qe+0BMTZM7xsJpomNEPAXqCaivOn/mI3n/ZZ
 is3WXpp8qWjrKX2O3TRsi6ELc2AX6fggSuOAQovZQU3L+uJdju2iwOfmUjdFuB7Vfvje
 5IpTDNGoSt20ziozw3o+yK+FuSFE39+2nZJa/zuMNMOepyn0cxtoEJ7H6Qw/kVj1QwuC
 Rbqw==
X-Gm-Message-State: AOAM530Sb0hGGw8EANUrIPnY6mnvC7QD9nVLIGVYPQFgMGp6thRY3F+N
 25HkQrzII37vWGhlqrrJNsih8IwPlB3IqHox
X-Google-Smtp-Source: ABdhPJw3S7AoDdSflienkRVlBDQ5uR1qF5aVzjKIMjJHuDDED8LzEAoinTGm6XWFsZ69s3x9qUZVSg==
X-Received: by 2002:a05:6a00:248a:b0:4b0:b882:dfc4 with SMTP id
 c10-20020a056a00248a00b004b0b882dfc4mr6247197pfv.37.1639123153762; 
 Thu, 09 Dec 2021 23:59:13 -0800 (PST)
Received: from hsinchu16.internal.sifive.com
 (59-124-168-89.hinet-ip.hinet.net. [59.124.168.89])
 by smtp.gmail.com with ESMTPSA id f4sm2087955pfg.34.2021.12.09.23.59.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 09 Dec 2021 23:59:13 -0800 (PST)
From: frank.chang@sifive.com
To: qemu-devel@nongnu.org
Subject: [PATCH v11 39/77] target/riscv: rvv-1.0: whole register move
 instructions
Date: Fri, 10 Dec 2021 15:56:25 +0800
Message-Id: <20211210075704.23951-40-frank.chang@sifive.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211210075704.23951-1-frank.chang@sifive.com>
References: <20211210075704.23951-1-frank.chang@sifive.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::429
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::429;
 envelope-from=frank.chang@sifive.com; helo=mail-pf1-x429.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: qemu-riscv@nongnu.org, Frank Chang <frank.chang@sifive.com>,
 Bin Meng <bin.meng@windriver.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Alistair Francis <alistair.francis@wdc.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, LIU Zhiwei <zhiwei_liu@c-sky.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Frank Chang <frank.chang@sifive.com>

Add the following instructions:

* vmv1r.v
* vmv2r.v
* vmv4r.v
* vmv8r.v

Signed-off-by: Frank Chang <frank.chang@sifive.com>
Acked-by: Alistair Francis <alistair.francis@wdc.com>
---
 target/riscv/insn32.decode              |  4 ++++
 target/riscv/insn_trans/trans_rvv.c.inc | 25 +++++++++++++++++++++++++
 2 files changed, 29 insertions(+)

diff --git a/target/riscv/insn32.decode b/target/riscv/insn32.decode
index ab5fdbf9be..06a8076311 100644
--- a/target/riscv/insn32.decode
+++ b/target/riscv/insn32.decode
@@ -650,6 +650,10 @@ vrgatherei16_vv 001110 . ..... ..... 000 ..... 1010111 @r_vm
 vrgather_vx     001100 . ..... ..... 100 ..... 1010111 @r_vm
 vrgather_vi     001100 . ..... ..... 011 ..... 1010111 @r_vm
 vcompress_vm    010111 - ..... ..... 010 ..... 1010111 @r
+vmv1r_v         100111 1 ..... 00000 011 ..... 1010111 @r2rd
+vmv2r_v         100111 1 ..... 00001 011 ..... 1010111 @r2rd
+vmv4r_v         100111 1 ..... 00011 011 ..... 1010111 @r2rd
+vmv8r_v         100111 1 ..... 00111 011 ..... 1010111 @r2rd
 
 vsetvli         0 ........... ..... 111 ..... 1010111  @r2_zimm
 vsetvl          1000000 ..... ..... 111 ..... 1010111  @r
diff --git a/target/riscv/insn_trans/trans_rvv.c.inc b/target/riscv/insn_trans/trans_rvv.c.inc
index 89f88a0ea7..91e7c14ec4 100644
--- a/target/riscv/insn_trans/trans_rvv.c.inc
+++ b/target/riscv/insn_trans/trans_rvv.c.inc
@@ -3259,3 +3259,28 @@ static bool trans_vcompress_vm(DisasContext *s, arg_r *a)
     }
     return false;
 }
+
+/*
+ * Whole Vector Register Move Instructions ignore vtype and vl setting.
+ * Thus, we don't need to check vill bit. (Section 16.6)
+ */
+#define GEN_VMV_WHOLE_TRANS(NAME, LEN)                          \
+static bool trans_##NAME(DisasContext *s, arg_##NAME * a)       \
+{                                                               \
+    if (require_rvv(s) &&                                       \
+        QEMU_IS_ALIGNED(a->rd, LEN) &&                          \
+        QEMU_IS_ALIGNED(a->rs2, LEN)) {                         \
+        /* EEW = 8 */                                           \
+        tcg_gen_gvec_mov(MO_8, vreg_ofs(s, a->rd),              \
+                         vreg_ofs(s, a->rs2),                   \
+                         s->vlen / 8 * LEN, s->vlen / 8 * LEN); \
+        mark_vs_dirty(s);                                       \
+        return true;                                            \
+    }                                                           \
+    return false;                                               \
+}
+
+GEN_VMV_WHOLE_TRANS(vmv1r_v, 1)
+GEN_VMV_WHOLE_TRANS(vmv2r_v, 2)
+GEN_VMV_WHOLE_TRANS(vmv4r_v, 4)
+GEN_VMV_WHOLE_TRANS(vmv8r_v, 8)
-- 
2.31.1


