Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AFC1544CA9D
	for <lists+qemu-devel@lfdr.de>; Wed, 10 Nov 2021 21:27:10 +0100 (CET)
Received: from localhost ([::1]:57114 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mkuBZ-0006LS-Jp
	for lists+qemu-devel@lfdr.de; Wed, 10 Nov 2021 15:27:09 -0500
Received: from eggs.gnu.org ([209.51.188.92]:54584)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1mku9z-0004Z5-Rx; Wed, 10 Nov 2021 15:25:31 -0500
Received: from [2607:f8b0:4864:20::a31] (port=37377
 helo=mail-vk1-xa31.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1mku9w-0004xQ-O7; Wed, 10 Nov 2021 15:25:30 -0500
Received: by mail-vk1-xa31.google.com with SMTP id e64so2068737vke.4;
 Wed, 10 Nov 2021 12:25:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=hRNe4cCzso0a7Iq8HRMFu6pk9I7wOghphS37PuWjXNs=;
 b=EAt0CGmuHp45TXk5EdYF76Cd+JRGvsnJg+7aQuUSQEWLUQmsjAvmJ26zgaKw+qSOxQ
 +VCLX7w+/5ROvKWrI1BAz8NVc1xpRStqyINNt4Lb9AA91K6/YRO0/KqNWmBqBKdhvoEB
 TCvN8ypDrynzf0YVQviFuwNCK1NlS4tUcnypgp4Z7O9ZIR4CuZxuoEfE1Yeg7WexEdAv
 +z6X3gr4XOsNjYWDiElXMSk+Cxc+d19j7lQO06KDQzCnp3VSqigPHchl7E3KBi6lJHfU
 oxweE8IDafVnTulQG4qrD6zLnBdvONTUfSpaXHOrC7v+k5BihpgLpOv4Aq1Wl5EmV3Wd
 97qg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=hRNe4cCzso0a7Iq8HRMFu6pk9I7wOghphS37PuWjXNs=;
 b=paKN9xVQjuIuHkNAOynm1jffwsaLQzoVGQMuS3jVKW/RjtGEe6ZbreBSIEV1j/NFe5
 TMj0a+UE77+5E/QuV4oImrDFlRxKgZlTY8WADWowy/N15ouqb2dFWQIw0SNJny5KXePh
 i5icqUA9YBsye0ZXvujCCDrgyeOYyB1WH6ZFs6AwUYPH5PCSnCmM+2olo740JQMmDXAu
 ydKgbv55VJvlsNsN2OWpk4dLMx//0tqAUN9yhHqWute0rdYg12ZQhrev+s82se79i4I9
 rljghXhx1w1YgU2SHY7HLHx8uInhz5Bxos6Gp4Bj9H+r2byIgymEOvPxZzyQrbxM6Xnu
 HoDw==
X-Gm-Message-State: AOAM533K5shkx71EJLEuNB7KWZtxpcpw/J2aooPEFyGlQ2zOrwhwFklI
 Mv2cxa2+FrjnXLE8UiCJZFMFIdtsOII=
X-Google-Smtp-Source: ABdhPJzbgGOrJg2LiqBXvV9oehpEwuiaZPiWIKtexF8ACfaE4NJKvFJ9lfZ5qMwom+TL/XIXG9v31A==
X-Received: by 2002:a1f:2591:: with SMTP id l139mr2313676vkl.5.1636575927422; 
 Wed, 10 Nov 2021 12:25:27 -0800 (PST)
Received: from rekt.ibmuc.com ([189.79.219.109])
 by smtp.gmail.com with ESMTPSA id u125sm679029vsb.4.2021.11.10.12.25.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 10 Nov 2021 12:25:27 -0800 (PST)
From: Daniel Henrique Barboza <danielhb413@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 1/1] ppc/mmu_helper.c: do not truncate 'ea' in
 booke206_invalidate_ea_tlb()
Date: Wed, 10 Nov 2021 17:25:16 -0300
Message-Id: <20211110202516.1993815-2-danielhb413@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211110202516.1993815-1-danielhb413@gmail.com>
References: <20211110202516.1993815-1-danielhb413@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::a31
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::a31;
 envelope-from=danielhb413@gmail.com; helo=mail-vk1-xa31.google.com
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001, PDS_HP_HELO_NORDNS=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Daniel Henrique Barboza <danielhb413@gmail.com>, f4bug@amsat.org,
 qemu-ppc@nongnu.org, clg@kaod.org, david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

'tlbivax' is implemented by gen_tlbivax_booke206() via
gen_helper_booke206_tlbivax(). In case the TLB needs to be flushed,
booke206_invalidate_ea_tlb() is called. All these functions, but
booke206_invalidate_ea_tlb(), uses a 64-bit effective address 'ea'.

booke206_invalidate_ea_tlb() uses an uint32_t 'ea' argument that
truncates the original 'ea' value for apparently no particular reason.
This function retrieves the tlb pointer by calling booke206_get_tlbm(),
which also uses a target_ulong address as parameter - in this case, a
truncated 'ea' address. All the surrounding logic considers the
effective TLB address as a 64 bit value, aside from the signature of
booke206_invalidate_ea_tlb().

Last but not the least, PowerISA 2.07B section 6.11.4.9 [2] makes it
clear that the effective address "EA" is a 64 bit value.

Commit 01662f3e5133 introduced this code and no changes were made ever
since. An user detected a problem with tlbivax [1] stating that this
address truncation was the cause. This same behavior might be the source
of several subtle bugs that were never caught.

For all these reasons, this patch assumes that this address truncation
is the result of a mistake/oversight of the original commit, and changes
booke206_invalidate_ea_tlb() 'ea' argument to 'vaddr'.

[1] https://gitlab.com/qemu-project/qemu/-/issues/52
[2] https://wiki.raptorcs.com/wiki/File:PowerISA_V2.07B.pdf

Fixes: 01662f3e5133 ("PPC: Implement e500 (FSL) MMU")
Resolves: https://gitlab.com/qemu-project/qemu/-/issues/52
Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
---
 target/ppc/mmu_helper.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/target/ppc/mmu_helper.c b/target/ppc/mmu_helper.c
index 2cb98c5169..e0c4950dda 100644
--- a/target/ppc/mmu_helper.c
+++ b/target/ppc/mmu_helper.c
@@ -1216,7 +1216,7 @@ void helper_booke206_tlbsx(CPUPPCState *env, target_ulong address)
 }
 
 static inline void booke206_invalidate_ea_tlb(CPUPPCState *env, int tlbn,
-                                              uint32_t ea)
+                                              vaddr ea)
 {
     int i;
     int ways = booke206_tlb_ways(env, tlbn);
-- 
2.31.1


