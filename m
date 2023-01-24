Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 48FB9678C63
	for <lists+qemu-devel@lfdr.de>; Tue, 24 Jan 2023 01:01:31 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pK6kD-00087R-Oc; Mon, 23 Jan 2023 19:00:57 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pK6kB-00081t-OI
 for qemu-devel@nongnu.org; Mon, 23 Jan 2023 19:00:55 -0500
Received: from mail-pf1-x432.google.com ([2607:f8b0:4864:20::432])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pK6k9-0001qq-CA
 for qemu-devel@nongnu.org; Mon, 23 Jan 2023 19:00:55 -0500
Received: by mail-pf1-x432.google.com with SMTP id i65so10136680pfc.0
 for <qemu-devel@nongnu.org>; Mon, 23 Jan 2023 16:00:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=roMq0cKqYUSuqmepPgcMOSqHad1ObHN98rGJI0Zfrfk=;
 b=ZfJC03gq9ckBR1NFci4XY0r9zkl/MW5c1L0ShZw7t0ZlcqnHicBTjqd3paqp4D+7zH
 OWh3ibRbbB+IB6g9uorJlOhushVCZdgXpmlkNylnj1Uc3fT7N5I+JU3LVjn2CTkTz5YN
 5DRa6CdmNHdugGHW7FP2Lt87Gj56HhxAXsudaacnMybZ5hNI6zhQiQumEYWAhL9mqr/K
 i7k40Jn0KYHoGGzWyvxJ5KkYxPh3qmCD7p6bo5018SFhuXa1tIqU+7IZZQIP08glbuiR
 WiXyD0yX4n7iEBtKFVrSIgXhinOMoQhOE0DLOvVsYu99jxSvk1SR9LbCv3Cn+Ryx1jRQ
 zDlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=roMq0cKqYUSuqmepPgcMOSqHad1ObHN98rGJI0Zfrfk=;
 b=al8x61EcfxoHNM5ZiY93IYsDZO+AXxDxEdN6t9r6wjsu1Y7b6plJRM/ior1J7ZnWfW
 wjiRuSFTfQLuhes0uO+tMek5Lv1Rm+uApjhf1KDiWK/AUC/IezYEgpbCO7mD1Btn4Ok5
 orQjXjRLBJfSsLs+EFt6xGf+48TdUDIwVKD3WuJ1KMONpV9YQRRUYFZZxbMqKlc/Xtqe
 NeHRyROUqbf7RZM/LtdTDOyiZuiCKKhcQN0OI0dvWfaMHULOUCn1cqaHLvkSeeFieNq0
 GpnyrcS35UL/rrPNOfq8gx0ZJxPHET1Gh92ImU2uNugo6Q5dIfypizUVENUQs/zMCmEQ
 l1yQ==
X-Gm-Message-State: AFqh2kqifqxQ5QO5RTSmyAUItwcBq9TVXF4Z2Q9BdcLJjripQDsDmOCU
 WhsYWmxFoBA9I7F+yW6+PIRnApuKbfcragqV
X-Google-Smtp-Source: AMrXdXu3xDLhZ/R4zYo3CWaOud9hN4QWeFpd6p86xW1EpWUug2JVN9rM+FM4VAnz7/ksgGEuggyjEQ==
X-Received: by 2002:a05:6a00:3020:b0:58d:92ff:8a2a with SMTP id
 ay32-20020a056a00302000b0058d92ff8a2amr25340215pfb.23.1674518452051; 
 Mon, 23 Jan 2023 16:00:52 -0800 (PST)
Received: from stoup.. (rrcs-173-198-77-218.west.biz.rr.com. [173.198.77.218])
 by smtp.gmail.com with ESMTPSA id
 x21-20020a056a00189500b0058bc37f3d13sm174104pfh.43.2023.01.23.16.00.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 23 Jan 2023 16:00:51 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, yier.jin@huawei.com, jonathan.cameron@huawei.com,
 leonardo.garcia@linaro.org
Subject: [PATCH 03/22] target/arm: Add isar_feature_aa64_rme
Date: Mon, 23 Jan 2023 14:00:08 -1000
Message-Id: <20230124000027.3565716-4-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230124000027.3565716-1-richard.henderson@linaro.org>
References: <20230124000027.3565716-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::432;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x432.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

Add the missing field for ID_AA64PFR0, and the predicate.
Disable it if EL3 is forced off by the board or command-line.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/cpu.h | 6 ++++++
 target/arm/cpu.c | 4 ++++
 2 files changed, 10 insertions(+)

diff --git a/target/arm/cpu.h b/target/arm/cpu.h
index 8cf70693be..81d5a51b62 100644
--- a/target/arm/cpu.h
+++ b/target/arm/cpu.h
@@ -2178,6 +2178,7 @@ FIELD(ID_AA64PFR0, SEL2, 36, 4)
 FIELD(ID_AA64PFR0, MPAM, 40, 4)
 FIELD(ID_AA64PFR0, AMU, 44, 4)
 FIELD(ID_AA64PFR0, DIT, 48, 4)
+FIELD(ID_AA64PFR0, RME, 52, 4)
 FIELD(ID_AA64PFR0, CSV2, 56, 4)
 FIELD(ID_AA64PFR0, CSV3, 60, 4)
 
@@ -4001,6 +4002,11 @@ static inline bool isar_feature_aa64_sel2(const ARMISARegisters *id)
     return FIELD_EX64(id->id_aa64pfr0, ID_AA64PFR0, SEL2) != 0;
 }
 
+static inline bool isar_feature_aa64_rme(const ARMISARegisters *id)
+{
+    return FIELD_EX64(id->id_aa64pfr0, ID_AA64PFR0, RME) != 0;
+}
+
 static inline bool isar_feature_aa64_vh(const ARMISARegisters *id)
 {
     return FIELD_EX64(id->id_aa64mmfr1, ID_AA64MMFR1, VH) != 0;
diff --git a/target/arm/cpu.c b/target/arm/cpu.c
index 5f63316dbf..b10ace74cd 100644
--- a/target/arm/cpu.c
+++ b/target/arm/cpu.c
@@ -1944,6 +1944,10 @@ static void arm_cpu_realizefn(DeviceState *dev, Error **errp)
         cpu->isar.id_dfr0 = FIELD_DP32(cpu->isar.id_dfr0, ID_DFR0, COPSDBG, 0);
         cpu->isar.id_aa64pfr0 = FIELD_DP64(cpu->isar.id_aa64pfr0,
                                            ID_AA64PFR0, EL3, 0);
+
+        /* Disable the realm management extension, which requires EL3. */
+        cpu->isar.id_aa64pfr0 = FIELD_DP64(cpu->isar.id_aa64pfr0,
+                                           ID_AA64PFR0, RME, 0);
     }
 
     if (!cpu->has_el2) {
-- 
2.34.1


