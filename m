Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 99FDE5092C6
	for <lists+qemu-devel@lfdr.de>; Thu, 21 Apr 2022 00:26:59 +0200 (CEST)
Received: from localhost ([::1]:52806 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nhImo-0003hS-OA
	for lists+qemu-devel@lfdr.de; Wed, 20 Apr 2022 18:26:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43966)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1nhIdj-0008IX-S8; Wed, 20 Apr 2022 18:17:35 -0400
Received: from mail-oa1-x36.google.com ([2001:4860:4864:20::36]:43392)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1nhIdi-00066N-96; Wed, 20 Apr 2022 18:17:35 -0400
Received: by mail-oa1-x36.google.com with SMTP id
 586e51a60fabf-e5e8523fcbso3502070fac.10; 
 Wed, 20 Apr 2022 15:17:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=6MfOxlg0VRi8uGiwjDS8j0Cej/8f7uoEf665ZoorZRA=;
 b=k8L1ODtelCI0ulQ70lDBP/vQ1gd/NlHa6BipwfWTcSZl2gICkqaeOQla5QDmQjRrKy
 PeyoXLSm08vloh+nyfES8FOihrD3rn9eoJPUBzW9Ow7K7ZVaLxaEEK8JmasCFfWClx+Z
 jPMohETa3fLtMMBqWVWVkvtdIreEpYITrdpoG/gMk86cYqzCRmm61FARRbZksXt7cENj
 fmVfN3qkpgtgMXk24OgsiWsmnPLXF0CtEWNFvjyaWpKwZuIajrWdWYiRxIEj9y/Xtz/b
 45J39tXeWSbCF2HIY7g4kzHW538F0uiNecOaQ2nXZCsy0MVItUdZKmlk4fvNHOnp1hn4
 Akag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=6MfOxlg0VRi8uGiwjDS8j0Cej/8f7uoEf665ZoorZRA=;
 b=nzrTRv0OhRBzQ5XQ9LqqBLLwVQ07exyIFU2AWX2/fqLmc3LqEl97OGifN/T+BXBxUe
 EYt4s2YOVJuYqyY6rEuXqbXuu+jR50mtV8y0ishzvf+TN2UYN2zMjfyxdLX9okBChl4R
 U2bRYgYCxmO58WUzawT9bvDTWKqY3QBNBmA/Rd7nx5gYDXUW85o4YqAb+x3lh3WLnt5C
 2lCQE+6RE8zalcQYzx/6AKtZgjipQguuR/gTqxwbWPKE5MFAkeFSffrzSNirT4AkVYWp
 ip/PYKd68FcBOo+nvNwxAhAPvpwIv37TBRmxm/A+uT34zO0SuGhp8Hxe/C8FOgU1KxTQ
 bjPQ==
X-Gm-Message-State: AOAM531qVsMuEdIf8tKlEdOYjzBcUqJhAGCNEIOZoLqTFc7msOqH5jRQ
 0aIMe4FhsnT3a9WDdlDG8tx8fC3fQJg=
X-Google-Smtp-Source: ABdhPJw8DHXwFvaWED/wiURs5FLSFKfRI6KFpsvGCrGLvXaMIs0UA/ulNZpmZvOkcBASDfwLsJP60Q==
X-Received: by 2002:a05:6870:5707:b0:de:2cb8:7759 with SMTP id
 k7-20020a056870570700b000de2cb87759mr2615136oap.20.1650493052724; 
 Wed, 20 Apr 2022 15:17:32 -0700 (PDT)
Received: from rekt.ibmuc.com ([2804:431:c7c7:486c:c4fd:c4aa:a799:60c2])
 by smtp.gmail.com with ESMTPSA id
 14-20020aca110e000000b00322847e6f53sm3876082oir.46.2022.04.20.15.17.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 20 Apr 2022 15:17:32 -0700 (PDT)
From: Daniel Henrique Barboza <danielhb413@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PULL 09/23] spapr: Move nested KVM hypercalls under a TCG only
 config.
