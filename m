Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7EF18670FB1
	for <lists+qemu-devel@lfdr.de>; Wed, 18 Jan 2023 02:13:16 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pHwzI-000215-SS; Tue, 17 Jan 2023 20:11:36 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pHwzG-00020C-BN
 for qemu-devel@nongnu.org; Tue, 17 Jan 2023 20:11:34 -0500
Received: from mail-pj1-x102a.google.com ([2607:f8b0:4864:20::102a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pHwzE-0002EU-R6
 for qemu-devel@nongnu.org; Tue, 17 Jan 2023 20:11:34 -0500
Received: by mail-pj1-x102a.google.com with SMTP id bj3so31015314pjb.0
 for <qemu-devel@nongnu.org>; Tue, 17 Jan 2023 17:11:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Q2Z9v9cYvm0JH0FW34M0lXW5HnvaE2SPN1rqJqhu+FM=;
 b=sSp3k1kOwCGQm9fVKfiK9B7k75+stPVLywi6h5odTQpQ8aNTD7up3DUf5sF91rwo73
 ZIeD5SF4GsZc2fFZqPx0aeQRP0fa/M2fEcmxic/hDdR4j1hCc+7eE6KRwGU7Pn2mD+Mw
 z9IQTpqJfSFtD9c9rywZy9jNjboU01KdX8DdBEZmyZFJTChRMSGOdv1XotzIZDvgAIpT
 SNmf2tka27bhGjolzUpsVwZTk6vY24HAP6FQK62cDsjzr72AIgq3uzCrZuMBYLn5hdfc
 EZV0vvWqUsROnbgXU710ashIW0mduAy2CuoDGlBfvwaQa/leKXScsv3ahzS0KWUDcoTx
 KyWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Q2Z9v9cYvm0JH0FW34M0lXW5HnvaE2SPN1rqJqhu+FM=;
 b=EBlFCxTrJzDLgJX+dyM9apjty3+LlxXXZqijhL7pzWKfhjavlMY83GPHAzPxk4+to0
 vbIzhSpxcRKYl/yVLQRlj49qQLtjGEC2jIoei+MfLtrl6bmP1aycjlJP7hR8koXOvIf2
 iPXZWTd1gQAt1/KhxgHfUnXEHvrWg+BoUIrHeFnO0/EfOrSLcghqlaw6lw27dHxeE1mq
 lZmU2SNo7cApdHERJDkGBptai2VaZhxoM+VQRGN+kKQooDihu1d4aiZvV8Vw08NzdM3G
 UbthiEqgtc3cQuzVT30HlLyWNEdbzZEYLF4fiOfDzBa/Myu8BTuAOgqB83mPBZ+u3LMY
 I3ZQ==
X-Gm-Message-State: AFqh2kpa++X6idvhpP3z/eQnALFzO/hjV3ZOXOA9f3VkrrKz+It7kLxL
 KXIq6d91ypiV55UxtqB6SiXAtfcnn5pEeD6h
X-Google-Smtp-Source: AMrXdXv1QnG5qYi0HAGteD5iK7o34pJy2skC7EGXJ+TfDPOKlPA267rmiTQU0KvYCnKXEAicnZeOgw==
X-Received: by 2002:a17:902:8c94:b0:18f:a27c:fe with SMTP id
 t20-20020a1709028c9400b0018fa27c00femr5919952plo.55.1674004291390; 
 Tue, 17 Jan 2023 17:11:31 -0800 (PST)
Received: from stoup.. (rrcs-173-198-77-218.west.biz.rr.com. [173.198.77.218])
 by smtp.gmail.com with ESMTPSA id
 s7-20020a170902988700b0017ec1b1bf9fsm21660259plp.217.2023.01.17.17.11.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 17 Jan 2023 17:11:30 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: git@xen0n.name
Subject: [PATCH v2 03/10] target/loongarch: Disassemble pcadd* addresses
Date: Tue, 17 Jan 2023 15:11:16 -1000
Message-Id: <20230118011123.392823-4-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230118011123.392823-1-richard.henderson@linaro.org>
References: <20230118011123.392823-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102a;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102a.google.com
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

Print both the raw field and the resolved pc-relative
address, as we do for branches.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/loongarch/disas.c | 37 +++++++++++++++++++++++++++++++++----
 1 file changed, 33 insertions(+), 4 deletions(-)

diff --git a/target/loongarch/disas.c b/target/loongarch/disas.c
index 7cffd853ec..2e93e77e0d 100644
--- a/target/loongarch/disas.c
+++ b/target/loongarch/disas.c
@@ -519,10 +519,6 @@ INSN(fsel,         fffc)
 INSN(addu16i_d,    rr_i)
 INSN(lu12i_w,      r_i)
 INSN(lu32i_d,      r_i)
-INSN(pcaddi,       r_i)
-INSN(pcalau12i,    r_i)
-INSN(pcaddu12i,    r_i)
-INSN(pcaddu18i,    r_i)
 INSN(ll_w,         rr_i)
 INSN(sc_w,         rr_i)
 INSN(ll_d,         rr_i)
@@ -755,3 +751,36 @@ static bool trans_fcmp_cond_##suffix(DisasContext *ctx, \
 
 FCMP_INSN(s)
 FCMP_INSN(d)
+
+#define PCADD_INSN(name)                                        \
+static bool trans_##name(DisasContext *ctx, arg_##name *a)      \
+{                                                               \
+    output(ctx, #name, "r%d, %d # 0x%" PRIx64,                  \
+           a->rd, a->imm, gen_##name(ctx->pc, a->imm));         \
+    return true;                                                \
+}
+
+static uint64_t gen_pcaddi(uint64_t pc, int imm)
+{
+    return pc + (imm << 2);
+}
+
+static uint64_t gen_pcalau12i(uint64_t pc, int imm)
+{
+    return (pc + (imm << 12)) & ~0xfff;
+}
+
+static uint64_t gen_pcaddu12i(uint64_t pc, int imm)
+{
+    return pc + (imm << 12);
+}
+
+static uint64_t gen_pcaddu18i(uint64_t pc, int imm)
+{
+    return pc + ((uint64_t)(imm) << 18);
+}
+
+PCADD_INSN(pcaddi)
+PCADD_INSN(pcalau12i)
+PCADD_INSN(pcaddu12i)
+PCADD_INSN(pcaddu18i)
-- 
2.34.1


