Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F9EF4ECE8C
	for <lists+qemu-devel@lfdr.de>; Wed, 30 Mar 2022 23:07:04 +0200 (CEST)
Received: from localhost ([::1]:49520 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nZfWx-0006WF-Hc
	for lists+qemu-devel@lfdr.de; Wed, 30 Mar 2022 17:07:03 -0400
Received: from eggs.gnu.org ([209.51.188.92]:57358)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1nZfUv-0003HE-DK; Wed, 30 Mar 2022 17:04:57 -0400
Received: from [2607:f8b0:4864:20::32e] (port=34391
 helo=mail-ot1-x32e.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1nZfUt-0003J1-Ny; Wed, 30 Mar 2022 17:04:57 -0400
Received: by mail-ot1-x32e.google.com with SMTP id
 n19-20020a9d7113000000b005cd9cff76c3so15779899otj.1; 
 Wed, 30 Mar 2022 14:04:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=p//+aQh/WyFlQZ0jwYqkJQu/+QJtwDv0P3hrdxIZ2mY=;
 b=cvlB7n9Hfuy9YhV0YqvjCBAj39d26C7eneFkOd7V8ANZd/8cdnCkIB93zsE+f9aUxm
 TM4TPjW3ZjB0MAz5Y+RMHfuTCXp//jM+b8+U8/mYU9+Te72g8XIatjj5L9lpZGo4lWVA
 X0+RLCV00XrXTU370GGW4ostVad7qCY9wUbw92lxGIO8xjISEFeDI3k9ZbSx6958owHF
 IX4q33UhTU70n/cvR7artToBKM6UjK9DgkcoFj2PvL+aLhsankOovP5Ct/zZFGNbtIqA
 7wv1IgGSxgHwJWwPrB3ESWdXI36njq/+TQ5w2cvSzOVAYWT3HLku7zhwba7ku0hX/QDy
 hptA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=p//+aQh/WyFlQZ0jwYqkJQu/+QJtwDv0P3hrdxIZ2mY=;
 b=zpNi4SQB0cqn21jYNNoMiSaVF48ujb0bY5sZ6qqYR16JQczAGlOVQA3C+ItBB6YBk8
 hcUp7ER07yFjDJhY8DBmjRar2GzUrFDd8S4MOTAG41XqAl2Wb3sX4kVTeHK24YFEKGRc
 L1ujEf8FHCv4EsookVhlesBSgVVqh4CGKsIu17JaVDClXbG9PC7PYHkKVToTv/BTx2B0
 BmwIERF+9MiBV2AhczII9q3nu7ALjUTLfpx7ewi0SsQECx9R4xsybZTl12z2W4XXxRFl
 6BkQekOozHRCSp4iGsunUpV1JfSBCP1gZaQ2iFl1YztI3GhdqIHAY1ojC0jNQ1wfV+A0
 UBoQ==
X-Gm-Message-State: AOAM5328I3E861nRwnQJb42th3jWA01dZYjdT+iHXXEqZ4TqVZkjKN4D
 f06LaslT6900gT8KjeSOsirOgAx2RM4=
X-Google-Smtp-Source: ABdhPJxYf8SSZK8puC/WzTsj1bRofqJfA5Q/wLVFKn5qTXlZQTaFldNFgCxX4JicjIQfpEOJ/E9wVg==
X-Received: by 2002:a9d:6e89:0:b0:5b2:4c01:2210 with SMTP id
 a9-20020a9d6e89000000b005b24c012210mr4263910otr.85.1648674294147; 
 Wed, 30 Mar 2022 14:04:54 -0700 (PDT)
Received: from rekt.ibmuc.com ([2804:431:c7c6:abe8:ed:2c78:ab0c:7946])
 by smtp.gmail.com with ESMTPSA id
 t19-20020a05687044d300b000de4e33171csm9988617oai.34.2022.03.30.14.04.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 30 Mar 2022 14:04:53 -0700 (PDT)
From: Daniel Henrique Barboza <danielhb413@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 1/4] target/ppc: initialize 'reg_val' in kvm_get_one_spr()
Date: Wed, 30 Mar 2022 18:04:40 -0300
Message-Id: <20220330210443.597500-2-danielhb413@gmail.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220330210443.597500-1-danielhb413@gmail.com>
References: <20220330210443.597500-1-danielhb413@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::32e
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::32e;
 envelope-from=danielhb413@gmail.com; helo=mail-ot1-x32e.google.com
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

Valgrind isn't convinced that we are initializing the values we assign
to env->spr[spr] because it doesn't understand that the 'reg_val' union
is being written by the kvm_vcpu_ioctl() that follows (via struct
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

Initializing 'reg_val' has no impact in the logic and makes Valgrind
output more bearable.

Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
---
 target/ppc/kvm.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/target/ppc/kvm.c b/target/ppc/kvm.c
index dc93b99189..ce1b926e8c 100644
--- a/target/ppc/kvm.c
+++ b/target/ppc/kvm.c
@@ -543,10 +543,12 @@ static void kvm_get_one_spr(CPUState *cs, uint64_t id, int spr)
 {
     PowerPCCPU *cpu = POWERPC_CPU(cs);
     CPUPPCState *env = &cpu->env;
-    union {
+    union reg_val {
         uint32_t u32;
         uint64_t u64;
-    } val;
+    };
+    /* Init reg_val to avoid "uninitialised value" Valgrind warnings */
+    union reg_val val = {0};
     struct kvm_one_reg reg = {
         .id = id,
         .addr = (uintptr_t) &val,
-- 
2.35.1


