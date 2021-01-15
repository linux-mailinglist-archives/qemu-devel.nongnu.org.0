Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B83F52F8933
	for <lists+qemu-devel@lfdr.de>; Sat, 16 Jan 2021 00:11:47 +0100 (CET)
Received: from localhost ([::1]:43650 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l0YFu-0007wu-PM
	for lists+qemu-devel@lfdr.de; Fri, 15 Jan 2021 18:11:46 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:54106)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1l0XsO-0003wA-2K
 for qemu-devel@nongnu.org; Fri, 15 Jan 2021 17:47:28 -0500
Received: from mail-pl1-x62d.google.com ([2607:f8b0:4864:20::62d]:40210)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1l0XsI-0005L8-Fu
 for qemu-devel@nongnu.org; Fri, 15 Jan 2021 17:47:27 -0500
Received: by mail-pl1-x62d.google.com with SMTP id q4so5444842plr.7
 for <qemu-devel@nongnu.org>; Fri, 15 Jan 2021 14:47:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=NVTYVf4zlgciMSRy3E1kBUuwxIM3r8rkk5rLkXytMCY=;
 b=OLeFUxgqe2FDpmYwh92ezhGorgX6wh3bNBwRjXWeEmTrHXU0zjxMmP+wYf3OHzu/Rl
 AAwAJ7LksE7lsf/cOKZWZx3O8rNO9n8gWsFiFx0Y7A/tsh7JBH1i0UlaFInjQTaXQakV
 L2EB7jpeyrs41u1J0t8ft+IutoXl3q0so9VzpKXrFiARRhCdsny4rDLCiBLrOFFaclN1
 VDWAVRvop6xxFXHDgJFIdK4OSAHwY23DEkliXTI54cEpGNAaQAxg0ECQzbvkkG28jqvo
 WH0ZDzWLzxfqv7kX8hTeohF7V9XmZQ/xLUUKo+c99exdddajS4FNUaK2wu5FTaDLlCHr
 N9IA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=NVTYVf4zlgciMSRy3E1kBUuwxIM3r8rkk5rLkXytMCY=;
 b=j/Vk1+tgInVFqRseXRQ+fdRz36wrv+C5jpF+USlX2fBT3kF38uYan5fJ+nwYqrrp8w
 ZElmrvvZhvrwgkuEE4D7RAvBvBUKNVgtaE7crkLLpuZ0XzOm7hJZlvyb5GbeL7ncxmcR
 e1x+t/67iOYECLicBN3WSTuQR/kXjd6N3Qv7ushDyO5c/WtOjYr7QPMtaaqWJ3ajp8KH
 sMZp32jNkMvgvJNQfBxsEw2oXPtcw73EPvFhaD7hNIlr3qnloIJzfKUVbp1/WHZbWr3U
 YlqyY6zKu+/i6YJBbHyEJ7HuCBM0hZwadTdy96+CmgsnNKOGHbdUqgm5KgSf4OS6BpbS
 GCEw==
X-Gm-Message-State: AOAM530ucMmpLvOwJuD6oSznenNXGcs8SrdakvEZdGbZnQqPHFxl0bYN
 FdM+aUph86dzGSA9NTjyySLyXKY3nUgBOcrQ
X-Google-Smtp-Source: ABdhPJwbkoKSF44+p4nnsIgjWU4uiwueypBZfIyF3VKb7UaQhH6DD8fjmaSF6GP1TOWPLYY74dRBBg==
X-Received: by 2002:a17:90b:8d7:: with SMTP id
 ds23mr5581444pjb.116.1610750841311; 
 Fri, 15 Jan 2021 14:47:21 -0800 (PST)
Received: from localhost.localdomain (rrcs-173-197-107-21.west.biz.rr.com.
 [173.197.107.21])
 by smtp.gmail.com with ESMTPSA id s13sm9521700pfd.99.2021.01.15.14.47.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 15 Jan 2021 14:47:20 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 20/21] target/arm: Enable MTE for user-only
Date: Fri, 15 Jan 2021 12:46:44 -1000
Message-Id: <20210115224645.1196742-21-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210115224645.1196742-1-richard.henderson@linaro.org>
References: <20210115224645.1196742-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62d;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62d.google.com
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
Cc: peter.maydell@linaro.org, qemu-arm@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/cpu.c | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/target/arm/cpu.c b/target/arm/cpu.c
index abc0affd00..5e613a747a 100644
--- a/target/arm/cpu.c
+++ b/target/arm/cpu.c
@@ -208,6 +208,22 @@ static void arm_cpu_reset(DeviceState *dev)
          * Do not modify this without other changes.
          */
         env->cp15.tcr_el[1].raw_tcr = (3ULL << 37);
+
+        /* Enable MTE */
+        if (cpu_isar_feature(aa64_mte, cpu)) {
+            /* Enable tag access, but leave TCF0 as No Effect (0). */
+            env->cp15.sctlr_el[1] |= SCTLR_ATA0;
+            /*
+             * Exclude all tags, so that tag 0 is always used.
+             * This corresponds to Linux current->thread.gcr_incl = 0.
+             *
+             * Set RRND, so that helper_irg() will generate a seed later.
+             * Here in cpu_reset(), the crypto subsystem has not yet been
+             * initialized.
+             */
+            env->cp15.gcr_el1 = 0x1ffff;
+        }
+
 # ifdef TARGET_TAGGED_ADDRESSES
         env->untagged_addr_mask = -1;
 # endif
-- 
2.25.1


