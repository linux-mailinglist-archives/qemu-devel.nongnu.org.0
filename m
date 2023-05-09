Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F1C866FCB4E
	for <lists+qemu-devel@lfdr.de>; Tue,  9 May 2023 18:29:38 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pwQC0-0003IA-Lh; Tue, 09 May 2023 12:28:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imbrenda@linux.ibm.com>)
 id 1pwQBx-0003HE-MY; Tue, 09 May 2023 12:27:58 -0400
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imbrenda@linux.ibm.com>)
 id 1pwQBu-0006KP-Ej; Tue, 09 May 2023 12:27:56 -0400
Received: from pps.filterd (m0353727.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 349FnqaN003837; Tue, 9 May 2023 16:27:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : mime-version : content-transfer-encoding; s=pp1;
 bh=AZ2mXYuNmNsXtbOFIZ6ilqULOBV+EOo8ZzfJqVBBkew=;
 b=F3nQG/T9NRk0IEKTTBxiFk/M11hFB7YEHaGGHU354KJZb6zbsE7c+Ke7ehaX60GVKKww
 zC5C8PQIyFSlgW92ccAUjnJoriYAgThiA9A99sI3HACrcSva/YhOSMuOOz8KWMHeQ79q
 h39boWFchIQGiQ2UvdrUQFQyBI9PPmLt81wm99SnswKSSd04wMwy1m7iAxTpdnwU56nD
 Ykd4WpE8XNEsvVNF+OWk+raWRFxP5n/eZiQpL1XqF5QCu1DCjho2VErAs3sKwF0EFatW
 JRJ0U+PLz3QtG0R55OOa6fJAX7cVTZLWzNpJj5Y6ytH9OpKvo2LQyYEPhw6fDxXqyvUR vg== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3qfrbav37a-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 09 May 2023 16:27:47 +0000
Received: from m0353727.ppops.net (m0353727.ppops.net [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 349GOSom007060;
 Tue, 9 May 2023 16:27:47 GMT
Received: from ppma06fra.de.ibm.com (48.49.7a9f.ip4.static.sl-reverse.com
 [159.122.73.72])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3qfrbav35y-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 09 May 2023 16:27:47 +0000
Received: from pps.filterd (ppma06fra.de.ibm.com [127.0.0.1])
 by ppma06fra.de.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 349Brrtb031277;
 Tue, 9 May 2023 16:27:45 GMT
Received: from smtprelay05.fra02v.mail.ibm.com ([9.218.2.225])
 by ppma06fra.de.ibm.com (PPS) with ESMTPS id 3qf7e0rf53-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 09 May 2023 16:27:44 +0000
Received: from smtpav07.fra02v.mail.ibm.com (smtpav07.fra02v.mail.ibm.com
 [10.20.54.106])
 by smtprelay05.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 349GRfC325952752
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 9 May 2023 16:27:41 GMT
Received: from smtpav07.fra02v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 28C2C20043;
 Tue,  9 May 2023 16:27:41 +0000 (GMT)
Received: from smtpav07.fra02v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id E25BA20040;
 Tue,  9 May 2023 16:27:40 +0000 (GMT)
Received: from p-imbrenda.boeblingen.de.ibm.com (unknown [9.152.224.56])
 by smtpav07.fra02v.mail.ibm.com (Postfix) with ESMTP;
 Tue,  9 May 2023 16:27:40 +0000 (GMT)
From: Claudio Imbrenda <imbrenda@linux.ibm.com>
To: qemu-devel@nongnu.org
Cc: qemu-s390x@nongnu.org, borntraeger@de.ibm.com, nsg@linux.ibm.com,
 nrb@linux.ibm.com, frankja@linux.ibm.com, pasic@linux.ibm.com,
 mhartmay@linux.ibm.com, thuth@redhat.com
Subject: [PATCH v1 1/1] s390x/pv: Fix spurious warning with asynchronous
 teardown
Date: Tue,  9 May 2023 18:27:40 +0200
Message-Id: <20230509162740.58081-1-imbrenda@linux.ibm.com>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: enA3VjTaNfg_G211p7ZPIHYuKsO-iXz6
X-Proofpoint-ORIG-GUID: hK72GOGhc_hV3VANDpagKKNYsyIIPJME
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-05-09_09,2023-05-05_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 spamscore=0 malwarescore=0 mlxscore=0 suspectscore=0 clxscore=1011
 phishscore=0 lowpriorityscore=0 impostorscore=0 mlxlogscore=938
 adultscore=0 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2304280000 definitions=main-2305090132
Received-SPF: pass client-ip=148.163.156.1;
 envelope-from=imbrenda@linux.ibm.com; helo=mx0a-001b2d01.pphosted.com
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

When rebooting a small VM using asynchronous teardown, a spurious
warning is emitted when the KVM_PV_ASYNC_CLEANUP_PREPARE ioctl fails.

Avoid using asynchronous teardown altogether when the VM is small
enough; the cutoff is set at 4GiB. This will avoid triggering the
warning and also avoid pointless overhead; normal teardown is fast
enough for small VMs.

Reported-by: Marc Hartmayer <mhartmay@linux.ibm.com>
Fixes: c3a073c610 ("s390x/pv: Add support for asynchronous teardown for reboot")
Signed-off-by: Claudio Imbrenda <imbrenda@linux.ibm.com>
---
 hw/s390x/pv.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/hw/s390x/pv.c b/hw/s390x/pv.c
index 49ea38236c..17c5556319 100644
--- a/hw/s390x/pv.c
+++ b/hw/s390x/pv.c
@@ -13,6 +13,7 @@
 
 #include <linux/kvm.h>
 
+#include "qemu/units.h"
 #include "qapi/error.h"
 #include "qemu/error-report.h"
 #include "sysemu/kvm.h"
@@ -117,13 +118,16 @@ static void *s390_pv_do_unprot_async_fn(void *p)
 
 bool s390_pv_vm_try_disable_async(void)
 {
+    MachineState *machine = MACHINE(qdev_get_machine());
     /*
      * t is only needed to create the thread; once qemu_thread_create
      * returns, it can safely be discarded.
      */
     QemuThread t;
 
-    if (!kvm_check_extension(kvm_state, KVM_CAP_S390_PROTECTED_ASYNC_DISABLE)) {
+    /* Avoid the overhead of asynchronous teardown for small machines */
+    if ((machine->maxram_size < 4 * GiB) ||
+        !kvm_check_extension(kvm_state, KVM_CAP_S390_PROTECTED_ASYNC_DISABLE)) {
         return false;
     }
     if (s390_pv_cmd(KVM_PV_ASYNC_CLEANUP_PREPARE, NULL) != 0) {
-- 
2.40.1


