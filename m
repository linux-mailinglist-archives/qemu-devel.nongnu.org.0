Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E76496DC994
	for <lists+qemu-devel@lfdr.de>; Mon, 10 Apr 2023 18:54:18 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1plulS-0003nn-Qp; Mon, 10 Apr 2023 12:53:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1plulQ-0003n6-9F
 for qemu-devel@nongnu.org; Mon, 10 Apr 2023 12:53:08 -0400
Received: from mail-oa1-x29.google.com ([2001:4860:4864:20::29])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1plulO-0007Lv-IT
 for qemu-devel@nongnu.org; Mon, 10 Apr 2023 12:53:08 -0400
Received: by mail-oa1-x29.google.com with SMTP id
 586e51a60fabf-1842df7cb53so6650745fac.10
 for <qemu-devel@nongnu.org>; Mon, 10 Apr 2023 09:53:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1681145585;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=+SKXBRJdA9KUw/4IAA9R3X/vHCTMNddy95IWzacAV94=;
 b=DCuMzgtaV6/8YryveBOUnWhRhzOgPiP8dxPz+OTKeNuoM7P7R4gS8b5L6yW1UCZSQY
 s1syP1u9GShinaYVfY2IYR5E7SXrgWJ1W4Ls+9TwQZS5RmmS+kbGphkfWiu7uTj1qX7y
 x9caTRslTuCV453yEnf29QvKP+P69GGZV6+vC29TQuelAor2M+QZN73T7LB8SMK5AVU4
 3tLjYCro1JJZ9B0/4+6zQ6JZ0cP2oj9PxkvE+l/+rT3QRU6coWXDuUAVtg2WWNBLESj+
 5YCcLPtltme2j3znwWQra2DvDww64v6aYOwfZvTyc0mkPHzkAExqhKlnQXvRfK6PZV3I
 XKmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1681145585;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=+SKXBRJdA9KUw/4IAA9R3X/vHCTMNddy95IWzacAV94=;
 b=mMxsqWI59sq/ZBYPGaFcfmrvgGMY7iz9pfwVBhg0TDh51exdW8c+nUFtLUWwSS5wUy
 2y2OJ2O5UXoIiMHg6zO5MpP8R0s6fleSWovT0AH7MMxW7To6JDBKmETNbCwtLubv+rMW
 5bVeel8CGBEOYoWlHEn8yKqFrYt2w+Lq484KLq8ukBqrbaV8ETUxW7Y0t2s1mQLHAFCp
 gqxnigL8HtLqrfeMDPV1xekWwuVKQhpvV0uTuimWtOkfzbPw5euJNDMSds7M30nU8vIy
 49b7wwNJioGKXOmU2pgD4QidwO3Vo7+I9iR/QhhbH7kT/XaZjzId8J/Uhe2ZylcWKzus
 D2hA==
X-Gm-Message-State: AAQBX9eqfrHQNkALRQJQ8A7Yzm03P6ZKE03ymdhSrxGJsWNxgrmDUMPw
 U6OO/frE4rY8IImgyYUjdnJ65wvoLRvRQPBSihA=
X-Google-Smtp-Source: AKy350bmMiGxuYTotDg8EwwLbao2P5bpIykvmT1FGWlLzRVLWkAOBChGkNA0nL0lYuREEjAja1xSBw==
X-Received: by 2002:a05:6870:d113:b0:184:12f8:e22e with SMTP id
 e19-20020a056870d11300b0018412f8e22emr6877917oac.5.1681145585025; 
 Mon, 10 Apr 2023 09:53:05 -0700 (PDT)
Received: from grind.. ([191.255.108.232]) by smtp.gmail.com with ESMTPSA id
 zq36-20020a0568718ea400b0017f647294f5sm4191896oab.16.2023.04.10.09.53.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 10 Apr 2023 09:53:04 -0700 (PDT)
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, bmeng@tinylab.org,
 liweiwei@iscas.ac.cn, zhiwei_liu@linux.alibaba.com, palmer@rivosinc.com,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Subject: [PATCH v2 2/4] target/riscv: add query-cpy-definitions support
Date: Mon, 10 Apr 2023 13:52:49 -0300
Message-Id: <20230410165251.99107-3-dbarboza@ventanamicro.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230410165251.99107-1-dbarboza@ventanamicro.com>
References: <20230410165251.99107-1-dbarboza@ventanamicro.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2001:4860:4864:20::29;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-oa1-x29.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

This command is used by tooling like libvirt to retrieve a list of
supported CPUs. Each entry returns a CpuDefinitionInfo object that
contains more information about each CPU.

This initial support includes only the name of the CPU and its typename.
Here's what the command produces for the riscv64 target:

$ ./build/qemu-system-riscv64 -S -M virt -display none -qmp stdio
{"QMP": {"version": (...)}
{"execute": "qmp_capabilities", "arguments": {"enable": ["oob"]}}
{"return": {}}
{"execute": "query-cpu-definitions"}
{"return": [
{"name": "rv64", "typename": "rv64-riscv-cpu", "static": false, "deprecated": false},
{"name": "sifive-e51", "typename": "sifive-e51-riscv-cpu", "static": false, "deprecated": false},
{"name": "any", "typename": "any-riscv-cpu", "static": false, "deprecated": false},
{"name": "x-rv128", "typename": "x-rv128-riscv-cpu", "static": false, "deprecated": false},
{"name": "shakti-c", "typename": "shakti-c-riscv-cpu", "static": false, "deprecated": false},
{"name": "thead-c906", "typename": "thead-c906-riscv-cpu", "static": false, "deprecated": false},
{"name": "sifive-u54", "typename": "sifive-u54-riscv-cpu", "static": false, "deprecated": false}]
}

Next patches will implement the 'static' attribute of CpuDefinitionInfo.

Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
---
 qapi/machine-target.json      |  6 ++--
 target/riscv/meson.build      |  3 +-
 target/riscv/riscv-qmp-cmds.c | 53 +++++++++++++++++++++++++++++++++++
 3 files changed, 59 insertions(+), 3 deletions(-)
 create mode 100644 target/riscv/riscv-qmp-cmds.c

diff --git a/qapi/machine-target.json b/qapi/machine-target.json
index 2e267fa458..f3a3de6648 100644
--- a/qapi/machine-target.json
+++ b/qapi/machine-target.json
@@ -324,7 +324,8 @@
                    'TARGET_I386',
                    'TARGET_S390X',
                    'TARGET_MIPS',
-                   'TARGET_LOONGARCH64' ] } }
+                   'TARGET_LOONGARCH64',
+                   'TARGET_RISCV' ] } }
 
 ##
 # @query-cpu-definitions:
@@ -341,4 +342,5 @@
                    'TARGET_I386',
                    'TARGET_S390X',
                    'TARGET_MIPS',
-                   'TARGET_LOONGARCH64' ] } }
+                   'TARGET_LOONGARCH64',
+                   'TARGET_RISCV' ] } }
diff --git a/target/riscv/meson.build b/target/riscv/meson.build
index 5b7f813a3e..e1ff6d9b95 100644
--- a/target/riscv/meson.build
+++ b/target/riscv/meson.build
@@ -32,7 +32,8 @@ riscv_softmmu_ss.add(files(
   'monitor.c',
   'machine.c',
   'pmu.c',
-  'time_helper.c'
+  'time_helper.c',
+  'riscv-qmp-cmds.c',
 ))
 
 target_arch += {'riscv': riscv_ss}
diff --git a/target/riscv/riscv-qmp-cmds.c b/target/riscv/riscv-qmp-cmds.c
new file mode 100644
index 0000000000..128677add9
--- /dev/null
+++ b/target/riscv/riscv-qmp-cmds.c
@@ -0,0 +1,53 @@
+/*
+ * QEMU CPU QMP commands for RISC-V
+ *
+ * Copyright (c) 2023 Ventana Micro Systems Inc.
+ *
+ * Permission is hereby granted, free of charge, to any person obtaining a copy
+ * of this software and associated documentation files (the "Software"), to deal
+ * in the Software without restriction, including without limitation the rights
+ * to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
+ * copies of the Software, and to permit persons to whom the Software is
+ * furnished to do so, subject to the following conditions:
+ *
+ * The above copyright notice and this permission notice shall be included in
+ * all copies or substantial portions of the Software.
+ *
+ * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
+ * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
+ * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL
+ * THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
+ * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
+ * OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
+ * THE SOFTWARE.
+ */
+
+#include "qemu/osdep.h"
+
+#include "qapi/qapi-commands-machine-target.h"
+#include "cpu-qom.h"
+
+static void riscv_cpu_add_definition(gpointer data, gpointer user_data)
+{
+    ObjectClass *oc = data;
+    CpuDefinitionInfoList **cpu_list = user_data;
+    CpuDefinitionInfo *info = g_malloc0(sizeof(*info));
+    const char *typename = object_class_get_name(oc);
+
+    info->name = g_strndup(typename,
+                           strlen(typename) - strlen("-" TYPE_RISCV_CPU));
+    info->q_typename = g_strdup(typename);
+
+    QAPI_LIST_PREPEND(*cpu_list, info);
+}
+
+CpuDefinitionInfoList *qmp_query_cpu_definitions(Error **errp)
+{
+    CpuDefinitionInfoList *cpu_list = NULL;
+    GSList *list = object_class_get_list(TYPE_RISCV_CPU, false);
+
+    g_slist_foreach(list, riscv_cpu_add_definition, &cpu_list);
+    g_slist_free(list);
+
+    return cpu_list;
+}
-- 
2.39.2


