Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B149626130
	for <lists+qemu-devel@lfdr.de>; Fri, 11 Nov 2022 19:33:44 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1otYiy-00087l-3y; Fri, 11 Nov 2022 13:25:56 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1otYir-00085E-JQ
 for qemu-devel@nongnu.org; Fri, 11 Nov 2022 13:25:49 -0500
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1otYil-0005GD-Jc
 for qemu-devel@nongnu.org; Fri, 11 Nov 2022 13:25:49 -0500
Received: by mail-wm1-x333.google.com with SMTP id t4so3376317wmj.5
 for <qemu-devel@nongnu.org>; Fri, 11 Nov 2022 10:25:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=cbpO0AZ4Acrg9xoN2SNVugKcaQMd8HDZpSEMLYorBkM=;
 b=OOGKyx/0BE4MxgvcPQ1WNrVIEaeHER6IU7lCfkjYc9Yj2s+JZ4n+tepm+gsnXh7xSI
 2Hrxb16uAtX7ddYVAmH50aNvsX+DGjH9+5bxc4Q6HKztQuCA4oLKofW052oluWFTJyWo
 SysLNGkkZn9CHXuvK7LEBGsSD9wFIuFKCJB6al537KzWVK4RmRri2OxCWJFMJJLTuS2H
 MCqKfjiEp7CUkyRngOXqGqY/Fr6FgOiyZodRPMzzY0OGawV9AoICy0enQ/iy545MpmEm
 qtuPMJFfDcyWE28wWRUX/6R6Djth6tqq6OEIXIjqomDwxa+9gfpPC9IpQR2XrE12+hGc
 ysHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=cbpO0AZ4Acrg9xoN2SNVugKcaQMd8HDZpSEMLYorBkM=;
 b=QN81uIET2vXIKNkyhHX5JRRp2YzC7XgZxoyj4ULNVm6f6VyxXSUv7MYjF8ITan1LBd
 FY8A/S7Ro1vs9kktnw1ZHj9GqMiq2jpMBhRFQDmCc/l31saTDT4ppqL+/wflfdraPDDe
 r0zeqVfIm2XOg70HBhIKunBOWb+ST+LR/yFjO+n5o/0iH+q6mrIl7ytqrp2U95JTbIOr
 i9h4VB2MSB7pi7Vl1UkYNPFhiPinYfY9vOl5VzELb9kh4XeqIs1vpFy/auodzMYa7oT0
 Bupjig6t4iOeRE4Tg9+9ria5HVXWObwWhCFMZ1wWxGrgdcMKRfOP3uD6c16GZRHfFeAA
 hzCg==
X-Gm-Message-State: ANoB5pnXyXacML+b9FI04EW9wfm59n5qMxM9fqGi2dedChigU/g7U2KG
 wLE494I4C67sB6vIAV1iufzFEmwCf7juaQ==
X-Google-Smtp-Source: AA0mqf7IMZNyki7+j4ElIaxVf7WdnrKW8xNs9Q+SQ1u54LqsQnkZn8tmqgsGzp6k4EbINNVBqeG/iw==
X-Received: by 2002:a7b:c407:0:b0:3cf:9668:e8f8 with SMTP id
 k7-20020a7bc407000000b003cf9668e8f8mr2107979wmi.195.1668191142082; 
 Fri, 11 Nov 2022 10:25:42 -0800 (PST)
Received: from zen.linaroharston ([185.81.254.11])
 by smtp.gmail.com with ESMTPSA id
 m16-20020a05600c3b1000b003a3170a7af9sm4086923wms.4.2022.11.11.10.25.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 11 Nov 2022 10:25:39 -0800 (PST)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id A0B011FFC1;
 Fri, 11 Nov 2022 18:25:36 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: f4bug@amsat.org, =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
Subject: [PATCH v5 10/20] target/microblaze: initialise MemTxAttrs for CPU
 access
Date: Fri, 11 Nov 2022 18:25:25 +0000
Message-Id: <20221111182535.64844-11-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221111182535.64844-1-alex.bennee@linaro.org>
References: <20221111182535.64844-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::333;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x333.google.com
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

Both of these functions deal with CPU based access (as is evidenced by
the secure check straight after). Use the new MEMTXATTRS_CPU
constructor to ensure the correct CPU id is filled in should it ever
be needed by any devices later.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 target/microblaze/helper.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/target/microblaze/helper.c b/target/microblaze/helper.c
index 98bdb82de8..655be3b320 100644
--- a/target/microblaze/helper.c
+++ b/target/microblaze/helper.c
@@ -44,7 +44,7 @@ bool mb_cpu_tlb_fill(CPUState *cs, vaddr address, int size,
     MicroBlazeMMULookup lu;
     unsigned int hit;
     int prot;
-    MemTxAttrs attrs = {};
+    MemTxAttrs attrs = MEMTXATTRS_CPU(cs);
 
     attrs.secure = mb_cpu_access_is_secure(cpu, access_type);
 
@@ -235,7 +235,7 @@ hwaddr mb_cpu_get_phys_page_attrs_debug(CPUState *cs, vaddr addr,
     unsigned int hit;
 
     /* Caller doesn't initialize */
-    *attrs = (MemTxAttrs) {};
+    *attrs = MEMTXATTRS_CPU(cs);
     attrs->secure = mb_cpu_access_is_secure(cpu, MMU_DATA_LOAD);
 
     if (mmu_idx != MMU_NOMMU_IDX) {
-- 
2.34.1


