Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1553A32ABEA
	for <lists+qemu-devel@lfdr.de>; Tue,  2 Mar 2021 21:57:54 +0100 (CET)
Received: from localhost ([::1]:55216 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lHC5Z-0003GG-2A
	for lists+qemu-devel@lfdr.de; Tue, 02 Mar 2021 15:57:53 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:45714)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dovmurik@linux.vnet.ibm.com>)
 id 1lHBwd-0001PR-Gc
 for qemu-devel@nongnu.org; Tue, 02 Mar 2021 15:48:39 -0500
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:26874)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dovmurik@linux.vnet.ibm.com>)
 id 1lHBwb-00085S-LV
 for qemu-devel@nongnu.org; Tue, 02 Mar 2021 15:48:39 -0500
Received: from pps.filterd (m0098399.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 122KiGWq092485; Tue, 2 Mar 2021 15:48:32 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=eJlrr4xPmIrD8Ngtz0c25Al/mZy2bTrSq4zDBFrl0X8=;
 b=YNatZsDsrfjHGyS5kC+3JrRSys9uVxW4fvTzqADEg/7pnVQ3gjq1QCiPoQKH0w+yfCv6
 MgY7o8okAvw33igkhtRCPj88mdHcBnYf/R91CgGmLAmZUbyHKtNxbpCsqz+tiX6457u1
 ivZf3F0lt68as9inccIA1YangjBdiLUIlJaNuEobC/hA36RuvtuVYyoNliovExL/B6np
 7iqADbBS6bY8k0QTYPy181TKeTgvlimPEvdvmpr87uqftV9cj88B2ktOxeF1Ij60PV7O
 +ZH1vVEx1wAejwoCB5oBz1XRwnYaBzZKagL/+YGHH2QXRfx17gfebGXYlRQi3JPcbs/R iQ== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 371vnf0637-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 02 Mar 2021 15:48:31 -0500
Received: from m0098399.ppops.net (m0098399.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 122KiTIs100432;
 Tue, 2 Mar 2021 15:48:31 -0500
Received: from ppma04wdc.us.ibm.com (1a.90.2fa9.ip4.static.sl-reverse.com
 [169.47.144.26])
 by mx0a-001b2d01.pphosted.com with ESMTP id 371vnf0627-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 02 Mar 2021 15:48:30 -0500
Received: from pps.filterd (ppma04wdc.us.ibm.com [127.0.0.1])
 by ppma04wdc.us.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 122Km4K6009941;
 Tue, 2 Mar 2021 20:48:29 GMT
Received: from b01cxnp23033.gho.pok.ibm.com (b01cxnp23033.gho.pok.ibm.com
 [9.57.198.28]) by ppma04wdc.us.ibm.com with ESMTP id 3712phhu7u-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 02 Mar 2021 20:48:29 +0000
Received: from b01ledav001.gho.pok.ibm.com (b01ledav001.gho.pok.ibm.com
 [9.57.199.106])
 by b01cxnp23033.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 122KmTYu25690560
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 2 Mar 2021 20:48:29 GMT
Received: from b01ledav001.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id DC3BF28059;
 Tue,  2 Mar 2021 20:48:28 +0000 (GMT)
Received: from b01ledav001.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id B2FEB2805A;
 Tue,  2 Mar 2021 20:48:28 +0000 (GMT)
Received: from amdrome1.watson.ibm.com (unknown [9.2.130.16])
 by b01ledav001.gho.pok.ibm.com (Postfix) with ESMTP;
 Tue,  2 Mar 2021 20:48:28 +0000 (GMT)
From: Dov Murik <dovmurik@linux.vnet.ibm.com>
To: qemu-devel@nongnu.org
Subject: [RFC PATCH 03/26] machine: Add auxcpus=N suboption to -smp
Date: Tue,  2 Mar 2021 15:47:59 -0500
Message-Id: <20210302204822.81901-4-dovmurik@linux.vnet.ibm.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210302204822.81901-1-dovmurik@linux.vnet.ibm.com>
References: <20210302204822.81901-1-dovmurik@linux.vnet.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.369, 18.0.761
 definitions=2021-03-02_08:2021-03-01,
 2021-03-02 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1011 mlxlogscore=999
 malwarescore=0 impostorscore=0 phishscore=0 bulkscore=0 lowpriorityscore=0
 mlxscore=0 suspectscore=0 priorityscore=1501 spamscore=0 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2103020156
Received-SPF: none client-ip=148.163.156.1;
 envelope-from=dovmurik@linux.vnet.ibm.com; helo=mx0a-001b2d01.pphosted.com
X-Spam_score_int: -26
X-Spam_score: -2.7
X-Spam_bar: --
X-Spam_report: (-2.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_DNSWL_LOW=-0.7,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
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
Cc: Tom Lendacky <thomas.lendacky@amd.com>, Ashish Kalra <ashish.kalra@amd.com>,
 Brijesh Singh <brijesh.singh@amd.com>, Eduardo Habkost <ehabkost@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 James Bottomley <jejb@linux.ibm.com>, Jon Grimm <jon.grimm@amd.com>,
 Tobin Feldman-Fitzthum <tobin@ibm.com>,
 Dov Murik <dovmurik@linux.vnet.ibm.com>, Hubertus Franke <frankeh@us.ibm.com>,
 Tobin Feldman-Fitzthum <tobin@linux.ibm.com>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Add a notion of auxiliary vcpus to CpuTopology, which will allow to
designate a few vcpus (normally 1) to helper tasks not related to main
guest VM execution.

Example usage for starting a 4-vcpu guest, of which 1 vcpu is marked as
auxiliary:

    qemu-system-x86_64 -smp 4,auxcpus=1 ...

Signed-off-by: Dov Murik <dovmurik@linux.vnet.ibm.com>
---
 include/hw/boards.h | 1 +
 hw/core/machine.c   | 7 +++++++
 hw/i386/pc.c        | 7 +++++++
 softmmu/vl.c        | 3 +++
 4 files changed, 18 insertions(+)

diff --git a/include/hw/boards.h b/include/hw/boards.h
index a46dfe5d1a..7ee5c73510 100644
--- a/include/hw/boards.h
+++ b/include/hw/boards.h
@@ -246,6 +246,7 @@ typedef struct CpuTopology {
     unsigned int threads;
     unsigned int sockets;
     unsigned int max_cpus;
+    unsigned int aux_cpus;
 } CpuTopology;
 
 /**
diff --git a/hw/core/machine.c b/hw/core/machine.c
index 970046f438..08ea2cedea 100644
--- a/hw/core/machine.c
+++ b/hw/core/machine.c
@@ -722,6 +722,7 @@ static void smp_parse(MachineState *ms, QemuOpts *opts)
         unsigned sockets = qemu_opt_get_number(opts, "sockets", 0);
         unsigned cores   = qemu_opt_get_number(opts, "cores", 0);
         unsigned threads = qemu_opt_get_number(opts, "threads", 0);
+        unsigned aux_cpus = qemu_opt_get_number(opts, "auxcpus", 0);
 
         /* compute missing values, prefer sockets over cores over threads */
         if (cpus == 0 || sockets == 0) {
@@ -767,10 +768,16 @@ static void smp_parse(MachineState *ms, QemuOpts *opts)
             exit(1);
         }
 
+        if (aux_cpus >= ms->smp.max_cpus) {
+            error_report("auxcpus must be lower than max_cpus");
+            exit(1);
+        }
+
         ms->smp.cpus = cpus;
         ms->smp.cores = cores;
         ms->smp.threads = threads;
         ms->smp.sockets = sockets;
+        ms->smp.aux_cpus = aux_cpus;
     }
 
     if (ms->smp.cpus > 1) {
diff --git a/hw/i386/pc.c b/hw/i386/pc.c
index 8aa85dec54..95d3769842 100644
--- a/hw/i386/pc.c
+++ b/hw/i386/pc.c
@@ -718,6 +718,7 @@ void pc_smp_parse(MachineState *ms, QemuOpts *opts)
         unsigned dies = qemu_opt_get_number(opts, "dies", 1);
         unsigned cores   = qemu_opt_get_number(opts, "cores", 0);
         unsigned threads = qemu_opt_get_number(opts, "threads", 0);
+        unsigned aux_cpus = qemu_opt_get_number(opts, "auxcpus", 0);
 
         /* compute missing values, prefer sockets over cores over threads */
         if (cpus == 0 || sockets == 0) {
@@ -763,10 +764,16 @@ void pc_smp_parse(MachineState *ms, QemuOpts *opts)
             exit(1);
         }
 
+        if (aux_cpus >= ms->smp.max_cpus) {
+            error_report("auxcpus must be lower than max_cpus");
+            exit(1);
+        }
+
         ms->smp.cpus = cpus;
         ms->smp.cores = cores;
         ms->smp.threads = threads;
         ms->smp.sockets = sockets;
+        ms->smp.aux_cpus = aux_cpus;
         x86ms->smp_dies = dies;
     }
 
diff --git a/softmmu/vl.c b/softmmu/vl.c
index b219ce1f35..96f0ff8111 100644
--- a/softmmu/vl.c
+++ b/softmmu/vl.c
@@ -720,6 +720,9 @@ static QemuOptsList qemu_smp_opts = {
         }, {
             .name = "maxcpus",
             .type = QEMU_OPT_NUMBER,
+        }, {
+            .name = "auxcpus",
+            .type = QEMU_OPT_NUMBER,
         },
         { /*End of list */ }
     },
-- 
2.20.1


