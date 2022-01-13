Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 99ECF48DAA0
	for <lists+qemu-devel@lfdr.de>; Thu, 13 Jan 2022 16:22:05 +0100 (CET)
Received: from localhost ([::1]:38152 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n81vQ-0008CU-6Y
	for lists+qemu-devel@lfdr.de; Thu, 13 Jan 2022 10:22:04 -0500
Received: from eggs.gnu.org ([209.51.188.92]:52856)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1n81tF-0007Ba-EQ; Thu, 13 Jan 2022 10:19:49 -0500
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:32122
 helo=mx0a-001b2d01.pphosted.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1n81tD-0006hz-GH; Thu, 13 Jan 2022 10:19:49 -0500
Received: from pps.filterd (m0098414.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 20DDsSE7009333; 
 Thu, 13 Jan 2022 15:19:29 GMT
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com with ESMTP id 3djncbhvca-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 13 Jan 2022 15:19:29 +0000
Received: from m0098414.ppops.net (m0098414.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 20DEr4wF025735;
 Thu, 13 Jan 2022 15:19:28 GMT
Received: from ppma06fra.de.ibm.com (48.49.7a9f.ip4.static.sl-reverse.com
 [159.122.73.72])
 by mx0b-001b2d01.pphosted.com with ESMTP id 3djncbhvbu-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 13 Jan 2022 15:19:28 +0000
Received: from pps.filterd (ppma06fra.de.ibm.com [127.0.0.1])
 by ppma06fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 20DFE1e8031813;
 Thu, 13 Jan 2022 15:19:26 GMT
Received: from b06cxnps3074.portsmouth.uk.ibm.com
 (d06relay09.portsmouth.uk.ibm.com [9.149.109.194])
 by ppma06fra.de.ibm.com with ESMTP id 3df1vk3xmt-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 13 Jan 2022 15:19:26 +0000
Received: from d06av23.portsmouth.uk.ibm.com (d06av23.portsmouth.uk.ibm.com
 [9.149.105.59])
 by b06cxnps3074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 20DFJO9S44171666
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 13 Jan 2022 15:19:24 GMT
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 21489A4040;
 Thu, 13 Jan 2022 15:19:24 +0000 (GMT)
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id C2774A4057;
 Thu, 13 Jan 2022 15:19:23 +0000 (GMT)
Received: from smtp.tlslab.ibm.com (unknown [9.101.4.1])
 by d06av23.portsmouth.uk.ibm.com (Postfix) with SMTP;
 Thu, 13 Jan 2022 15:19:23 +0000 (GMT)
Received: from yukon.ibmuc.com (unknown [9.171.52.153])
 by smtp.tlslab.ibm.com (Postfix) with ESMTP id DAB8522018B;
 Thu, 13 Jan 2022 16:19:22 +0100 (CET)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: qemu-ppc@nongnu.org, qemu-devel@nongnu.org
Subject: [PATCH] ppc/ppc405: Fix TLB flushing
Date: Thu, 13 Jan 2022 16:19:19 +0100
Message-Id: <20220113151919.1193124-1-clg@kaod.org>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: aupJ72DlHWyb68jGMNJihEwUzwwJ4lSr
X-Proofpoint-GUID: B0Y2xzeFTwRwSngUQ8JjcVr1n-H1UJ8_
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.816,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2022-01-13_07,2022-01-13_01,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1034
 lowpriorityscore=0 suspectscore=0 impostorscore=0 spamscore=0
 priorityscore=1501 mlxlogscore=989 adultscore=0 mlxscore=0 phishscore=0
 bulkscore=0 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2110150000 definitions=main-2201130093
Received-SPF: softfail client-ip=148.163.158.5; envelope-from=clg@kaod.org;
 helo=mx0a-001b2d01.pphosted.com
X-Spam_score_int: -7
X-Spam_score: -0.8
X-Spam_bar: /
X-Spam_report: (-0.8 / 5.0 requ) BAYES_00=-1.9, KHOP_HELO_FCRDNS=0.398,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_SOFTFAIL=0.665 autolearn=no autolearn_force=no
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
Cc: Thomas Huth <thuth@redhat.com>, Fabiano Rosas <farosas@linux.ibm.com>,
 Greg Kurz <groug@kaod.org>, Christophe Leroy <christophe.leroy@csgroup.eu>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Commit cd0c6f473532 did not take into account 405 CPUs when adding
support to batching of TCG tlb flushes. Set the TLB_NEED_LOCAL_FLUSH
flags when the SPR_40x_PID is switched and when the TLB updated.

Cc: Thomas Huth <thuth@redhat.com>
Cc: Christophe Leroy <christophe.leroy@csgroup.eu>
Cc: Fabiano Rosas <farosas@linux.ibm.com>
Fixes: cd0c6f473532 ("ppc: Do some batching of TCG tlb flushes")
Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>
---
 target/ppc/mmu_helper.c | 2 ++
 1 file changed, 2 insertions(+)

    It's alive ! Thanks to all :)=20
   =20
    ...
    printk: console [ttyS0] enabled
    ef600300.serial: ttyS1 at MMIO 0xef600300 (irq =3D 17, base_baud =3D =
119047) is a 16550
    brd: module loaded
    libphy: Fixed MDIO Bus: probed
    e1000: Intel(R) PRO/1000 Network Driver
    e1000: Copyright (c) 1999-2006 Intel Corporation.
    e1000 0008:00:01.0: enabling device (0000 -> 0003)
    e1000 0008:00:01.0 eth0: (PCI:33MHz:32-bit) 52:54:00:12:34:56
    e1000 0008:00:01.0 eth0: Intel(R) PRO/1000 Network Connection
    drmem: No dynamic reconfiguration memory found
    Freeing unused kernel image (initmem) memory: 152K
    Kernel memory protection not selected by kernel config.
    Run /init as init process
    process '/bin/busybox' started with executable stack
    Starting syslogd: OK
    Starting klogd: OK
    Running sysctl: OK
    Saving random seed: random: dd: uninitialized urandom read (512 bytes=
 read)
    OK
    Starting network: e1000 0008:00:01.0 eth0: Unable to allocate interru=
pt Error: -22
    ip: SIOCSIFFLAGS: Invalid argument
    FAIL
   =20
    Welcome to Buildroot
    buildroot login: root
    Jan  1 00:00:18 login[123]: root login on 'ttyS0'
    # cat /proc/cpuinfo
    processor    : 0
    cpu        : 405EP
    clock        : 133.333333MHz
    revision    : 9.80 (pvr 5121 0950)
    bogomips    : 266.66
   =20
    timebase    : 133333333
    platform    : PowerPC 40x Platform
    model        : est,hotfoot
    Memory        : 128 MB
    # poweroff
    # Stopping network: ifdown: interface eth0 not configured
    OK
    Saving random seed: random: dd: uninitialized urandom read (512 bytes=
 read)
    OK
    Stopping klogd: OK
    Stopping syslogd: start-stop-daemon: warning: killing process 45: No =
such process
    FAIL
    umount: devtmpfs busy - remounted read-only
    umount: can't unmount /: Invalid argument
    The system is going down NOW!
    Sent SIGTERM to all processes
    Sent SIGKILL to all processes
    Requesting system poweroff
    reboot: System halted
    System Halted, OK to turn off power
    QEMU 6.2.50 monitor - type 'help' for more information


diff --git a/target/ppc/mmu_helper.c b/target/ppc/mmu_helper.c
index 59df6952aea1..ccca16979965 100644
--- a/target/ppc/mmu_helper.c
+++ b/target/ppc/mmu_helper.c
@@ -682,6 +682,7 @@ target_ulong helper_4xx_tlbre_hi(CPUPPCState *env, ta=
rget_ulong entry)
     }
     ret |=3D size << PPC4XX_TLBHI_SIZE_SHIFT;
     env->spr[SPR_40x_PID] =3D tlb->PID;
+    env->tlb_need_flush |=3D TLB_NEED_LOCAL_FLUSH;
     return ret;
 }
=20
@@ -794,6 +795,7 @@ void helper_4xx_tlbwe_lo(CPUPPCState *env, target_ulo=
ng entry,
                   tlb->prot & PAGE_WRITE ? 'w' : '-',
                   tlb->prot & PAGE_EXEC ? 'x' : '-',
                   tlb->prot & PAGE_VALID ? 'v' : '-', (int)tlb->PID);
+    env->tlb_need_flush |=3D TLB_NEED_LOCAL_FLUSH;
 }
=20
 target_ulong helper_4xx_tlbsx(CPUPPCState *env, target_ulong address)
--=20
2.31.1


