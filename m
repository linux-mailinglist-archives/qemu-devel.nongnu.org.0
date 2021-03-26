Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 00AD034A123
	for <lists+qemu-devel@lfdr.de>; Fri, 26 Mar 2021 06:47:51 +0100 (CET)
Received: from localhost ([::1]:51874 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lPfK1-0005MS-W5
	for lists+qemu-devel@lfdr.de; Fri, 26 Mar 2021 01:47:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34054)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dongli.zhang@oracle.com>)
 id 1lPfHl-0003Sw-Ox; Fri, 26 Mar 2021 01:45:29 -0400
Received: from userp2130.oracle.com ([156.151.31.86]:32928)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dongli.zhang@oracle.com>)
 id 1lPfHi-0004Bw-3V; Fri, 26 Mar 2021 01:45:29 -0400
Received: from pps.filterd (userp2130.oracle.com [127.0.0.1])
 by userp2130.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 12Q5j6sh149526;
 Fri, 26 Mar 2021 05:45:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : content-type :
 mime-version; s=corp-2020-01-29;
 bh=U3zEkKEGf8a3E3EmWVM3QIoTpwifFP9o4rAzg3VF9bI=;
 b=QP9t+YIDQZxdTprcAYItMKpLUtYioZdsYwrV/NpuZ/6PGhDmHRlynN3QMNi0NZpCNFwl
 UG1ar8YdJf3h2F+QPLVbYh7bSKCEK+AMjSCXw6ao12CK6E3+dz5OpeJVQ6UG8bFiUcqi
 CpiI9FsVRoKnYzX6GQJHrD/Dmlaby/D1jtr5nedaI9kpDWnHczUTE/MDfmb3NhlnkEVS
 MNp8TJucrNngqmO1P4/oknvNfmyfZJXEQeWfNl1rJe/7qNfRA3ignQq7LCTcubyzfs65
 Tf7EaN0YNqaBqySSj4oBkUah/5PDYtUx9Ow1UC3swxT+f2ljYQY3iKtwA+RJ72Z3XEFJ Dw== 
Received: from aserp3030.oracle.com (aserp3030.oracle.com [141.146.126.71])
 by userp2130.oracle.com with ESMTP id 37h13rrvsu-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 26 Mar 2021 05:45:20 +0000
Received: from pps.filterd (aserp3030.oracle.com [127.0.0.1])
 by aserp3030.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 12Q5jJEI138174;
 Fri, 26 Mar 2021 05:45:19 GMT
Received: from nam02-bl2-obe.outbound.protection.outlook.com
 (mail-bl2nam02lp2058.outbound.protection.outlook.com [104.47.38.58])
 by aserp3030.oracle.com with ESMTP id 37h140yy68-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 26 Mar 2021 05:45:07 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Agz5qLeWIGHKcNIYhclkVsDokxIn4cbhr6VrVDYzsAoTxgZ72bWYHxeU3mkryeoXqlq6XGlIBMPQXt4u7nGvm+FQUS3bvIxF+F0oqr7UmUU77VK4fZBdJgzZsM4+hWxu51wbkWayAhKUo6VkODpx2QQ8uIs+62V3PR+PoDAf2T0NOXbvpmRAii1z8Po17wxgqx/QXxirb1yjqxyHo9cxmS3Lr39PVUfcwiwhaFb0plWrcli7OnR/aavdn3bUJ8wXfTC3ejVu742S51C35HZ4lXQWy5OnGUNd5nb/Wh1QRj0k9+P0ncn+28frkrY1DLXXd5YTUDhxe1EeMxuOiWh8sw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=U3zEkKEGf8a3E3EmWVM3QIoTpwifFP9o4rAzg3VF9bI=;
 b=keqz7A+xwF/SN3L8yc5Wi/Jpka2BnT4MNe/xmHpNpRwvNA4ri7EBBL2T/iy8YhZ3q/nJt8ZixWOCF5nSw+aNP3xd+3txxIBNNuLS+ydREV+OxPAVhgm6eT3isQiV2jPHP/IeO5rhy/4rWGnLKDMs/o6Ws4Hvb2tl4fpcCfsZMNksLQlxR5Z99fLKqOXfWP8JjFe2OMgLY7NcY6oTL3t2R6l3+RChqziVkhBfj990oSwKfxYPIpFl2NL0tulOp5MzpdtBAFHm/u7mH/Ajv/G9ZVkA54PK/JnLrBpR8GWibOF4VZGEna1gYhgMSGyY/kQ8jzR5o7lk1gakv4oovYDfbA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=U3zEkKEGf8a3E3EmWVM3QIoTpwifFP9o4rAzg3VF9bI=;
 b=jioZ/VeI12CQCTkXchHgPdcWnNE0hPCbdcdIFH4AleJ7it49JXwIlx63jx0YlQqQhhYmeeqaPyJjOtPddxNM6O7jDflQFG0dw/+uGXWAv+ZuoPD00hQ8NMeiB9BPe95U1kDNYAdMvVBIha8ONNz7vAZy2CR35Wcb2zePP7VSTJE=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=oracle.com;
