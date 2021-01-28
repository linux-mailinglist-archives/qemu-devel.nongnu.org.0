Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 79F06307870
	for <lists+qemu-devel@lfdr.de>; Thu, 28 Jan 2021 15:45:52 +0100 (CET)
Received: from localhost ([::1]:52834 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l58YR-000455-FB
	for lists+qemu-devel@lfdr.de; Thu, 28 Jan 2021 09:45:51 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:45146)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1l58V2-0001Ck-PX
 for qemu-devel@nongnu.org; Thu, 28 Jan 2021 09:42:22 -0500
Received: from mail-ej1-x636.google.com ([2a00:1450:4864:20::636]:40457)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1l58V0-0007T9-Dc
 for qemu-devel@nongnu.org; Thu, 28 Jan 2021 09:42:20 -0500
Received: by mail-ej1-x636.google.com with SMTP id gx5so8107316ejb.7
 for <qemu-devel@nongnu.org>; Thu, 28 Jan 2021 06:42:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=CmTxj82w6c9LkOjct5SouHTai+uMb8a+ssmAiVzlGfc=;
 b=sM350Ra0Kbmtny045lXrjhY62opi9E3q1Mcb5gJyafXCl/CUkHzKQjj1/mtBKXb7P9
 8vwfBJjnq07mdKexu2Uofv04O5eQkkDrEbrBsi/P1/MBxNZg7jKDGu+5OYv6timiQyve
 xpeovl7kY66Bq6VeIuD4YpiEvS0noE/GN9cZl7CU5hRCyKCzto/z/I+z0NZXTYBOIJ1O
 YnkOtUb5vAYE6q7tYtb/xkCUSuNUqZhDG1PPuhk/BGfdjIYX7NSP1NGUAY2CiDjt6yxD
 L2lYkaTKHq49NVbGN4Bh+bElehTd/TZ6mguhGvHSkVEqsS7mmZyL48wsDE7uDmV3hysz
 wqHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=CmTxj82w6c9LkOjct5SouHTai+uMb8a+ssmAiVzlGfc=;
 b=bLZ7I1l9tKhLW/4DWbR+ivywgeTSW9Smhn7FJKWA5lAvNL40j+vpOM1tNkSsIfHRpD
 RGXTH2yWzKgDFAsaZHNrEc5CIJl5oNWvjy0dCwiISvrymaNhlrQ5b/BXnvTtz36xOIWl
 unWcwLPtkyhrtHuu6Fy6NCwNvJ+chVplSEMD3IEC4toiLm+7whdAAe0i3ag9H7wKxeOF
 ABELvAGozsRGCytARwBhpTQanjP/W0u2Zk+G6pP8Vh5Tcfdu4L0LPx3MsLxSBdvNrJut
 tyqqB+e5GMPnQ/pCFEy5QOPPAF7WTcvS1LJQBSG9vfkdzUYFbqpFf0jPKWMw1ttBd7ol
 XNlw==
X-Gm-Message-State: AOAM531sSg8x1ayJ7QIy0O4SbiiNPZW5nuACHq5YvVB5MtvT6PZjza2l
 0qYuMXSfGQEFCGvDubB3YgdVkoH/d8A=
X-Google-Smtp-Source: ABdhPJwK1Gv/vjAiDkzvZaSCK1gEES6nSDqJc2n5cYHx/JM6jB8iM4VyvZ+l6fX6E0obU4vkgAU41Q==
X-Received: by 2002:a17:906:aec1:: with SMTP id
 me1mr11972466ejb.114.1611844936950; 
 Thu, 28 Jan 2021 06:42:16 -0800 (PST)
Received: from x1w.redhat.com (13.red-83-57-169.dynamicip.rima-tde.net.
 [83.57.169.13])
 by smtp.gmail.com with ESMTPSA id p16sm3030245edw.44.2021.01.28.06.42.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 28 Jan 2021 06:42:16 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 09/13] target/mips: Let cpu_mips_translate_address() take
 MMUAccessType arg
Date: Thu, 28 Jan 2021 15:41:21 +0100
Message-Id: <20210128144125.3696119-10-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210128144125.3696119-1-f4bug@amsat.org>
References: <20210128144125.3696119-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::636;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-ej1-x636.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
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
Cc: Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Huacai Chen <chenhuacai@kernel.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Joe Komlodi <komlodi@xilinx.com>, Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The single caller, do_translate_address(), passes MMUAccessType
to cpu_mips_translate_address(). Let the prototype use it as
argument, as it is stricter than an integer.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 target/mips/internal.h   | 2 +-
 target/mips/tlb_helper.c | 6 +++---
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/target/mips/internal.h b/target/mips/internal.h
index d09afded5ea..34915c275c4 100644
--- a/target/mips/internal.h
+++ b/target/mips/internal.h
@@ -146,7 +146,7 @@ void mips_cpu_do_transaction_failed(CPUState *cs, hwaddr physaddr,
                                     int mmu_idx, MemTxAttrs attrs,
                                     MemTxResult response, uintptr_t retaddr);
 hwaddr cpu_mips_translate_address(CPUMIPSState *env, target_ulong address,
-                                  int rw);
+                                  MMUAccessType access_type);
 #endif
 
 #define cpu_signal_handler cpu_mips_signal_handler
diff --git a/target/mips/tlb_helper.c b/target/mips/tlb_helper.c
index afcc269750d..e9c3adeade6 100644
--- a/target/mips/tlb_helper.c
+++ b/target/mips/tlb_helper.c
@@ -903,17 +903,17 @@ bool mips_cpu_tlb_fill(CPUState *cs, vaddr address, int size,
 
 #ifndef CONFIG_USER_ONLY
 hwaddr cpu_mips_translate_address(CPUMIPSState *env, target_ulong address,
-                                  int rw)
+                                  MMUAccessType access_type)
 {
     hwaddr physical;
     int prot;
     int ret = 0;
 
     /* data access */
-    ret = get_physical_address(env, &physical, &prot, address, rw,
+    ret = get_physical_address(env, &physical, &prot, address, access_type,
                                cpu_mmu_index(env, false));
     if (ret != TLBRET_MATCH) {
-        raise_mmu_exception(env, address, rw, ret);
+        raise_mmu_exception(env, address, access_type, ret);
         return -1LL;
     } else {
         return physical;
-- 
2.26.2


