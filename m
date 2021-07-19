Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BC59E3CEC04
	for <lists+qemu-devel@lfdr.de>; Mon, 19 Jul 2021 22:09:24 +0200 (CEST)
Received: from localhost ([::1]:48316 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m5ZZr-0002Rz-Or
	for lists+qemu-devel@lfdr.de; Mon, 19 Jul 2021 16:09:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47688)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jag.raman@oracle.com>)
 id 1m5ZRO-0005rg-UR
 for qemu-devel@nongnu.org; Mon, 19 Jul 2021 16:00:40 -0400
Received: from mx0a-00069f02.pphosted.com ([205.220.165.32]:25602)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jag.raman@oracle.com>)
 id 1m5ZRL-0005RT-Qj
 for qemu-devel@nongnu.org; Mon, 19 Jul 2021 16:00:38 -0400
Received: from pps.filterd (m0246627.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 16JJuc52002487; Mon, 19 Jul 2021 20:00:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : content-type :
 mime-version; s=corp-2021-07-09;
 bh=qQj4Bq9NpnX0KNnVOcQuojQUPtcfwYcVGA2xcMzVhgA=;
 b=NBK0YNnKhZltA4zdDVLLwRk7ROdFOUMXWHvU3at6EqI/bbvN5wU3qcXdrBv4JyV3jKn0
 4uoRdXP4SLXshFUXfhZn+ZHwDA3U/HQn8xMrBvfpeG1tqx8Cs+Raai+x78e7BxAAqsjV
 tOyChtlhJ5akhGvQQCibRzAzZ+kuEL1dwMxVXjDXetyMbiO8dh2TrUPbeDXYRsVd/jHw
 RimuKSNUF5f53tk59672IIOmh6hpn0q4AVycfo9AxoYhQ5W5cZC1O3PKT6nlMbDfU7lJ
 zh5OPas6QFxw0dHLyfFZobXVV5N8liGik26erNnTK78c0yYi0ZdOMJ2uZYVTF8oRCAlu Ew== 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : content-type :
 mime-version; s=corp-2020-01-29;
 bh=qQj4Bq9NpnX0KNnVOcQuojQUPtcfwYcVGA2xcMzVhgA=;
 b=pQfS/ywts5YlO5KstAREDAAh0qsPEUzpKl6UWtJbMMOkgVkkC38HODeUxDKHzQb0JwCi
 ls5RgfgMoYLFm9Izs3EGncwiiKhKFYfyNtjFVeXZatQFKRpP5RiUcOk9Pkl00lgmwYEq
 YDSLw/a/hkknNVBvyLWTIjr2/jEox1fkb8L7nUCeeEGDEotJ/9afE7JZPj2rR822icQ9
 ccz7CubBbLP3PbsX8c8J8BOmtuVdwbsSmrkPwmWExwJzqYENunPKf5KD0Wvyp013+7IX
 P1/9iy4vr76J0gTNqWopSWk25heCGBWiFo75050YmIWzUTojwBwh+CwY4wOouSoCXu9k ZQ== 
Received: from aserp3020.oracle.com (aserp3020.oracle.com [141.146.126.70])
 by mx0b-00069f02.pphosted.com with ESMTP id 39vrn5j9xs-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 19 Jul 2021 20:00:32 +0000
Received: from pps.filterd (aserp3020.oracle.com [127.0.0.1])
 by aserp3020.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 16JJf5It033120;
 Mon, 19 Jul 2021 20:00:31 GMT
Received: from nam10-mw2-obe.outbound.protection.outlook.com
 (mail-mw2nam10lp2103.outbound.protection.outlook.com [104.47.55.103])
 by aserp3020.oracle.com with ESMTP id 39uq15b6up-3
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 19 Jul 2021 20:00:31 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NF6ZCIwPWjeTQIGmys0zHridWIH5nRmfjXVdbpYUwQBX49gKfqRXkWZuBt5h61GJgBzuD1m0ZyUTgN/72Hn0Xw9bS6QkQ/xe97+A2z5GCdm4af6WFouQYQan4j79QgH4shWjrYnHaCllJoLTsi7zsu8uJYaNGM1bpXjzFGAHPY/SKRQFjXGcKPYN0saPrlFCeomvO8qKITBXYcVh6y615tYBK3w3BghSHW6OujY7RM76eHiUC/NOW7GYOsheNAIKbyxcxqio/yR+cRRlLAZNNXIasbVqATomAkn/1foGD1XSLzSi2A8qHcCK4QJiT0VE9jQM7ulMkpHuKuU6duw+cA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qQj4Bq9NpnX0KNnVOcQuojQUPtcfwYcVGA2xcMzVhgA=;
 b=Dblc1/R3vB3HD2S6iYItkNenP+nOC2f7fyN7UZ0/lT2w8v7kQaiqGP435nF3wng1VLa+bYiE0ov/8tENKo4USXlyNddFMvGSs2KpDXAHWlJOfm1z9juXnpSCBaWzasPBr/vdhYnzB5sDSJumd5S1PYknHCMqEcTnyFS3RQi9NRjTn0CXyXPveVD8QJiXCml+7bB0umUjSq/L6j/o7eujqgCQuup6+JqSfSx8ug0jGXI5az8Qmf+whkmydJ3KbP0ceu084KgHl1Ig3ddvhZcvmhRL3gpvOSKIV0d0EvSlgcNzt+/KqCM5i/NbJekgE9efaCowYkFM37+AvkkNAiup7g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qQj4Bq9NpnX0KNnVOcQuojQUPtcfwYcVGA2xcMzVhgA=;
 b=SznNEG/r+7pU1laZJkzJrKZg07tn1vmKte1PaDQyMMXP4eycfGwOFlvywPTtSC4izRsxboPbpuzbGtrfL4gO8Xt15JbbM8Q53RumZiwpcUCPR8NMZlZKJMb+OpEnwbMwptzP6ijLOD75tcbRH+o3qNLHeXkeQz34Li0gXZgTG6w=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=oracle.com;
Received: from MN2PR10MB4013.namprd10.prod.outlook.com (2603:10b6:208:185::25)
 by MN2PR10MB3853.namprd10.prod.outlook.com (2603:10b6:208:180::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4331.26; Mon, 19 Jul
 2021 20:00:29 +0000
Received: from MN2PR10MB4013.namprd10.prod.outlook.com
 ([fe80::e935:82a8:3c37:8aa4]) by MN2PR10MB4013.namprd10.prod.outlook.com
 ([fe80::e935:82a8:3c37:8aa4%4]) with mapi id 15.20.4331.033; Mon, 19 Jul 2021
 20:00:29 +0000
From: Jagannathan Raman <jag.raman@oracle.com>
To: qemu-devel@nongnu.org
Subject: [PATCH RFC server 09/11] vfio-user: handle device interrupts
Date: Mon, 19 Jul 2021 16:00:11 -0400
Message-Id: <8da299d8adc92a9f6bba76931db90c286cfe920d.1626722742.git.jag.raman@oracle.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <cover.1626722742.git.jag.raman@oracle.com>
References: <cover.1626675354.git.elena.ufimtseva@oracle.com>
 <cover.1626722742.git.jag.raman@oracle.com>
Content-Type: text/plain
X-ClientProxiedBy: SA0PR11CA0040.namprd11.prod.outlook.com
 (2603:10b6:806:d0::15) To MN2PR10MB4013.namprd10.prod.outlook.com
 (2603:10b6:208:185::25)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from jaraman-bur-1.us.oracle.com (209.17.40.44) by
 SA0PR11CA0040.namprd11.prod.outlook.com (2603:10b6:806:d0::15) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4331.21 via Frontend Transport; Mon, 19 Jul 2021 20:00:28 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 7cd4c57d-0f14-47d7-447a-08d94aefdba5
X-MS-TrafficTypeDiagnostic: MN2PR10MB3853:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <MN2PR10MB38536AFBA016E0BE609DB28F90E19@MN2PR10MB3853.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:462;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: zRdZjxSmMW6FS5+N/vNVkd+nj3RRcz3SyRy/XdzjvAVLDprGWJQugeWXIRi8zZdE5N7z0MpdeXdIBS+ubIEwTt9vFD2kxS8NY46PIjgihJqtwucNS7tE/fUNegaG/loym2kcmbTjEz9J6e6n8RFMezON6rPtedssgPYiHoxnlsN+sGw/NoG6aypMkRYHxiPmdatRFC9C3TLAf0jnvywcu94aWs557k0sLHcTo3UCtKe4hxuzGo6wYPzKGHLIoDSsfN2Aj7I8wcrUZPk90CpBpv0KSCoQzC4UOeBmVqFy8uq0/VJC3JsiE6kBniWiigH+F6Vd1gerxxbDc/CVGAWDANxYgB0mKB0HE3aQYfdOOdmYBe6Q6tppo12XSUU4qYD2tNPWwmx38j3/FNOFXxnXMmBcRrvIuKkeE13XM3Iah/cWWDT4auXRYzqAeXNzpSzilzXHjO8aHdyovolRqt4bJMFeYzS4UYquiX5u85zspHK960vS3nJGwnl/dyPlR9mKRSsiDo/3jm/skYX8B/1Z2a3oq8OBQEHPeN3Z2gERfw6n7cWwcSbkgwre9i3j5LShq88RQefOc4ChO0pyxe+nKTD5sIEgnMhxy+3GA3Uklchh54/ts2wLOIOMgU+2bF4QmblCt/M0Ql60d/tCwTMkWWefvb2ibwWzTyta5pXroi8bwcbL5BwyHS3+xcHqJCyiPVRtGpcNFj+s5BzbuCHESA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR10MB4013.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(316002)(5660300002)(956004)(2616005)(107886003)(7696005)(26005)(6666004)(508600001)(38350700002)(38100700002)(52116002)(36756003)(86362001)(186003)(6486002)(4326008)(66556008)(66476007)(6916009)(66946007)(83380400001)(8676002)(2906002)(8936002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: zNeVwvj9S/2RoVHTx2O8uoOOc2aG9SjWEBG1MExvTNFN9mQ9SDCSbQRsl2JKpyqtP/8DqTv/FeclMuwOuvHHTiDu7R6GrGMzX8jmKXTuXRCayyaYN2Pi+rpwR2yMtEDzxVwjK7BJlq3NMBcJD/IunF51vsVKw1amQGL9O6re/vpGQSAB9d28TuzXC2XwZMClm46KH5o4JttYg4VV/T/tGWTj32Zv1JFikbKVXi86uTg1Ld+5K4K8SHr4EgGCh+SNHUgiNTyFT/s3bGJWsnsgoSdkpdA73Uc+fGFW/NTwqBxdxiO5dVQfYMbkDyN+yPmHmNSns4q/95Ut9jxzFWzfIs1ecCwuLSoiiNr9h3AkNebmPRqXgzzMayWderg9w+vIn03phFiKovKxZ0arKHAd0nYxtgeBgwEu5Z8Hq+xnZx2cxaJs79kOp8t7TlK7DjEtw+InwwB1/lRCdGNZ2DqpujRUmDy1rxvAIKaP+r4al5+uB5n1QUpz2uNTyqPJmM0A7OobvYGVIGqs/tb6bdZM0q+gVp57zKTYySKOwQswhMSA7y95OR/rRK7CuEQBeHj7myCB5E2cJwwr65Y3I2bsNTeYx+we7kQm5BZRkIUU76Ep1fU77p8ml4GpZjPWkPmjjnsHFwRqxss/X+cBTTK92n7zsTUNbR+kHSenlEOPQptsGAp8AZHcYJpEorjFWvg+gZ6/Xff0fV9nmmleW6SGAUF5+pfhf5JIKMfpToqTjgalkqt+v9G7ZNLEiwbO7Akg
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7cd4c57d-0f14-47d7-447a-08d94aefdba5
X-MS-Exchange-CrossTenant-AuthSource: MN2PR10MB4013.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jul 2021 20:00:29.4255 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Dq3C1bdHPU1pX+15DdagX/exErS3vLIkUX/k/1xNtj2unYtGGtgCTO+iIohzvB/Xsd+ybjqtFD9hmBwus9KhDw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR10MB3853
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=10050
 signatures=668682
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0
 malwarescore=0
 mlxlogscore=999 suspectscore=0 bulkscore=0 spamscore=0 phishscore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2104190000 definitions=main-2107190112
X-Proofpoint-GUID: YI2mpn6o-4iLRjh2vxIWhGIipXS0GZY8
X-Proofpoint-ORIG-GUID: YI2mpn6o-4iLRjh2vxIWhGIipXS0GZY8
Received-SPF: pass client-ip=205.220.165.32; envelope-from=jag.raman@oracle.com;
 helo=mx0a-00069f02.pphosted.com
X-Spam_score_int: -8
X-Spam_score: -0.9
X-Spam_bar: /
X-Spam_report: (-0.9 / 5.0 requ) DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, MSGID_FROM_MTA_HEADER=0.001,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: elena.ufimtseva@oracle.com, john.g.johnson@oracle.com, jag.raman@oracle.com,
 swapnil.ingle@nutanix.com, john.levon@nutanix.com, alex.williamson@redhat.com,
 stefanha@redhat.com, thanos.makatos@nutanix.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Forward remote device's interrupts to the guest

Signed-off-by: Elena Ufimtseva <elena.ufimtseva@oracle.com>
Signed-off-by: John G Johnson <john.g.johnson@oracle.com>
Signed-off-by: Jagannathan Raman <jag.raman@oracle.com>
---
 include/hw/remote/iohub.h |  2 ++
 hw/remote/iohub.c         |  6 ++++++
 hw/remote/vfio-user-obj.c | 30 ++++++++++++++++++++++++++++++
 hw/remote/trace-events    |  1 +
 4 files changed, 39 insertions(+)

diff --git a/include/hw/remote/iohub.h b/include/hw/remote/iohub.h
index 0bf98e0..132f496 100644
--- a/include/hw/remote/iohub.h
+++ b/include/hw/remote/iohub.h
@@ -15,6 +15,7 @@
 #include "qemu/event_notifier.h"
 #include "qemu/thread-posix.h"
 #include "hw/remote/mpqemu-link.h"
+#include "libvfio-user/include/libvfio-user.h"
 
 #define REMOTE_IOHUB_NB_PIRQS    PCI_DEVFN_MAX
 
@@ -30,6 +31,7 @@ typedef struct RemoteIOHubState {
     unsigned int irq_level[REMOTE_IOHUB_NB_PIRQS];
     ResampleToken token[REMOTE_IOHUB_NB_PIRQS];
     QemuMutex irq_level_lock[REMOTE_IOHUB_NB_PIRQS];
+    vfu_ctx_t *vfu_ctx[REMOTE_IOHUB_NB_PIRQS];
 } RemoteIOHubState;
 
 int remote_iohub_map_irq(PCIDevice *pci_dev, int intx);
diff --git a/hw/remote/iohub.c b/hw/remote/iohub.c
index 547d597..241c8d7 100644
--- a/hw/remote/iohub.c
+++ b/hw/remote/iohub.c
@@ -18,6 +18,8 @@
 #include "hw/remote/machine.h"
 #include "hw/remote/iohub.h"
 #include "qemu/main-loop.h"
+#include "libvfio-user/include/libvfio-user.h"
+#include "trace.h"
 
 void remote_iohub_init(RemoteIOHubState *iohub)
 {
@@ -62,6 +64,10 @@ void remote_iohub_set_irq(void *opaque, int pirq, int level)
     QEMU_LOCK_GUARD(&iohub->irq_level_lock[pirq]);
 
     if (level) {
+        if (iohub->vfu_ctx[pirq]) {
+            trace_vfu_interrupt(pirq);
+            vfu_irq_trigger(iohub->vfu_ctx[pirq], 0);
+        }
         if (++iohub->irq_level[pirq] == 1) {
             event_notifier_set(&iohub->irqfds[pirq]);
         }
diff --git a/hw/remote/vfio-user-obj.c b/hw/remote/vfio-user-obj.c
index 9853feb..d2a2e51 100644
--- a/hw/remote/vfio-user-obj.c
+++ b/hw/remote/vfio-user-obj.c
@@ -41,6 +41,9 @@
 #include "sysemu/sysemu.h"
 #include "hw/qdev-core.h"
 #include "hw/pci/pci.h"
+#include "hw/boards.h"
+#include "hw/remote/iohub.h"
+#include "hw/remote/machine.h"
 
 #include "libvfio-user/include/libvfio-user.h"
 
@@ -305,6 +308,26 @@ static void vfu_object_register_bars(vfu_ctx_t *vfu_ctx, PCIDevice *pdev)
     }
 }
 
+static int vfu_object_setup_irqs(vfu_ctx_t *vfu_ctx, PCIDevice *pci_dev)
+{
+    RemoteMachineState *machine = REMOTE_MACHINE(current_machine);
+    RemoteIOHubState *iohub = &machine->iohub;
+    int pirq, intx, ret;
+
+    ret = vfu_setup_device_nr_irqs(vfu_ctx, VFU_DEV_INTX_IRQ, 1);
+    if (ret < 0) {
+        return ret;
+    }
+
+    intx = pci_get_byte(pci_dev->config + PCI_INTERRUPT_PIN) - 1;
+
+    pirq = remote_iohub_map_irq(pci_dev, intx);
+
+    iohub->vfu_ctx[pirq] = vfu_ctx;
+
+    return 0;
+}
+
 static void vfu_object_machine_done(Notifier *notifier, void *data)
 {
     VfuObject *o = container_of(notifier, VfuObject, machine_done);
@@ -361,6 +384,13 @@ static void vfu_object_machine_done(Notifier *notifier, void *data)
 
     vfu_object_register_bars(o->vfu_ctx, o->pci_dev);
 
+    ret = vfu_object_setup_irqs(o->vfu_ctx, o->pci_dev);
+    if (ret < 0) {
+        error_setg(&error_abort, "vfu: Failed to setup interrupts for %s",
+                   o->devid);
+        return;
+    }
+
     qemu_thread_create(&o->vfu_ctx_thread, "VFU ctx runner", vfu_object_ctx_run,
                        o, QEMU_THREAD_JOINABLE);
 }
diff --git a/hw/remote/trace-events b/hw/remote/trace-events
index f3f65e2..b419d6f 100644
--- a/hw/remote/trace-events
+++ b/hw/remote/trace-events
@@ -11,3 +11,4 @@ vfu_dma_register(uint64_t gpa, size_t len) "vfu: registering GPA 0x%"PRIx64", %z
 vfu_dma_unregister(uint64_t gpa) "vfu: unregistering GPA 0x%"PRIx64""
 vfu_bar_rw_enter(const char *op, uint64_t addr) "vfu: %s request for BAR address 0x%"PRIx64""
 vfu_bar_rw_exit(const char *op, uint64_t addr) "vfu: Finished %s of BAR address 0x%"PRIx64""
+vfu_interrupt(int pirq) "vfu: sending interrupt to device - PIRQ %d"
-- 
1.8.3.1


