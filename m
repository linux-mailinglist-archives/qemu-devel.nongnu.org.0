Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9005E58D02C
	for <lists+qemu-devel@lfdr.de>; Tue,  9 Aug 2022 00:36:11 +0200 (CEST)
Received: from localhost ([::1]:36222 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oLBM2-0003VB-Dt
	for lists+qemu-devel@lfdr.de; Mon, 08 Aug 2022 18:36:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37974)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1oLBJV-0007zp-TK
 for qemu-devel@nongnu.org; Mon, 08 Aug 2022 18:33:33 -0400
Received: from mail-pj1-x102c.google.com ([2607:f8b0:4864:20::102c]:41792)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1oLBJT-0001BK-CV
 for qemu-devel@nongnu.org; Mon, 08 Aug 2022 18:33:33 -0400
Received: by mail-pj1-x102c.google.com with SMTP id
 t2-20020a17090a4e4200b001f21572f3a4so10561809pjl.0
 for <qemu-devel@nongnu.org>; Mon, 08 Aug 2022 15:33:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:sender:from:to:cc;
 bh=dfCoe5CPCf7Qygo9DSrOF67fkjSDzHCAi0r9x0XXODg=;
 b=bx7s1yA9fKF+/xsJCR9IYozPsk5E4VMLxkIkjOXw+WQG8mQ0a2LOilPajhtO++4Ln6
 n0bR77b9nc3Mqg1Ac6GJL68dX1y/jeejA8lNiiqgooWCiej2OvrkZ3PHhleDMxjta+eJ
 z3+othvZv1m3/kR1xUOJwagKSeqD/zELZWdw8NW6QvtKuAV+VsYxNMQ17IKDf5LTf/53
 KCX78ynkIiP5j+PlZTaxbUYjIm1QMlG8oFJ8LNwKplaKcwVlwFd6hTJ9tUt6dRkr2016
 F6f8IyFfNvbeXzm6IbsqRpoNmCXYOQX2bxlnynqvu1JuT4HeI4zjlTsx849wr84veSTY
 raHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:sender:x-gm-message-state:from
 :to:cc;
 bh=dfCoe5CPCf7Qygo9DSrOF67fkjSDzHCAi0r9x0XXODg=;
 b=EOZjjGQLIoJD9EXji75MYGvVBW4k17k11QI14HUETiyLZNx2//DiVnPgU753RMUAjd
 P4EzSQBFBAETZVk1L8mgh7zmqOclzGmTPtuUP0/A5KfqEX2Cgy4nFxOKgqMdpU6gKXxX
 wd/QzGSzoqwA2MJCEGfMsrvH8jD4QTDnse2PwMMwEp08lD8XPL4LiULXD/a1NOR6ilyE
 kyDzu+/kAKumpSS+28C08VOhz+anR6+mBvkO8D5bkxAPo93cG+QVX+DcFGg1hIa8vwXH
 V5pIowbKwlOimUhpEYnGka1MTP0k3/VfTkmpVpZ5PiBsjh8objrxaXvEc7iDe0jIhlO7
 Flmg==
X-Gm-Message-State: ACgBeo1G7NPvbKtHTdDxnV7w9EN8cKT9FYbxvE5oJX0p7jes8nz1WjuZ
 K58ctp2HVM0y5cfWSU9uP4n19QlwUvKX1A==
X-Google-Smtp-Source: AA6agR5/3TycEiwactqvXKhhbsnwVZs0Oou9bn7iQvlDUWlXYF0on1w1SamIWSu8PuhwNdYNCHSc/Q==
X-Received: by 2002:a17:902:ab0b:b0:170:d51c:a667 with SMTP id
 ik11-20020a170902ab0b00b00170d51ca667mr2191975plb.156.1659998009775; 
 Mon, 08 Aug 2022 15:33:29 -0700 (PDT)
Received: from localhost.localdomain ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 t10-20020a170902b20a00b0016d7b225891sm9186940plr.256.2022.08.08.15.33.26
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Mon, 08 Aug 2022 15:33:29 -0700 (PDT)
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>,
 Fabien Chouteau <chouteau@adacore.com>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Frederic Konrad <konrad.frederic@yahoo.fr>,
 Aurelien Jarno <aurelien@aurel32.net>,
 Peter Maydell <peter.maydell@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>
Subject: [PULL 1/3] target/mips: Handle lock_user() failure in UHI_plog
 semihosting call
Date: Tue,  9 Aug 2022 00:33:10 +0200
Message-Id: <20220808223312.53720-2-f4bug@amsat.org>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220808223312.53720-1-f4bug@amsat.org>
References: <20220808223312.53720-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102c;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-pj1-x102c.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
Reply-to:  =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
From:  =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= via <qemu-devel@nongnu.org>

From: Peter Maydell <peter.maydell@linaro.org>

Coverity notes that we forgot to check the error return from
lock_user() in one place in the handling of the UHI_plog semihosting
call.  Add the missing error handling.

report_fault() is rather brutal in that it will call abort(), but
this is the same error-handling used in the rest of this file.

Resolves: Coverity CID 1490684
Fixes: ea4210600db3c5 ("target/mips: Avoid qemu_semihosting_log_out for UHI_plog")
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Message-Id: <20220719191737.384744-1-peter.maydell@linaro.org>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 target/mips/tcg/sysemu/mips-semi.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/target/mips/tcg/sysemu/mips-semi.c b/target/mips/tcg/sysemu/mips-semi.c
index 5fb1ad9092..85f0567a7f 100644
--- a/target/mips/tcg/sysemu/mips-semi.c
+++ b/target/mips/tcg/sysemu/mips-semi.c
@@ -321,6 +321,9 @@ void mips_semihosting(CPUMIPSState *env)
             if (use_gdb_syscalls()) {
                 addr = gpr[29] - str->len;
                 p = lock_user(VERIFY_WRITE, addr, str->len, 0);
+                if (!p) {
+                    report_fault(env);
+                }
                 memcpy(p, str->str, str->len);
                 unlock_user(p, addr, str->len);
                 semihost_sys_write(cs, uhi_cb, 2, addr, str->len);
-- 
2.36.1


