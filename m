Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A1FBB32070C
	for <lists+qemu-devel@lfdr.de>; Sat, 20 Feb 2021 21:21:27 +0100 (CET)
Received: from localhost ([::1]:35302 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lDYko-0008DX-En
	for lists+qemu-devel@lfdr.de; Sat, 20 Feb 2021 15:21:26 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:56924)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lDYjw-0007j0-RM
 for qemu-devel@nongnu.org; Sat, 20 Feb 2021 15:20:32 -0500
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f]:35965)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lDYjv-0007f3-Cv
 for qemu-devel@nongnu.org; Sat, 20 Feb 2021 15:20:32 -0500
Received: by mail-wr1-x42f.google.com with SMTP id u14so14690837wri.3
 for <qemu-devel@nongnu.org>; Sat, 20 Feb 2021 12:20:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=UGlDrVZ/ySjzab0RepdHoUplyC09W9KqKSYOsq9TNHY=;
 b=ezxryITNzmIk2rUQS1c2mwFByGb89Hn4azbXqqa5PuWQmCSryfNvMaWEgHm665hXwi
 6mT66YIlDrOg2NNpr/aHcZGFR6JR/20n6OuNSRl98GKeuJYOfhSNS76ythgpi9jz3tVL
 Axnlv+DBmEHMdZVHkhEWbKFXXVsuPjJ9w6h+i5dTcnLG3QSEyW3v3lb7AEamev4oEhBU
 BjBNwenSENF80TqQX8my+qE8fc5SppvQaKGldmJ0VlffUELpZgIIOZKfwY507yAJ53N5
 YuM3mkkeCdVQvCycmdWrmo/4WqvbpB3JWSPu07GhxwbcLRXiMdVRvbYf0HC7GGTgl2Qs
 UOrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=UGlDrVZ/ySjzab0RepdHoUplyC09W9KqKSYOsq9TNHY=;
 b=LiXiYkfWMCXew9qEwsuzcxYlsptxYPugJgZGj7ZJmjgw0ULWs+3UhNJ2Dsgvltaezs
 EWERRJuv3t3Oq6wmW23/evO8cRQ0S40XFKDaS7Sfz0U6qvLE2COgXt2zgOdYav+RugF7
 yW0WV7t0jbVs2eDfjWI2c9oyVe2sJQl0n5YVkPIOOIrH7egVpnmCwIjk3agX/NCfrkKX
 DC3HKq9xD7fPaQQd3ORCFBbCQnr84mnglShmygYWnhg2HTQBlOHZ6pmLLgC5K+tj42Ey
 HrWf6ZBhe0C8ua7C346vykJ/XtGKam3HCJwfdSq39o4eLm/psIev1tZ0IGVlw0ETRwIp
 XWxg==
X-Gm-Message-State: AOAM533+IJYnc1nKdGh/qRhgzYqifyr2Pidr3yejr3X+9Srdj+Ieo33R
 ot6Sma4ObN0zf0607h+ySfTU0uEq/M8=
X-Google-Smtp-Source: ABdhPJzfbHyfS0S2OPjBc5FqYc+BfGOSvbUgvI1UaPU1dHzTvlf3/6cKhx2D+YFCzruqLPIIeX9wjA==
X-Received: by 2002:adf:e706:: with SMTP id c6mr2330760wrm.216.1613852429597; 
 Sat, 20 Feb 2021 12:20:29 -0800 (PST)
Received: from localhost.localdomain (68.red-83-57-175.dynamicip.rima-tde.net.
 [83.57.175.68])
 by smtp.gmail.com with ESMTPSA id r17sm21341029wrx.82.2021.02.20.12.20.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 20 Feb 2021 12:20:29 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH] target/mips: Remove unused 'rw' argument from
 page_table_walk_refill()
Date: Sat, 20 Feb 2021 21:20:26 +0100
Message-Id: <20210220202026.2305667-1-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42f;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x42f.google.com
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
Cc: Aurelien Jarno <aurelien@aurel32.net>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

As the 'rw' argument is unused, remove it.

Reported-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 target/mips/tlb_helper.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/target/mips/tlb_helper.c b/target/mips/tlb_helper.c
index 082c17928d3..8b85ef735ef 100644
--- a/target/mips/tlb_helper.c
+++ b/target/mips/tlb_helper.c
@@ -622,8 +622,8 @@ static int walk_directory(CPUMIPSState *env, uint64_t *vaddr,
     }
 }
 
-static bool page_table_walk_refill(CPUMIPSState *env, vaddr address, int rw,
-        int mmu_idx)
+static bool page_table_walk_refill(CPUMIPSState *env, vaddr address,
+                                   int mmu_idx)
 {
     int gdw = (env->CP0_PWSize >> CP0PS_GDW) & 0x3F;
     int udw = (env->CP0_PWSize >> CP0PS_UDW) & 0x3F;
@@ -881,7 +881,7 @@ bool mips_cpu_tlb_fill(CPUState *cs, vaddr address, int size,
         int mode = (env->hflags & MIPS_HFLAG_KSU);
         bool ret_walker;
         env->hflags &= ~MIPS_HFLAG_KSU;
-        ret_walker = page_table_walk_refill(env, address, access_type, mmu_idx);
+        ret_walker = page_table_walk_refill(env, address, mmu_idx);
         env->hflags |= mode;
         if (ret_walker) {
             ret = get_physical_address(env, &physical, &prot, address,
-- 
2.26.2


