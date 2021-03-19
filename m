Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E4C83424E1
	for <lists+qemu-devel@lfdr.de>; Fri, 19 Mar 2021 19:39:24 +0100 (CET)
Received: from localhost ([::1]:43150 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lNK1r-0001NY-6X
	for lists+qemu-devel@lfdr.de; Fri, 19 Mar 2021 14:39:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54004)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1lNJxz-00076q-8i; Fri, 19 Mar 2021 14:35:23 -0400
Received: from mail-qt1-x82c.google.com ([2607:f8b0:4864:20::82c]:42695)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1lNJxr-0006b6-PJ; Fri, 19 Mar 2021 14:35:22 -0400
Received: by mail-qt1-x82c.google.com with SMTP id l13so7485693qtu.9;
 Fri, 19 Mar 2021 11:35:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=TXhvhsAsjTPYbXGvNxr2c2Ly+MOvhfbMfUVP+cDgOWo=;
 b=jGKXfdt/gEeoKuh25uwqAGyVa6g1oLH+Wa5oO2AZbbyr4RhuBngNbeRz/r5wfI95bE
 cgGRZWmDsARKxp5nt2qVB8KBLu6s7iArkpqMZIQ6OFL6P1BEWZx4IqLrNCZHM21MGdsV
 s67bxZXUVYnmQxK6tk6a6zcjRUwc3ySrIpTlPMnN8fsExFHXYHRylqLjPrfpU68l2vre
 dZ04rQ2oPPfp6fkJ0QtO+me3fkWoRlJKs184B+FPdL61Mzdzr3PLsaf4PaU7G0/wSjRI
 XI+d6oElb0w/T3/4X+fWflyC3iScZ0bBxq/7mky7YLRPqCdkDnC0JPtOEV2B2OUl9Y5w
 1j9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=TXhvhsAsjTPYbXGvNxr2c2Ly+MOvhfbMfUVP+cDgOWo=;
 b=GXL3Sr5UL2nbZKDNxSmrgJRJFf5AytwPnPGGLdcWl9BvYGjh5O1o/0rdCW7YgVJlVq
 HFTD489fX4FvxHNSpMqSw5mPagVRwp807ATvXrL6BXUXfN3z70Cx+fVjU3rwNv8L5IIk
 3ogkhPoDwswz00KYZxA8V5VmjuZxLgGDJ4Fm4MmAmrBROYNoL1qyYJP0OVUmbflMqrnL
 4lhwxrIzOh7oAT7Xf12q07KsUKGJc3GiymPyajmolRZ0krnAS0xTnW9A7FwbsMU9UwdP
 0K4/W4C9BS78pvoloULT7ibFW2SPX62i5/HhXDvI1VrurXHoMChc4MN1Xi+DHpmZHha7
 SIHA==
X-Gm-Message-State: AOAM532nxC/MQ30Aq5gNdsj1MITgPi3j7YTFI1MEaAq5BKEH8ygBSayl
 rTjKHvQ4QAV5BPnpYTYhRzrugewb6Bg=
X-Google-Smtp-Source: ABdhPJyz8IHpMZObBdxDsFCWikEF2a1I+0FYyYpqKyqmwO2qG82VEEtsWtAjSkLMlCdvi2RjJOdYLA==
X-Received: by 2002:aed:20cd:: with SMTP id 71mr9717421qtb.346.1616178914320; 
 Fri, 19 Mar 2021 11:35:14 -0700 (PDT)
Received: from localhost.localdomain ([2804:431:c7c7:cc80:21a:fa87:b9b8:5376])
 by smtp.gmail.com with ESMTPSA id
 r35sm2660225qtd.95.2021.03.19.11.35.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 19 Mar 2021 11:35:14 -0700 (PDT)
From: Daniel Henrique Barboza <danielhb413@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 2/2] spapr.c: remove 'ibm,chip-id' from DT
Date: Fri, 19 Mar 2021 15:34:53 -0300
Message-Id: <20210319183453.4466-3-danielhb413@gmail.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210319183453.4466-1-danielhb413@gmail.com>
References: <20210319183453.4466-1-danielhb413@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::82c;
 envelope-from=danielhb413@gmail.com; helo=mail-qt1-x82c.google.com
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
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
Cc: Alexey Kardashevskiy <aik@ozlabs.ru>,
 Daniel Henrique Barboza <danielhb413@gmail.com>, groug@kaod.org,
 qemu-ppc@nongnu.org, clg@kaod.org, david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The attribute 'ibm,chip-id' does not exist in PAPR. This alone would be
enough reason to remove it from the spapr DT, but before doing that,
let's give a brief context on how and why it was introduced.

'ibm,chip-id' was added in the spapr DT by commit 10582ff83279. This
commit references kernel commit 256f2d4b463d ("powerpc: Use ibm,chip-id
property to compute cpu_core_mask if available"). In this kernel commit,
the 'ibm,chip-id' DT attribute is being used to calculate the
cpu_core_mask in traverse_siblings_chip_id(). This function still need
to consider 'ibm,chip-id' not being available as well to avoid breaking
older guests.

Later on, kernel commit df52f6714071 ("powerpc/smp: Rework CPU topology
construction") removed traverse_siblings_chip_id() and its callers,
making the CPU topology calculation independent of the 'ibm,chip-id'
attribute.

Last, but perhaps most relevant, kernel commit 4ca234a9cbd7
("powerpc/smp: Stop updating cpu_core_mask") changed the way the kernel
calculates the cpu_core_mask, removing the use of 'ibm,chip-id' in the
calculation altogether, with consequences already discussed in the
previous patch.

All that said, since it's not in PAPR and the pseries kernel does not
rely on it, let's remove ibm,chip-id from the DT for the default machine
type. This removal is related to the previous SMP change, so re-use the
same smc->pre_6_0_smp_topology flag.

CC: Alexey Kardashevskiy <aik@ozlabs.ru>
Suggested-by: Cédric Le Goater <clg@kaod.org>
Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
---
 hw/ppc/spapr.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/hw/ppc/spapr.c b/hw/ppc/spapr.c
index 745f71c243..58efb51ac7 100644
--- a/hw/ppc/spapr.c
+++ b/hw/ppc/spapr.c
@@ -649,6 +649,7 @@ static void spapr_dt_cpu(CPUState *cs, void *fdt, int offset,
     PowerPCCPU *cpu = POWERPC_CPU(cs);
     CPUPPCState *env = &cpu->env;
     PowerPCCPUClass *pcc = POWERPC_CPU_GET_CLASS(cs);
+    SpaprMachineClass *smc = SPAPR_MACHINE_GET_CLASS(ms);
     int index = spapr_get_vcpu_id(cpu);
     uint32_t segs[] = {cpu_to_be32(28), cpu_to_be32(40),
                        0xffffffff, 0xffffffff};
@@ -745,8 +746,10 @@ static void spapr_dt_cpu(CPUState *cs, void *fdt, int offset,
 
     spapr_dt_pa_features(spapr, cpu, fdt, offset);
 
-    _FDT((fdt_setprop_cell(fdt, offset, "ibm,chip-id",
-                           cs->cpu_index / vcpus_per_socket)));
+    if (smc->pre_6_0_smp_topology) {
+        _FDT((fdt_setprop_cell(fdt, offset, "ibm,chip-id",
+                               cs->cpu_index / vcpus_per_socket)));
+    }
 
     _FDT((fdt_setprop(fdt, offset, "ibm,pft-size",
                       pft_size_prop, sizeof(pft_size_prop))));
-- 
2.29.2


