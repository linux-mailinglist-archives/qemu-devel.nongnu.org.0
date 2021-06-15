Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E3C03A83F5
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Jun 2021 17:27:50 +0200 (CEST)
Received: from localhost ([::1]:40734 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ltAyj-00020w-Id
	for lists+qemu-devel@lfdr.de; Tue, 15 Jun 2021 11:27:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55184)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanb@linux.vnet.ibm.com>)
 id 1ltAtW-0001LJ-7q
 for qemu-devel@nongnu.org; Tue, 15 Jun 2021 11:22:26 -0400
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:40386
 helo=mx0a-001b2d01.pphosted.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanb@linux.vnet.ibm.com>)
 id 1ltAtT-0006PY-Qr
 for qemu-devel@nongnu.org; Tue, 15 Jun 2021 11:22:25 -0400
Received: from pps.filterd (m0098420.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 15FF4JRR028203; Tue, 15 Jun 2021 11:22:21 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-type : content-transfer-encoding; s=pp1;
 bh=jK4vgPBy8Rt4KGUiquvdchOVaPLjYl+plWmJXvf3WlE=;
 b=BCCrgJ7chaU21tUPiyNVJR0lBbR0YkqcPvoD+B+g1I+grvoySEAzbsCjb99uCET0U6kL
 Yt8kOsgsaUlyDvMb7KPr6fscqe1na6m514dd16BzmMiyUqveIJiPFTtyYOxSiPSwFnfs
 us3oV6ol+UC8t+Fq8vylLKe/61UWXXMCx1vr8CFYlXdqVT4ylayPSvcV2bGguzXFPmaT
 UYP+THxZ4G43SLMzJ6dCkP+Og/uJPsYu7NyM4rXSkogKqr04vpL8HHn658QlMemyFeDA
 hSuX39233YEzILdV8AIdWYPbzDivXKZMN7m3K32VnxvPEQTHacYkg0S1la6JmESutiEK 0A== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com with ESMTP id 396wyuj5dr-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 15 Jun 2021 11:22:20 -0400
Received: from m0098420.ppops.net (m0098420.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 15FF4duh030217;
 Tue, 15 Jun 2021 11:22:20 -0400
Received: from ppma01wdc.us.ibm.com (fd.55.37a9.ip4.static.sl-reverse.com
 [169.55.85.253])
 by mx0b-001b2d01.pphosted.com with ESMTP id 396wyuj5d9-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 15 Jun 2021 11:22:20 -0400
Received: from pps.filterd (ppma01wdc.us.ibm.com [127.0.0.1])
 by ppma01wdc.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 15FFDPJ2012476;
 Tue, 15 Jun 2021 15:22:19 GMT
Received: from b03cxnp07029.gho.boulder.ibm.com
 (b03cxnp07029.gho.boulder.ibm.com [9.17.130.16])
 by ppma01wdc.us.ibm.com with ESMTP id 394mj99032-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 15 Jun 2021 15:22:19 +0000
Received: from b03ledav004.gho.boulder.ibm.com
 (b03ledav004.gho.boulder.ibm.com [9.17.130.235])
 by b03cxnp07029.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 15FFMIPp19464526
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 15 Jun 2021 15:22:18 GMT
Received: from b03ledav004.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id B90C57805F;
 Tue, 15 Jun 2021 15:22:18 +0000 (GMT)
Received: from b03ledav004.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 5747978064;
 Tue, 15 Jun 2021 15:22:18 +0000 (GMT)
Received: from sbct-3.pok.ibm.com?044watson.ibm.com (unknown [9.47.158.153])
 by b03ledav004.gho.boulder.ibm.com (Postfix) with ESMTP;
 Tue, 15 Jun 2021 15:22:18 +0000 (GMT)
From: Stefan Berger <stefanb@linux.vnet.ibm.com>
To: qemu-devel@nongnu.org
Subject: [PULL v1 5/5] tpm: Return QMP error when TPM is disabled in build
Date: Tue, 15 Jun 2021 11:21:52 -0400
Message-Id: <20210615152152.2496772-6-stefanb@linux.vnet.ibm.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210615152152.2496772-1-stefanb@linux.vnet.ibm.com>
References: <20210615152152.2496772-1-stefanb@linux.vnet.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: hzf1Dj-HkGzvbB2k75vVUHzhJ3WiD1tq
X-Proofpoint-GUID: wRkG7wlljSGLf6O5uXJHiutNv6B4yBMw
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.761
 definitions=2021-06-15_07:2021-06-14,
 2021-06-15 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0
 spamscore=0 priorityscore=1501 impostorscore=0 mlxscore=0 phishscore=0
 adultscore=0 bulkscore=0 malwarescore=0 mlxlogscore=999 lowpriorityscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2104190000
 definitions=main-2106150095
Received-SPF: none client-ip=148.163.158.5;
 envelope-from=stefanb@linux.vnet.ibm.com; helo=mx0a-001b2d01.pphosted.com
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_NONE=0.001 autolearn=ham autolearn_force=no
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
Cc: peter.maydell@linaro.org, Stefan Berger <stefanb@linux.ibm.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Markus Armbruster <armbru@redhat.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Philippe Mathieu-Daudé <philmd@redhat.com>

When the management layer queries a binary built using --disable-tpm
for TPM devices, it gets confused by getting empty responses:

  { "execute": "query-tpm" }
  {
      "return": [
      ]
  }
  { "execute": "query-tpm-types" }
  {
      "return": [
      ]
  }
  { "execute": "query-tpm-models" }
  {
      "return": [
      ]
  }

To make it clearer by returning an error:
- Make the TPM QAPI schema conditional
  All of tpm.json is now 'if': 'defined(CONFIG_TPM)'.
- Adapt the HMP command
- Remove stubs which became unnecessary

The management layer now gets a 'CommandNotFound' error:

  { "execute": "query-tpm" }
  {
      "error": {
          "class": "CommandNotFound",
          "desc": "The command query-tpm has not been found"
      }
  }

Suggested-by: Marc-André Lureau <marcandre.lureau@redhat.com>
Reviewed-by: Markus Armbruster <armbru@redhat.com>
Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Signed-off-by: Stefan Berger <stefanb@linux.ibm.com>
---
 MAINTAINERS        |  1 -
 monitor/hmp-cmds.c |  4 ++++
 qapi/tpm.json      | 28 +++++++++++++++++++---------
 stubs/meson.build  |  1 -
 stubs/tpm.c        | 25 -------------------------
 5 files changed, 23 insertions(+), 36 deletions(-)
 delete mode 100644 stubs/tpm.c

diff --git a/MAINTAINERS b/MAINTAINERS
index 7d9cd29042..636bf2f536 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -2707,7 +2707,6 @@ TPM
 M: Stefan Berger <stefanb@linux.ibm.com>
 S: Maintained
 F: tpm.c
-F: stubs/tpm.c
 F: hw/tpm/*
 F: include/hw/acpi/tpm.h
 F: include/sysemu/tpm*
diff --git a/monitor/hmp-cmds.c b/monitor/hmp-cmds.c
index d10ee14110..0942027208 100644
--- a/monitor/hmp-cmds.c
+++ b/monitor/hmp-cmds.c
@@ -901,6 +901,7 @@ void hmp_info_pci(Monitor *mon, const QDict *qdict)
 
 void hmp_info_tpm(Monitor *mon, const QDict *qdict)
 {
+#ifdef CONFIG_TPM
     TPMInfoList *info_list, *info;
     Error *err = NULL;
     unsigned int c = 0;
@@ -946,6 +947,9 @@ void hmp_info_tpm(Monitor *mon, const QDict *qdict)
         c++;
     }
     qapi_free_TPMInfoList(info_list);
+#else
+    monitor_printf(mon, "TPM device not supported\n");
+#endif /* CONFIG_TPM */
 }
 
 void hmp_quit(Monitor *mon, const QDict *qdict)
diff --git a/qapi/tpm.json b/qapi/tpm.json
index 6a10c9ed8d..75590979fd 100644
--- a/qapi/tpm.json
+++ b/qapi/tpm.json
@@ -17,7 +17,9 @@
 #
 # Since: 1.5
 ##
-{ 'enum': 'TpmModel', 'data': [ 'tpm-tis', 'tpm-crb', 'tpm-spapr' ] }
+{ 'enum': 'TpmModel', 'data': [ 'tpm-tis', 'tpm-crb', 'tpm-spapr' ],
+  'if': 'defined(CONFIG_TPM)' }
+
 ##
 # @query-tpm-models:
 #
@@ -33,7 +35,8 @@
 # <- { "return": [ "tpm-tis", "tpm-crb", "tpm-spapr" ] }
 #
 ##
-{ 'command': 'query-tpm-models', 'returns': ['TpmModel'] }
+{ 'command': 'query-tpm-models', 'returns': ['TpmModel'],
+  'if': 'defined(CONFIG_TPM)' }
 
 ##
 # @TpmType:
@@ -46,7 +49,8 @@
 #
 # Since: 1.5
 ##
-{ 'enum': 'TpmType', 'data': [ 'passthrough', 'emulator' ] }
+{ 'enum': 'TpmType', 'data': [ 'passthrough', 'emulator' ],
+  'if': 'defined(CONFIG_TPM)' }
 
 ##
 # @query-tpm-types:
@@ -63,7 +67,8 @@
 # <- { "return": [ "passthrough", "emulator" ] }
 #
 ##
-{ 'command': 'query-tpm-types', 'returns': ['TpmType'] }
+{ 'command': 'query-tpm-types', 'returns': ['TpmType'],
+  'if': 'defined(CONFIG_TPM)' }
 
 ##
 # @TPMPassthroughOptions:
@@ -79,7 +84,8 @@
 ##
 { 'struct': 'TPMPassthroughOptions',
   'data': { '*path': 'str',
-            '*cancel-path': 'str' } }
+            '*cancel-path': 'str' },
+  'if': 'defined(CONFIG_TPM)' }
 
 ##
 # @TPMEmulatorOptions:
@@ -90,7 +96,8 @@
 #
 # Since: 2.11
 ##
-{ 'struct': 'TPMEmulatorOptions', 'data': { 'chardev' : 'str' } }
+{ 'struct': 'TPMEmulatorOptions', 'data': { 'chardev' : 'str' },
+  'if': 'defined(CONFIG_TPM)' }
 
 ##
 # @TpmTypeOptions:
@@ -104,7 +111,8 @@
 ##
 { 'union': 'TpmTypeOptions',
    'data': { 'passthrough' : 'TPMPassthroughOptions',
-             'emulator': 'TPMEmulatorOptions' } }
+             'emulator': 'TPMEmulatorOptions' },
+  'if': 'defined(CONFIG_TPM)' }
 
 ##
 # @TPMInfo:
@@ -122,7 +130,8 @@
 { 'struct': 'TPMInfo',
   'data': {'id': 'str',
            'model': 'TpmModel',
-           'options': 'TpmTypeOptions' } }
+           'options': 'TpmTypeOptions' },
+  'if': 'defined(CONFIG_TPM)' }
 
 ##
 # @query-tpm:
@@ -152,4 +161,5 @@
 #    }
 #
 ##
-{ 'command': 'query-tpm', 'returns': ['TPMInfo'] }
+{ 'command': 'query-tpm', 'returns': ['TPMInfo'],
+  'if': 'defined(CONFIG_TPM)' }
diff --git a/stubs/meson.build b/stubs/meson.build
index 65c22c0568..d4e9549dc9 100644
--- a/stubs/meson.build
+++ b/stubs/meson.build
@@ -38,7 +38,6 @@ stub_ss.add(files('runstate-check.c'))
 stub_ss.add(files('sysbus.c'))
 stub_ss.add(files('target-get-monitor-def.c'))
 stub_ss.add(files('target-monitor-defs.c'))
-stub_ss.add(files('tpm.c'))
 stub_ss.add(files('trace-control.c'))
 stub_ss.add(files('uuid.c'))
 stub_ss.add(files('vmgenid.c'))
diff --git a/stubs/tpm.c b/stubs/tpm.c
deleted file mode 100644
index e79bd2a6c2..0000000000
--- a/stubs/tpm.c
+++ /dev/null
@@ -1,25 +0,0 @@
-/*
- * TPM stubs
- *
- * This work is licensed under the terms of the GNU GPL, version 2 or later.
- * See the COPYING file in the top-level directory.
- */
-
-#include "qemu/osdep.h"
-#include "qapi/qapi-commands-tpm.h"
-#include "hw/acpi/tpm.h"
-
-TPMInfoList *qmp_query_tpm(Error **errp)
-{
-    return NULL;
-}
-
-TpmTypeList *qmp_query_tpm_types(Error **errp)
-{
-    return NULL;
-}
-
-TpmModelList *qmp_query_tpm_models(Error **errp)
-{
-    return NULL;
-}
-- 
2.31.1