Date: Wed, 20 Apr 2022 19:13:15 -0300
Message-Id: <20220420221329.169755-10-danielhb413@gmail.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220420221329.169755-1-danielhb413@gmail.com>
References: <20220420221329.169755-1-danielhb413@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2001:4860:4864:20::36;
 envelope-from=danielhb413@gmail.com; helo=mail-oa1-x36.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
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
Cc: peter.maydell@linaro.org, Fabiano Rosas <farosas@linux.ibm.com>,
 danielhb413@gmail.com, richard.henderson@linaro.org,
 Nicholas Piggin <npiggin@gmail.com>, qemu-ppc@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Fabiano Rosas <farosas@linux.ibm.com>

These are the spapr virtual hypervisor implementation of the nested
KVM API. They only make sense when running with TCG.

Signed-off-by: Fabiano Rosas <farosas@linux.ibm.com>
Reviewed-by: Nicholas Piggin <npiggin@gmail.com>
Message-Id: <20220325221113.255834-3-farosas@linux.ibm.com>
Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
---
 hw/ppc/spapr_hcall.c | 26 ++++++++++++++++++++------
 1 file changed, 20 insertions(+), 6 deletions(-)

diff --git a/hw/ppc/spapr_hcall.c b/hw/ppc/spapr_hcall.c
index 9b24db5e44..d761a7d0c3 100644
--- a/hw/ppc/spapr_hcall.c
+++ b/hw/ppc/spapr_hcall.c
@@ -1473,7 +1473,7 @@ target_ulong spapr_hypercall(PowerPCCPU *cpu, target_ulong opcode,
     return H_FUNCTION;
 }
 
-/* TCG only */
+#ifdef CONFIG_TCG
 #define PRTS_MASK      0x1f
 
 static target_ulong h_set_ptbl(PowerPCCPU *cpu,
@@ -1800,18 +1800,35 @@ out_restore_l1:
     spapr_cpu->nested_host_state = NULL;
 }
 
-#ifdef CONFIG_TCG
+static void hypercall_register_nested(void)
+{
+    spapr_register_hypercall(KVMPPC_H_SET_PARTITION_TABLE, h_set_ptbl);
+    spapr_register_hypercall(KVMPPC_H_ENTER_NESTED, h_enter_nested);
+    spapr_register_hypercall(KVMPPC_H_TLB_INVALIDATE, h_tlb_invalidate);
+    spapr_register_hypercall(KVMPPC_H_COPY_TOFROM_GUEST, h_copy_tofrom_guest);
+}
+
 static void hypercall_register_softmmu(void)
 {
     /* DO NOTHING */
 }
 #else
+void spapr_exit_nested(PowerPCCPU *cpu, int excp)
+{
+    g_assert_not_reached();
+}
+
 static target_ulong h_softmmu(PowerPCCPU *cpu, SpaprMachineState *spapr,
                             target_ulong opcode, target_ulong *args)
 {
     g_assert_not_reached();
 }
 
+static void hypercall_register_nested(void)
+{
+    /* DO NOTHING */
+}
+
 static void hypercall_register_softmmu(void)
 {
     /* hcall-pft */
@@ -1881,10 +1898,7 @@ static void hypercall_register_types(void)
 
     spapr_register_hypercall(KVMPPC_H_UPDATE_DT, h_update_dt);
 
-    spapr_register_hypercall(KVMPPC_H_SET_PARTITION_TABLE, h_set_ptbl);
-    spapr_register_hypercall(KVMPPC_H_ENTER_NESTED, h_enter_nested);
-    spapr_register_hypercall(KVMPPC_H_TLB_INVALIDATE, h_tlb_invalidate);
-    spapr_register_hypercall(KVMPPC_H_COPY_TOFROM_GUEST, h_copy_tofrom_guest);
+    hypercall_register_nested();
 }
 
 type_init(hypercall_register_types)
-- 
2.35.1


