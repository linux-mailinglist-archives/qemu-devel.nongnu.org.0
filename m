Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 630DA16563D
	for <lists+qemu-devel@lfdr.de>; Thu, 20 Feb 2020 05:22:26 +0100 (CET)
Received: from localhost ([::1]:35914 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1j4dM1-0005n4-Fa
	for lists+qemu-devel@lfdr.de; Wed, 19 Feb 2020 23:22:25 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:45122)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <alxndr@bu.edu>) id 1j4dBn-0004c1-3h
 for qemu-devel@nongnu.org; Wed, 19 Feb 2020 23:11:53 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <alxndr@bu.edu>) id 1j4dBl-0005y1-6J
 for qemu-devel@nongnu.org; Wed, 19 Feb 2020 23:11:51 -0500
Received: from mail-co1nam11on2111.outbound.protection.outlook.com
 ([40.107.220.111]:2368 helo=NAM11-CO1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <alxndr@bu.edu>) id 1j4dBk-0005xb-Vc
 for qemu-devel@nongnu.org; Wed, 19 Feb 2020 23:11:49 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GAS0Agu2TsCbg4xQirnROvIcJgvc7DMu7HlDhdw/Fu6eKigC/Goyqdu8E8mznxVDmX6NjS8EH6MzP263w31jfoet2fKyIOR/fLLf457z2P3/poh0I/23Ip/Rltouc8nRF2skqeE3z3NOf3WNg2ujFdToZ/wsrM7za/pQ5QMRbMHQKQaYLbDRWe/zj/5Xd6tIMHombXt0tSBqG3iPfHRnQ+Nq8BsaUTjBJuTxN0LFruOs6a+WJBDHtGfRPTsj1EeyiTGSxHP122vYhy0n7XxFnh6NBOyRUiDkW+DVB0c+vDRLkdg4AXcPFFas2c/xSNguzw/heL4F6Y+Hy1RBQdrneQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HvkiGmyVMY1pVELD0K/w/U087//Zj4yJm9QnoFKXQfc=;
 b=h95QwU9WQUjXPQOxSxxGmkm5ulTRRI7F9IVhYTzSSExfOVxZbsjfiT9Lya6XgCRb8QsO0zx5JtveP7rxpkLzGfaZwD8EnitCZlOZLW5B6A/SzIKIrWnNmss4EMkCE9b4x3sbvOiZlpDDmr3k73lZNS869PlI8wwlg1y+0VtXADvzY7+dDUta9zkuCymyU8YGiwat4KVLmyB3WQW05L0ipL1RnQBw3Et8hIg2NBZcGLSfNpJLl+jDrVp2umak2A2riJoX18z+hz8ztbL05y2/Ln8EMz1I5WvSdRVYYtOD8PbGp8gHIVhtnOlEkgCH/muH0jy5BIju/RnX1yF3kXe2pQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bu.edu; dmarc=pass action=none header.from=bu.edu; dkim=pass
 header.d=bu.edu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bushare.onmicrosoft.com; s=selector2-bushare-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HvkiGmyVMY1pVELD0K/w/U087//Zj4yJm9QnoFKXQfc=;
 b=aArWF3F9FPtohIsxSOszXDvNNA3p04ikWI5XP6vhLGlHM/w+5ZxLm4ZpGvr5mpXz/w+5o7pSE7QTwS8cSQx3UK4J685VHwDWEBGC8YCP1YQuSytPuZYqkV8S4heGMu/cWRx/Y0l+wJnrMhVtf6VdKwSo+YokaDB/jW8YU1k2hXY=
