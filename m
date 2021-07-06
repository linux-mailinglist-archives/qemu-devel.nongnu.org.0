Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C529F3BCA3B
	for <lists+qemu-devel@lfdr.de>; Tue,  6 Jul 2021 12:38:40 +0200 (CEST)
Received: from localhost ([::1]:54514 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m0iTP-0003UC-Hy
	for lists+qemu-devel@lfdr.de; Tue, 06 Jul 2021 06:38:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42570)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1m0hu8-0001ap-9q
 for qemu-devel@nongnu.org; Tue, 06 Jul 2021 06:02:12 -0400
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a]:36729)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1m0hu5-0002W9-SI
 for qemu-devel@nongnu.org; Tue, 06 Jul 2021 06:02:11 -0400
Received: by mail-wm1-x32a.google.com with SMTP id
 t14-20020a05600c198eb029020c8aac53d4so3284861wmq.1
 for <qemu-devel@nongnu.org>; Tue, 06 Jul 2021 03:02:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=w9hauRMulhEqoYfvW+lN0XMvwP2olsiQiM62j8QW464=;
 b=CRGZx5RbanpntDViFwcy+cFQXjzDJV9RlMC67bcoLAz7JJYqkdCML6TpYdRZVUm/gh
 s0c0QAgvV0SDNRYHCztBCMvI1X3RikNcgqDvpDVKCJgP+j2/8/7fI0jWySEPuJj2NsYN
 Q/xorBnM4T6XRWsbcHbwG4llbyHGtlKvye5oeG2sW9fFtSmV2aNnKdPU5elPNoa36l0/
 vu45KeWcKaMWAiF7PlKYVn5/ewePaoxP6REDz2PuzzVRPS904dve6/hYqPidHE5FRi0t
 20XhFsegGitnFhZ0++w+KUD/m4/70Leii5AYqNWNRR7/L28zMBn7DweNoxRxSgNTOyuN
 ADAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=w9hauRMulhEqoYfvW+lN0XMvwP2olsiQiM62j8QW464=;
 b=YOR3TFY+YLQjJv/SgsGGb03xRWdVEiaMPtMLrkRfixVtxgA8nuBmBQ0Po4pqxYRdYZ
 rRkb3IaQJnSlRyN9pOj2af0mWsL0FVkupYHJyO+i55hJFlrWQevBHo62np8+3sR9DP/D
 hVmyDk3yqu1Mv6mtmOj1dlQGzkvUfNzedwagfdSRe+JkILEWwhC/sDb/OR2W4l9tRwOL
 n0DoEUaQwvAUQw9C5OL6miDjFwx5vq+X6MH+geheB5M2NZxgG/RGn65bMKQy4gD05PlT
 PJCQJVXDD8H7Wuzndl77aMwznugxy2qtwzQy4RHKHWTPe2GyDCc1brD3kp2zIVhtYiYQ
 G8bA==
X-Gm-Message-State: AOAM531vdPMAMEna+1bgOq4EZE7zdI/UNJsOl6GQGDMd3rIR+c4Xg5+e
 p29ULADlsMzuEZPjlGbflfOSla4OeE0=
X-Google-Smtp-Source: ABdhPJyKxCrDnbGUwR8+yzJlIFoABZwoQIAjiNuH8FC0tv37L2ket5AuLkGxe68j25vc3px1FoNTNg==
X-Received: by 2002:a05:600c:4b92:: with SMTP id
 e18mr19666669wmp.161.1625565728435; 
 Tue, 06 Jul 2021 03:02:08 -0700 (PDT)
Received: from avogadro.redhat.com ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id
 v15sm2331268wmj.39.2021.07.06.03.02.07 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 06 Jul 2021 03:02:08 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 37/40] machine: add smp compound property
