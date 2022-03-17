Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E0674DBE14
	for <lists+qemu-devel@lfdr.de>; Thu, 17 Mar 2022 06:18:42 +0100 (CET)
Received: from localhost ([::1]:45040 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nUiX3-0004CS-MD
	for lists+qemu-devel@lfdr.de; Thu, 17 Mar 2022 01:18:41 -0400
Received: from eggs.gnu.org ([209.51.188.92]:51020)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nUiKv-0001LB-9V
 for qemu-devel@nongnu.org; Thu, 17 Mar 2022 01:06:09 -0400
Received: from [2607:f8b0:4864:20::1033] (port=33052
 helo=mail-pj1-x1033.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nUiKt-0002HY-SQ
 for qemu-devel@nongnu.org; Thu, 17 Mar 2022 01:06:09 -0400
Received: by mail-pj1-x1033.google.com with SMTP id
 q1-20020a17090a4f8100b001c6575ae105so3002124pjh.0
 for <qemu-devel@nongnu.org>; Wed, 16 Mar 2022 22:06:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=c0ckdqiNp217KypVyC9C89ZTIDY1SBdOzGHf3qGX4Fo=;
 b=DFbZj/n4jLXgZ+P3r44XxRgjycb041x1lFTkehE8E09OyMNH3EyxtM/BmH+wMF3El1
 dogBt9fB8EDjYpAA1e10ocZxVbve610Ry1IOkcSS8sbC6zkdQaOYF97X+h/ae2KXDL3c
 7KFecJQhSN5ycl6oEskD/2d6T+/r3uJFyVk53LxERRoxnbSjG3EEzy5hJc0KSnqF8TOJ
 A0Bug6yjQeb46d8mU2MjQbCDRJbn6S7sj4e9vvJvB8vDQkTBfPc0adrAsdBaJ+fAQvos
 AFVpUcP6KJn9wSJgPJAEhj1bxYk5SKHIpXQt4PBXc5p+MjefTIxC/gpS/7RwL7ihZPtJ
 unQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=c0ckdqiNp217KypVyC9C89ZTIDY1SBdOzGHf3qGX4Fo=;
 b=0A6gOM/qE0VKuyQEJ6NXxMhVcL1gbSK0Hhnl7QXBwKq8sKC6oVkcEeMSWGnyspCWLs
 ZxFCzwuV4OT2SLBz5XrWvxgWkqLNmaqbtnV5CREd/a3XxkkXZTaOB/eErvVWVxwkdbLP
 nITjd0Xii9EwOXGjxFrkUaPJba3mi+WBihutMibo9PR951ZxB2gkT6I78BDmDVUqL9TY
 NmJu8TUsipMq7froI0RFuQLf2sP4DihSi5xj+QciVZGu7KFowCo/rQy/aIw4dhCdq9SX
 eESOEKwzhsqOxPfZA/pEmOEVt/91EpbWbKqUvKKOOcen0FxqHuwWHk/CcNLf2tgC2FfW
 itsg==
X-Gm-Message-State: AOAM533PM1jOwDWtG/gVt4WNXxuvvrpwyROHam0pBPIi5m00aDNNnvL3
 oahvd9rl9zj/Nvu9dQMjFWfp/gqm/7faaQ==
X-Google-Smtp-Source: ABdhPJzOHD6otPM02fl2Cnth3lBM2876iEvz6la5qu2LFRzJm1ziuXaPRjg2wzcxWOtnDR+8Ds77ug==
X-Received: by 2002:a17:903:2341:b0:151:d33b:90f4 with SMTP id
 c1-20020a170903234100b00151d33b90f4mr2863983plh.22.1647493566592; 
 Wed, 16 Mar 2022 22:06:06 -0700 (PDT)
Received: from localhost.localdomain (174-21-142-130.tukw.qwest.net.
 [174.21.142.130]) by smtp.gmail.com with ESMTPSA id
 h22-20020a056a001a5600b004f7c17b291asm5101357pfv.87.2022.03.16.22.06.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 16 Mar 2022 22:06:06 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH for-7.1 v6 27/51] target/nios2: Implement cpuid
Date: Wed, 16 Mar 2022 22:05:14 -0700
Message-Id: <20220317050538.924111-28-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220317050538.924111-1-richard.henderson@linaro.org>
References: <20220317050538.924111-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::1033
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::1033;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1033.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: marex@denx.de, Peter Maydell <peter.maydell@linaro.org>,
 amir.gonnen@neuroblade.ai
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Copy the existing cpu_index into the space reserved for CR_CPUID.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/nios2/cpu.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/target/nios2/cpu.c b/target/nios2/cpu.c
index 8189937857..2f1f5e35aa 100644
--- a/target/nios2/cpu.c
+++ b/target/nios2/cpu.c
@@ -168,6 +168,7 @@ static void realize_cr_status(CPUState *cs)
 static void nios2_cpu_realizefn(DeviceState *dev, Error **errp)
 {
     CPUState *cs = CPU(dev);
+    Nios2CPU *cpu = NIOS2_CPU(cs);
     Nios2CPUClass *ncc = NIOS2_CPU_GET_CLASS(dev);
     Error *local_err = NULL;
 
@@ -181,6 +182,9 @@ static void nios2_cpu_realizefn(DeviceState *dev, Error **errp)
     qemu_init_vcpu(cs);
     cpu_reset(cs);
 
+    /* We have reserved storage for cpuid; might as well use it. */
+    cpu->env.ctrl[CR_CPUID] = cs->cpu_index;
+
     ncc->parent_realize(dev, errp);
 }
 
-- 
2.25.1


