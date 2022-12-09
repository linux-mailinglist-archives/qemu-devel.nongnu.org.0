Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D9A5648155
	for <lists+qemu-devel@lfdr.de>; Fri,  9 Dec 2022 12:09:01 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p3bF6-0006Bk-8w; Fri, 09 Dec 2022 06:08:36 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1p3bEz-000688-VI
 for qemu-devel@nongnu.org; Fri, 09 Dec 2022 06:08:30 -0500
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1p3bEy-0002mE-DK
 for qemu-devel@nongnu.org; Fri, 09 Dec 2022 06:08:29 -0500
Received: by mail-wm1-x335.google.com with SMTP id v7so3326813wmn.0
 for <qemu-devel@nongnu.org>; Fri, 09 Dec 2022 03:08:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=lg2hbJIGbmmNDLWAHuLeniZDxHEsZyoXVXtfI2RWSI4=;
 b=YQN80jcZki8ydHiJ+d8HtsEK7ScAZqqKP4kQ7f4kh2xRZbXgcYd7zZJpJ0dvLFk4Sl
 OTkg+fbSnPb+sZ55ciOOR/+piOpMrk0mUxN7Mt9MuQnBf0xffdfbBbinU9fnovEDaMMo
 t2ZuIKSnpmfaFnnMIjuOUMTkQ2T4wF9cni2bOpc7UXQP1TpB7I8rGjV7lsxUgIDf5HM4
 0QHpEn+882M+H7EJBSe1TjAKVtqmfBQQUB2+EJSraucaJhvkvJP9Nid0/6qU74ALUZSp
 gNhSKAhOxbhYNVgT7HabN+e7Qv5wtImmF5RP68/5DvseBMAEMnAa5hpzFmivBkaUfyl0
 TF/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=lg2hbJIGbmmNDLWAHuLeniZDxHEsZyoXVXtfI2RWSI4=;
 b=JbuIxbNrkYwHnZwV/cpAfX/fhTdOLbGGKH1NRA73NtqO3rNIkh4jfd+ffHtI5WVPQq
 5uc+8XcG4bC+4bVcQpq5vdX9eL6QH9lE2/eDGD7YFWAhJWNXP6c5aYLVm9w1N6NV5yPF
 T2oK8sBKPUvgLRtrYnjg08WlHM+QDBfRVef4XxASMJ0yUDVeySAls9Ez8zsaJXxW6MvL
 EJ2v5SBiYh654MQsB+a4GE633mYX1QGcimJM4KpaUoQ7POwdD131wR2IUAABXrOtC1sQ
 xWnHP937iAAyM2KJA8MzaNL4WrwZ1oJV3htMktMICclhw/GUxspude2sVjwS0k0aRhZs
 osfg==
X-Gm-Message-State: ANoB5plqa40uwdsxoTkpG75e+g2k4fUgS8S0J3yeNq+WB3ccaV88W47j
 QKoqR9BHfa7X5KY/RPwiTutno0Yu9qTvIg8Y3JY=
X-Google-Smtp-Source: AA0mqf6pYU1wV9sok3+BWnI3maqa8hBKVT2fT9Xq5Wcgre1qbR7RE+BKIndczuOekcuHk3yt7UyMtg==
X-Received: by 2002:a05:600c:3295:b0:3cf:6a51:2e75 with SMTP id
 t21-20020a05600c329500b003cf6a512e75mr4482085wmp.28.1670584105035; 
 Fri, 09 Dec 2022 03:08:25 -0800 (PST)
Received: from localhost.localdomain ([81.0.6.76])
 by smtp.gmail.com with ESMTPSA id
 h5-20020a05600c2ca500b003c6bbe910fdsm9787199wmc.9.2022.12.09.03.08.24
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Fri, 09 Dec 2022 03:08:24 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Fabiano Rosas <farosas@linux.ibm.com>, qemu-arm@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH-for-8.0] target/arm: Restrict arm_cpu_exec_interrupt() to TCG
 accelerator
Date: Fri,  9 Dec 2022 12:08:23 +0100
Message-Id: <20221209110823.59495-1-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::335;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x335.google.com
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

When building with --disable-tcg on Darwin we get:

  target/arm/cpu.c:725:16: error: incomplete definition of type 'struct TCGCPUOps'
    cc->tcg_ops->do_interrupt(cs);
    ~~~~~~~~~~~^

Commit 083afd18a9 ("target/arm: Restrict cpu_exec_interrupt()
handler to sysemu") limited this block to system emulation,
but neglected to also limit it to TCG.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 target/arm/cpu.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/target/arm/cpu.c b/target/arm/cpu.c
index 38d066c294..0f55004d7e 100644
--- a/target/arm/cpu.c
+++ b/target/arm/cpu.c
@@ -528,7 +528,7 @@ static void arm_cpu_reset(DeviceState *dev)
     arm_rebuild_hflags(env);
 }
 
-#ifndef CONFIG_USER_ONLY
+#if defined(CONFIG_TCG) && !defined(CONFIG_USER_ONLY)
 
 static inline bool arm_excp_unmasked(CPUState *cs, unsigned int excp_idx,
                                      unsigned int target_el,
@@ -725,7 +725,8 @@ static bool arm_cpu_exec_interrupt(CPUState *cs, int interrupt_request)
     cc->tcg_ops->do_interrupt(cs);
     return true;
 }
-#endif /* !CONFIG_USER_ONLY */
+
+#endif /* CONFIG_TCG && !CONFIG_USER_ONLY */
 
 void arm_cpu_update_virq(ARMCPU *cpu)
 {
-- 
2.38.1