Date: Tue,  6 Jul 2021 12:01:38 +0200
Message-Id: <20210706100141.303960-38-pbonzini@redhat.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210706100141.303960-1-pbonzini@redhat.com>
References: <20210706100141.303960-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32a;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-wm1-x32a.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Make -smp syntactic sugar for a compound property "-machine
smp.{cores,threads,cpu,...}".  machine_smp_parse is replaced by the
setter for the property.

numa-test will now cover the new syntax, while other tests
still use -smp.

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 hw/core/machine.c       | 108 +++++++++++++++++++++-------------------
 include/hw/boards.h     |   1 -
 softmmu/vl.c            |  33 +++++++++---
 tests/qtest/numa-test.c |  22 ++++----
 4 files changed, 95 insertions(+), 69 deletions(-)

diff --git a/hw/core/machine.c b/hw/core/machine.c
index ca69f0343a..57c18f909a 100644
--- a/hw/core/machine.c
+++ b/hw/core/machine.c
@@ -19,6 +19,7 @@
 #include "hw/loader.h"
 #include "qapi/error.h"
 #include "qapi/qapi-visit-common.h"
+#include "qapi/qapi-visit-machine.h"
 #include "qapi/visitor.h"
 #include "hw/sysbus.h"
 #include "sysemu/cpus.h"
@@ -799,6 +800,57 @@ static void smp_parse(MachineState *ms, SMPConfiguration *config, Error **errp)
     ms->smp.sockets = sockets;
 }
 
