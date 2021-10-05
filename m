Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E421422FC9
	for <lists+qemu-devel@lfdr.de>; Tue,  5 Oct 2021 20:14:20 +0200 (CEST)
Received: from localhost ([::1]:36604 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mXoxH-00077A-4D
	for lists+qemu-devel@lfdr.de; Tue, 05 Oct 2021 14:14:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45994)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jonah.palmer@oracle.com>)
 id 1mXnav-00034V-2I; Tue, 05 Oct 2021 12:47:10 -0400
Received: from mx0a-00069f02.pphosted.com ([205.220.165.32]:54976)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jonah.palmer@oracle.com>)
 id 1mXnaq-0005tu-42; Tue, 05 Oct 2021 12:47:08 -0400
Received: from pps.filterd (m0246627.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 195G5UH2019232; 
 Tue, 5 Oct 2021 16:46:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : content-type :
 mime-version; s=corp-2021-07-09;
 bh=KoUAhktZOcJNqj0R2kE0BKweU0VEGyj601XzNw4/aXU=;
 b=WkYfP/Bf6l/OIxKFWg2vZGtbSd7lqh9oBJV2QetFONzzU6BlC+z/snXN5u68qSsb5bfq
 mIP96z3tgkwJDOQV97I+SGLfzTLJjAW0miB5UMlsylqesPjR7q2El1OXJZN3eSqzvK0u
 n8asFi5zKN7DEaTmPf9i9wzb5m5JWWnUg4dBk4ugxHnaO/yETnD40it+56Mtl9GQmGjA
 edgqDdgah7M6ZTKq7XPw3TvJ6lFynRPi+Us0wqM2QVJOdNcUusXCXI1j5RjN875cl8um
 ptCNICPFTFuzPGQO9gHTg4Fr8ELQtpryaozoI1p0rgfrmIOP17gwZ0asIT3MKIxSZ19r RQ== 
Received: from aserp3030.oracle.com (aserp3030.oracle.com [141.146.126.71])
 by mx0b-00069f02.pphosted.com with ESMTP id 3bg3p5hcx1-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 05 Oct 2021 16:46:50 +0000
Received: from pps.filterd (aserp3030.oracle.com [127.0.0.1])
 by aserp3030.oracle.com (8.16.1.2/8.16.1.2) with SMTP id 195Gjv0e155259;
 Tue, 5 Oct 2021 16:46:41 GMT
Received: from nam02-sn1-obe.outbound.protection.outlook.com
 (mail-sn1anam02lp2043.outbound.protection.outlook.com [104.47.57.43])
 by aserp3030.oracle.com with ESMTP id 3bev7thd96-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 05 Oct 2021 16:46:41 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GRi3a4vu5JU+ZXWFiALNNhjs4cgCNifJmwPdC5A7uxRgo++EI+sGRVfyriKwOP0kbU25kbvDfmmDoj4T4NAl+Gm+60FtR/hAfQm2imCF/hL8m5zEd9lnOqKRww0ZXLBazutsspHbgI7R9/fn0kEfo4ZX4jwAXUZ9qYjoN/bsVVlgItb2FXdxj7MmD6CwK4Yn1TbfGktouseD1l4ypp5Q3ajmtqQqPuq6uLSulvEq5yKgZUwYNsGoiNZB6ijzThRgH3XD2TpEnS0Wu1ITaR9AVdpz+bICf1Lc/k8lAgksWZBK+Z2LQNkxnPnW+nBd8HUck7V83r4icNCsW0x2RDAwGg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KoUAhktZOcJNqj0R2kE0BKweU0VEGyj601XzNw4/aXU=;
 b=AaxHrukpy18K+weK90NvTVuDfiUzxYOJY6du61PCfxyezVve29bG/5LDZrLa+sl9LoPG8RfXPCT4zxdTfst5hwxEgylg329/vWPa1gGBiJWhvVPYZLnYFI+/ggOiPouGWTMymjzM7uozRU47sI19skFEj4fT+wGl9zqEpEgwHlexB9xRO9tYp+kJy+LG9Q5r31VPax2aS3U+kEaM3z9yyhwJAG59cMFuI7tm0OdzJkUOuilWIq3aYuxpd0o6Y6LixYhoECgwIRk0ZSfV/Nv4XAei2C2JNFIQn99su0aZQO6VXw39kfV0r/OpyyUYwZg5ZWB6UvRQzOEa4NfNR1RNZQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KoUAhktZOcJNqj0R2kE0BKweU0VEGyj601XzNw4/aXU=;
 b=t0ZHyjRxMblD7G516PO1Hp4HjgLjrqvngVnGJ63xgvcKs1cq+ISJABTS+WS5JxxrkOInuQobJFB/j/txpswf/yt42LMNNeCrAzaJXVGHXzeoqP1vV7BnMIUc/7TNfTNb7qUQzMZFIlzZoMANgEv6H6bqKGb8Npowp9p4klX49BA=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=oracle.com;
Received: from SA2PR10MB4667.namprd10.prod.outlook.com (2603:10b6:806:111::21)
 by SN6PR10MB2942.namprd10.prod.outlook.com (2603:10b6:805:d7::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4566.15; Tue, 5 Oct
 2021 16:46:38 +0000
Received: from SA2PR10MB4667.namprd10.prod.outlook.com
 ([fe80::95e7:72:edfe:3da9]) by SA2PR10MB4667.namprd10.prod.outlook.com
 ([fe80::95e7:72:edfe:3da9%8]) with mapi id 15.20.4566.022; Tue, 5 Oct 2021
 16:46:38 +0000
From: Jonah Palmer <jonah.palmer@oracle.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v7 5/8] qmp: decode feature & status bits in virtio-status
Date: Tue,  5 Oct 2021 12:45:50 -0400
Message-Id: <1633452353-7169-6-git-send-email-jonah.palmer@oracle.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1633452353-7169-1-git-send-email-jonah.palmer@oracle.com>
References: <1633452353-7169-1-git-send-email-jonah.palmer@oracle.com>
Content-Type: text/plain
X-ClientProxiedBy: SN7PR04CA0095.namprd04.prod.outlook.com
 (2603:10b6:806:122::10) To SA2PR10MB4667.namprd10.prod.outlook.com
 (2603:10b6:806:111::21)
MIME-Version: 1.0
Received: from jonpalme-lnx.us.oracle.com (209.17.40.39) by
 SN7PR04CA0095.namprd04.prod.outlook.com (2603:10b6:806:122::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4587.18 via Frontend
 Transport; Tue, 5 Oct 2021 16:46:36 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 5a70a69c-d01d-489c-aa99-08d9881fb312
X-MS-TrafficTypeDiagnostic: SN6PR10MB2942:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <SN6PR10MB29427E84AD48D1E91F968C64E8AF9@SN6PR10MB2942.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:175;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: U6cH1ERWJc3+e81YQfF47mzgc2PrqS4LitzD61zihMKZSv4YMXoeamKXGxgilGt1LoUgxlr4wAksJSewHECDGEcJLkyNsREoAnI0DGFIBY2YzLlDNXcL3+TjtwXg89/Hnt2f7Lr+6BiNj+Q1Q7/5IUTKMBJdIXG7Yfmn0pp9tcnGWYgClwWNM69NYFdvuQE3eN984BbLtFBO30TOCSYP7ZAyGn1ZptkgmXHQIvX8yLRL1pQtztGz+cbYCOJLsyj3f3QpP5aYlo3rL+nzsO0VlOGUfinIeWsqd2BzXIBI5+6sMpLQi8uD5PbXzca5eB5f26IvIzkTfZofdkWubj8UNVQ9DT2NNtmLB6WhYbLUIZsJsfZteFrBMRoY/ti53h2PtJSXJjIs8XWLYm+9A5gjd65Owrbahjs9f92q+zBvniyYOsxb9Ov4Phk7FnTPLgXbhPfQC6jYiGG1TzOyWEf7FVPuDwwJ1X2QZN6PfujDjOGuNPkeLrNQvCAS8wjRdMqNj4ZBOrVKRF4Yj2UbK9/HBtP2pQokyq6fSDAsm5emIsxD/RHFEx+QRx3+ZdvHKJn/2Cf+RtdyrRywFMuhOlB8EBfVfULCMfdx7c86LN72RF8Z0pySKiwb7HWBRqgX8XR0qLY33x66r7OdJxp/3JqAAzJbk7Dov5E5njPHuscjNiFoELhlDkCyf62l9OfrH32gK0eRoXTVzBsm41GqXujgKA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SA2PR10MB4667.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(6666004)(5660300002)(66476007)(66556008)(83380400001)(6486002)(508600001)(6916009)(4326008)(66946007)(8936002)(7416002)(86362001)(956004)(2616005)(26005)(316002)(7696005)(52116002)(44832011)(2906002)(8676002)(36756003)(38350700002)(38100700002)(186003)(30864003)(579004);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?DSOuHKx8V78ogzXW4/I2JkJq1U+Kcvxrq4bn05kUmM1bRSEDTn/IO112uNGX?=
 =?us-ascii?Q?gcSCEz9rNwe9cXSYfbL7wgJucR/I+F51vctwUdhWlYxnDhLp9s3zvaIfYoWc?=
 =?us-ascii?Q?Q3rAG4l4IkoyGU7XbfH8hawtcerV3xqMdaqGs+L4Eix8X7aTZqXS2aEJgQSn?=
 =?us-ascii?Q?zW8b3Ds0rJQnuZQ3KBbvMHJKEqZ4Aa8oio7B/WriqIDqXDYkLOKXyI8Oz2fZ?=
 =?us-ascii?Q?JofWZMhPOrthnMblHWfINy2EvwRUlghu1NNWVi+rlRYbbnX8GRPAtsr70JkS?=
 =?us-ascii?Q?W+Xq51N9gAvHKcy8l6i2fQDhRs8dCRlodcE9xQDG/JCylUvigjzzLDCt2ZKR?=
 =?us-ascii?Q?UjYDB0ceayER3BCWH26Uz4GrIjeezk+rVPK38FfX5ROJRrvD0oHzPYH1onyQ?=
 =?us-ascii?Q?HNmIJEWhGLtLbFKMKXv6jda69wOhcxJdBfKH0kSk9CxmYq7kl+VGmpNiStir?=
 =?us-ascii?Q?VuTdXgTj3COko6l8SH79KybfwqBuaw6eXxbX2RtuTp0rBId0U2Y2kQvn3ojq?=
 =?us-ascii?Q?pIVEo6mPsZTf/LRzAM80kN3oQWwVv9YmHKYZArtu5Et4FGYFIfBEcKkZfpDo?=
 =?us-ascii?Q?6vVzFjBOq3LQdepDfHZZqHh9dcvUa67JqBuc9dEEYtxJSMyvNcvsHq/AYNDd?=
 =?us-ascii?Q?pz2ooFYJdsk1KBjwP4a1BX4sc22YSbpZcqZRwhmwn3oS/yVGY8lA1xoXN/Qr?=
 =?us-ascii?Q?Cv6oA9epHwD1X8I3fBRzc5ATrpGdAUO/7bC2yYYDgBjlyO17dbCM9dNFZ5IB?=
 =?us-ascii?Q?CEz454pKr/+Sayv8tRAPcBci562Thr1Q8masQpmwiN3mVLfRHqfQ/7KxNY6Y?=
 =?us-ascii?Q?/UArYUvePwyoFssqSZ8VU0axd3ImzbeRil243jTNzVkOjp+orD6ko6kzNIXK?=
 =?us-ascii?Q?Sq33eTHt+NeIss/zqJcjcfM0U6zCNwFRkELugRiRsqZHQM3KtWNYDBEh9XL5?=
 =?us-ascii?Q?Qgx/NYkpYdfCv15wpFpwu+e90LTREW+0mpShtX47kFQK3P2JJuJKIL5T7ob9?=
 =?us-ascii?Q?wGbvFWJP1oVUwMoqy6dCKXTJra/GpTYw7PnMWdDgs4NcRqA+sC/VnQWBHWl5?=
 =?us-ascii?Q?gNlyeChmMQf/aO30dz75C037q4aiXQ2VqBSBU54/mNcWdGi/azwkezJNVf29?=
 =?us-ascii?Q?aMI9fxY/e1Wh5MPovIfDqKF6qKCSVOg7Qu7Pdu1cFElSPzbA1Yp84Gxqall9?=
 =?us-ascii?Q?0XAZLZDhWFkH4YNn7vpuR/Ve2KrUfFjLiEXp74Jm31528MQJKQrhlMM6xZ2b?=
 =?us-ascii?Q?YlZS0evvM1jE79oxdhB7BsLq0p2RPPamD6wX9A322xYlDzLpDBO3gvZNAdWH?=
 =?us-ascii?Q?ZZMjo2aqJWxcigB5xx2cvRuF?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5a70a69c-d01d-489c-aa99-08d9881fb312
X-MS-Exchange-CrossTenant-AuthSource: SA2PR10MB4667.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Oct 2021 16:46:38.1544 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: GeVxarQCxH+VIp/xRql1Ly6Gc47cntQ4o5TZ1tTUsuCKWjMZ+USDdbF4Z6KCPfpV5w4Q2tVaZZ+zu/ANJTZ5aA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR10MB2942
X-Proofpoint-Virus-Version: vendor=nai engine=6300 definitions=10128
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxscore=0
 mlxlogscore=999 adultscore=0
 bulkscore=0 suspectscore=0 malwarescore=0 spamscore=0 phishscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2109230001
 definitions=main-2110050100
X-Proofpoint-ORIG-GUID: AHL8VcN21uLd5bKrvQ-CKGPaMd8kJFC8
X-Proofpoint-GUID: AHL8VcN21uLd5bKrvQ-CKGPaMd8kJFC8
Received-SPF: pass client-ip=205.220.165.32;
 envelope-from=jonah.palmer@oracle.com; helo=mx0a-00069f02.pphosted.com
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
Cc: fam@euphon.net, mst@redhat.com, kraxel@redhat.com, si-wei.liu@oracle.com,
 joao.m.martins@oracle.com, raphael.norwitz@nutanix.com, qemu-block@nongnu.org,
 david@redhat.com, armbru@redhat.com, marcandre.lureau@redhat.com,
 thuth@redhat.com, amit@kernel.org, michael.roth@amd.com, dgilbert@redhat.com,
 eric.auger@redhat.com, dmitrii.stepanov@cloud.ionos.com, stefanha@redhat.com,
 boris.ostrovsky@oracle.com, kwolf@redhat.com, laurent@vivier.eu,
 mreitz@redhat.com, jasonwang@redhat.com, pbonzini@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Laurent Vivier <lvivier@redhat.com>

Display feature names instead of bitmaps for host, guest, and
backend for VirtIODevice.

Display status names instead of bitmaps for VirtIODevice.

Display feature names instead of bitmaps for backend, protocol,
acked, and features (hdev->features) for vhost devices.

Decode features according to device type. Decode status
according to configuration status bitmap (config_status_map).
Decode vhost user protocol features according to vhost user
protocol bitmap (vhost_user_protocol_map).

Transport features are on the first line. Undecoded bits
(if any) are stored in a separate field. Vhost device field
wont show if there's no vhost active for a given VirtIODevice.

Signed-off-by: Jonah Palmer <jonah.palmer@oracle.com>
---
 hw/block/virtio-blk.c          |  28 ++
 hw/char/virtio-serial-bus.c    |  11 +
 hw/display/virtio-gpu-base.c   |  18 +-
 hw/input/virtio-input.c        |  11 +-
 hw/net/virtio-net.c            |  47 ++++
 hw/scsi/virtio-scsi.c          |  17 ++
 hw/virtio/vhost-user-fs.c      |  10 +
 hw/virtio/vhost-vsock-common.c |  10 +
 hw/virtio/virtio-balloon.c     |  14 +
 hw/virtio/virtio-crypto.c      |  10 +
 hw/virtio/virtio-iommu.c       |  14 +
 hw/virtio/virtio.c             | 273 +++++++++++++++++++-
 include/hw/virtio/vhost.h      |   3 +
 include/hw/virtio/virtio.h     |  17 ++
 qapi/virtio.json               | 574 ++++++++++++++++++++++++++++++++++++++---
 15 files changed, 1012 insertions(+), 45 deletions(-)

 [Jonah: Added vhost feature 'LOG_ALL' to all virtio feature maps for
  virtio devices who can use vhost. This includes virtio/vhost devices
  that previously did not have a feature map defined, such as
  virtio-input, vhost-user-fs, vhost-vsock, and virtio-crypto.

  Defined an enumeration and mapping of vhost user protocol features
  in virtio.c for decoding vhost user protocol features. Support to
  decode vhost user protocol features added.

  Added support to also decode VirtIODevice status bits via. a mapping
  of virtio config statuses.

  Needed to define a list of QAPI enumerations of virtio device types
  here because we can't discriminate the virtio device type in
  VirtioDeviceFeatures QAPI union based on a 'str' QAPI type.] 

diff --git a/hw/block/virtio-blk.c b/hw/block/virtio-blk.c
index 505e574..c2e901f 100644
--- a/hw/block/virtio-blk.c
+++ b/hw/block/virtio-blk.c
@@ -13,6 +13,7 @@
 
 #include "qemu/osdep.h"
 #include "qapi/error.h"
+#include "qapi/qapi-visit-virtio.h"
 #include "qemu/iov.h"
 #include "qemu/module.h"
 #include "qemu/error-report.h"
@@ -32,6 +33,7 @@
 #include "hw/virtio/virtio-bus.h"
 #include "migration/qemu-file-types.h"
 #include "hw/virtio/virtio-access.h"
+#include "standard-headers/linux/vhost_types.h"
 
 /* Config size before the discard support (hide associated config fields) */
 #define VIRTIO_BLK_CFG_SIZE offsetof(struct virtio_blk_config, \
@@ -48,6 +50,32 @@ static const VirtIOFeature feature_sizes[] = {
     {}
 };
 
+qmp_virtio_feature_map_t blk_map[] = {
+#define FEATURE_ENTRY(name) \
+    { VIRTIO_BLK_F_##name, VIRTIO_BLK_FEATURE_##name }
+    FEATURE_ENTRY(SIZE_MAX),
+    FEATURE_ENTRY(SEG_MAX),
+    FEATURE_ENTRY(GEOMETRY),
+    FEATURE_ENTRY(RO),
+    FEATURE_ENTRY(BLK_SIZE),
+    FEATURE_ENTRY(TOPOLOGY),
+    FEATURE_ENTRY(MQ),
+    FEATURE_ENTRY(DISCARD),
+    FEATURE_ENTRY(WRITE_ZEROES),
+#ifndef VIRTIO_BLK_NO_LEGACY
+    FEATURE_ENTRY(BARRIER),
+    FEATURE_ENTRY(SCSI),
+    FEATURE_ENTRY(FLUSH),
+    FEATURE_ENTRY(CONFIG_WCE),
+#endif /* !VIRTIO_BLK_NO_LEGACY */
+#undef FEATURE_ENTRY
+#define FEATURE_ENTRY(name) \
+    { VHOST_F_##name, VIRTIO_BLK_FEATURE_##name }
+    FEATURE_ENTRY(LOG_ALL),
+#undef FEATURE_ENTRY
+    { -1, -1 }
+};
+
 static void virtio_blk_set_config_size(VirtIOBlock *s, uint64_t host_features)
 {
     s->config_size = MAX(VIRTIO_BLK_CFG_SIZE,
diff --git a/hw/char/virtio-serial-bus.c b/hw/char/virtio-serial-bus.c
index 746c92b..f91418b 100644
--- a/hw/char/virtio-serial-bus.c
+++ b/hw/char/virtio-serial-bus.c
@@ -20,6 +20,7 @@
 
 #include "qemu/osdep.h"
 #include "qapi/error.h"
+#include "qapi/qapi-visit-virtio.h"
 #include "qemu/iov.h"
 #include "qemu/main-loop.h"
 #include "qemu/module.h"
@@ -32,6 +33,16 @@
 #include "hw/virtio/virtio-serial.h"
 #include "hw/virtio/virtio-access.h"
 
+qmp_virtio_feature_map_t serial_map[] = {
+#define FEATURE_ENTRY(name) \
+    { VIRTIO_CONSOLE_F_##name, VIRTIO_SERIAL_FEATURE_##name }
+    FEATURE_ENTRY(SIZE),
+    FEATURE_ENTRY(MULTIPORT),
+    FEATURE_ENTRY(EMERG_WRITE),
+#undef FEATURE_ENTRY
+    { -1, -1 }
+};
+
 static struct VirtIOSerialDevices {
     QLIST_HEAD(, VirtIOSerial) devices;
 } vserdevices;
diff --git a/hw/display/virtio-gpu-base.c b/hw/display/virtio-gpu-base.c
index 5411a7b..a322349 100644
--- a/hw/display/virtio-gpu-base.c
+++ b/hw/display/virtio-gpu-base.c
@@ -12,13 +12,29 @@
  */
 
 #include "qemu/osdep.h"
-
+#include "standard-headers/linux/vhost_types.h"
 #include "hw/virtio/virtio-gpu.h"
 #include "migration/blocker.h"
 #include "qapi/error.h"
+#include "qapi/qapi-visit-virtio.h"
 #include "qemu/error-report.h"
 #include "trace.h"
 
+qmp_virtio_feature_map_t gpu_map[] = {
+#define FEATURE_ENTRY(name) \
+    { VIRTIO_GPU_F_##name, VIRTIO_GPU_FEATURE_##name }
+    FEATURE_ENTRY(VIRGL),
+    FEATURE_ENTRY(EDID),
+    FEATURE_ENTRY(RESOURCE_UUID),
+    FEATURE_ENTRY(RESOURCE_BLOB),
+#undef FEATURE_ENTRY
+#define FEATURE_ENTRY(name) \
+    { VHOST_F_##name, VIRTIO_GPU_FEATURE_##name }
+    FEATURE_ENTRY(LOG_ALL),
+#undef FEATURE_ENTRY
+    { -1, -1 }
+};
+
 void
 virtio_gpu_base_reset(VirtIOGPUBase *g)
 {
diff --git a/hw/input/virtio-input.c b/hw/input/virtio-input.c
index 5b5398b..b4562a3 100644
--- a/hw/input/virtio-input.c
+++ b/hw/input/virtio-input.c
@@ -6,6 +6,7 @@
 
 #include "qemu/osdep.h"
 #include "qapi/error.h"
+#include "qapi/qapi-visit-virtio.h"
 #include "qemu/iov.h"
 #include "qemu/module.h"
 #include "trace.h"
@@ -13,11 +14,19 @@
 #include "hw/virtio/virtio.h"
 #include "hw/qdev-properties.h"
 #include "hw/virtio/virtio-input.h"
-
+#include "standard-headers/linux/vhost_types.h"
 #include "standard-headers/linux/input.h"
 
 #define VIRTIO_INPUT_VM_VERSION 1
 
+qmp_virtio_feature_map_t input_map[] = {
+#define FEATURE_ENTRY(name) \
+    { VHOST_F_##name, VIRTIO_INPUT_FEATURE_##name }
+    FEATURE_ENTRY(LOG_ALL),
+#undef FEATURE_ENTRY
+    { -1, -1 }
+};
+
 /* ----------------------------------------------------------------- */
 
 void virtio_input_send(VirtIOInput *vinput, virtio_input_event *event)
diff --git a/hw/net/virtio-net.c b/hw/net/virtio-net.c
index 6e54436..413aa58 100644
--- a/hw/net/virtio-net.c
+++ b/hw/net/virtio-net.c
@@ -35,9 +35,11 @@
 #include "hw/qdev-properties.h"
 #include "qapi/qapi-types-migration.h"
 #include "qapi/qapi-events-migration.h"
+#include "qapi/qapi-visit-virtio.h"
 #include "hw/virtio/virtio-access.h"
 #include "migration/misc.h"
 #include "standard-headers/linux/ethtool.h"
+#include "standard-headers/linux/vhost_types.h"
 #include "sysemu/sysemu.h"
 #include "trace.h"
 #include "monitor/qdev.h"
@@ -89,6 +91,51 @@
                                          VIRTIO_NET_RSS_HASH_TYPE_TCP_EX | \
                                          VIRTIO_NET_RSS_HASH_TYPE_UDP_EX)
 
+qmp_virtio_feature_map_t net_map[] = {
+#define FEATURE_ENTRY(name) \
+    { VIRTIO_NET_F_##name, VIRTIO_NET_FEATURE_##name }
+    FEATURE_ENTRY(CSUM),
+    FEATURE_ENTRY(GUEST_CSUM),
+    FEATURE_ENTRY(CTRL_GUEST_OFFLOADS),
+    FEATURE_ENTRY(MTU),
+    FEATURE_ENTRY(MAC),
+    FEATURE_ENTRY(GUEST_TSO4),
+    FEATURE_ENTRY(GUEST_TSO6),
+    FEATURE_ENTRY(GUEST_ECN),
+    FEATURE_ENTRY(GUEST_UFO),
+    FEATURE_ENTRY(HOST_TSO4),
+    FEATURE_ENTRY(HOST_TSO6),
+    FEATURE_ENTRY(HOST_ECN),
+    FEATURE_ENTRY(HOST_UFO),
+    FEATURE_ENTRY(MRG_RXBUF),
+    FEATURE_ENTRY(STATUS),
+    FEATURE_ENTRY(CTRL_VQ),
+    FEATURE_ENTRY(CTRL_RX),
+    FEATURE_ENTRY(CTRL_VLAN),
+    FEATURE_ENTRY(CTRL_RX_EXTRA),
+    FEATURE_ENTRY(GUEST_ANNOUNCE),
+    FEATURE_ENTRY(MQ),
+    FEATURE_ENTRY(CTRL_MAC_ADDR),
+    FEATURE_ENTRY(HASH_REPORT),
+    FEATURE_ENTRY(RSS),
+    FEATURE_ENTRY(RSC_EXT),
+    FEATURE_ENTRY(STANDBY),
+    FEATURE_ENTRY(SPEED_DUPLEX),
+#ifndef VIRTIO_NET_NO_LEGACY
+    FEATURE_ENTRY(GSO),
+#endif /* VIRTIO_NET_NO_LEGACY */
+#undef FEATURE_ENTRY
+#define FEATURE_ENTRY(name) \
+    { VHOST_NET_F_##name, VIRTIO_NET_FEATURE_##name }
+    FEATURE_ENTRY(VIRTIO_NET_HDR),
+#undef FEATURE_ENTRY
+#define FEATURE_ENTRY(name) \
+    { VHOST_F_##name, VIRTIO_NET_FEATURE_##name }
+    FEATURE_ENTRY(LOG_ALL),
+#undef FEATURE_ENTRY
+    { -1, -1 }
+};
+
 static const VirtIOFeature feature_sizes[] = {
     {.flags = 1ULL << VIRTIO_NET_F_MAC,
      .end = endof(struct virtio_net_config, mac)},
diff --git a/hw/scsi/virtio-scsi.c b/hw/scsi/virtio-scsi.c
index 404a59f..e1f005d 100644
--- a/hw/scsi/virtio-scsi.c
+++ b/hw/scsi/virtio-scsi.c
@@ -15,7 +15,9 @@
 
 #include "qemu/osdep.h"
 #include "qapi/error.h"
+#include "qapi/qapi-visit-virtio.h"
 #include "standard-headers/linux/virtio_ids.h"
+#include "standard-headers/linux/vhost_types.h"
 #include "hw/virtio/virtio-scsi.h"
 #include "migration/qemu-file-types.h"
 #include "qemu/error-report.h"
@@ -29,6 +31,21 @@
 #include "hw/virtio/virtio-access.h"
 #include "trace.h"
 
+qmp_virtio_feature_map_t scsi_map[] = {
+#define FEATURE_ENTRY(name) \
+    { VIRTIO_SCSI_F_##name, VIRTIO_SCSI_FEATURE_##name }
+    FEATURE_ENTRY(INOUT),
+    FEATURE_ENTRY(HOTPLUG),
+    FEATURE_ENTRY(CHANGE),
+    FEATURE_ENTRY(T10_PI),
+#undef FEATURE_ENTRY
+#define FEATURE_ENTRY(name) \
+    { VHOST_F_##name, VIRTIO_SCSI_FEATURE_##name }
+    FEATURE_ENTRY(LOG_ALL),
+#undef FEATURE_ENTRY
+    { -1, -1 }
+};
+
 static inline int virtio_scsi_get_lun(uint8_t *lun)
 {
     return ((lun[2] << 8) | lun[3]) & 0x3FFF;
diff --git a/hw/virtio/vhost-user-fs.c b/hw/virtio/vhost-user-fs.c
index e513e4f..092c3fa 100644
--- a/hw/virtio/vhost-user-fs.c
+++ b/hw/virtio/vhost-user-fs.c
@@ -15,6 +15,7 @@
 #include <sys/ioctl.h>
 #include "standard-headers/linux/virtio_fs.h"
 #include "qapi/error.h"
+#include "qapi/qapi-visit-virtio.h"
 #include "hw/qdev-properties.h"
 #include "hw/qdev-properties-system.h"
 #include "hw/virtio/virtio-bus.h"
@@ -23,6 +24,15 @@
 #include "hw/virtio/vhost-user-fs.h"
 #include "monitor/monitor.h"
 #include "sysemu/sysemu.h"
+#include "standard-headers/linux/vhost_types.h"
+
+qmp_virtio_feature_map_t fs_map[] = {
+#define FEATURE_ENTRY(name) \
+    { VHOST_F_##name, VHOST_USER_FS_FEATURE_##name }
+    FEATURE_ENTRY(LOG_ALL),
+#undef FEATURE_ENTRY
+    { -1, -1 }
+};
 
 static const int user_feature_bits[] = {
     VIRTIO_F_VERSION_1,
diff --git a/hw/virtio/vhost-vsock-common.c b/hw/virtio/vhost-vsock-common.c
index e668d4d..8f168a7 100644
--- a/hw/virtio/vhost-vsock-common.c
+++ b/hw/virtio/vhost-vsock-common.c
@@ -11,12 +11,22 @@
 #include "qemu/osdep.h"
 #include "standard-headers/linux/virtio_vsock.h"
 #include "qapi/error.h"
+#include "qapi/qapi-visit-virtio.h"
 #include "hw/virtio/virtio-access.h"
 #include "qemu/error-report.h"
 #include "hw/qdev-properties.h"
 #include "hw/virtio/vhost-vsock.h"
 #include "qemu/iov.h"
 #include "monitor/monitor.h"
+#include "standard-headers/linux/vhost_types.h"
+
+qmp_virtio_feature_map_t vsock_map[] = {
+#define FEATURE_ENTRY(name) \
+    { VHOST_F_##name, VHOST_VSOCK_FEATURE_##name }
+    FEATURE_ENTRY(LOG_ALL),
+#undef FEATURE_ENTRY
+    { -1, -1 }
+};
 
 int vhost_vsock_common_start(VirtIODevice *vdev)
 {
diff --git a/hw/virtio/virtio-balloon.c b/hw/virtio/virtio-balloon.c
index 74f6fd3..226260e 100644
--- a/hw/virtio/virtio-balloon.c
+++ b/hw/virtio/virtio-balloon.c
@@ -27,6 +27,7 @@
 #include "qapi/error.h"
 #include "qapi/qapi-events-machine.h"
 #include "qapi/visitor.h"
+#include "qapi/qapi-visit-virtio.h"
 #include "trace.h"
 #include "qemu/error-report.h"
 #include "migration/misc.h"
@@ -37,6 +38,19 @@
 
 #define BALLOON_PAGE_SIZE  (1 << VIRTIO_BALLOON_PFN_SHIFT)
 
+qmp_virtio_feature_map_t balloon_map[] = {
+#define FEATURE_ENTRY(name) \
+    { VIRTIO_BALLOON_F_##name, VIRTIO_BALLOON_FEATURE_##name }
+    FEATURE_ENTRY(MUST_TELL_HOST),
+    FEATURE_ENTRY(STATS_VQ),
+    FEATURE_ENTRY(DEFLATE_ON_OOM),
+    FEATURE_ENTRY(FREE_PAGE_HINT),
+    FEATURE_ENTRY(PAGE_POISON),
+    FEATURE_ENTRY(REPORTING),
+#undef FEATURE_ENTRY
+    { -1, -1 }
+};
+
 typedef struct PartiallyBalloonedPage {
     ram_addr_t base_gpa;
     unsigned long *bitmap;
diff --git a/hw/virtio/virtio-crypto.c b/hw/virtio/virtio-crypto.c
index 7d63b8c..f626ba8 100644
--- a/hw/virtio/virtio-crypto.c
+++ b/hw/virtio/virtio-crypto.c
@@ -16,6 +16,7 @@
 #include "qemu/main-loop.h"
 #include "qemu/module.h"
 #include "qapi/error.h"
+#include "qapi/qapi-visit-virtio.h"
 #include "qemu/error-report.h"
 
 #include "hw/virtio/virtio.h"
@@ -23,10 +24,19 @@
 #include "hw/qdev-properties.h"
 #include "hw/virtio/virtio-access.h"
 #include "standard-headers/linux/virtio_ids.h"
+#include "standard-headers/linux/vhost_types.h"
 #include "sysemu/cryptodev-vhost.h"
 
 #define VIRTIO_CRYPTO_VM_VERSION 1
 
+qmp_virtio_feature_map_t crypto_map[] = {
+#define FEATURE_ENTRY(name) \
+    { VHOST_F_##name, VIRTIO_CRYPTO_FEATURE_##name }
+    FEATURE_ENTRY(LOG_ALL),
+#undef FEATURE_ENTRY
+    { -1, -1 }
+};
+
 /*
  * Transfer virtqueue index to crypto queue index.
  * The control virtqueue is after the data virtqueues
diff --git a/hw/virtio/virtio-iommu.c b/hw/virtio/virtio-iommu.c
index 92c5eb7..9a09293 100644
--- a/hw/virtio/virtio-iommu.c
+++ b/hw/virtio/virtio-iommu.c
@@ -25,6 +25,7 @@
 #include "hw/virtio/virtio.h"
 #include "sysemu/kvm.h"
 #include "qapi/error.h"
+#include "qapi/qapi-visit-virtio.h"
 #include "qemu/error-report.h"
 #include "trace.h"
 
@@ -40,6 +41,19 @@
 #define VIOMMU_DEFAULT_QUEUE_SIZE 256
 #define VIOMMU_PROBE_SIZE 512
 
+qmp_virtio_feature_map_t iommu_map[] = {
+#define FEATURE_ENTRY(name) \
+    { VIRTIO_IOMMU_F_##name, VIRTIO_IOMMU_FEATURE_##name }
+    FEATURE_ENTRY(INPUT_RANGE),
+    FEATURE_ENTRY(DOMAIN_RANGE),
+    FEATURE_ENTRY(MAP_UNMAP),
+    FEATURE_ENTRY(BYPASS),
+    FEATURE_ENTRY(PROBE),
+    FEATURE_ENTRY(MMIO),
+#undef FEATURE_ENTRY
+    { -1, -1 }
+};
+
 typedef struct VirtIOIOMMUDomain {
     uint32_t id;
     GTree *mappings;
diff --git a/hw/virtio/virtio.c b/hw/virtio/virtio.c
index 04a44e8..f0e2b40 100644
--- a/hw/virtio/virtio.c
+++ b/hw/virtio/virtio.c
@@ -30,11 +30,100 @@
 #include "sysemu/dma.h"
 #include "sysemu/runstate.h"
 #include "standard-headers/linux/virtio_ids.h"
+#include "standard-headers/linux/vhost_types.h"
+#include CONFIG_DEVICES
 
 /* QAPI list of VirtIODevices */
 static QTAILQ_HEAD(, VirtIODevice) virtio_list;
 
 /*
+ * Maximum size of virtio device config space
+ */
+#define VHOST_USER_MAX_CONFIG_SIZE 256
+
+enum VhostUserProtocolFeature {
+    VHOST_USER_PROTOCOL_F_MQ = 0,
+    VHOST_USER_PROTOCOL_F_LOG_SHMFD = 1,
+    VHOST_USER_PROTOCOL_F_RARP = 2,
+    VHOST_USER_PROTOCOL_F_REPLY_ACK = 3,
+    VHOST_USER_PROTOCOL_F_NET_MTU = 4,
+    VHOST_USER_PROTOCOL_F_SLAVE_REQ = 5,
+    VHOST_USER_PROTOCOL_F_CROSS_ENDIAN = 6,
+    VHOST_USER_PROTOCOL_F_CRYPTO_SESSION = 7,
+    VHOST_USER_PROTOCOL_F_PAGEFAULT = 8,
+    VHOST_USER_PROTOCOL_F_CONFIG = 9,
+    VHOST_USER_PROTOCOL_F_SLAVE_SEND_FD = 10,
+    VHOST_USER_PROTOCOL_F_HOST_NOTIFIER = 11,
+    VHOST_USER_PROTOCOL_F_INFLIGHT_SHMFD = 12,
+    VHOST_USER_PROTOCOL_F_RESET_DEVICE = 13,
+    VHOST_USER_PROTOCOL_F_INBAND_NOTIFICATIONS = 14,
+    VHOST_USER_PROTOCOL_F_CONFIGURE_MEM_SLOTS = 15,
+    VHOST_USER_PROTOCOL_F_MAX
+};
+
+static qmp_virtio_feature_map_t transport_map[] = {
+#define FEATURE_ENTRY(name) \
+    { VIRTIO_F_##name, VIRTIO_TRANSPORT_FEATURE_##name }
+#ifndef VIRTIO_CONFIG_NO_LEGACY
+    FEATURE_ENTRY(NOTIFY_ON_EMPTY),
+    FEATURE_ENTRY(ANY_LAYOUT),
+#endif /* VIRTIO_CONFIG_NO_LEGACY */
+    FEATURE_ENTRY(VERSION_1),
+    FEATURE_ENTRY(IOMMU_PLATFORM),
+    FEATURE_ENTRY(RING_PACKED),
+    FEATURE_ENTRY(ORDER_PLATFORM),
+    FEATURE_ENTRY(SR_IOV),
+#undef FEATURE_ENTRY
+#define FEATURE_ENTRY(name) \
+    { VIRTIO_RING_F_##name, VIRTIO_TRANSPORT_FEATURE_##name }
+    FEATURE_ENTRY(INDIRECT_DESC),
+    FEATURE_ENTRY(EVENT_IDX),
+#undef FEATURE_ENTRY
+#define FEATURE_ENTRY(name) \
+    { VHOST_USER_F_##name, VIRTIO_TRANSPORT_FEATURE_##name }
+    FEATURE_ENTRY(PROTOCOL_FEATURES),
+#undef FEATURE_ENTRY
+    { -1, -1 }
+};
+
+static qmp_virtio_feature_map_t vhost_user_protocol_map[] = {
+#define FEATURE_ENTRY(name) \
+    { VHOST_USER_PROTOCOL_F_##name, VHOST_PROTOCOL_FEATURE_##name }
+    FEATURE_ENTRY(MQ),
+    FEATURE_ENTRY(LOG_SHMFD),
+    FEATURE_ENTRY(RARP),
+    FEATURE_ENTRY(REPLY_ACK),
+    FEATURE_ENTRY(NET_MTU),
+    FEATURE_ENTRY(SLAVE_REQ),
+    FEATURE_ENTRY(CROSS_ENDIAN),
+    FEATURE_ENTRY(CRYPTO_SESSION),
+    FEATURE_ENTRY(PAGEFAULT),
+    FEATURE_ENTRY(CONFIG),
+    FEATURE_ENTRY(SLAVE_SEND_FD),
+    FEATURE_ENTRY(HOST_NOTIFIER),
+    FEATURE_ENTRY(INFLIGHT_SHMFD),
+    FEATURE_ENTRY(RESET_DEVICE),
+    FEATURE_ENTRY(INBAND_NOTIFICATIONS),
+    FEATURE_ENTRY(CONFIGURE_MEM_SLOTS),
+#undef FEATURE_ENTRY
+    { -1, -1 }
+};
+
+/* virtio device configuration statuses */
+static qmp_virtio_feature_map_t config_status_map[] = {
+#define STATUS_ENTRY(name) \
+    { VIRTIO_CONFIG_S_##name, VIRTIO_CONFIG_STATUS_##name }
+    STATUS_ENTRY(DRIVER_OK),
+    STATUS_ENTRY(FEATURES_OK),
+    STATUS_ENTRY(DRIVER),
+    STATUS_ENTRY(NEEDS_RESET),
+    STATUS_ENTRY(FAILED),
+    STATUS_ENTRY(ACKNOWLEDGE),
+#undef STATUS_ENTRY
+    { -1, -1 }
+};
+
+/*
  * The alignment to use between consumer and producer parts of vring.
  * x86 pagesize again. This is the default, used by transports like PCI
  * which don't provide a means for the guest to tell the host the alignment.
@@ -3949,6 +4038,164 @@ static VirtIODevice *virtio_device_find(const char *path)
     return NULL;
 }
 
+#define CONVERT_FEATURES(type, map, is_status)      \
+    ({                                              \
+        type *list = NULL;                          \
+        type *node;                                 \
+        for (i = 0; map[i].virtio_bit != -1; i++) { \
+            if (is_status) {                        \
+                bit = map[i].virtio_bit;            \
+            }                                       \
+            else {                                  \
+                bit = 1ULL << map[i].virtio_bit;    \
+            }                                       \
+            if ((bitmap & bit) == 0) {              \
+                continue;                           \
+            }                                       \
+            node = g_new0(type, 1);                 \
+            node->value = map[i].qapi_virtio_enum;  \
+            node->next = list;                      \
+            list = node;                            \
+            bitmap ^= bit;                          \
+        }                                           \
+        list;                                       \
+    })
+
+static VirtioDeviceStatus *qmp_decode_status(uint8_t bitmap)
+{
+    VirtioDeviceStatus *status;
+    uint8_t bit;
+    int i;
+
+    status = g_new0(VirtioDeviceStatus, 1);
+    status->dev_status = CONVERT_FEATURES(VirtioConfigStatusList, \
+                                          config_status_map, 1);
+    status->has_unknown_statuses = bitmap != 0;
+    if (status->has_unknown_statuses) {
+        status->unknown_statuses = bitmap;
+    }
+
+    return status;
+}
+
+static VhostDeviceProtocols *qmp_decode_protocols(uint64_t bitmap)
+{
+    VhostDeviceProtocols *vhu_protocols;
+    uint64_t bit;
+    int i;
+
+    vhu_protocols = g_new0(VhostDeviceProtocols, 1);
+    vhu_protocols->features =
+                    CONVERT_FEATURES(VhostProtocolFeatureList,
+                                     vhost_user_protocol_map, 0);
+    vhu_protocols->has_unknown_protocols = bitmap != 0;
+    if (vhu_protocols->has_unknown_protocols) {
+        vhu_protocols->unknown_protocols = bitmap;
+    }
+
+    return vhu_protocols;
+}
+
+static VirtioDeviceFeatures *qmp_decode_features(const char *name,
+                                                 uint64_t bitmap)
+{
+    VirtioDeviceFeatures *features;
+    uint64_t bit;
+    int i;
+
+    features = g_new0(VirtioDeviceFeatures, 1);
+
+    /* transport features */
+    features->transport = CONVERT_FEATURES(VirtioTransportFeatureList, \
+                                           transport_map, 0);
+    /* device features */
+    features->type = qapi_enum_parse(&VirtioType_lookup, name, -1, NULL);
+
+    switch (features->type) {
+#ifdef CONFIG_VIRTIO_SERIAL
+    case VIRTIO_TYPE_VIRTIO_SERIAL:
+        features->u.virtio_serial.features =
+                CONVERT_FEATURES(VirtioSerialFeatureList, serial_map, 0);
+        break;
+#endif
+#ifdef CONFIG_VIRTIO_BLK
+    case VIRTIO_TYPE_VIRTIO_BLK:
+        features->u.virtio_blk.features =
+                CONVERT_FEATURES(VirtioBlkFeatureList, blk_map, 0);
+        break;
+#endif
+#ifdef CONFIG_VIRTIO_GPU
+    case VIRTIO_TYPE_VIRTIO_GPU:
+        features->u.virtio_gpu.features =
+            CONVERT_FEATURES(VirtioGpuFeatureList, gpu_map, 0);
+        break;
+#endif
+#ifdef CONFIG_VIRTIO_NET
+    case VIRTIO_TYPE_VIRTIO_NET:
+        features->u.virtio_net.features =
+            CONVERT_FEATURES(VirtioNetFeatureList, net_map, 0);
+        break;
+#endif
+#ifdef CONFIG_VIRTIO_SCSI
+    case VIRTIO_TYPE_VIRTIO_SCSI:
+        features->u.virtio_scsi.features =
+            CONVERT_FEATURES(VirtioScsiFeatureList, scsi_map, 0);
+        break;
+#endif
+#ifdef CONFIG_VIRTIO_BALLOON
+    case VIRTIO_TYPE_VIRTIO_BALLOON:
+        features->u.virtio_balloon.features =
+            CONVERT_FEATURES(VirtioBalloonFeatureList, balloon_map, 0);
+        break;
+#endif
+#ifdef CONFIG_VIRTIO_IOMMU
+    case VIRTIO_TYPE_VIRTIO_IOMMU:
+        features->u.virtio_iommu.features =
+            CONVERT_FEATURES(VirtioIommuFeatureList, iommu_map, 0);
+        break;
+#endif
+#ifdef CONFIG_VIRTIO_INPUT
+    case VIRTIO_TYPE_VIRTIO_INPUT:
+        features->u.virtio_input.features =
+            CONVERT_FEATURES(VirtioInputFeatureList, input_map, 0);
+        break;
+#endif
+#ifdef CONFIG_VHOST_USER_FS
+    case VIRTIO_TYPE_VHOST_USER_FS:
+        features->u.vhost_user_fs.features =
+            CONVERT_FEATURES(VhostUserFsFeatureList, fs_map, 0);
+        break;
+#endif
+#ifdef CONFIG_VHOST_VSOCK
+    case VIRTIO_TYPE_VHOST_VSOCK:
+        features->u.vhost_vsock.features =
+            CONVERT_FEATURES(VhostVsockFeatureList, vsock_map, 0);
+        break;
+#endif
+#ifdef CONFIG_VIRTIO_CRYPTO
+    case VIRTIO_TYPE_VIRTIO_CRYPTO:
+        features->u.virtio_crypto.features =
+            CONVERT_FEATURES(VirtioCryptoFeatureList, crypto_map, 0);
+        break;
+#endif
+    /* No features */
+    case VIRTIO_TYPE_VIRTIO_9P:
+    case VIRTIO_TYPE_VIRTIO_PMEM:
+    case VIRTIO_TYPE_VIRTIO_RNG:
+    case VIRTIO_TYPE_VIRTIO_MEM:
+        break;
+    default:
+        g_assert_not_reached();
+    }
+
+    features->has_unknown_features = bitmap != 0;
+    if (features->has_unknown_features) {
+        features->unknown_features = bitmap;
+    }
+
+    return features;
+}
+
 VirtioStatus *qmp_x_debug_virtio_status(const char *path, Error **errp)
 {
     VirtIODevice *vdev;
@@ -3965,9 +4212,12 @@ VirtioStatus *qmp_x_debug_virtio_status(const char *path, Error **errp)
     status->name = g_strdup(vdev->name);
     status->device_id = vdev->device_id;
     status->vhost_started = vdev->vhost_started;
-    status->guest_features = vdev->guest_features;
-    status->host_features = vdev->host_features;
-    status->backend_features = vdev->backend_features;
+    status->guest_features = qmp_decode_features(vdev->name,
+                                                 vdev->guest_features);
+    status->host_features = qmp_decode_features(vdev->name,
+                                                vdev->host_features);
+    status->backend_features = qmp_decode_features(vdev->name,
+                                                   vdev->backend_features);
 
     switch (vdev->device_endian) {
     case VIRTIO_DEVICE_ENDIAN_LITTLE:
@@ -3982,7 +4232,7 @@ VirtioStatus *qmp_x_debug_virtio_status(const char *path, Error **errp)
     }
 
     status->num_vqs = virtio_get_num_queues(vdev);
-    status->status = vdev->status;
+    status->status = qmp_decode_status(vdev->status);
     status->isr = vdev->isr;
     status->queue_sel = vdev->queue_sel;
     status->vm_running = vdev->vm_running;
@@ -3995,7 +4245,8 @@ VirtioStatus *qmp_x_debug_virtio_status(const char *path, Error **errp)
     status->bus_name = g_strdup(vdev->bus_name);
     status->use_guest_notifier_mask = vdev->use_guest_notifier_mask;
 
-    if (vdev->vhost_started) {
+    status->has_vhost_dev = vdev->vhost_started;
+    if (status->has_vhost_dev) {
         VirtioDeviceClass *vdc = VIRTIO_DEVICE_GET_CLASS(vdev);
         struct vhost_dev *hdev = vdc->get_vhost(vdev);
 
@@ -4003,10 +4254,14 @@ VirtioStatus *qmp_x_debug_virtio_status(const char *path, Error **errp)
         status->vhost_dev->n_tmp_sections = hdev->n_tmp_sections;
         status->vhost_dev->nvqs = hdev->nvqs;
         status->vhost_dev->vq_index = hdev->vq_index;
-        status->vhost_dev->features = hdev->features;
-        status->vhost_dev->acked_features = hdev->acked_features;
-        status->vhost_dev->backend_features = hdev->backend_features;
-        status->vhost_dev->protocol_features = hdev->protocol_features;
+        status->vhost_dev->features =
+            qmp_decode_features(vdev->name, hdev->features);
+        status->vhost_dev->acked_features =
+            qmp_decode_features(vdev->name, hdev->acked_features);
+        status->vhost_dev->backend_features =
+            qmp_decode_features(vdev->name, hdev->backend_features);
+        status->vhost_dev->protocol_features =
+            qmp_decode_protocols(hdev->protocol_features);
         status->vhost_dev->max_queues = hdev->max_queues;
         status->vhost_dev->backend_cap = hdev->backend_cap;
         status->vhost_dev->log_enabled = hdev->log_enabled;
diff --git a/include/hw/virtio/vhost.h b/include/hw/virtio/vhost.h
index 1a9fc65..94f6989 100644
--- a/include/hw/virtio/vhost.h
+++ b/include/hw/virtio/vhost.h
@@ -5,6 +5,9 @@
 #include "hw/virtio/virtio.h"
 #include "exec/memory.h"
 
+#define VHOST_F_DEVICE_IOTLB 63
+#define VHOST_USER_F_PROTOCOL_FEATURES 30
+
 /* Generic structures common for any vhost based device. */
 
 struct vhost_inflight {
diff --git a/include/hw/virtio/virtio.h b/include/hw/virtio/virtio.h
index eceaafc..fc703bc 100644
--- a/include/hw/virtio/virtio.h
+++ b/include/hw/virtio/virtio.h
@@ -71,6 +71,23 @@ typedef struct VirtQueueElement
 #define TYPE_VIRTIO_DEVICE "virtio-device"
 OBJECT_DECLARE_TYPE(VirtIODevice, VirtioDeviceClass, VIRTIO_DEVICE)
 
+typedef struct {
+    int virtio_bit;
+    int qapi_virtio_enum;
+} qmp_virtio_feature_map_t;
+
+extern qmp_virtio_feature_map_t serial_map[];
+extern qmp_virtio_feature_map_t blk_map[];
+extern qmp_virtio_feature_map_t gpu_map[];
+extern qmp_virtio_feature_map_t net_map[];
+extern qmp_virtio_feature_map_t scsi_map[];
+extern qmp_virtio_feature_map_t balloon_map[];
+extern qmp_virtio_feature_map_t iommu_map[];
+extern qmp_virtio_feature_map_t input_map[];
+extern qmp_virtio_feature_map_t fs_map[];
+extern qmp_virtio_feature_map_t vsock_map[];
+extern qmp_virtio_feature_map_t crypto_map[];
+
 enum virtio_device_endian {
     VIRTIO_DEVICE_ENDIAN_UNKNOWN,
     VIRTIO_DEVICE_ENDIAN_LITTLE,
diff --git a/qapi/virtio.json b/qapi/virtio.json
index c78c432..678bfe8 100644
--- a/qapi/virtio.json
+++ b/qapi/virtio.json
@@ -78,6 +78,460 @@
 }
 
 ##
+# @VirtioType:
+#
+# An enumeration of Virtio device types
+#
+# Since: 6.2
+##
+
+{ 'enum': 'VirtioType',
+  'data': [ 'virtio-net', 'virtio-blk', 'virtio-serial', 'virtio-rng',
+            'virtio-balloon', 'virtio-iomem', 'virtio-rpmsg',
+            'virtio-scsi', 'virtio-9p', 'virtio-mac-wlan',
+            'virtio-rproc-serial', 'virtio-caif', 'virtio-mem-balloon',
+            'virtio-gpu', 'virtio-clk', 'virtio-input', 'vhost-vsock',
+            'virtio-crypto', 'virtio-signal', 'virtio-pstore',
+            'virtio-iommu', 'virtio-mem', 'virtio-sound', 'vhost-user-fs',
+            'virtio-pmem', 'virtio-mac-hwsim', 'vhost-user-i2c',
+            'virtio-bluetooth' ]
+}
+
+##
+# @VirtioConfigStatus:
+#
+# An enumeration of Virtio device configuration statuses
+#
+# Since: 6.2
+##
+
+{ 'enum': 'VirtioConfigStatus',
+  'data': [ 'driver-ok', 'features-ok', 'driver', 'needs-reset',
+            'failed', 'acknowledge' ]
+}
+
+##
+# @VirtioDeviceStatus:
+#
+# A structure defined to list the statuses of a virtio device
+#
+# @dev-status: The status of the virtio device
+#
+# @unknown-statuses: virtio device statuses bitmap that have not been decoded
+#
+# Since: 6.2
+##
+
+{ 'struct': 'VirtioDeviceStatus',
+  'data': {
+    'dev-status': [ 'VirtioConfigStatus' ],
+    '*unknown-statuses': 'uint8'
+  }
+}
+
+##
+# @VhostProtocolFeature:
+#
+# An enumeration of Vhost User protocol features
+#
+# Since: 6.2
+##
+
+{ 'enum': 'VhostProtocolFeature',
+  'data': [ 'mq', 'log-shmfd', 'rarp', 'reply-ack', 'net-mtu',
+            'slave-req', 'cross-endian', 'crypto-session', 'pagefault',
+            'config', 'slave-send-fd', 'host-notifier',
+            'inflight-shmfd', 'reset-device', 'inband-notifications',
+            'configure-mem-slots' ]
+}
+
+##
+# @VhostDeviceProtocols:
+#
+# A structure defined to list the vhost user protocol features of a
+# Vhost User device
+#
+# @features: The vhost user protocol features of a vhost user device
+#
+# @unknown-protocols: vhost user device protocol features bitmap that
+#                     have not been decoded
+#
+# Since: 6.2
+##
+
+{ 'struct': 'VhostDeviceProtocols',
+    'data': {
+      'features': [ 'VhostProtocolFeature' ],
+      '*unknown-protocols': 'uint64'
+    }
+}
+
+##
+# @VirtioTransportFeature:
+#
+# An enumeration of Virtio device transport features, including virtio-ring
+#
+# Since: 6.2
+##
+
+{ 'enum': 'VirtioTransportFeature',
+  'data': [ 'notify-on-empty', 'any-layout', 'protocol-features',
+            'version-1', 'iommu-platform', 'ring-packed', 'order-platform',
+            'sr-iov', 'indirect-desc', 'event-idx' ]
+}
+
+##
+# @VirtioSerialFeature:
+#
+# An enumeration of Virtio serial/console features
+#
+# Since: 6.2
+##
+
+{ 'enum': 'VirtioSerialFeature',
+  'data': [ 'size', 'multiport', 'emerg-write' ]
+}
+
+##
+# @VirtioBlkFeature:
+#
+# An enumeration of Virtio block features
+#
+# Since: 6.2
+##
+
+{ 'enum': 'VirtioBlkFeature',
+  'data': [ 'size-max', 'seg-max', 'geometry', 'ro', 'blk-size',
+            'topology', 'mq', 'discard', 'write-zeroes', 'barrier',
+            'scsi', 'flush', 'config-wce', 'log-all' ]
+}
+
+##
+# @VirtioGpuFeature:
+#
+# An enumeration of Virtio gpu features
+#
+# Since: 6.2
+##
+
+{ 'enum': 'VirtioGpuFeature',
+  'data': [ 'virgl', 'edid', 'resource-uuid', 'resource-blob',
+            'log-all' ]
+}
+
+##
+# @VirtioNetFeature:
+#
+# An enumeration of Virtio net features
+#
+# Since: 6.2
+##
+
+{ 'enum': 'VirtioNetFeature',
+  'data': [ 'csum', 'guest-csum', 'ctrl-guest-offloads', 'mtu', 'mac',
+            'guest-tso4', 'guest-tso6', 'guest-ecn', 'guest-ufo',
+            'host-tso4', 'host-tso6', 'host-ecn', 'host-ufo',
+            'mrg-rxbuf', 'status', 'ctrl-vq', 'ctrl-rx', 'ctrl-vlan',
+            'ctrl-rx-extra', 'guest-announce', 'mq', 'ctrl-mac-addr',
+            'hash-report', 'rss', 'rsc-ext', 'standby', 'speed-duplex',
+            'gso', 'virtio-net-hdr', 'log-all' ]
+}
+
+##
+# @VirtioScsiFeature:
+#
+# An enumeration of Virtio scsi features
+#
+# Since: 6.2
+##
+
+{ 'enum': 'VirtioScsiFeature',
+  'data': [ 'inout', 'hotplug', 'change', 't10-pi', 'log-all' ]
+}
+
+##
+# @VirtioBalloonFeature:
+#
+# An enumeration of Virtio balloon features
+#
+# Since: 6.2
+##
+
+{ 'enum': 'VirtioBalloonFeature',
+  'data': [ 'must-tell-host', 'stats-vq', 'deflate-on-oom',
+            'free-page-hint', 'page-poison', 'reporting' ]
+}
+
+##
+# @VirtioIommuFeature:
+#
+# An enumeration of Virtio iommu features
+#
+# Since: 6.2
+##
+
+{ 'enum': 'VirtioIommuFeature',
+  'data': [ 'input-range', 'domain-range', 'map-unmap', 'bypass',
+            'probe', 'mmio' ]
+}
+
+##
+# @VirtioInputFeature:
+#
+# An enumeration of Virtio input features. Note that virtio-input
+# has no device-specific features except when it's vhost, then
+# it may have the VHOST_F_LOG_ALL feature.
+#
+# Since: 6.2
+##
+
+{ 'enum': 'VirtioInputFeature',
+  'data': [ 'log-all' ]
+}
+
+##
+# @VhostUserFsFeature:
+#
+# An enumeration of vhost user FS features. Note that vhost-user-fs
+# has no device-specific features other than the vhost-common
+# VHOST_F_LOG_ALL feature.
+#
+# Since: 6.2
+##
+
+{ 'enum': 'VhostUserFsFeature',
+  'data': [ 'log-all' ]
+}
+
+##
+# @VhostVsockFeature:
+#
+# An enumeration of vhost vsock features. Note that vhost-vsock has
+# no device-specific features other than the vhost-common
+# VHOST_F_LOG_ALL feature.
+#
+# Since: 6.2
+##
+
+{ 'enum': 'VhostVsockFeature',
+  'data': [ 'log-all' ]
+}
+
+##
+# @VirtioCryptoFeature:
+#
+# An enumeration of virtio crypto features. Not that virtio-crypto
+# has no device-specific features other than when it is a vhost
+# device, then it may have the VHOST_F_LOG_ALL feature.
+#
+# Since: 6.2
+##
+
+{ 'enum': 'VirtioCryptoFeature',
+  'data': [ 'log-all' ]
+}
+
+##
+# @VirtioDeviceFeaturesBase:
+#
+# The common fields that apply to all Virtio devices
+#
+# @type: virtio device name
+# @transport: the list of transport features of the virtio device
+# @unknown-features: virtio device features bitmap that have not been decoded
+#
+# Since: 6.2
+##
+
+{ 'struct': 'VirtioDeviceFeaturesBase',
+    'data': {
+      'type': 'VirtioType',
+      'transport': [ 'VirtioTransportFeature' ],
+      '*unknown-features': 'uint64'
+    }
+}
+
+##
+# @VirtioDeviceFeaturesOptionsSerial:
+#
+# The options that apply to Virtio serial devices
+#
+# @features: List of device features
+#
+# Since: 6.2
+##
+
+{ 'struct': 'VirtioDeviceFeaturesOptionsSerial',
+  'data': { 'features': [ 'VirtioSerialFeature' ] }
+}
+
+##
+# @VirtioDeviceFeaturesOptionsBlk:
+#
+# The options that apply to Virtio block devices
+#
+# @features: List of device features
+#
+# Since: 6.2
+##
+
+{ 'struct': 'VirtioDeviceFeaturesOptionsBlk',
+  'data': { 'features': [ 'VirtioBlkFeature' ] }
+}
+
+##
+# @VirtioDeviceFeaturesOptionsGpu:
+#
+# The options that apply to Virtio GPU devices
+#
+# @features: List of device features
+#
+# Since: 6.2
+##
+
+{ 'struct': 'VirtioDeviceFeaturesOptionsGpu',
+  'data': { 'features': [ 'VirtioGpuFeature' ] }
+}
+
+##
+# @VirtioDeviceFeaturesOptionsNet:
+#
+# The options that apply to Virtio net devices
+#
+# @features: List of device features
+#
+# Since: 6.2
+##
+
+{ 'struct': 'VirtioDeviceFeaturesOptionsNet',
+  'data': { 'features': [ 'VirtioNetFeature' ] }
+}
+
+##
+# @VirtioDeviceFeaturesOptionsScsi:
+#
+# The options that apply to Virtio SCSI devices
+#
+# @features: List of device features
+#
+# Since: 6.2
+##
+
+{ 'struct': 'VirtioDeviceFeaturesOptionsScsi',
+  'data': { 'features': [ 'VirtioScsiFeature' ] }
+}
+
+##
+# @VirtioDeviceFeaturesOptionsBalloon:
+#
+# The options that apply to Virtio balloon devices
+#
+# @features: List of device features
+#
+# Since: 6.2
+##
+
+{ 'struct': 'VirtioDeviceFeaturesOptionsBalloon',
+  'data': { 'features': [ 'VirtioBalloonFeature' ] }
+}
+
+##
+# @VirtioDeviceFeaturesOptionsIommu:
+#
+# The options that apply to Virtio IOMMU devices
+#
+# @features: List of device features
+#
+# Since: 6.2
+##
+
+{ 'struct': 'VirtioDeviceFeaturesOptionsIommu',
+  'data': { 'features': [ 'VirtioIommuFeature' ] }
+}
+
+##
+# @VirtioDeviceFeaturesOptionsInput:
+#
+# The options that apply to Virtio input devices
+#
+# @features: List of device features
+#
+# Since: 6.2
+##
+
+{ 'struct': 'VirtioDeviceFeaturesOptionsInput',
+  'data': { 'features': [ 'VirtioInputFeature' ] }
+}
+
+##
+# @VhostDeviceFeaturesOptionsFs:
+#
+# The options that apply to vhost-user-fs devices
+#
+# @features: List of device features
+#
+# Since: 6.2
+##
+
+{ 'struct': 'VhostDeviceFeaturesOptionsFs',
+  'data': { 'features': [ 'VhostUserFsFeature' ] }
+}
+
+##
+# @VhostDeviceFeaturesOptionsVsock:
+#
+# The options that apply to vhost-vsock devices
+#
+# @features: List of device features
+#
+# Since: 6.2
+##
+
+{ 'struct': 'VhostDeviceFeaturesOptionsVsock',
+  'data': { 'features': [ 'VhostVsockFeature' ] }
+}
+
+##
+# @VirtioDeviceFeaturesOptionsCrypto:
+#
+# The options that apply to virtio-crypto devices
+#
+# @features: List of device features
+#
+# Since: 6.2
+##
+
+{ 'struct': 'VirtioDeviceFeaturesOptionsCrypto',
+  'data': { 'features': [ 'VirtioCryptoFeature' ] }
+}
+
+##
+# @VirtioDeviceFeatures:
+#
+# A union to define the list of features for a virtio device
+#
+# Since: 6.2
+##
+
+{ 'union': 'VirtioDeviceFeatures',
+  'base': 'VirtioDeviceFeaturesBase',
+  'discriminator': 'type',
+  'data': {
+    'virtio-serial': 'VirtioDeviceFeaturesOptionsSerial',
+    'virtio-blk': 'VirtioDeviceFeaturesOptionsBlk',
+    'virtio-gpu': 'VirtioDeviceFeaturesOptionsGpu',
+    'virtio-net': 'VirtioDeviceFeaturesOptionsNet',
+    'virtio-scsi': 'VirtioDeviceFeaturesOptionsScsi',
+    'virtio-balloon': 'VirtioDeviceFeaturesOptionsBalloon',
+    'virtio-iommu': 'VirtioDeviceFeaturesOptionsIommu',
+    'virtio-input': 'VirtioDeviceFeaturesOptionsInput',
+    'vhost-user-fs': 'VhostDeviceFeaturesOptionsFs',
+    'vhost-vsock': 'VhostDeviceFeaturesOptionsVsock',
+    'virtio-crypto': 'VirtioDeviceFeaturesOptionsCrypto'
+  }
+}
+
+##
 # @VhostStatus:
 #
 # Information about a vhost device (if active)
@@ -116,10 +570,10 @@
         'n-tmp-sections': 'int',
         'nvqs': 'uint32',
         'vq-index': 'int',
-        'features': 'uint64',
-        'acked-features': 'uint64',
-        'backend-features': 'uint64',
-        'protocol-features': 'uint64',
+        'features': 'VirtioDeviceFeatures',
+        'acked-features': 'VirtioDeviceFeatures',
+        'backend-features': 'VirtioDeviceFeatures',
+        'protocol-features': 'VhostDeviceProtocols',
         'max-queues': 'uint64',
         'backend-cap': 'uint64',
         'log-enabled': 'bool',
@@ -181,12 +635,12 @@
         'name': 'str',
         'device-id': 'uint16',
         'vhost-started': 'bool',
-        'guest-features': 'uint64',
-        'host-features': 'uint64',
-        'backend-features': 'uint64',
+        'guest-features': 'VirtioDeviceFeatures',
+        'host-features': 'VirtioDeviceFeatures',
+        'backend-features': 'VirtioDeviceFeatures',
         'device-endian': 'VirtioStatusEndianness',
         'num-vqs': 'int',
-        'status': 'uint8',
+        'status': 'VirtioDeviceStatus',
         'isr': 'uint8',
         'queue-sel': 'uint16',
         'vm-running': 'bool',
@@ -198,7 +652,7 @@
         'disable-legacy-check': 'bool',
         'bus-name': 'str',
         'use-guest-notifier-mask': 'bool',
-        'vhost-dev': 'VhostStatus'
+        '*vhost-dev': 'VhostStatus'
     }
 }
 
@@ -228,28 +682,31 @@
 #          "name": "virtio-crypto",
 #          "started": true,
 #          "device-id": 20,
-#          "vhost-dev": {
-#               "n-tmp-sections": 0,
-#               "n-mem-sections": 0,
-#               "max-queues": 0,
-#               "backend-cap": 0,
-#               "log-size": 0,
-#               "backend-features": 0,
-#               "nvqs": 0,
-#               "protocol-features": 0,
-#               "vq-index": 0,
-#               "log-enabled": false,
-#               "acked-features": 0,
-#               "features": 0
+#          "backend-features": {
+#               "transport": [],
+#               "type": "virtio-crypto",
+#               "features": []
 #          },
-#          "backend-features": 0,
 #          "start-on-kick": false,
 #          "isr": 1,
 #          "broken": false,
-#          "status": 15,
+#          "status": {
+#               "dev-status": ["acknowledge", "driver", "features-ok",
+#                              "driver-ok"]
+#          },
 #          "num-vqs": 2,
-#          "guest-features": 5100273664,
-#          "host-features": 6325010432,
+#          "guest-features": {
+#               "transport": ["event-idx", "indirect-desc", "version-1"],
+#               "type": "virtio-crypto",
+#               "features": []
+#          },
+#          "host-features": {
+#               "transport": ["protocol-features", "event-idx",
+#                             "indirect-desc", "version-1", "any-layout",
+#                             "notify-on-empty"],
+#               "type": "virtio-crypto",
+#               "features": []
+#          },
 #          "use-guest-notifier-mask": true,
 #          "vm-running": true,
 #          "queue-sel": 1,
@@ -278,22 +735,71 @@
 #               "max-queues": 1,
 #               "backend-cap": 2,
 #               "log-size": 0,
-#               "backend-features": 0,
+#               "backend-features": {
+#                       "transport": [],
+#                       "type": "virtio-net",
+#                       "features": []
+#               },
 #               "nvqs": 2,
-#               "protocol-features": 0,
+#               "protocol-features": {
+#                       "features": []
+#               },
 #               "vq-index": 0,
 #               "log-enabled": false,
-#               "acked-features": 5100306432,
-#               "features": 13908344832
+#               "acked-features": {
+#                       "transport": ["event-idx", "indirect-desc", "version-1",
+#                                     "any-layout", "notify-on-empty"],
+#                       "type": "virtio-net",
+#                       "features": ["mrg-rxbuf"]
+#               },
+#               "features": {
+#                       "transport": ["event-idx", "indirect-desc",
+#                                     "iommu-platform", "version-1", "any-layout",
+#                                     "notify-on-empty"],
+#                       "type": "virtio-net",
+#                       "features": ["log-all", "mrg-rxbuf"]
+#               }
+#          },
+#          "backend-features": {
+#               "transport": ["protocol-features", "event-idx", "indirect-desc",
+#                             "version-1", "any-layout", "notify-on-empty"],
+#               "type": "virtio-net",
+#               "features": ["gso", "ctrl-mac-addr", "guest-announce", "ctrl-rx-extra",
+#                            "ctrl-vlan", "ctrl-rx", "ctrl-vq", "status", "mrg-rxbuf",
+#                            "host-ufo", "host-ecn", "host-tso6", "host-tso4",
+#                            "guest-ufo", "guest-ecn", "guest-tso6", "guest-tso4",
+#                            "mac", "ctrl-guest-offloads", "guest-csum", "csum"]
 #          },
-#          "backend-features": 6337593319,
 #          "start-on-kick": false,
 #          "isr": 1,
 #          "broken": false,
-#          "status": 15,
+#          "status": {
+#               "dev-status": ["acknowledge", "driver", "features-ok", "driver-ok"]
+#          },
 #          "num-vqs": 3,
-#          "guest-features": 5111807911,
-#          "host-features": 6337593319,
+#          "guest-features": {
+#               "transport": ["event-idx", "indirect-desc", "version-1"],
+#               "type": "virtio-net",
+#               "features": ["ctrl-mac-addr", "guest-announce", "ctrl-vlan",
+#                            "ctrl-rx", "ctrl-vq", "status", "mrg-rxbuf",
+#                            "host-ufo", "host-ecn", "host-tso6",
+#                            "host-tso4", "guest-ufo", "guest-ecn",
+#                            "guest-tso6", "guest-tso4", "mac",
+#                            "ctrl-guest-offloads", "guest-csum", "csum"]
+#          },
+#          "host-features": {
+#               "transport": ["protocol-features", "event-idx",
+#                             "indirect-desc", "version-1", "any-layout",
+#                             "notify-on-empty"],
+#               "type": "virtio-net",
+#               "features": ["gso", "ctrl-mac-addr", "guest-announce",
+#                            "ctrl-rx-extra", "ctrl-vlan", "ctrl-rx",
+#                            "ctrl-vq", "status", "mrg-rxbuf", "host-ufo",
+#                            "host-ecn", "host-tso6", "host-tso4",
+#                            "guest-ufo", "guest-ecn", "guest-tso6",
+#                            "guest-tso4", "mac", "ctrl-guest-offloads",
+#                            "guest-csum", "csum"]
+#          },
 #          "use-guest-notifier-mask": true,
 #          "vm-running": true,
 #          "queue-sel": 2,
-- 
1.8.3.1


