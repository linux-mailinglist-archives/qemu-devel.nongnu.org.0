Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B23D3F097D
	for <lists+qemu-devel@lfdr.de>; Wed, 18 Aug 2021 18:46:28 +0200 (CEST)
Received: from localhost ([::1]:49530 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mGOhv-0006wd-Ek
	for lists+qemu-devel@lfdr.de; Wed, 18 Aug 2021 12:46:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39886)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mGOfM-00046w-FS
 for qemu-devel@nongnu.org; Wed, 18 Aug 2021 12:43:48 -0400
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433]:38821)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mGOfH-0004BG-V9
 for qemu-devel@nongnu.org; Wed, 18 Aug 2021 12:43:48 -0400
Received: by mail-wr1-x433.google.com with SMTP id u16so4504840wrn.5
 for <qemu-devel@nongnu.org>; Wed, 18 Aug 2021 09:43:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=lP+nOsNKl2jJJvhazgJeN/uzp96XdmFpJ71cEs//Ybg=;
 b=uChrVUtB5vda4O/9j58UH68PblLRvShvlGmi+i2gppSt6UF/5+qewJhnABgJuEfq36
 c8Qg7sRoNby0lAgsjvR+Fms/nDv9WwCR0VrNAQMCXvdWG9mlDWVhaLksUuWFR93DHl1j
 njcD6f6UaJFcjNE+92Fkw7C0/4kcDfeKSORHh8GqFtmgLBYqpIGnv9Lws8MW7UR3FkLS
 S38fYNuFcu86jDEw/qTHlswhT68R7bhiyl3xWoQcXEq23aEwqw1b4CKdrAtQx3Bv+n2z
 YmS90MJxWq7OTR9ApxOtqEeUMyKXG8yQq7yR8/iILq3VcVQqD14n83skjnw9ERF4OXBS
 jLaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=lP+nOsNKl2jJJvhazgJeN/uzp96XdmFpJ71cEs//Ybg=;
 b=tz6ZLk+QPKmYsBV/SqOVswKB1i24Q6WGvMVvUlpeqW1hTkkBKdh9Y9fsY0iQDPF/df
 lZZlvpLpC8qMknVCB5CFLW1zpQnNDkBu/hcQUOZdIdE8bySn0cTwS8RimFuhW134lZdw
 tzIlPbWTIje1Svi0aQsMUjjK4qtLRWk2D0033ti8ZjNPPTm7jJ30Tx6JZzmGPfJn0zLe
 qXpMgXDE2Y59/90tiBQNVl3kNMfF9qvcmYKOE32QFN00wUxHLd6fjv9x6dVjq2fC/aZ7
 MvrEhnCzbVroYL3jdM6u+EtTn1qh5Ueisir5rppPSb3cRVpqYi+1OSte4cA93x4ymjPS
 ESCA==
X-Gm-Message-State: AOAM531QmX8UZ1a0+aSOXc5jW6rWxW/aNeUkKRVGvK2Trwl1JW3/nyAL
 gu0T9aczo8fvwXRcDWBT5FpCCyPw3cI=
X-Google-Smtp-Source: ABdhPJxkxfDMrMnL8n8g5bMz8dZXN1YO+x1LXxi8t/q8V3ydmM1En5rl+VpLdHdGXpW42p9D4MeAlQ==
X-Received: by 2002:adf:fb44:: with SMTP id c4mr11527211wrs.179.1629305022423; 
 Wed, 18 Aug 2021 09:43:42 -0700 (PDT)
Received: from x1w.redhat.com (163.red-83-52-55.dynamicip.rima-tde.net.
 [83.52.55.163])
 by smtp.gmail.com with ESMTPSA id k22sm290625wmi.47.2021.08.18.09.43.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 18 Aug 2021 09:43:41 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 4/5] target/mips: Store CP0_Config0 in DisasContext
Date: Wed, 18 Aug 2021 18:43:20 +0200
Message-Id: <20210818164321.2474534-5-f4bug@amsat.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210818164321.2474534-1-f4bug@amsat.org>
References: <20210818164321.2474534-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::433;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x433.google.com
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
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Most TCG helpers only have access to a DisasContext pointer,
not CPUMIPSState. Store a copy of CPUMIPSState::CP0_Config0
in DisasContext so we can access it from TCG helpers.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
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