+static void machine_get_smp(Object *obj, Visitor *v, const char *name,
+                            void *opaque, Error **errp)
+{
+    MachineState *ms = MACHINE(obj);
+    SMPConfiguration *config = &(SMPConfiguration){
+        .has_cores = true, .cores = ms->smp.cores,
+        .has_sockets = true, .sockets = ms->smp.sockets,
+        .has_dies = true, .dies = ms->smp.dies,
+        .has_threads = true, .threads = ms->smp.threads,
+        .has_cpus = true, .cpus = ms->smp.cpus,
+        .has_maxcpus = true, .maxcpus = ms->smp.max_cpus,
+    };
+    if (!visit_type_SMPConfiguration(v, name, &config, &error_abort)) {
+        return;
+    }
+}
+
+static void machine_set_smp(Object *obj, Visitor *v, const char *name,
+                            void *opaque, Error **errp)
+{
+    MachineClass *mc = MACHINE_GET_CLASS(obj);
+    MachineState *ms = MACHINE(obj);
+    SMPConfiguration *config;
+    ERRP_GUARD();
+
+    if (!visit_type_SMPConfiguration(v, name, &config, errp)) {
+        return;
+    }
+
+    mc->smp_parse(ms, config, errp);
+    if (errp) {
+        goto out_free;
+    }
+
+    /* sanity-check smp_cpus and max_cpus against mc */
+    if (ms->smp.cpus < mc->min_cpus) {
+        error_setg(errp, "Invalid SMP CPUs %d. The min CPUs "
+                   "supported by machine '%s' is %d",
+                   ms->smp.cpus,
+                   mc->name, mc->min_cpus);
+    } else if (ms->smp.max_cpus > mc->max_cpus) {
+        error_setg(errp, "Invalid SMP CPUs %d. The max CPUs "
+                   "supported by machine '%s' is %d",
+                   current_machine->smp.max_cpus,
+                   mc->name, mc->max_cpus);
+    }
+
+out_free:
+    qapi_free_SMPConfiguration(config);
+}
+
 static void machine_class_init(ObjectClass *oc, void *data)
 {
     MachineClass *mc = MACHINE_CLASS(oc);
@@ -838,6 +890,12 @@ static void machine_class_init(ObjectClass *oc, void *data)
     object_class_property_set_description(oc, "dumpdtb",
         "Dump current dtb to a file and quit");
 
+    object_class_property_add(oc, "smp", "SMPConfiguration",
+        machine_get_smp, machine_set_smp,
+        NULL, NULL);
+    object_class_property_set_description(oc, "smp",
+        "CPU topology");
+
     object_class_property_add(oc, "phandle-start", "int",
         machine_get_phandle_start, machine_set_phandle_start,
         NULL, NULL);
@@ -1126,56 +1184,6 @@ MemoryRegion *machine_consume_memdev(MachineState *machine,
     return ret;
 }
 
-bool machine_smp_parse(MachineState *ms, QemuOpts *opts, Error **errp)
-{
-    MachineClass *mc = MACHINE_GET_CLASS(ms);
-    ERRP_GUARD();
-
-    if (opts) {
-        SMPConfiguration config = {
-            .has_cpus = !!qemu_opt_get(opts, "cpus"),
-            .cpus = qemu_opt_get_number(opts, "cpus", 0),
-            .has_sockets = !!qemu_opt_get(opts, "sockets"),
-            .sockets = qemu_opt_get_number(opts, "sockets", 0),
-            .has_dies = !!qemu_opt_get(opts, "dies"),
-            .dies = qemu_opt_get_number(opts, "dies", 0),
-            .has_cores = !!qemu_opt_get(opts, "cores"),
-            .cores = qemu_opt_get_number(opts, "cores", 0),
-            .has_threads = !!qemu_opt_get(opts, "threads"),
-            .threads = qemu_opt_get_number(opts, "threads", 0),
-            .has_maxcpus = !!qemu_opt_get(opts, "maxcpus"),
-            .maxcpus = qemu_opt_get_number(opts, "maxcpus", 0),
-        };
-
-        mc->smp_parse(ms, &config, errp);
-        if (*errp) {
-            return false;
-        }
-    }
-
-    /* sanity-check smp_cpus and max_cpus against mc */
-    if (ms->smp.cpus < mc->min_cpus) {
-        error_setg(errp, "Invalid SMP CPUs %d. The min CPUs "
-                   "supported by machine '%s' is %d",
-                   ms->smp.cpus,
-                   mc->name, mc->min_cpus);
-        return false;
-    } else if (ms->smp.max_cpus > mc->max_cpus) {
-        error_setg(errp, "Invalid SMP CPUs %d. The max CPUs "
-                   "supported by machine '%s' is %d",
-                   current_machine->smp.max_cpus,
-                   mc->name, mc->max_cpus);
-        return false;
-    }
-
-    if (ms->smp.cpus > 1) {
-        Error *blocker = NULL;
-        error_setg(&blocker, QERR_REPLAY_NOT_SUPPORTED, "smp");
-        replay_add_blocker(blocker);
-    }
-    return true;
-}
-
 void machine_run_board_init(MachineState *machine)
 {
     MachineClass *machine_class = MACHINE_GET_CLASS(machine);
diff --git a/include/hw/boards.h b/include/hw/boards.h
index 1eae4427e8..accd6eff35 100644
--- a/include/hw/boards.h
+++ b/include/hw/boards.h
@@ -26,7 +26,6 @@ OBJECT_DECLARE_TYPE(MachineState, MachineClass, MACHINE)
 extern MachineState *current_machine;
 
 void machine_run_board_init(MachineState *machine);
-bool machine_smp_parse(MachineState *ms, QemuOpts *opts, Error **errp);
 bool machine_usb(MachineState *machine);
 int machine_phandle_start(MachineState *machine);
 bool machine_dump_guest_core(MachineState *machine);
diff --git a/softmmu/vl.c b/softmmu/vl.c
index f848abd31a..a50c8575a1 100644
--- a/softmmu/vl.c
+++ b/softmmu/vl.c
@@ -1531,6 +1531,25 @@ static void machine_help_func(const QDict *qdict)
     }
 }
 
