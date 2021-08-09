Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FB3D3E4687
	for <lists+qemu-devel@lfdr.de>; Mon,  9 Aug 2021 15:27:16 +0200 (CEST)
Received: from localhost ([::1]:57970 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mD5Ie-00064c-9o
	for lists+qemu-devel@lfdr.de; Mon, 09 Aug 2021 09:26:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46858)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1mD541-000348-V4; Mon, 09 Aug 2021 09:11:34 -0400
Received: from mail-qk1-x729.google.com ([2607:f8b0:4864:20::729]:39586)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1mD53y-0001QJ-Uq; Mon, 09 Aug 2021 09:11:33 -0400
Received: by mail-qk1-x729.google.com with SMTP id y130so5564526qkb.6;
 Mon, 09 Aug 2021 06:11:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=cIdqYVcCUaQd9/nWfyNB5JOfVtWk3chh78h+uJqRs0Y=;
 b=MNWLw7M/WsbuxW1updQgm3pzSgKVn80/gZVxMRR3Jy+h9QVuX/Nb2cBJShK50afA6A
 g6ZJF6B05U3EXKpsHcZGmNYr+SlXOh8n38j6vbNhW4R4gsVWAf5u8iCqvoZl+00UGDSd
 g/qPzJyMhcklUJdV1IusU5anJueQszZlbHuDymOOiSehsg624xtLZO4VaG6aLIJpU0bM
 H9JQadgCf0QygB3lhYG77u1U9e0KdifzAf8h/o6PYxsAMbwmM4Q9AKWLqj+jgk4QdHX6
 /F/vThMHTMqX3plzRDvcbWua6cAcRiuYwkb9uxNbhdzo/H7ADGepuPJv2DitJEtTdKvB
 eqxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=cIdqYVcCUaQd9/nWfyNB5JOfVtWk3chh78h+uJqRs0Y=;
 b=IZjfGz3ViLiZH2JrcaQw8vbBq8AqOoUpQZ6bmMWmZrM9BP2A72HNQ3yITTQX1igH62
 IlBSUqLmljg3ON/UbG4Ttdy/IAy3AT8TPEgsjsb5WXefde/2q9wuLIuTa0xzCw7hof7k
 CkEkAEnYCjF0g9/ZV5Xt7IDofHZjSNttIbUMtiHfLZXtHgqLhv2NtPx4alNbbkQw0NdT
 FuR92tvOl8Gv3rsYk4FisPJXel/yrGVdlU3N+YvmpmQnSaQyiGfHGLUeRTKoK3sEvm5f
 uSw8gdR3z8odvLV2JTls/YT3XZTh05gN5v7vOFQf/fD0b3ijlB5HAR1uNXv3mOcL1HIF
 cqeg==
X-Gm-Message-State: AOAM532P8hcZ2uuUx0ZT2+Y9A7TnnRJ7zB4E5ms+1gLXhJIIGQPKm9uM
 goP55uPAMVh002YUusdh/YEGDO1ZjM5MaA==
X-Google-Smtp-Source: ABdhPJy09SNLMN00BYHFFELAp6WlGOj1ltxADAKQ+Imv8kydedC3FLyTmEMeD5R/DdK8N50BxZ8pjw==
X-Received: by 2002:a37:84c1:: with SMTP id
 g184mr23288093qkd.102.1628514689183; 
 Mon, 09 Aug 2021 06:11:29 -0700 (PDT)
Received: from rekt.ibmuc.com ([191.19.172.190])
 by smtp.gmail.com with ESMTPSA id f3sm6757435qti.65.2021.08.09.06.11.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 09 Aug 2021 06:11:28 -0700 (PDT)
From: Daniel Henrique Barboza <danielhb413@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 09/19] PPC64/TCG: Implement 'rfebb' instruction
Date: Mon,  9 Aug 2021 10:10:47 -0300
Message-Id: <20210809131057.1694145-10-danielhb413@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210809131057.1694145-1-danielhb413@gmail.com>
References: <20210809131057.1694145-1-danielhb413@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::729;
 envelope-from=danielhb413@gmail.com; helo=mail-qk1-x729.google.com
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
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
Cc: gustavo.romero@linaro.org, Gustavo Romero <gromero@linux.ibm.com>,
 Daniel Henrique Barboza <danielhb413@gmail.com>, groug@kaod.org,
 qemu-ppc@nongnu.org, clg@kaod.org, david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Gustavo Romero <gromero@linux.ibm.com>

An Event-Based Branch (EBB) allows applications to change the NIA when a
event-based exception occurs. Event-based exceptions are enabled by
setting the Branch Event Status and Control Register (BESCR). If the
event-based exception is enabled when the exception occurs, an EBB
happens.

