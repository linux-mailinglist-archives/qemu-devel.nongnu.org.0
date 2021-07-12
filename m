Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 964713C4C96
	for <lists+qemu-devel@lfdr.de>; Mon, 12 Jul 2021 12:38:49 +0200 (CEST)
Received: from localhost ([::1]:34694 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m2tKq-0003ne-4P
	for lists+qemu-devel@lfdr.de; Mon, 12 Jul 2021 06:38:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42060)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jonah.palmer@oracle.com>)
 id 1m2tIp-0001YC-Qb; Mon, 12 Jul 2021 06:36:43 -0400
Received: from mx0b-00069f02.pphosted.com ([205.220.177.32]:12200)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jonah.palmer@oracle.com>)
 id 1m2tIn-0008Qp-Md; Mon, 12 Jul 2021 06:36:43 -0400
Received: from pps.filterd (m0246630.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 16CAVCPM019199; Mon, 12 Jul 2021 10:36:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : content-type :
 mime-version; s=corp-2020-01-29;
 bh=PaOGqDBwYCcn/aEJ1WufMq1IolZV9dkh33ie+9TbkAg=;
 b=rZDzgBhRlmsEZU/1x2VDbkg6bRt5tltmEQkyoDaUSjZTAKxRUQ2RJf+y0pPI9C/4Fn6w
 Gc718qmoJXvYsveEWzi+3u+diIRH14Y1sLLK7X/5UVsA2hD1tzGA0N3AhjQ6PJYUd0br
 /5PY45REL4dEfiSptJFR/pSL5DQQsZ4Gal6GQVN/l2o4T00CcSzw94U249zoy5D82NhZ
 /qGxl9eZbjE11HXLLxh9fAEN5eHm6Tbb9qTTBFpAeGa988xxF5OJUj8Szxka5F6iRO8h
 UabAHzHLefMaD3aYJJJ4BNDC5bkR95fJ0d5rO0DhRWnRIex8XR3u/4KK2fJOeCELMyhB uw== 
Received: from aserp3030.oracle.com (aserp3030.oracle.com [141.146.126.71])
 by mx0b-00069f02.pphosted.com with ESMTP id 39q1ybabye-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 12 Jul 2021 10:36:30 +0000
Received: from pps.filterd (aserp3030.oracle.com [127.0.0.1])
 by aserp3030.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 16CAYlAx001126;
 Mon, 12 Jul 2021 10:36:29 GMT
Received: from nam12-dm6-obe.outbound.protection.outlook.com
 (mail-dm6nam12lp2172.outbound.protection.outlook.com [104.47.59.172])
 by aserp3030.oracle.com with ESMTP id 39qycr841p-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 12 Jul 2021 10:36:29 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=N0+pa0wy+L2j4YquJJk45GptKE6ESZsDVR01x/TAMHaWeWTNBViCdqsDHTs2onVDXE6RTDzZVQ3kloMmAFXeNIjUaRS3BxUUITu1DFd512NNL4ByzvTfhjt2a4wl5dXSb5HfKhRJTGrMfvezBwbYqKw3fdsRIIkvPy5AuSmzV2w1qgz9snrUcP1qIHhUtDPegMYdmeNTMz2UfRCTd3aDFwbL7My3nWr9+1U/FF7iXDD6tdVD3UOV3Q4mvzZ+E/TbYhGiuKVpfpf0dt3W08FBJBmSig8wARDhStzQtG4z161GQ0HtjIEK2W1kezNpYr/0ycyI6b1WwrA/Sqr8LDw17Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PaOGqDBwYCcn/aEJ1WufMq1IolZV9dkh33ie+9TbkAg=;
 b=jFHA1FZ+9HMlklG0sQH6GW+FX4FCEPPHaufGY71OEDNY2B0En0jJCN7mGjMRmDq1F/tO6UU9okU37QPcf89H2JG2bmoVhY64kmBm7TKx3OBoX5n+NoCtuaqTnFVI5qC6/wy3Gf3u1FU/MoId1RAYiRvxwFJPbVjBRTrAHj+GsKGBpTxWukicc3EZeWFg6uX/Xg9I946WRL2BVFon8vesIk+wqYTDL5v7vu0uMrLLXgrluiLjaSDPB/7ulVeeowOsRziF+63hS8gu9RF1BbMbBdRjZBEEQdsPIxzI4cU7b+2zx7SvQniOBV9P0V4BU/3aqAkrQyP3VccYeLTZUUm5Sw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PaOGqDBwYCcn/aEJ1WufMq1IolZV9dkh33ie+9TbkAg=;
 b=Qde02EyV3RRYpLUoc6Y+C1d5bQvLcf5M/oKPGFY2zZGvPhIr3Ty7xovNYg2gP3EQdUfFP9CBL37H4nTc/VQqinoV6VJk1njM6PXjC385jR81URp95ZU/5jxZlSqGA59BM2i9T/f9mlVjnibIhQ/bTZo7TtI664DZvBTPyWrSiog=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=oracle.com;
Received: from PH0PR10MB4664.namprd10.prod.outlook.com (2603:10b6:510:41::11)
 by PH0PR10MB4584.namprd10.prod.outlook.com (2603:10b6:510:37::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4308.20; Mon, 12 Jul
 2021 10:36:27 +0000
Received: from PH0PR10MB4664.namprd10.prod.outlook.com
 ([fe80::c0ec:e3aa:9d8f:61c0]) by PH0PR10MB4664.namprd10.prod.outlook.com
 ([fe80::c0ec:e3aa:9d8f:61c0%6]) with mapi id 15.20.4308.026; Mon, 12 Jul 2021
 10:36:27 +0000
From: Jonah Palmer <jonah.palmer@oracle.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v6 2/6] qmp: add QMP command x-debug-virtio-status
Date: Mon, 12 Jul 2021 06:35:33 -0400
Message-Id: <1626086137-16292-3-git-send-email-jonah.palmer@oracle.com>
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
 Transport; Mon, 12 Jul 2021 10:36:25 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 63fb6e18-24ef-4bcb-9204-08d94520e772
X-MS-TrafficTypeDiagnostic: PH0PR10MB4584:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <PH0PR10MB45847EF5EEECA4D8BF654FDAE8159@PH0PR10MB4584.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:400;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: mdD6rPWllsCeXm+XMI1Mx8rvvguBFkScSXjJiVPJ9UNs2nhwBxPtAD0T5S0VOKEWXUK5bMZlXxQZVghVUmz5gfPM6B/b9K7cdslwXqizDPwOMnzAxB/v2t0NgMPyLKj6tJGWrqT2dQd3KPoUTlq59LXdPBTyVIc3h73Pk+bArkghJudBlrenH0ps6zGEFiHfE9ez4VtJH64R5l4+OSLVrgS1Ie7+g1DBMPJenuq32G+vClgIATtuWcdn9LO3MuY03HMUPIRPZHioy/Dbt4q5fFSTfxdXABhhetMV0p7s85pIiAYCu9hJ9OXMNIfCockoVG5Vv9hcRJDKWNVwzYb9ba10YnqmvtOLSvUzc/13JMKJ4RQVGOnwXhhc9mev8llPW6v4zaBbccmZI2TnC2p7/IZWmywHA56w8p9ONk9jdYfrGjxD1IyUnrsLpwcJg7xJp9i3o/rueOAKCSUqK4kdQA9IXnx/fLIdgduBDSe1T+ESYBaIZ1xIqvicYhC91iLJHNnmIcjNte8GkGVP8QheqMQhFoa6LuAQ3d7VlTsMfiK7Bm9FB4iVPvkk+Vt2KFE5bIS6KTD6iuhIufDK7JClmfuJlrc7zypWgojx1LJhKRWH1oGstpsxo7B0RaYbd/XIpVW7w2j6q0itKKKlcnwrl1L0AbtrlEqIgxwHj/JsX/f5PVbFRxH5q3EXLVcPDsUN6mxF1n58rCbR2ic7H3n/Xg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH0PR10MB4664.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(346002)(136003)(396003)(39860400002)(376002)(36756003)(6916009)(66476007)(66946007)(186003)(66556008)(6486002)(478600001)(6666004)(7416002)(52116002)(8676002)(2616005)(8936002)(86362001)(2906002)(44832011)(38350700002)(38100700002)(26005)(7696005)(956004)(4326008)(316002)(5660300002)(107886003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?yCDrP7p+bmA2g137tfzH8HACNk6DB4AWP9Z3Cd71cSvI6Fr/uGGWr2ROaWJT?=
 =?us-ascii?Q?BzJ4uxv5Ymln9Uq5XRKYsR9aObyJzlkRSsdDew3wvTAK75Jd9BnH1GmDISIo?=
 =?us-ascii?Q?KGzxTaHNZrZhcp5YDE3zKsAWnocEvsIxdTGWmfNEStpEfoM16NjTskdHcvPN?=
 =?us-ascii?Q?PjRF1erLoATiIXdiD9p8/HJEV1K4nkJIST/Y/ekSvqy7MYl4CMYONAZxd3AI?=
 =?us-ascii?Q?/xceqTh/US+lCWvrJluXV/hFKMZNHW3DibStK7qnYGAz2u6020KcaCZ22lCr?=
 =?us-ascii?Q?jhUk2g95md9/nxWaSoG0QNW8XveqRCUrOUvPJxEk6ctJHpPcOIli6nQqUxuO?=
 =?us-ascii?Q?RZZTz2bpj726CfzyFAqKBCW+t12DdXFxeTXsSvgoMbbxTDBY0UC0pl0OyJHX?=
 =?us-ascii?Q?ghmgLsQPuS385PrxoHWa3JWzo94gjWIJ0FSO/SU7Pvol8NIUhQGz91LTnpcZ?=
 =?us-ascii?Q?W1623Ov5R/WSCN19Zfdi4svablbuVoL3B4bx682cgSvMYZ6RSfeU96Rim1gx?=
 =?us-ascii?Q?ut1wvYNjmNCq1hA4Hq5BbhbU0JmCu08o9pvhsayeWvLqxIz5sMKbXGsyWDip?=
 =?us-ascii?Q?XjvofOOtH5O/gJrOApp54lopJ0d6KwuS05jN4ZNmCa4+gO6bDcEukbXtuuqZ?=
 =?us-ascii?Q?bxdYdwzzoRDzcYO8o6vpLq9tncYdZ2LoVvynaNytY58Pw3ofu7BQX0RjKJo8?=
 =?us-ascii?Q?Ite0GblUN58FSRO2T2O+BAlW5eRLoWf50yrehRtddRkoyiTRy3OL/o0rgTjc?=
 =?us-ascii?Q?up3g92bW4MqYm+2l6iNl/IlecSBKypVGbfrEmssfJ8d1oHW8zVuUWf87Tc/N?=
 =?us-ascii?Q?cxjRKlz/Pi1DubgCUQuFtw94FXxEy0j5mpf60mNfKydOF/U+S+Elg29/N9Fm?=
 =?us-ascii?Q?yperpoB+Od204Dt+FOB3k4fOWZFXxFc86/7x47zqlCA84LEXciSe8wlBO/iJ?=
 =?us-ascii?Q?+NbYX9NJ+tRYbxihyC7FZeBrekti6ybAP5uDyS7doD9pk6yW1HKPKfkNRABG?=
 =?us-ascii?Q?hEzCOvrCvoe+lyD0xu9j0A4xYHwWrLQYjFibRUmAqdD8OlLGbR4eUPSUsB3Y?=
 =?us-ascii?Q?XecEcK0DrozLHQ89skR9tGPSjVSbPnspbzU9BlOmFSUI63K+sOd+Gk4SrrSU?=
 =?us-ascii?Q?A0ZuYOZUwE2xfkN/bzuR6oHE5eF3vi3oH1bt5fGx7TBGCWgUjmLhIMloP9Cm?=
 =?us-ascii?Q?nZH9r8IieDt42+nMAHMy3iLq5QDgijDOx6fGH6CKYyZyw9LZph+p7wfebSA1?=
 =?us-ascii?Q?W1sv0b2+8rngCAiXpdcdLkVPvIO5PGzwn+LbueKV+7OQoX4IljsEcCUM4IO8?=
 =?us-ascii?Q?gHSqRUqvued3BUWb6QAB53Bv?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 63fb6e18-24ef-4bcb-9204-08d94520e772
X-MS-Exchange-CrossTenant-AuthSource: PH0PR10MB4664.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jul 2021 10:36:27.6091 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ey0qoK478e0lNubzTY3znFffR/xdnho4yO3Gu7Tc3us1ttgh5lD1j11qaam5wA1A7QjT6yxsGEBY4OhRVTb5VA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR10MB4584
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=10042
 signatures=668682
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 phishscore=0
 mlxlogscore=999
 adultscore=0 malwarescore=0 bulkscore=0 mlxscore=0 suspectscore=0
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2104190000 definitions=main-2107120082
X-Proofpoint-GUID: p4T2lZTRwDfDUwqJ4rDvsV-F_qW17PlZ
X-Proofpoint-ORIG-GUID: p4T2lZTRwDfDUwqJ4rDvsV-F_qW17PlZ
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

This new command shows the status of a VirtIODevice
(features, endianness and number of virtqueues)

Next patch will improve output by decoding feature bits.

Signed-off-by: Laurent Vivier <lvivier@redhat.com>
Signed-off-by: Jonah Palmer <jonah.palmer@oracle.com>
---
 hw/virtio/virtio-stub.c |  5 ++++
 hw/virtio/virtio.c      | 50 ++++++++++++++++++++++++++++++++
 qapi/virtio.json        | 76 +++++++++++++++++++++++++++++++++++++++++++++++++
 3 files changed, 131 insertions(+)

diff --git a/hw/virtio/virtio-stub.c b/hw/virtio/virtio-stub.c
index d4a88f5..ddb592f 100644
--- a/hw/virtio/virtio-stub.c
+++ b/hw/virtio/virtio-stub.c
@@ -12,3 +12,8 @@ VirtioInfoList *qmp_x_debug_query_virtio(Error **errp)
 {
     return qmp_virtio_unsupported(errp);
 }
+
+VirtioStatus *qmp_x_debug_virtio_status(const char* path, Error **errp)
+{
+    return qmp_virtio_unsupported(errp);
+}
diff --git a/hw/virtio/virtio.c b/hw/virtio/virtio.c
index f3fc1bb..222330a 100644
--- a/hw/virtio/virtio.c
+++ b/hw/virtio/virtio.c
@@ -3896,6 +3896,56 @@ VirtioInfoList *qmp_x_debug_query_virtio(Error **errp)
     return list;
 }
 
+static VirtIODevice *virtio_device_find(const char *path)
+{
+    VirtIODevice *vdev;
+
+    QTAILQ_FOREACH(vdev, &virtio_list, next) {
+        DeviceState *dev = DEVICE(vdev);
+
+        if (strcmp(dev->canonical_path, path) != 0) {
+            continue;
+        }
+        return vdev;
+    }
+
+    return NULL;
+}
+
+VirtioStatus *qmp_x_debug_virtio_status(const char* path, Error **errp)
+{
+    VirtIODevice *vdev;
+    VirtioStatus *status;
+
+    vdev = virtio_device_find(path);
+    if (vdev == NULL) {
+        error_setg(errp, "Path %s is not a VirtIO device", path);
+        return NULL;
+    }
+
+    status = g_new0(VirtioStatus, 1);
+    status->guest_features = vdev->guest_features;
+    status->host_features = vdev->host_features;
+    status->backend_features = vdev->backend_features;
+    status->device_id = vdev->device_id;
+
+    switch (vdev->device_endian) {
+    case VIRTIO_DEVICE_ENDIAN_LITTLE:
+        status->device_endian = VIRTIO_STATUS_ENDIANNESS_LITTLE;
+        break;
+    case VIRTIO_DEVICE_ENDIAN_BIG:
+        status->device_endian = VIRTIO_STATUS_ENDIANNESS_BIG;
+        break;
+    default:
+        status->device_endian = VIRTIO_STATUS_ENDIANNESS_UNKNOWN;
+        break;
+    }
+
+    status->num_vqs = virtio_get_num_queues(vdev);
+
+    return status;
+}
+
 static const TypeInfo virtio_device_info = {
     .name = TYPE_VIRTIO_DEVICE,
     .parent = TYPE_DEVICE,
diff --git a/qapi/virtio.json b/qapi/virtio.json
index 804adbe..4bd09c9 100644
--- a/qapi/virtio.json
+++ b/qapi/virtio.json
@@ -70,3 +70,79 @@
 ##
 
 { 'command': 'x-debug-query-virtio', 'returns': ['VirtioInfo'] }
+
+##
+# @VirtioStatusEndianness:
+#
+# Enumeration of endianness for VirtioDevice
+#
+# Since: 6.1
+##
+{ 'enum': 'VirtioStatusEndianness',
+  'data': [ 'unknown', 'little', 'big' ]
+}
+
+##
+# @VirtioStatus:
+#
+# @device-id: VirtIODevice status
+#
+# @device-endian: VirtIODevice device_endian
+#
+# @guest-features: VirtIODevice guest_features
+#
+# @host-features: VirtIODevice host_features
+#
+# @backend-features: VirtIODevice backend_features
+#
+# @num-vqs: number of VirtIODevice queues
+#
+# Since: 6.1
+#
+##
+
+{ 'struct': 'VirtioStatus',
+  'data': {
+    'device-id': 'int',
+    'device-endian': 'VirtioStatusEndianness',
+    'guest-features': 'uint64',
+    'host-features': 'uint64',
+    'backend-features': 'uint64',
+    'num-vqs': 'uint16'
+  }
+}
+
+##
+# @x-debug-virtio-status:
+#
+# Return the status of virtio device
+#
+# @path: QOBject path of the VirtIODevice
+#
+# Returns: status of the VirtIODevice
+#
+# Since: 6.1
+#
+# Example:
+#
+# -> { "execute": "x-debug-virtio-status",
+#      "arguments": {
+#          "path": "/machine/peripheral-anon/device[3]/virtio-backend"
+#      }
+#   }
+# <- { "return": {
+#          "backend-features": 0,
+#          "guest-features": 5111807911,
+#          "num-vqs": 3,
+#          "host-features": 6337593319,
+#          "device-endian": "little",
+#          "device-id": 1
+#      }
+#    }
+#
+##
+
+{ 'command': 'x-debug-virtio-status',
+  'data': { 'path': 'str' },
+  'returns': 'VirtioStatus'
+}
-- 
1.8.3.1


