Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BE9904ECE8D
	for <lists+qemu-devel@lfdr.de>; Wed, 30 Mar 2022 23:07:28 +0200 (CEST)
Received: from localhost ([::1]:50004 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nZfXL-0006qp-IE
	for lists+qemu-devel@lfdr.de; Wed, 30 Mar 2022 17:07:27 -0400
Received: from eggs.gnu.org ([209.51.188.92]:57372)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1nZfUx-0003MT-5o; Wed, 30 Mar 2022 17:04:59 -0400
Received: from [2001:4860:4864:20::2d] (port=35992
 helo=mail-oa1-x2d.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1nZfUv-0003JQ-PN; Wed, 30 Mar 2022 17:04:58 -0400
Received: by mail-oa1-x2d.google.com with SMTP id
 586e51a60fabf-df22f50e0cso6068174fac.3; 
 Wed, 30 Mar 2022 14:04:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=hp7pjMYBS7VgheOvT8RWUomiLcmb/XAPpz8sgeGR9mI=;
 b=qXjUYGgGpEJNJH2PrME6R5JtP+fs33RH6v4YzNj+g8IGVznQLl5/2cGk+Su6/lJYfw
 qMBWI1Zoy1waXRdgcZagpx0dz+0XTrIJnpDhyZEmBuVTD0ikxg3K4AzCIBtWiJzaYcIb
 K233woca2vZxuefKnUt9Pu6eMDh6g9Ju+ZxJhJc0xX93ewo0rR84pl2qoLZWv+vol2RD
 x+YbQ01QHjqbuvE/Mx20xif2DB+BJVt52EdtRih33CMtDKCvNqV+yVU7mQ26JS8qntYV
 4gfLcPzXwAqxPf0JUIVwnUCMl5TEvCodhXboHpSpDF64nREMOeBqYeqlPwJwsfPdv8op
 mAsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=hp7pjMYBS7VgheOvT8RWUomiLcmb/XAPpz8sgeGR9mI=;
 b=R2cgw29Iw2ar3nHQ0kwRdQneoAxTu+V5FCr7glpTQ0k6sA6Ks5HSAxKyHrvJ2oiSd6
 oJAN/lmtlpY/RwjZTlze5CePgH4HZ2mYB7nd/srCSE9IJk/THR+2iEnJ4iW6AEWB2ZNq
 ZED2/CuHxrTUXfVxgzFCCGO3rFHz4NdIr75B1oz9bknPKSwFD3ur7wAU4povs13AwyKk
 wKVa7m3YByljuxtmAN6nkV6MvEkRvmiNZRcRHgO3wY4HVV+0WMisNp/NOOOA/f2klbO3
 ZJGMj62eV7+49DH7aImiLBtYcR5thPh9WfFNXLQcBvAQyp4YQRlMLoQvkMDgYMmpx4OG
 abaw==
X-Gm-Message-State: AOAM532ioqus+ksziNYwjRq7LhvnoeOFeHVhyLZEH36Pz7sBf0SqYEFH
 m5RrO+YE7focZRXxYCc4EHdWEDAyLwo=
X-Google-Smtp-Source: ABdhPJzN7JDIbDAlUFIK8meFg4rjsxpKKOWiY/SYpgg4jU+Uf6I4A1AkgEka1iEMtdkdzqTUsdHPCw==
X-Received: by 2002:a05:6871:5cd:b0:de:b44:5045 with SMTP id
 v13-20020a05687105cd00b000de0b445045mr928812oan.193.1648674296112; 
 Wed, 30 Mar 2022 14:04:56 -0700 (PDT)
Received: from rekt.ibmuc.com ([2804:431:c7c6:abe8:ed:2c78:ab0c:7946])
 by smtp.gmail.com with ESMTPSA id
 t19-20020a05687044d300b000de4e33171csm9988617oai.34.2022.03.30.14.04.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 30 Mar 2022 14:04:55 -0700 (PDT)
From: Daniel Henrique Barboza <danielhb413@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 2/4] target/ppc: init 'lpcr' in kvmppc_enable_cap_large_decr()
Date: Wed, 30 Mar 2022 18:04:41 -0300
Message-Id: <20220330210443.597500-3-danielhb413@gmail.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220330210443.597500-1-danielhb413@gmail.com>
References: <20220330210443.597500-1-danielhb413@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2001:4860:4864:20::2d
 (failed)
Received-SPF: pass client-ip=2001:4860:4864:20::2d;
 envelope-from=danielhb413@gmail.com; helo=mail-oa1-x2d.google.com
X-Spam_score_int: -3
X-Spam_score: -0.4
X-Spam_bar: /
X-Spam_report: (-0.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001, PDS_HP_HELO_NORDNS=0.659,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: Daniel Henrique Barboza <danielhb413@gmail.com>, qemu-ppc@nongnu.org,
 clg@kaod.org, david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

'lpcr' is used as an input of kvm_get_one_reg(). Valgrind doesn't
understand that and it returns warnings as such for this function:

==55240== Thread 1:
==55240== Conditional jump or move depends on uninitialised value(s)
==55240==    at 0xB011E4: kvmppc_enable_cap_large_decr (kvm.c:2546)
==55240==    by 0x92F28F: cap_large_decr_cpu_apply (spapr_caps.c:523)
==55240==    by 0x930C37: spapr_caps_cpu_apply (spapr_caps.c:921)
==55240==    by 0x955D3B: spapr_reset_vcpu (spapr_cpu_core.c:73)
==55240==    by 0x95612B: spapr_cpu_core_reset (spapr_cpu_core.c:209)
==55240==    by 0x95619B: spapr_cpu_core_reset_handler (spapr_cpu_core.c:218)
==55240==    by 0xD3605F: qemu_devices_reset (reset.c:69)
==55240==    by 0x92112B: spapr_machine_reset (spapr.c:1641)
==55240==    by 0x4FBD63: qemu_system_reset (runstate.c:444)
==55240==    by 0x62812B: qdev_machine_creation_done (machine.c:1247)
==55240==    by 0x5064C3: qemu_machine_creation_done (vl.c:2725)
==55240==    by 0x5065DF: qmp_x_exit_preconfig (vl.c:2748)
==55240==  Uninitialised value was created by a stack allocation
==55240==    at 0xB01158: kvmppc_enable_cap_large_decr (kvm.c:2540)

Init 'lpcr' to avoid this warning.

Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
---
 target/ppc/kvm.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/target/ppc/kvm.c b/target/ppc/kvm.c
index ce1b926e8c..9fb13b23d8 100644
--- a/target/ppc/kvm.c
+++ b/target/ppc/kvm.c
@@ -2539,7 +2539,7 @@ int kvmppc_get_cap_large_decr(void)
 int kvmppc_enable_cap_large_decr(PowerPCCPU *cpu, int enable)
 {
     CPUState *cs = CPU(cpu);
-    uint64_t lpcr;
+    uint64_t lpcr = 0;
 
     kvm_get_one_reg(cs, KVM_REG_PPC_LPCR_64, &lpcr);
     /* Do we need to modify the LPCR? */
-- 
2.35.1


