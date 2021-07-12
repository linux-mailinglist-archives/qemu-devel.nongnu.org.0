Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 833993C4DE5
	for <lists+qemu-devel@lfdr.de>; Mon, 12 Jul 2021 12:41:02 +0200 (CEST)
Received: from localhost ([::1]:39554 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m2tMz-00077w-IG
	for lists+qemu-devel@lfdr.de; Mon, 12 Jul 2021 06:41:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42076)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jonah.palmer@oracle.com>)
 id 1m2tIs-0001aS-7X; Mon, 12 Jul 2021 06:36:46 -0400
Received: from mx0b-00069f02.pphosted.com ([205.220.177.32]:17782)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jonah.palmer@oracle.com>)
 id 1m2tIp-0008US-VN; Mon, 12 Jul 2021 06:36:45 -0400
Received: from pps.filterd (m0246631.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 16CAVunf029748; Mon, 12 Jul 2021 10:36:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : content-type :
 mime-version; s=corp-2020-01-29;
 bh=dUDhwEyPAjmD/cBYeorGq6OTH0rEjCWg3QMtIOO2GrU=;
 b=rq+j09jJMIV8dzRQTEd7DpZ8MPv57r6fYYWN4O+HWlQqYUi6sKI2wXA3z4V/K3rx9scC
 k4VutuQ+8zQBEHxCQex5mAhW3VQNAp3sCFJngzCJjoI/ypnZ3OfRALYAewzuubAd4nnl
 Yl/j8R7BBSAkKgPyCXn3ZXow1cgmdBIIs99pfkO7QeTq94jZnQaQKZ/LZ4lZGuk9+yZX
 0O0Wps41ReOQ+AbGklqcE10XJzfWHU000/HnoZgneGmj1gChfFUPM5KM/KwnNiD+7BTM
 cl3RmEfLUvFr+6K9D/8WwYACY//W3wcg+tW+/ubo4hXcwnLPqG6aqCZNesA2geEuaDxu Jg== 
Received: from userp3030.oracle.com (userp3030.oracle.com [156.151.31.80])
 by mx0b-00069f02.pphosted.com with ESMTP id 39q2b2jcn1-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 12 Jul 2021 10:36:36 +0000
Received: from pps.filterd (userp3030.oracle.com [127.0.0.1])
 by userp3030.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 16CAaQTC067272;
 Mon, 12 Jul 2021 10:36:35 GMT
Received: from nam04-mw2-obe.outbound.protection.outlook.com
 (mail-mw2nam08lp2175.outbound.protection.outlook.com [104.47.73.175])
 by userp3030.oracle.com with ESMTP id 39q0nyse56-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 12 Jul 2021 10:36:34 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RW7fT3ldcjs8iYu2485IJ6xyCf4esYw1B5V0UOplyPLxqpIzX4xo0J/ivDKfJZqvbcaI5fD26aZZ54c6qQ3XpcDpGOhE7aMZRaY9zVrLs333y1uE8ouZb7uEbIvRk+Ur5rLJvHHNcu91B2wwwVPwfJyNJ3cmeUC0J6JQudaNBKwILLlB5n5wxj+XbHjM50iSI2KhK9dHEZrl9WZGYP6Z+cksnyeC05mq25m/3SvuI4ACRxLGdmI8q1Qh+ogq02waFve9E1kIVWsrHn8Mn3HuTBHjdIjjjiY4qQs7Vs2vDFKrTi8aL57Z3blE/dFDSwDwuW8nEfAVMHs8IkFUVoagww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dUDhwEyPAjmD/cBYeorGq6OTH0rEjCWg3QMtIOO2GrU=;
 b=j9fXL0/qwRGPMbBnBima8I1Lvwuxb2QsVFnfmulYbnSfinYlFTxmnJVD1yjUEJjdoKT9ka3oW74Ua8YmydfoPTlvruSs+joxGCJgaQqRtnfKHIs29udFMplh6Mz5VPxd12PFw7qyumCi8/aECWD6VqYNEUeapTmcb4hnOftgoz/sc6OwX76zmwriqEneB9Z7Vr6xodBIGC90b32Bga35TlZTZ/OG//gqw1CdaKzUFMNI4f9WGMzNXovvHwJm755ctOS5Axxup2Gj1jpJTHRx+U88nScSul66+qF+n2fQQ30Q+33obegPztjnVT1trdlzpAyNFAbYfgIIpsV17hcFQA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dUDhwEyPAjmD/cBYeorGq6OTH0rEjCWg3QMtIOO2GrU=;
 b=Xlsp+8Z6yDAmpJLO4lK/pgpBjlWEW2G7+0k9+4cCkFEZ9mfmuUgHVHZqJIY0Rk7rOC6MdOU9WxuT+rC5tqSFHDyVcwz+yvct5jBXkdZJY571iDRdcIMfZzZI7cjSvnRVFYf6P0MRiu0XTKcgT0XVK0gkPk+eMlNc2YPx+COY4RU=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=oracle.com;
Received: from PH0PR10MB4664.namprd10.prod.outlook.com (2603:10b6:510:41::11)
 by PH0PR10MB4552.namprd10.prod.outlook.com (2603:10b6:510:42::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4308.20; Mon, 12 Jul
 2021 10:36:32 +0000
Received: from PH0PR10MB4664.namprd10.prod.outlook.com
 ([fe80::c0ec:e3aa:9d8f:61c0]) by PH0PR10MB4664.namprd10.prod.outlook.com
 ([fe80::c0ec:e3aa:9d8f:61c0%6]) with mapi id 15.20.4308.026; Mon, 12 Jul 2021
 10:36:32 +0000
From: Jonah Palmer <jonah.palmer@oracle.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v6 4/6] qmp: add QMP command x-debug-virtio-queue-status
Date: Mon, 12 Jul 2021 06:35:35 -0400
Message-Id: <1626086137-16292-5-git-send-email-jonah.palmer@oracle.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1626086137-16292-1-git-send-email-jonah.palmer@oracle.com>
References: <1626086137-16292-1-git-send-email-jonah.palmer@oracle.com>
Content-Type: text/plain
X-ClientProxiedBy: SN4PR0701CA0019.namprd07.prod.outlook.com
 (2603:10b6:803:28::29) To PH0PR10MB4664.namprd10.prod.outlook.com
 (2603:10b6:510:41::11)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from jonpalme-lnx.us.oracle.com (209.17.40.41) by
 SN4PR0701CA0019.namprd07.prod.outlook.com (2603:10b6:803:28::29) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4308.19 via Frontend
 Transport; Mon, 12 Jul 2021 10:36:30 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 86477d9a-16ae-4fe4-f079-08d94520ea4b
X-MS-TrafficTypeDiagnostic: PH0PR10MB4552:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <PH0PR10MB45524919DF03D2F032160D32E8159@PH0PR10MB4552.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2399;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: eSxYwe3PscsjwLUdBjO1c0EJzEOj8alBa9a54Fa9ts4f8jplbeTJtyyXUx2c8qrbu1OmQVMKQA8uEL5HvvzNWBlznDAIGOcAvkU36HHTb3lXTD9JnrAQEHFUj0a0xedhsosUEa2Qj810v+pFLHWPN6XsY/gBMSuzC0N4Osiu97TdNy0icwK/KISEV7OT3/RMXerImcTJcBWPtvnMmu+AIUruqAWq9B658etjUA8bhDzV0eq7nUGOzpRXB5K9vBj64wr0glQTDyEpmcPoUBZeWG2wgxgnHfQhGGcdPJtN/e9nZ0++K8dV5oFDj3oWJdknwSfMJL3uI71qECZsFKN/dBWSpCO10zqHW+RQnEmCGpWUUv+/CO7B+HV+M3jgiOt0lttGPue2BvIuNrZ6gIcCobvFjKlmfBz750i5gWTyanc28iwfyC8pWVmpp6pRxqXbaW7v/y9OBh35LBnyjMsSrBjf5WykpbKFuJWN61oyJq0F7rF7/uJ66yUGwblgQ57t4y1oaE0WBFeXq/EYNjI9V/y/9ns0TyyHqUjTF/jLXhkhyAaoIb7eR3BC8Ayc376lbBNG64wT2B/W7c8cd3VEQZPNUgZYydGO56pWfTbD0Ue/YmEpTlTpAcDqKtaV/yxJp0ODATuitwAhzbIqr3sNfCWzJjTTnUYh93F0TNiVWO6OOp3C0fAvsKuNrizVxtczcMJm529TUHzmwdyqHba2oQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH0PR10MB4664.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(396003)(39860400002)(346002)(366004)(136003)(376002)(7416002)(956004)(6486002)(7696005)(2616005)(186003)(316002)(36756003)(4326008)(2906002)(8936002)(52116002)(86362001)(107886003)(66476007)(66946007)(44832011)(66556008)(6916009)(38100700002)(5660300002)(8676002)(38350700002)(478600001)(26005);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?s3tARezmQsUYSu4GCLOvX7193t4/sxDr/LSiQWa7nCps6j+eutCmUTQnFa6S?=
 =?us-ascii?Q?6RmH61iXWX3cwbRYnvXzKmbHlL/Ls4Htb+gMlLM0LvmS0V6bzHi1Rhv+4HPp?=
 =?us-ascii?Q?OCRM0xFbCVkzAnmxQTdrDyLfxfjxu3jcKfdLqAG/U3K403s3pJnxDUNLfJJf?=
 =?us-ascii?Q?OQgUuxwuWlMVjw/yTkPvKuaJIsh/Xw5QhXilKkPK9fnmn74fSNTEb92A+gO9?=
 =?us-ascii?Q?LyCVAKE2R89r185Eu631ZB/pyhUehZp3YM6Z5XBt39fNsHYaP5GcviumtR+O?=
 =?us-ascii?Q?ThvHJbkyrZfF9KEmPV/4LE9F3YmNKhox4SWCYAT4Sjiz75XP9xFr3lETvjIX?=
 =?us-ascii?Q?EvRM8UFA2ML+4vyGmlE9tFA5Ab6WxPUTr2aXEZKSpkCkuVbLYEXkoA3v7IoM?=
 =?us-ascii?Q?6663R4OR2qv67fNBSaSTjTtRMxo6rab/zZC61W7O//5JJNHF+XCYySwmFpFp?=
 =?us-ascii?Q?XDg/jNUZKldfjyRUN0UMiYMvR84yvR2ACbVLY9SJXZExZPqRxtgv/oFjpETB?=
 =?us-ascii?Q?qkrW2axS3jG3G1aR+JJv4tYit9w0kT+GWYnAyXL81oIS6YNcvZfUYa55i5SS?=
 =?us-ascii?Q?OQEewTxpo1wKdGc6ZSrToEACjTeY8xskDVA6Cq5cSMEhUgkfYa6l8DDtoMd0?=
 =?us-ascii?Q?wxZ/ASE03Ghov/MsMzjq3H7YL+uPTobgJTJasgoa0FAFGW9gDe/juq7AzFah?=
 =?us-ascii?Q?iFd+jz9YPGMzSDgQ/yDwqVGDqB6xYj+28/AgdBoOj1NNSqjp3h1/vrLIn5wU?=
 =?us-ascii?Q?IUWzlrvRQc+Bfn6SxBAJKC9AI9feQKSiskwn8dkglVLQE5fq90HAHag8Jh4v?=
 =?us-ascii?Q?jbtsBkGEEmrKpy1ipV1oTR1LrLFClsZ7ryPVvLJ/bRl8C+B/WUOLZv44EMTJ?=
 =?us-ascii?Q?9xiVwezIUdjHNni0UmqXTdlrusBKqgzMcDYPEgp6MQBRlv68qNPDdVq7327J?=
 =?us-ascii?Q?rog+Zpv/6xTzbrkVzQwZ4bBq++xKIUIRzl+E9bSRpIQQcRRp0fddb51bGh+N?=
 =?us-ascii?Q?FUc3pcD/TLNf1VibV84f4adiq8jyp8Z4mrh196cMW74DPsmTl75pYyp5RL4F?=
 =?us-ascii?Q?VyTFk1yNcVEdnfjrzySavFIzeDm4YeigneXXukZj9nIY1paxqmcVH9k588RN?=
 =?us-ascii?Q?Ulh5Ayad11YCJJ4/8iPIlltZy2ZohEjY4ixgrXkgxSuaReYnQ7bQL/S8ZXs+?=
 =?us-ascii?Q?fhBY6O21mrX6MUDNGaHr5YXn4KImi3AK5zXvbvW08dgHj+9DWNPhsNVaSL/R?=
 =?us-ascii?Q?inCqp8hBaTxoaTYsli1N47HN1QZF2PlK6GQZFVas+VEuC5arQ3vlta8BwumI?=
 =?us-ascii?Q?pv6ICH6R3bsRNe+ARIlzJ+NW?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 86477d9a-16ae-4fe4-f079-08d94520ea4b
X-MS-Exchange-CrossTenant-AuthSource: PH0PR10MB4664.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jul 2021 10:36:32.3603 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: y6F2uWTVeB/H4iCYdGbWDlqXEIiOtOkDP/taZJXjwDwtDwTy4b/mIKqqmIzq+cqBjHbu4cGU7Vc+tUJ41GGdVg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR10MB4552
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=10042
 signatures=668682
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0
 adultscore=0
 phishscore=0 spamscore=0 bulkscore=0 mlxlogscore=999 mlxscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2104190000 definitions=main-2107120082
X-Proofpoint-GUID: iIIk7IwWvc-AbSsWdFmQUY59BmiGahcT
X-Proofpoint-ORIG-GUID: iIIk7IwWvc-AbSsWdFmQUY59BmiGahcT
Received-SPF: pass client-ip=205.220.177.32;
 envelope-from=jonah.palmer@oracle.com; helo=mx0b-00069f02.pphosted.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 MSGID_FROM_MTA_HEADER=0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_BL=0.01,
 RCVD_IN_MSPIKE_L3=0.9, SPF_HELO_NONE=0.001,
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
Cc: fam@euphon.net, mst@redhat.com, jasowang@redhat.com, kraxel@redhat.com,
 si-wei.liu@oracle.com, joao.m.martins@oracle.com, qemu-block@nongnu.org,
 david@redhat.com, armbru@redhat.com, marcandre.lureau@redhat.com,
 jonah.palmer@oracle.com, thuth@redhat.com, amit@kernel.org,
 michael.roth@amd.com, dgilbert@redhat.com, eric.auger@redhat.com,
 dmitrii.stepanov@cloud.ionos.com, stefanha@redhat.com, kwolf@redhat.com,
 laurent@vivier.eu, mreitz@redhat.com, pbonzini@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Laurent Vivier <lvivier@redhat.com>

This new command shows internal status of a VirtQueue.
(vrings and indexes).

Signed-off-by: Laurent Vivier <lvivier@redhat.com>
Signed-off-by: Jonah Palmer <jonah.palmer@oracle.com>
---
 hw/virtio/virtio-stub.c |   6 +++
 hw/virtio/virtio.c      |  37 ++++++++++++++++++
 qapi/virtio.json        | 102 ++++++++++++++++++++++++++++++++++++++++++++++++
 3 files changed, 145 insertions(+)

 [Jonah: Added 'device-type' field to VirtQueueStatus and
 qmp command x-debug-virtio-queue-status.]

diff --git a/hw/virtio/virtio-stub.c b/hw/virtio/virtio-stub.c
index ddb592f..3c1bf17 100644
--- a/hw/virtio/virtio-stub.c
+++ b/hw/virtio/virtio-stub.c
@@ -17,3 +17,9 @@ VirtioStatus *qmp_x_debug_virtio_status(const char* path, Error **errp)
 {
     return qmp_virtio_unsupported(errp);
 }
+
+VirtQueueStatus *qmp_x_debug_virtio_queue_status(const char *path,
+                                                 uint16_t queue, Error **errp)
+{
+    return qmp_virtio_unsupported(errp);
+}
diff --git a/hw/virtio/virtio.c b/hw/virtio/virtio.c
index 81a0ee8..ccd4371 100644
--- a/hw/virtio/virtio.c
+++ b/hw/virtio/virtio.c
@@ -3935,6 +3935,43 @@ static VirtIODevice *virtio_device_find(const char *path)
     return NULL;
 }
 
