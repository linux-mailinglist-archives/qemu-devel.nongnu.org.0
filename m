Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 90972422F7A
	for <lists+qemu-devel@lfdr.de>; Tue,  5 Oct 2021 19:56:37 +0200 (CEST)
Received: from localhost ([::1]:50256 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mXog8-0002hU-IP
	for lists+qemu-devel@lfdr.de; Tue, 05 Oct 2021 13:56:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45996)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jonah.palmer@oracle.com>)
 id 1mXnav-00034W-74; Tue, 05 Oct 2021 12:47:10 -0400
Received: from mx0a-00069f02.pphosted.com ([205.220.165.32]:57450)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jonah.palmer@oracle.com>)
 id 1mXnar-0005uZ-AH; Tue, 05 Oct 2021 12:47:08 -0400
Received: from pps.filterd (m0246627.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 195G5UH8019232; 
 Tue, 5 Oct 2021 16:46:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : content-type :
 mime-version; s=corp-2021-07-09;
 bh=wT/CjClliNqvvkDTOJfYtRhUQ8PMnOqgM9hwI/CZT8M=;
 b=OBlPzacM5fUoXlZp4R0CfXlmu88JEom+1Y5vtJCPAiwvqOgEVQHOp39ZIcMHyYcl/6Tp
 2RLRFM+DEy+29l/toOaHYYsN3mEd5yBnI6dNTXOuQ/6oj5UKiHsjWKNUXzbPX2Aa4ATm
 wqvCk8BNC3/9ZJNlG+pQ09fQq0DvtlWDb1CkBn6itdaQGIllZg42SzSj+f9MDT6uS1u4
 B0EZZMF4etd4+Khw4eAZaWFLgnFGjJu0pRv0SrIIj9J2/fwdp3Yn+K4s+sak5PJ+6rK6
 BgLXBTqBf5FPRfJtfGojRHAZD+RlXuaQI1p2lZpRuDScCdvw5RQthZJFUfKnEQT5x2Pm 2w== 
Received: from aserp3020.oracle.com (aserp3020.oracle.com [141.146.126.70])
 by mx0b-00069f02.pphosted.com with ESMTP id 3bg3p5hcyy-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 05 Oct 2021 16:46:57 +0000
Received: from pps.filterd (aserp3020.oracle.com [127.0.0.1])
 by aserp3020.oracle.com (8.16.1.2/8.16.1.2) with SMTP id 195GkK3x106997;
 Tue, 5 Oct 2021 16:46:46 GMT
Received: from nam02-sn1-obe.outbound.protection.outlook.com
 (mail-sn1anam02lp2047.outbound.protection.outlook.com [104.47.57.47])
 by aserp3020.oracle.com with ESMTP id 3bev8x0ut0-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 05 Oct 2021 16:46:45 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Z+xvyZvWOwaF/y6740ikE36eYSqe7DI23KTenXd4fMKa1HVRSpRvtGN+PehToAsp+828d+nVTcIlSPMfUmfkEa2zGWqSvkKlRYYPlD3is7RopPNnIdr/mMm4eaUgCMWw/nny5d2UrSohHA0H3nn6+mmWK/8ie7MNV7VxcGDIs/H8MIY5/RiSQ9jfyu9sWEkjHNDuCCbyd7BimiYRd301y6FJOCdED6J/D4nZNRicB5ldoX1i3tgH8TAIn4Ox6O3B+c0zdwaBQT3GIIK16rzbiTJiMj6Vm8czdWv0jJpvqe7spauC6dpPiTSeTpgvZQNjPm7SgOWcRCANGcBLAYSKuA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wT/CjClliNqvvkDTOJfYtRhUQ8PMnOqgM9hwI/CZT8M=;
 b=NTvjwiKr6NK/Ln43iDeBv7U999pBdSLnaa2JJYlEhexQNnw6mQhtoH13KvEgUGG3tb2Bhl0YDyUNCXo73z5UIoICJYeBkDJXqtki14c/nfAjVIwqr6ATS5Dcod3XBbSV3wEYAnQcIyGLbIBoJgmCSR18dEeXYuRdU9Cd1/KKiMew9Qll/uD1HQ/ouphUG62A7WjQgNpii7RjyEgJgWsZG2uV73iq9JExTB1dXxFL1S7kQSOYIC3+vK35ChVAdcBaKqOS9Hw346Yt0El6hBiaYiqSaGOp9cheAnuGOHH+12flDgXT5eqZQyaZxNnHao2Vgf9x+LrYhXvdxkhLxSRlkg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wT/CjClliNqvvkDTOJfYtRhUQ8PMnOqgM9hwI/CZT8M=;
 b=nWrr6QZ13aH2mztrZeLNAr/OoCV9CXdnGPLdlRXQKVeieMt1sWXEMCIGgUP/URtufuUMyS7BhKUyggEyxO0Z4gwu067Py0fRbMXupaYGNx+rLhVOjzubfZMMfFAsJN0BJ8vyxGouBvscS/UZmOPxtM+EfRiIsaDO5CSAc+4vSb4=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=oracle.com;
Received: from SA2PR10MB4667.namprd10.prod.outlook.com (2603:10b6:806:111::21)
 by SA1PR10MB5509.namprd10.prod.outlook.com (2603:10b6:806:1e4::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4566.22; Tue, 5 Oct
 2021 16:46:43 +0000
Received: from SA2PR10MB4667.namprd10.prod.outlook.com
 ([fe80::95e7:72:edfe:3da9]) by SA2PR10MB4667.namprd10.prod.outlook.com
 ([fe80::95e7:72:edfe:3da9%8]) with mapi id 15.20.4566.022; Tue, 5 Oct 2021
 16:46:43 +0000
From: Jonah Palmer <jonah.palmer@oracle.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v7 7/8] qmp: add QMP command x-debug-virtio-queue-element
Date: Tue,  5 Oct 2021 12:45:52 -0400
Message-Id: <1633452353-7169-8-git-send-email-jonah.palmer@oracle.com>
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
 Transport; Tue, 5 Oct 2021 16:46:41 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 9e302dce-795f-4b0f-ab91-08d9881fb675
X-MS-TrafficTypeDiagnostic: SA1PR10MB5509:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <SA1PR10MB5509BA373A41BFB1B0489770E8AF9@SA1PR10MB5509.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2331;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: vtEfzXciTtQGtAAzjygpFYh1vcrqMz+dReMPciOn037JBs7Gq6OtgNfczrUkDT8UAHhiMNbdbC9KCvQRcC8LqaP5+3XP13ZH/YBxQNYpyvOksZgM3lhdM7K/+2TxNQz7u/s5Jdpk5HfrobD+r8gLBFb9GLGx8d5ZMgCVbpffzmJETJu6XwAjIYqkR9WKkZeXxrzUqT28VjOr46u59nVnvNt4EAbvgAgOcNXyVdWM9yM+waCPnhAIlj7kqGpSzatx3yeNooIvCnwk2EMjRQ08pj1MTfn88NoM7HHy+7u3QiO38b48TyxHAT9fq4rPD9b3ma3EVbfxrKAmID8k0wkoRNdL7oYFdCZ7XpOwwIGUX2hbSPmrc4zLxtA6s6TXpgxRUyFPfm/gaRiNZyC6fDvHwd9W+mAYJglTXn1EdkJltn+THueybHRuefMdF/vmajen1+g+bJrbil5Lq61G4/xYG6NIp+p4O4lJwNEMHK9PP75nMSNbtxt+dxGp5W9ya4taiNnJVfG3yLfW3gROvV612iGhyksj7YJQGVAOyOw/jKr89PZerGyO20fsDW5aKSMnTDa8jm1JzQaZIAoF/d2qnIUTmbqnWQ3/IMSOMNjxmTaFURGDr0x10nh54bmxNxd3h2nVhSLpr3d649Er0kitF+Upeu2+KXUIDTTe58W/gCH1IsQOFAWB6r4+RXGpBtX6rRQlV+Tp9gP5+eZdf7PElw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SA2PR10MB4667.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(316002)(83380400001)(66946007)(66556008)(66476007)(7416002)(8936002)(956004)(2616005)(8676002)(36756003)(6486002)(26005)(6666004)(44832011)(7696005)(6916009)(4326008)(38350700002)(38100700002)(508600001)(2906002)(5660300002)(86362001)(52116002)(186003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?0PahYNbxdSQJie6IEUMiuAOMxQKGyoiQJKegnxShSzoliADySyWQyg0tBPns?=
 =?us-ascii?Q?/q0JWWtKYey0WvAtKlJCgdM/dWNrfCPyANuel1nRkQK4lIhfDI6IrWklC3iV?=
 =?us-ascii?Q?qn6p+K7P75Otm8NycjBS8ZGpafJYt4g5VDkQYbhJ1L/46AZ07a4TQiG0gwRT?=
 =?us-ascii?Q?3JysF8xvSkdV6lnv7f0TxNfzLxMl58++1fAmDdXY15NxRmR4Go7ngfu3qpgK?=
 =?us-ascii?Q?lcwUFD4wyqKSvctTeIKzFxmRuE0JtCVrQKt6ZR1aTmIF6mDaZI71yOqxaHhv?=
 =?us-ascii?Q?CXQzDoMRbRUZ/dlcnd3hDmrCEpp9h1lIAmJoTcvh/N5gnsi7M4jkfA7IJIdp?=
 =?us-ascii?Q?60oN4QOiWvqn0pBKnoUezPghxrPFdc1yKWviiRlKTBR8GBL0vo5fDrko425I?=
 =?us-ascii?Q?HiXbwaJS8ErNu3/bMkENsS14/vIddJopdX5Nk1w1yt8wBlKVWJUpnmvSw3Bj?=
 =?us-ascii?Q?1hvAu42OtbxkV0HDqLSSy8S6EtlYTOV1uBTBgP8l6THdWmGnKAjPzMx6VAmt?=
 =?us-ascii?Q?p0ZbJQQIsnSYG03wAKDm0PdgN+YVEV4vsI3aoZehTCUB5CHvLtEahOKg/WST?=
 =?us-ascii?Q?yj8kv4Pr8Zv8VmbO+MtNHmG2zjqGCWTTfJBItfe+gDHxhrwP5f99VgUOwxr7?=
 =?us-ascii?Q?cfqpbPbIubk/5vL/XpZWSLTwof66a6uGoe8ZdMMtihWkCs4Rt6AW8IjkO4an?=
 =?us-ascii?Q?jZKSQ/cIyGWuDBBV6ctx8iQi2Uo3puNSLj0x0EaaNqCLRLgVvzqdgQnV8AVd?=
 =?us-ascii?Q?3rOZO+UtQX9XcwDlNGTJKNWgtQIAQ8E8UjryhW6kVgxi7f7ISvh/tHPC61UK?=
 =?us-ascii?Q?G40ubWnEWhzC0xIqhQkdwVvmgNzu71xuVSEgc6zg8e+m0lWUalnaxuCUvDE1?=
 =?us-ascii?Q?/G+uxKDJ8gcRKND/D7x9y2iUI9uHggbhG7wBMwWH+3x4RNeoyEJraQgy69qS?=
 =?us-ascii?Q?5VyXoFkor2MyIdrAscnXb8q4kNWCB8RvlO5/PIsLIeEiIVVR1fLLeySSQnXJ?=
 =?us-ascii?Q?VnxaZ9HZdjbSEDl0Qbfo6b92+KKIIiLjCSsjhZqoxX3/LMmiXQovIAnQfPEr?=
 =?us-ascii?Q?Wvd1atruKAnhU9hD4/KkCXXVsgJJDVFHR5acZAxUy7uSF8sgg4t2xFwtJVPW?=
 =?us-ascii?Q?5dcjuW0cLZYsNhFE3UYCQ82LMVxl8XiDwnZLyrvXfqgsopHN/elT1LoBOWye?=
 =?us-ascii?Q?UjosJvcn0GPgxyCGzUfyr6Aiv5S+wRFO8dNqJVlDhiJ42U4w/qj0bUGw1MMH?=
 =?us-ascii?Q?aqmwEQlfluM0rGH5z5nS7DNkXAWoOIPPOo6ArTfsDB+TxCit6PmKwNLtOW/i?=
 =?us-ascii?Q?Z996uO9O6znSYo1FD/J1CNPt?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9e302dce-795f-4b0f-ab91-08d9881fb675
X-MS-Exchange-CrossTenant-AuthSource: SA2PR10MB4667.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Oct 2021 16:46:43.7379 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: t4p+0W9LR4mabCGd2t1gTxltWw3W7taY7G4+BSIgQNQqgOnCVvcLJY+NBFpP3fdOF1l6iDPEMWwiv0bK4AaxGw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR10MB5509
X-Proofpoint-Virus-Version: vendor=nai engine=6300 definitions=10128
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0
 adultscore=0 phishscore=0
 spamscore=0 mlxscore=0 mlxlogscore=999 suspectscore=0 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2109230001
 definitions=main-2110050100
X-Proofpoint-ORIG-GUID: 7ERV0Y-Gw-O5Y1zP2fnjQ-woNlnRKDQN
X-Proofpoint-GUID: 7ERV0Y-Gw-O5Y1zP2fnjQ-woNlnRKDQN
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

This new command shows the information of a VirtQueue element.

Signed-off-by: Jonah Palmer <jonah.palmer@oracle.com>
---
 hw/virtio/virtio-stub.c |   9 +++
 hw/virtio/virtio.c      | 154 ++++++++++++++++++++++++++++++++++++++
 qapi/virtio.json        | 191 ++++++++++++++++++++++++++++++++++++++++++++++++
 3 files changed, 354 insertions(+)

 [Jonah: Added support to display driver (used vring) and device
  (avail vring) areas, including a new function vring_used_flags()
  to retrieve the used vring flags of a given element.]

diff --git a/hw/virtio/virtio-stub.c b/hw/virtio/virtio-stub.c
index 387803d..6c282b3 100644
--- a/hw/virtio/virtio-stub.c
+++ b/hw/virtio/virtio-stub.c
@@ -31,3 +31,12 @@ VirtQueueStatus *qmp_x_debug_virtio_queue_status(const char *path,
 {
     return qmp_virtio_unsupported(errp);
 }
+
+VirtioQueueElement *qmp_x_debug_virtio_queue_element(const char *path,
+                                                     uint16_t queue,
+                                                     bool has_index,
+                                                     uint16_t index,
+                                                     Error **errp)
+{
+    return qmp_virtio_unsupported(errp);
+}
diff --git a/hw/virtio/virtio.c b/hw/virtio/virtio.c
index 8d74dbf..0d67a36 100644
--- a/hw/virtio/virtio.c
+++ b/hw/virtio/virtio.c
@@ -478,6 +478,19 @@ static inline void vring_used_write(VirtQueue *vq, VRingUsedElem *uelem,
     address_space_cache_invalidate(&caches->used, pa, sizeof(VRingUsedElem));
 }
 
+/* Called within rcu_read_lock(). */
+static inline uint16_t vring_used_flags(VirtQueue *vq)
+{
+    VRingMemoryRegionCaches *caches = vring_get_region_caches(vq);
+    hwaddr pa = offsetof(VRingUsed, flags);
+
+    if (!caches) {
+        return 0;
+    }
+
+    return virtio_lduw_phys_cached(vq->vdev, &caches->used, pa);
+}
+
 /* Called within rcu_read_lock().  */
 static uint16_t vring_used_idx(VirtQueue *vq)
 {
@@ -4387,6 +4400,147 @@ VirtQueueStatus *qmp_x_debug_virtio_queue_status(const char *path,
     return status;
 }
 
+static VirtioRingDescFlagsList *qmp_decode_vring_desc_flags(uint16_t flags)
+{
+    VirtioRingDescFlagsList *list = NULL;
+    VirtioRingDescFlagsList *node;
+    int i;
+
+    struct {
+        uint16_t flag;
+        VirtioRingDescFlags value;
+    } map[] = {
+        { VRING_DESC_F_NEXT, VIRTIO_RING_DESC_FLAGS_NEXT },
+        { VRING_DESC_F_WRITE, VIRTIO_RING_DESC_FLAGS_WRITE },
+        { VRING_DESC_F_INDIRECT, VIRTIO_RING_DESC_FLAGS_INDIRECT },
+        { 1 << VRING_PACKED_DESC_F_AVAIL, VIRTIO_RING_DESC_FLAGS_AVAIL },
+        { 1 << VRING_PACKED_DESC_F_USED, VIRTIO_RING_DESC_FLAGS_USED },
+        { 0, -1 }
+    };
+
+    for (i = 0; map[i].flag; i++) {
+        if ((map[i].flag & flags) == 0) {
+            continue;
+        }
+        node = g_malloc0(sizeof(VirtioRingDescFlagsList));
+        node->value = map[i].value;
+        node->next = list;
+        list = node;
+    }
+
+    return list;
+}
+
+VirtioQueueElement *qmp_x_debug_virtio_queue_element(const char *path,
+                                                     uint16_t queue,
+                                                     bool has_index,
+                                                     uint16_t index,
+                                                     Error **errp)
+{
+    VirtIODevice *vdev;
+    VirtQueue *vq;
+    VirtioQueueElement *element = NULL;
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
+    vq = &vdev->vq[queue];
+
+    if (virtio_vdev_has_feature(vdev, VIRTIO_F_RING_PACKED)) {
+        error_setg(errp, "Packed ring not supported");
+        return NULL;
+    } else {
+        unsigned int head, i, max;
+        VRingMemoryRegionCaches *caches;
+        MemoryRegionCache indirect_desc_cache = MEMORY_REGION_CACHE_INVALID;
+        MemoryRegionCache *desc_cache;
+        VRingDesc desc;
+        VirtioRingDescList *list = NULL;
+        VirtioRingDescList *node;
+        int rc;
+
+        RCU_READ_LOCK_GUARD();
+
+        max = vq->vring.num;
+
+        if (!has_index) {
+            head = vring_avail_ring(vq, vq->last_avail_idx % vq->vring.num);
+        } else {
+            head = vring_avail_ring(vq, index % vq->vring.num);
+        }
+        i = head;
+
+        caches = vring_get_region_caches(vq);
+        if (!caches) {
+            error_setg(errp, "Region caches not initialized");
+            return NULL;
+        }
+        if (caches->desc.len < max * sizeof(VRingDesc)) {
+            error_setg(errp, "Cannot map descriptor ring");
+            return NULL;
+        }
+
+        desc_cache = &caches->desc;
+        vring_split_desc_read(vdev, &desc, desc_cache, i);
+        if (desc.flags & VRING_DESC_F_INDIRECT) {
+            int64_t len;
+            len = address_space_cache_init(&indirect_desc_cache, vdev->dma_as,
+                                           desc.addr, desc.len, false);
+            desc_cache = &indirect_desc_cache;
+            if (len < desc.len) {
+                error_setg(errp, "Cannot map indirect buffer");
+                goto done;
+            }
+
+            max = desc.len / sizeof(VRingDesc);
+            i = 0;
+            vring_split_desc_read(vdev, &desc, desc_cache, i);
+        }
+
+        element = g_new0(VirtioQueueElement, 1);
+        element->avail = g_new0(VirtioRingAvail, 1);
+        element->used = g_new0(VirtioRingUsed, 1);
+        element->device_name = g_strdup(vdev->name);
+        element->index = head;
+        element->ndescs = 0;
+        element->avail->flags = vring_avail_flags(vq);
+        element->avail->idx = vring_avail_idx(vq);
+        element->avail->ring = head;
+        element->used->flags = vring_used_flags(vq);
+        element->used->idx = vring_used_idx(vq);
+
+        do {
+            /* A buggy driver may produce an infinite loop */
+            if (element->ndescs >= max) {
+                break;
+            }
+            node = g_new0(VirtioRingDescList, 1);
+            node->value = g_new0(VirtioRingDesc, 1);
+            node->value->addr = desc.addr;
+            node->value->len = desc.len;
+            node->value->flags = qmp_decode_vring_desc_flags(desc.flags);
+            node->next = list;
+            list = node;
+
+            element->ndescs++;
+            rc = virtqueue_split_read_next_desc(vdev, &desc, desc_cache,
+                                                max, &i);
+        } while (rc == VIRTQUEUE_READ_DESC_MORE);
+        element->descs = list;
+done:
+        address_space_cache_destroy(&indirect_desc_cache);
+    }
+
+    return element;
+}
+
 static const TypeInfo virtio_device_info = {
     .name = TYPE_VIRTIO_DEVICE,
     .parent = TYPE_DEVICE,
diff --git a/qapi/virtio.json b/qapi/virtio.json
index de09d0e..048653d 100644
--- a/qapi/virtio.json
+++ b/qapi/virtio.json
@@ -1077,3 +1077,194 @@
   'data': { 'path': 'str', 'queue': 'uint16' },
   'returns': 'VirtVhostQueueStatus'
 }
+
+##
+# @VirtioRingDescFlags:
+#
+# An enumeration of the virtio ring descriptor flags
+#
+# Since: 6.2
+#
+##
+
+{ 'enum': 'VirtioRingDescFlags',
+  'data': [ 'next', 'write', 'indirect', 'avail', 'used' ]
+}
+
+##
+# @VirtioRingDesc:
+#
+# @addr: guest physical address of the descriptor data
+#
+# @len: length of the descriptor data
+#
+# @flags: descriptor flags
+#
+# Since: 6.2
+#
+##
+
+{ 'struct': 'VirtioRingDesc',
+    'data': {
+      'addr': 'uint64',
+      'len': 'uint32',
+      'flags': [ 'VirtioRingDescFlags' ]
+    }
+}
+
+##
+# @VirtioRingAvail:
+#
+# @flags: VRingAvail flags
+#
+# @idx: VRingAvail idx
+#
+# @ring: VRingAvail ring[] entry at provided index
+#
+# Since: 6.2
+#
+##
+
+{ 'struct': 'VirtioRingAvail',
+    'data': {
+      'flags': 'uint16',
+      'idx': 'uint16',
+      'ring': 'uint16'
+    }
+}
+
+##
+# @VirtioRingUsed:
+#
+# @flags: VRingUsed flags
+#
+# @idx: VRingUsed idx
+#
+# Since: 6.2
+#
+##
+
+{ 'struct': 'VirtioRingUsed',
+    'data': {
+      'flags': 'uint16',
+      'idx': 'uint16'
+    }
+}
+
+##
+# @VirtioQueueElement:
+#
+# @device-name: VirtIODevice name (for reference)
+#
+# @index: index of the element in the queue
+#
+# @ndescs: number of descriptors
+#
+# @descs: list of the descriptors
+#
+# @avail: VRingAvail info
+#
+# @used: VRingUsed info
+#
+# Since: 6.2
+#
+##
+
+{ 'struct': 'VirtioQueueElement',
+    'data': {
+      'device-name': 'str',
+      'index': 'uint32',
+      'ndescs': 'uint32',
+      'descs': [ 'VirtioRingDesc' ],
+      'avail': 'VirtioRingAvail',
+      'used': 'VirtioRingUsed'
+    }
+}
+
+##
+# @x-debug-virtio-queue-element:
+#
+# Return the information about an element queue (by default head)
+#
+# @path: VirtIO device canonical QOM path
+#
+# @queue: queue number to examine
+#
+# @index: the index in the queue, by default head
+#
+# Returns: the element information
+#
+# Since: 6.2
+#
+# Examples:
+#
+# 1. Introspect on virtio-net virtqueue 0 at index 5
+#
+# -> { "execute": "x-debug-virtio-queue-element",
+#      "arguments": {
+#          "path": "/machine/peripheral-anon/device[1]/virtio-backend",
+#          "queue": 0,
+#          "index": 5
+#      }
+#    }
+# <- { "return": {
+#         "index": 5,
+#         "ndescs": 1,
+#         "device-name": "virtio-net",
+#         "descs": [
+#             { "flags": ["write"], "len": 1536, "addr": 5257305600 }
+#         ],
+#         "avail": { "idx": 256, "flags": 0, "ring": 5 },
+#         "used": { "idx": 13, "flags": 0 }
+#      }
+#    }
+#
+# 2. Introspect on virtio-crypto virtqueue 1 at head
+#
+# -> { "execute": "x-debug-virtio-queue-element",
+#      "arguments": {
+#          "path": "/machine/peripheral/crypto0/virtio-backend",
+#          "queue": 1
+#      }
+#    }
+# <- { "return": {
+#         "index": 0,
+#         "ndescs": 1,
+#         "device-name": "virtio-crypto",
+#         "descs": [
+#             { "flags": [], "len": 0, "addr": 8080268923184214134 }
+#         ],
+#         "avail": { "idx": 280, "flags": 0, "ring": 0 },
+#         "used": { "idx": 280, "flags": 0 }
+#      }
+#    }
+#
+# 3. Introspect on virtio-scsi virtqueue 2 at head
+#
+# -> { "execute": "x-debug-virtio-queue-element",
+#      "arguments": {
+#          "path": "/machine/peripheral-anon/device[2]/virtio-backend",
+#          "queue": 2
+#      }
+#    }
+# <- { "return": {
+#         "index": 19,
+#         "ndescs": 1,
+#         "device-name": "virtio-scsi",
+#         "descs": [
+#             {
+#               "flags": ["used", "indirect", "write"], "len": 4099327944,
+#               "addr": 12055409292258155293
+#             }
+#         ],
+#         "avail": { "idx": 1147, "flags": 0, "ring": 19 },
+#         "used": { "idx": 1147, "flags": 0 }
+#      }
+#    }
+#
+##
+
+{ 'command': 'x-debug-virtio-queue-element',
+  'data': { 'path': 'str', 'queue': 'uint16', '*index': 'uint16' },
+  'returns': 'VirtioQueueElement'
+}
-- 
1.8.3.1


