Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C51C0669BE8
	for <lists+qemu-devel@lfdr.de>; Fri, 13 Jan 2023 16:25:13 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pGKnI-0001UQ-5s; Fri, 13 Jan 2023 09:12:32 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pGKmo-00014p-19
 for qemu-devel@nongnu.org; Fri, 13 Jan 2023 09:12:02 -0500
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pGKmi-0003iZ-9P
 for qemu-devel@nongnu.org; Fri, 13 Jan 2023 09:12:01 -0500
Received: by mail-wm1-x32f.google.com with SMTP id ja17so15355290wmb.3
 for <qemu-devel@nongnu.org>; Fri, 13 Jan 2023 06:11:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=qagczbKQoz2kyzFacEZPcoKe04O1uSO7YS9E6eFyDqU=;
 b=lGcAbTiyhaDcqrZCChpWZdNsWNMdNT+RfZ4/Fu0GyB4xxZUeqI30dODYc2UsJGRWHF
 DGPB30CS/rofny2TS5+BNK2pha81Qt1K9+MP2lbYIXcKP7WK9QWBkPLDT/gFTIQCnNZ1
 AjbL6mujOjlGHGjCBTtSHTgfeFYhfnnSgI6gwDxWdtAzk97pXRlYsuLWvxIDuywJ1Qee
 ghK8+Oamj75R3Wo4vf3RshdSSroG82gGunt50TVu342pGgkreSAoIKOAerr82if+Jgtm
 sNv1Msn8+7mmy1I5wbVqVYM9iE4dzMCpBdy5kkD+keqGTtF9uSYEUxPvDCVH4qdzGBP3
 p8GQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=qagczbKQoz2kyzFacEZPcoKe04O1uSO7YS9E6eFyDqU=;
 b=7BCnZz5guj5+0px6d1l9Z4BQU5j76SvOONAiEuZFZ6jfnNhgM4LKWq2U3iiJ/bfAVi
 fATNFyd9VMHlTH9f/UHSPABxLV+T4Cc2HAogl99MgEiI3eXJq/j/0OWqRNACbndSeHPV
 f7sMhgjAl/F8ZUzLySc9flG4jxj7HxdMMqRvObQNN1AyqmfOE1/rKoWIAxpcl8es41HD
 MZp3F1OQr5XKGeWMbXjNZ/mLXd0Xgmrzp+rF3BzfYOoFpbo9BfFJ4fYxFqg68nVFXxAW
 k+ah4PKJ+AD6QAO2D5c/zWeMG8OuJy4RVDvRr5/VvM3UjNl2wMxq/Ppp8M6HelN/QYoq
 O6VA==
X-Gm-Message-State: AFqh2kqcOqS0CGzo/jyZfGCK85duMMLJZz/hZirZF8jt8s2HtnwLPMEH
 d934bP35t0AuAemK3i0NBuSXVRK0p5jJaaE4
X-Google-Smtp-Source: AMrXdXuQADKajZ2MtxQlc6Hr9EPPwbFLwGSycMd9u4PZEDwRjwP8F+M8AOVcCfuRBXo+Sx8YnT2TWQ==
X-Received: by 2002:a05:600c:a4f:b0:3d2:196c:270c with SMTP id
 c15-20020a05600c0a4f00b003d2196c270cmr61209899wmq.31.1673619104503; 
 Fri, 13 Jan 2023 06:11:44 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 n36-20020a05600c502400b003da0b75de94sm5334464wmr.8.2023.01.13.06.11.43
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 13 Jan 2023 06:11:43 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 19/38] hw/arm/omap_sx1: Remove unused 'total_ram' definitions
Date: Fri, 13 Jan 2023 14:11:07 +0000
Message-Id: <20230113141126.535646-20-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230113141126.535646-1-peter.maydell@linaro.org>
References: <20230113141126.535646-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32f;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x32f.google.com
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

From: Philippe Mathieu-Daudé <philmd@linaro.org>

The total_ram_v1/total_ram_v2 definitions were never used.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-id: 20230109115316.2235-10-philmd@linaro.org
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 hw/arm/omap_sx1.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/hw/arm/omap_sx1.c b/hw/arm/omap_sx1.c
index 57829b37441..84b7059f7c7 100644
--- a/hw/arm/omap_sx1.c
+++ b/hw/arm/omap_sx1.c
@@ -91,8 +91,6 @@ static const MemoryRegionOps static_ops = {
 #define flash0_size	(16 * 1024 * 1024)
 #define flash1_size	( 8 * 1024 * 1024)
 #define flash2_size	(32 * 1024 * 1024)
-#define total_ram_v1	(sdram_size + flash0_size + flash1_size + OMAP15XX_SRAM_SIZE)
-#define total_ram_v2	(sdram_size + flash2_size + OMAP15XX_SRAM_SIZE)
 
 static struct arm_boot_info sx1_binfo = {
     .loader_start = OMAP_EMIFF_BASE,
-- 
2.34.1


