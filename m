Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A5DA63E467B
	for <lists+qemu-devel@lfdr.de>; Mon,  9 Aug 2021 15:24:30 +0200 (CEST)
Received: from localhost ([::1]:49410 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mD5GD-0000A3-Mc
	for lists+qemu-devel@lfdr.de; Mon, 09 Aug 2021 09:24:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46832)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1mD53y-000316-SU; Mon, 09 Aug 2021 09:11:30 -0400
Received: from mail-qk1-x72f.google.com ([2607:f8b0:4864:20::72f]:35497)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1mD53w-0001Nj-5g; Mon, 09 Aug 2021 09:11:30 -0400
Received: by mail-qk1-x72f.google.com with SMTP id a19so18239865qkg.2;
 Mon, 09 Aug 2021 06:11:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=fLVm1fBACGLmXLYfVgA5+6MFgswf6f1qbtuCJmUJ8As=;
 b=X6C78dZrWkuhUuaP4pzZBU1mI+exggN1OtpoW77CsE3XcZJt8x5A+9GlNmb9/w4VMu
 IxPl2VZqgpaNr9zk9d6BJ57lpAU1j4fs+F6vPXcOivGaQEOKw6z6gNeIUxNmvjJdMGDT
 ZiZTQteOW0YsCgyFTuqxbDy2F2FT4ZjKMQ2yQVHA0/kn9gJOiJAxCU98X9FdgmWK/ONa
 hqsQ4RtUKEDwTOr970QuCJ+AmPwyVwdyNd5lvD75FF2GLAaKSMuxDWIBl7z2z8qNrP67
 VOpL6MzgWhLszPhpqYmjGaUIqqDf3H7/SPn6yPzDJ8Kh84PBcgdMTx22h9bQPYVdvt8G
 SuZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=fLVm1fBACGLmXLYfVgA5+6MFgswf6f1qbtuCJmUJ8As=;
 b=UB79B+QPjyI3WegGMhib3UCmFfH2VK4PR8QsWEQ8pWxTE76noaRn/uJKAu5U4A/0cV
 4LhyGYSbKC6z9X1a5Fg6C/LmcSqEMaLyn0OokpT/nLCfprQmX7VYskOxeZX2J63Q3XEN
 rTMcPNbQL33y1Pn32H1iTWNaEWPDV4rRjYuvuzRMDPncRKpuRwq/SukExw4yJc6lo4gZ
 4+Fr5K0o/tcTk8wJlgQ4KRyy1zMJJrY1Q8rlcYiLJ36A5GC/mLUiwQecC08rPLKhPpmh
 qocJzMjcAWZjnTPDz0LZGFa8m+sEj7EfenhMurD3/9Ih7WXac6fmt5hg+jjiiNfWcZjg
 ayaw==
X-Gm-Message-State: AOAM530q/6TOs8biyhsIPIppNoiXwlVFouvetNS77IF/yXwJS+ePCey4
 lW0AL+ZEWSuOGMn/9TyG86d4/Aql7jzVfA==
X-Google-Smtp-Source: ABdhPJxm1/Wu5hp33mHCALgQZQWzYlaKyBpxUKgRU7kFmKXku/joH+u//lYu6eonM2SoZ6n9AW09og==
X-Received: by 2002:a37:9f0b:: with SMTP id i11mr1311137qke.458.1628514686536; 
 Mon, 09 Aug 2021 06:11:26 -0700 (PDT)
Received: from rekt.ibmuc.com ([191.19.172.190])
 by smtp.gmail.com with ESMTPSA id f3sm6757435qti.65.2021.08.09.06.11.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 09 Aug 2021 06:11:26 -0700 (PDT)
From: Daniel Henrique Barboza <danielhb413@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 08/19] target/ppc/pmu_book3s_helper.c: do an actual cycles
 calculation
Date: Mon,  9 Aug 2021 10:10:46 -0300
Message-Id: <20210809131057.1694145-9-danielhb413@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210809131057.1694145-1-danielhb413@gmail.com>
References: <20210809131057.1694145-1-danielhb413@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::72f;
 envelope-from=danielhb413@gmail.com; helo=mail-qk1-x72f.google.com
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
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
Cc: gustavo.romero@linaro.org, Daniel Henrique Barboza <danielhb413@gmail.com>,
 groug@kaod.org, qemu-ppc@nongnu.org, clg@kaod.org, david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

We've been considering that PM_CYC is always 4x the number of
instructions sampled. This is not accurate due to several reasons,
including icount shift.

Replace it with a more accurate logic that returns the elapsed cycle
count of the sampled period, based on what the ARM CPU already does in
target/arm/helper.c, cycles_get_count(). Multiply the amount of ns passed
in the icount period (which considers icount shift) with the CPU frequency.

The PPC CPU clock frequency has different values depending on the CPU
implementation. We're defaulting it to 1GHz since it's the same value
used by PNV and pSeries CPUs.

Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
---
 target/ppc/pmu_book3s_helper.c | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/target/ppc/pmu_book3s_helper.c b/target/ppc/pmu_book3s_helper.c
index 6292b96db9..91bb82e699 100644
--- a/target/ppc/pmu_book3s_helper.c
+++ b/target/ppc/pmu_book3s_helper.c
@@ -17,11 +17,16 @@
 #include "qemu/error-report.h"
 #include "qemu/main-loop.h"
 
+/*
+ * Set arbitrarily based on clock-frequency values used in PNV
+ * and SPAPR code.
+ */
+#define PPC_CPU_FREQ 1000000000
 
 static uint64_t get_cycles(uint64_t icount_delta)
 {
-    /* Placeholder value */
-    return icount_delta * 4;
+    return muldiv64(icount_to_ns(icount_delta), PPC_CPU_FREQ,
+                    NANOSECONDS_PER_SECOND);
 }
 
 static void update_PMC_PM_INST_CMPL(CPUPPCState *env, int sprn,
-- 
2.31.1


