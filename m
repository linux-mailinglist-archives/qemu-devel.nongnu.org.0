Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 08B5150BE84
	for <lists+qemu-devel@lfdr.de>; Fri, 22 Apr 2022 19:24:45 +0200 (CEST)
Received: from localhost ([::1]:36650 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nhx1Q-0005Md-3g
	for lists+qemu-devel@lfdr.de; Fri, 22 Apr 2022 13:24:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49064)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nhwXW-0002Mj-NX
 for qemu-devel@nongnu.org; Fri, 22 Apr 2022 12:53:52 -0400
Received: from mail-pl1-x62d.google.com ([2607:f8b0:4864:20::62d]:40800)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nhwXU-0007Mo-H5
 for qemu-devel@nongnu.org; Fri, 22 Apr 2022 12:53:49 -0400
Received: by mail-pl1-x62d.google.com with SMTP id k4so550765plk.7
 for <qemu-devel@nongnu.org>; Fri, 22 Apr 2022 09:53:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=6dVu0MpYoFXbOmuVcXqDRhoCvO23S5v7zkXark59YIw=;
 b=gWqgZTFB3BzbkazegXIai+vgD6ISPR/ffS1H5VAB2a5kq7zxF7i5MjGB8aFvbrehLE
 0LBAX3v5v/NztAeN7TBFu+Lq0yiOg4VkQ1sEXi/ik8yb43ax0FsBCsCsTkHGDffzdEOD
 GzcH2Z+niLMf2lNK34kJ1rk9vY/C6zwC5197ggui1VMPkhDz5cvdxIZ3/Zu75PXgJPjN
 5ppn8DRFfFpr4F/lcf9Vq+jHGu9uM4EH/8p2a3h/ud2kVbm01efQEfqBJFcA5c0N+Hpr
 ZRcsaT5ypJhlz/S87K0JvEhtahn39P3jerGNQcNufJXCoJit0cF2ES1ZKSn3p8YJ8kDq
 zriw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=6dVu0MpYoFXbOmuVcXqDRhoCvO23S5v7zkXark59YIw=;
 b=sy+d4oCwqeV9/X+KztnIRoI+khLOFRk0uZ1EEPTW7grtui2STVfJlS2DSBT8n5aK9S
 86oePce5BQ89rNwo1Dr5UH2H4wtGme9s93u/MD3BsyyKz4IF4UHxfZCEtdw93fDJGVT+
 DihJJK3zn1TG13g8TMKM5TZ7t2SJZ6DZP/fgGKfJuSM0l1+w2MZGEQ2xxiJd3Xq9qBJO
 iMot3J5t4arrcuBqubDs1qwshCNbvuUXT0GdXsf4TYOd5o5C3bPS0EPAbAvasbB4IdJr
 Nwc5KYbzM8trfDTwxu5OgonTmIYSchwCLn6fYMB8BxNRc9t+x1q4luwfRNGfttAJtFw1
 pPGw==
X-Gm-Message-State: AOAM5309e3MLCst0+qWzGLtmTKqfHVLoA8RHY6FRGqOy6DCd683xtbdj
 QGZ5kcmiwdhma9PjKx9kd2gwloytrBW/1AIl
X-Google-Smtp-Source: ABdhPJwozvSa87XkwfKTI25Bp3NN91m8gmyOcJtPElaFC8lHc+lGBeQbOuPs2srMFpOVl3MWILKcZA==
X-Received: by 2002:a17:902:ce86:b0:159:90f:c5de with SMTP id
 f6-20020a170902ce8600b00159090fc5demr5424661plg.52.1650646427153; 
 Fri, 22 Apr 2022 09:53:47 -0700 (PDT)
Received: from stoup.. ([2607:fb90:27d0:b0f2:934d:3e2:9f8c:dd1])
 by smtp.gmail.com with ESMTPSA id
 6-20020a17090a030600b001cd4989ff5fsm6835904pje.38.2022.04.22.09.53.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 22 Apr 2022 09:53:46 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v8 38/68] target/nios2: Implement cpuid
Date: Fri, 22 Apr 2022 09:52:08 -0700
Message-Id: <20220422165238.1971496-39-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220422165238.1971496-1-richard.henderson@linaro.org>
References: <20220422165238.1971496-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62d;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Copy the existing cpu_index into the space reserved for CR_CPUID.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20220421151735.31996-39-richard.henderson@linaro.org>
---
 target/nios2/cpu.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/target/nios2/cpu.c b/target/nios2/cpu.c
index b3c5ae681c..a0c3e97d72 100644
--- a/target/nios2/cpu.c
+++ b/target/nios2/cpu.c
@@ -163,6 +163,7 @@ static void realize_cr_status(CPUState *cs)
 static void nios2_cpu_realizefn(DeviceState *dev, Error **errp)
 {
     CPUState *cs = CPU(dev);
+    Nios2CPU *cpu = NIOS2_CPU(cs);
     Nios2CPUClass *ncc = NIOS2_CPU_GET_CLASS(dev);
     Error *local_err = NULL;
 
@@ -176,6 +177,9 @@ static void nios2_cpu_realizefn(DeviceState *dev, Error **errp)
     qemu_init_vcpu(cs);
     cpu_reset(cs);
 
+    /* We have reserved storage for cpuid; might as well use it. */
+    cpu->env.ctrl[CR_CPUID] = cs->cpu_index;
+
     ncc->parent_realize(dev, errp);
 }
 
-- 
2.34.1