Received: from DM6PR10MB2668.namprd10.prod.outlook.com (2603:10b6:5:b2::25) by
 DM6PR10MB3068.namprd10.prod.outlook.com (2603:10b6:5:6a::33) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3977.26; Fri, 26 Mar 2021 05:45:05 +0000
Received: from DM6PR10MB2668.namprd10.prod.outlook.com
 ([fe80::9d2c:340:5b24:bff7]) by DM6PR10MB2668.namprd10.prod.outlook.com
 ([fe80::9d2c:340:5b24:bff7%6]) with mapi id 15.20.3846.054; Fri, 26 Mar 2021
 05:45:05 +0000
From: Dongli Zhang <dongli.zhang@oracle.com>
To: qemu-block@nongnu.org, qemu-devel@nongnu.org
Subject: [PATCH 2/6] virtio: introduce helper function for kick/call device
 event
Date: Thu, 25 Mar 2021 22:44:29 -0700
Message-Id: <20210326054433.11762-3-dongli.zhang@oracle.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210326054433.11762-1-dongli.zhang@oracle.com>
References: <20210326054433.11762-1-dongli.zhang@oracle.com>
Content-Type: text/plain
X-Originating-IP: [138.3.200.16]
X-ClientProxiedBy: BYAPR02CA0053.namprd02.prod.outlook.com
 (2603:10b6:a03:54::30) To DM6PR10MB2668.namprd10.prod.outlook.com
 (2603:10b6:5:b2::25)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (138.3.200.16) by
 BYAPR02CA0053.namprd02.prod.outlook.com (2603:10b6:a03:54::30) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3977.25 via Frontend Transport; Fri, 26 Mar 2021 05:45:03 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: b60acd9a-d7d4-470b-f4d8-08d8f01a4e50
