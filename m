Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A50E56A92F3
	for <lists+qemu-devel@lfdr.de>; Fri,  3 Mar 2023 09:46:45 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pY0zH-00087k-Ma; Fri, 03 Mar 2023 03:41:59 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <palmer@rivosinc.com>)
 id 1pY0zF-000860-8P
 for qemu-devel@nongnu.org; Fri, 03 Mar 2023 03:41:57 -0500
Received: from mail-pl1-x632.google.com ([2607:f8b0:4864:20::632])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <palmer@rivosinc.com>)
 id 1pY0zD-0007l9-ME
 for qemu-devel@nongnu.org; Fri, 03 Mar 2023 03:41:56 -0500
Received: by mail-pl1-x632.google.com with SMTP id i10so1958940plr.9
 for <qemu-devel@nongnu.org>; Fri, 03 Mar 2023 00:41:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rivosinc-com.20210112.gappssmtp.com; s=20210112; t=1677832915;
 h=to:from:cc:content-transfer-encoding:mime-version:references
 :in-reply-to:message-id:date:subject:from:to:cc:subject:date
 :message-id:reply-to;
 bh=fGLjFr3btl6TtpgGulCBgf0V4/Wyfa5gKk1cozGOLoE=;
 b=uYP5zV+rCQ2kp4O5ryJd1dYyaTjcGCJ4Fri3Txw0JO3YKhzoPHmAUeJ+trEIMYGyWE
 hrHPvUhlL7msCiR7OGzMcPmVDAu+lzkhs6RQ1MjNkj8NJ66jMqPimW9R/iVdVZ14+OU5
 7XwjoWrknPE1yBo7sUT2z8j0SclyjbjqRJlahnclHrlsfG7ZSZqFdO5eTylptrZjOC/Q
 VT9uCaJqLM5fMVLLwZaEm7oOp4i+zcJ+G2RD126wclXjA9SecQ8TjfwyDbp55HQ8jJIS
 5512hHUBUzDegFp490+l2zbI+MPMpLoPXht53odKtLpvQro8cbX2sejRaKvJ511h4PXr
 e3dw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1677832915;
 h=to:from:cc:content-transfer-encoding:mime-version:references
 :in-reply-to:message-id:date:subject:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=fGLjFr3btl6TtpgGulCBgf0V4/Wyfa5gKk1cozGOLoE=;
 b=u1jxupiU6k7OaziKM/rxQRrRfwhSqngGi8mnSjzPbmVB3Ia80amk6+RWtWa+8qlRUg
 zDERgG2uivractZVUsOcSitvmrj7H9COX8Tkq6bZedha30Tk46TI3xDZGbuxLp5PrRRt
 seQqaIIVQcPPdI23gACoH+3hTV9mpG6uSwcRu2a3hH/FuFtb1wWONZn2iRlWN7vdCNPG
 npMnc6FbiZrHolDAjezX8dvkzqkOGpiCdpl/bQrTh7MH7KB6juEb4xTya43nvJ0RspIM
 /TRaAS1vbj91NRO3GlqPzXJ9T6B4A0xji/JUWuoj1vo0suYK2bjP99zgG8aub76Stut1
 zi0g==
X-Gm-Message-State: AO0yUKXHDot28Qv5lRQxDd5cLjxCevxK86gR5vkwdK2UUc0oqxHSkgQU
 nSrvOYHEEHxemdwuTyGGzzpUBA==
X-Google-Smtp-Source: AK7set+14tkEpA9JDNTQbo3XrPbLXncfatzqDkQqTirip0+znyoNu931pV0ZRDTSSKx6W82zpEuxQA==
X-Received: by 2002:a05:6a21:6da9:b0:c7:73ad:1071 with SMTP id
 wl41-20020a056a216da900b000c773ad1071mr1919025pzb.14.1677832914987; 
 Fri, 03 Mar 2023 00:41:54 -0800 (PST)
Received: from localhost ([135.180.224.71]) by smtp.gmail.com with ESMTPSA id
 25-20020aa79259000000b005d866d184b5sm1033003pfp.46.2023.03.03.00.41.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 03 Mar 2023 00:41:54 -0800 (PST)
Subject: [PULL 27/59] target/riscv: Use g_assert() for the predicate() NULL
 check
Date: Fri,  3 Mar 2023 00:37:08 -0800
Message-Id: <20230303083740.12817-28-palmer@rivosinc.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230303083740.12817-1-palmer@rivosinc.com>
References: <20230303083740.12817-1-palmer@rivosinc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: qemu-riscv@nongnu.org,          qemu-devel@nongnu.org,
 Bin Meng <bmeng@tinylab.org>, Weiwei Li <liweiwei@iscas.ac.cn>,
 Palmer Dabbelt <palmer@rivosinc.com>
From: Palmer Dabbelt <palmer@rivosinc.com>
To: Peter Maydell <peter.maydell@linaro.org>
Received-SPF: pass client-ip=2607:f8b0:4864:20::632;
 envelope-from=palmer@rivosinc.com; helo=mail-pl1-x632.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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

From: Bin Meng <bmeng@tinylab.org>

At present riscv_csrrw_check() checks the CSR predicate() against
NULL and throws RISCV_EXCP_ILLEGAL_INST if it is NULL. But this is
a pure software check, and has nothing to do with the emulation of
the hardware behavior, thus it is inappropriate to return illegal
instruction exception when software forgets to install the hook.

Change to use g_assert() instead.

Signed-off-by: Bin Meng <bmeng@tinylab.org>
Reviewed-by: Weiwei Li<liweiwei@iscas.ac.cn>
Message-ID: <20230228104035.1879882-4-bmeng@tinylab.org>
Signed-off-by: Palmer Dabbelt <palmer@rivosinc.com>
---
 target/riscv/csr.c | 6 +-----
 1 file changed, 1 insertion(+), 5 deletions(-)

diff --git a/target/riscv/csr.c b/target/riscv/csr.c
index 4cc2c6370f..cfd7ffc5c2 100644
--- a/target/riscv/csr.c
+++ b/target/riscv/csr.c
@@ -3786,11 +3786,6 @@ static inline RISCVException riscv_csrrw_check(CPURISCVState *env,
         return RISCV_EXCP_ILLEGAL_INST;
     }
 
-    /* check predicate */
-    if (!csr_ops[csrno].predicate) {
-        return RISCV_EXCP_ILLEGAL_INST;
-    }
-
     /* read / write check */
     if (write_mask && read_only) {
         return RISCV_EXCP_ILLEGAL_INST;
@@ -3803,6 +3798,7 @@ static inline RISCVException riscv_csrrw_check(CPURISCVState *env,
      * illegal instruction exception should be triggered instead of virtual
      * instruction exception. Hence this comes after the read / write check.
      */
+    g_assert(csr_ops[csrno].predicate != NULL);
     RISCVException ret = csr_ops[csrno].predicate(env, csrno);
     if (ret != RISCV_EXCP_NONE) {
         return ret;
-- 
2.39.2


