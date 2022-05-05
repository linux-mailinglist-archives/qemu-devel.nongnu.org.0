Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EF84351C8BA
	for <lists+qemu-devel@lfdr.de>; Thu,  5 May 2022 21:11:59 +0200 (CEST)
Received: from localhost ([::1]:57794 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nmgtL-0001wQ-2t
	for lists+qemu-devel@lfdr.de; Thu, 05 May 2022 15:11:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46890)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1nmgYS-0002YP-QF; Thu, 05 May 2022 14:50:24 -0400
Received: from mail-oi1-x22d.google.com ([2607:f8b0:4864:20::22d]:38650)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1nmgYO-0004Mr-Cz; Thu, 05 May 2022 14:50:24 -0400
Received: by mail-oi1-x22d.google.com with SMTP id r185so435403oih.5;
 Thu, 05 May 2022 11:50:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Tyv6DKZTyEtbbjp2Y4mGixcjfCU3B5FHNbPjr8yeNfI=;
 b=BG+7HpVjDVBriEnXAjh7HI5/oPTz2Dyvch1BabDMIkfrBDXU5+rODJQEPvjO9nDMtp
 eTx4I+Th0RZY4F1r/3yIbzS2tlrdEmEdn8Vlp+XURYr8ujZAl/fRtXRZ7mqtLxl+ty2f
 HqJA3v3sZ4ZrQBBDptKgimBlbpzbAGUgJqmMzr9PXDAJxGYezSxO4rnPKGgYF35PO/9h
 mheltiuGnQ6nlR7/BODjDMviGKP2QnKm7Qb1HL7RyvjSaXYecIGI9UUxuHyRsjhUJgoG
 5Urm4W1QRRqUKp24HWsPnBtt7v1mts/6lczUQyUVJUohoc9Pn3NpmmI74WUocGNx+yZB
 e30g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Tyv6DKZTyEtbbjp2Y4mGixcjfCU3B5FHNbPjr8yeNfI=;
 b=2wHET0THYF8/CMw37TT/T165lTpZomfj6AHKeSD296W/dSH7RKp+VZ6Lz+xtjfVSK4
 gjBb3q9Zzn2FesEWYwZMfVjbZBJPLc7ni5togVid/hAN2EtRpkl0WRJ8bcFd7KP48VgI
 XXcuEM8cQpOvL+CJiFVWXjMd7/aHo5inhAa3swR5Y5vom5ieBVqnuJswi5KUv7iZ5YKp
 rnRMkU/JawEUiBdFAwUzpEvq6IPMxy9Igq1wVib5K/CUbFJCEYOuYmjkUVie28DxYr3h
 LBrJO7yTWY0QZzLUQjwV2Vuqwgj0Gek0kkrqk0BVydU6XZ7nGFeYbmjPu3HNxBDlTLmd
 jn2A==
X-Gm-Message-State: AOAM530M3SJ7z7uUhJFmcemIPe2kSzM6XcH/b3uUWeLox9Thp6akjHff
 dU1qSjs1/q/i3wEB7qAIX0kA8hvAlkY=
X-Google-Smtp-Source: ABdhPJwZVuiYHMWZl10+1WrKr7Q0/0c0focAHHr5LcNmrMBi43rj7SUPO1XelpU+C2QB49TE40m12A==
X-Received: by 2002:aca:330b:0:b0:326:566a:5a74 with SMTP id
 z11-20020aca330b000000b00326566a5a74mr3257301oiz.6.1651776610466; 
 Thu, 05 May 2022 11:50:10 -0700 (PDT)
Received: from balboa.ibmuc.com (201-1-57-208.dsl.telesp.net.br.
 [201.1.57.208]) by smtp.gmail.com with ESMTPSA id
 n67-20020aca4046000000b00325cda1ff94sm917146oia.19.2022.05.05.11.50.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 05 May 2022 11:50:10 -0700 (PDT)
From: Daniel Henrique Barboza <danielhb413@gmail.com>
To: qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, danielhb413@gmail.com, peter.maydell@linaro.org,
 richard.henderson@linaro.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Subject: [PULL 02/30] target/ppc: init 'lpcr' in kvmppc_enable_cap_large_decr()
Date: Thu,  5 May 2022 15:49:10 -0300
Message-Id: <20220505184938.351866-3-danielhb413@gmail.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220505184938.351866-1-danielhb413@gmail.com>
References: <20220505184938.351866-1-danielhb413@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::22d;
 envelope-from=danielhb413@gmail.com; helo=mail-oi1-x22d.google.com
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
Message-Id: <20220331001717.616938-3-danielhb413@gmail.com>
Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
---
 target/ppc/kvm.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/target/ppc/kvm.c b/target/ppc/kvm.c
index 01baea467f..69094ddb7a 100644
--- a/target/ppc/kvm.c
+++ b/target/ppc/kvm.c
@@ -2537,7 +2537,7 @@ int kvmppc_get_cap_large_decr(void)
 int kvmppc_enable_cap_large_decr(PowerPCCPU *cpu, int enable)
 {
     CPUState *cs = CPU(cpu);
-    uint64_t lpcr;
+    uint64_t lpcr = 0;
 
     kvm_get_one_reg(cs, KVM_REG_PPC_LPCR_64, &lpcr);
     /* Do we need to modify the LPCR? */
-- 
2.32.0


