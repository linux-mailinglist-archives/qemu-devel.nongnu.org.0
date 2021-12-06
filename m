Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3837E46960D
	for <lists+qemu-devel@lfdr.de>; Mon,  6 Dec 2021 13:55:50 +0100 (CET)
Received: from localhost ([::1]:47998 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1muDX2-0003kF-Tr
	for lists+qemu-devel@lfdr.de; Mon, 06 Dec 2021 07:55:48 -0500
Received: from eggs.gnu.org ([209.51.188.92]:51994)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jonah.palmer@oracle.com>)
 id 1muDNK-00019q-O5; Mon, 06 Dec 2021 07:45:54 -0500
Received: from mx0b-00069f02.pphosted.com ([205.220.177.32]:13320)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jonah.palmer@oracle.com>)
 id 1muDNI-0002Qv-17; Mon, 06 Dec 2021 07:45:46 -0500
Received: from pps.filterd (m0246631.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 1B6C5As5023240; 
 Mon, 6 Dec 2021 12:44:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : content-type :
 mime-version; s=corp-2021-07-09;
 bh=wW2M8EryMzwsbBUEZ8pWsFlGDVw4odxooyXIWmKzeH4=;
 b=b2X+4kT6eoVwuGQqepvxZ5o49O6VwJH14rjerpYyXFAzgjW13l9n7jCYEbeAcc0RDxlg
 u/RreGUl33FNlDxhePpMRrMsk1M73Tdk4Z09tsE4v0PNVMMkLXQFB4piF+euTN43XT5s
 V+SAQ3VQztx0fUr8pbOUnf7J2WWDiW011byPT4foqY3BAy7O5GHAczfhzf5q9fGzodrN
 1O5qi17gCt5xF7NyV9inkRwIk6vYNodcb3pO/45lINDQcGjITL7RKM0BwR6CCgUaETcL
 FMxEQdAEhzwsAxEfng9yWGlpA+CXA1mqNjsKy6WkJBPCp8lLDl7NofVKLsF0B4PsYlf2 VA== 
Received: from aserp3030.oracle.com (aserp3030.oracle.com [141.146.126.71])
 by mx0b-00069f02.pphosted.com with ESMTP id 3csbbqj2pn-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 06 Dec 2021 12:44:32 +0000
Received: from pps.filterd (aserp3030.oracle.com [127.0.0.1])
 by aserp3030.oracle.com (8.16.1.2/8.16.1.2) with SMTP id 1B6Cf9F9139474;
 Mon, 6 Dec 2021 12:44:31 GMT
Received: from nam12-mw2-obe.outbound.protection.outlook.com
 (mail-mw2nam12lp2040.outbound.protection.outlook.com [104.47.66.40])
 by aserp3030.oracle.com with ESMTP id 3csc4rqjca-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 06 Dec 2021 12:44:31 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=T4LjTjhpCjXTVlhwlaK0xYXVDTaFaztdkooRz4HTOOMYalXOpRZChYVmo4avEwuXGX/DwTWhosyDxZ7IO61lga+JjogTdXg/DlAFWbjJrRy7tYHTzMdGcnlz5Z1pU6KUGtLpH5qfD3wMxipNwAalu8yhc1cEddnFHzssx47gzJk9enoWuKjy0QQoLonP9N0aqhXOJkk7E+1C5Tm+H9KZPZ3cuB2lXNdmb5yZm1y8sKeg1I0qYisJ0x4R+z3QsJcK2DYJHmj3vdhGuYZy7by9m8u4Xz3dYDYS3u/c0raK49Ketx5e4ZWLdy7XA9dDhsv6q3kzqY/oa1lBER79MxYLmQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wW2M8EryMzwsbBUEZ8pWsFlGDVw4odxooyXIWmKzeH4=;
 b=FfybhPQTZPp9G1IaHbIOruf6+D1ICxSTjolL5v/VSbii7NH+fZQWP45OIL8tT9rRZ5+xL80PFVUrsjrt54NVUF+vWeW6hIztiZ4zxJZH3v+jW5tdEt82YQM0SOgfPZL363JIzXCpGv0LypZU7Jm5iOHnZbo2SVJXsUfEeBeqG4BCM6as30DAygt6H7UzdEhtXuj3DXb4LjjrVoq+vk9w4FAA9bNPDZTZiBxlNaZBH+saRQpTOEhpHhFWiM9uUWk0wGJ/la4US1Y/2CTuR0nczFFmewWdmwgMDnqb+Kt/+DsPu7/5736ZbkKvBgRYGrNVHUCxG2fw9ui0ppj4RMSbDw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wW2M8EryMzwsbBUEZ8pWsFlGDVw4odxooyXIWmKzeH4=;
 b=Y3YIof/lo9GhFUefmyTZy1NyJdbC0tV+gwcPe60F/el+CNkXGOskEKcYzrBZSa8qisAlymgb2v1LverkI3i4WBEkygRtHWpWhSydbPWjzmkol7bfOXhiEXn/AUyG4crLUjxlVcfHqGtgn8evDcnOHG12ZEfu/ythzsBnWWRMtUk=
Received: from PH0PR10MB4664.namprd10.prod.outlook.com (2603:10b6:510:41::11)
 by PH0PR10MB4791.namprd10.prod.outlook.com (2603:10b6:510:3a::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4755.20; Mon, 6 Dec
 2021 12:44:29 +0000
Received: from PH0PR10MB4664.namprd10.prod.outlook.com
 ([fe80::3446:f4ea:c037:4517]) by PH0PR10MB4664.namprd10.prod.outlook.com
 ([fe80::3446:f4ea:c037:4517%5]) with mapi id 15.20.4755.022; Mon, 6 Dec 2021
 12:44:29 +0000
From: Jonah Palmer <jonah.palmer@oracle.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v10 8/8] hmp: add virtio commands
Date: Mon,  6 Dec 2021 07:43:26 -0500
Message-Id: <1638794606-19631-9-git-send-email-jonah.palmer@oracle.com>
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
 15.20.4755.21 via Frontend Transport; Mon, 6 Dec 2021 12:44:26 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: a0af787e-d908-44dd-069f-08d9b8b624a5
X-MS-TrafficTypeDiagnostic: PH0PR10MB4791:EE_
X-Microsoft-Antispam-PRVS: <PH0PR10MB4791370C30C0D868BD448F9EE86D9@PH0PR10MB4791.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:120;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 6U7xc5C62z667454agcoFNXXy02v/37fha6IGuW6Yx0X7DPO8J0CZFCd/33oNqgRChzi4ms8Ryc8bI1c7xUP6ri9d7CV1Thk3OLMGu/AbhglARkm9S86v440NNjeY2sffo0rzCz9bn7kfPLgdQMmkKcWw5Bmc7xwKfbDBHVnFx0VsXSnAvjQ+1jme2gxvZRT3QftVfSdltHXovSVATErCpgtpZ3h82IGPTmikWuyBAAi+7VRqXW5uJLx5QVbyMLEazA8p8UVRbZYPK6J4zf3M4zqSmdyoV/vE2vxeMwNAWhpnOvAuNtkGYXaUzyllv17sLBX9yutvEAO3UivhmMKqCf9FpuPrtus7CEzSWmD6eljV+3dAjFX/IpJ+V6ET4erHck0ujtP9ibcdjZ5VyFGVx2yxrz+lL+sTD57s8PhomR//ygzWyE1aJWbdwXQ90+Odgz9+x4rccKfb4BTB1S6JyW+oeIyYB5PpL3a84ZFu0QIRnKiq++US73/L5HhKKoWBhSjGj7irOtkglu3FyUwmoFYvM0qD7xmjt486XMYOttfwtcjKPRgb7zAraFm4LhxHUo+6S+k3R/cX5vmcQQzG9fi0bvU80d5caBYyDC/scYW/c0y5RJHSuMqFkoNKwu2oDrH8t6u4mXmeJM7oIFRmy7g+yYI89dqo7ZjOEuW9AXgAnBlCDUJ2EmM+4K1xXMzMrpHlvsispFAHmCrvWis7w==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH0PR10MB4664.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(956004)(66556008)(52116002)(186003)(8936002)(38350700002)(508600001)(6486002)(2616005)(83380400001)(7696005)(36756003)(6916009)(86362001)(38100700002)(30864003)(66476007)(5660300002)(26005)(316002)(66946007)(4326008)(7416002)(8676002)(44832011)(2906002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?yW8uDV/IiKtJymEgw4HQ5PGznamRP/Shnd3/SyDJj5upZumWyPbcrBW1nAYm?=
 =?us-ascii?Q?lkKwUvl52O/nPEKmrYGWq0NFDjVVSFcGfFCDnaDK+DUO5b/zMY8z1k7jGLIo?=
 =?us-ascii?Q?CHpPGDSTpniMezx+PrSW6j0Dco0nJYNZzCm6MeSQ+1Iet6Mj8jy5bWWrrv/z?=
 =?us-ascii?Q?xatXkw5sl2LAFlTc2+JJkyQrR8LVDJZKaxaDL+95xnDntrAIQC07qemA/ERY?=
 =?us-ascii?Q?HMDfqR3ijeXP+EAK8xHfKANd0/CSz3XpasyPOZDQ8hgLrusynIr9PQ8z0Vlj?=
 =?us-ascii?Q?kw0NbW7u4kWoIY3uimcBMcHpRr07+tLKp1zmixuG3nInqz6+7P//m2fBnzIq?=
 =?us-ascii?Q?bKIPUMElb/lRa4UyBmkOzzNPvQiGSyTJeGtYDs48rjrvhqleGy1FIA7wx+is?=
 =?us-ascii?Q?BTt+gTmGYaPs5eMOFtXnhSafGU1bzRsUIUzrfT6xkY5UL0N5mb5lbRSeaOv0?=
 =?us-ascii?Q?R/towrh65wmvpocz6y9hye2ZVnYqRNJxHLZiEt9Ki+uSGhvTIQ5gMWW7R0NT?=
 =?us-ascii?Q?jeJyFs8IOhsQqfebxREXiImhQz+AhSqwo+bIIUmpTxAQz0ctFNzMpaDjhUck?=
 =?us-ascii?Q?SOTWhGaqh00+KBDrVMR5yk8xDzx8pkwEjx0T1dD0ta1Q2eHUNWd0dn6Yryg9?=
 =?us-ascii?Q?fujPRJAF9wZQfA0t/g6aV7WDpNJslPxaV4P0KtTQZWMYVqAp/+14RlDPCQ7Y?=
 =?us-ascii?Q?f7Q28qUyBXBn7kT6SZ9SBI7y3WTFdHH/gJqLEfD114+gBMdOa016Rpb24Yra?=
 =?us-ascii?Q?So6P2gdvrmBXkyIPp3HHAog3PGIm4+jf4hTXmU1V0v4j9YfM3o/TQNoqKy+c?=
 =?us-ascii?Q?rEMuIM+a7QW9xKNUZXp8MlDRLg1/Il0ihICmUHROpqiBHYDhB0fBubS5o55b?=
 =?us-ascii?Q?UPf0uJmwyVp52utdCHUB4nFmTY4470WCU2TmQ9sXtjKpBXpm7DjKzbr8K0s5?=
 =?us-ascii?Q?EwY81CFQ9A3uMo88YZbURt3z3+Ded1kMWmiIsZIirhwMsydkVIivHNTOH4tV?=
 =?us-ascii?Q?fO3pSzXv4NxBCwvv68qDiuLGZI/NCItVYRROuiI2yb+hRDhCUl/qjkSWGn1/?=
 =?us-ascii?Q?uG9uCxtb05wv82HSBL2krgeJpX/BOeqKISP4RBYcs936ALSrLsRxmVag+km1?=
 =?us-ascii?Q?Nxr4VkpASvMV21NusJpG8jUhVzZrm2LI9M18uixbGhs4YyTSWEVlyek7xphW?=
 =?us-ascii?Q?a9/sOAwroNWQH4jYU4zQM4JJuv+T9ZpEiEFmFEFoXwW4eIR+gsEJ8RW8dGsG?=
 =?us-ascii?Q?r05JiLlIHuVNgrgGsf+h3YEVFHw24bu+SUtxo32hwqBJhIQmQM2zCMnxpWuA?=
 =?us-ascii?Q?K8e6/zIiX9CySa5HXA0g1Dwmh4klbu5fLzKsDWfaBQlhu3aEphNmKBSuIx+e?=
 =?us-ascii?Q?niguF9bEspa6gHF5UH8m86RVMxQlSKi9Dvl8PXdkr5DH+2W97irFiMh+rtlF?=
 =?us-ascii?Q?rrtsYF0OytSC+yHrLrsKqk1r1D8iv0qmM3s6HA833ySmcodpzX62t24f+4Cj?=
 =?us-ascii?Q?N30y7GC8AVgYT0QyOumPJ2lKrUi4o5zMLXPf2e5k5Kub2cIf6lnhaymJe0f/?=
 =?us-ascii?Q?fJrhJh3Z1Txi8cDh5kEpmacxWvSy44LAnD3fbQhSb8DDsjbT5pO6PK8mXkRi?=
 =?us-ascii?Q?1j9ZEhx64OaSYij8CuUIFEc=3D?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a0af787e-d908-44dd-069f-08d9b8b624a5
X-MS-Exchange-CrossTenant-AuthSource: PH0PR10MB4664.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Dec 2021 12:44:28.9771 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: CQgrmKNGGk8x/X0TJdBzpHasw7lczVRgv1A4kJ0qS672E2mV1lykEtE2WqYb1dkK4r+REiBDOeq5urAR/dM1XQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR10MB4791
X-Proofpoint-Virus-Version: vendor=nai engine=6300 definitions=10189
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0
 mlxlogscore=999
 phishscore=0 bulkscore=0 malwarescore=0 spamscore=0 suspectscore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2110150000 definitions=main-2112060078
X-Proofpoint-GUID: qyuWs-hHVEHo6z-hOiNJ6FfEtAmVsL__
X-Proofpoint-ORIG-GUID: qyuWs-hHVEHo6z-hOiNJ6FfEtAmVsL__
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

This patch implements the HMP versions of the virtio QMP commands.

Signed-off-by: Jonah Palmer <jonah.palmer@oracle.com>
---
 hmp-commands-info.hx  |  70 ++++++++++++
 include/monitor/hmp.h |   5 +
 monitor/hmp-cmds.c    | 311 ++++++++++++++++++++++++++++++++++++++++++++++++++
 3 files changed, 386 insertions(+)

diff --git a/hmp-commands-info.hx b/hmp-commands-info.hx
index 407a1da..e49d852 100644
--- a/hmp-commands-info.hx
+++ b/hmp-commands-info.hx
@@ -877,3 +877,73 @@ SRST
   ``info sgx``
     Show intel SGX information.
 ERST
+
+    {
+        .name      = "virtio",
+        .args_type = "",
+        .params    = "",
+        .help      = "List all available virtio devices",
+        .cmd       = hmp_virtio_query,
+        .flags     = "p",
+    },
+
+SRST
+  ``info virtio``
+    List all available virtio devices
+ERST
+
+    {
+        .name      = "virtio-status",
+        .args_type = "path:s",
+        .params    = "path",
+        .help      = "Display status of a given virtio device",
+        .cmd       = hmp_virtio_status,
+        .flags     = "p",
+    },
+
+SRST
+  ``info virtio-status`` *path*
+    Display status of a given virtio device
+ERST
+
+    {
+        .name      = "virtio-queue-status",
+        .args_type = "path:s,queue:i",
+        .params    = "path queue",
+        .help      = "Display status of a given virtio queue",
+        .cmd       = hmp_virtio_queue_status,
+        .flags     = "p",
+    },
+
+SRST
+  ``info virtio-queue-status`` *path* *queue*
+    Display status of a given virtio queue
+ERST
+
+    {
+        .name      = "virtio-vhost-queue-status",
+        .args_type = "path:s,queue:i",
+        .params    = "path queue",
+        .help      = "Display status of a given vhost queue",
+        .cmd       = hmp_vhost_queue_status,
+        .flags     = "p",
+    },
+
+SRST
+  ``info virtio-vhost-queue-status`` *path* *queue*
+    Display status of a given vhost queue
+ERST
+
+    {
+        .name       = "virtio-queue-element",
+        .args_type  = "path:s,queue:i,index:i?",
+        .params     = "path queue [index]",
+        .help       = "Display element of a given virtio queue",
+        .cmd        = hmp_virtio_queue_element,
+        .flags      = "p",
+    },
+
+SRST
+  ``info virtio-queue-element`` *path* *queue* [*index*]
+    Display element of a given virtio queue
+ERST
diff --git a/include/monitor/hmp.h b/include/monitor/hmp.h
index 96d0148..47446d8 100644
--- a/include/monitor/hmp.h
+++ b/include/monitor/hmp.h
@@ -95,6 +95,11 @@ void hmp_qom_list(Monitor *mon, const QDict *qdict);
 void hmp_qom_get(Monitor *mon, const QDict *qdict);
 void hmp_qom_set(Monitor *mon, const QDict *qdict);
 void hmp_info_qom_tree(Monitor *mon, const QDict *dict);
+void hmp_virtio_query(Monitor *mon, const QDict *qdict);
+void hmp_virtio_status(Monitor *mon, const QDict *qdict);
+void hmp_virtio_queue_status(Monitor *mon, const QDict *qdict);
+void hmp_vhost_queue_status(Monitor *mon, const QDict *qdict);
+void hmp_virtio_queue_element(Monitor *mon, const QDict *qdict);
 void object_add_completion(ReadLineState *rs, int nb_args, const char *str);
 void object_del_completion(ReadLineState *rs, int nb_args, const char *str);
 void device_add_completion(ReadLineState *rs, int nb_args, const char *str);
diff --git a/monitor/hmp-cmds.c b/monitor/hmp-cmds.c
index 9c91bf9..7092653 100644
--- a/monitor/hmp-cmds.c
+++ b/monitor/hmp-cmds.c
@@ -42,6 +42,8 @@
 #include "qapi/qapi-commands-run-state.h"
 #include "qapi/qapi-commands-tpm.h"
 #include "qapi/qapi-commands-ui.h"
+#include "qapi/qapi-commands-virtio.h"
+#include "qapi/qapi-visit-virtio.h"
 #include "qapi/qapi-visit-net.h"
 #include "qapi/qapi-visit-migration.h"
 #include "qapi/qmp/qdict.h"
@@ -2165,3 +2167,312 @@ void hmp_info_memory_size_summary(Monitor *mon, const QDict *qdict)
     }
     hmp_handle_error(mon, err);
 }
