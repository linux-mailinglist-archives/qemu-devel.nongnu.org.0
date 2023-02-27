Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C45486A43C8
	for <lists+qemu-devel@lfdr.de>; Mon, 27 Feb 2023 15:08:57 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pWe69-0007Aq-P0; Mon, 27 Feb 2023 09:03:25 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pWe5x-0006vw-6t
 for qemu-devel@nongnu.org; Mon, 27 Feb 2023 09:03:15 -0500
Received: from mail-lf1-x134.google.com ([2a00:1450:4864:20::134])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pWe5t-0007oi-US
 for qemu-devel@nongnu.org; Mon, 27 Feb 2023 09:03:12 -0500
Received: by mail-lf1-x134.google.com with SMTP id t11so8708221lfr.1
 for <qemu-devel@nongnu.org>; Mon, 27 Feb 2023 06:03:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=qzq0cAFz/OvWPTXETUgRuS+JIwKOxMmsAnQXufewz8Q=;
 b=jZMBEVgZHYpvDDDZDD3+rLVeBwpviInD7suyeE0MJJ+tCeiAXzHoorE+azOkoI3ofA
 0IzlfyZqaMeZ/wnty5sY11yz65O0qXNPMqc5xaXIUJjjlJfgNByn2nldGjmAWAC/3I2s
 XPJ72on+LJJkPLN4qfzastSxwzV6EXjJ8ZovHJv32T1d9+t6mOlcXi8oLWJsvC9e2IhX
 pKSM4y1EE/phSGNFw2mwlSWUzw9pTY9c1cPonoqqbRez1RzN/ZbfeLuKQcNaisQ9CmRc
 C8fM+moGPloycHk8NghAlwYh2ZEE3sFIq6lpUh4pW1VKUo0eFMD2DCHoWyKt7a4MkVoB
 pgRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=qzq0cAFz/OvWPTXETUgRuS+JIwKOxMmsAnQXufewz8Q=;
 b=NkX28begoch0VbjhDaDJS+NZN3HpKhSN426S6pWgPIsE2vk/1e18HgOoHQz5Z1GrJP
 Wp/39wRHAp7GnSW4vH61XCWYqHjvzshU1kP7aSqkzAvRma80duEig44OWaYn+x7mwOZU
 rDYmP3zk59KmVb+G41nXDgNhyA+OUDOCuu89QyYVWHIecnhJx0Vy/AEmYWnUchXOvHj/
 Gy+gy5rdtt7XZw6CSeZ2vHs5thKQ+Kcpm+1OCmqB1e0YwjHltXF3rwzC6jGDRKzKMkCN
 oEiLj7E+MTejwqGGHC213589yfMCa9WH1pnPtkE/iEkKS77v1pkwXWPUg1dVJgmhZNpO
 97Sw==
X-Gm-Message-State: AO0yUKUB2QZ71EGUR+XPh1kl1ox2kHvJFE5GPHXepD7ieO3WJpFoOZ9a
 OVtJmpx9HaTunvu7vYcQUQH7IKYJKqtD37GX
X-Google-Smtp-Source: AK7set+7a5JtJo8nQQTp4qADXO6CbvxfBGXfuxRfWv1ooO4WNGT4eIMruCCQcfp/BpFAl7dM3ApoMg==
X-Received: by 2002:ac2:5623:0:b0:4b6:f08e:1196 with SMTP id
 b3-20020ac25623000000b004b6f08e1196mr8648362lff.11.1677506587358; 
 Mon, 27 Feb 2023 06:03:07 -0800 (PST)
Received: from localhost.localdomain ([81.0.6.76])
 by smtp.gmail.com with ESMTPSA id
 d8-20020a05600c34c800b003dc4480df80sm13617161wmq.34.2023.02.27.06.03.06
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Mon, 27 Feb 2023 06:03:06 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 019/126] target/sparc/sysemu: Remove pointless CONFIG_USER_ONLY
 guard
Date: Mon, 27 Feb 2023 15:00:26 +0100
Message-Id: <20230227140213.35084-10-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230227140213.35084-1-philmd@linaro.org>
References: <20230227140213.35084-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::134;
 envelope-from=philmd@linaro.org; helo=mail-lf1-x134.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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

Commit caac44a52a ("target/sparc: Make sparc_cpu_tlb_fill sysemu
only") restricted mmu_helper.c to system emulation. Checking
whether CONFIG_USER_ONLY is defined is now pointless.

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Message-Id: <20221217172907.8364-9-philmd@linaro.org>
---
 target/sparc/mmu_helper.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/target/sparc/mmu_helper.c b/target/sparc/mmu_helper.c
index 158ec2ae8f..6e7f46f847 100644
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