Authentication-Results: spf=none (sender IP is ) smtp.mailfrom=alxndr@bu.edu; 
Received: from SN6PR03MB3871.namprd03.prod.outlook.com (2603:10b6:805:6d::32)
 by SN6PR03MB3807.namprd03.prod.outlook.com (2603:10b6:805:6a::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2729.22; Thu, 20 Feb
 2020 04:11:47 +0000
Received: from SN6PR03MB3871.namprd03.prod.outlook.com
 ([fe80::9c11:10cd:6e97:bbe8]) by SN6PR03MB3871.namprd03.prod.outlook.com
 ([fe80::9c11:10cd:6e97:bbe8%7]) with mapi id 15.20.2729.033; Thu, 20 Feb 2020
 04:11:47 +0000
From: Alexander Bulekov <alxndr@bu.edu>
To: qemu-devel@nongnu.org
Subject: [PATCH v10 12/22] fuzz: add fuzzer skeleton
Date: Wed, 19 Feb 2020 23:11:08 -0500
Message-ID: <20200220041118.23264-13-alxndr@bu.edu>
X-Mailer: git-send-email 2.25.0
In-Reply-To: <20200220041118.23264-1-alxndr@bu.edu>
References: <20200220041118.23264-1-alxndr@bu.edu>
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: BL0PR0102CA0048.prod.exchangelabs.com
 (2603:10b6:208:25::25) To SN6PR03MB3871.namprd03.prod.outlook.com
 (2603:10b6:805:6d::32)
MIME-Version: 1.0
Received: from mozz.bu.edu (128.197.127.33) by
 BL0PR0102CA0048.prod.exchangelabs.com (2603:10b6:208:25::25) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2750.17 via Frontend Transport; Thu, 20 Feb 2020 04:11:46 +0000
X-Mailer: git-send-email 2.25.0
X-Originating-IP: [128.197.127.33]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 89b30f66-5721-480b-cf47-08d7b5bb00b6
X-MS-TrafficTypeDiagnostic: SN6PR03MB3807:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <SN6PR03MB3807691B3C3E0D9317168F4BBA130@SN6PR03MB3807.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2512;
X-Forefront-PRVS: 031996B7EF
X-Forefront-Antispam-Report: SFV:NSPM;
 SFS:(10019020)(4636009)(346002)(136003)(396003)(39860400002)(376002)(366004)(199004)(189003)(36756003)(86362001)(81166006)(75432002)(8676002)(2616005)(478600001)(81156014)(8936002)(66476007)(5660300002)(6916009)(66556008)(66946007)(54906003)(956004)(316002)(786003)(6486002)(6666004)(7696005)(16526019)(186003)(26005)(4326008)(1076003)(2906002)(52116002);
 DIR:OUT; SFP:1102; SCL:1; SRVR:SN6PR03MB3807;
 H:SN6PR03MB3871.namprd03.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
Received-SPF: None (protection.outlook.com: bu.edu does not designate
 permitted sender hosts)
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: akfTuj/9UVt13F8L4k2vfmUClIPvTURhHKJb+ykI8JooKowm2p1VEJX28lRs4SS5f4JuoupLb1UWkuadcFvntSXBlQMPDmr4KZ3XBP9C1vtPyg8VlybCRS+NDEKrzivw684D3n0Cp9Vb392OM55fmJ941nkFwBezM4d2wga8JxyQsxQ+z7nY3ZHl+vgaICrLdvWwMFWe6W9QoU678QZofcJ8cM3bP3a8h/qahhRw8OY731vTpe7m7LK1cG+VFcW3iJ3fnBUSdflp20oQ+hRCOL/p+5bKMK+RaNP0iUMcNNdaMsnEli/cvRXyjn6STIH8DCsMR/Z+S2vFd9IMkbsG/DhQCItcDOHC+Gbg/wpHTr4thq67R/lE4WqB+89HcOri2W5ljQce1mHprPLxoauYCuXySbgnh0UhHU1WqvwVUfujZZJ4plrz/Dd/IW+LJ+6L
X-MS-Exchange-AntiSpam-MessageData: BTT29pBpkZ0LeET7qh9kPZdmc1alBJCvUo8ewlxIfxqL/q69C7GMA9EzpQJvR+ZvC0jlgngl9r4uKWdw9PNvr5RaJv3bK8KzF0YGdG8ChobzKsQD+kdje1RIQGS4ude3dtDvrDhfgX26AwWiSgkpsw==
X-OriginatorOrg: bu.edu
X-MS-Exchange-CrossTenant-Network-Message-Id: 89b30f66-5721-480b-cf47-08d7b5bb00b6
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Feb 2020 04:11:47.3685 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d57d32cc-c121-488f-b07b-dfe705680c71
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jMfX9RtjqcVtpugkVS4I8qAU5mLbPBC8jU1tj3rag47w47wtr4E2+23Nye8YhPlB
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR03MB3807
X-detected-operating-system: by eggs.gnu.org: Windows NT kernel [generic]
 [fuzzy]
X-Received-From: 40.107.220.111
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
Cc: Laurent Vivier <lvivier@redhat.com>, Thomas Huth <thuth@redhat.com>,
 darren.kenny@oracle.com, Alexander Bulekov <alxndr@bu.edu>, bsd@redhat.com,
 stefanha@redhat.com, pbonzini@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

tests/fuzz/fuzz.c serves as the entry point for the virtual-device
fuzzer. Namely, libfuzzer invokes the LLVMFuzzerInitialize and
LLVMFuzzerTestOneInput functions, both of which are defined in this
file. This change adds a "FuzzTarget" struct, along with the
fuzz_add_target function, which should be used to define new fuzz
targets.

Signed-off-by: Alexander Bulekov <alxndr@bu.edu>
Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>
Reviewed-by: Darren Kenny <darren.kenny@oracle.com>
---
 MAINTAINERS                       |   8 ++
 tests/qtest/fuzz/Makefile.include |   6 +
 tests/qtest/fuzz/fuzz.c           | 179 ++++++++++++++++++++++++++++++
 tests/qtest/fuzz/fuzz.h           |  95 ++++++++++++++++
 4 files changed, 288 insertions(+)
 create mode 100644 tests/qtest/fuzz/Makefile.include
 create mode 100644 tests/qtest/fuzz/fuzz.c
 create mode 100644 tests/qtest/fuzz/fuzz.h

diff --git a/MAINTAINERS b/MAINTAINERS
index a8e2a5f8c7..ee2300b44c 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -2176,6 +2176,14 @@ F: qtest.c
 F: accel/qtest.c
 F: tests/qtest/
=20
+Device Fuzzing
+M: Alexander Bulekov <alxndr@bu.edu>
+R: Paolo Bonzini <pbonzini@redhat.com>
+R: Bandan Das <bsd@redhat.com>
+R: Stefan Hajnoczi <stefanha@redhat.com>
+S: Maintained
+F: tests/qtest/fuzz/
+
 Register API
 M: Alistair Francis <alistair@alistair23.me>
 S: Maintained
diff --git a/tests/qtest/fuzz/Makefile.include b/tests/qtest/fuzz/Makefile.=
include
new file mode 100644
index 0000000000..8632bb89f4
--- /dev/null
+++ b/tests/qtest/fuzz/Makefile.include
@@ -0,0 +1,6 @@
+QEMU_PROG_FUZZ=3Dqemu-fuzz-$(TARGET_NAME)$(EXESUF)
+
+fuzz-obj-y +=3D tests/qtest/libqtest.o
+fuzz-obj-y +=3D tests/qtest/fuzz/fuzz.o # Fuzzer skeleton
+
+FUZZ_CFLAGS +=3D -I$(SRC_PATH)/tests -I$(SRC_PATH)/tests/qtest
diff --git a/tests/qtest/fuzz/fuzz.c b/tests/qtest/fuzz/fuzz.c
new file mode 100644
index 0000000000..0d78ac8d36
--- /dev/null
+++ b/tests/qtest/fuzz/fuzz.c
@@ -0,0 +1,179 @@
+/*
+ * fuzzing driver
+ *
+ * Copyright Red Hat Inc., 2019
+ *
+ * Authors:
+ *  Alexander Bulekov   <alxndr@bu.edu>
+ *
+ * This work is licensed under the terms of the GNU GPL, version 2 or late=
r.
+ * See the COPYING file in the top-level directory.
+ *
+ */
+
+#include "qemu/osdep.h"
+
+#include <wordexp.h>
+
+#include "sysemu/qtest.h"
+#include "sysemu/runstate.h"
+#include "sysemu/sysemu.h"
+#include "qemu/main-loop.h"
+#include "tests/qtest/libqtest.h"
+#include "tests/qtest/libqos/qgraph.h"
+#include "fuzz.h"
+
+#define MAX_EVENT_LOOPS 10
+
+typedef struct FuzzTargetState {
+        FuzzTarget *target;
+        QSLIST_ENTRY(FuzzTargetState) target_list;
+} FuzzTargetState;
+
+typedef QSLIST_HEAD(, FuzzTargetState) FuzzTargetList;
+
+static const char *fuzz_arch =3D TARGET_NAME;
+
+static FuzzTargetList *fuzz_target_list;
+static FuzzTarget *fuzz_target;
+static QTestState *fuzz_qts;
+
+
+
+void flush_events(QTestState *s)
+{
+    int i =3D MAX_EVENT_LOOPS;
+    while (g_main_context_pending(NULL) && i-- > 0) {
+        main_loop_wait(false);
+    }
+}
+
+static QTestState *qtest_setup(void)
+{
+    qtest_server_set_send_handler(&qtest_client_inproc_recv, &fuzz_qts);
+    return qtest_inproc_init(&fuzz_qts, false, fuzz_arch,
+            &qtest_server_inproc_recv);
+}
+
+void fuzz_add_target(const FuzzTarget *target)
+{
+    FuzzTargetState *tmp;
+    FuzzTargetState *target_state;
+    if (!fuzz_target_list) {
+        fuzz_target_list =3D g_new0(FuzzTargetList, 1);
+    }
+
+    QSLIST_FOREACH(tmp, fuzz_target_list, target_list) {
+        if (g_strcmp0(tmp->target->name, target->name) =3D=3D 0) {
+            fprintf(stderr, "Error: Fuzz target name %s already in use\n",
+                    target->name);
+            abort();
+        }
+    }
+    target_state =3D g_new0(FuzzTargetState, 1);
+    target_state->target =3D g_new0(FuzzTarget, 1);
+    *(target_state->target) =3D *target;
+    QSLIST_INSERT_HEAD(fuzz_target_list, target_state, target_list);
+}
+
+
+
+static void usage(char *path)
+{
+    printf("Usage: %s --fuzz-target=3DFUZZ_TARGET [LIBFUZZER ARGUMENTS]\n"=
, path);
+    printf("where FUZZ_TARGET is one of:\n");
+    FuzzTargetState *tmp;
+    if (!fuzz_target_list) {
+        fprintf(stderr, "Fuzz target list not initialized\n");
+        abort();
+    }
+    QSLIST_FOREACH(tmp, fuzz_target_list, target_list) {
+        printf(" * %s  : %s\n", tmp->target->name,
+                tmp->target->description);
+    }
+    exit(0);
+}
+
+static FuzzTarget *fuzz_get_target(char* name)
+{
+    FuzzTargetState *tmp;
+    if (!fuzz_target_list) {
+        fprintf(stderr, "Fuzz target list not initialized\n");
+        abort();
+    }
+
+    QSLIST_FOREACH(tmp, fuzz_target_list, target_list) {
+        if (strcmp(tmp->target->name, name) =3D=3D 0) {
+            return tmp->target;
+        }
+    }
+    return NULL;
+}
+
+
+/* Executed for each fuzzing-input */
+int LLVMFuzzerTestOneInput(const unsigned char *Data, size_t Size)
+{
+    /*
+     * Do the pre-fuzz-initialization before the first fuzzing iteration,
+     * instead of before the actual fuzz loop. This is needed since libfuz=
zer
+     * may fork off additional workers, prior to the fuzzing loop, and if
+     * pre_fuzz() sets up e.g. shared memory, this should be done for the
+     * individual worker processes
+     */
+    static int pre_fuzz_done;
+    if (!pre_fuzz_done && fuzz_target->pre_fuzz) {
+        fuzz_target->pre_fuzz(fuzz_qts);
+        pre_fuzz_done =3D true;
+    }
+
+    fuzz_target->fuzz(fuzz_qts, Data, Size);
+    return 0;
+}
+
+/* Executed once, prior to fuzzing */
+int LLVMFuzzerInitialize(int *argc, char ***argv, char ***envp)
+{
+
+    char *target_name;
+
+    /* Initialize qgraph and modules */
+    qos_graph_init();
+    module_call_init(MODULE_INIT_FUZZ_TARGET);
+    module_call_init(MODULE_INIT_QOM);
+    module_call_init(MODULE_INIT_LIBQOS);
+
+    if (*argc <=3D 1) {
+        usage(**argv);
+    }
+
+    /* Identify the fuzz target */
+    target_name =3D (*argv)[1];
+    if (!strstr(target_name, "--fuzz-target=3D")) {
+        usage(**argv);
+    }
+
+    target_name +=3D strlen("--fuzz-target=3D");
+
+    fuzz_target =3D fuzz_get_target(target_name);
+    if (!fuzz_target) {
+        usage(**argv);
+    }
+
+    fuzz_qts =3D qtest_setup();
+
+    if (fuzz_target->pre_vm_init) {
+        fuzz_target->pre_vm_init();
+    }
+
+    /* Run QEMU's softmmu main with the fuzz-target dependent arguments */
+    const char *init_cmdline =3D fuzz_target->get_init_cmdline(fuzz_target=
);
+
+    /* Split the runcmd into an argv and argc */
+    wordexp_t result;
+    wordexp(init_cmdline, &result, 0);
+
+    qemu_init(result.we_wordc, result.we_wordv, NULL);
+
+    return 0;
+}
diff --git a/tests/qtest/fuzz/fuzz.h b/tests/qtest/fuzz/fuzz.h
new file mode 100644
index 0000000000..03901d414e
--- /dev/null
+++ b/tests/qtest/fuzz/fuzz.h
@@ -0,0 +1,95 @@
+/*
+ * fuzzing driver
+ *
+ * Copyright Red Hat Inc., 2019
+ *
+ * Authors:
+ *  Alexander Bulekov   <alxndr@bu.edu>
+ *
+ * This work is licensed under the terms of the GNU GPL, version 2 or late=
r.
+ * See the COPYING file in the top-level directory.
+ *
+ */
+
+#ifndef FUZZER_H_
+#define FUZZER_H_
+
+#include "qemu/osdep.h"
+#include "qemu/units.h"
+#include "qapi/error.h"
+
+#include "tests/qtest/libqtest.h"
+
+/**
+ * A libfuzzer fuzzing target
+ *
+ * The QEMU fuzzing binary is built with all available targets, each
+ * with a unique @name that can be specified on the command-line to
+ * select which target should run.
+ *
+ * A target must implement ->fuzz() to process a random input.  If QEMU
+ * crashes in ->fuzz() then libfuzzer will record a failure.
+ *
+ * Fuzzing targets are registered with fuzz_add_target():
+ *
+ *   static const FuzzTarget fuzz_target =3D {
+ *       .name =3D "my-device-fifo",
+ *       .description =3D "Fuzz the FIFO buffer registers of my-device",
+ *       ...
+ *   };
+ *
+ *   static void register_fuzz_target(void)
+ *   {
+ *       fuzz_add_target(&fuzz_target);
+ *   }
+ *   fuzz_target_init(register_fuzz_target);
+ */
+typedef struct FuzzTarget {
+    const char *name;         /* target identifier (passed to --fuzz-targe=
t=3D)*/
+    const char *description;  /* help text */
+
+
+    /*
+     * returns the arg-list that is passed to qemu/softmmu init()
+     * Cannot be NULL
+     */
+    const char* (*get_init_cmdline)(struct FuzzTarget *);
+
+    /*
+     * will run once, prior to running qemu/softmmu init.
+     * eg: set up shared-memory for communication with the child-process
+     * Can be NULL
+     */
+    void(*pre_vm_init)(void);
+
+    /*
+     * will run once, after QEMU has been initialized, prior to the fuzz-l=
oop.
+     * eg: detect the memory map
+     * Can be NULL
+     */
+    void(*pre_fuzz)(QTestState *);
+
+    /*
+     * accepts and executes an input from libfuzzer. this is repeatedly
+     * executed during the fuzzing loop. Its should handle setup, input
+     * execution and cleanup.
+     * Cannot be NULL
+     */
+    void(*fuzz)(QTestState *, const unsigned char *, size_t);
+
+} FuzzTarget;
+
+void flush_events(QTestState *);
+void reboot(QTestState *);
+
+/*
+ * makes a copy of *target and adds it to the target-list.
+ * i.e. fine to set up target on the caller's stack
+ */
+void fuzz_add_target(const FuzzTarget *target);
+
+int LLVMFuzzerTestOneInput(const unsigned char *Data, size_t Size);
+int LLVMFuzzerInitialize(int *argc, char ***argv, char ***envp);
+
+#endif
+
--=20
2.25.0


