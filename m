Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4ADC8340AAE
	for <lists+qemu-devel@lfdr.de>; Thu, 18 Mar 2021 17:51:47 +0100 (CET)
Received: from localhost ([::1]:54808 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lMvsA-0002gz-9o
	for lists+qemu-devel@lfdr.de; Thu, 18 Mar 2021 12:51:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60494)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jonah.palmer@oracle.com>)
 id 1lMvXu-0003ty-5W; Thu, 18 Mar 2021 12:30:50 -0400
Received: from aserp2130.oracle.com ([141.146.126.79]:43782)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jonah.palmer@oracle.com>)
 id 1lMvXo-0008Aw-QU; Thu, 18 Mar 2021 12:30:49 -0400
Received: from pps.filterd (aserp2130.oracle.com [127.0.0.1])
 by aserp2130.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 12IGTuFX167180;
 Thu, 18 Mar 2021 16:30:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : content-type :
 mime-version; s=corp-2020-01-29;
 bh=oKrqGRQ5rQ0M5uFzhyOa6btpAVcjAeUEEAgAfSBqEM4=;
 b=lf0n5ploF0wx4F4i7sEoBjQI3Pg/lL6QcgKYo055BZ+Cynop1ZPr9nNc+XYhccFUHg7x
 diNdvHtT9DyxfBtRjQHbiZJ5v25KyzacPagwqJre3Q0VcFgQpBpVGCOP+agsKjFngKNo
 cIesmoAaSzXYBOcKMa2DJeASaNxQLWSQqgRpPp94iVCXLVwPYYxXTb9nOLlxdD49Bjnh
 XTmVNyY77WiGVjSLddLla7sfSpsqhMBskI8EqrFHw6GDVBkeA6KlCFgJtV4BwCtHUYhd
 DIM0z/x5enhPzwdGyYQcdfIKAwVdMsu65L8CDOj/uhFcOZaXMNb1NmoGQ4JXErAxO4nr jw== 
Received: from aserp3030.oracle.com (aserp3030.oracle.com [141.146.126.71])
 by aserp2130.oracle.com with ESMTP id 378jwbr7e4-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 18 Mar 2021 16:30:26 +0000
Received: from pps.filterd (aserp3030.oracle.com [127.0.0.1])
 by aserp3030.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 12IGQm2G051906;
 Thu, 18 Mar 2021 16:30:25 GMT
Received: from nam11-dm6-obe.outbound.protection.outlook.com
 (mail-dm6nam11lp2175.outbound.protection.outlook.com [104.47.57.175])
 by aserp3030.oracle.com with ESMTP id 3796ywdjeq-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 18 Mar 2021 16:30:25 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XxgQ90f4kq5RSTSoo7zPfuwn+otMLrCAv+KzG5TweCEtktLEHBT3R0jj92DdkgGQcojprZUnhnFfsqjLbe8LpWIvRomen5S3uFKIBwAmoPm75mqsGrKUgGUNREuy6exeVCWVOp8Spr+fdTJEnfFwLhyr7cnld1/uUosiFBxenjLHtXg5hLTLg20jYwAcwOZ5CMqRQak49WB2F1ytwuiBZm9dhNzyVxXYKqrr7LFKibZkZ8KHg9G0r04Y/CUSI4UuBqYa3b8uRni4Rvd91iOZlkAAWFqi1ICGzHzURaFVTfkNVCU/YXAaESNzQfSkqR/MniQGd9wEG0yzXItAXw9FiQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oKrqGRQ5rQ0M5uFzhyOa6btpAVcjAeUEEAgAfSBqEM4=;
 b=mrvo1Xyf/7A5fKyoXr4HOHdVumDturOubXASN34bzE/oQkeRzhRW2A5Cl8k8DKkV/bPTDkLzz/nYVhDJF2QJjIzFLmT3/AqDWFVCFA9ZMDY1/XuRA5BP7mTWSz/YdTPnWPXtICglssFJp3CJdBNdFntXpDXAdLMCoCIrhq/HeiYnXxjdd2pcskIEFUXB7/uGXQFy4T6Sz7VnFxbdMM5hxeNbKF87/honkdd1vTEfZJW09fb8vVO2hY38J5nZGeN8h3saiIvM5rDsY5vBCczOadvEK+0YYzLYHKPYMYOQu1vir4Hvq802tskAzQ13khkJqhygubx14l+JxyTjV7JmeA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oKrqGRQ5rQ0M5uFzhyOa6btpAVcjAeUEEAgAfSBqEM4=;
 b=HVNY66bpp07S+GPmO9c3QPgD2Q1l0hxjlKHbwneKu4ZAjbBogTWQHU8Qyz5gwxk9upCOET9aWOTlESxXXWx1J5flvbq40glbRVqsGqWfuQZ/3Ly2k/ys/uolkl8n99Dy+gG7yUn6XwMKNdKkCBIcWl7eaOXM7sRkG+9DgUVcMDk=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=oracle.com;
