Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B8BB53CEB93
	for <lists+qemu-devel@lfdr.de>; Mon, 19 Jul 2021 22:04:36 +0200 (CEST)
Received: from localhost ([::1]:38382 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m5ZVD-00041X-OL
	for lists+qemu-devel@lfdr.de; Mon, 19 Jul 2021 16:04:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47932)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jag.raman@oracle.com>)
 id 1m5ZRs-0006of-PL
 for qemu-devel@nongnu.org; Mon, 19 Jul 2021 16:01:08 -0400
Received: from mx0a-00069f02.pphosted.com ([205.220.165.32]:35634)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jag.raman@oracle.com>)
 id 1m5ZRo-0005on-TY
 for qemu-devel@nongnu.org; Mon, 19 Jul 2021 16:01:08 -0400
Received: from pps.filterd (m0246617.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 16JJuFaE017810; Mon, 19 Jul 2021 20:01:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : content-type :
 mime-version; s=corp-2021-07-09;
 bh=buKXsZW1r1dXgNaXcJjUYsRNDpxKV1+CO7ZYDS7h1+E=;
 b=z2InRpSX5iGNCBFNS18odWQCRMt332d/ms7QafPhvLf2TFvY8GKlhiAIo9HJn6OuXX/z
 ZWSFBpM6ndE+19y+K+8X5BYwtXq7Q0CiNQHk7lFtEL39NySjupsf5aTAmiplRs0H5qnq
 l/Cx5fT8dLDUd4r8N8Aq6CpW3Wix9MBkXxC+uXzVLbgqZDJb3PcvWY4tkq2ZXsmsVK9T
 Cn5u85DCv91UH1XJ3AAvDi3cCKv513gouIJGPlDE3m25Nd5HdTplatOQsEpwE3Ya7jJi
 V5ImFtdbo6pLobP1MJMVQlxRIheg6sZXdka863MomS2l/pf5cMhD6Mpq+NynEgrWABls 8w== 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : content-type :
 mime-version; s=corp-2020-01-29;
 bh=buKXsZW1r1dXgNaXcJjUYsRNDpxKV1+CO7ZYDS7h1+E=;
 b=n0l4Y5VCGmMMhtD7War0U00cC83rffXI9LWlHUXzbBfNWdS9qBwOUpTtqJB/7kR6iApY
 dpEWiR7/MOc6wOtFAnwYqo5R5KpbCuKWTJ7er7zdV2nx/hs0zInvEAPwkj8GgwmFiBdc
 2jiz7zdunhDpptMD3ID+MlOQoZv5N8QdzSsEWGR0PJJwJgSPYpa3F0JwjfzuK4bDYnqh
 xYHnDLbAJLqmmn2xM4O+qUB0RjJG6kh6AmmJvKQe8tDaUDavV+7VqQ3bKFzEzxrqSOBk
 IwXJPsKB8KRmSdKjBxGV1PVPB8yYcbhZlxQiz6uH7I0QmzA/a2avKVWWooOliUWs4qo8 Sw== 
Received: from userp3020.oracle.com (userp3020.oracle.com [156.151.31.79])
 by mx0b-00069f02.pphosted.com with ESMTP id 39w9hfs0e2-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 19 Jul 2021 20:01:03 +0000
Received: from pps.filterd (userp3020.oracle.com [127.0.0.1])
 by userp3020.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 16JK0Zpo127869;
 Mon, 19 Jul 2021 20:01:01 GMT
Received: from nam10-mw2-obe.outbound.protection.outlook.com
 (mail-mw2nam10lp2101.outbound.protection.outlook.com [104.47.55.101])
 by userp3020.oracle.com with ESMTP id 39v8ytbgn6-4
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 19 Jul 2021 20:01:01 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LsuSaoT2bQCX9MTFx5TUYxI1R8288RKgNQXvcSBUfAs5hn0nqhcAeFT1Mx+iTQyu9tbncLza+MYFQLQz+1gc1/9IzNpu0XnPCYJF6osDmYtaBIpeAK6hfbbuoME2b81cabXxiHjqzd9Cp5b2hCQNkiBGtjLTT5Kq6wUdkaL7Aj75CCwclmVzoFC8kL2Gk8tVCnWedREA7WGXLBVe/KKVoeP4/FMp+GV6jINK5yQIt/fiPo6XBvPIbH75Lz5UMvGDcLAqkJ6cRODEmcg48kk66eXdrx+D4MY6KfRuQQmHsSBmq7xjIliQi2DYKpY6BXAD7VORYAFwBuWl6Bc/Slo6qw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=buKXsZW1r1dXgNaXcJjUYsRNDpxKV1+CO7ZYDS7h1+E=;
 b=gt77cTTIiGpLZ5vyNncYq+ExAwfZhw2k9TaPcXZacXsgTOfVSvcwnSEItNcox5qdVG8KxVThV/cGKBJwfZFxgeb6rmyAXYfYotFWUXGf9mhoSgcv+Axxz8fj5K4kfrQ5uXXJCUX50ioOTkqlwItl1ZYgE9dI9RZIxseJ9DhDYYVotpeg7n48Z1W1XAwrBxMcTxJ8EZaCLU5hkZSDsc7HOeU0LzXBzsMA7pqOnEw7kr7mV0Od+xY9mA+AkyDlh3ZK2IMzPcA3rrgEjtmXaDWILC0bc0dkAZD2x9Vd5vGXDbGhuPSvD7AgHktRo4OP857ix1dkw7n2crXvZ0WPOXDPxg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=buKXsZW1r1dXgNaXcJjUYsRNDpxKV1+CO7ZYDS7h1+E=;
 b=ESJe1alE4SmndQiaGlWx6/BVhiIhND5hrrb/muEUVMQ64XwO1gS/qu8jxWVOdUu7l942wOUmJgcU7cyvJ86Q9PsoWMSp9nI0HyrQvnnoFXrSF9mBBVS1/hL+2/fiikG++8HRq9In6qiQ57UzhKTXlTHTFkrcvKNkxTQ0GOMt6Q4=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=oracle.com;
Received: from MN2PR10MB4013.namprd10.prod.outlook.com (2603:10b6:208:185::25)
 by MN2PR10MB3792.namprd10.prod.outlook.com (2603:10b6:208:1bc::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4331.22; Mon, 19 Jul
 2021 20:00:25 +0000
Received: from MN2PR10MB4013.namprd10.prod.outlook.com
 ([fe80::e935:82a8:3c37:8aa4]) by MN2PR10MB4013.namprd10.prod.outlook.com
 ([fe80::e935:82a8:3c37:8aa4%4]) with mapi id 15.20.4331.033; Mon, 19 Jul 2021
 20:00:25 +0000
From: Jagannathan Raman <jag.raman@oracle.com>
To: qemu-devel@nongnu.org
Subject: [PATCH RFC server 06/11] vfio-user: handle PCI config space accesses
Date: Mon, 19 Jul 2021 16:00:08 -0400
Message-Id: <791f5f9a010b14844e5210c4390c8628ffefb80d.1626722742.git.jag.raman@oracle.com>
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
 15.20.4331.21 via Frontend Transport; Mon, 19 Jul 2021 20:00:24 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 16ad9c22-8df1-468e-80fe-08d94aefd94b
X-MS-TrafficTypeDiagnostic: MN2PR10MB3792:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <MN2PR10MB3792111D572AE737EA02EC6690E19@MN2PR10MB3792.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:66;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 57POb5rLMcLrylcuG6a7EErXTnqkqI7whFOc3tiJYMn77DFKkgfg6uywgKTpOlk9jE2XSapRaRYirKol2yQTY9/NuyEt8O8EuV/hItrf8dzMir39MyLHAB28bwGtm4SVa15Q2aaqvkTAsyx78WwporRZx/UIz0GwDtF1C7dW+4cyzyZeWzWBabx6wKRvX8kDd1wN3n7o9RpYxYNeJpNaWOW3dGvUW3xPCzzP12TPq0Zd0sVpRM6yvKllb/LXKbZSXtECv8nrfZo3XFHZENy67Ejs2xNT4ADh+3bUZsaF8Pr8PfNy29Cf9QGsHJPa/RMBbzHV9H47DjQLnI2HhkDbopL+JvbomyGkM+0i6VkhXlyIRTwmvJ2XxwioOgKiLIwXTt7YHiWQLblJ4n6pctNhW2NaIppWlXhd0xvnXjDutr4nTFwlPs0Zxhu6RadnVeXxQ8TwSAc3XljgNzyjPSRa6B7MN/lXMVu5YJ07tTvUR69mg9QzbJ++1WMYQKcuFjQX5aHTcutmGOQxIMOHvUB007BV+PMJ3H+u2T7OmSo+KgP2LDn/W/YNZFWAbFjX29zM71pOZ2ntFg95T0KydQmDVD98EDVGz81U65UbSdMCCpcnzP/+NRrh7dyKeShWENXHskbgfcy5GJuIkgMyUK11nE5Yw2awq8jcLBXLo7Nrj21AhICMHwjE8ER7Vn4dkc+HKjswyBkkn9c0GwGQmFwxng==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR10MB4013.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(376002)(39860400002)(366004)(346002)(396003)(136003)(83380400001)(107886003)(8676002)(478600001)(36756003)(6666004)(8936002)(66946007)(86362001)(4326008)(6486002)(186003)(316002)(2906002)(5660300002)(52116002)(6916009)(7696005)(38100700002)(38350700002)(26005)(66556008)(66476007)(2616005)(956004);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: CNNaTZUfzU2nWfYRaal9eTYTB/scSCLZ7tIjTgX+fcMUY7HT5wkj/sHlr9oX9+37NC+hu0jFjZSyp7YjFox//v3NF9pQE+LKj19BiwITTKq72Fb8Mz4jME2VRgkWg+FsBVnXidFoey0Nb4j71Iag1WtHUQBo3Tj8nr9tJnVnWyUBNMH758esGAAD+MmeXRvmZF1BZcn3YjZV+d0uhZifR/rusdugF/3+5i55zH9zGCcJUbSivlnTDTo1HeBzBwg3ue3DmZTYyquY1lWbYaZJYYanD+BTjEEkQdAg7Zf2ou68efpSUMt3M9inmspe3XQ769FG2Iz9ya+N4LniBrOHefRMvdrq17rkuJngxP/18sr1spX/GxRAoYnY0Z2Avii4z2LN7SsEVtAppnFlDWE4VUIH/jzyx4bKuNfzoXMUdcyRkytZkNlP4wehBfWgMEIMouLO5dKZ32T9k0Sl9v0bIYkNbyAAcLH1ss2AIDAYWMI+BLkiu/7Sz7IsPmXMcMzDiZTNxmgbJq5YjjOxtluypv4Gl+kixtOF+ahdKxdhD9AT0r+q+NAXqWVAwCXV8GCcSU5rFovuRYzU0l/Nm2/MKzECjI78DyeeFR5bC2tOXXKe2F+Zy0qJiHRbeZXxKivyp3XsGlH1QxOgR3FqT3ZQKDRHQky1UVyY8N+vwdmZbMiUq2KIJyLKyDAlogh/OaXMKMEWIq3paLiOqPvu4pNrV+npSkVYSMJAOgok9ZYHn2YM3Go+ThcSdzLWx4LLitOW
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 16ad9c22-8df1-468e-80fe-08d94aefd94b
X-MS-Exchange-CrossTenant-AuthSource: MN2PR10MB4013.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jul 2021 20:00:25.4887 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: yi4T/9m0+5/cxTo8vmGCgXA7eVPasxZjdYbam26caQplDDYjvlrIN5MZgHO21u3g0naeV0EE4n+UUS9ke//dHw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR10MB3792
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=10050
 signatures=668682
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0
 mlxscore=0 malwarescore=0
 adultscore=0 phishscore=0 suspectscore=0 mlxlogscore=999 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2104190000
 definitions=main-2107190113
X-Proofpoint-GUID: 1IL7pzAVr9qCcCaYQ9J_wBOfJgtRA84v
X-Proofpoint-ORIG-GUID: 1IL7pzAVr9qCcCaYQ9J_wBOfJgtRA84v
Received-SPF: pass client-ip=205.220.165.32; envelope-from=jag.raman@oracle.com;
 helo=mx0a-00069f02.pphosted.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 MSGID_FROM_MTA_HEADER=0.001, RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
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

Define and register handlers for PCI config space accesses

Signed-off-by: Elena Ufimtseva <elena.ufimtseva@oracle.com>
Signed-off-by: John G Johnson <john.g.johnson@oracle.com>
Signed-off-by: Jagannathan Raman <jag.raman@oracle.com>
---
 hw/remote/vfio-user-obj.c | 41 +++++++++++++++++++++++++++++++++++++++++
 hw/remote/trace-events    |  2 ++
 2 files changed, 43 insertions(+)

diff --git a/hw/remote/vfio-user-obj.c b/hw/remote/vfio-user-obj.c
index 6a2d0f5..60d9fa8 100644
--- a/hw/remote/vfio-user-obj.c
+++ b/hw/remote/vfio-user-obj.c
@@ -36,6 +36,7 @@
 #include "sysemu/runstate.h"
 #include "qemu/notify.h"
 #include "qemu/thread.h"
+#include "qemu/main-loop.h"
 #include "qapi/error.h"
 #include "sysemu/sysemu.h"
 #include "hw/qdev-core.h"
@@ -131,6 +132,35 @@ static void *vfu_object_ctx_run(void *opaque)
     return NULL;
 }
 
+static ssize_t vfu_object_cfg_access(vfu_ctx_t *vfu_ctx, char * const buf,
+                                     size_t count, loff_t offset,
+                                     const bool is_write)
+{
+    VfuObject *o = vfu_get_private(vfu_ctx);
+    uint32_t val = 0;
+    int i;
+
+    qemu_mutex_lock_iothread();
+
+    for (i = 0; i < count; i++) {
+        if (is_write) {
+            val = *((uint8_t *)(buf + i));
+            trace_vfu_cfg_write((offset + i), val);
+            pci_default_write_config(PCI_DEVICE(o->pci_dev),
+                                     (offset + i), val, 1);
+        } else {
+            val = pci_default_read_config(PCI_DEVICE(o->pci_dev),
+                                          (offset + i), 1);
+            *((uint8_t *)(buf + i)) = (uint8_t)val;
+            trace_vfu_cfg_read((offset + i), val);
+        }
+    }
+
+    qemu_mutex_unlock_iothread();
+
+    return count;
+}
+
 static void vfu_object_machine_done(Notifier *notifier, void *data)
 {
     VfuObject *o = container_of(notifier, VfuObject, machine_done);
@@ -167,6 +197,17 @@ static void vfu_object_machine_done(Notifier *notifier, void *data)
                    pci_get_word(o->pci_dev->config + PCI_SUBSYSTEM_VENDOR_ID),
                    pci_get_word(o->pci_dev->config + PCI_SUBSYSTEM_ID));
 
+    ret = vfu_setup_region(o->vfu_ctx, VFU_PCI_DEV_CFG_REGION_IDX,
+                           pci_config_size(o->pci_dev), &vfu_object_cfg_access,
+                           VFU_REGION_FLAG_RW | VFU_REGION_FLAG_ALWAYS_CB,
+                           NULL, 0, -1, 0);
+    if (ret < 0) {
+        error_setg(&error_abort,
+                   "vfu: Failed to setup config space handlers for %s- %s",
+                   o->devid, strerror(errno));
+        return;
+    }
+
     qemu_thread_create(&o->vfu_ctx_thread, "VFU ctx runner", vfu_object_ctx_run,
                        o, QEMU_THREAD_JOINABLE);
 }
diff --git a/hw/remote/trace-events b/hw/remote/trace-events
index 7da12f0..2ef7884 100644
--- a/hw/remote/trace-events
+++ b/hw/remote/trace-events
@@ -5,3 +5,5 @@ mpqemu_recv_io_error(int cmd, int size, int nfds) "failed to receive %d size %d,
 
 # vfio-user-obj.c
 vfu_prop(const char *prop, const char *val) "vfu: setting %s as %s"
+vfu_cfg_read(uint32_t offset, uint32_t val) "vfu: cfg: 0x%u -> 0x%x"
+vfu_cfg_write(uint32_t offset, uint32_t val) "vfu: cfg: 0x%u <- 0x%x"
-- 
1.8.3.1