X-MS-TrafficTypeDiagnostic: DM6PR10MB3068:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DM6PR10MB3068497E682F2FF718ED5021F0619@DM6PR10MB3068.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:561;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 565Gaj23S28eDlNOK0es9YPC3EVwxQc8AhoeG8KGPkX2TRQKEQA6Om3zRDFaNr01vGOUCIPeokO5KncDKNyJp4CJYk0ggyFYuB4pDS8QBIvO481U2q0rdcim4xPyWnDwfIqBTq+WmIbBiNX+xuaP/m339NmDjKwBGeKUped0Lwm9GIm91tl0ZGKpvyjxQKwCNlA8nr8QZe105qIm4qsvtjv+6tcd2NO7D3+RApZiu8X7pz+QX3GOnbHRMya6HNNJn6X9V5gCi1wiYvh6xuVMz8UvSWLgpixd3iEZc/wCiAcTMECMsYaebfagni6yWnLn55TwP5mUH6HIt6fSUjOSYcjSUIbwbOwBJCNQuMyojVtT5M51Xzb/uroEUIRYTLkOksiMlvqPVhLLhxhK9qXbJBXvEBxL7eqef9scxMvORpfix2Fm5MW7zpsPMEQ/sIohE+w1Vrc753i/iKCQVfj7/lCtvPmRq/RL0b8mCV5rrJP0BgFSV/Xe5upGzRb8u2O9M9AVo1yyNENkGiUROw5EvLpYDKD0BL99t4McdXlWoJJmeyanKpY6SgOFCT5uScNgO3o3RntonIfCbDjbL38etDZPDbEdREbVOtLLeziaZ4OKLFxBPPmZMMygzP0uHcqXy/ydD0Ci4OE+aGudJwbpEVKZ+TDI0PdRerBTmWNMdMq/mCSYrdZ/cxKBZz+WOFsq
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR10MB2668.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(136003)(39860400002)(376002)(366004)(396003)(346002)(26005)(8936002)(956004)(8676002)(36756003)(44832011)(6666004)(16526019)(2616005)(7416002)(6506007)(186003)(6486002)(478600001)(5660300002)(52116002)(69590400012)(66556008)(38100700001)(1076003)(4326008)(66476007)(6512007)(66946007)(316002)(107886003)(86362001)(2906002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?Mi3qSJuqITp8AoVRXOyBkYNkL4RVqmoPjvDYPcWY1JYAX9fleUWTeSQieKtk?=
 =?us-ascii?Q?DRRcmDveP09LY88Hbnztk3vUrawkCpTAnZeGZbLrQ3wgBbYi/ewjwmfw44ZU?=
 =?us-ascii?Q?WYxV+2ZHFpPEacp1YAxz1eJ1J/GpVFPhtNC9yShEXDn+eAPcXXmuZNHETt09?=
 =?us-ascii?Q?5rBorxtOTJ2iKPTgGqEB+HMhx7U3cPRaqyQdSS0VK07Oyr35Pdq4IpvaE3mQ?=
 =?us-ascii?Q?F5zBlLVvqfLc1BXVYNKhYol3+AwfqKi1LuCPowQ+gy766aeW1m+adc/juTKz?=
 =?us-ascii?Q?CF4DWoD68zbnooNWxNiS2ymJaDiOYCujewcMlRqWOGPQ8gqYTr3CHg4lmTLx?=
 =?us-ascii?Q?lOltLFi9M/4jpl5zWXgU5OPQXVcJdZM92Fm3tfVA0xyq6QyxhKeA7aQX3UcC?=
 =?us-ascii?Q?rXKz9uCceXpx5ZLxz6+TFGtQ3CgKKmSZWLRKeQnbBqu2x/6gN855iZL90aVP?=
 =?us-ascii?Q?S7eudZbLqRFp0zAQbh9ui8bbBd93vDj1fzKKklMP2w81CHDVUJt8lHIKq6fT?=
 =?us-ascii?Q?hl0sHjFe5+KapOSJhDe1mDro5+DjoMmrAsEI79HuSGcM2ySI/fMVbrVpCKTC?=
 =?us-ascii?Q?NfIu2T5fBZQw9AWGW9yiFc375SEsfYqsg0ROJxKtpplq2voDDPkXEnTrTf6s?=
 =?us-ascii?Q?hcai4PDe9NZszR+NH4eVlh5Uu18nAhmu9UymnkGwwwGKzXVs6Lv6/cyYw5kr?=
 =?us-ascii?Q?/tZqWD5167AOAa6V54D/OKDdDOKF8lKL2np/OEd2WEspGFXIMrfWFWJSP9cd?=
 =?us-ascii?Q?+vmCDJstjWbO0b2wNmgxneO1rsCiy4ZaXtdwe5qjZ36baaK/5El7sRfF5UIL?=
 =?us-ascii?Q?D94a8rdltHuO6DdNZ052waMk4VH6Hab4IuNS5ch+i0wNC2H6lQjRV61+Ov99?=
 =?us-ascii?Q?oQG2dlRFpJt+9Vd76eXM+ZldlpCvKHK+2ivO6THMFGdCkfFaGT2K8quGOIiw?=
 =?us-ascii?Q?ZIrIK5KJa7fHwtd8nNCoFIg0oBlcFHJBYKjJaiMWCF40heWzoLpwozjhV2Nn?=
 =?us-ascii?Q?jSu5wBpGwVD0hSlGMK/ZwJvtmZJ8hYqVOYWGoDZDzMECodLP0NC30lnLiN9K?=
 =?us-ascii?Q?TCxA34/UqZ5R2BjVg/gxQjQBCxhoDmayHITGVd9D5o20KrCgmKvWxBSxIybA?=
 =?us-ascii?Q?jDSY+4yKsavEUNByMSu6ATxy91AGKuXPPZ+4wFJxTgPpx/7LSNyv506mGcDz?=
 =?us-ascii?Q?22v6kK4gHxZAoRTj4ypRo5OfMYTpDn1olxQ8Nvh1ffcl4YrZUuc+57IH5zyy?=
 =?us-ascii?Q?epWq1bIuX9pItBpswhd3slfV0D7Q4MXt6tkADJug/4CTGJVGARfqU2kQaUTX?=
 =?us-ascii?Q?nPAd7VivEBulP4IZsxIoJHih?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b60acd9a-d7d4-470b-f4d8-08d8f01a4e50
X-MS-Exchange-CrossTenant-AuthSource: DM6PR10MB2668.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Mar 2021 05:45:05.3795 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: MvsbkuIqX72RNk3hduY2wPNyHZ6cnk3U0ZvgqCTMSpf7p2got3kISu1tUItCExG+ZiM86DFYT0yFaLuvhntJlw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR10MB3068
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=9934
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0
 malwarescore=0 mlxscore=0
 spamscore=0 mlxlogscore=999 adultscore=0 phishscore=0 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2103250000
 definitions=main-2103260041
X-Proofpoint-ORIG-GUID: 3Yp8ee4U1f3X20mCU_Kk-bJoI4WJ2Qeb
X-Proofpoint-GUID: 3Yp8ee4U1f3X20mCU_Kk-bJoI4WJ2Qeb
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=9934
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0
 lowpriorityscore=0 malwarescore=0
 suspectscore=0 adultscore=0 phishscore=0 mlxscore=0 mlxlogscore=999
 impostorscore=0 priorityscore=1501 clxscore=1015 spamscore=0 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2103250000
 definitions=main-2103260041
Received-SPF: pass client-ip=156.151.31.86;
 envelope-from=dongli.zhang@oracle.com; helo=userp2130.oracle.com
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 MSGID_FROM_MTA_HEADER=0.001, RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_PASS=-0.001,
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
Cc: kwolf@redhat.com, fam@euphon.net, berrange@redhat.com, ehabkost@redhat.com,
 mst@redhat.com, jasowang@redhat.com, joe.jin@oracle.com, armbru@redhat.com,
 dgilbert@redhat.com, stefanha@redhat.com, pbonzini@redhat.com,
 mreitz@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This is to introduce the helper function for virtio device to kick or
call.

Signed-off-by: Dongli Zhang <dongli.zhang@oracle.com>
---
 hw/virtio/virtio.c         | 64 ++++++++++++++++++++++++++++++++++++++
 include/hw/virtio/virtio.h |  3 ++
 2 files changed, 67 insertions(+)

diff --git a/hw/virtio/virtio.c b/hw/virtio/virtio.c
index 07f4e60b30..e081041a75 100644
--- a/hw/virtio/virtio.c
+++ b/hw/virtio/virtio.c
@@ -30,6 +30,8 @@
 #include "sysemu/runstate.h"
 #include "standard-headers/linux/virtio_ids.h"
 
+/* #define DEBUG_VIRTIO_EVENT */
+
 /*
  * The alignment to use between consumer and producer parts of vring.
  * x86 pagesize again. This is the default, used by transports like PCI
@@ -2572,6 +2574,68 @@ void virtio_notify(VirtIODevice *vdev, VirtQueue *vq)
     virtio_irq(vq);
 }
 
+static void virtio_device_event_call(VirtQueue *vq, bool eventfd,
+                                     Error **errp)
+{
+#ifdef DEBUG_VIRTIO_EVENT
+    printf("The 'call' event is triggered for path=%s, queue=%d, irqfd=%d.\n",
+           object_get_canonical_path(OBJECT(vq->vdev)),
+           vq->queue_index, eventfd);
+#endif
+
+    if (eventfd) {
+        virtio_set_isr(vq->vdev, 0x1);
+        event_notifier_set(&vq->guest_notifier);
+    } else {
+        virtio_irq(vq);
+    }
+}
+
+static void virtio_device_event_kick(VirtQueue *vq, bool eventfd,
+                                     Error **errp)
+{
+#ifdef DEBUG_VIRTIO_EVENT
+    printf("The 'kick' event is triggered for path=%s, queue=%d.\n",
+           object_get_canonical_path(OBJECT(vq->vdev)), vq->queue_index);
+#endif
+
+    virtio_queue_notify(vq->vdev, virtio_get_queue_index(vq));
+}
+
+typedef void (VirtIOEvent)(VirtQueue *vq, bool eventfd, Error **errp);
+
+static VirtIOEvent *virtio_event_funcs[DEVICE_EVENT_MAX] = {
+    [DEVICE_EVENT_CALL] = virtio_device_event_call,
+    [DEVICE_EVENT_KICK] = virtio_device_event_kick
+};
+
+void virtio_device_event(DeviceState *dev, int event, int queue,
+                         bool eventfd, Error **errp)
+{
+    struct VirtIODevice *vdev = VIRTIO_DEVICE(dev);
+    int num = virtio_get_num_queues(vdev);
+    VirtQueue *vq;
+
+    assert(event < DEVICE_EVENT_MAX);
+
+    if (vdev->broken) {
+        error_setg(errp, "Broken device");
+        return;
+    }
+
+    if (queue < 0 || queue >= num) {
+        error_setg(errp, "Invalid queue %d", queue);
+        return;
+    }
+
+    vq = &vdev->vq[queue];
+
+    if (virtio_event_funcs[event])
+        virtio_event_funcs[event](vq, eventfd, errp);
+    else
+        error_setg(errp, "The event is not supported");
+}
+
 void virtio_notify_config(VirtIODevice *vdev)
 {
     if (!(vdev->status & VIRTIO_CONFIG_S_DRIVER_OK))
diff --git a/include/hw/virtio/virtio.h b/include/hw/virtio/virtio.h
index b7ece7a6a8..21bb13ffa6 100644
--- a/include/hw/virtio/virtio.h
+++ b/include/hw/virtio/virtio.h
@@ -210,6 +210,9 @@ void virtqueue_get_avail_bytes(VirtQueue *vq, unsigned int *in_bytes,
 void virtio_notify_irqfd(VirtIODevice *vdev, VirtQueue *vq);
 void virtio_notify(VirtIODevice *vdev, VirtQueue *vq);
 
+void virtio_device_event(DeviceState *dev, int event, int queue,
+                         bool eventfd, Error **errp);
+
 int virtio_save(VirtIODevice *vdev, QEMUFile *f);
 
 extern const VMStateInfo virtio_vmstate_info;
-- 
2.17.1


