Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C821D12E389
	for <lists+qemu-devel@lfdr.de>; Thu,  2 Jan 2020 08:56:20 +0100 (CET)
Received: from localhost ([::1]:38024 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1imvL9-0007fM-LC
	for lists+qemu-devel@lfdr.de; Thu, 02 Jan 2020 02:56:19 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:36836)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <ganeshgr@linux.ibm.com>) id 1imvGo-0002fh-3X
 for qemu-devel@nongnu.org; Thu, 02 Jan 2020 02:51:51 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <ganeshgr@linux.ibm.com>) id 1imvGn-0005JM-3j
 for qemu-devel@nongnu.org; Thu, 02 Jan 2020 02:51:50 -0500
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:31112
 helo=mx0a-001b2d01.pphosted.com)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <ganeshgr@linux.ibm.com>)
 id 1imvGm-0005JD-Vi
 for qemu-devel@nongnu.org; Thu, 02 Jan 2020 02:51:49 -0500
Received: from pps.filterd (m0098420.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 0027lOTE158607
 for <qemu-devel@nongnu.org>; Thu, 2 Jan 2020 02:51:48 -0500
Received: from e06smtp05.uk.ibm.com (e06smtp05.uk.ibm.com [195.75.94.101])
 by mx0b-001b2d01.pphosted.com with ESMTP id 2x6n4b1j03-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <qemu-devel@nongnu.org>; Thu, 02 Jan 2020 02:51:48 -0500
Received: from localhost
 by e06smtp05.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <qemu-devel@nongnu.org> from <ganeshgr@linux.ibm.com>;
 Thu, 2 Jan 2020 07:51:46 -0000
Received: from b06cxnps4074.portsmouth.uk.ibm.com (9.149.109.196)
 by e06smtp05.uk.ibm.com (192.168.101.135) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Thu, 2 Jan 2020 07:51:43 -0000
Received: from d06av21.portsmouth.uk.ibm.com (d06av21.portsmouth.uk.ibm.com
 [9.149.105.232])
 by b06cxnps4074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 0027pg3V49414148
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 2 Jan 2020 07:51:42 GMT
Received: from d06av21.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 2E1F852059;
 Thu,  2 Jan 2020 07:51:42 +0000 (GMT)
Received: from localhost.localdomain.com (unknown [9.199.45.4])
 by d06av21.portsmouth.uk.ibm.com (Postfix) with ESMTP id 804B252050;
 Thu,  2 Jan 2020 07:51:39 +0000 (GMT)
From: Ganesh Goudar <ganeshgr@linux.ibm.com>
To: aik@ozlabs.ru, qemu-ppc@nongnu.org, qemu-devel@nongnu.org,
 david@gibson.dropbear.id.au
Subject: [PATCH v18 1/7] Wrapper function to wait on condition for the main
 loop mutex
Date: Thu,  2 Jan 2020 13:21:05 +0530
X-Mailer: git-send-email 2.17.2
In-Reply-To: <20200102075111.25308-1-ganeshgr@linux.ibm.com>
References: <20200102075111.25308-1-ganeshgr@linux.ibm.com>
X-TM-AS-GCONF: 00
x-cbid: 20010207-0020-0000-0000-0000039D2C0A
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 20010207-0021-0000-0000-000021F47980
Message-Id: <20200102075111.25308-2-ganeshgr@linux.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.95,18.0.572
 definitions=2020-01-02_01:2019-12-30,2020-01-02 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 adultscore=0
 impostorscore=0 mlxscore=0 mlxlogscore=850 clxscore=1015
 priorityscore=1501 bulkscore=0 malwarescore=0 phishscore=0 spamscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-1910280000 definitions=main-2001020072
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x [generic] [fuzzy]
X-Received-From: 148.163.158.5
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
Cc: paulus@ozlabs.org, Aravinda Prasad <arawinda.p@gmail.com>, groug@kaod.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Aravinda Prasad <arawinda.p@gmail.com>

Introduce a wrapper function to wait on condition for
the main loop mutex. This function atomically releases
the main loop mutex and causes the calling thread to
block on the condition. This wrapper is required because
qemu_global_mutex is a static variable.

Signed-off-by: Aravinda Prasad <arawinda.p@gmail.com>
Reviewed-by: David Gibson <david@gibson.dropbear.id.au>
Reviewed-by: Greg Kurz <groug@kaod.org>
---
 cpus.c                   | 5 +++++
 include/qemu/main-loop.h | 8 ++++++++
 2 files changed, 13 insertions(+)

diff --git a/cpus.c b/cpus.c
index b472378b70..79388d2b0f 100644
--- a/cpus.c
+++ b/cpus.c
@@ -1835,6 +1835,11 @@ void qemu_mutex_unlock_iothread(void)
     qemu_mutex_unlock(&qemu_global_mutex);
 }
 
+void qemu_cond_wait_iothread(QemuCond *cond)
+{
+    qemu_cond_wait(cond, &qemu_global_mutex);
+}
+
 static bool all_vcpus_paused(void)
 {
     CPUState *cpu;
diff --git a/include/qemu/main-loop.h b/include/qemu/main-loop.h
index f6ba78ea73..a6d20b0719 100644
--- a/include/qemu/main-loop.h
+++ b/include/qemu/main-loop.h
@@ -295,6 +295,14 @@ void qemu_mutex_lock_iothread_impl(const char *file, int line);
  */
 void qemu_mutex_unlock_iothread(void);
 
+/*
+ * qemu_cond_wait_iothread: Wait on condition for the main loop mutex
+ *
+ * This function atomically releases the main loop mutex and causes
+ * the calling thread to block on the condition.
+ */
+void qemu_cond_wait_iothread(QemuCond *cond);
+
 /* internal interfaces */
 
 void qemu_fd_register(int fd);
-- 
2.17.2


