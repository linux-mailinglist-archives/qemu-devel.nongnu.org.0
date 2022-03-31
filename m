Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 01F354ED0DA
	for <lists+qemu-devel@lfdr.de>; Thu, 31 Mar 2022 02:28:02 +0200 (CEST)
Received: from localhost ([::1]:49028 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nZifR-0005Lm-3X
	for lists+qemu-devel@lfdr.de; Wed, 30 Mar 2022 20:28:01 -0400
Received: from eggs.gnu.org ([209.51.188.92]:37038)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1nZiVW-00064g-Uc; Wed, 30 Mar 2022 20:17:48 -0400
Received: from [2001:4860:4864:20::34] (port=39327
 helo=mail-oa1-x34.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1nZiVV-000304-EJ; Wed, 30 Mar 2022 20:17:46 -0400
Received: by mail-oa1-x34.google.com with SMTP id
 586e51a60fabf-deb9295679so16503565fac.6; 
 Wed, 30 Mar 2022 17:17:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=sOivFOrFSTEw7stIbfEnO86R22xeQdY78hcGuIajqB0=;
 b=WGkkchYftdejXjUKEFxSUX/Lf6SDTnx3slCandQtZpC7ptIib2cbGgWVPPbp84LMqP
 0tRZCb3EHZ3kYSx19yriOtfGwKS/cSQPy4YCjT1JDZWlMyfkavJW/jMjrcfMhTO3JTgd
 dnIgZ9p41ItUKzf4WDxFvS4ASt3IKWsg2fv2lB4ISOJCkhw4MxSGlqcA+0F+WtBYCJLo
 Lqge1lWGOP+PnWGwGjNTR0fvijc7gozcUtP8jVfvVoJ5hZx4eISqedRZ4xl+mOhlIH/I
 roU83AgrXAibFuyN89dCK/d5Zt/GZYb48ao0cfZjX9p+jTAxbfBY6rR618JxHNKIdQc7
 9BPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=sOivFOrFSTEw7stIbfEnO86R22xeQdY78hcGuIajqB0=;
 b=I1GMgOXha0tP2K+G2ToTq8pt3V0urWu3dsH+/kCwJq9jUmVdSoGKSUARq+VTQXE4s3
 9G6t0DFeZc8yHsarprFhwj8UINQ31hUyPQyh/UE3DVE6BjvbuKUVOmRRzR09C+Mnneag
 irvx5+HGP38zsScd8JJR6ty6+i8T9gpo4EAo4dJ82opW6bwwBneJ7tfTOT81cmVkQEFr
 RInPjIFky9JxX6awGPb46mWvSdnuMsx0wisjS7fWcJ0gkMnoMvBUtYAS7eUfGmxEbkrj
 CMagY+vKibjhF2ue7BBGH5U3CcTJf9YJ6DSPpTjA2HAW9xlUfOzzrj4lRVxohG3QnDj+
 sLyg==
X-Gm-Message-State: AOAM531SGfageFMA3SHWM9eQmmnjAViopwPigiS32OWuP+1eWjfqXQRU
 MMNkSkRv4Fif2gOybD7f1PbuAW8dVYY=
X-Google-Smtp-Source: ABdhPJxZEUUWqZkTd6YI9/pIhgQAx3GauLDNqC+in6H0cArrH1miTC3ec4VSJCbpDYBy02bpe8aFRg==
X-Received: by 2002:a05:6870:b02a:b0:de:aa91:898c with SMTP id
 y42-20020a056870b02a00b000deaa91898cmr1350236oae.25.1648685863400; 
 Wed, 30 Mar 2022 17:17:43 -0700 (PDT)
Received: from rekt.ibmuc.com ([2804:431:c7c6:abe8:ed:2c78:ab0c:7946])
 by smtp.gmail.com with ESMTPSA id
 j126-20020acab984000000b002da77222b7dsm11149190oif.22.2022.03.30.17.17.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 30 Mar 2022 17:17:43 -0700 (PDT)
From: Daniel Henrique Barboza <danielhb413@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 1/4] target/ppc: initialize 'val' union in kvm_get_one_spr()
Date: Wed, 30 Mar 2022 21:17:14 -0300
Message-Id: <20220331001717.616938-2-danielhb413@gmail.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220331001717.616938-1-danielhb413@gmail.com>
References: <20220331001717.616938-1-danielhb413@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2001:4860:4864:20::34
 (failed)
Received-SPF: pass client-ip=2001:4860:4864:20::34;
 envelope-from=danielhb413@gmail.com; helo=mail-oa1-x34.google.com
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

Valgrind isn't convinced that we are initializing the values we assign
to env->spr[spr] because it doesn't understand that the 'val' union is
being written by the kvm_vcpu_ioctl() that follows (via struct
kvm_one_reg).

This results in Valgrind complaining about uninitialized values every
time we use env->spr in a conditional, like this instance:

==707578== Thread 1:
==707578== Conditional jump or move depends on uninitialised value(s)
==707578==    at 0xA10A40: hreg_compute_hflags_value (helper_regs.c:106)
==707578==    by 0xA10C9F: hreg_compute_hflags (helper_regs.c:173)
==707578==    by 0xA110F7: hreg_store_msr (helper_regs.c:262)
==707578==    by 0xA051A3: ppc_cpu_reset (cpu_init.c:7168)
==707578==    by 0xD4730F: device_transitional_reset (qdev.c:799)
==707578==    by 0xD4A11B: resettable_phase_hold (resettable.c:182)
==707578==    by 0xD49A77: resettable_assert_reset (resettable.c:60)
==707578==    by 0xD4994B: resettable_reset (resettable.c:45)
==707578==    by 0xD458BB: device_cold_reset (qdev.c:296)
==707578==    by 0x48FBC7: cpu_reset (cpu-common.c:114)
==707578==    by 0x97B5EB: spapr_reset_vcpu (spapr_cpu_core.c:38)
==707578==    by 0x97BABB: spapr_cpu_core_reset (spapr_cpu_core.c:209)
==707578==  Uninitialised value was created by a stack allocation
==707578==    at 0xB11F08: kvm_get_one_spr (kvm.c:543)

Initializing 'val' has no impact in the logic and makes Valgrind output
more bearable.

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
---
 target/ppc/kvm.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/target/ppc/kvm.c b/target/ppc/kvm.c
index dc93b99189..858866ecd4 100644
--- a/target/ppc/kvm.c
+++ b/target/ppc/kvm.c
@@ -543,10 +543,11 @@ static void kvm_get_one_spr(CPUState *cs, uint64_t id, int spr)
 {
     PowerPCCPU *cpu = POWERPC_CPU(cs);
     CPUPPCState *env = &cpu->env;
+    /* Init 'val' to avoid "uninitialised value" Valgrind warnings */
     union {
         uint32_t u32;
         uint64_t u64;
-    } val;
+    } val = { };
     struct kvm_one_reg reg = {
         .id = id,
         .addr = (uintptr_t) &val,
-- 
2.35.1


