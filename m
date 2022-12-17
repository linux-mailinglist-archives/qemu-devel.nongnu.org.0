Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DB87464FB50
	for <lists+qemu-devel@lfdr.de>; Sat, 17 Dec 2022 18:34:14 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p6b1n-0003On-RW; Sat, 17 Dec 2022 12:31:15 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1p6b18-00030B-Oj
 for qemu-devel@nongnu.org; Sat, 17 Dec 2022 12:30:50 -0500
Received: from mail-ed1-x530.google.com ([2a00:1450:4864:20::530])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1p6b17-0002e0-BA
 for qemu-devel@nongnu.org; Sat, 17 Dec 2022 12:30:34 -0500
Received: by mail-ed1-x530.google.com with SMTP id v8so7702759edi.3
 for <qemu-devel@nongnu.org>; Sat, 17 Dec 2022 09:30:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=wk4kZcMMisFWgQ9gHzikpbBAxoBtm1ZzojbUpYahP3s=;
 b=FImUCwLooRkHMftIyWdZtUzg3r8gzuJWqATacIo/a2IHDL0VlPpzbNKh0Kqs9s//2A
 fiP77CgQeRNYTkHkiuW3xwUS+sUpvFx+7mh85VdTesGbMR4QkiZFv46f8Ks5zk4Q5F4d
 QPybhshBSKIJ+vFo3Nj3N1cRIfpicTXB0/4OTp+RomhSGV6mF2ixV80MOvF+IKEN/G+6
 4zGKPlBttrdio1Bc1yZoKEOoGwEuLXQ8updTxegKSJbLXP9tD4ULjvDEB1DwTysTttU2
 X5mJmPFqdxLwZE/XR0BdiSNAH6iH/Nk6gk/XXyCnRlUnFOnuffr0OhX8KGJpdb/sp1un
 wgGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=wk4kZcMMisFWgQ9gHzikpbBAxoBtm1ZzojbUpYahP3s=;
 b=2GvGt3wSxfl9d/Dy6peZBquUxEF/KEeyEeQP3mZSJbD5Hs3ghNjKcLsvpzrf32LMru
 DpVdI9/5KHGs0Du3MftuICJKv+Y381lyLDs/P5v4eNysIODGarNb0TZF5RnTvuciH0Wg
 qPw+dVe1RRSFRZE9NNMXw37TdVuJkB5XvjduB89uqodylkV2ZEAypD//yOT0rSRFf1XU
 FRK1huApdhh0vRd+XdN/ly9xypcWR/02OT1xpd1YBDC0ux2QENkQqqcRIjyjjevjOfSO
 3BXaoMOhU5QP1NE2TNnzJ57x4THX6yvrZnFY7R0aDtWJ5TZysIGP0e/CTZPm7IZN2ZKq
 ZneQ==
X-Gm-Message-State: ANoB5plI435GAmzMe+th1nvMZDd0UnyOdlqBpHCpIZLlDNJ470dDp6TC
 BJ6U4VdwgwN0FG2MmHPtC4gPDj0dMKzRl2htu3M=
X-Google-Smtp-Source: AA0mqf45QvH8X+0lM3DBpfMGzi/ctagLAILTTUMSvXtML7RQSQ2VFLjDj82fDwwY5MebVnBd+5tA5g==
X-Received: by 2002:a05:6402:548c:b0:461:6f87:20be with SMTP id
 fg12-20020a056402548c00b004616f8720bemr27829816edb.41.1671298232467; 
 Sat, 17 Dec 2022 09:30:32 -0800 (PST)
Received: from localhost.localdomain ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 z7-20020aa7d407000000b0046b531fcf9fsm2196443edq.59.2022.12.17.09.30.23
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Sat, 17 Dec 2022 09:30:31 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Max Filippov <jcmvbkbc@gmail.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Bin Meng <bin.meng@windriver.com>, kvm@vger.kernel.org,
 qemu-ppc@nongnu.org, Greg Kurz <groug@kaod.org>,
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 Bernhard Beschow <shentey@gmail.com>, qemu-riscv@nongnu.org,
 Song Gao <gaosong@loongson.cn>, Artyom Tarasenko <atar4qemu@gmail.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Laurent Vivier <laurent@vivier.eu>,
 Alistair Francis <alistair.francis@wdc.com>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 David Gibson <david@gibson.dropbear.id.au>,
 Xiaojuan Yang <yangxiaojuan@loongson.cn>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH v2 8/9] target/sparc/sysemu: Remove pointless CONFIG_USER_ONLY
 guard
Date: Sat, 17 Dec 2022 18:29:06 +0100
Message-Id: <20221217172907.8364-9-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221217172907.8364-1-philmd@linaro.org>
References: <20221217172907.8364-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::530;
 envelope-from=philmd@linaro.org; helo=mail-ed1-x530.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

Commit caac44a52a ("target/sparc: Make sparc_cpu_tlb_fill sysemu
only") restricted mmu_helper.c to system emulation. Checking
whether CONFIG_USER_ONLY is defined is now pointless.

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 target/sparc/mmu_helper.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/target/sparc/mmu_helper.c b/target/sparc/mmu_helper.c
index 919448a494..a7e51e4b7d 100644
--- a/target/sparc/mmu_helper.c
+++ b/target/sparc/mmu_helper.c
@@ -924,7 +924,6 @@ hwaddr sparc_cpu_get_phys_page_debug(CPUState *cs, vaddr addr)
     return phys_addr;
 }
 
-#ifndef CONFIG_USER_ONLY
 G_NORETURN void sparc_cpu_do_unaligned_access(CPUState *cs, vaddr addr,
                                               MMUAccessType access_type,
                                               int mmu_idx,
@@ -942,4 +941,3 @@ G_NORETURN void sparc_cpu_do_unaligned_access(CPUState *cs, vaddr addr,
 
     cpu_raise_exception_ra(env, TT_UNALIGNED, retaddr);
 }
-#endif /* !CONFIG_USER_ONLY */
-- 
2.38.1


