Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D251320B22
	for <lists+qemu-devel@lfdr.de>; Sun, 21 Feb 2021 15:53:31 +0100 (CET)
Received: from localhost ([::1]:49208 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lDq6z-0003jg-VU
	for lists+qemu-devel@lfdr.de; Sun, 21 Feb 2021 09:53:30 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:33426)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lDpps-0006cx-8X
 for qemu-devel@nongnu.org; Sun, 21 Feb 2021 09:35:49 -0500
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434]:32839)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lDppq-0002qq-AZ
 for qemu-devel@nongnu.org; Sun, 21 Feb 2021 09:35:47 -0500
Received: by mail-wr1-x434.google.com with SMTP id 7so16361420wrz.0
 for <qemu-devel@nongnu.org>; Sun, 21 Feb 2021 06:35:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=rkRbXmPS0Gpk9tVt7dCY7HZiKmDYtTUDDEqCizKmF24=;
 b=a7bzSKi10IC4hzs4086tFw6cCQf6pSHz07l7F/BJQ/221IK8uAYQB0mEeIghUxb0yE
 KlXl4F2QPzqvbx9QjG62wA9tlezIaTjWfNI+cfLut0a0hgAG9cGH2olMJhJFIoQJOueX
 wvrPrzdHWVlg1FzBEhKFBhAYJZ/C4jgq9CV0GkwSx6Tvb5BJyyLNK/1YD6z9dQsjr4DO
 g8kpTO170VJzElIJYij3nwrFvsj2wIS/RrDT+yIv52fiNEmR9jnl3st9MukCcWXFARad
 IMjV83I25AG475zorzA74GDa7QaguZvvWpnq1bWId14eDNIke5eH8/zhcdUyji+7qYKX
 GyPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=rkRbXmPS0Gpk9tVt7dCY7HZiKmDYtTUDDEqCizKmF24=;
 b=aFQfr10ZJi972xEO/amKtCpYINZnKZ4oa87ax/N5klbguvz6X0ivUhwaE0naIcbjRo
 DqQ2k0ZluZMk8DTO3MiklgDK5+h7XZLCxiJbtDCFxPAkjuVWtJM1E/f13nx00DJXIjts
 d6oipdMpDkzenRm/w2WTzbQuqOUvzOMWeY5OSTKTTvU8/Iq+lkv5fFgMWlTQfiMuAutG
 dneOv+X7yWkxX256jqnIebCG8b8shlX3uhEwMj7hxYB6gHQbY9GbasUCSQiq7jC5bS+S
 9OAIPgjrzxUKfYK+3uXMlY2RPJz1hGEl5vaUP2aNM6GZEeU7OGkyZ3mEm6N7A9vUOu53
 4Jrw==
X-Gm-Message-State: AOAM533Z74KE+7cCAHzX1xuBbNjJgEYe2U32SQ97b9gw4+lSfRRSwlbZ
 gbnXZtY5OfPf4O2ErZK+his3QJJiCug=
X-Google-Smtp-Source: ABdhPJz3KzKC+ragn0DGqITOboqPNO1rZwyJFV+JnI6ThU5njbP9Y5gMMsh4YzwWKT7Nq5rzLDxE3Q==
X-Received: by 2002:adf:e7c4:: with SMTP id e4mr15805778wrn.167.1613918144068; 
 Sun, 21 Feb 2021 06:35:44 -0800 (PST)
Received: from localhost.localdomain (68.red-83-57-175.dynamicip.rima-tde.net.
 [83.57.175.68])
 by smtp.gmail.com with ESMTPSA id g1sm24772365wrq.30.2021.02.21.06.35.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 21 Feb 2021 06:35:43 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PULL 14/43] target/mips: Replace magic value by MMU_DATA_LOAD
 definition
Date: Sun, 21 Feb 2021 15:34:03 +0100
Message-Id: <20210221143432.2468220-15-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210221143432.2468220-1-f4bug@amsat.org>
References: <20210221143432.2468220-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::434;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x434.google.com
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
Cc: Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Paul Burton <paulburton@kernel.org>, "Michael S. Tsirkin" <mst@redhat.com>,
 Huacai Chen <chenhuacai@kernel.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Cleber Rosa <crosa@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
Message-Id: <20210128144125.3696119-7-f4bug@amsat.org>
---
 target/mips/op_helper.c  | 2 +-
 target/mips/tlb_helper.c | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/target/mips/op_helper.c b/target/mips/op_helper.c
index 89c7d4556a0..9fce0194b3e 100644
--- a/target/mips/op_helper.c
+++ b/target/mips/op_helper.c
@@ -312,7 +312,7 @@ target_ulong helper_##name(CPUMIPSState *env, target_ulong arg, int mem_idx)  \
         }                                                                     \
         do_raise_exception(env, EXCP_AdEL, GETPC());                          \
     }                                                                         \
-    env->CP0_LLAddr = do_translate_address(env, arg, 0, GETPC());             \
+    env->CP0_LLAddr = do_translate_address(env, arg, MMU_DATA_LOAD, GETPC()); \
     env->lladdr = arg;                                                        \
     env->llval = do_cast cpu_##insn##_mmuidx_ra(env, arg, mem_idx, GETPC());  \
     return env->llval;                                                        \
diff --git a/target/mips/tlb_helper.c b/target/mips/tlb_helper.c
index c9535b7f72f..9216c7a91b3 100644
--- a/target/mips/tlb_helper.c
+++ b/target/mips/tlb_helper.c
@@ -492,7 +492,7 @@ hwaddr mips_cpu_get_phys_page_debug(CPUState *cs, vaddr addr)
     hwaddr phys_addr;
     int prot;
 
-    if (get_physical_address(env, &phys_addr, &prot, addr, 0,
+    if (get_physical_address(env, &phys_addr, &prot, addr, MMU_DATA_LOAD,
                              cpu_mmu_index(env, false)) != 0) {
         return -1;
     }
-- 
2.26.2


