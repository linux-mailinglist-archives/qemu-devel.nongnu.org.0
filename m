Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B6AF3A7349
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Jun 2021 03:34:58 +0200 (CEST)
Received: from localhost ([::1]:46734 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lsxyj-0001s5-C0
	for lists+qemu-devel@lfdr.de; Mon, 14 Jun 2021 21:34:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39866)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1lsxxQ-00085C-HN; Mon, 14 Jun 2021 21:33:36 -0400
Received: from mail-qk1-x732.google.com ([2607:f8b0:4864:20::732]:41590)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1lsxxO-0002RP-Sy; Mon, 14 Jun 2021 21:33:36 -0400
Received: by mail-qk1-x732.google.com with SMTP id 5so2437911qkc.8;
 Mon, 14 Jun 2021 18:33:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=t7etlJeKfXCsFCXTplqCexddhzu9ub2O7NLBBdXFErY=;
 b=lhGbJK3sPpSwHvZnDWvmCoS0DouIB9CF5yQA6aUn/l2UGz9c4gCb5ePyMmtQu+o0TG
 55NJvqlcn6j7f+/Nm8R5sxsCxJq7ZWDp9JcPotnGF4q1t9q5+pQuKSSQziCsLC8LWdXK
 cZ4lZme6MCt7N2oJ7foMvJTgGj/aXHmZRxAyCz4UYf2LmQvujOrkxY/P1w5yhyLyE14d
 oEAC5FIeDIm9xH6GL31byip5lwMVBJn6YvqKnOIiNTEGAZk7xklNQBKBeFQE9JOCQLlA
 pLga9JoUlOYIzrSZ3AtBwWz1P2RjDTAbSXyPsMe67VaIChfNVf/sdEuspGqlGfq3dv+z
 lPxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=t7etlJeKfXCsFCXTplqCexddhzu9ub2O7NLBBdXFErY=;
 b=G6eLjVZWS7iaypb986OlgpCuk80XCFf/0IpZ6vXnG0o7kj6ojXyBoGo5bQ95L3xR+P
 jkGx606DLWSUVd3VGJ81G8JvdxbSdDqKHXEGiC3C91jZ6FmoSCH1vJnBz41Bcy1Nm7Qe
 0LBVM6ODO62e1M/9qZ6cpp+7lAWJ5QEfrDHYQCV8UxfYJYo2sqCE9sQWEjLmin3MwRt3
 T7SM/2tfpKKof+612Nbdb1xLs1A6U8OlPlNCWeGMdhmylhOkiNnnSDLHIjz1LuNdnOvo
 p1fw7e6cY+8OWgrjMhF4QmjO0zDR9ew4eO1siKn2CI3Pw28BeOgfPZe5GqvCZjemiGy9
 WyZg==
X-Gm-Message-State: AOAM531pmqS0AuuiDAlUVh1xwWR3My+yum/diWMQT92GTvWxWT0o7tKU
 fZM7ZuU4hDKdakzOnFd+GZcvrpwY28tCBQ==
X-Google-Smtp-Source: ABdhPJytDmkO1S2RgZdItiyBfl6Mn/Feosma1/QUT0jLsHiooqBRIHWoYjBWS9wlKVg8LcmJZr3KlA==
X-Received: by 2002:a05:620a:146f:: with SMTP id
 j15mr2113704qkl.484.1623720813378; 
 Mon, 14 Jun 2021 18:33:33 -0700 (PDT)
Received: from localhost.localdomain ([2804:431:c7c6:4d9a:784f:a7de:c020:5f1e])
 by smtp.gmail.com with ESMTPSA id h2sm11639320qkf.106.2021.06.14.18.33.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 14 Jun 2021 18:33:33 -0700 (PDT)
From: Daniel Henrique Barboza <danielhb413@gmail.com>
To: qemu-devel@nongnu.org
Subject: [RFC PATCH 1/8] spapr: move NUMA data init to
 do_client_architecture_support()
Date: Mon, 14 Jun 2021 22:33:02 -0300
Message-Id: <20210615013309.2833323-2-danielhb413@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210615013309.2833323-1-danielhb413@gmail.com>
References: <20210615013309.2833323-1-danielhb413@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::732;
 envelope-from=danielhb413@gmail.com; helo=mail-qk1-x732.google.com
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
Cc: aneesh.kumar@linux.ibm.com, Daniel Henrique Barboza <danielhb413@gmail.com>,
 qemu-ppc@nongnu.org, groug@kaod.org, david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The pSeries machine will support a new NUMA affinity form, FORM2.
This new FORM will be negotiated via ibm,architecture-vec5 during
CAS. All artifacts and assumptions that are currently on use for
FORM1 affinity will be deprecated in a guest that chooses to use
FORM2.

This means that we're going to wait until CAS to determine whether
we're going to use FORM1 and FORM2. This patch starts doing that
by moving spapr_numa_associativity_init() from spapr_machine_init()
to do_client_architecture_support().

Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
---
 hw/ppc/spapr.c       | 3 ---
 hw/ppc/spapr_hcall.c | 4 ++++
 2 files changed, 4 insertions(+), 3 deletions(-)

diff --git a/hw/ppc/spapr.c b/hw/ppc/spapr.c
index 4dd90b75cc..dd57b30cff 100644
--- a/hw/ppc/spapr.c
+++ b/hw/ppc/spapr.c
@@ -2790,9 +2790,6 @@ static void spapr_machine_init(MachineState *machine)
 
     spapr->gpu_numa_id = spapr_numa_initial_nvgpu_numa_id(machine);
 
-    /* Init numa_assoc_array */
-    spapr_numa_associativity_init(spapr, machine);
-
     if ((!kvm_enabled() || kvmppc_has_cap_mmu_radix()) &&
         ppc_type_check_compat(machine->cpu_type, CPU_POWERPC_LOGICAL_3_00, 0,
                               spapr->max_compat_pvr)) {
diff --git a/hw/ppc/spapr_hcall.c b/hw/ppc/spapr_hcall.c
index f25014afda..6d6ffcc92b 100644
--- a/hw/ppc/spapr_hcall.c
+++ b/hw/ppc/spapr_hcall.c
@@ -11,6 +11,7 @@
 #include "helper_regs.h"
 #include "hw/ppc/spapr.h"
 #include "hw/ppc/spapr_cpu_core.h"
+#include "hw/ppc/spapr_numa.h"
 #include "mmu-hash64.h"
 #include "cpu-models.h"
 #include "trace.h"
@@ -1197,6 +1198,9 @@ target_ulong do_client_architecture_support(PowerPCCPU *cpu,
     spapr->cas_pre_isa3_guest = !spapr_ovec_test(ov1_guest, OV1_PPC_3_00);
     spapr_ovec_cleanup(ov1_guest);
 
+    /* Init numa_assoc_array */
+    spapr_numa_associativity_init(spapr, MACHINE(spapr));
+
     /*
      * Ensure the guest asks for an interrupt mode we support;
      * otherwise terminate the boot.
-- 
2.31.1


