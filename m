Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 41730358EA2
	for <lists+qemu-devel@lfdr.de>; Thu,  8 Apr 2021 22:43:45 +0200 (CEST)
Received: from localhost ([::1]:57206 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lUbVA-0001HE-Al
	for lists+qemu-devel@lfdr.de; Thu, 08 Apr 2021 16:43:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57702)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1lUbSu-0000DX-CX; Thu, 08 Apr 2021 16:41:24 -0400
Received: from mail-qv1-xf35.google.com ([2607:f8b0:4864:20::f35]:46921)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1lUbSs-0008IF-0S; Thu, 08 Apr 2021 16:41:24 -0400
Received: by mail-qv1-xf35.google.com with SMTP id h3so842452qve.13;
 Thu, 08 Apr 2021 13:41:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ZVC3LuUH2bV9ilia5mspPV3C9n9h2mSjnUSfIXfLg0Y=;
 b=F8fqBaV8iswWAqxJkuHiIHYe/BbpbWH42f1du8ElAci4grVycNYu0tYeUkY2g2BolI
 tofFrG2SXAV24nwcdLM7yrZt83Ew2zvnrBlqtfHx8yKik+stgIFFn9QFQUNiiwq+AoEJ
 JUD7U112T8Ipsedyco6X8lNhXiedqsCdMK14AlrHVc39xNaYpTvu882TofJXeta1R8LT
 14UPou3lGhCHYPtTrI7QgzlQAB9AIG+UsO+d9vybI/QZC+gNg/IqMdwDBcZA26aFgI1T
 pEosrDrhVcU3EkJ7INiSXvoptsxVyQUOBCsFkgVoCYlWa4lWWn9DJI5c2h48ZahsbxiK
 ipkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ZVC3LuUH2bV9ilia5mspPV3C9n9h2mSjnUSfIXfLg0Y=;
 b=i1eY7HkKkiPYAC+h+wp3JWf+wWhdH/KWbhLxe16MPRDl6ypCCudCUFSTGSEYm8fVi5
 XlShkzyPl9U5Yacraw3pr3IMGULKspE9cnfaHmWM6mhKy1R4DBGUtUUfmGllHFOvoX8M
 /dtrD9h+vFVzpm6Spdtq98RpF8bP03Thhccl228ztw1h7UFOAV2dlCwMSzHxOq+g9pOC
 FZdQ5/08BWFwitndlINkarkqTsXO3+6BZgAGBQJk58c7FCpIOcVT1xbvvyVDbmy1DC+2
 +OpHmF6SCzeJDzWcKL9J1gyv77Uy7yVr5J7I8iQWFwVnTRtGOi5bd0kL1QDnGZYkey9A
 saaQ==
X-Gm-Message-State: AOAM533AA3NMK+TSl6yohEwkKoz/z65jOs2df3AnStsdiGxr0Zw7/qKy
 2nYR3xOsYvZidRnhqGb9WOsSIFEwo3NC4A==
X-Google-Smtp-Source: ABdhPJwG2gMLKANUEVYpzgciQcoARnJWLMul4tRsDR/K4fE0+i+bqR/9JCR4/q8IidXu+j2MeLps/A==
X-Received: by 2002:a0c:9cc2:: with SMTP id j2mr11005289qvf.2.1617914480388;
 Thu, 08 Apr 2021 13:41:20 -0700 (PDT)
Received: from rekt.ibmuc.com ([2804:431:c7c7:92e9:c7f0:1492:45b3:f90e])
 by smtp.gmail.com with ESMTPSA id a207sm327104qkc.135.2021.04.08.13.41.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 08 Apr 2021 13:41:20 -0700 (PDT)
From: Daniel Henrique Barboza <danielhb413@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 1/2] spapr.c: do not use MachineClass::max_cpus to limit CPUs
Date: Thu,  8 Apr 2021 17:40:48 -0300
Message-Id: <20210408204049.221802-2-danielhb413@gmail.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210408204049.221802-1-danielhb413@gmail.com>
References: <20210408204049.221802-1-danielhb413@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::f35;
 envelope-from=danielhb413@gmail.com; helo=mail-qv1-xf35.google.com
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
Cc: Daniel Henrique Barboza <danielhb413@gmail.com>, qemu-ppc@nongnu.org,
 groug@kaod.org, david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Up to this patch, 'max_cpus' value is hardcoded to 1024 (commit
6244bb7e5811). In theory this patch would simply bump it to 2048, since
it's the default NR_CPUS kernel setting for ppc64 servers nowadays, but
the whole mechanic of MachineClass:max_cpus is flawed for the pSeries
machine. The two supported accelerators, KVM and TCG, can live without
it.

TCG guests don't have a theoretical limit. The user must be free to
emulate as many CPUs as the hardware is capable of. And even if there
were a limit, max_cpus is not the proper way to report it since it's a
common value checked by SMP code in machine_smp_parse() for KVM as well.

For KVM guests, the proper way to limit KVM CPUs is by host
configuration via NR_CPUS, not a QEMU hardcoded value. There is no
technical reason for a pSeries QEMU guest to forcefully stay below
NR_CPUS.

This hardcoded value also disregard hosts that might have a lower
NR_CPUS limit, say 512. In this case, machine.c:machine_smp_parse() will
allow a 1024 value to pass, but then kvm_init() will complain about it
because it will exceed NR_CPUS:

Number of SMP cpus requested (1024) exceeds the maximum cpus supported
by KVM (512)

A better 'max_cpus' value would consider host settings, but
MachineClass::max_cpus is defined well before machine_init() and
kvm_init(). We can't check for KVM limits because it's too soon, so we
end up making a guess.

This patch makes MachineClass:max_cpus settings innocuous by setting it
to INT32_MAX. machine.c:machine_smp_parse() will not fail the
verification based on max_cpus, letting kvm_init() do the checking with
actual host settings. And TCG guests get to do whatever the hardware is
capable of emulating.

Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
---
 hw/ppc/spapr.c | 11 ++++++++++-
 1 file changed, 10 insertions(+), 1 deletion(-)

diff --git a/hw/ppc/spapr.c b/hw/ppc/spapr.c
index 73a06df3b1..d6a67da21f 100644
--- a/hw/ppc/spapr.c
+++ b/hw/ppc/spapr.c
@@ -4482,7 +4482,16 @@ static void spapr_machine_class_init(ObjectClass *oc, void *data)
     mc->init = spapr_machine_init;
     mc->reset = spapr_machine_reset;
     mc->block_default_type = IF_SCSI;
-    mc->max_cpus = 1024;
+
+    /*
+     * Setting max_cpus to INT32_MAX. Both KVM and TCG max_cpus values
+     * should be limited by the host capability instead of hardcoded.
+     * max_cpus for KVM guests will be checked in kvm_init(), and TCG
+     * guests are welcome to have as many CPUs as the host are capable
+     * of emulate.
+     */
+    mc->max_cpus = INT32_MAX;
+
     mc->no_parallel = 1;
     mc->default_boot_order = "";
     mc->default_ram_size = 512 * MiB;
-- 
2.30.2


