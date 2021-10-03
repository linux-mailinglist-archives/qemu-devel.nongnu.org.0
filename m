Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 72A30420094
	for <lists+qemu-devel@lfdr.de>; Sun,  3 Oct 2021 09:56:26 +0200 (CEST)
Received: from localhost ([::1]:51708 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mWwMD-0006Pf-C6
	for lists+qemu-devel@lfdr.de; Sun, 03 Oct 2021 03:56:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36838)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1mWw9L-0003eM-M6
 for qemu-devel@nongnu.org; Sun, 03 Oct 2021 03:43:07 -0400
Received: from mail-ed1-x535.google.com ([2a00:1450:4864:20::535]:44025)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1mWw9J-0000u4-TL
 for qemu-devel@nongnu.org; Sun, 03 Oct 2021 03:43:07 -0400
Received: by mail-ed1-x535.google.com with SMTP id v10so52142881edj.10
 for <qemu-devel@nongnu.org>; Sun, 03 Oct 2021 00:43:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=1wFA3sfoHmjtt243SXZVGaLCwA0Tmjm2zolvW91KgQI=;
 b=ZtK+28SD21WaqlxCico4ZTZtWnd1hKcq1hnVqxCxk/s5pRJnTfhrWWgm9a2kC55WZ+
 FxmDHMlnrf0yBrTcMBYbLQFx2dhFXxQXtKhgmdM4Y92FiUD4RpVGl6le7qd1Ndtrtwvh
 iv5rGSizIrFARDaOJejU4GRAboMaOhn7Ya9UFrLHUXtUv/uQ2qzpRMpWUStEogUrnYCR
 ddGD3z0Z2+ioC11fl3+xOzICiavBlonzivEqWQrwZtHZImfP2AJ2cRYEkfi5cBxcjF5I
 BhvWOLvUw0G59+yso2j2JtczxhbAPm81Et0e6bi4n1MNO0y8d2dDoqw8YuTPDJLPtoIQ
 mSLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=1wFA3sfoHmjtt243SXZVGaLCwA0Tmjm2zolvW91KgQI=;
 b=GrZWc/pM3PJ8I50fD2SKcfOE2XFq0LCEJiabaGGkrv5S7l/YRf2GFp5wjIz43afirq
 BSjkJCfndiw7M5S8w/4mbbXgSQsMY+bVeVxCaOhIWpFw8dvYnVKbLAUsKmTy1dBAM1ck
 KwkEa789+Odr9O0547ET3gfPUsqqiKEHIGa5vyma+B7EA13FCBknR2CEz81y5xv/HB1a
 oTKs0h3O+d84JJdpIkUTYWgvfedDaZhcfKqShB9KQAh2da8/Ntf8sCxCMwehJFAjSwct
 lHL0pfOGq/WMyk5m5G+TJ6D8DU3xuKT/Nz3rqazK/xnljbLcO74OZ0c5rmA9eFDrCCst
 kt1Q==
X-Gm-Message-State: AOAM530byc4hQeasTPhrA0XujLzwRoOA9ifI7JchW5WEScpoJdEJjAko
 HQotllVrT0UdhmexxzMN8jKHyPkiQRQ=
X-Google-Smtp-Source: ABdhPJwAwrA3o6oUpk6T+MemdmT+2I/uc8ATiYIvOyU8MdZJwuOPTC3E1VsengEnoy0IGFymPbb5Yw==
X-Received: by 2002:a50:dac4:: with SMTP id s4mr9017498edj.374.1633246984543; 
 Sun, 03 Oct 2021 00:43:04 -0700 (PDT)
Received: from avogadro.lan ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id n6sm5560856eds.10.2021.10.03.00.43.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 03 Oct 2021 00:43:04 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 16/30] machine: Put all sanity-check in the generic SMP parser
Date: Sun,  3 Oct 2021 09:42:36 +0200
Message-Id: <20211003074250.60869-17-pbonzini@redhat.com>
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
 =?UTF-8?q?Daniel=20P=20=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Pankaj Gupta <pankaj.gupta@ionos.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Yanan Wang <wangyanan55@huawei.com>

Put both sanity-check of the input SMP configuration and sanity-check
of the output SMP configuration uniformly in the generic parser. Then
machine_set_smp() will become cleaner, also all the invalid scenarios
can be tested only by calling the parser.