+
+static void hmp_virtio_dump_protocols(Monitor *mon,
+                                      VhostDeviceProtocols *pcol)
+{
+    strList *pcol_list = pcol->protocols;
+    while (pcol_list) {
+        monitor_printf(mon, "%s", pcol_list->value);
+        pcol_list = pcol_list->next;
+        if (pcol_list != NULL) {
+            monitor_printf(mon, ", ");
+        }
+    }
+    monitor_printf(mon, "\n");
+    if (pcol->has_unknown_protocols) {
+        monitor_printf(mon, "  unknown-protocols(0x%016"PRIx64")\n",
+                       pcol->unknown_protocols);
+    }
+}
+
+static void hmp_virtio_dump_status(Monitor *mon,
+                                   VirtioDeviceStatus *status)
+{
+    strList *status_list = status->statuses;
+    while (status_list) {
+        monitor_printf(mon, "%s", status_list->value);
+        status_list = status_list->next;
+        if (status_list != NULL) {
+            monitor_printf(mon, ", ");
+        }
+    }
+    monitor_printf(mon, "\n");
+    if (status->has_unknown_statuses) {
+        monitor_printf(mon, "  unknown-statuses(0x%016"PRIx32")\n",
+                       status->unknown_statuses);
+    }
+}
+
+static void hmp_virtio_dump_features(Monitor *mon,
+                                     VirtioDeviceFeatures *features)
+{
+    strList *transport_list = features->transports;
+    while (transport_list) {
+        monitor_printf(mon, "%s", transport_list->value);
+        transport_list = transport_list->next;
+        if (transport_list != NULL) {
+            monitor_printf(mon, ", ");
+        }
+    }
+
+    monitor_printf(mon, "\n");
+    strList *list = features->dev_features;
+    if (list) {
+        monitor_printf(mon, "                    ");
+        while (list) {
+            monitor_printf(mon, "%s", list->value);
+            list = list->next;
+            if (list != NULL) {
+                monitor_printf(mon, ", ");
+            }
+        }
+        monitor_printf(mon, "\n");
+    }
+
+    if (features->has_unknown_dev_features) {
+        monitor_printf(mon, "  unknown-features(0x%016"PRIx64")\n",
+                       features->unknown_dev_features);
+    }
+}
+
+void hmp_virtio_query(Monitor *mon, const QDict *qdict)
+{
+    Error *err = NULL;
+    VirtioInfoList *list = qmp_x_query_virtio(&err);
+    VirtioInfoList *node;
+
+    if (err != NULL) {
+        hmp_handle_error(mon, err);
+        return;
+    }
+
+    if (list == NULL) {
+        monitor_printf(mon, "No VirtIO devices\n");
+        return;
+    }
+
+    node = list;
+    while (node) {
+        monitor_printf(mon, "%s [%s]\n", node->value->path,
+                       node->value->name);
+        node = node->next;
+    }
+    qapi_free_VirtioInfoList(list);
+}
+
+void hmp_virtio_status(Monitor *mon, const QDict *qdict)
+{
+    Error *err = NULL;
+    const char *path = qdict_get_try_str(qdict, "path");
+    VirtioStatus *s = qmp_x_query_virtio_status(path, &err);
+
+    if (err != NULL) {
+        hmp_handle_error(mon, err);
+        return;
+    }
+
+    monitor_printf(mon, "%s:\n", path);
+    monitor_printf(mon, "  device_name:             %s %s\n",
+                   s->name, s->has_vhost_dev ? "(vhost)" : "");
+    monitor_printf(mon, "  device_id:               %d\n", s->device_id);
+    monitor_printf(mon, "  vhost_started:           %s\n",
+                   s->vhost_started ? "true" : "false");
+    monitor_printf(mon, "  bus_name:                %s\n", s->bus_name);
+    monitor_printf(mon, "  broken:                  %s\n",
+                   s->broken ? "true" : "false");
+    monitor_printf(mon, "  disabled:                %s\n",
+                   s->disabled ? "true" : "false");
+    monitor_printf(mon, "  disable_legacy_check:    %s\n",
+                   s->disable_legacy_check ? "true" : "false");
+    monitor_printf(mon, "  started:                 %s\n",
+                   s->started ? "true" : "false");
+    monitor_printf(mon, "  use_started:             %s\n",
+                   s->use_started ? "true" : "false");
+    monitor_printf(mon, "  start_on_kick:           %s\n",
+                   s->start_on_kick ? "true" : "false");
+    monitor_printf(mon, "  use_guest_notifier_mask: %s\n",
+                   s->use_guest_notifier_mask ? "true" : "false");
+    monitor_printf(mon, "  vm_running:              %s\n",
+                   s->vm_running ? "true" : "false");
+    monitor_printf(mon, "  num_vqs:                 %ld\n", s->num_vqs);
+    monitor_printf(mon, "  queue_sel:               %d\n",
+                   s->queue_sel);
+    monitor_printf(mon, "  isr:                     %d\n", s->isr);
+    monitor_printf(mon, "  endianness:              %s\n",
+                   s->device_endian);
+    monitor_printf(mon, "  status: ");
+    hmp_virtio_dump_status(mon, s->status);
+    monitor_printf(mon, "  Guest features:   ");
+    hmp_virtio_dump_features(mon, s->guest_features);
+    monitor_printf(mon, "  Host features:    ");
+    hmp_virtio_dump_features(mon, s->host_features);
+    monitor_printf(mon, "  Backend features: ");
+    hmp_virtio_dump_features(mon, s->backend_features);
+
+    if (s->has_vhost_dev) {
+        monitor_printf(mon, "  VHost:\n");
+        monitor_printf(mon, "    nvqs:           %d\n",
+                       s->vhost_dev->nvqs);
+        monitor_printf(mon, "    vq_index:       %ld\n",
+                       s->vhost_dev->vq_index);
+        monitor_printf(mon, "    max_queues:     %lu\n",
+                       s->vhost_dev->max_queues);
+        monitor_printf(mon, "    n_mem_sections: %ld\n",
+                       s->vhost_dev->n_mem_sections);
+        monitor_printf(mon, "    n_tmp_sections: %ld\n",
+                       s->vhost_dev->n_tmp_sections);
+        monitor_printf(mon, "    backend_cap:    %lu\n",
+                       s->vhost_dev->backend_cap);
+        monitor_printf(mon, "    log_enabled:    %s\n",
+                       s->vhost_dev->log_enabled ? "true" : "false");
+        monitor_printf(mon, "    log_size:       %lu\n",
+                       s->vhost_dev->log_size);
+        monitor_printf(mon, "    Features:          ");
+        hmp_virtio_dump_features(mon, s->vhost_dev->features);
+        monitor_printf(mon, "    Acked features:    ");
+        hmp_virtio_dump_features(mon, s->vhost_dev->acked_features);
+        monitor_printf(mon, "    Backend features:  ");
+        hmp_virtio_dump_features(mon, s->vhost_dev->backend_features);
+        monitor_printf(mon, "    Protocol features: ");
+        hmp_virtio_dump_protocols(mon, s->vhost_dev->protocol_features);
+    }
+
+    qapi_free_VirtioStatus(s);
+}
+
+void hmp_vhost_queue_status(Monitor *mon, const QDict *qdict)
+{
+    Error *err = NULL;
+    const char *path = qdict_get_try_str(qdict, "path");
+    int queue = qdict_get_int(qdict, "queue");
+    VirtVhostQueueStatus *s =
+        qmp_x_query_virtio_vhost_queue_status(path, queue, &err);
+
+    if (err != NULL) {
+        hmp_handle_error(mon, err);
+        return;
+    }
+
+    monitor_printf(mon, "%s:\n", path);
+    monitor_printf(mon, "  device_name:          %s (vhost)\n",
+                   s->name);
+    monitor_printf(mon, "  kick:                 %ld\n", s->kick);
+    monitor_printf(mon, "  call:                 %ld\n", s->call);
+    monitor_printf(mon, "  VRing:\n");
+    monitor_printf(mon, "    num:         %ld\n", s->num);
+    monitor_printf(mon, "    desc:        0x%016"PRIx64"\n", s->desc);
+    monitor_printf(mon, "    desc_phys:   0x%016"PRIx64"\n",
+                   s->desc_phys);
+    monitor_printf(mon, "    desc_size:   %"PRId32"\n", s->desc_size);
+    monitor_printf(mon, "    avail:       0x%016"PRIx64"\n", s->avail);
+    monitor_printf(mon, "    avail_phys:  0x%016"PRIx64"\n",
+                   s->avail_phys);
+    monitor_printf(mon, "    avail_size:  %"PRId32"\n", s->avail_size);
+    monitor_printf(mon, "    used:        0x%016"PRIx64"\n", s->used);
+    monitor_printf(mon, "    used_phys:   0x%016"PRIx64"\n",
+                   s->used_phys);
+    monitor_printf(mon, "    used_size:   %"PRId32"\n", s->used_size);
+
+    qapi_free_VirtVhostQueueStatus(s);
+}
+
+void hmp_virtio_queue_status(Monitor *mon, const QDict *qdict)
+{
+    Error *err = NULL;
+    const char *path = qdict_get_try_str(qdict, "path");
+    int queue = qdict_get_int(qdict, "queue");
+    VirtQueueStatus *s = qmp_x_query_virtio_queue_status(path, queue, &err);
+
+    if (err != NULL) {
+        hmp_handle_error(mon, err);
+        return;
+    }
+
+    monitor_printf(mon, "%s:\n", path);
+    monitor_printf(mon, "  device_name:          %s\n", s->name);
+    monitor_printf(mon, "  queue_index:          %d\n", s->queue_index);
+    monitor_printf(mon, "  inuse:                %d\n", s->inuse);
+    monitor_printf(mon, "  used_idx:             %d\n", s->used_idx);
+    monitor_printf(mon, "  signalled_used:       %d\n",
+                   s->signalled_used);
+    monitor_printf(mon, "  signalled_used_valid: %s\n",
+                   s->signalled_used_valid ? "true" : "false");
+    if (s->has_last_avail_idx) {
+        monitor_printf(mon, "  last_avail_idx:       %d\n",
+                       s->last_avail_idx);
+    }
+    if (s->has_shadow_avail_idx) {
+        monitor_printf(mon, "  shadow_avail_idx:     %d\n",
+                       s->shadow_avail_idx);
+    }
+    monitor_printf(mon, "  VRing:\n");
+    monitor_printf(mon, "    num:          %"PRId32"\n", s->vring_num);
+    monitor_printf(mon, "    num_default:  %"PRId32"\n",
+                   s->vring_num_default);
+    monitor_printf(mon, "    align:        %"PRId32"\n",
+                   s->vring_align);
+    monitor_printf(mon, "    desc:         0x%016"PRIx64"\n",
+                   s->vring_desc);
+    monitor_printf(mon, "    avail:        0x%016"PRIx64"\n",
+                   s->vring_avail);
+    monitor_printf(mon, "    used:         0x%016"PRIx64"\n",
+                   s->vring_used);
+
+    qapi_free_VirtQueueStatus(s);
+}
+
+void hmp_virtio_queue_element(Monitor *mon, const QDict *qdict)
+{
+    Error *err = NULL;
+    const char *path = qdict_get_try_str(qdict, "path");
+    int queue = qdict_get_int(qdict, "queue");
+    int index = qdict_get_try_int(qdict, "index", -1);
+    VirtioQueueElement *e;
+    VirtioRingDescList *list;
+
+    e = qmp_x_query_virtio_queue_element(path, queue, index != -1,
+                                         index, &err);
+    if (err != NULL) {
+        hmp_handle_error(mon, err);
+        return;
+    }
+
+    monitor_printf(mon, "%s:\n", path);
+    monitor_printf(mon, "  device_name: %s\n", e->name);
+    monitor_printf(mon, "  index:       %d\n", e->index);
+    monitor_printf(mon, "  desc:\n");
+    monitor_printf(mon, "    descs:   ");
+
+    list = e->descs;
+    while (list) {
+        monitor_printf(mon, "addr 0x%"PRIx64" len %d", list->value->addr,
+                       list->value->len);
+        if (list->value->flags) {
+            strList *flag = list->value->flags;
+            monitor_printf(mon, " (");
+            while (flag) {
+                monitor_printf(mon, "%s", flag->value);
+                flag = flag->next;
+                if (flag) {
+                    monitor_printf(mon, ", ");
+                }
+            }
+            monitor_printf(mon, ")");
+        }
+        list = list->next;
+        if (list) {
+            monitor_printf(mon, ", ");
+        }
+    }
+    monitor_printf(mon, "\n");
+    monitor_printf(mon, "  avail:\n");
+    monitor_printf(mon, "    flags: %d\n", e->avail->flags);
+    monitor_printf(mon, "    idx:   %d\n", e->avail->idx);
+    monitor_printf(mon, "    ring:  %d\n", e->avail->ring);
+    monitor_printf(mon, "  used:\n");
+    monitor_printf(mon, "    flags: %d\n", e->used->flags);
+    monitor_printf(mon, "    idx:   %d\n", e->used->idx);
+
+    qapi_free_VirtioQueueElement(e);
+}
-- 
1.8.3.1


