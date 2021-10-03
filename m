Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B53A6420083
	for <lists+qemu-devel@lfdr.de>; Sun,  3 Oct 2021 09:45:53 +0200 (CEST)
Received: from localhost ([::1]:54844 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mWwC0-0005xq-Nz
	for lists+qemu-devel@lfdr.de; Sun, 03 Oct 2021 03:45:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36682)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1mWw9C-00039B-Ng
 for qemu-devel@nongnu.org; Sun, 03 Oct 2021 03:42:58 -0400
Received: from mail-ed1-x535.google.com ([2a00:1450:4864:20::535]:46683)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1mWw9A-0000l4-6m
 for qemu-devel@nongnu.org; Sun, 03 Oct 2021 03:42:58 -0400
Received: by mail-ed1-x535.google.com with SMTP id z20so466494edc.13
 for <qemu-devel@nongnu.org>; Sun, 03 Oct 2021 00:42:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=zDzcsXFs2FnCddJFWE6HMcr+FeF5rfRj7mIGSwEkPOI=;
 b=N4TbO8yBTBQhgC1fwWOpLumioYnqRspac7JVKY7DDQeiEniC/T7tQyFgr1GkvBaiTf
 KL6QtRG86SsLmgOQLpc1UgDq2VL9ssmHjoymua2sfj2dTMCrt7tk75z2oNlhy/T66HX0
 zN0Ok3B2Eliyc6TGUa2zicL1W9Z5ZZEfnJMTOUtTv4EUiQsQTGBR1IvFbFrzRz0mhUXX
 TU2CN/uFRB69BCRgLQWUNmQRv7LznI3xhSTwrPzxVi7O9k3gVHs0FPu1/sA9PBhguYu6
 e0dUx+r37ZYXbspMlAtGYKBwJiNO4occq5a+G2/7xT/swxUQVLFjzy/nIdtw2peM8EXn
 gHJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=zDzcsXFs2FnCddJFWE6HMcr+FeF5rfRj7mIGSwEkPOI=;
 b=mEdF7LHJI0M7MWHzL0MWYexHkX8LHNxbXjhxHmoruehiAqbb/7/PsDLQUCDKDsBdla
 iQqJ6HFRNjnfCU+wvH7qgiTDVZ4facaSuiPpI50GoAhe5mt7lMCgwNtoPK7SUdVRIq5H
 qs35eRKH0irBDkzLVqzWwXROlrx4EKjAK8slmWTj9Cqo/0QNfEFNWyCPYKqHORAI3o4P
 jIMG7W2mGqOTLYn2M2W2W+7zfcRWEqaZe2Vlu/McdsPtIY/DLYR4VznbbjVmPQyQIt6X
 O/WBBHojLnVGbOqqiTVPwSynYWIN/BL8RCS0vRklj2ekhqkTQvDZ6W9wM9KjeE+Hbpdr
 i1Xg==
X-Gm-Message-State: AOAM532wSLRHtfAmwVJzXcS3pO5ImDle+1Ni2jyy8fCppdpLg2YxsEj8
 gqFPVVGciTigsLij08SFSgPxpSxad1Y=
X-Google-Smtp-Source: ABdhPJxwhblVHKhFZKkkeG5PjstxsfPCKnFH85N8sn353uTJahOzVZ9DbAsx8Sc0GPRv61LHZ5lPrg==
X-Received: by 2002:a17:906:9501:: with SMTP id
 u1mr8964076ejx.496.1633246974872; 
 Sun, 03 Oct 2021 00:42:54 -0700 (PDT)
Received: from avogadro.lan ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id n6sm5560856eds.10.2021.10.03.00.42.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 03 Oct 2021 00:42:54 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 03/30] machine: Minor refactor/fix for the smp parsers
Date: Sun,  3 Oct 2021 09:42:23 +0200
Message-Id: <20211003074250.60869-4-pbonzini@redhat.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211003074250.60869-1-pbonzini@redhat.com>
References: <20211003074250.60869-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::535;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ed1-x535.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Yanan Wang <wangyanan55@huawei.com>, Andrew Jones <drjones@redhat.com>,
 =?UTF-8?q?Daniel=20P=20=2E=20Berrang=C3=A9?= <berrange@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Yanan Wang <wangyanan55@huawei.com>

To pave the way for the functional improvement in later patches,
make some refactor/cleanup for the smp parsers, including using
local maxcpus instead of ms->smp.max_cpus in the calculation,
defaulting dies to 0 initially like other members, cleanup the
sanity check for dies.

We actually also fix a hidden defect by avoiding directly using
the provided *zero value* in the calculation, which could cause
a segment fault (e.g. using dies=0 in the calculation).

Signed-off-by: Yanan Wang <wangyanan55@huawei.com>
Reviewed-by: Andrew Jones <drjones@redhat.com>
Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>
Message-Id: <20210929025816.21076-4-wangyanan55@huawei.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 hw/core/machine.c | 18 ++++++++++--------
 hw/i386/pc.c      | 23 ++++++++++++++---------
 2 files changed, 24 insertions(+), 17 deletions(-)

diff --git a/hw/core/machine.c b/hw/core/machine.c
index 4e409261c9..8e719e2932 100644
--- a/hw/core/machine.c
+++ b/hw/core/machine.c
@@ -752,8 +752,9 @@ static void smp_parse(MachineState *ms, SMPConfiguration *config, Error **errp)
     unsigned sockets = config->has_sockets ? config->sockets : 0;
     unsigned cores   = config->has_cores ? config->cores : 0;
     unsigned threads = config->has_threads ? config->threads : 0;
