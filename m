Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E58EA64734D
	for <lists+qemu-devel@lfdr.de>; Thu,  8 Dec 2022 16:38:30 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p3IwK-0003SN-TA; Thu, 08 Dec 2022 10:36:00 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1p3IwI-0003Rc-OB
 for qemu-devel@nongnu.org; Thu, 08 Dec 2022 10:35:58 -0500
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1p3IwH-0006Gp-8y
 for qemu-devel@nongnu.org; Thu, 08 Dec 2022 10:35:58 -0500
Received: by mail-wm1-x329.google.com with SMTP id v7so1355680wmn.0
 for <qemu-devel@nongnu.org>; Thu, 08 Dec 2022 07:35:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ZuF4jChtlBjy8dKWVe0vYW0pjpjwZ/qKs1pftyTULhE=;
 b=dO1rVy8a1UmJNv0075+sKdleWJ0ZBR1e/UgGlysFXEGorO8mWuMdwXUEfXsAxNBZ7N
 qNsS71jo9driQdFOJfvuDDoM4z1PHZ8Oy1Jaa/rj+eCYaVzx71FwSeK1ISFeRL7U5KAA
 89Z988n/DMgUtsS5QrNmwOleyUXYykdhU6LzJ7/yXucBtt0FgLSG8R5FXi4EunqQTZRv
 FR/1/EYdxhbIRQU3fsC9yqne/3YvCIye5fAxc7srypsYFoDgrfrnuuB4xMGGf0CPwB/S
 hrw7s4KyxuvIWWGMmRzNxdcZMb+JQ8mMq/6Sy1gp68NQEExE5BHewvPSaX5MrozUllb0
 Lb3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ZuF4jChtlBjy8dKWVe0vYW0pjpjwZ/qKs1pftyTULhE=;
 b=7/y8gHBkOTYTmukj2GG1m9XX8mGvPwNWGJIgAOPsP/KXZ0MzCX7fmUt91GvyY0YrID
 R3JoUtaoeHbvuz6I60yCZGlXbZ5D9dHB/kDmtkZENDctjzZNy8BGxMeDMNQtDMCVAaL7
 8KAeDT3lEm0XK3t1Wgg+uVxDSpDvIPyfc08G63FNfA619Evi2sZbQ80wZoSH6aAIOJDd
 nRB+1gJlz/Kx2ehxT18fuy61M0YIcX34Ww/creI/6Q1dW5tNn4WmchFdu6+imeBwimbP
 NBSG6LX4SSDDCzR3EXRDPxcfxWOAwdWthUuMTJV4ODxMw97wlEDy67ZnWNdIVihQNU3B
 tMeQ==
X-Gm-Message-State: ANoB5pl+uahEskQ7xkMzWBHLerk7SFKyb6+j9WgQJpdZlX/C/idZTzOj
 u3A9B96SP4BrHbuxu8dQcXoLVipD2g6f6YpW2LI=
X-Google-Smtp-Source: AA0mqf6jGRhAbZqyxAoGF7DGrOZx9DCszb4uJRAIqgZjMGG2psmKCgGKAp/AX0U3aU3Jo3ZwbUyGLA==
X-Received: by 2002:a1c:7c15:0:b0:3cf:7197:e67c with SMTP id
 x21-20020a1c7c15000000b003cf7197e67cmr2335687wmc.25.1670513756301; 
 Thu, 08 Dec 2022 07:35:56 -0800 (PST)
Received: from localhost.localdomain ([81.0.6.76])
 by smtp.gmail.com with ESMTPSA id
 16-20020a05600c021000b003d1e4f3ac8esm5089704wmi.33.2022.12.08.07.35.53
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Thu, 08 Dec 2022 07:35:55 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Greg Kurz <groug@kaod.org>, Paolo Bonzini <pbonzini@redhat.com>,
 David Gibson <david@gibson.dropbear.id.au>, kvm@vger.kernel.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Richard Henderson <richard.henderson@linaro.org>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Stafford Horne <shorne@gmail.com>, Anton Johansson <anjo@rev.ng>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>, qemu-ppc@nongnu.org,
 Eduardo Habkost <eduardo@habkost.net>, Chris Wulff <crwulff@gmail.com>,
 Yanan Wang <wangyanan55@huawei.com>, Fabiano Rosas <farosas@linux.ibm.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Marek Vasut <marex@denx.de>, Max Filippov <jcmvbkbc@gmail.com>,
 Yoshinori Sato <ysato@users.sourceforge.jp>,
 Laurent Vivier <laurent@vivier.eu>,
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Artyom Tarasenko <atar4qemu@gmail.com>
Subject: [PATCH-for-8.0 v2 4/4] target/sparc/sysemu: Remove pointless
 CONFIG_USER_ONLY guard
Date: Thu,  8 Dec 2022 16:35:28 +0100
Message-Id: <20221208153528.27238-5-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221208153528.27238-1-philmd@linaro.org>
References: <20221208153528.27238-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::329;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x329.google.com
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


