Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 15AB464F3C5
	for <lists+qemu-devel@lfdr.de>; Fri, 16 Dec 2022 23:12:08 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p6Iqx-0000o1-5i; Fri, 16 Dec 2022 17:06:51 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1p6Iqu-0000k3-MR
 for qemu-devel@nongnu.org; Fri, 16 Dec 2022 17:06:48 -0500
Received: from mail-ej1-x635.google.com ([2a00:1450:4864:20::635])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1p6Iqr-0005q9-Q6
 for qemu-devel@nongnu.org; Fri, 16 Dec 2022 17:06:48 -0500
Received: by mail-ej1-x635.google.com with SMTP id fc4so9189337ejc.12
 for <qemu-devel@nongnu.org>; Fri, 16 Dec 2022 14:06:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=wk4kZcMMisFWgQ9gHzikpbBAxoBtm1ZzojbUpYahP3s=;
 b=Q3sgZ7rQrMzBb/RIxySP1zj9kYQfTbiDe1cSn4f2jtocd/6ABwK3M5MPvKUNQGH+C6
 62sOG5Ulab0flFBoyAkvalhOK0IYAaPKYQmhcW304n6mb1W+7BDaLN2UtWcwrtm0Rs31
 mR4fO+lA9CTVRVyKOClXEJPCmUzsbr6g/n11ALE0ziscTabzOq9EZnE84dKrKlcHssNU
 +qW2481DlkJFvbhMosTtiqjzwOhTXpZM4q3VegC6/rnqDhnfXbTpWAm1qjao90iaz+z3
 Agh2fcBafOc6kYbvwhZ18Dvxiv/fCkLy4V+WmT4UThT6R7ekeSQFIykp1fQnM17Q3DS8
 0m7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=wk4kZcMMisFWgQ9gHzikpbBAxoBtm1ZzojbUpYahP3s=;
 b=KbHaxCX21o1ZzKVJMQwvbU4nS+BieXe/A5XBPKNweca7qxKyEnjmwY8MzUcDueMrWq
 vIAqYYqbVQTYFzL/5GwmeNxtvVHKq4HuN611rHqpK9ldufdtxQMZfx8UEeapwpjzwSM2
 NwvIKmhi4JU9UHK0kqBNoSisDQ0FbjuXjibEuvhvnmuDh66uSOjWBjX2x7wCY4kcY8ma
 rmaS2fOxxDd6H926+eozKUdkXqACTG22vFforKhtClYtfdGhKlkvhTt2VwYx1O3O9f+W
 oSQhUp8RYTJxlpVFhD0wn29DmRnVmfi2UH5K8DtfSJBaQLNHA0czzviD19k95smdPj6u
 loPg==
X-Gm-Message-State: ANoB5pl27uU8AXUx9Cj3BXQ8rM/vS1LyOXOxxFKYBMND60bBDKVj+ZrE
 aWQ6xP1ylRNL8QZbvgrhFO46GtlX2LlJelxYQjw=
X-Google-Smtp-Source: AA0mqf7oxSerSXd7GJtrkHazbSNwqf8jEBflJVa77EdPZ0/aDuFvCs5DKYcPWKTGzyA0fZBeQUbHMQ==
X-Received: by 2002:a17:906:2345:b0:7ad:9455:d57d with SMTP id
 m5-20020a170906234500b007ad9455d57dmr28429721eja.74.1671228403801; 
 Fri, 16 Dec 2022 14:06:43 -0800 (PST)
Received: from localhost.localdomain ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 f3-20020a17090631c300b007c0f2d051f4sm1265763ejf.203.2022.12.16.14.06.41
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Fri, 16 Dec 2022 14:06:43 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Daniel Henrique Barboza <danielhb413@gmail.com>,
 David Gibson <david@gibson.dropbear.id.au>,
 Xiaojuan Yang <yangxiaojuan@loongson.cn>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Bin Meng <bin.meng@windriver.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Artyom Tarasenko <atar4qemu@gmail.com>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 Song Gao <gaosong@loongson.cn>,
 Alistair Francis <alistair.francis@wdc.com>, qemu-ppc@nongnu.org,
 Laurent Vivier <laurent@vivier.eu>, Palmer Dabbelt <palmer@dabbelt.com>,
 Taylor Simpson <tsimpson@quicinc.com>, Greg Kurz <groug@kaod.org>,
 qemu-riscv@nongnu.org, Max Filippov <jcmvbkbc@gmail.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH 09/10] target/sparc/sysemu: Remove pointless CONFIG_USER_ONLY
 guard
Date: Fri, 16 Dec 2022 23:05:38 +0100
Message-Id: <20221216220539.7065-10-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221216220539.7065-1-philmd@linaro.org>
References: <20221216220539.7065-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::635;
 envelope-from=philmd@linaro.org; helo=mail-ej1-x635.google.com
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


