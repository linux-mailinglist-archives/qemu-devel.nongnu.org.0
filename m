Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FB634FA085
	for <lists+qemu-devel@lfdr.de>; Sat,  9 Apr 2022 02:18:18 +0200 (CEST)
Received: from localhost ([::1]:55044 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ncynx-0000d1-Ky
	for lists+qemu-devel@lfdr.de; Fri, 08 Apr 2022 20:18:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46764)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ncydt-0008MC-Sp
 for qemu-devel@nongnu.org; Fri, 08 Apr 2022 20:07:53 -0400
Received: from mail-pl1-x62f.google.com ([2607:f8b0:4864:20::62f]:33355)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ncyds-0003T4-7n
 for qemu-devel@nongnu.org; Fri, 08 Apr 2022 20:07:53 -0400
Received: by mail-pl1-x62f.google.com with SMTP id c23so9298704plo.0
 for <qemu-devel@nongnu.org>; Fri, 08 Apr 2022 17:07:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=p80D0OL7NSD8A+1/4lXOPXEHHEGV8jpE8kk94fCxKzs=;
 b=t/cS+X8psQfXZyFIGb4ptdmrq9rhwsdZx5SfZbeg+hj0Puggb0OaRYphK0UQUD4Au5
 9jbFkSg7ua3QuuCMxfvTZw77eBUtJfTxLRLIZT3ocfSoQkzD1kmYHD8Ahbd4cdIR3Bcb
 8pHay8QfvZOxKyk+h+QSgR3sCQIBYezvgKJUQLDFMrj1jBqs6QVK027cm2WYM8+h3WFC
 MIwZQ8l7VoinVtWsNiyOkMAyr7m3ic4vcW0/yT2AmvJGl8w/oxBBkbu5GeOAp5/yZ+5E
 S10eGm99rxhpbxt3dZBPkTZ6XYK2/w3hSCzjUudSwTCfD3VdzQjW0WuG9Cw2CnWIa90P
 AwBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=p80D0OL7NSD8A+1/4lXOPXEHHEGV8jpE8kk94fCxKzs=;
 b=4MrELf4TUdMY6nFuDayYXabzpdzhLfgax3/s11DM9Z7BlNtlMm+NNaINf/fDveyGok
 NLu6V1M4jNCZ2enIgEMxIKGFHwzYuqBiTdaHUPG/ahzoUbejtirvUnsrG+K51A4Xj8Dc
 ZLDlPhmlXob0BY+xOxchWm1YxwKmF7Yioc828R2EViHg5XEnj/buCkWb21Y0CYFNU920
 kOEWwtOyFoD1r3fuSbRHzWdyboZFk8Jz5JKAx62uRzJdphJK2D2SvzESH8SCsvOAV1PD
 7rF/5OarBNIKu4+S5773kZv7liqn5M6PnfrCtM/IxTEJQDDLnojw/PRy3vWc8kPPWQtE
 X8XQ==
X-Gm-Message-State: AOAM532vO06d9rdceSizXjZ1hKAxVOC5l3BdJvf5BMN41YQ/wE3+5rEa
 /qb40vBYrJLQQvS82G0YPQJr1L17PO4nuA==
X-Google-Smtp-Source: ABdhPJw4RN7HFJf3VXPoevDrmst3jQW7UUy72uTt9jitsaZ75P/+aCNTrK+Tvr2j/UdobccagD39Fw==
X-Received: by 2002:a17:902:8309:b0:156:486f:35d8 with SMTP id
 bd9-20020a170902830900b00156486f35d8mr22003569plb.143.1649462870713; 
 Fri, 08 Apr 2022 17:07:50 -0700 (PDT)
Received: from localhost.localdomain (174-21-142-130.tukw.qwest.net.
 [174.21.142.130]) by smtp.gmail.com with ESMTPSA id
 t69-20020a637848000000b0039831d6dc23sm22073961pgc.94.2022.04.08.17.07.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 08 Apr 2022 17:07:50 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 08/16] target/arm: Enable FEAT_Debugv8p2 for -cpu max
Date: Fri,  8 Apr 2022 17:07:34 -0700
Message-Id: <20220409000742.293691-9-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220409000742.293691-1-richard.henderson@linaro.org>
References: <20220409000742.293691-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62f;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62f.google.com
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
Cc: qemu-arm@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The only portion of FEAT_Debugv8p2 that is relevant to QEMU
is CONTEXTIDR_EL2, which is also conditionally implemented
with FEAT_VHE.  The rest of the debug extension concerns the
External debug interface, which is outside the scope of QEMU.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/cpu.c     | 1 +
 target/arm/cpu64.c   | 1 +
 target/arm/cpu_tcg.c | 2 ++
 3 files changed, 4 insertions(+)

diff --git a/target/arm/cpu.c b/target/arm/cpu.c
index 6521f350f9..d815d3a397 100644
--- a/target/arm/cpu.c
+++ b/target/arm/cpu.c
@@ -1800,6 +1800,7 @@ static void arm_cpu_realizefn(DeviceState *dev, Error **errp)
          * feature registers as well.
          */
         cpu->isar.id_pfr1 = FIELD_DP32(cpu->isar.id_pfr1, ID_PFR1, SECURITY, 0);
+        cpu->isar.id_dfr0 = FIELD_DP32(cpu->isar.id_dfr0, ID_DFR0, COPSDBG, 0);
         cpu->isar.id_aa64pfr0 = FIELD_DP64(cpu->isar.id_aa64pfr0,
                                            ID_AA64PFR0, EL3, 0);
     }
diff --git a/target/arm/cpu64.c b/target/arm/cpu64.c
index ae7114ea79..6b6422070d 100644
--- a/target/arm/cpu64.c
+++ b/target/arm/cpu64.c
@@ -854,6 +854,7 @@ static void aarch64_max_initfn(Object *obj)
     cpu->isar.id_aa64zfr0 = t;
 
     t = cpu->isar.id_aa64dfr0;
+    t = FIELD_DP64(t, ID_AA64DFR0, DEBUGVER, 8);  /* FEAT_Debugv8p2 */
     t = FIELD_DP64(t, ID_AA64DFR0, PMUVER, 5);    /* FEAT_PMUv3p4 */
     cpu->isar.id_aa64dfr0 = t;
 
diff --git a/target/arm/cpu_tcg.c b/target/arm/cpu_tcg.c
index 9d5cd6ea00..ac91bbea9b 100644
--- a/target/arm/cpu_tcg.c
+++ b/target/arm/cpu_tcg.c
@@ -79,6 +79,8 @@ void arm32_max_features(ARMCPU *cpu)
     cpu->isar.id_pfr2 = t;
 
     t = cpu->isar.id_dfr0;
+    t = FIELD_DP32(t, ID_DFR0, COPDBG, 8);        /* FEAT_Debugv8p2 */
+    t = FIELD_DP32(t, ID_DFR0, COPSDBG, 8);       /* FEAT_Debugv8p2 */
     t = FIELD_DP32(t, ID_DFR0, PERFMON, 5);       /* FEAT_PMUv3p4 */
     cpu->isar.id_dfr0 = t;
 }
-- 
2.25.1


