Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C20073CEBA8
	for <lists+qemu-devel@lfdr.de>; Mon, 19 Jul 2021 22:07:07 +0200 (CEST)
Received: from localhost ([::1]:42206 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m5ZXe-0006XY-RU
	for lists+qemu-devel@lfdr.de; Mon, 19 Jul 2021 16:07:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47934)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jag.raman@oracle.com>)
 id 1m5ZRs-0006ox-TK
 for qemu-devel@nongnu.org; Mon, 19 Jul 2021 16:01:08 -0400
Received: from mx0a-00069f02.pphosted.com ([205.220.165.32]:34852)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jag.raman@oracle.com>)
 id 1m5ZRo-0005oT-Ij
 for qemu-devel@nongnu.org; Mon, 19 Jul 2021 16:01:08 -0400
Received: from pps.filterd (m0246629.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 16JJuV6m015851; Mon, 19 Jul 2021 20:01:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : content-type :
 mime-version; s=corp-2021-07-09;
 bh=XFuAWPBjq97Pne6SqCqr++S7U0umgtMzFkqVnkMAFsk=;
 b=NEi7fypqfOPjAnDfn50zsMOPBxruZ4+LpQpX8g3z7gy0R0FWOq/W4WFxbNCYo7JSdUG1
 RTgcw1Pr/e1P+2RhAwMexgouW/pgefCSkqccB4Vh9ErX1r3FJP5xCmBcQCuCye1nWD0u
 DDra2fhvskssPMAYVcmRiinm2aWsaQVkRtKQTpEZZSxizTb+etjuJE6vwX6lgBA2oeS6
 Bf6yUGF6R7PfTxDryU8xQrytZvevM8FLxzgBsI9zfROZ1pLyT5wi960a1Vn0GA8D0jVd
 TPW6K1XZ2QWG1ujMFA6gqi689upQWjycSx8CjwsNgPv4G0ZLZYqomao93GZOnf7VYbaD rg== 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : content-type :
 mime-version; s=corp-2020-01-29;
 bh=XFuAWPBjq97Pne6SqCqr++S7U0umgtMzFkqVnkMAFsk=;
 b=JKBBZipm2FcpUnh2QGix2fskvno/nlIm6brsmMPtKyHouezzLu+Ifu/RdUO+8nIehhBY
 wMsAJoRjwvsxZbFdu1Jb/R5lkBXuFErrZMFHdHBwl9kjeQCiOWfkV30rh2+bI3llALHJ
 7JPuuKypNuxkS5ZlHvAFyJaCovwAZmWhbNGZUu8ErQRryx6Uv3PkIEtRHH15F9lXGIOd
 +w0WYXlTGlKR5wo7XU8zWL/xUYMFVRiPu3LFC0v83qIpqNGiOPNRWeh86whVs/ahJHZO
 SL0hgsdIf71kF1OBdblXdrpZSxj/ddy0Ux6hkNhuw4rDUq4Y+ynH1zOsP/mqle/n9gmC jg== 
Received: from userp3020.oracle.com (userp3020.oracle.com [156.151.31.79])
 by mx0b-00069f02.pphosted.com with ESMTP id 39vqm9a99m-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 19 Jul 2021 20:01:00 +0000
Received: from pps.filterd (userp3020.oracle.com [127.0.0.1])
 by userp3020.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 16JK0Zpk127869;
 Mon, 19 Jul 2021 20:00:58 GMT
Received: from nam10-mw2-obe.outbound.protection.outlook.com
 (mail-mw2nam10lp2101.outbound.protection.outlook.com [104.47.55.101])
 by userp3020.oracle.com with ESMTP id 39v8ytbgn6-3
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 19 Jul 2021 20:00:58 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=K5jt+F/uOEygx/u2ABT7DlXHqBysBtnuqYeYlLQYGzkz3jc1ILceO6mFNGfDCJxpcQY1CFmaXbUjuCQEqkSeqgCqYzL3hlRqHJ7Or+RGDal7WDoIN4hI8GX69B643G3/yGNGM+dZw3ybsq4pIB36wZWifDEXW47mYY4LDmdoh+27gNRH1WJGCNF7Rx8uNfm4Ov2vbuD8s6TZwtz/Fls31Yb1vFhOU78bhkJwd4Mu529Q9kW41Iuofk78AK9xreZSPjCIeYMFqyOpbE+11Nc6+QAA1wVufOUjFYfyJuvWgXzlWtW34ltQlKpIZH786gxZOaVOK3lo3hEftKZ4lM8IQw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XFuAWPBjq97Pne6SqCqr++S7U0umgtMzFkqVnkMAFsk=;
 b=RlscfAYKxaI+HNgcS+kfQipG3LtJnSUqRoQY5zO6D9CHTMfalwj820xHDAWF8LY4FSLQx5bYEL4DUwJDfbELLAXzjWuuy7M1duc0ekXwrOpeN1nNhUr6HTUmVclYkl9JaaRSks266CHwNAKP7Jiasn7aKIZjyMX+1t0TaUKzCcsLuaJBh+i4/k1o2huoKtMqULMK30qp6ZdNWP3e4z3G3lCV0KXCfLDy3VgS4UCgAUJ3miPdpRycew15jOdv/IvRiz/Ut4oQzvP5QbO6E/NLqVfUamugMVujvwfmxPURO4Sp2elg36WvTq5vSnCUCutnnmANFjBbfYldsk8Fai0yqw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XFuAWPBjq97Pne6SqCqr++S7U0umgtMzFkqVnkMAFsk=;
 b=X2tAk5k0fOH27HMefLNwrgxAK+bekYCt3H1lJnfV3l8jG+tZKzr69f2Y2JCPdsXGm1rqR/msSLkt0ZWYB4vK4LBxmC7DCkLyirTaNwV2wr8GG6QzHjeTaVl8tY4ED+cWMsq2UGHZxj8OlDC5n+dKFmTXi62/nH97OlFFu/eyYb0=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=oracle.com;
Received: from MN2PR10MB4013.namprd10.prod.outlook.com (2603:10b6:208:185::25)
 by MN2PR10MB3792.namprd10.prod.outlook.com (2603:10b6:208:1bc::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4331.22; Mon, 19 Jul
 2021 20:00:24 +0000
Received: from MN2PR10MB4013.namprd10.prod.outlook.com
 ([fe80::e935:82a8:3c37:8aa4]) by MN2PR10MB4013.namprd10.prod.outlook.com
 ([fe80::e935:82a8:3c37:8aa4%4]) with mapi id 15.20.4331.033; Mon, 19 Jul 2021
 20:00:24 +0000
From: Jagannathan Raman <jag.raman@oracle.com>
To: qemu-devel@nongnu.org
Subject: [PATCH RFC server 05/11] vfio-user: run vfio-user context
Date: Mon, 19 Jul 2021 16:00:07 -0400
Message-Id: <9ea4e77a39aaff3dfac3e463d3de76b0e4e1844f.1626722742.git.jag.raman@oracle.com>
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
 15.20.4331.21 via Frontend Transport; Mon, 19 Jul 2021 20:00:23 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 892f5012-e415-4a49-8ab5-08d94aefd887
X-MS-TrafficTypeDiagnostic: MN2PR10MB3792:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <MN2PR10MB37924E030AA8EADDE04CC2E490E19@MN2PR10MB3792.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:962;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 1DsNK7nrb9/olG/nhnpJ9NiFdpQNnJjoGW7Y3Vn9KpNTgiPL2GYr/2O7KbeEn3b/Rn0JqLTK9BwKRO1t9R39KPvU4r2ZArnvPFWmLuxjb4wwfmzc8Dtq2g0ixdaDfLX3C0eQnK6Vw/TlPg+q5RX5jguB5NRYbqVSOn5PzdoN/QP+NxZB2PYVhRMgoG6Ceftk5LxTzcrAljAKKEbOLRdU0itvARp+4mISl8HpjdGtBXqORI95ixQE9Q0hx7tUJ++wR+vBUYpLxHiK25XtYv3mNTFmfL4f10j6n8aaOHOl2uYb50xCl3o3usto1eaVs85B+rShG5dYKaQZYvcOSbxs9JPzQSFeFyUsTSxOetZeH+R2cJmvq40kEPBGepzJIShdesHqTcGRdixkNr0vKw3u5rx78kl9iy2++gktQ4I9oMTKGTOATtM4PevB2LNpRK7vz43lgNNiCpBxF6PDid7sUC4mlT8zX7Xo9jGp4O8FbsJhQVvEpclI3HdY4qZ2XR44aM4eWCTYp0duIagaHfC/3E55ZThRqyGzIFFmKE1keAHwUCt0o5FqWL+zXsCn2mynFAGlhxesKh/yJ0o0SUaGWnhWF8W9xXPcEZJNPydGf/zXBnoA/ndSBQZeWGkmzxpytvaP0Ys2eMScJgGbzxK7DUO/rPgSQ5O9a7cVaa4v4tYDxbf3DqD22OerRfJoTeVWsGMxiVLGFuhO/tZtN/wmHg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR10MB4013.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(376002)(39860400002)(366004)(346002)(396003)(136003)(107886003)(8676002)(478600001)(36756003)(6666004)(8936002)(66946007)(86362001)(4326008)(6486002)(186003)(316002)(2906002)(5660300002)(52116002)(6916009)(7696005)(38100700002)(38350700002)(26005)(66556008)(66476007)(2616005)(956004);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 7ND1694bkqS9LUEgWk8xNRX7ifqNvOywWbyoiKTvq+ziGxLxTeqWeX0pACNIEPgdP/QDGTZQc1Uv/5vXrhKAISTWnDfdxFdJi5aYRCQWOSGHPFKRTZU5B3AEYgg7myslj2kFNULDLVVEy7dLtMdzu0nLKjhKtdeko76RKcTaAfibqwx6xg94j3k2rZBvemU8Sk3M1W+mkVr3ZKIeuDkGITE4UgFHH5d7iV68YJgj957bcMZvICMqdbfHhnNl6W4461FGA0TquV+YI6bLVtHV7eHk3W2biu57QTl1B/6H5UlvP/2ieLR/Q1/s9MoEYGqYpsPiTZjJyZE2GUmC5AtEsaPVfzj1I9BoAwcqoe/ZmGBaG8IoifSkRvGQ1AY6Gvjs1kkjo1TFy2r7UU0aPttcQ5bw7Hsv0/ZZjKjwmUNgmJCF/x00DnjkeIsVf/34wZNjbbptZrTOrzkN0MwtTAJKSCAoN+tWtyqJYWse+P4YmVZrsEsG0zTA6SsfWMrfN0L5/YNd2m+LOyx/DcvB1YF+/aZt6+Z/+YjmynyALAbnU0mIji6RMimXLBet1JGur70J9CEG6BP9mWlR5WDNc0s1VZ8OqqTVMr4oe+fdJ0bP2mbE9SSmZMkik8uM7PEUvCHo0sXe5W+1ptQtWb3ccz4pJnYqADDQHlisrNz5oAc1kjwyneSLtlk0l7jPnjNDAiRDBuzWm8jGLt9F+2A8G0Owu+19Nj0DOHwD/5xF0gwMniXdMk7yo44IdFzZQLR5+FgB
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 892f5012-e415-4a49-8ab5-08d94aefd887
X-MS-Exchange-CrossTenant-AuthSource: MN2PR10MB4013.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jul 2021 20:00:24.1685 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: etHEvzsTbCYGpTPZbjXjpaALhYCSa25UfIJuSchi/FVBUGcUGLpqeookjERto3zhiL/jnEKFMCpqgkC06cMQNQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR10MB3792
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=10050
 signatures=668682
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0
 mlxscore=0 malwarescore=0
 adultscore=0 phishscore=0 suspectscore=0 mlxlogscore=999 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2104190000
 definitions=main-2107190113
X-Proofpoint-GUID: vyi-30tiir--e90nFLnCYSBJvF0W1kdQ
X-Proofpoint-ORIG-GUID: vyi-30tiir--e90nFLnCYSBJvF0W1kdQ
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

Setup a separate thread to run the vfio-user context. The thread acts as
the main loop for the device.

Signed-off-by: Elena Ufimtseva <elena.ufimtseva@oracle.com>
Signed-off-by: John G Johnson <john.g.johnson@oracle.com>
Signed-off-by: Jagannathan Raman <jag.raman@oracle.com>
---
 hw/remote/vfio-user-obj.c | 44 ++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 44 insertions(+)

diff --git a/hw/remote/vfio-user-obj.c b/hw/remote/vfio-user-obj.c
index e362709..6a2d0f5 100644
--- a/hw/remote/vfio-user-obj.c
+++ b/hw/remote/vfio-user-obj.c
@@ -35,6 +35,7 @@
 #include "trace.h"
 #include "sysemu/runstate.h"
 #include "qemu/notify.h"
+#include "qemu/thread.h"
 #include "qapi/error.h"
 #include "sysemu/sysemu.h"
 #include "hw/qdev-core.h"
@@ -66,6 +67,8 @@ struct VfuObject {
     vfu_ctx_t *vfu_ctx;
 
     PCIDevice *pci_dev;
+
+    QemuThread vfu_ctx_thread;
 };
 
 static void vfu_object_set_socket(Object *obj, const char *str, Error **errp)
@@ -90,6 +93,44 @@ static void vfu_object_set_devid(Object *obj, const char *str, Error **errp)
     trace_vfu_prop("devid", str);
 }
 
+static void *vfu_object_ctx_run(void *opaque)
+{
+    VfuObject *o = opaque;
+    int ret;
+
+    ret = vfu_realize_ctx(o->vfu_ctx);
+    if (ret < 0) {
+        error_setg(&error_abort, "vfu: Failed to realize device %s- %s",
+                   o->devid, strerror(errno));
+        return NULL;
+    }
+
+    ret = vfu_attach_ctx(o->vfu_ctx);
+    if (ret < 0) {
+        error_setg(&error_abort,
+                   "vfu: Failed to attach device %s to context - %s",
+                   o->devid, strerror(errno));
+        return NULL;
+    }
+
+    do {
+        ret = vfu_run_ctx(o->vfu_ctx);
+        if (ret < 0) {
+            if (errno == EINTR) {
+                ret = 0;
+            } else if (errno == ENOTCONN) {
+                object_unparent(OBJECT(o));
+                break;
+            } else {
+                error_setg(&error_abort, "vfu: Failed to run device %s - %s",
+                           o->devid, strerror(errno));
+            }
+        }
+    } while (ret == 0);
+
+    return NULL;
+}
+
 static void vfu_object_machine_done(Notifier *notifier, void *data)
 {
     VfuObject *o = container_of(notifier, VfuObject, machine_done);
@@ -125,6 +166,9 @@ static void vfu_object_machine_done(Notifier *notifier, void *data)
                    pci_get_word(o->pci_dev->config + PCI_DEVICE_ID),
                    pci_get_word(o->pci_dev->config + PCI_SUBSYSTEM_VENDOR_ID),
                    pci_get_word(o->pci_dev->config + PCI_SUBSYSTEM_ID));
+
+    qemu_thread_create(&o->vfu_ctx_thread, "VFU ctx runner", vfu_object_ctx_run,
+                       o, QEMU_THREAD_JOINABLE);
 }
 
 static void vfu_object_init(Object *obj)
-- 
1.8.3.1


