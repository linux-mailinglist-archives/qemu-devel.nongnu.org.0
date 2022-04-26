Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 88D345107C2
	for <lists+qemu-devel@lfdr.de>; Tue, 26 Apr 2022 20:57:33 +0200 (CEST)
Received: from localhost ([::1]:47896 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1njQNQ-0005yX-J4
	for lists+qemu-devel@lfdr.de; Tue, 26 Apr 2022 14:57:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44400)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1njPms-00033I-JU
 for qemu-devel@nongnu.org; Tue, 26 Apr 2022 14:19:46 -0400
Received: from mail-pg1-x532.google.com ([2607:f8b0:4864:20::532]:44822)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1njPmr-0004Tf-4c
 for qemu-devel@nongnu.org; Tue, 26 Apr 2022 14:19:46 -0400
Received: by mail-pg1-x532.google.com with SMTP id v10so5640995pgl.11
 for <qemu-devel@nongnu.org>; Tue, 26 Apr 2022 11:19:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=6dVu0MpYoFXbOmuVcXqDRhoCvO23S5v7zkXark59YIw=;
 b=zl6l809aLyU0x6SE05p9h/omgMzN1xnp4c86qm7k90GTTSyH5/xZnsIZmwc2M7Gy1s
 JIbfHY+QbHrgVFbUPs8wKORyOIlvlFk3DwC85vqXvd798XTQ41mgtBtC3VgI2rSvhYCM
 pOiZUNOka2dwbDGks4fYXHf47qTXNUy0LRZte468INJBGz58+Su011Q7LJGttcyRa7Y4
 PxLFs58gKVWEHcC2XPW4ocGUX9y6fMmLxOVqWw7WfOc6EShu+qvcazSmVt7M43MFqpL+
 E3GtCNuNhzZhXBu6RJVuPB+ENWU1nKCA+CvWsH/aMWx1ndufht4djlkQUk/043Bexrv8
 wKBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=6dVu0MpYoFXbOmuVcXqDRhoCvO23S5v7zkXark59YIw=;
 b=kj8SOPLMRCy/xOmnJp1IGNNMKVbupSB3kJ0F+TZfcrQWx7GEGcSzuVktqS3UL4R6gf
 iAcPa2dyYFB3WYZx+hYmPl3YnBFpJDJqTsYU3kX3AOzBrtU3rYPg3bImZf9AsReeEwaq
 gr73LMrmjjU09k1uD4Eu/PdxkHGmgnCCOK3HYAzhIbU2SD0D75bWoOhFjkAfDXKBoDbI
 1EcZf4GGVjlVyIGODgOvqiXWIbZM3xTbs9FLVxro162RQ7c/Sff37/Pm4x6a20jN1tzR
 l9nEQwGY3bXfqSVqb909YUhKPKLs97LImo5axWQeVgmrkShQxEXEcfldlcQ4A4J+ZE6T
 r7MA==
X-Gm-Message-State: AOAM530ZBY2+ZZms2C1GqVkpjTyNvBudmSjhDNtlEv9d+zi+TVZArI6I
 WIZ2RX2crS0X2qXfWpjiVGKFQ1eWfiiFyA==
X-Google-Smtp-Source: ABdhPJwb7XDlA0W6ScDRt9XIna112CsZyUeK1SJwLcoPNtqitaD53F/axofdDOzWSNMCz5B4oooY7A==
X-Received: by 2002:a65:6b8e:0:b0:39d:6760:1cd5 with SMTP id
 d14-20020a656b8e000000b0039d67601cd5mr20712079pgw.379.1650997183867; 
 Tue, 26 Apr 2022 11:19:43 -0700 (PDT)
Received: from stoup.. (174-21-142-130.tukw.qwest.net. [174.21.142.130])
 by smtp.gmail.com with ESMTPSA id
 j7-20020a056a00130700b004b9f7cd94a4sm16482827pfu.56.2022.04.26.11.19.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 26 Apr 2022 11:19:43 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 38/68] target/nios2: Implement cpuid
Date: Tue, 26 Apr 2022 11:18:37 -0700
Message-Id: <20220426181907.103691-39-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220426181907.103691-1-richard.henderson@linaro.org>
References: <20220426181907.103691-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::532;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x532.google.com
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


