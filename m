Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F1D9F69975C
	for <lists+qemu-devel@lfdr.de>; Thu, 16 Feb 2023 15:26:26 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pSfAu-0005cm-TL; Thu, 16 Feb 2023 09:23:52 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pSfAt-0005c3-2c
 for qemu-devel@nongnu.org; Thu, 16 Feb 2023 09:23:51 -0500
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pSfAp-00079u-Uz
 for qemu-devel@nongnu.org; Thu, 16 Feb 2023 09:23:50 -0500
Received: by mail-wm1-x336.google.com with SMTP id he5so1685699wmb.3
 for <qemu-devel@nongnu.org>; Thu, 16 Feb 2023 06:23:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=JNh8xTJOWod+s7ucBgmNWDci6dZ45Cp+WXSSHvSLoZ8=;
 b=tiUpkAAcnadyQJ+dVkubzde61bStnA0Kbi3UuyGWDQtEL6yLFqrBOH0YNEIXCeG2/M
 Y0ImUy3irOA9xnWN7wtRCpZ9wvqkgEm0ktfjlLCPHuXbNuuM03m9noxAnscZp7byCftz
 /vR0ZVULZUZbxg4dVuJP1WA4lJ04y4gUMi6fmzg4dCoa++Ir2Itb6A4Z06NG3iORGtCh
 24xIw7Hih7PmTbInUMPTtmACsstE5YJ2d8lhm6J54YzCr0gg0lxImnFJ193b3I9YRal7
 07/NOPhzbMMaFH9DORST7s/FRijumX0Ze217GCFHSxg12cxUcDCnKZ7n51Y15njjuil2
 RwUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=JNh8xTJOWod+s7ucBgmNWDci6dZ45Cp+WXSSHvSLoZ8=;
 b=JoW4DFE4ultKkx3mGU2FjCGGsipRWTVhU90LWem4CtcZftjr5xbDZLxr/KaC/2Sj8Q
 diiXCJyznZTEfIlEI4sfJOcaIUn4BW2BD3axTGCp8Ufw42kFvUHzCsbaB1SsV5LyMQML
 4WK3JaOSDo7maZE/tXsDTO+Km1SJw4LOUq/K/XNuPmF/5AsoqNzbk5lRpEKcWOGrhv3C
 puxUcdZByFjs2mlsteOJA/uutMIW2pDUy0qxjT6MMT9VI8WkULpCgMda1ex0Mi5bEbqS
 Vtv3ZzbSjBfVu6rEaT3DdBbWF5odwhbVLlV3Ja3M9GgQabg0SUce8WD6l0xVIqsvzJNe
 8JQQ==
X-Gm-Message-State: AO0yUKUiOVDM5oVtqL5Mkse0Rx3m0MpM8DKmGijyoQeKFZdFgC0C3jR+
 cQofrgJByEHc/PRXVdLmPdo3P2nvaoUsyjgh
X-Google-Smtp-Source: AK7set8/mydYwX5wqEN5PJShPmAcaNUpSAjGQ23UJXmnCPwqodWLrCMYM+/CuCdzsBDiastEQkQulg==
X-Received: by 2002:a05:600c:91d:b0:3e2:668:3ed7 with SMTP id
 m29-20020a05600c091d00b003e206683ed7mr3871662wmp.1.1676557426291; 
 Thu, 16 Feb 2023 06:23:46 -0800 (PST)
Received: from localhost.localdomain ([81.0.6.76])
 by smtp.gmail.com with ESMTPSA id
 p15-20020a7bcdef000000b003e21356bddcsm1966221wmj.33.2023.02.16.06.23.44
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Thu, 16 Feb 2023 06:23:45 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Richard Henderson <richard.henderson@linaro.org>,
 Dapeng Mi <dapeng1.mi@intel.com>, Sean Christopherson <seanjc@google.com>,
 Bin Meng <bin.meng@windriver.com>,
 Zhuocheng Ding <zhuocheng.ding@intel.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Zhenyu Wang <zhenyu.z.wang@intel.com>, qemu-riscv@nongnu.org,
 Alistair Francis <alistair.francis@wdc.com>,
 Zhao Liu <zhao1.liu@intel.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Robert Hoo <robert.hu@linux.intel.com>,
 Yanan Wang <wangyanan55@huawei.com>, qemu-arm@nongnu.org,
 Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, Like Xu <like.xu.linux@gmail.com>,
 Alistair Francis <alistair@alistair23.me>,
 Zhao Liu <zhao1.liu@linux.intel.com>, Eduardo Habkost <eduardo@habkost.net>
Subject: [PATCH 1/5] hw/cpu: Extend CPUState::cluster_index documentation
Date: Thu, 16 Feb 2023 15:23:34 +0100
Message-Id: <20230216142338.82982-2-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230216142338.82982-1-philmd@linaro.org>
References: <20230216142338.82982-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::336;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x336.google.com
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

Copy part of the description of commit f7b78602fd ("accel/tcg:
Add cluster number to TCG TB hash") in tcg_cpu_init_cflags(),
improving a bit CPUState::cluster_index documentation.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 accel/tcg/tcg-accel-ops.c | 13 ++++++++++++-
 include/hw/core/cpu.h     |  2 ++
 2 files changed, 14 insertions(+), 1 deletion(-)

diff --git a/accel/tcg/tcg-accel-ops.c b/accel/tcg/tcg-accel-ops.c
index 19cbf1db3a..654aeec04c 100644
--- a/accel/tcg/tcg-accel-ops.c
+++ b/accel/tcg/tcg-accel-ops.c
@@ -44,7 +44,18 @@
 
 void tcg_cpu_init_cflags(CPUState *cpu, bool parallel)
 {
-    uint32_t cflags = cpu->cluster_index << CF_CLUSTER_SHIFT;
+    uint32_t cflags;
+
+    /*
+     * Include the cluster number in the hash we use to look up TBs.
+     * This is important because a TB that is valid for one cluster at
+     * a given physical address and set of CPU flags is not necessarily
+     * valid for another:
+     * the two clusters may have different views of physical memory, or
+     * may have different CPU features (eg FPU present or absent).
+     */
+    cflags = cpu->cluster_index << CF_CLUSTER_SHIFT;
+
     cflags |= parallel ? CF_PARALLEL : 0;
     cflags |= icount_enabled() ? CF_USE_ICOUNT : 0;
     cpu->tcg_cflags = cflags;
diff --git a/include/hw/core/cpu.h b/include/hw/core/cpu.h
index 2417597236..d427db0bc7 100644
--- a/include/hw/core/cpu.h
+++ b/include/hw/core/cpu.h
@@ -272,6 +272,8 @@ struct qemu_work_item;
  *   to a cluster this will be UNASSIGNED_CLUSTER_INDEX; otherwise it will
  *   be the same as the cluster-id property of the CPU object's TYPE_CPU_CLUSTER
  *   QOM parent.
+ *   Under TCG this value is propagated to @tcg_cflags.
+ *   See TranslationBlock::TCG CF_CLUSTER_MASK.
  * @tcg_cflags: Pre-computed cflags for this cpu.
  * @nr_cores: Number of cores within this CPU package.
  * @nr_threads: Number of threads within this CPU.
-- 
2.38.1


