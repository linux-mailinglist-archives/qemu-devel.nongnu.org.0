Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BD2A469612
	for <lists+qemu-devel@lfdr.de>; Mon,  6 Dec 2021 13:56:51 +0100 (CET)
Received: from localhost ([::1]:51774 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1muDY2-0006Ji-4J
	for lists+qemu-devel@lfdr.de; Mon, 06 Dec 2021 07:56:50 -0500
Received: from eggs.gnu.org ([209.51.188.92]:51824)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jonah.palmer@oracle.com>)
 id 1muDMm-0000no-9z; Mon, 06 Dec 2021 07:45:12 -0500
Received: from mx0b-00069f02.pphosted.com ([205.220.177.32]:41966)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jonah.palmer@oracle.com>)
 id 1muDMU-00020J-2G; Mon, 06 Dec 2021 07:44:57 -0500
Received: from pps.filterd (m0246631.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 1B6C5As1023240; 
 Mon, 6 Dec 2021 12:44:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : content-type :
 mime-version; s=corp-2021-07-09;
 bh=8qInwgMpf+UzuHXr3i/0XZ+VnDb+8vdGwmlMTuzqRh8=;
 b=hJCK7KwgLMja5Glkgwdw2eQN5WHZARdRMDECQ4vDARD47gqgpqRx4qHnffBl+m0YxYf2
 RjqmMR+ApvnC6afmmgRuKFLqHGKPp344/CHIE80nfoB2lq59GlIaoJlZuMqEW8NoxZs1
 XUe0BkfEjmFEXP++y09Rr+QQAT4r/rgERopb9MODcHEHj2YjdrGa55rNfBP7zpaa4x1p
 kjZCX6DKS7YV2XcTK7XubajloBQ47hncKhS8ZxZjsbNsFfPrXZ1S/ebI5Vt60IWeVBz7
 7ZlgJfX1OM5mtgiQYRQBRB0KkXbl7fgBp6TdmUjFQQg9H3DC6vZlu7yE02ArVsnbD1b3 ZA== 
Received: from aserp3030.oracle.com (aserp3030.oracle.com [141.146.126.71])
 by mx0b-00069f02.pphosted.com with ESMTP id 3csbbqj2pb-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 06 Dec 2021 12:44:24 +0000
Received: from pps.filterd (aserp3030.oracle.com [127.0.0.1])
 by aserp3030.oracle.com (8.16.1.2/8.16.1.2) with SMTP id 1B6Cf9oa139484;
 Mon, 6 Dec 2021 12:44:23 GMT
Received: from nam10-bn7-obe.outbound.protection.outlook.com
 (mail-bn7nam10lp2102.outbound.protection.outlook.com [104.47.70.102])
 by aserp3030.oracle.com with ESMTP id 3csc4rqj89-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 06 Dec 2021 12:44:23 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mk0QLBG8HzqOZzwppVJ840BWmsaq28NKJFNTdNtWJMZRS/EKXI+1P7cAF0Px8l3RIjoadcI/+NRHpp6XKxnFIh4QPw8K17EgFxB6JL8+LiInTKvV/guPUqeK//wxJ78JzooJ0Y3sl3yOpQ6OfLM6LeTyl7LP0KWdmhAwRX5/UZutog1Yv9DCETbBRG7AHsJYqfnWNsxgziggYlvOhwWRc/JCbmWy+XjsxZaZYRArZdA1HsJzCEtntD7rSGRr2v8o6weK6ODQTBqxGXy3BA+zAP+KDwGJNdnbN9CNwKRoW3RbyjRXoF5PQMHLxWoeZPDw8Qs9NPHxuQgzrEbkujEPcw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8qInwgMpf+UzuHXr3i/0XZ+VnDb+8vdGwmlMTuzqRh8=;
 b=mSfUk3+DWJRPVCIFQpOw95DBZjVEsPS6bPqrwR7izSJHrtf+pbIUQFghgEKnd18Y2gAZo5wc2E/UPIiVkAOrx+SoELXvGCeSRZ1AwBLx1YqXPJXHqSY86Ct+YW9r+7RrXSOKtbEQRS2pH4ZzkBTZwp3YDPZY+pDH1qY/dg74/LoF1JvO8Q+42QbOi9Dp7NKzNfNsTlWqEPAKYCNr7nk/h1UDLZSuWgmpC6nsqcGlE/WlMMuymAA4NP7fH8SXLrzsZ9d12FSMIQ9HHJyJcB6VpDV3nVZmGdOABbp0RdaNQk3TYIEC5xpkGBCk7huPTxcizbDV1feky+kcVagdno8/9w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8qInwgMpf+UzuHXr3i/0XZ+VnDb+8vdGwmlMTuzqRh8=;
 b=dZjVucvwkhMTkgfOK9fqYkFeud1hXGGhxiEcnH5Z2kDy9Womu6ZA16HlWC4gCcCFG/NWVtsRvZrPP3ytiUC7y7zRi4MFr5PAGIiTBUycSkHFEpWI7uM4YYcQvJJRQlwrgX+WEqODQvzs/8PgltoPyJK3QT6NMz9zFqMBq/05i2w=
Received: from PH0PR10MB4664.namprd10.prod.outlook.com (2603:10b6:510:41::11)
 by PH0PR10MB4791.namprd10.prod.outlook.com (2603:10b6:510:3a::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4755.20; Mon, 6 Dec
 2021 12:44:21 +0000
Received: from PH0PR10MB4664.namprd10.prod.outlook.com
 ([fe80::3446:f4ea:c037:4517]) by PH0PR10MB4664.namprd10.prod.outlook.com
 ([fe80::3446:f4ea:c037:4517%5]) with mapi id 15.20.4755.022; Mon, 6 Dec 2021
 12:44:21 +0000
From: Jonah Palmer <jonah.palmer@oracle.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v10 5/8] qmp: decode feature & status bits in virtio-status
Date: Mon,  6 Dec 2021 07:43:23 -0500
Message-Id: <1638794606-19631-6-git-send-email-jonah.palmer@oracle.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1638794606-19631-1-git-send-email-jonah.palmer@oracle.com>
References: <1638794606-19631-1-git-send-email-jonah.palmer@oracle.com>
Content-Type: text/plain
X-ClientProxiedBy: SA9P223CA0030.NAMP223.PROD.OUTLOOK.COM
 (2603:10b6:806:26::35) To PH0PR10MB4664.namprd10.prod.outlook.com
 (2603:10b6:510:41::11)
MIME-Version: 1.0
Received: from jonpalme-lnx.us.oracle.com (209.17.40.42) by
 SA9P223CA0030.NAMP223.PROD.OUTLOOK.COM (2603:10b6:806:26::35) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4755.21 via Frontend Transport; Mon, 6 Dec 2021 12:44:18 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 814803de-874a-4c6f-e035-08d9b8b61fc2
X-MS-TrafficTypeDiagnostic: PH0PR10MB4791:EE_
X-Microsoft-Antispam-PRVS: <PH0PR10MB4791E06114ECC33DE9B4EA10E86D9@PH0PR10MB4791.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:4303;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: CMMxMM83e6ecq6hg5XDRXPL7mfVy0CmC97brO8P22cdwaeJr5Ai40isfXZ+Lh8+72qchZVWd8t+pU0GS1d2m43jjVkq6fmwk1TW7KWeNeAOXGMd6SQrHCK2B1b+NR3Vh/Ux6o15eopYkD6lz4Jt0c8cbHv1jryvwNHo26WMcUac5rctmO5jl1rv+bUSF3W38MjKgKhwLCBUaTaoQXR5BmA/i6hf75q7QUg6/UkjqndaessB8wSL1EVx5JeuIhUm5Lt1avEoQdmxCMs1sra0mJmw1vxAoFdjelIklylz8Ci6C73bCtQvba9NmYdrl3pR7dAgy5qTpbsf0AOVLwjIVdxEzLA5u/nNKoS40YSmfmZJXgptHESmenR2jovcli4ur5tA5fmYboCAEyT3OOcFJLpsz369rZ1y9uB1gJLsdtlU/M0WSA7INL/4+13T8qbk7bO54ZYAEhkQYZzRL/M0tUqRTdcuuuoJBXB/qqGzabePoGv1oMvbHUXvrZ9x3h5xLqleeLHkr+FeJO9yg5ZHl77ik99YaAtsP6gTE/edBEHe9VdNQx2CVW0RSAy3nJvAHkVonnb8EEbyJI+Z7ayvdGERdSvWKO7Ijb1jnYIdqPX9xtJ0HQ58BEF8679gDRmqrhIYwMoFeXwsoVrtmoy7qBpBH29YCAwaxz5gti48pJf1116vH+0+44R9aMdJtRvf0
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH0PR10MB4664.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(956004)(66556008)(52116002)(186003)(8936002)(38350700002)(508600001)(6486002)(2616005)(83380400001)(7696005)(36756003)(6916009)(86362001)(38100700002)(30864003)(66476007)(5660300002)(26005)(316002)(66946007)(4326008)(6666004)(7416002)(8676002)(44832011)(2906002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Ic3SXbxz0YbQP8jXBMXHxV8+XHEkUEr4LZf5gdnqy9wCOBQwzUMud0E2XP2k?=
 =?us-ascii?Q?hAnG3LBQ4nKcpaxXD6QcTKCPwQfDGqubaMf1NW1jw04TlImS7jO9Qs6Uczkg?=
 =?us-ascii?Q?IBUO8xQfy8KB6RLRcfh5RyTSAtUsAJ8kcXhXNikznlZbJkM0x4Z0tJaOAYat?=
 =?us-ascii?Q?6RPLo9x6EZn65tqchjx+IkutquRZ79pikBk0XsZHUkkybVuUDvUDv6HrwR+Z?=
 =?us-ascii?Q?eTrFTp47b/P/fuejSZ1CpPCF3R0sL3uBUC8g65tTCLi52iEtnmp1K+VYaGX4?=
 =?us-ascii?Q?RqyWf+x5r+ruQveqDed3yTuoTSpuZgMXBXUQTDIew2rfJ/kzS2lNySmLxXK5?=
 =?us-ascii?Q?v2xSnWvPWgtjBMJ/bNnXA7pkcbVUrFysdvE/Rzqq5Y7twB0czpwpE5jR9RiK?=
 =?us-ascii?Q?OCOflwgVkLhlVxWkMTfeoarpS3gB/WORQWC61nng3g1Te3bc+obueqOx1osh?=
 =?us-ascii?Q?B9Mc8k3Z/Xcf4M3TDb+uzO+yNCmhtUMcfRVBOBBDZF5AYmv0P3dfkg5ZzEh/?=
 =?us-ascii?Q?0t8tlDUMrKM/A466y4cvq1R/Q8ZQ2/zDo/qiXoEzL/lhMMXpOBxemlRUdFzm?=
 =?us-ascii?Q?fUOVIW4vCzazF01JXCAaIcmcHoHsIczwRfi/od8mQiDgX3uMzixkcy69NKCs?=
 =?us-ascii?Q?ZE9Y1+9uDNDqm9JcW/2VGNI35i3lQoj2mXECqUPoU2dy7Z7GzhS4KywiiCON?=
 =?us-ascii?Q?eLUyuVB1cZ9rDRBeGESasIkUn2Vyg5oUhrRsxPl9cy3oCw8PN+hoZ92L2//u?=
 =?us-ascii?Q?HeGQjnqfuhx8duIO2U83rVPSTdXnCStZoIZBlWfzD+fKSKjs5umhgCM80OSq?=
 =?us-ascii?Q?i6U9fBDxSA6p/sOPaoNeed7j1D3Q4A0W16ZqsT2zJ+FTvHS5QP7/W63Btx24?=
 =?us-ascii?Q?jEbwEU4AgFx6BTWmwkoekMBPbceoquqV1j+iwyU9+YAZb5iTGkc/13bmJZCo?=
 =?us-ascii?Q?C8nzZN6IjMTIXUu3cAN+dUJHxsltl2aN/byFNqrJZT0d7xs2aDK08x1JcG4E?=
 =?us-ascii?Q?R+mZ2Tm9JF3wOiXgpL2UtvxPv+/1zLguL2qnsJIABO39qDto6eY52rNKGSzj?=
 =?us-ascii?Q?ib50/k/vN84cxYbrWOnkCCqWgI/VYWVSI5SlaNLf/RIGWIMxGoKxpalm5xTn?=
 =?us-ascii?Q?PPgpmSPdcsUmiiXow3siEYur9qV68VN5yk1u8N2IGuVmfRfoDEso8v1Bpu4m?=
 =?us-ascii?Q?wb/2XZJ002/IC9XC9QFRqJ/83L8LntR08DvvpSL239j0hdPOevaJBaDtKfHT?=
 =?us-ascii?Q?PMB3wvmOG8TFEJ/EnrE+kraxHkC3BcQTFZa22jtMUgTcAcNIEF4qRHFDcOAb?=
 =?us-ascii?Q?loWNpy/6Fzy+k5pb3VNBT3YJdeFG+QnaS9S6abPCifKcwj3uq/n0MFwadg89?=
 =?us-ascii?Q?8BGfpBfknYhNo6Ioghgv2yF1JGPLy2tRNLJXhsTvT9Tz6KPXarQCiXQIjaNs?=
 =?us-ascii?Q?iIhMblbXskZ2CsZflWhRhZdASiWdQx50ZDqgPSZDOL43PZb1OyABToioENUf?=
 =?us-ascii?Q?sUjxYgMbbFHCYCPsi05hIFxJkCuUkUYudQtr06SgCF8FTK3+tfpg2RwsiXC7?=
 =?us-ascii?Q?S6pk8swFN8ix8ynE63tBjLBDxPjhwyaJTIUiEDAuATbMKNAxcsPg1hxh8uEZ?=
 =?us-ascii?Q?q993dx+QZpsU+lJ/th8R9zg=3D?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 814803de-874a-4c6f-e035-08d9b8b61fc2
X-MS-Exchange-CrossTenant-AuthSource: PH0PR10MB4664.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Dec 2021 12:44:20.8917 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Mf3smiAqwX/z5GDH1dMuzzNA98NqBBzh2VoVb7R264bzCUFdeGjaoDbQVo5lcM8NmNjn3TwCQ2XLOGQOQPYoLg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR10MB4791
X-Proofpoint-Virus-Version: vendor=nai engine=6300 definitions=10189
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0
 mlxlogscore=999
 phishscore=0 bulkscore=0 malwarescore=0 spamscore=0 suspectscore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2110150000 definitions=main-2112060078
X-Proofpoint-GUID: 6XNYL4viVDidqBCyGHMck3Tc8dO5iUE9
X-Proofpoint-ORIG-GUID: 6XNYL4viVDidqBCyGHMck3Tc8dO5iUE9
Received-SPF: pass client-ip=205.220.177.32;
 envelope-from=jonah.palmer@oracle.com; helo=mx0b-00069f02.pphosted.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 MSGID_FROM_MTA_HEADER=0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: mst@redhat.com, qemu_oss@crudebyte.com, kraxel@redhat.com,
 si-wei.liu@oracle.com, joao.m.martins@oracle.com, eblake@redhat.com,
 qemu-block@nongnu.org, david@redhat.com, armbru@redhat.com,
 arei.gonglei@huawei.com, marcandre.lureau@redhat.com, lvivier@redhat.com,
 thuth@redhat.com, michael.roth@amd.com, groug@kaod.org, dgilbert@redhat.com,
 eric.auger@redhat.com, stefanha@redhat.com, boris.ostrovsky@oracle.com,
 kwolf@redhat.com, mathieu.poirier@linaro.org, raphael.norwitz@nutanix.com,
 pbonzini@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Laurent Vivier <lvivier@redhat.com>

Display feature names instead of bitmaps for host, guest, and
backend for VirtIODevices.

Display status names instead of bitmaps for VirtIODevices.

Display feature names instead of bitmaps for backend, protocol,
acked, and features (hdev->features) for vhost devices.

Decode features according to device ID. Decode statuses
according to configuration status bitmap (config_status_map).
Decode vhost user protocol features according to vhost user
protocol bitmap (vhost_user_protocol_map).

Transport features are on the first line. Undecoded bits (if
any) are stored in a separate field.

Signed-off-by: Jonah Palmer <jonah.palmer@oracle.com>
---
 hw/block/virtio-blk.c          |  29 +++++
 hw/char/virtio-serial-bus.c    |  11 ++
 hw/display/virtio-gpu-base.c   |  18 ++-
 hw/input/virtio-input.c        |  10 ++
 hw/net/virtio-net.c            |  47 +++++++
 hw/scsi/virtio-scsi.c          |  17 +++
 hw/virtio/vhost-user-fs.c      |  10 ++
 hw/virtio/vhost-vsock-common.c |  10 ++
 hw/virtio/virtio-balloon.c     |  14 ++
 hw/virtio/virtio-crypto.c      |  10 ++
 hw/virtio/virtio-iommu.c       |  14 ++
 hw/virtio/virtio-mem.c         |  11 ++
 hw/virtio/virtio.c             | 286 +++++++++++++++++++++++++++++++++++++++--
 include/hw/virtio/vhost.h      |   3 +
 include/hw/virtio/virtio.h     |  18 +++
 qapi/virtio.json               | 156 +++++++++++++++++++---
 16 files changed, 635 insertions(+), 29 deletions(-)

diff --git a/hw/block/virtio-blk.c b/hw/block/virtio-blk.c
index 505e574..d550f077 100644
--- a/hw/block/virtio-blk.c
+++ b/hw/block/virtio-blk.c
@@ -13,6 +13,7 @@
 
 #include "qemu/osdep.h"
 #include "qapi/error.h"
+#include "qapi/qapi-visit-virtio.h"
 #include "qemu/iov.h"
 #include "qemu/module.h"
 #include "qemu/error-report.h"
@@ -32,10 +33,38 @@
 #include "hw/virtio/virtio-bus.h"
 #include "migration/qemu-file-types.h"
 #include "hw/virtio/virtio-access.h"
+#include "standard-headers/linux/vhost_types.h"
 
 /* Config size before the discard support (hide associated config fields) */
 #define VIRTIO_BLK_CFG_SIZE offsetof(struct virtio_blk_config, \
                                      max_discard_sectors)
+
+qmp_virtio_feature_map_t blk_map[] = {
+#define FEATURE_ENTRY(name) \
+    { VIRTIO_BLK_F_##name, #name }
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
+    { VHOST_F_##name, #name  }
+    FEATURE_ENTRY(LOG_ALL),
+#undef FEATURE_ENTRY
+    { -1, ""  }
+};
+
 /*
  * Starting from the discard feature, we can use this array to properly
  * set the config size depending on the features enabled.
diff --git a/hw/char/virtio-serial-bus.c b/hw/char/virtio-serial-bus.c
index 9f19fd0..9de2575 100644
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
+    { VIRTIO_CONSOLE_F_##name, #name }
+    FEATURE_ENTRY(SIZE),
+    FEATURE_ENTRY(MULTIPORT),
+    FEATURE_ENTRY(EMERG_WRITE),
+#undef FEATURE_ENTRY
+    { -1, "" }
+};
+
 static struct VirtIOSerialDevices {
     QLIST_HEAD(, VirtIOSerial) devices;
 } vserdevices;
diff --git a/hw/display/virtio-gpu-base.c b/hw/display/virtio-gpu-base.c
index 5411a7b..f6b2373 100644
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
+    { VIRTIO_GPU_F_##name, #name }
+    FEATURE_ENTRY(VIRGL),
+    FEATURE_ENTRY(EDID),
+    FEATURE_ENTRY(RESOURCE_UUID),
+    FEATURE_ENTRY(RESOURCE_BLOB),
+#undef FEATURE_ENTRY
+#define FEATURE_ENTRY(name) \
+    { VHOST_F_##name, #name }
+    FEATURE_ENTRY(LOG_ALL),
+#undef FEATURE_ENTRY
+    { -1, "" }
+};
+
 void
 virtio_gpu_base_reset(VirtIOGPUBase *g)
 {
diff --git a/hw/input/virtio-input.c b/hw/input/virtio-input.c
index 5b5398b..fe0ed6d 100644
--- a/hw/input/virtio-input.c
+++ b/hw/input/virtio-input.c
@@ -6,6 +6,7 @@
 
 #include "qemu/osdep.h"
 #include "qapi/error.h"
+#include "qapi/qapi-visit-virtio.h"
 #include "qemu/iov.h"
 #include "qemu/module.h"
 #include "trace.h"
@@ -14,10 +15,19 @@
 #include "hw/qdev-properties.h"
 #include "hw/virtio/virtio-input.h"
 
+#include "standard-headers/linux/vhost_types.h"
 #include "standard-headers/linux/input.h"
 
 #define VIRTIO_INPUT_VM_VERSION 1
 
+qmp_virtio_feature_map_t input_map[] = {
+#define FEATURE_ENTRY(name) \
+    { VHOST_F_##name, #name }
+    FEATURE_ENTRY(LOG_ALL),
+#undef FEATURE_ENTRY
+    { -1, "" }
+};
+
 /* ----------------------------------------------------------------- */
 
 void virtio_input_send(VirtIOInput *vinput, virtio_input_event *event)
diff --git a/hw/net/virtio-net.c b/hw/net/virtio-net.c
index 2449b9c..b4a0ab8 100644
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
+    { VIRTIO_NET_F_##name, #name }
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
+    { VHOST_NET_F_##name, #name }
+    FEATURE_ENTRY(VIRTIO_NET_HDR),
+#undef FEATURE_ENTRY
+#define FEATURE_ENTRY(name) \
+    { VHOST_F_##name, #name }
+    FEATURE_ENTRY(LOG_ALL),
+#undef FEATURE_ENTRY
+    { -1, "" }
+};
+
 static const VirtIOFeature feature_sizes[] = {
     {.flags = 1ULL << VIRTIO_NET_F_MAC,
      .end = endof(struct virtio_net_config, mac)},
diff --git a/hw/scsi/virtio-scsi.c b/hw/scsi/virtio-scsi.c
index ce71939..caa3be8 100644
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
+    { VIRTIO_SCSI_F_##name, #name }
+    FEATURE_ENTRY(INOUT),
+    FEATURE_ENTRY(HOTPLUG),
+    FEATURE_ENTRY(CHANGE),
+    FEATURE_ENTRY(T10_PI),
+#undef FEATURE_ENTRY
+#define FEATURE_ENTRY(name) \
+    { VHOST_F_##name, #name }
+    FEATURE_ENTRY(LOG_ALL),
+#undef FEATURE_ENTRY
+    { -1, "" }
+};
+
 static inline int virtio_scsi_get_lun(uint8_t *lun)
 {
     return ((lun[2] << 8) | lun[3]) & 0x3FFF;
diff --git a/hw/virtio/vhost-user-fs.c b/hw/virtio/vhost-user-fs.c
index e513e4f..096cc07 100644
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
+    { VHOST_F_##name, #name }
+    FEATURE_ENTRY(LOG_ALL),
+#undef FEATURE_ENTRY
+    { -1, "" }
+};
 
 static const int user_feature_bits[] = {
     VIRTIO_F_VERSION_1,
diff --git a/hw/virtio/vhost-vsock-common.c b/hw/virtio/vhost-vsock-common.c
index 416daf8..047ebb7 100644
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
+    { VHOST_F_##name, #name }
+    FEATURE_ENTRY(LOG_ALL),
+#undef FEATURE_ENTRY
+    { -1, "" }
+};
 
 const int feature_bits[] = {
     VIRTIO_VSOCK_F_SEQPACKET,
diff --git a/hw/virtio/virtio-balloon.c b/hw/virtio/virtio-balloon.c
index 236542f..6705314 100644
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
+    { VIRTIO_BALLOON_F_##name, #name }
+    FEATURE_ENTRY(MUST_TELL_HOST),
+    FEATURE_ENTRY(STATS_VQ),
+    FEATURE_ENTRY(DEFLATE_ON_OOM),
+    FEATURE_ENTRY(FREE_PAGE_HINT),
+    FEATURE_ENTRY(PAGE_POISON),
+    FEATURE_ENTRY(REPORTING),
+#undef FEATURE_ENTRY
+    { -1, "" }
+};
+
 typedef struct PartiallyBalloonedPage {
     ram_addr_t base_gpa;
     unsigned long *bitmap;
diff --git a/hw/virtio/virtio-crypto.c b/hw/virtio/virtio-crypto.c
index 7d63b8c..b938bd8 100644
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
+    { VHOST_F_##name, #name }
+    FEATURE_ENTRY(LOG_ALL),
+#undef FEATURE_ENTRY
+    { -1, "" }
+};
+
 /*
  * Transfer virtqueue index to crypto queue index.
  * The control virtqueue is after the data virtqueues
diff --git a/hw/virtio/virtio-iommu.c b/hw/virtio/virtio-iommu.c
index 92c5eb7..13c3a13 100644
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
+    { VIRTIO_IOMMU_F_##name, #name }
+    FEATURE_ENTRY(INPUT_RANGE),
+    FEATURE_ENTRY(DOMAIN_RANGE),
+    FEATURE_ENTRY(MAP_UNMAP),
+    FEATURE_ENTRY(BYPASS),
+    FEATURE_ENTRY(PROBE),
+    FEATURE_ENTRY(MMIO),
+#undef FEATURE_ENTRY
+    { -1, "" }
+};
+
 typedef struct VirtIOIOMMUDomain {
     uint32_t id;
     GTree *mappings;
diff --git a/hw/virtio/virtio-mem.c b/hw/virtio/virtio-mem.c
index e217520..e619d7d 100644
--- a/hw/virtio/virtio-mem.c
+++ b/hw/virtio/virtio-mem.c
@@ -25,6 +25,7 @@
 #include "hw/virtio/virtio-mem.h"
 #include "qapi/error.h"
 #include "qapi/visitor.h"
+#include "qapi/qapi-visit-virtio.h"
 #include "exec/ram_addr.h"
 #include "migration/misc.h"
 #include "hw/boards.h"
@@ -32,6 +33,16 @@
 #include CONFIG_DEVICES
 #include "trace.h"
 
+qmp_virtio_feature_map_t mem_map[] = {
+#define FEATURE_ENTRY(name) \
+    { VIRTIO_MEM_F_##name, #name }
+#ifndef CONFIG_ACPI
+    FEATURE_ENTRY(ACPI_PXM),
+#endif /* CONFIG_ACPI */
+#undef FEATURE_ENTRY
+    { -1, "" }
+};
+
 /*
  * Let's not allow blocks smaller than 1 MiB, for example, to keep the tracking
  * bitmap small.
diff --git a/hw/virtio/virtio.c b/hw/virtio/virtio.c
index b8112ca..b4b2af8 100644
--- a/hw/virtio/virtio.c
+++ b/hw/virtio/virtio.c
@@ -30,11 +30,100 @@
 #include "sysemu/dma.h"
 #include "sysemu/runstate.h"
 #include "standard-headers/linux/virtio_ids.h"
+#include "standard-headers/linux/vhost_types.h"
+#include CONFIG_DEVICES
 
 /* QAPI list of realized VirtIODevices */
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
+    { VIRTIO_F_##name, #name }
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
+    { VIRTIO_RING_F_##name, #name }
+    FEATURE_ENTRY(INDIRECT_DESC),
+    FEATURE_ENTRY(EVENT_IDX),
+#undef FEATURE_ENTRY
+#define FEATURE_ENTRY(name) \
+    { VHOST_USER_F_##name, #name }
+    FEATURE_ENTRY(PROTOCOL_FEATURES),
+#undef FEATURE_ENTRY
+    { -1, "" }
+};
+
+static qmp_virtio_feature_map_t vhost_user_protocol_map[] = {
+#define FEATURE_ENTRY(name) \
+    { VHOST_USER_PROTOCOL_F_##name, #name }
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
+    { -1, "" }
+};
+
+/* virtio device configuration statuses */
+static qmp_virtio_feature_map_t config_status_map[] = {
+#define STATUS_ENTRY(name) \
+    { VIRTIO_CONFIG_S_##name, #name }
+    STATUS_ENTRY(DRIVER_OK),
+    STATUS_ENTRY(FEATURES_OK),
+    STATUS_ENTRY(DRIVER),
+    STATUS_ENTRY(NEEDS_RESET),
+    STATUS_ENTRY(FAILED),
+    STATUS_ENTRY(ACKNOWLEDGE),
+#undef STATUS_ENTRY
+    { -1, "" }
+};
+
+/*
  * The alignment to use between consumer and producer parts of vring.
  * x86 pagesize again. This is the default, used by transports like PCI
  * which don't provide a means for the guest to tell the host the alignment.
@@ -3940,6 +4029,180 @@ static VirtIODevice *virtio_device_find(const char *path)
     return NULL;
 }
 
+#define CONVERT_FEATURES(type, map, is_status, bitmap)   \
+    ({                                                   \
+        type *list = NULL;                               \
+        type *node;                                      \
+        for (i = 0; map[i].virtio_bit != -1; i++) {      \
+            if (is_status) {                             \
+                bit = map[i].virtio_bit;                 \
+            }                                            \
+            else {                                       \
+                bit = 1ULL << map[i].virtio_bit;         \
+            }                                            \
+            if ((bitmap & bit) == 0) {                   \
+                continue;                                \
+            }                                            \
+            node = g_new0(type, 1);                      \
+            node->value = g_strdup(map[i].feature_name); \
+            node->next = list;                           \
+            list = node;                                 \
+            bitmap ^= bit;                               \
+        }                                                \
+        list;                                            \
+    })
+
+static VirtioDeviceStatus *qmp_decode_status(uint8_t bitmap)
+{
+    VirtioDeviceStatus *status;
+    uint8_t bit;
+    int i;
+
+    status = g_new0(VirtioDeviceStatus, 1);
+    status->statuses = CONVERT_FEATURES(strList, config_status_map, 1, bitmap);
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
+    vhu_protocols->protocols =
+                    CONVERT_FEATURES(strList,
+                                     vhost_user_protocol_map, 0, bitmap);
+    vhu_protocols->has_unknown_protocols = bitmap != 0;
+    if (vhu_protocols->has_unknown_protocols) {
+        vhu_protocols->unknown_protocols = bitmap;
+    }
+
+    return vhu_protocols;
+}
+
+static VirtioDeviceFeatures *qmp_decode_features(uint16_t device_id,
+                                                 uint64_t bitmap)
+{
+    VirtioDeviceFeatures *features;
+    uint64_t bit;
+    int i;
+
+    features = g_new0(VirtioDeviceFeatures, 1);
+    features->has_dev_features = true;
+
+    /* transport features */
+    features->transports = CONVERT_FEATURES(strList, transport_map, 0, bitmap);
+
+    /* device features */
+    switch (device_id) {
+#ifdef CONFIG_VIRTIO_SERIAL
+    case VIRTIO_ID_CONSOLE:
+        features->dev_features =
+            CONVERT_FEATURES(strList, serial_map, 0, bitmap);
+        break;
+#endif
+#ifdef CONFIG_VIRTIO_BLK
+    case VIRTIO_ID_BLOCK:
+        features->dev_features =
+            CONVERT_FEATURES(strList, blk_map, 0, bitmap);
+        break;
+#endif
+#ifdef CONFIG_VIRTIO_GPU
+    case VIRTIO_ID_GPU:
+        features->dev_features =
+            CONVERT_FEATURES(strList, gpu_map, 0, bitmap);
+        break;
+#endif
+#ifdef CONFIG_VIRTIO_NET
+    case VIRTIO_ID_NET:
+        features->dev_features =
+            CONVERT_FEATURES(strList, net_map, 0, bitmap);
+        break;
+#endif
+#ifdef CONFIG_VIRTIO_SCSI
+    case VIRTIO_ID_SCSI:
+        features->dev_features =
+            CONVERT_FEATURES(strList, scsi_map, 0, bitmap);
+        break;
+#endif
+#ifdef CONFIG_VIRTIO_BALLOON
+    case VIRTIO_ID_BALLOON:
+        features->dev_features =
+            CONVERT_FEATURES(strList, balloon_map, 0, bitmap);
+        break;
+#endif
+#ifdef CONFIG_VIRTIO_IOMMU
+    case VIRTIO_ID_IOMMU:
+        features->dev_features =
+            CONVERT_FEATURES(strList, iommu_map, 0, bitmap);
+        break;
+#endif
+#ifdef CONFIG_VIRTIO_INPUT
+    case VIRTIO_ID_INPUT:
+        features->dev_features =
+            CONVERT_FEATURES(strList, input_map, 0, bitmap);
+        break;
+#endif
+#ifdef CONFIG_VHOST_USER_FS
+    case VIRTIO_ID_FS:
+        features->dev_features =
+            CONVERT_FEATURES(strList, fs_map, 0, bitmap);
+        break;
+#endif
+#ifdef CONFIG_VHOST_VSOCK
+    case VIRTIO_ID_VSOCK:
+        features->dev_features =
+            CONVERT_FEATURES(strList, vsock_map, 0, bitmap);
+        break;
+#endif
+#ifdef CONFIG_VIRTIO_CRYPTO
+    case VIRTIO_ID_CRYPTO:
+        features->dev_features =
+            CONVERT_FEATURES(strList, crypto_map, 0, bitmap);
+        break;
+#endif
+#ifdef CONFIG_VIRTIO_MEM
+    case VIRTIO_ID_MEM:
+        features->dev_features =
+            CONVERT_FEATURES(strList, mem_map, 0, bitmap);
+        break;
+#endif
+    /* No features */
+    case VIRTIO_ID_9P:
+    case VIRTIO_ID_PMEM:
+    case VIRTIO_ID_RNG:
+    case VIRTIO_ID_IOMEM:
+    case VIRTIO_ID_RPMSG:
+    case VIRTIO_ID_CLOCK:
+    case VIRTIO_ID_MAC80211_WLAN:
+    case VIRTIO_ID_MAC80211_HWSIM:
+    case VIRTIO_ID_RPROC_SERIAL:
+    case VIRTIO_ID_MEMORY_BALLOON:
+    case VIRTIO_ID_CAIF:
+    case VIRTIO_ID_SIGNAL_DIST:
+    case VIRTIO_ID_PSTORE:
+    case VIRTIO_ID_SOUND:
+    case VIRTIO_ID_BT:
+    case VIRTIO_ID_I2C_ADAPTER:
+        break;
+    default:
+        g_assert_not_reached();
+    }
+
+    features->has_unknown_dev_features = bitmap != 0;
+    if (features->has_unknown_dev_features) {
+        features->unknown_dev_features = bitmap;
+    }
+
+    return features;
+}
+
 VirtioStatus *qmp_x_query_virtio_status(const char *path, Error **errp)
 {
     VirtIODevice *vdev;
@@ -3955,9 +4218,12 @@ VirtioStatus *qmp_x_query_virtio_status(const char *path, Error **errp)
     status->name = g_strdup(vdev->name);
     status->device_id = vdev->device_id;
     status->vhost_started = vdev->vhost_started;
-    status->guest_features = vdev->guest_features;
-    status->host_features = vdev->host_features;
-    status->backend_features = vdev->backend_features;
+    status->guest_features = qmp_decode_features(vdev->device_id,
+                                                 vdev->guest_features);
+    status->host_features = qmp_decode_features(vdev->device_id,
+                                                vdev->host_features);
+    status->backend_features = qmp_decode_features(vdev->device_id,
+                                                   vdev->backend_features);
 
     switch (vdev->device_endian) {
     case VIRTIO_DEVICE_ENDIAN_LITTLE:
@@ -3972,7 +4238,7 @@ VirtioStatus *qmp_x_query_virtio_status(const char *path, Error **errp)
     }
 
     status->num_vqs = virtio_get_num_queues(vdev);
-    status->status = vdev->status;
+    status->status = qmp_decode_status(vdev->status);
     status->isr = vdev->isr;
     status->queue_sel = vdev->queue_sel;
     status->vm_running = vdev->vm_running;
@@ -3995,10 +4261,14 @@ VirtioStatus *qmp_x_query_virtio_status(const char *path, Error **errp)
         status->vhost_dev->n_tmp_sections = hdev->n_tmp_sections;
         status->vhost_dev->nvqs = hdev->nvqs;
         status->vhost_dev->vq_index = hdev->vq_index;
-        status->vhost_dev->features = hdev->features;
-        status->vhost_dev->acked_features = hdev->acked_features;
-        status->vhost_dev->backend_features = hdev->backend_features;
-        status->vhost_dev->protocol_features = hdev->protocol_features;
+        status->vhost_dev->features =
+            qmp_decode_features(vdev->device_id, hdev->features);
+        status->vhost_dev->acked_features =
+            qmp_decode_features(vdev->device_id, hdev->acked_features);
+        status->vhost_dev->backend_features =
+            qmp_decode_features(vdev->device_id, hdev->backend_features);
+        status->vhost_dev->protocol_features =
+            qmp_decode_protocols(hdev->protocol_features);
         status->vhost_dev->max_queues = hdev->max_queues;
         status->vhost_dev->backend_cap = hdev->backend_cap;
         status->vhost_dev->log_enabled = hdev->log_enabled;
diff --git a/include/hw/virtio/vhost.h b/include/hw/virtio/vhost.h
index 58a73e7..4aaa21f 100644
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
index 3b4eb85..6ed8861 100644
--- a/include/hw/virtio/virtio.h
+++ b/include/hw/virtio/virtio.h
@@ -71,6 +71,24 @@ typedef struct VirtQueueElement
 #define TYPE_VIRTIO_DEVICE "virtio-device"
 OBJECT_DECLARE_TYPE(VirtIODevice, VirtioDeviceClass, VIRTIO_DEVICE)
 
+typedef struct {
+    int virtio_bit;
+    const char *feature_name;
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
+extern qmp_virtio_feature_map_t mem_map[];
+
 enum virtio_device_endian {
     VIRTIO_DEVICE_ENDIAN_UNKNOWN,
     VIRTIO_DEVICE_ENDIAN_LITTLE,
diff --git a/qapi/virtio.json b/qapi/virtio.json
index 235b8f3..7ef1f95 100644
--- a/qapi/virtio.json
+++ b/qapi/virtio.json
@@ -106,10 +106,10 @@
             'n-tmp-sections': 'int',
             'nvqs': 'uint32',
             'vq-index': 'int',
-            'features': 'uint64',
-            'acked-features': 'uint64',
-            'backend-features': 'uint64',
-            'protocol-features': 'uint64',
+            'features': 'VirtioDeviceFeatures',
+            'acked-features': 'VirtioDeviceFeatures',
+            'backend-features': 'VirtioDeviceFeatures',
+            'protocol-features': 'VhostDeviceProtocols',
             'max-queues': 'uint64',
             'backend-cap': 'uint64',
             'log-enabled': 'bool',
@@ -174,11 +174,11 @@
             'device-id': 'uint16',
             'vhost-started': 'bool',
             'device-endian': 'str',
-            'guest-features': 'uint64',
-            'host-features': 'uint64',
-            'backend-features': 'uint64',
+            'guest-features': 'VirtioDeviceFeatures',
+            'host-features': 'VirtioDeviceFeatures',
+            'backend-features': 'VirtioDeviceFeatures',
             'num-vqs': 'int',
-            'status': 'uint8',
+            'status': 'VirtioDeviceStatus',
             'isr': 'uint8',
             'queue-sel': 'uint16',
             'vm-running': 'bool',
@@ -220,14 +220,28 @@
 #            "name": "virtio-crypto",
 #            "started": true,
 #            "device-id": 20,
-#            "backend-features": 0,
+#            "backend-features": {
+#               "transports": [],
+#               "dev-features": []
+#            },
 #            "start-on-kick": false,
 #            "isr": 1,
 #            "broken": false,
-#            "status": 15,
+#            "status": {
+#               "statuses": ["ACKNOWLEDGE", "DRIVER", "FEATURES_OK",
+#                            "DRIVER_OK"]
+#            },
 #            "num-vqs": 2,
-#            "guest-features": 5100273664,
-#            "host-features": 6325010432,
+#            "guest-features": {
+#               "transports": ["EVENT_IDX", "INDIRECT_DESC", "VERSION_1"],
+#               "dev-features": []
+#            },
+#            "host-features": {
+#               "transports": ["PROTOCOL_FEATURES", "EVENT_IDX",
+#                              "INDIRECT_DESC", "VERSION_1", "ANY_LAYOUT",
+#                              "NOTIFY_ON_EMPTY"],
+#               "dev-features": []
+#            },
 #            "use-guest-notifier-mask": true,
 #            "vm-running": true,
 #            "queue-sel": 1,
@@ -255,22 +269,65 @@
 #               "max-queues": 1,
 #               "backend-cap": 2,
 #               "log-size": 0,
-#               "backend-features": 0,
+#               "backend-features": {
+#                  "transports": [],
+#                  "dev-features": []
+#               },
 #               "nvqs": 2,
-#               "protocol-features": 0,
+#               "protocol-features": {
+#                  "protocols": []
+#               },
 #               "vq-index": 0,
 #               "log-enabled": false,
-#               "acked-features": 5100306432,
-#               "features": 13908344832
+#               "acked-features": {
+#                  "transports": ["EVENT_IDX", "INDIRECT_DESC", "VERSION_1",
+#                                 "ANY_LAYOUT", "NOTIFY_ON_EMPTY"],
+#                  "dev-features": ["MRG_RXBUF"]
+#               },
+#               "features": {
+#                  "transports": ["EVENT_IDX", "INDIRECT_DESC",
+#                                 "IOMMU_PLATFORM", "VERSION_1", "ANY_LAYOUT",
+#                                 "NOTIFY_ON_EMPTY"],
+#                  "dev-features": ["LOG_ALL", "MRG_RXBUF"]
+#               }
+#            },
+#            "backend-features": {
+#               "transports": ["PROTOCOL_FEATURES", "EVENT_IDX", "INDIRECT_DESC",
+#                              "VERSION_1", "ANY_LAYOUT", "NOTIFY_ON_EMPTY"],
+#               "dev-features": ["GSO", "CTRL_MAC_ADDR", "GUEST_ANNOUNCE", "CTRL_RX_EXTRA",
+#                                "CTRL_VLAN", "CTRL_RX", "CTRL_VQ", "STATUS", "MRG_RXBUF",
+#                                "HOST_UFO", "HOST_ECN", "HOST_TSO6", "HOST_TSO4",
+#                                "GUEST_UFO", "GUEST_ECN", "GUEST_TSO6", "GUEST_TSO4",
+#                                "MAC", "CTRL_GUEST_OFFLOADS", "GUEST_CSUM", "CSUM"]
 #            },
-#            "backend-features": 6337593319,
 #            "start-on-kick": false,
 #            "isr": 1,
 #            "broken": false,
-#            "status": 15,
+#            "status": {
+#               "statuses": ["ACKNOWLEDGE", "DRIVER", "FEATURES_OK", "DRIVER_OK"]
+#            },
 #            "num-vqs": 3,
-#            "guest-features": 5111807911,
-#            "host-features": 6337593319,
+#            "guest-features": {
+#               "transports": ["EVENT_IDX", "INDIRECT_DESC", "VERSION_1"],
+#               "dev-features": ["CTRL_MAC_ADDR", "GUEST_ANNOUNCE", "CTRL_VLAN",
+#                                "CTRL_RX", "CTRL_VQ", "STATUS", "MRG_RXBUF",
+#                                "HOST_UFO", "HOST_ECN", "HOST_TSO6",
+#                                "HOST_TSO4", "GUEST_UFO", "GUEST_ECN",
+#                                "GUEST_TSO6", "GUEST_TSO4", "MAC",
+#                                "CTRL_GUEST_OFFLOADS", "GUEST_CSUM", "CSUM"]
+#            },
+#            "host-features": {
+#               "transports": ["PROTOCOL_FEATURES", "EVENT_IDX",
+#                              "INDIRECT_DESC", "VERSION_1", "ANY_LAYOUT",
+#                              "NOTIFY_ON_EMPTY"],
+#               "dev-features": ["GSO", "CTRL_MAC_ADDR", "GUEST_ANNOUNCE",
+#                                "CTRL_RX_EXTRA", "CTRL_VLAN", "CTRL_RX",
+#                                "CTRL_VQ", "STATUS", "MRG_RXBUF", "HOST_UFO",
+#                                "HOST_ECN", "HOST_TSO4", "HOST_TSO4",
+#                                "GUEST_UFO", "GUEST_ECN", "GUEST_TSO6",
+#                                "GUEST_TSO4", "MAC", "CTRL_GUEST_OFFLOADS",
+#                                "GUEST_CSUM", "CSUM"]
+#            },
 #            "use-guest-notifier-mask": true,
 #            "vm-running": true,
 #            "queue-sel": 2,
@@ -286,3 +343,62 @@
   'data': { 'path': 'str' },
   'returns': 'VirtioStatus',
   'features': [ 'unstable' ] }
+
+##
+# @VirtioDeviceStatus:
+#
+# A structure defined to list the configuration statuses of a virtio
+# device
+#
+# @statuses: List of decoded configuration statuses of the virtio
+#            device
+#
+# @unknown-statuses: Virtio device statuses bitmap that have not been decoded
+#
+# Since: 7.0
+##
+
+{ 'struct': 'VirtioDeviceStatus',
+  'data': { 'statuses': [ 'str' ],
+            '*unknown-statuses': 'uint8' } }
+
+##
+# @VhostDeviceProtocols:
+#
+# A structure defined to list the vhost user protocol features of a
+# Vhost User device
+#
+# @protocols: List of decoded vhost user protocol features of a vhost
+#             user device
+#
+# @unknown-protocols: Vhost user device protocol features bitmap that
+#                     have not been decoded
+#
+# Since: 7.0
+##
+
+{ 'struct': 'VhostDeviceProtocols',
+  'data': { 'protocols': [ 'str' ],
+            '*unknown-protocols': 'uint64' } }
+
+##
+# @VirtioDeviceFeatures:
+#
+# The common fields that apply to most Virtio devices. Some devices
+# may not have their own device-specific features (e.g. virtio-rng).
+#
+# @transports: List of transport features of the virtio device
+#
+# @dev-features: List of device-specific features (if the device has
+#                unique features)
+#
+# @unknown-dev-features: Virtio device features bitmap that have not
+#                        been decoded
+#
+# Since: 7.0
+##
+
+{ 'struct': 'VirtioDeviceFeatures',
+  'data': { 'transports': [ 'str' ],
+            '*dev-features': [ 'str' ],
+            '*unknown-dev-features': 'uint64' } }
-- 
1.8.3.1


