Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 74ADB44C734
	for <lists+qemu-devel@lfdr.de>; Wed, 10 Nov 2021 19:48:47 +0100 (CET)
Received: from localhost ([::1]:48832 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mkseM-0006m6-27
	for lists+qemu-devel@lfdr.de; Wed, 10 Nov 2021 13:48:46 -0500
Received: from eggs.gnu.org ([209.51.188.92]:35808)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1mksbf-00051G-Qq; Wed, 10 Nov 2021 13:45:59 -0500
Received: from [2607:f8b0:4864:20::a34] (port=37475
 helo=mail-vk1-xa34.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1mksbd-0000Af-OK; Wed, 10 Nov 2021 13:45:59 -0500
Received: by mail-vk1-xa34.google.com with SMTP id e64so1913975vke.4;
 Wed, 10 Nov 2021 10:45:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=0/WhJQmkiWjpuq4NmcVs5eQujGlFeqwrSYK0YCsGdHA=;
 b=Zo7Xa6aRvXtAP+cfw9t3kqPh2TKsMPrcAyp/zR7SWu0UQhOPDYz/jBBxXQR3/dszFB
 GcD7j++jsF4VtneTs4kzJg7KSFvcMSofYIwAqx0REMXZ8G7fEz4rk6iOPNkvssZyuL25
 f2qAI9WYMxwIj215vkc+iM/sVs6G/IQxQTO1mhMUpaKn4Ow7Pk1UdRfGCW/p4q54rjtt
 vPhC2uyvfEXJAcpf3nXB+5G2qRytjqxYoDMIUkoU42n/O5zzBuNV6Ze4Ef4HUrqkDfCJ
 AShjQdnzkf9t2aTZqkrAYn2KNtQBz/WDphHbdPTIbTA76C9TAmWBX9rxX5LsfZR8wajg
 hyvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=0/WhJQmkiWjpuq4NmcVs5eQujGlFeqwrSYK0YCsGdHA=;
 b=XanliSB1SSo8vH3QUBDx64WdKSM0bIYGwO0fA7nEodFWVpQDj0NCwuuIFISQMceHaK
 vZXcGaGq9mwg5GK0Nm7I74UCqlxR8SmIlWC817ZPAwz5CkuR1b92cQZ29tPHGu9E3LHJ
 TxMQhnekthsGxIknyXVDTDbo0PS9Nckvit2j1JVJEGQihsl+Z+9lsWrWVoLHSWHd+rl4
 sTyTd5BRDSWE5f/wfyx7LAEwqMgRdorS+frRHuK0HovFyVKEuTL7net3EnQPZ54iXKl6
 Ib2jjFN0lhPJ/XgS1OajBdciT9bokuzOzBxO5og+BgNmXJCNrqAkIoa/XuZ5ViaVC83d
 cyzw==
X-Gm-Message-State: AOAM531EgteE6C84BjJrg7vOnSZupiANdy8VHTEGVF9UXO3P6CadJFC9
 7j3yzcZgBZOdj8lzOBJWffOmYuS+GkY=
X-Google-Smtp-Source: ABdhPJxgpp0D1fQfKKOyTLzia/VYZrJnO5RsiNrYYorg1gepAV1X6fcU1CUU+Q4bN/aUInpQQA7lxA==
X-Received: by 2002:a05:6122:2088:: with SMTP id
 i8mr1925912vkd.5.1636569955475; 
 Wed, 10 Nov 2021 10:45:55 -0800 (PST)
Received: from rekt.ibmuc.com ([189.79.219.109])
 by smtp.gmail.com with ESMTPSA id 92sm441751uar.19.2021.11.10.10.45.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 10 Nov 2021 10:45:55 -0800 (PST)
From: Daniel Henrique Barboza <danielhb413@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 1/1] ppc/mmu_helper.c: do not truncate 'ea' in
 booke206_invalidate_ea_tlb()
Date: Wed, 10 Nov 2021 15:45:45 -0300
Message-Id: <20211110184545.1981500-1-danielhb413@gmail.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::a34
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::a34;
 envelope-from=danielhb413@gmail.com; helo=mail-vk1-xa34.google.com
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
Cc: Daniel Henrique Barboza <danielhb413@gmail.com>, qemu-ppc@nongnu.org,
 clg@kaod.org, david@gibson.dropbear.id.au
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
booke206_invalidate_ea_tlb() 'ea' argument to target_ulong.

[1] https://gitlab.com/qemu-project/qemu/-/issues/52
[2] https://wiki.raptorcs.com/wiki/File:PowerISA_V2.07B.pdf

Fixes: 01662f3e5133 ("PPC: Implement e500 (FSL) MMU")
Resolves: https://gitlab.com/qemu-project/qemu/-/issues/52
Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
---
 target/ppc/mmu_helper.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/target/ppc/mmu_helper.c b/target/ppc/mmu_helper.c
index 2cb98c5169..21cdae4c6d 100644
--- a/target/ppc/mmu_helper.c
+++ b/target/ppc/mmu_helper.c
@@ -1216,7 +1216,7 @@ void helper_booke206_tlbsx(CPUPPCState *env, target_ulong address)
 }
 
 static inline void booke206_invalidate_ea_tlb(CPUPPCState *env, int tlbn,
-                                              uint32_t ea)
+                                              target_ulong ea)
 {
     int i;
     int ways = booke206_tlb_ways(env, tlbn);
-- 
2.31.1


