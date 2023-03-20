Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FE2C6C1303
	for <lists+qemu-devel@lfdr.de>; Mon, 20 Mar 2023 14:17:30 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1peFNo-0002At-8k; Mon, 20 Mar 2023 09:17:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imbrenda@linux.ibm.com>)
 id 1peFNl-00029s-Il
 for qemu-devel@nongnu.org; Mon, 20 Mar 2023 09:17:01 -0400
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]
 helo=mx0a-001b2d01.pphosted.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imbrenda@linux.ibm.com>)
 id 1peFNk-0003J1-0z
 for qemu-devel@nongnu.org; Mon, 20 Mar 2023 09:17:01 -0400
Received: from pps.filterd (m0098420.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 32KDDhcd014377; Mon, 20 Mar 2023 13:16:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=U5E7ctTYPtf3mLaAWuxXt3d7uU2T9SJYBMkH9cntfKw=;
 b=MNpiJCFRj8oD9Po005qGVJ2Px8JVkMfyqp/YTyCT52lPRZu73xSTbPHe8+7SaRPIVPMc
 QrbQZzQvRaIdBbVC+kexy5Q0oQvFqwUM9eZ/OkF8KNSMD++aZf4jS7Xe5XYaO25T1un3
 cuv+kLRkQoWjARcsZ99Uuk/Vp4sO1iCfMsLEk55zQWlq2kx5sr117ooUrgLCC8OqFAa/
 TB6PD7OMAgTztneaFwBKs2D+4gifzWQIyRNC2Oczi8q9owS2ANN4vWdjB5G+VXokFUWM
 Y3fe/7yRarzegqfi+9E1NnirDAbcBiRX743SYVM1FEnPgCFS0j1vgi4kjrY8IZ1jPhgb Hw== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (PPS) with ESMTPS id 3per6c83c6-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 20 Mar 2023 13:16:56 +0000
Received: from m0098420.ppops.net (m0098420.ppops.net [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 32KDDmvn016108;
 Mon, 20 Mar 2023 13:16:56 GMT
Received: from ppma04ams.nl.ibm.com (63.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.99])
 by mx0b-001b2d01.pphosted.com (PPS) with ESMTPS id 3per6c83b7-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 20 Mar 2023 13:16:56 +0000
Received: from pps.filterd (ppma04ams.nl.ibm.com [127.0.0.1])
 by ppma04ams.nl.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 32K3mo1G016541;
 Mon, 20 Mar 2023 13:16:54 GMT
Received: from smtprelay02.fra02v.mail.ibm.com ([9.218.2.226])
 by ppma04ams.nl.ibm.com (PPS) with ESMTPS id 3pd4x6b9bq-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 20 Mar 2023 13:16:54 +0000
Received: from smtpav04.fra02v.mail.ibm.com (smtpav04.fra02v.mail.ibm.com
 [10.20.54.103])
 by smtprelay02.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 32KDGn0O62390592
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 20 Mar 2023 13:16:49 GMT
Received: from smtpav04.fra02v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id AAFDF20040;
 Mon, 20 Mar 2023 13:16:49 +0000 (GMT)
Received: from smtpav04.fra02v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 5A4202004D;
 Mon, 20 Mar 2023 13:16:49 +0000 (GMT)
Received: from p-imbrenda.boeblingen.de.ibm.com (unknown [9.152.224.56])
 by smtpav04.fra02v.mail.ibm.com (Postfix) with ESMTP;
 Mon, 20 Mar 2023 13:16:49 +0000 (GMT)
From: Claudio Imbrenda <imbrenda@linux.ibm.com>
To: pbonzini@redhat.com
Cc: qemu-devel@nongnu.org, david@redhat.com, thuth@redhat.com,
 borntraeger@de.ibm.com, frankja@linux.ibm.com, fiuczy@linux.ibm.com,
 pasic@linux.ibm.com, berrange@redhat.com, alex.bennee@linaro.org,
 armbru@redhat.com
Subject: [PATCH v2 1/1] util/async-teardown: wire up query-command-line-options
Date: Mon, 20 Mar 2023 14:16:48 +0100
Message-Id: <20230320131648.61728-2-imbrenda@linux.ibm.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230320131648.61728-1-imbrenda@linux.ibm.com>
References: <20230320131648.61728-1-imbrenda@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: RJGJHb5IP_Rw06natrRSNffJgbp-TGUC
X-Proofpoint-GUID: HkLCsaGNu5dPfAUmLUy4qE33-zrKoCzk
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-03-20_08,2023-03-20_02,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 impostorscore=0
 mlxscore=0 spamscore=0 suspectscore=0 malwarescore=0 mlxlogscore=999
 clxscore=1015 phishscore=0 priorityscore=1501 lowpriorityscore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2303150002 definitions=main-2303200110
Received-SPF: pass client-ip=148.163.158.5;
 envelope-from=imbrenda@linux.ibm.com; helo=mx0a-001b2d01.pphosted.com
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

The recently introduced -async-teardown commandline option was not
wired up properly and did not show up in the output of the QMP command
query-command-line-options. This means that libvirt will have no way to
discover whether the feature is supported.

This patch fixes the issue by correctly wiring up the commandline
option so that it appears in the output of query-command-line-options.

Reported-by: Boris Fiuczynski <fiuczy@linux.ibm.com>
Fixes: c891c24b1a ("os-posix: asynchronous teardown for shutdown on Linux")
Signed-off-by: Claudio Imbrenda <imbrenda@linux.ibm.com>
---
 util/async-teardown.c | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/util/async-teardown.c b/util/async-teardown.c
index 62cdeb0f20..c9b9a3cdb2 100644
--- a/util/async-teardown.c
+++ b/util/async-teardown.c
@@ -12,6 +12,9 @@
  */
 
 #include "qemu/osdep.h"
+#include "qemu/config-file.h"
+#include "qemu/option.h"
+#include "qemu/module.h"
 #include <dirent.h>
 #include <sys/prctl.h>
 #include <sched.h>
@@ -144,3 +147,17 @@ void init_async_teardown(void)
     clone(async_teardown_fn, new_stack_for_clone(), CLONE_VM, NULL);
     sigprocmask(SIG_SETMASK, &old_signals, NULL);
 }
+
+static QemuOptsList qemu_async_teardown_opts = {
+    .name = "async-teardown",
+    .head = QTAILQ_HEAD_INITIALIZER(qemu_async_teardown_opts.head),
+    .desc = {
+        { /* end of list */ }
+    },
+};
+
+static void register_async_teardown(void)
+{
+    qemu_add_opts(&qemu_async_teardown_opts);
+}
+opts_init(register_async_teardown);
-- 
2.39.2