+static void
+machine_parse_property_opt(QemuOptsList *opts_list, const char *propname,
+                           const char *arg, Error **errp)
+{
+    QDict *opts, *prop;
+    bool help = false;
+    ERRP_GUARD();
+
+    prop = keyval_parse(arg, opts_list->implied_opt_name, &help, errp);
+    if (help) {
+        qemu_opts_print_help(opts_list, true);
+        return;
+    }
+    opts = qdict_new();
+    qdict_put(opts, propname, prop);
+    keyval_merge(machine_opts_dict, opts, errp);
+    qobject_unref(opts);
+}
+
 static const char *pid_file;
 static Notifier qemu_unlink_pidfile_notifier;
 
@@ -1841,6 +1860,12 @@ static void qemu_apply_machine_options(QDict *qdict)
         /* fall back to the -kernel/-append */
         semihosting_arg_fallback(current_machine->kernel_filename, current_machine->kernel_cmdline);
     }
+
+    if (current_machine->smp.cpus > 1) {
+        Error *blocker = NULL;
+        error_setg(&blocker, QERR_REPLAY_NOT_SUPPORTED, "smp");
+        replay_add_blocker(blocker);
+    }
 }
 
 static void qemu_create_early_backends(void)
@@ -2091,9 +2116,6 @@ static void qemu_create_machine(QDict *qdict)
         qemu_set_hw_version(machine_class->hw_version);
     }
 
-    machine_smp_parse(current_machine,
-        qemu_opts_find(qemu_find_opts("smp-opts"), NULL), &error_fatal);
-
     /*
      * Get the default machine options from the machine if it is not already
      * specified either by the configuration file or by the command line.
@@ -3310,10 +3332,7 @@ void qemu_init(int argc, char **argv, char **envp)
                 }
                 break;
             case QEMU_OPTION_smp:
-                if (!qemu_opts_parse_noisily(qemu_find_opts("smp-opts"),
-                                             optarg, true)) {
-                    exit(1);
-                }
+                machine_parse_property_opt(qemu_find_opts("smp-opts"), "smp", optarg, &error_fatal);
                 break;
             case QEMU_OPTION_vnc:
                 vnc_parse(optarg);
diff --git a/tests/qtest/numa-test.c b/tests/qtest/numa-test.c
index dc0ec571ca..c677cd63c4 100644
--- a/tests/qtest/numa-test.c
+++ b/tests/qtest/numa-test.c
@@ -25,7 +25,7 @@ static void test_mon_explicit(const void *data)
     g_autofree char *s = NULL;
     g_autofree char *cli = NULL;
 
-    cli = make_cli(data, "-smp 8 -numa node,nodeid=0,memdev=ram,cpus=0-3 "
+    cli = make_cli(data, "-machine smp.cpus=8 -numa node,nodeid=0,memdev=ram,cpus=0-3 "
                          "-numa node,nodeid=1,cpus=4-7");
     qts = qtest_init(cli);
 
@@ -42,7 +42,7 @@ static void test_def_cpu_split(const void *data)
     g_autofree char *s = NULL;
     g_autofree char *cli = NULL;
 
-    cli = make_cli(data, "-smp 8 -numa node,memdev=ram -numa node");
+    cli = make_cli(data, "-machine smp.cpus=8 -numa node,memdev=ram -numa node");
     qts = qtest_init(cli);
 
     s = qtest_hmp(qts, "info numa");
@@ -58,7 +58,7 @@ static void test_mon_partial(const void *data)
     g_autofree char *s = NULL;
     g_autofree char *cli = NULL;
 
-    cli = make_cli(data, "-smp 8 "
+    cli = make_cli(data, "-machine smp.cpus=8 "
                    "-numa node,nodeid=0,memdev=ram,cpus=0-1 "
                    "-numa node,nodeid=1,cpus=4-5 ");
     qts = qtest_init(cli);
@@ -86,7 +86,7 @@ static void test_query_cpus(const void *data)
     QTestState *qts;
     g_autofree char *cli = NULL;
 
-    cli = make_cli(data, "-smp 8 -numa node,memdev=ram,cpus=0-3 "
+    cli = make_cli(data, "-machine smp.cpus=8 -numa node,memdev=ram,cpus=0-3 "
                          "-numa node,cpus=4-7");
     qts = qtest_init(cli);
     cpus = get_cpus(qts, &resp);
@@ -124,7 +124,7 @@ static void pc_numa_cpu(const void *data)
     QTestState *qts;
     g_autofree char *cli = NULL;
 
-    cli = make_cli(data, "-cpu pentium -smp 8,sockets=2,cores=2,threads=2 "
+    cli = make_cli(data, "-cpu pentium -machine smp.cpus=8,smp.sockets=2,smp.cores=2,smp.threads=2 "
         "-numa node,nodeid=0,memdev=ram -numa node,nodeid=1 "
         "-numa cpu,node-id=1,socket-id=0 "
         "-numa cpu,node-id=0,socket-id=1,core-id=0 "
@@ -177,7 +177,7 @@ static void spapr_numa_cpu(const void *data)
     QTestState *qts;
     g_autofree char *cli = NULL;
 
-    cli = make_cli(data, "-smp 4,cores=4 "
+    cli = make_cli(data, "-machine smp.cpus=4,smp.cores=4 "
         "-numa node,nodeid=0,memdev=ram -numa node,nodeid=1 "
         "-numa cpu,node-id=0,core-id=0 "
         "-numa cpu,node-id=0,core-id=1 "
@@ -222,7 +222,7 @@ static void aarch64_numa_cpu(const void *data)
     QTestState *qts;
     g_autofree char *cli = NULL;
 
-    cli = make_cli(data, "-smp 2 "
+    cli = make_cli(data, "-machine smp.cpus=2 "
         "-numa node,nodeid=0,memdev=ram -numa node,nodeid=1 "
         "-numa cpu,node-id=1,thread-id=0 "
         "-numa cpu,node-id=0,thread-id=1");
@@ -265,7 +265,7 @@ static void pc_dynamic_cpu_cfg(const void *data)
     QTestState *qs;
     g_autofree char *cli = NULL;
 
-    cli = make_cli(data, "-nodefaults --preconfig -smp 2");
+    cli = make_cli(data, "-nodefaults --preconfig -machine smp.cpus=2");
     qs = qtest_init(cli);
 
     /* create 2 numa nodes */
