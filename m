Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 170F864607B
	for <lists+qemu-devel@lfdr.de>; Wed,  7 Dec 2022 18:43:20 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p2yQk-0004oR-Rs; Wed, 07 Dec 2022 12:42:02 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1p2yQi-0004nb-5s
 for qemu-devel@nongnu.org; Wed, 07 Dec 2022 12:42:00 -0500
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1p2yQf-0001qO-P5
 for qemu-devel@nongnu.org; Wed, 07 Dec 2022 12:41:59 -0500
Received: by mail-wm1-x333.google.com with SMTP id
 h8-20020a1c2108000000b003d1efd60b65so1583425wmh.0
 for <qemu-devel@nongnu.org>; Wed, 07 Dec 2022 09:41:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ZuF4jChtlBjy8dKWVe0vYW0pjpjwZ/qKs1pftyTULhE=;
 b=SWdz9S6GTpIenAcILzP3y+oCJ/lzotkU8ZgyPSAEvGhy4ywM2Z9mP6ZcAQk648axNz
 s8DaHB1Pr6WSeSHn50RQOFPmG+xRqPkNqRLpstUvbPTAb/OWgljplMqudc0K009kzEzp
 XN/JF1vtuvwpXD9Fjtza+ac6wA+6jP5A/huFwQwsKWkk/Nf9QCdTYXgR5U+Rha8x+RfS
 y125jO09kT3gwHy9I8TVcsXXcmkw4RT56HVQ/hmzeTSamWXH3ie69TjxOI7LI2uf8mmM
 w6oMRgGI6Yx3HWH3GFSADPSR0JhTD9zoDcnue9tyvwU13g5yW5D8g3TamIELD4zA4lDT
 WU2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ZuF4jChtlBjy8dKWVe0vYW0pjpjwZ/qKs1pftyTULhE=;
 b=drUWlHXCpEzHq/Q0qkasDY2PpnoE6ot1gIr90UCfVFTQ5Yx1vS0BKCOwCOgBURiPdo
 btt0+HA8xv6WBEq+jp10LLB7T8wpILMHs3pcUAGpN5ivsw0gVNwbiX02oJbNUAaU2wfe
 qqP/kGkLpYbtsLokqD7bwKM2JC7i3H3+pNOTH40DDci67PrVSDCGyhzFoHn7NUXYce9W
 EOvqLgad0dGdDTLgtt9GqZ/5ViindpGK9wjWKbLK/XAD5568Fcwh0QHgB7+FAZIKLPUH
 BfiHUO/+z7E/LSsvb0rgxrANboFvidOzxyRvMHfv5Vn0tTKnaWOclSNdeUJuKbsh+52d
 voYA==
X-Gm-Message-State: ANoB5plBywfsjV2dcGZxdQxWvONwh6KMZbRwVG7H+DyEJi/b/5hwKQIf
 vMMC0zvDIJZ5rx/3ciD6H7nVgqoYliOni2ik4qQ=
X-Google-Smtp-Source: AA0mqf5NEUZJ+Ic35k42n8JSQpTo4xgjqzw/oUBWagKHR7ZAISkiph5pwC/V13IGSV43+XPP/88NGA==
X-Received: by 2002:a7b:cd18:0:b0:3cf:a359:de90 with SMTP id
 f24-20020a7bcd18000000b003cfa359de90mr57232322wmj.122.1670434915922; 
 Wed, 07 Dec 2022 09:41:55 -0800 (PST)
Received: from localhost.localdomain ([81.0.6.76])
 by smtp.gmail.com with ESMTPSA id
 b40-20020a05600c4aa800b003cf6a55d8e8sm2317046wmp.7.2022.12.07.09.41.54
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Wed, 07 Dec 2022 09:41:55 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Eduardo Habkost <eduardo@habkost.net>, Stafford Horne <shorne@gmail.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Yoshinori Sato <ysato@users.sourceforge.jp>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Marek Vasut <marex@denx.de>, Laurent Vivier <laurent@vivier.eu>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 Yanan Wang <wangyanan55@huawei.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Fabiano Rosas <farosas@linux.ibm.com>,
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Max Filippov <jcmvbkbc@gmail.com>, Greg Kurz <groug@kaod.org>,
 Artyom Tarasenko <atar4qemu@gmail.com>, Anton Johansson <anjo@rev.ng>,
 qemu-ppc@nongnu.org, Chris Wulff <crwulff@gmail.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 David Gibson <david@gibson.dropbear.id.au>
Subject: [PATCH-for-8.0 4/4] target/sparc: Cleanup around
 sparc_cpu_do_unaligned_access()
Date: Wed,  7 Dec 2022 18:41:29 +0100
Message-Id: <20221207174129.77593-5-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221207174129.77593-1-philmd@linaro.org>
References: <20221207174129.77593-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::333;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x333.google.com
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


