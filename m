Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6405F305500
	for <lists+qemu-devel@lfdr.de>; Wed, 27 Jan 2021 08:51:10 +0100 (CET)
Received: from localhost ([::1]:57066 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l4fbZ-0007g8-BR
	for lists+qemu-devel@lfdr.de; Wed, 27 Jan 2021 02:51:09 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:60246)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <edgar.iglesias@gmail.com>)
 id 1l4fZR-0006N9-6O
 for qemu-devel@nongnu.org; Wed, 27 Jan 2021 02:48:57 -0500
Received: from mail-lj1-x234.google.com ([2a00:1450:4864:20::234]:44409)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <edgar.iglesias@gmail.com>)
 id 1l4fZP-0008FN-LK
 for qemu-devel@nongnu.org; Wed, 27 Jan 2021 02:48:56 -0500
Received: by mail-lj1-x234.google.com with SMTP id f2so948371ljp.11
 for <qemu-devel@nongnu.org>; Tue, 26 Jan 2021 23:48:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=4QBhtqx+2zYsT5bsd6WKN1cKWd33wvJhacw+yaeEiU8=;
 b=MSK/AAgRs6yr8Qb4OxcjZX4T9Av/dg2UDIntCkjaKrZozSxUKemz98uscsq7dPVXp3
 QOBTYwu0umabi3Fi62bKYWz+aLMvW15In2sFrRXztOxL8N/Ml4Yw1CO5Hp45uaVsWBW1
 WMdFeJt7UG3T9Ba4EyG7vPzTGRFOvevdt0MrfRUOd3XW0u2AwjKBmMYUOpY3eqmiz2Ju
 FQLfnWaiNRi3VWrrkFBMxdwp7y2QEj/x7vQGh8vMnOw7V8KxickMe8hj7Fd2mznEy8LF
 IY78WuLaDZrslvPkb144V9pJiT1GpTfCnZys5CozJ+gnTwwJDPpr72bLJvmEuPjZEdxP
 NdKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=4QBhtqx+2zYsT5bsd6WKN1cKWd33wvJhacw+yaeEiU8=;
 b=euYsQWe8BBlWRFsgT4gzNaw/J6Hkmyworg3dDOu3mH2bA+VUjsWQTCu5Fv2SftzS9l
 UP6D+PDh2ncg7xWc50jGFy0paSA/YFLX5Q8rT9tTZ5SeehePzgcKAAXJr2m4OnKedZz/
 vlWaX8XG5dy5jRiQwItrxI+D/9EECAnT2a7zbf+IWJAMe8M5+f8SElSt73d6/Fc1Rzyb
 cenXQir5HJQ8QGYpMl5HKo+RWKISr9Rx/nHjm7otEg9MWkfK5o4HkKL5SXaUNHwMfekj
 s5+NG1mf076Js67RO7cBXwbaTjhrDb2D8mRmTla+WCpwIRZ0jYXDVT1p66WDLnDhzgCZ
 s7vw==
X-Gm-Message-State: AOAM531p9zBf6qVC3UxPVXju9yG9I/7bYkHPf5442QL15+PQ0FfyqgZC
 vr+aB7neyiQSvYS3/kKUdRLRaRe3YrY=
X-Google-Smtp-Source: ABdhPJztFTvxw+I/pD6DahbG2YDST3pZfna+j3O7NJDHVHJjf4ko7CtBiVUNZLHD/h7JQh8vHAArbg==
X-Received: by 2002:a2e:9d96:: with SMTP id c22mr5056523ljj.109.1611733733969; 
 Tue, 26 Jan 2021 23:48:53 -0800 (PST)
Received: from gmail.com (81-231-232-130-no39.tbcn.telia.com. [81.231.232.130])
 by smtp.gmail.com with ESMTPSA id n8sm359789ljj.116.2021.01.26.23.48.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 26 Jan 2021 23:48:53 -0800 (PST)
From: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PULL v1 2/3] target/microblaze: use MMUAccessType instead of int in
 mmu_translate
Date: Wed, 27 Jan 2021 08:48:49 +0100
Message-Id: <20210127074850.1886235-3-edgar.iglesias@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210127074850.1886235-1-edgar.iglesias@gmail.com>
References: <20210127074850.1886235-1-edgar.iglesias@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::234;
 envelope-from=edgar.iglesias@gmail.com; helo=mail-lj1-x234.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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
Cc: edgar.iglesias@xilinx.com, peter.maydell@linaro.org, joe.komlodi@xilinx.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Joe Komlodi <joe.komlodi@xilinx.com>

Using MMUAccessType makes it more clear what the variable's use is.
No functional change.

Signed-off-by: Joe Komlodi <komlodi@xilinx.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Edgar E. Iglesias <edgar.iglesias@xilinx.com>
Tested-by: Edgar E. Iglesias <edgar.iglesias@xilinx.com>
Message-Id: <1611274735-303873-3-git-send-email-komlodi@xilinx.com>
Signed-off-by: Edgar E. Iglesias <edgar.iglesias@xilinx.com>
---
 target/microblaze/mmu.h | 2 +-
 target/microblaze/mmu.c | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/target/microblaze/mmu.h b/target/microblaze/mmu.h
index 09e4075739..b6b4b9ad60 100644
--- a/target/microblaze/mmu.h
+++ b/target/microblaze/mmu.h
@@ -84,7 +84,7 @@ typedef struct {
 } MicroBlazeMMULookup;
 
 unsigned int mmu_translate(MicroBlazeCPU *cpu, MicroBlazeMMULookup *lu,
-                           target_ulong vaddr, int rw, int mmu_idx);
+                           target_ulong vaddr, MMUAccessType rw, int mmu_idx);
 uint32_t mmu_read(CPUMBState *env, bool ea, uint32_t rn);
 void mmu_write(CPUMBState *env, bool ea, uint32_t rn, uint32_t v);
 void mmu_init(MicroBlazeMMU *mmu);
diff --git a/target/microblaze/mmu.c b/target/microblaze/mmu.c
index 1e426963ba..cc40f275ea 100644
--- a/target/microblaze/mmu.c
+++ b/target/microblaze/mmu.c
@@ -74,7 +74,7 @@ static void mmu_change_pid(CPUMBState *env, unsigned int newpid)
 
 /* rw - 0 = read, 1 = write, 2 = fetch.  */
 unsigned int mmu_translate(MicroBlazeCPU *cpu, MicroBlazeMMULookup *lu,
-                           target_ulong vaddr, int rw, int mmu_idx)
+                           target_ulong vaddr, MMUAccessType rw, int mmu_idx)
 {
     MicroBlazeMMU *mmu = &cpu->env.mmu;
     unsigned int i, hit = 0;
-- 
2.25.1