+    unsigned maxcpus = config->has_maxcpus ? config->maxcpus : 0;
 
-    if (config->has_dies && config->dies != 0 && config->dies != 1) {
+    if (config->has_dies && config->dies > 1) {
         error_setg(errp, "dies not supported by this machine's CPU topology");
         return;
     }
@@ -766,8 +767,8 @@ static void smp_parse(MachineState *ms, SMPConfiguration *config, Error **errp)
             sockets = sockets > 0 ? sockets : 1;
             cpus = cores * threads * sockets;
         } else {
-            ms->smp.max_cpus = config->has_maxcpus ? config->maxcpus : cpus;
-            sockets = ms->smp.max_cpus / (cores * threads);
+            maxcpus = maxcpus > 0 ? maxcpus : cpus;
+            sockets = maxcpus / (cores * threads);
         }
     } else if (cores == 0) {
         threads = threads > 0 ? threads : 1;
@@ -784,26 +785,27 @@ static void smp_parse(MachineState *ms, SMPConfiguration *config, Error **errp)
         return;
     }
 
-    ms->smp.max_cpus = config->has_maxcpus ? config->maxcpus : cpus;
+    maxcpus = maxcpus > 0 ? maxcpus : cpus;
 
-    if (ms->smp.max_cpus < cpus) {
+    if (maxcpus < cpus) {
         error_setg(errp, "maxcpus must be equal to or greater than smp");
         return;
     }
 
-    if (sockets * cores * threads != ms->smp.max_cpus) {
+    if (sockets * cores * threads != maxcpus) {
         error_setg(errp, "Invalid CPU topology: "
                    "sockets (%u) * cores (%u) * threads (%u) "
                    "!= maxcpus (%u)",
                    sockets, cores, threads,
-                   ms->smp.max_cpus);
+                   maxcpus);
         return;
     }
 
     ms->smp.cpus = cpus;
+    ms->smp.sockets = sockets;
     ms->smp.cores = cores;
     ms->smp.threads = threads;
-    ms->smp.sockets = sockets;
+    ms->smp.max_cpus = maxcpus;
 }
 
 static void machine_get_smp(Object *obj, Visitor *v, const char *name,
diff --git a/hw/i386/pc.c b/hw/i386/pc.c
index df457eceba..92c78d9933 100644
--- a/hw/i386/pc.c
+++ b/hw/i386/pc.c
@@ -718,9 +718,13 @@ static void pc_smp_parse(MachineState *ms, SMPConfiguration *config, Error **err
 {
     unsigned cpus    = config->has_cpus ? config->cpus : 0;
     unsigned sockets = config->has_sockets ? config->sockets : 0;
-    unsigned dies    = config->has_dies ? config->dies : 1;
+    unsigned dies    = config->has_dies ? config->dies : 0;
     unsigned cores   = config->has_cores ? config->cores : 0;
     unsigned threads = config->has_threads ? config->threads : 0;
+    unsigned maxcpus = config->has_maxcpus ? config->maxcpus : 0;
+
+    /* directly default dies to 1 if it's omitted */
+    dies = dies > 0 ? dies : 1;
 
     /* compute missing values, prefer sockets over cores over threads */
     if (cpus == 0 || sockets == 0) {
@@ -730,8 +734,8 @@ static void pc_smp_parse(MachineState *ms, SMPConfiguration *config, Error **err
             sockets = sockets > 0 ? sockets : 1;
             cpus = cores * threads * dies * sockets;
         } else {
-            ms->smp.max_cpus = config->has_maxcpus ? config->maxcpus : cpus;
-            sockets = ms->smp.max_cpus / (cores * threads * dies);
+            maxcpus = maxcpus > 0 ? maxcpus : cpus;
+            sockets = maxcpus / (dies * cores * threads);
         }
     } else if (cores == 0) {
         threads = threads > 0 ? threads : 1;
@@ -748,27 +752,28 @@ static void pc_smp_parse(MachineState *ms, SMPConfiguration *config, Error **err
         return;
     }
 
-    ms->smp.max_cpus = config->has_maxcpus ? config->maxcpus : cpus;
+    maxcpus = maxcpus > 0 ? maxcpus : cpus;
 
-    if (ms->smp.max_cpus < cpus) {
+    if (maxcpus < cpus) {
         error_setg(errp, "maxcpus must be equal to or greater than smp");
         return;
     }
 
-    if (sockets * dies * cores * threads != ms->smp.max_cpus) {
+    if (sockets * dies * cores * threads != maxcpus) {
         error_setg(errp, "Invalid CPU topology deprecated: "
                    "sockets (%u) * dies (%u) * cores (%u) * threads (%u) "
                    "!= maxcpus (%u)",
                    sockets, dies, cores, threads,
-                   ms->smp.max_cpus);
+                   maxcpus);
         return;
     }
 
     ms->smp.cpus = cpus;
-    ms->smp.cores = cores;
-    ms->smp.threads = threads;
     ms->smp.sockets = sockets;
     ms->smp.dies = dies;
+    ms->smp.cores = cores;
+    ms->smp.threads = threads;
+    ms->smp.max_cpus = maxcpus;
 }
 
 static
-- 
2.31.1