+VirtQueueStatus *qmp_x_debug_virtio_queue_status(const char *path,
+                                                 uint16_t queue, Error **errp)
+{
+    VirtIODevice *vdev;
+    VirtQueueStatus *status;
+
+    vdev = virtio_device_find(path);
+    if (vdev == NULL) {
+        error_setg(errp, "Path %s is not a VirtIO device", path);
+        return NULL;
+    }
+
+    if (queue >= VIRTIO_QUEUE_MAX || !virtio_queue_get_num(vdev, queue)) {
+        error_setg(errp, "Invalid virtqueue number %d", queue);
+        return NULL;
+    }
+
+    status = g_new0(VirtQueueStatus, 1);
+    status->device_type = qapi_enum_parse(&VirtioType_lookup, vdev->name,
+                                          VIRTIO_TYPE_UNKNOWN, NULL);
+    status->queue_index = vdev->vq[queue].queue_index;
+    status->inuse = vdev->vq[queue].inuse;
+    status->vring_num = vdev->vq[queue].vring.num;
+    status->vring_num_default = vdev->vq[queue].vring.num_default;
+    status->vring_align = vdev->vq[queue].vring.align;
+    status->vring_desc = vdev->vq[queue].vring.desc;
+    status->vring_avail = vdev->vq[queue].vring.avail;
+    status->vring_used = vdev->vq[queue].vring.used;
+    status->last_avail_idx = vdev->vq[queue].last_avail_idx;
+    status->shadow_avail_idx = vdev->vq[queue].shadow_avail_idx;
+    status->used_idx = vdev->vq[queue].used_idx;
+    status->signalled_used = vdev->vq[queue].signalled_used;
+    status->signalled_used_valid = vdev->vq[queue].signalled_used_valid;
+
+    return status;
+}
+
 #define CONVERT_FEATURES(type, map)                \
     ({                                           \
         type *list = NULL;                         \
diff --git a/qapi/virtio.json b/qapi/virtio.json
index 78873cd..7007e0c 100644
--- a/qapi/virtio.json
+++ b/qapi/virtio.json
@@ -406,3 +406,105 @@
   'data': { 'path': 'str' },
   'returns': 'VirtioStatus'
 }
+
+##
+# @VirtQueueStatus:
+#
+# Status of a VirtQueue
+#
+# @device-type: VirtIO device type
+#
+# @queue-index: VirtQueue queue_index
+#
+# @inuse: VirtQueue inuse
+#
+# @vring-num: VirtQueue vring.num
+#
+# @vring-num-default: VirtQueue vring.num_default
+#
+# @vring-align: VirtQueue vring.align
+#
+# @vring-desc: VirtQueue vring.desc
+#
+# @vring-avail: VirtQueue vring.avail
+#
+# @vring-used: VirtQueue vring.used
+#
+# @last-avail-idx: VirtQueue last_avail_idx
+#
+# @shadow-avail-idx: VirtQueue shadow_avail_idx
+#
+# @used-idx: VirtQueue used_idx
+#
+# @signalled-used: VirtQueue signalled_used
+#
+# @signalled-used-valid: VirtQueue signalled_used_valid
+#
+# Since: 6.1
+#
+##
+
+{ 'struct': 'VirtQueueStatus',
+  'data': {
+    'device-type': 'VirtioType',
+    'queue-index': 'uint16',
+    'inuse': 'uint32',
+    'vring-num': 'int',
+    'vring-num-default': 'int',
+    'vring-align': 'int',
+    'vring-desc': 'uint64',
+    'vring-avail': 'uint64',
+    'vring-used': 'uint64',
+    'last-avail-idx': 'uint16',
+    'shadow-avail-idx': 'uint16',
+    'used-idx': 'uint16',
+    'signalled-used': 'uint16',
+    'signalled-used-valid': 'uint16'
+  }
+}
+
+##
+# @x-debug-virtio-queue-status:
+#
+# Return the status of a given VirtQueue
+#
+# @path: QOBject path of the VirtIODevice
+#
+# @queue: queue number to examine
+#
+# Returns: Status of the VirtQueue
+#
+# Since: 6.1
+#
+# Example:
+#
+# -> { "execute": "x-debug-virtio-queue-status",
+#      "arguments": {
+#          "path": "/machine/peripheral-anon/device[3]/virtio-backend",
+#          "queue": 0
+#      }
+#   }
+# <- { "return": {
+#      "signalled-used": 373,
+#      "inuse": 0,
+#      "vring-align": 4096,
+#      "vring-desc": 864411648,
+#      "signalled-used-valid": 0,
+#      "vring-num-default": 256,
+#      "vring-avail": 864415744,
+#      "queue-index": 0,
+#      "last-avail-idx": 373,
+#      "vring-used": 864416320,
+#      "used-idx": 373,
+#      "device-type": "virtio-net",
+#      "shadow-avail-idx": 619,
+#      "vring-num": 256
+#      }
+#    }
+#
+##
+
+{ 'command': 'x-debug-virtio-queue-status',
+  'data': { 'path': 'str', 'queue': 'uint16' },
+  'returns': 'VirtQueueStatus'
+}
-- 
1.8.3.1