The EBB will:

- set the Global Enable (GE) bit of BESCR to 0;
- set bits 0-61 of the Event-Based Branch Return Register (EBBRR) to the
  effective address of the NIA that would have executed if the EBB
  didn't happen;
- Instruction fetch and execution will continue in the effective address
  contained in the Event-Based Branch Handler Register (EBBHR).

The EBB Handler will process the event and then execute the Return From
Event-Based Branch (rfebb) instruction. rfebb sets BESCR_GE and then
redirects execution to the address pointed in EBBRR. This process is
described in the PowerISA v3.1, Book II, Chapter 6 [1].

This patch implements the rfebb instruction. Descriptions of all
relevant BESCR bits are also added - this patch is only using BESCR_GE,
but next patches will use the remaining bits.

Note that we're implementing the extended rfebb mnemonic (BESCR_GE is
being always set to 1). The basic rfebb instruction would accept an
operand that would be used to set GE.

[1] https://wiki.raptorcs.com/w/images/f/f5/PowerISA_public.v3.1.pdf

CC: Gustavo Romero <gustavo.romero@linaro.org>
Signed-off-by: Gustavo Romero <gromero@linux.ibm.com>
Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
---
 target/ppc/cpu.h       | 12 ++++++++++++
 target/ppc/translate.c | 21 +++++++++++++++++++++
 2 files changed, 33 insertions(+)

diff --git a/target/ppc/cpu.h b/target/ppc/cpu.h
index afd9cd402b..ae431e65be 100644
--- a/target/ppc/cpu.h
+++ b/target/ppc/cpu.h
@@ -358,6 +358,18 @@ typedef struct ppc_v3_pate_t {
 #define MMCR1_PMC3SEL PPC_BITMASK(48, 55)
 #define MMCR1_PMC4SEL PPC_BITMASK(56, 63)
 
+/* EBB/BESCR bits */
+/* Global Enable */
+#define BESCR_GE PPC_BIT(0)
+/* External Event-based Exception Enable */
+#define BESCR_EE PPC_BIT(30)
+/* Performance Monitor Event-based Exception Enable */
+#define BESCR_PME PPC_BIT(31)
+/* External Event-based Exception Occurred */
+#define BESCR_EEO PPC_BIT(62)
+/* Performance Monitor Event-based Exception Occurred */
+#define BESCR_PMEO PPC_BIT(63)
+
 /* LPCR bits */
 #define LPCR_VPM0         PPC_BIT(0)
 #define LPCR_VPM1         PPC_BIT(1)
diff --git a/target/ppc/translate.c b/target/ppc/translate.c
index 62356cfadf..afc254a03f 100644
--- a/target/ppc/translate.c
+++ b/target/ppc/translate.c
@@ -2701,6 +2701,26 @@ static void gen_darn(DisasContext *ctx)
         }
     }
 }
+
+/* rfebb */
+static void gen_rfebb(DisasContext *ctx)
+{
+    TCGv target = tcg_temp_new();
+    TCGv bescr = tcg_temp_new();
+
+    gen_load_spr(target, SPR_EBBRR);
+    tcg_gen_mov_tl(cpu_nip, target);
+
+    gen_load_spr(bescr, SPR_BESCR);
+    tcg_gen_ori_tl(bescr, bescr, BESCR_GE);
+    gen_store_spr(SPR_BESCR, bescr);
+
+    ctx->base.is_jmp = DISAS_EXIT;
+
+    tcg_temp_free(target);
+    tcg_temp_free(bescr);
+}
+
 #endif
 
 /***                             Integer rotate                            ***/
@@ -7724,6 +7744,7 @@ GEN_HANDLER(popcntd, 0x1F, 0x1A, 0x0F, 0x0000F801, PPC_POPCNTWD),
 GEN_HANDLER(cntlzd, 0x1F, 0x1A, 0x01, 0x00000000, PPC_64B),
 GEN_HANDLER_E(cnttzd, 0x1F, 0x1A, 0x11, 0x00000000, PPC_NONE, PPC2_ISA300),
 GEN_HANDLER_E(darn, 0x1F, 0x13, 0x17, 0x001CF801, PPC_NONE, PPC2_ISA300),
+GEN_HANDLER_E(rfebb, 0x13, 0x12, 0x04, 0x03FFF001, PPC_NONE, PPC2_ISA207S),
 GEN_HANDLER_E(prtyd, 0x1F, 0x1A, 0x05, 0x0000F801, PPC_NONE, PPC2_ISA205),
 GEN_HANDLER_E(bpermd, 0x1F, 0x1C, 0x07, 0x00000001, PPC_NONE, PPC2_PERM_ISA206),
 #endif
-- 
2.31.1


