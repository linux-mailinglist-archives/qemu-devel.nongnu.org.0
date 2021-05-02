Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D628C370DF5
	for <lists+qemu-devel@lfdr.de>; Sun,  2 May 2021 18:28:10 +0200 (CEST)
Received: from localhost ([::1]:43546 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ldEwz-0007ue-TS
	for lists+qemu-devel@lfdr.de; Sun, 02 May 2021 12:28:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35992)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1ldElD-00058l-Lw
 for qemu-devel@nongnu.org; Sun, 02 May 2021 12:16:01 -0400
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a]:39669)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1ldElC-0007Ip-97
 for qemu-devel@nongnu.org; Sun, 02 May 2021 12:15:59 -0400
Received: by mail-wr1-x42a.google.com with SMTP id v12so3090836wrq.6
 for <qemu-devel@nongnu.org>; Sun, 02 May 2021 09:15:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=dvzaE+vmEj53OsiqB294gBuJPIp1EJ/XIul7LLbiwhk=;
 b=lJa5GjW/x+WJ8kxmGoCJZ75Yp5rsNfN4NqD0T9QPoa6/+pQcIOF6CPdixFGDEZ2Vj/
 7E4uM/sfmpyYFDi0vMKIiRspas1UO3aGXIlVcE4dIJHkYmm7xrDGLEXnsIK3mVWT2RQI
 sZHbypRL2/Z3KrITJO5l6K4rbIVhSqNVkBbrXyAP1BPFI35ypXlzkPCuql95Fp8Gnvhf
 pGuCHcd4SLN8RGba+ambXWCduKKAR9hVRyLrZrWIcamaq+p8i5+dytYu1q3IF/ba6GTT
 vyABBTV3rwbsY4YjSzV1ght/MSETIlxL7D0C3UCcFcywqG+8Mypl1835+/9ZcY/AkEw+
 qEkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=dvzaE+vmEj53OsiqB294gBuJPIp1EJ/XIul7LLbiwhk=;
 b=sLYbeih7hoRFUf9/WhjMtyqadT/+QlEzGntzRYjoV5w3ch3GAenGt2T4BMBbo5h0Wc
 qN2/UU1l1VUUtqDrVbwGmIbZuWo8Fnaa3kkVYq3bcrfEIwnllVbnOWb0Y3zknOcy3TaE
 ZkZFcqOigNSfxcS69f0ktUPlHV38LgHL+iMCdzl8d4hDkT9fdvXAdDAvdVeGIROZvizv
 YqqfjlP8JIWQiqyPtVyBlHYAflYziFCf2DVOaPmYwfWCwbdvoBeOoJP5PCH6ptWm4wKJ
 SVNBVZkpR31qMIIgIqtL9vwNk4WJXM9v60RP+DK70m6th+k3uDzjlEEBb6f1Su4J466N
 jnMQ==
X-Gm-Message-State: AOAM5339fi/+swnDRa6lE3HZpRjHkZ8IYKZ+0HS85tYmcnKoc/HtkOVQ
 RvNQ90seB0L6oR1hlZTQ0mlVWOAw5GJoG1mo
X-Google-Smtp-Source: ABdhPJxIjCSKNmL1i+TfinhA59mJgC31NGvSwimoqJ9uXE0qCBzK3IkeBe11NDCzm0gFQ8XgpVuQMQ==
X-Received: by 2002:adf:f152:: with SMTP id y18mr19951431wro.77.1619972156737; 
 Sun, 02 May 2021 09:15:56 -0700 (PDT)
Received: from localhost.localdomain
 (anancy-651-1-208-144.w109-217.abo.wanadoo.fr. [109.217.237.144])
 by smtp.gmail.com with ESMTPSA id o18sm10347944wmq.20.2021.05.02.09.15.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 02 May 2021 09:15:56 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PULL 03/36] target/mips: Add missing CP0 check to nanoMIPS RDPGPR /
 WRPGPR opcodes
Date: Sun,  2 May 2021 18:15:05 +0200
Message-Id: <20210502161538.534038-4-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.3
In-Reply-To: <20210502161538.534038-1-f4bug@amsat.org>
References: <20210502161538.534038-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42a;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x42a.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.248,
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
Cc: Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Huacai Chen <chenhuacai@kernel.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Per the nanoMIPS32 Instruction Set Technical Reference Manual,
Revision 01.01, Chapter 3. "Instruction Definitions":

The Read/Write Previous GPR opcodes "require CP0 privilege".

Add the missing CP0 checks.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20210421185007.2231855-1-f4bug@amsat.org>
---
 target/mips/translate.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/target/mips/translate.c b/target/mips/translate.c
index 5dad75cdf37..8a0a2197426 100644
--- a/target/mips/translate.c
+++ b/target/mips/translate.c
@@ -18969,9 +18969,11 @@ static void gen_pool32axf_nanomips_insn(CPUMIPSState *env, DisasContext *ctx)
             }
             break;
         case NM_RDPGPR:
+            check_cp0_enabled(ctx);
             gen_load_srsgpr(rs, rt);
             break;
         case NM_WRPGPR:
+            check_cp0_enabled(ctx);
             gen_store_srsgpr(rs, rt);
             break;
         case NM_WAIT:
-- 
2.26.3