@@ -324,7 +324,7 @@ static void pc_hmat_build_cfg(const void *data)
     g_autofree char *cli = NULL;
 
     cli = make_cli(data, "-nodefaults --preconfig -machine hmat=on "
-                         "-smp 2,sockets=2 "
+                         "-machine smp.cpus=2,smp.sockets=2 "
                          "-m 128M,slots=2,maxmem=1G "
                          "-object memory-backend-ram,size=64M,id=m0 "
                          "-object memory-backend-ram,size=64M,id=m1 "
@@ -453,7 +453,7 @@ static void pc_hmat_off_cfg(const void *data)
     g_autofree char *cli = NULL;
 
     cli = make_cli(data, "-nodefaults --preconfig "
-                         "-smp 2,sockets=2 "
+                         "-machine smp.cpus=2,smp.sockets=2 "
                          "-m 128M,slots=2,maxmem=1G "
                          "-object memory-backend-ram,size=64M,id=m0,prealloc=y "
                          "-object memory-backend-ram,size=64M,id=m1 "
@@ -492,7 +492,7 @@ static void pc_hmat_erange_cfg(const void *data)
     g_autofree char *cli = NULL;
 
     cli = make_cli(data, "-nodefaults --preconfig -machine hmat=on "
-                         "-smp 2,sockets=2 "
+                         "-machine smp.cpus=2,smp.sockets=2 "
                          "-m 128M,slots=2,maxmem=1G "
                          "-object memory-backend-ram,size=64M,id=m0 "
                          "-object memory-backend-ram,size=64M,id=m1 "
-- 
2.31.1



