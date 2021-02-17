Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A641A31E128
	for <lists+qemu-devel@lfdr.de>; Wed, 17 Feb 2021 22:18:57 +0100 (CET)
Received: from localhost ([::1]:45358 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lCUDo-0007uy-MG
	for lists+qemu-devel@lfdr.de; Wed, 17 Feb 2021 16:18:56 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:33656)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lCTMs-0001uH-Ty
 for qemu-devel@nongnu.org; Wed, 17 Feb 2021 15:24:15 -0500
Received: from mail-pg1-x52b.google.com ([2607:f8b0:4864:20::52b]:42724)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lCTMq-0007jo-12
 for qemu-devel@nongnu.org; Wed, 17 Feb 2021 15:24:14 -0500
Received: by mail-pg1-x52b.google.com with SMTP id o38so9194945pgm.9
 for <qemu-devel@nongnu.org>; Wed, 17 Feb 2021 12:24:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Oqjirx8sUQyYnS7vrLSDlLS9gocI/IN6++5opPveqXM=;
 b=tRZfwSOtuKbty8uaE1wPHZMbhxFhsKeVVxaEdHXf0Tz6SGWx9LNPFDCdB5A3XcWxg0
 P3dfNpYg8EQT7Q+mgNjYkhAPl6fY6JpYxbQiJ3yy8Wvfjq+Re37IqBY7Jh1IR5E0Udnl
 jytXNmC/DN/wq0FE3r8RzbRpUkIgN4mY1wmyMJ2j7nlI2fRA8LqI/KnFZlpSDv6HC6DO
 hDyGwcZiEv+vn1q0GBbURyOWFH5Z3YPfqsBOjhc88ZIz2UeV5WscgZNWumNPlEx7VU7Z
 OolEB/UyxwZGzr6t5KlWWVESlVAKvfo2x2C4vULDJcvz07gFRrrhXoHoqs2WG3lLGXex
 LTkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Oqjirx8sUQyYnS7vrLSDlLS9gocI/IN6++5opPveqXM=;
 b=doxwDMCVtw+ep2SfjBjh5O0ty7l7wFjiphNmuY5GiAG5f3dUywdLJhZHPefOr11WUN
 KPIVgBOPIG9NXjPESljx3cNEoWJSVPbhsSUyFqojt04x0bzOI1iy7S7H/55x4smz2jQ5
 CctrDEr7J984QBfxgnAUo/BjMRUmwXW60Ycghe16KvvtkoDVJSPRYu4YN6FzTq0G53P8
 X3eMiQoYMw93f+MkUMUwvYF/UzNGn09mvm99/pMAvE5QLhI+nH/2cCGwsLyZnYD1jIY0
 Uf94lo08qkcpT92aVo8T0qMqbNvAoUS3i4BLdHnhmolXOAXyOr5AkmkXnnPbH6hdpHAG
 uyVQ==
X-Gm-Message-State: AOAM531JPhtIaSYzmFBDaR6xVNo5Am79uIBy4Enya5NWRxbfAyaEh3CC
 ahAvSxY9yUd8le7HgfR6Syrcl7Gq5cvq8Q==
X-Google-Smtp-Source: ABdhPJz9+X3eKuKDc3b2fmmuUQFKS5X6dLE4qiWx/4kfhywm2JQfhbwClVT8d1SpQLhmuPTogp3JNw==
X-Received: by 2002:a62:b410:0:b029:1a4:7868:7e4e with SMTP id
 h16-20020a62b4100000b02901a478687e4emr1057036pfn.62.1613593450883; 
 Wed, 17 Feb 2021 12:24:10 -0800 (PST)
Received: from localhost.localdomain (047-051-160-125.biz.spectrum.com.
 [47.51.160.125])
 by smtp.gmail.com with ESMTPSA id v126sm3232038pfv.163.2021.02.17.12.24.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 17 Feb 2021 12:24:10 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 60/71] tcg/tci: Remove tci_write_reg
Date: Wed, 17 Feb 2021 12:20:25 -0800
Message-Id: <20210217202036.1724901-61-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210217202036.1724901-1-richard.henderson@linaro.org>
References: <20210217202036.1724901-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52b;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x52b.google.com
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
Cc: sw@weilnetz.de, alex.bennee@linaro.org, f4bug@amsat.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Inline it into its one caller, tci_write_reg64.
Drop the asserts that are redundant with tcg_read_r.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/tci.c | 13 ++-----------
 1 file changed, 2 insertions(+), 11 deletions(-)

diff --git a/tcg/tci.c b/tcg/tci.c
index 3f8c6a0291..0b2bc905ea 100644
--- a/tcg/tci.c
+++ b/tcg/tci.c
@@ -36,20 +36,11 @@
 
 __thread uintptr_t tci_tb_ptr;
 
-static void
-tci_write_reg(tcg_target_ulong *regs, TCGReg index, tcg_target_ulong value)
-{
-    tci_assert(index < TCG_TARGET_NB_REGS);
-    tci_assert(index != TCG_AREG0);
-    tci_assert(index != TCG_REG_CALL_STACK);
-    regs[index] = value;
-}
-
 static void tci_write_reg64(tcg_target_ulong *regs, uint32_t high_index,
                             uint32_t low_index, uint64_t value)
 {
-    tci_write_reg(regs, low_index, value);
-    tci_write_reg(regs, high_index, value >> 32);
+    regs[low_index] = value;
+    regs[high_index] = value >> 32;
 }
 
 /* Create a 64 bit value from two 32 bit values. */
-- 
2.25.1