Signed-off-by: Yanan Wang <wangyanan55@huawei.com>
Reviewed-by: Andrew Jones <drjones@redhat.com>
Reviewed-by: Pankaj Gupta <pankaj.gupta@ionos.com>
Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>
Message-Id: <20210929025816.21076-16-wangyanan55@huawei.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 hw/core/machine.c | 62 +++++++++++++++++++++++------------------------
 1 file changed, 30 insertions(+), 32 deletions(-)

diff --git a/hw/core/machine.c b/hw/core/machine.c
index d49ebc24e2..3920a2f2af 100644
--- a/hw/core/machine.c
+++ b/hw/core/machine.c
@@ -798,6 +798,20 @@ static void smp_parse(MachineState *ms, SMPConfiguration *config, Error **errp)
     unsigned threads = config->has_threads ? config->threads : 0;
     unsigned maxcpus = config->has_maxcpus ? config->maxcpus : 0;
 
+    /*
+     * Specified CPU topology parameters must be greater than zero,
+     * explicit configuration like "cpus=0" is not allowed.
+     */
+    if ((config->has_cpus && config->cpus == 0) ||
+        (config->has_sockets && config->sockets == 0) ||
+        (config->has_dies && config->dies == 0) ||
+        (config->has_cores && config->cores == 0) ||
+        (config->has_threads && config->threads == 0) ||
+        (config->has_maxcpus && config->maxcpus == 0)) {
+        warn_report("Deprecated CPU topology (considered invalid): "
+                    "CPU topology parameters must be greater than zero");
+    }
+
     /*
      * If not supported by the machine, a topology parameter must be
      * omitted or specified equal to 1.
@@ -873,6 +887,22 @@ static void smp_parse(MachineState *ms, SMPConfiguration *config, Error **errp)
                    topo_msg, maxcpus, cpus);
         return;
     }
+
+    if (ms->smp.cpus < mc->min_cpus) {
+        error_setg(errp, "Invalid SMP CPUs %d. The min CPUs "
+                   "supported by machine '%s' is %d",
+                   ms->smp.cpus,
+                   mc->name, mc->min_cpus);
+        return;
+    }
+
+    if (ms->smp.max_cpus > mc->max_cpus) {
+        error_setg(errp, "Invalid SMP CPUs %d. The max CPUs "
+                   "supported by machine '%s' is %d",
+                   ms->smp.max_cpus,
+                   mc->name, mc->max_cpus);
+        return;
+    }
 }
 
 static void machine_get_smp(Object *obj, Visitor *v, const char *name,
@@ -895,46 +925,14 @@ static void machine_get_smp(Object *obj, Visitor *v, const char *name,
 static void machine_set_smp(Object *obj, Visitor *v, const char *name,
                             void *opaque, Error **errp)
 {
-    MachineClass *mc = MACHINE_GET_CLASS(obj);
     MachineState *ms = MACHINE(obj);
     g_autoptr(SMPConfiguration) config = NULL;
-    ERRP_GUARD();
 
     if (!visit_type_SMPConfiguration(v, name, &config, errp)) {
         return;
     }
 
-    /*
-     * Specified CPU topology parameters must be greater than zero,
-     * explicit configuration like "cpus=0" is not allowed.
-     */
-    if ((config->has_cpus && config->cpus == 0) ||
-        (config->has_sockets && config->sockets == 0) ||
-        (config->has_dies && config->dies == 0) ||
-        (config->has_cores && config->cores == 0) ||
-        (config->has_threads && config->threads == 0) ||
-        (config->has_maxcpus && config->maxcpus == 0)) {
-        warn_report("Deprecated CPU topology (considered invalid): "
-                    "CPU topology parameters must be greater than zero");
-    }
-
     smp_parse(ms, config, errp);
-    if (*errp) {
-        return;
-    }
-
-    /* sanity-check smp_cpus and max_cpus against mc */
-    if (ms->smp.cpus < mc->min_cpus) {
-        error_setg(errp, "Invalid SMP CPUs %d. The min CPUs "
-                   "supported by machine '%s' is %d",
-                   ms->smp.cpus,
-                   mc->name, mc->min_cpus);
-    } else if (ms->smp.max_cpus > mc->max_cpus) {
-        error_setg(errp, "Invalid SMP CPUs %d. The max CPUs "
-                   "supported by machine '%s' is %d",
-                   ms->smp.max_cpus,
-                   mc->name, mc->max_cpus);
-    }
 }
 
 static void machine_class_init(ObjectClass *oc, void *data)
-- 
2.31.1



