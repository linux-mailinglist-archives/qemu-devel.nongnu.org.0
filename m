Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D59004ED0F9
	for <lists+qemu-devel@lfdr.de>; Thu, 31 Mar 2022 02:41:09 +0200 (CEST)
Received: from localhost ([::1]:40124 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nZis8-0002NC-Ur
	for lists+qemu-devel@lfdr.de; Wed, 30 Mar 2022 20:41:08 -0400
Received: from eggs.gnu.org ([209.51.188.92]:37054)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1nZiVY-00065U-QN; Wed, 30 Mar 2022 20:17:48 -0400
Received: from [2607:f8b0:4864:20::330] (port=38601
 helo=mail-ot1-x330.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1nZiVX-0003B8-Ag; Wed, 30 Mar 2022 20:17:48 -0400
Received: by mail-ot1-x330.google.com with SMTP id
 a7-20020a9d5c87000000b005ad1467cb59so16081548oti.5; 
 Wed, 30 Mar 2022 17:17:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=SAThiALREL0XgXauyo5M0z5vH8LMryC/mz3jmxrZQMQ=;
 b=a1IlBj+HtbW6FskVwOQvqJqz3kac5pqfDl4YVPuxFFsb8QYYbY+EjUarOdlKkiTCkS
 zbiLVY/7zzypbpZah7v5xcYhoX4O6n/yiln7FofjlVSe8fnhBdf4xH7M/Hbsr7Z9jLhM
 Ni/2asZgARSvxGbG7sgR5Tc8V05nLQIFI29qzaHalwFkDqQvCSRyfcgnjxcsuPWvmfFJ
 LVy2ahdKedfMoza989vurwj2jMez3+pieMUYbgq3HeP4QBEEUQi2xRRBJdBOuMSNlUrm
 WXDmn9k1HqgMjXTfEfkI2wddWkT2Hnw5y4jSyKc0NfWEusTODFH4b789LlEfkLOOThL7
 3f5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=SAThiALREL0XgXauyo5M0z5vH8LMryC/mz3jmxrZQMQ=;
 b=0Lf1r2pdAQjR/84/aFnVX/BXkWNai8VVVvQTDTI98dqQW2h98duZzHcFMbd7QRvSkN
 DD/amswFUUk4XYTv/Ss5tId8SHLQHkMh1Go2xR6AvRBoIsnLQ/hRc2FECyE+R1LqfCN8
 oARO+d5wbQt8uVRUEL+LnjTkfbvMF1nSG52PYi4FLgB8JhLv8Uozm08qRox9dkLd+JYA
 NKeHwoVNe0aIPLhjI3AKS3M6SSTB7bA0CmxvscUgBgWOai2U8I53H6XGRG5zdjDeappa
 pwfqq6fyaOqxS9AN7zfG8vkbKrvuGcKbg7YZPa171GasuY/MweSdr3VJw0nPQJNKb1wS
 ItVQ==
X-Gm-Message-State: AOAM531etXyGasjUvYjLkpoYaG9/pRHXHkCJW7q4z+yzeYwB37FoAKno
 P4gsdpWbdXb4t/+XBXmpCtMo1L5ptm8=
X-Google-Smtp-Source: ABdhPJwPdh1HQSwS5NcjtJE/hVwpvZS3+UwozoeCAEFY3Hrp6YF96eG9qPWUZt98HCYv7LMUAMdljA==
X-Received: by 2002:a05:6830:2438:b0:5b2:5d36:fec2 with SMTP id
 k24-20020a056830243800b005b25d36fec2mr4785290ots.173.1648685865617; 
 Wed, 30 Mar 2022 17:17:45 -0700 (PDT)
Received: from rekt.ibmuc.com ([2804:431:c7c6:abe8:ed:2c78:ab0c:7946])
 by smtp.gmail.com with ESMTPSA id
 j126-20020acab984000000b002da77222b7dsm11149190oif.22.2022.03.30.17.17.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 30 Mar 2022 17:17:45 -0700 (PDT)
From: Daniel Henrique Barboza <danielhb413@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 2/4] target/ppc: init 'lpcr' in
 kvmppc_enable_cap_large_decr()
Date: Wed, 30 Mar 2022 21:17:15 -0300
Message-Id: <20220331001717.616938-3-danielhb413@gmail.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220331001717.616938-1-danielhb413@gmail.com>
References: <20220331001717.616938-1-danielhb413@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::330
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::330;
 envelope-from=danielhb413@gmail.com; helo=mail-ot1-x330.google.com
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
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Daniel Henrique Barboza <danielhb413@gmail.com>, qemu-ppc@nongnu.org,
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

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
---
 target/ppc/kvm.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/target/ppc/kvm.c b/target/ppc/kvm.c
index 858866ecd4..42814e1b97 100644
--- a/target/ppc/kvm.c
+++ b/target/ppc/kvm.c
@@ -2538,7 +2538,7 @@ int kvmppc_get_cap_large_decr(void)
 int kvmppc_enable_cap_large_decr(PowerPCCPU *cpu, int enable)
 {
     CPUState *cs = CPU(cpu);
-    uint64_t lpcr;
+    uint64_t lpcr = 0;
 
     kvm_get_one_reg(cs, KVM_REG_PPC_LPCR_64, &lpcr);
     /* Do we need to modify the LPCR? */
-- 
2.35.1


