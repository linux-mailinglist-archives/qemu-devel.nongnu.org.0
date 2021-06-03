Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A77439A5D4
	for <lists+qemu-devel@lfdr.de>; Thu,  3 Jun 2021 18:36:30 +0200 (CEST)
Received: from localhost ([::1]:57660 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1loqKb-00024K-7d
	for lists+qemu-devel@lfdr.de; Thu, 03 Jun 2021 12:36:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36002)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lopl4-0001k1-KE
 for qemu-devel@nongnu.org; Thu, 03 Jun 2021 11:59:46 -0400
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e]:39703)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lopl1-0007Gt-TN
 for qemu-devel@nongnu.org; Thu, 03 Jun 2021 11:59:46 -0400
Received: by mail-wr1-x42e.google.com with SMTP id l2so6391798wrw.6
 for <qemu-devel@nongnu.org>; Thu, 03 Jun 2021 08:59:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=3PfyOcvq1w6hCVD63GrC8BHoocc1N1VvGMbNNUzkllA=;
 b=aDzczgryLDAFLWmtR9g4liN5IGG3wWLeRpfhX+wdK3WQNU8oaSSDDwX66KcOFbrUCh
 DWk57Lxt5vJAEQjSIoiwWwUSGenL6zqHz8o1CN4fCTAKZMeYJ1CtPnZtJn+TWVivtyzU
 2/wEPRDfmzbybeBZJXCxL9T9EbgiPtmqCoTezD9vYwvFdWkLzsA/28gRQ+q23LQWWobN
 AzzoaAkEvpk1yYO7vfZ2JPw+v9jZx2rfDgU7V195tCn2youRIdXs+3KU2lyCXa+xKU+R
 9B9DCbF0iRxjPEsTi8lKp1D5y8Nx5SDav4gdK3hH47vxqeEZYDN0GfEnmmhrOHNjuDs/
 gtgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=3PfyOcvq1w6hCVD63GrC8BHoocc1N1VvGMbNNUzkllA=;
 b=tpgb1J6NEvu+8taMeQlZ5p+k/X6oRO8fO2hyzROe+QQNh9Py0tNYVBCl5lRrbuclrl
 8UvOxodB0cnnIQ8gd1y7oBGqOqattnSIpGVS3JZ8C5V9aS6uSPtC3wsMI6VuYubC6AzR
 H9oTzTSlfMrtO3Lr/SSIellebnQkIEW8k7yYR6wGPTOPox/USO2jf41k5u2si8pCDmrr
 4PsCQW5qModCsKs5r2Qlvy+LPrqdxAhKWxe5K/pEIoyZij/x7NpQYiwSrqK+VtcPtsBA
 vCwN4oIGNFU34wMrnp+VQuN4PePLlGuZ91qzyA4Pdw9smA3w5nzWFpd/iOQkXQpZ8udo
 u3vg==
X-Gm-Message-State: AOAM533yexIbYpbeGyK+gHhIDnHxyDX1rC3hnlxcKq9/2KlTVJfqmY6j
 nZIYaoLqBGrKR36jnAwIY/MsrbrMsmQ35nkV
X-Google-Smtp-Source: ABdhPJzu/PbNwKZqbtmJOYAotRd5dWftFE4MX8S+umF1STtZdzUb8qAJVRd6iihEqPMGA2/VFYE7aA==
X-Received: by 2002:a5d:46cb:: with SMTP id g11mr646531wrs.418.1622735982639; 
 Thu, 03 Jun 2021 08:59:42 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id m7sm3856470wrv.35.2021.06.03.08.59.42
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 03 Jun 2021 08:59:42 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 36/45] hvf: Make synchronize functions static
Date: Thu,  3 Jun 2021 16:58:55 +0100
Message-Id: <20210603155904.26021-37-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210603155904.26021-1-peter.maydell@linaro.org>
References: <20210603155904.26021-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42e;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x42e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Alexander Graf <agraf@csgraf.de>

The hvf accel synchronize functions are only used as input for local
callback functions, so we can make them static.

Signed-off-by: Alexander Graf <agraf@csgraf.de>
Reviewed-by: Sergio Lopez <slp@redhat.com>
Message-id: 20210519202253.76782-10-agraf@csgraf.de
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 accel/hvf/hvf-accel-ops.h | 3 ---
 accel/hvf/hvf-accel-ops.c | 6 +++---
 2 files changed, 3 insertions(+), 6 deletions(-)

diff --git a/accel/hvf/hvf-accel-ops.h b/accel/hvf/hvf-accel-ops.h
index f6192b56f0c..018a4e22f6d 100644
--- a/accel/hvf/hvf-accel-ops.h
+++ b/accel/hvf/hvf-accel-ops.h
@@ -13,8 +13,5 @@
 #include "sysemu/cpus.h"
 
 int hvf_vcpu_exec(CPUState *);
-void hvf_cpu_synchronize_post_reset(CPUState *);
-void hvf_cpu_synchronize_post_init(CPUState *);
-void hvf_cpu_synchronize_pre_loadvm(CPUState *);
 
 #endif /* HVF_CPUS_H */
diff --git a/accel/hvf/hvf-accel-ops.c b/accel/hvf/hvf-accel-ops.c
index 3b599ac57ce..69741ce7081 100644
--- a/accel/hvf/hvf-accel-ops.c
+++ b/accel/hvf/hvf-accel-ops.c
@@ -214,7 +214,7 @@ static void do_hvf_cpu_synchronize_post_reset(CPUState *cpu,
     cpu->vcpu_dirty = false;
 }
 
-void hvf_cpu_synchronize_post_reset(CPUState *cpu)
+static void hvf_cpu_synchronize_post_reset(CPUState *cpu)
 {
     run_on_cpu(cpu, do_hvf_cpu_synchronize_post_reset, RUN_ON_CPU_NULL);
 }
@@ -226,7 +226,7 @@ static void do_hvf_cpu_synchronize_post_init(CPUState *cpu,
     cpu->vcpu_dirty = false;
 }
 
-void hvf_cpu_synchronize_post_init(CPUState *cpu)
+static void hvf_cpu_synchronize_post_init(CPUState *cpu)
 {
     run_on_cpu(cpu, do_hvf_cpu_synchronize_post_init, RUN_ON_CPU_NULL);
 }
@@ -237,7 +237,7 @@ static void do_hvf_cpu_synchronize_pre_loadvm(CPUState *cpu,
     cpu->vcpu_dirty = true;
 }
 
-void hvf_cpu_synchronize_pre_loadvm(CPUState *cpu)
+static void hvf_cpu_synchronize_pre_loadvm(CPUState *cpu)
 {
     run_on_cpu(cpu, do_hvf_cpu_synchronize_pre_loadvm, RUN_ON_CPU_NULL);
 }
-- 
2.20.1


