Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3AAA63B40EC
	for <lists+qemu-devel@lfdr.de>; Fri, 25 Jun 2021 11:52:50 +0200 (CEST)
Received: from localhost ([::1]:47976 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lwiW1-0007K4-48
	for lists+qemu-devel@lfdr.de; Fri, 25 Jun 2021 05:52:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55586)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lwi4b-0005zp-Cw
 for qemu-devel@nongnu.org; Fri, 25 Jun 2021 05:24:29 -0400
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330]:51728)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lwi4Z-00025Q-Hl
 for qemu-devel@nongnu.org; Fri, 25 Jun 2021 05:24:29 -0400
Received: by mail-wm1-x330.google.com with SMTP id r3so1281822wmq.1
 for <qemu-devel@nongnu.org>; Fri, 25 Jun 2021 02:24:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=GB1t1SzgUrQ6wryHeMC6aCDk5PBhagijh5OIfYjZw6g=;
 b=KIxdmLjiZGf83Q6VIez29DM1KUbUTWULlB+zZuxUNz8Caf6y22gfN/g8icUoeg4YWF
 A+AUFkPlgr/EulzR/2SByjpzm0H8KhGLzz2W4QiMbCteycux834R213qCEJsjn3Hi4r0
 tgQKvJfNhJr+4BJlgTv+BU0CYf/INVMjPFuo1RznaxKsP3sSy0vTTSGT7FoRocumQ/TN
 0crjVIvdehkPDekdF/2RdwQdWVT3sEkAETsHcKIM8hnsdOuRQKLUBUgEa7I2WApPZSw9
 lMoxFZpPNscb2O8clzdWgL1WUItN1SuAIVZrT3qhRvSWG2HXNbZtz9ojdYcHNhc58wBs
 x9dA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=GB1t1SzgUrQ6wryHeMC6aCDk5PBhagijh5OIfYjZw6g=;
 b=OjMBCe1P23tFy9wqFr0F2VScMHuRZ6F444azrDzeE5UxGXpHAjpFPR1X7r3W9XDg5B
 XHOWqFpomtinXssgJBPTTzFxgUCgAMzKLI6F8LoNhYS+EsVsqzbtV/0Q0iNROS+pXaEZ
 UrBq2KYFyjcN+Tkurb2nTt7xZJC5Yn1AchOaap/sTJhcJmHqBH/dNtzr/VBQfhKtMLvx
 XUvrzCD5IR7YVKBrwh3AtBOGsYLZ8Pk9uoMkzLZMGHFv83hjFUhvhsVtaBS9xLMLCfEV
 2qkR7LApCndnI8HoL2YF03qJ5dALiyKzpiAgeo9/4RD8Aewtj1lX9HlOz8KFWrMmzRzI
 g2KA==
X-Gm-Message-State: AOAM533Aae4VDYLDAVqksC9oLn4wxV+zVmaTysr2YPtl+V71CyvVnNTU
 0B08iM5/qHsYVjVqOrYnCBpAYF3GpxKzRw==
X-Google-Smtp-Source: ABdhPJxdsG9HylINq+TFz/O4GyK3za1sDOycPdHtNCZiAgpmQsYF8AnacnD8nhGtJmERIq6NKiBPog==
X-Received: by 2002:a7b:c041:: with SMTP id u1mr9171640wmc.95.1624613065546;
 Fri, 25 Jun 2021 02:24:25 -0700 (PDT)
Received: from x1w.. (93.red-83-35-24.dynamicip.rima-tde.net. [83.35.24.93])
 by smtp.gmail.com with ESMTPSA id o20sm11013917wms.3.2021.06.25.02.24.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 25 Jun 2021 02:24:25 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PULL 11/15] target/mips: fix emulation of nanoMIPS BPOSGE32
 instruction
Date: Fri, 25 Jun 2021 11:23:25 +0200
Message-Id: <20210625092329.1529100-12-f4bug@amsat.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210625092329.1529100-1-f4bug@amsat.org>
References: <20210625092329.1529100-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::330;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x330.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
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
Cc: Aurelien Jarno <aurelien@aurel32.net>,
 Aleksandar Rikalo <Aleksandar.Rikalo@syrmia.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Filip Vidojevic <filip.vidojevic@syrmia.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Aleksandar Rikalo <Aleksandar.Rikalo@syrmia.com>

Per the "MIPS® Architecture Extension: nanoMIPS32 DSP Technical
Reference Manual — Revision 0.04" p. 88 "BPOSGE32C", offset argument (imm)
should be left-shifted first.
This change was tested against test_dsp_r1_bposge32.c DSP test.

Reported-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Reviewed-by: Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>
Signed-off-by: Filip Vidojevic <filip.vidojevic@syrmia.com>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Message-Id: <VI1PR0302MB34869449EE56F226FC3C21129C309@VI1PR0302MB3486.eurprd03.prod.outlook.com>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 target/mips/tcg/translate.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/target/mips/tcg/translate.c b/target/mips/tcg/translate.c
index 1ff0b098bca..d248b5e5d21 100644
--- a/target/mips/tcg/translate.c
+++ b/target/mips/tcg/translate.c
@@ -21137,7 +21137,7 @@ static int decode_nanomips_32_48_opc(CPUMIPSState *env, DisasContext *ctx)
                                       extract32(ctx->opcode, 0, 1) << 13;
 
                         gen_compute_branch_nm(ctx, OPC_BPOSGE32, 4, -1, -2,
-                                              imm);
+                                              imm << 1);
                     }
                     break;
                 default:
-- 
2.31.1


