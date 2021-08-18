Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 62BBA3F0DCB
	for <lists+qemu-devel@lfdr.de>; Wed, 18 Aug 2021 23:59:25 +0200 (CEST)
Received: from localhost ([::1]:41086 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mGTam-0002TD-FK
	for lists+qemu-devel@lfdr.de; Wed, 18 Aug 2021 17:59:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40324)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mGTXE-00040T-9d
 for qemu-devel@nongnu.org; Wed, 18 Aug 2021 17:55:44 -0400
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e]:37848)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mGTXA-000085-VQ
 for qemu-devel@nongnu.org; Wed, 18 Aug 2021 17:55:44 -0400
Received: by mail-wr1-x42e.google.com with SMTP id l11so5777152wrx.4
 for <qemu-devel@nongnu.org>; Wed, 18 Aug 2021 14:55:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=U7gIJvBW4JKvt2ZTXiAxofETRvBakvpm4JnJyObeScc=;
 b=P1kAivs+7ir06Kz/gh/nRf5VDSF+kxIYM1hN6DlCeZZdIb/t+31ZtWn3iDg2I0hXDG
 NfxA65Knhg50FJvWCHkbo3f+RclzkIsOA1fG8huw3acXDnPjJIKH9G6ja2cK78M36a+X
 MSa2S0dRx4A/cB/e85QVjC1elss1UPspA5DO9wgR+9s6R3zAapuJkpqRMOPhGzlWZhK9
 1rKutbMxj3gUpso+0bfJYyXgEHXcBYZcKG70phVVNjJ+/JHOntgSr0jpTHo6SpUdpfjx
 AHdD0COcy7lKahjlvzNzD09doyAuUcHFCHJp+pHnIF0iTPiT6M3z8VYPaj5Ps4HLqXv5
 eZUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=U7gIJvBW4JKvt2ZTXiAxofETRvBakvpm4JnJyObeScc=;
 b=FYRhCM1IE+flf78kialLwzLfNyeVOYER/hpMTDGt8+YHtRcZCQ4DAzdC+jT9aMYnLE
 5eV2ox1z3/9R8gpPCURHyQLDxLV4RSl5b1DjZBW0VIxS9tA0+0IOQO51KRQhKDT6vNd8
 afkicQMZn7PeALBrazcvFXfstd8e7pnSUz2uDee6RZ28mhOkTPo8UA2Fz5Er8ed1GJlF
 OQJnp7ldGSjScoW6h9v8jrvtYBW2SHh40cvgro8QgBN/Fm7RKnHsavNqG5Otv2IMmCNz
 MtOTvYd5Ll4UBtDagIe1kYcgglZi3Fi7IaSDlHysDCD64yTNqJoweB0HkV0YPBxgRdeA
 1yPw==
X-Gm-Message-State: AOAM5332UX4L7PeG1u7ebNaKCoS1ZiJcj93vKwVvGXmDyJzFSL/A7Afv
 aww7WFOsBSaFUMMdXjtA+y1rD4aiF6Q=
X-Google-Smtp-Source: ABdhPJysBoUvLQx7LsiwCay9XbpezvBeCUWBfwDPbdROkMiId90Ckf6M9xeDS58toxAN7flIu9J/gg==
X-Received: by 2002:adf:e6cc:: with SMTP id y12mr13669457wrm.200.1629323739485; 
 Wed, 18 Aug 2021 14:55:39 -0700 (PDT)
Received: from x1w.redhat.com (163.red-83-52-55.dynamicip.rima-tde.net.
 [83.52.55.163])
 by smtp.gmail.com with ESMTPSA id s13sm6153148wmc.47.2021.08.18.14.55.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 18 Aug 2021 14:55:39 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 4/5] target/mips: Store CP0_Config0 in DisasContext
Date: Wed, 18 Aug 2021 23:55:16 +0200
Message-Id: <20210818215517.2560994-5-f4bug@amsat.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210818215517.2560994-1-f4bug@amsat.org>
References: <20210818215517.2560994-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42e;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x42e.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Thomas Huth <thuth@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Most TCG helpers only have access to a DisasContext pointer,
not CPUMIPSState. Store a copy of CPUMIPSState::CP0_Config0
in DisasContext so we can access it from TCG helpers.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20210818164321.2474534-5-f4bug@amsat.org>
---
 target/mips/tcg/translate.h | 1 +
 target/mips/tcg/translate.c | 1 +
 2 files changed, 2 insertions(+)

diff --git a/target/mips/tcg/translate.h b/target/mips/tcg/translate.h
index bb0a6b8d74f..9d325c836aa 100644
--- a/target/mips/tcg/translate.h
+++ b/target/mips/tcg/translate.h
@@ -18,6 +18,7 @@ typedef struct DisasContext {
     target_ulong page_start;
     uint32_t opcode;
     uint64_t insn_flags;
+    int32_t CP0_Config0;
     int32_t CP0_Config1;
     int32_t CP0_Config2;
     int32_t CP0_Config3;
diff --git a/target/mips/tcg/translate.c b/target/mips/tcg/translate.c
index a58d50e40e2..572104e2cc2 100644
--- a/target/mips/tcg/translate.c
+++ b/target/mips/tcg/translate.c
@@ -16034,6 +16034,7 @@ static void mips_tr_init_disas_context(DisasContextBase *dcbase, CPUState *cs)
     ctx->page_start = ctx->base.pc_first & TARGET_PAGE_MASK;
     ctx->saved_pc = -1;
     ctx->insn_flags = env->insn_flags;
+    ctx->CP0_Config0 = env->CP0_Config0;
     ctx->CP0_Config1 = env->CP0_Config1;
     ctx->CP0_Config2 = env->CP0_Config2;
     ctx->CP0_Config3 = env->CP0_Config3;
-- 
2.31.1