Received: from PH0PR10MB4664.namprd10.prod.outlook.com (2603:10b6:510:41::11)
 by PH0PR10MB4565.namprd10.prod.outlook.com (2603:10b6:510:31::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3955.18; Thu, 18 Mar
 2021 16:30:16 +0000
Received: from PH0PR10MB4664.namprd10.prod.outlook.com
 ([fe80::6819:aaf:9a92:c1db]) by PH0PR10MB4664.namprd10.prod.outlook.com
 ([fe80::6819:aaf:9a92:c1db%2]) with mapi id 15.20.3933.032; Thu, 18 Mar 2021
 16:30:16 +0000
From: Jonah Palmer <jonah.palmer@oracle.com>
To: qemu-devel@nongnu.org
Subject: [RFC v5 4/6] qmp: add QMP command x-debug-virtio-queue-status
Date: Thu, 18 Mar 2021 12:29:42 -0400
Message-Id: <1616084984-11263-5-git-send-email-jonah.palmer@oracle.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1616084984-11263-1-git-send-email-jonah.palmer@oracle.com>
References: <1616084984-11263-1-git-send-email-jonah.palmer@oracle.com>
Content-Type: text/plain
X-Originating-IP: [24.147.51.11]
X-ClientProxiedBy: SJ0PR05CA0079.namprd05.prod.outlook.com
 (2603:10b6:a03:332::24) To PH0PR10MB4664.namprd10.prod.outlook.com
 (2603:10b6:510:41::11)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from jonpalme-lnx.us.oracle.com (24.147.51.11) by
 SJ0PR05CA0079.namprd05.prod.outlook.com (2603:10b6:a03:332::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3977.10 via Frontend
 Transport; Thu, 18 Mar 2021 16:30:13 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: ceabc087-1dd2-46d4-e2cc-08d8ea2b1ce5
X-MS-TrafficTypeDiagnostic: PH0PR10MB4565:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <PH0PR10MB4565DC3A4DAE9DE96C9AD3D4E8699@PH0PR10MB4565.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2399;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Ke0seZs13pbkKrvwTu8GNjmhM+RRZO3JbWWOrRhqz6tfetl+nUh2RDWul65oCOYDfLfz2xT52Wlxu8QVfJb2vVHxydy8mUkNZu76XUVyxSs3mhLy8L4rfNmlE8vc7B6eZtU9ycXn48vK+gYy+6gw+J3pt7UE7ZU49/n3j47M6qgAFS0GT6gIJ58mIimrO2kjMDOMDUN3EnsBc8Z/5Ns8E3CtR8MDcHa1MlQw68G7vkwuJjsMFyWpPaPHAC/1ZA0t5BleTHj7eLF+dMgW/Gjz3eBCQpTt/WK2QBPnkUHfCClzTTELIisbRatVzzybsXwuprA8aUFtQkOVufqtQUU39XEdVOpvQwkRsazTWl3pjeCYIzLsN/mhuPDdvdZhaYMhdc9hGRFmXIHT9JY69FxAkF6+JkkSk7wytJ4kGDtxpc6KRT8kRM30VQD85Q0t/qFb9GnkWu86X38nGsUERnK1G5hZFumdJyeIUGY5Gw+L6QV+nnYM9zhoZr3QQVD+DJ7Upqp15bKxHGmmj1lfES5ci0ZoCs+ogDTZtWAIaIYqYkxMz91TD9cISSl8RtMDqmxbmBYHP/CqJKaw+11GlSDYDZzKb2x9asfFW6k1v4npT5Y=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH0PR10MB4664.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(396003)(346002)(366004)(39860400002)(376002)(136003)(8676002)(66476007)(66556008)(66946007)(38100700001)(36756003)(186003)(5660300002)(2906002)(478600001)(86362001)(52116002)(7696005)(8936002)(316002)(16526019)(956004)(26005)(7416002)(6666004)(44832011)(2616005)(6916009)(107886003)(4326008)(6486002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?7LX2AQyJdG/UnRYJeMTW6hQC80S9KXnZAOeCg+BfTmTTh7wI5RQRkS8yyL4y?=
 =?us-ascii?Q?rDfazJJoyM0lqBlFnALoy44AGRqvBZeFIPsJ+9W/coTeU7xNpIPYvTRhp89R?=
 =?us-ascii?Q?zf1frXkBH7hTy3YYqgewa2ym1SdpOn27X99pQ+k5KTXTSiM+FVQE6b4DLyER?=
 =?us-ascii?Q?n7XjrjfUqOlyqpmcal/iJZ8A3danS2rZ0A8KvH5nKx6hsA7c8yw9mWOg+PMn?=
 =?us-ascii?Q?yBwGIGxZPBxit7n+12L0LrO4H5UQD76EawXE57ZYBLUjW9A4bVJpSNBuGUJ+?=
 =?us-ascii?Q?rUwp6+UnOJlP75dmjpXJ8jRE1xnaUkd95emlJRQ0WfPejPZm5CW54Q4mzONy?=
 =?us-ascii?Q?u396nxEihbYmdf3mx2mpj8VBPf9HeF+8Gytx1X+6hp6ZYo3lmt91SIS5GMR8?=
 =?us-ascii?Q?is+GoIMJCLaolwrZU1Ht8S/3rxKX9xyKisMJxwJjItEFCj9rLT9lhWb3sfVh?=
 =?us-ascii?Q?0/WLO81uiBfz+rjVW3XKk63VwZSW4KgAsnTI+JF4lpNExm1I9aQhH09qXBmk?=
 =?us-ascii?Q?wp810t4Z6+ozPaBSLAZuNdtwU4ccw85xSgP8QbaEfhr99Iej03IKIynkEgy7?=
 =?us-ascii?Q?T376478TmHQy74W4uLmS1a6Tauo/u+B9VIvj7P5z58JBblgoaN94SQ4ddv67?=
 =?us-ascii?Q?zjcmdmPyz+mIQ0azX6dYHI83JrHuT+p9Sd+FU2uoV89X9z7yBfTIgZggafSi?=
 =?us-ascii?Q?cXKJihYsuD4e5U4GPZ+t317/HSDpONZ10gyv9RAxZpFCqW/hgVetxCSU4HJI?=
 =?us-ascii?Q?2g9EV4rQXEdDj9vH7G+IrRbGSftHOGkcHzzq8WZi7s+uNl0F4V142K7ctO6h?=
 =?us-ascii?Q?6CPKkASY1s4WaWqeaK+RtD9G1mhctGC9VtYgOieMRSXHe8Q4ZzkTnVKI/SYD?=
 =?us-ascii?Q?jBAIxh2A2TAi2VB07Y97uxVsKiflh75hnExeDMizJ7WufXl/dK1NpkoMFKY5?=
 =?us-ascii?Q?uAcqexrlD4YOPEhuFFFMJdd5+XAUnjQBDNmtj3J5M5lSsEvF7Hl9QLAzUbAK?=
 =?us-ascii?Q?NiraZTttxE0G8UNeIBp8w7YszIfdw8OwIX5foeftT27C8WFr45ZW69S6y2A0?=
 =?us-ascii?Q?ZS72iWj0yggf3kN891EawA4wbOYN+USEVj/V9IWlfuklErzDZwRj/XC0Br4k?=
 =?us-ascii?Q?Iuz9hAyqsVbj6LtSYIJlJzvaC1RXwn8j20kifoM2wGou4c1Rqwv/JmtkTOqx?=
 =?us-ascii?Q?l07CSz7DzjQgiBK0EcyaAdWkIEBAZnID3tDAXJE3lZiJWqyT0cRa81fgGipf?=
 =?us-ascii?Q?6PZA0OD4gghpIT4X2zaULDTYgydoQBC3r8LaJbFhHesBodacRxwj8zLckMOr?=
 =?us-ascii?Q?TPBzJFbDMIlbmsUCq8y2r4z+?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ceabc087-1dd2-46d4-e2cc-08d8ea2b1ce5
X-MS-Exchange-CrossTenant-AuthSource: PH0PR10MB4664.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Mar 2021 16:30:16.3341 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: A8w2znpLv3yvL84iO4emlgjpwbRlHzYAmtPoSeRpGjo+ng9tFketyQXuTDvaPSk0OnfzjFtGX0p+J1I9LCjcRA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR10MB4565
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=9927
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 phishscore=0
 malwarescore=0 spamscore=0
 bulkscore=0 mlxlogscore=999 mlxscore=0 suspectscore=0 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2103180115
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=9927
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0
 mlxlogscore=999
 spamscore=0 mlxscore=0 bulkscore=0 suspectscore=0 priorityscore=1501
 lowpriorityscore=0 clxscore=1015 adultscore=0 phishscore=0 impostorscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2103180116
Received-SPF: pass client-ip=141.146.126.79;
 envelope-from=jonah.palmer@oracle.com; helo=aserp2130.oracle.com
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 MSGID_FROM_MTA_HEADER=0.001, RCVD_IN_DNSWL_MED=-2.3, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

[Jonah: Added 'device-type' field to VirtQueueStatus and
qmp command x-debug-virtio-queue-status.]

Signed-off-by: Laurent Vivier <lvivier@redhat.com>
Signed-off-by: Jonah Palmer <jonah.palmer@oracle.com>
---
 hw/virtio/virtio-stub.c |   6 +++
 hw/virtio/virtio.c      |  37 ++++++++++++++++++
 qapi/virtio.json        | 102 ++++++++++++++++++++++++++++++++++++++++++++++++
 3 files changed, 145 insertions(+)

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
index 08ca635..d9b5734 100644
--- a/hw/virtio/virtio.c
+++ b/hw/virtio/virtio.c
@@ -3919,6 +3919,43 @@ static VirtIODevice *virtio_device_find(const char *path)
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
index 8b5785f..ab94263 100644
--- a/qapi/virtio.json
+++ b/qapi/virtio.json
@@ -402,3 +402,105 @@
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
+# Since: 6.0
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
+# Since: 6.0
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


