Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 293C3340A68
	for <lists+qemu-devel@lfdr.de>; Thu, 18 Mar 2021 17:42:35 +0100 (CET)
Received: from localhost ([::1]:36548 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lMvjF-0002sg-Vw
	for lists+qemu-devel@lfdr.de; Thu, 18 Mar 2021 12:42:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60528)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jonah.palmer@oracle.com>)
 id 1lMvXx-00040z-0J; Thu, 18 Mar 2021 12:30:53 -0400
Received: from userp2120.oracle.com ([156.151.31.85]:56650)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jonah.palmer@oracle.com>)
 id 1lMvXo-0008Ar-LU; Thu, 18 Mar 2021 12:30:52 -0400
Received: from pps.filterd (userp2120.oracle.com [127.0.0.1])
 by userp2120.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 12IGU773086324;
 Thu, 18 Mar 2021 16:30:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : content-type :
 mime-version; s=corp-2020-01-29;
 bh=FFg7qsgdrWPcUAjQkcqWSUbZr1E5r+/wQ+Hw4KRYrwY=;
 b=G9uldt6eV1lN7ZVFEngbip9763i5VfJylgC4K5AsmlIDbwA4uob2RwintvEDAqJE2ri+
 YZrGA7fx1vCyaW0MFFZUdyU6v6ytTm3r9PeoJCIY+AIWKnfeA9vxX1pPXBfUD2bOeMav
 IqxJQPzppFvFjRCGEQSYUzdsQhfbtCH/V6mc4EzHnalwtEtKm+kQnhJshV6fQntfZX98
 677U8FSFKYxzXE4slQvyPNs1v2seoKtF2uGA9zvHyOKUwMcHMzio+xJGJeXIF1E592P0
 iMIYbDRTCIIsYCFXSbEC2pG2Xk5CpOrxlZyETbUAd9Gl8+waUloNecMA+qcy0ax03xlX nA== 
Received: from aserp3030.oracle.com (aserp3030.oracle.com [141.146.126.71])
 by userp2120.oracle.com with ESMTP id 378p1p0408-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 18 Mar 2021 16:30:27 +0000
Received: from pps.filterd (aserp3030.oracle.com [127.0.0.1])
 by aserp3030.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 12IGQnDE052002;
 Thu, 18 Mar 2021 16:30:26 GMT
Received: from nam11-co1-obe.outbound.protection.outlook.com
 (mail-co1nam11lp2175.outbound.protection.outlook.com [104.47.56.175])
 by aserp3030.oracle.com with ESMTP id 3796ywdjea-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 18 Mar 2021 16:30:25 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=I1qcjcu8kyKGa4b3Zfb4zdswFGKRrQomPChuNLaQfUdgzX7TmmD7nrNIh4oblP2gypibkFQHks/Cmkihv4LOKn4a+8ZmkH7lYVBg9m+gm/2Z+lUrud1z7hMmx2rOmUrlDmLLNz7IKycXqFPbLLsFVMpwFmCVo3ftanxAqx9qLF2zjlQwdMN+MV6lxGOZOSO1dl/dgFXmdD7zRWpPOXzcfsdMBb3qSlVOuQ/rL2sogApcC6gqAZO0nM2qMTB63kGX1xbGhHhEGv1S96m2rXBDAym15e9dPrX6RRfc5aBuxKAiBhOadn5iqGKdn3lQ90xs715TO0i1J8qdoemT+jk9Qg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FFg7qsgdrWPcUAjQkcqWSUbZr1E5r+/wQ+Hw4KRYrwY=;
 b=AAQhPkKQyMO2gKkuEK1psGQvjsqPVv4nDYt9AFphui4IUCIy7bMSLzQr5cchepMEuZ/bRT3dGjWG5LEnsoEjlvjNW4pzomUnZKAABzFgieS3yqXQqfqYzhgxXFdJcs+JiNqNtwEKHn56bFSNOVvsvrK2x7U5QinrAVpFSoiAZ8bZ+ZEAkHIu5LF4ZlA2gKDVV2dZdmZUC3QhFmz+kXjuOcjGq2V+/zAzASKdEbXQ3+zhOJgHjXvE63koq8Q896kWvm4TmQ8hzBE9wd2i475TiFXkWkZYl+M5h7fYzC51NzwteEBclTG7bNmglJeacSk8KY1Yw1eSHn0MijDARnuRsQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FFg7qsgdrWPcUAjQkcqWSUbZr1E5r+/wQ+Hw4KRYrwY=;
 b=VS9V2vhMDpWA5E8SSJt8dn+eCOF+2KaWb8US75GcxWyOdBiyk8s6kKX3PqlbEJSFzNq0VOs4ho70ZMMv4DBuVaoFfCxBDTXsZIqZgkwaet6aWxQAEGfZdi5mwuAEAUszTMgRWL1xkYOeNfJyhimB6+8OCa7SVZHJbxR4ZD56540=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=oracle.com;
Received: from PH0PR10MB4664.namprd10.prod.outlook.com (2603:10b6:510:41::11)
 by PH0PR10MB4727.namprd10.prod.outlook.com (2603:10b6:510:3f::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3955.18; Thu, 18 Mar
 2021 16:30:22 +0000
Received: from PH0PR10MB4664.namprd10.prod.outlook.com
 ([fe80::6819:aaf:9a92:c1db]) by PH0PR10MB4664.namprd10.prod.outlook.com
 ([fe80::6819:aaf:9a92:c1db%2]) with mapi id 15.20.3933.032; Thu, 18 Mar 2021
 16:30:22 +0000
From: Jonah Palmer <jonah.palmer@oracle.com>
To: qemu-devel@nongnu.org
Subject: [RFC v5 6/6] hmp: add virtio commands
Date: Thu, 18 Mar 2021 12:29:44 -0400
Message-Id: <1616084984-11263-7-git-send-email-jonah.palmer@oracle.com>
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
 Transport; Thu, 18 Mar 2021 16:30:19 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 88d9d17b-8a3c-495e-62b4-08d8ea2b20a7
X-MS-TrafficTypeDiagnostic: PH0PR10MB4727:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <PH0PR10MB4727377E27C0B4940DAE6E2CE8699@PH0PR10MB4727.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:312;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: HPcZHlm8co7B0eF/kQHmcdwRojeiI+KTDM1JNcZjWlGsnSjpbJm6qFKLj1z42G3Jo6rPUxyx6j/FCsxlKWxXtKI16uPTTsFQUD2pMkvJpSvwfmihLLNj6mFiHNs5vPL4Lui/oDFMxovg3W2fViBhfANHPDbJH5Af8+of4W+WqDnnDAimxtWj5eFljBOv+XYdZddziGXFjqTYW5GYwDGKRAbZz8RR8eiWrFLprRAPK7EJp4zCoOwmSrc+ORSSrAsaqwcOARSBxP0/0YJLCVMX3pm4XqRVfcY+lNAzKbxM2NTYkEFwU8XgU3BbM2iYnV96hUva9v77RjxOKNGecwv1+THUNAR71vDZcNF45gPLH7KbIo4U+iohXo10INUNAydTxt9DM0WD2ebU6bf7DkWqbzbzBxVUNvMA99Lc/eDM5izW/WI5rf5DCbGLVxgv0B66OrJ9vMUg8/dTDOgvRe7rUGM7mJVoQ4nTaqV/Lc2aMJHqjL/KitFFS2fnBmcPySUtdPsHQQ483mGi7BeIiF0rWWFCY0e26aKpeJpOACY9Y7dgp8oK/Y6Mx1vjoWPwuSSNZCd6fATj9D7GXpZOz1uGbVBePby4vZNOWwx9N5CfYAhgvUU1J9b5cvIAb1gBRc1Q
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH0PR10MB4664.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(376002)(346002)(366004)(39860400002)(136003)(396003)(2906002)(107886003)(36756003)(4326008)(7696005)(7416002)(5660300002)(186003)(316002)(38100700001)(66556008)(956004)(83380400001)(30864003)(52116002)(66946007)(8676002)(6666004)(478600001)(44832011)(6486002)(2616005)(26005)(86362001)(8936002)(66476007)(6916009)(16526019);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?D+2zzGgOpnE/5qPL8R09Nm5tiVhXEjg1VnM6HfAQH4DLFwZQhEsu8S0ZEMf8?=
 =?us-ascii?Q?gLEC25n/g66h9X0tx9jPqEvLZPPXzaAD2+QOqIXY2D9wiHUQrDYcCPcv1Oeq?=
 =?us-ascii?Q?pSv/y8I9P9spcEgvHkT59H2rWuJLmJ3KVVVafvy0hPw15l26/ty9oWUKLKmW?=
 =?us-ascii?Q?JW6IRAEfJF5eiot/6L4sKHVSSEu7sbIFSDQ9J37QKpl6ysWsoZI05tFlFo12?=
 =?us-ascii?Q?uwRvBkXWOOfS7uq1yUO0qhhf5/TjQQKLwJuuZ33FPD6d7XOR+lsRDmWNPCIu?=
 =?us-ascii?Q?NdnwtEmhJZgX2rIHK9z51O9ezppSypQxCmroKdI6oEYXd7Ty30jwzd8HZrFr?=
 =?us-ascii?Q?4Y0G6fqJuLxyKs28h5vOq9SGgrMdJXtzh1mO8aPazK7GzudwFY4s3+8divQo?=
 =?us-ascii?Q?AiIMPhAOyaBSTxxq8WUbrzZC2f04o9AGbzhyzSILIhZBgq4QzdFf+GyQX8MW?=
 =?us-ascii?Q?SAlW6awfu6vH46L5veVh1tVpabwMsYBmXFIeqcM2OflEHKqChr6fY8nRelhZ?=
 =?us-ascii?Q?Q3KyGtSz3dYHGEcZxnS5QOxGJ4mbb1t+S+7rdrUUkSbXu5fFC5EqwM7BL022?=
 =?us-ascii?Q?SdWfAYSe4YuOcqNyca8gkfmSCxpIcozo+Qm6BhUDFrU9sTWNCJd9Q61Rb37R?=
 =?us-ascii?Q?PW04geXiq/1er/Kvbg0ot0HrKsWpMwim5uRwXs2cG6NlzXi8P6C3NsrE0jAk?=
 =?us-ascii?Q?jbHlBCguicwng/BK+SnKAO5A4vR0iqKksDNUlgIXKXCdMRHJjIpa4ZJfccPT?=
 =?us-ascii?Q?SX8Ek4R5lhWj8oMaPFHmyFas9wmr+0/XjdjjzKaUc3uwlLqAEfH66YBlS/vd?=
 =?us-ascii?Q?WsvVthd45T9qFRE3cdfxIZfDp8glxuq54vsCofisR5KWc1Av7J8iGJpkBW15?=
 =?us-ascii?Q?m31UDA6W50a113n/nW8QWCIxFcdNPYHOpANS/TR1cMtuu8Hh7/fS2A0T+a3W?=
 =?us-ascii?Q?1N8dOdZLscx0hxVpz6K/QuLPgAtmDS3Ehs/H+BfFufn0t05ad2vzaCTCQRl/?=
 =?us-ascii?Q?xJXXyoC6ID9hSyLFuTtX1RftxX1P/6I2gypJZ8orTlk7abBwMOQxfMFHDSRE?=
 =?us-ascii?Q?XIHL1rS6AfPpV6peUGMP33oY4C4fWK94Ak6RbKLHRGtxnVnkKPSEH2oL8qaE?=
 =?us-ascii?Q?rDN/H2qWnoPemWtiYBviH1rVrDM1DiLqolEkuBN7lVwVc7Hwt6SZMiix+v19?=
 =?us-ascii?Q?+3SwajgUDo0635CTUKtKdrYBxk0uZsezwvOCXXhxKte6tgVtDBcKtH6B0ilC?=
 =?us-ascii?Q?Q+ocI+kuDTTkcpP9Cb8bd604RafRyLKv8+e73WIXqZaNeAOcCeFj/XRh0MiB?=
 =?us-ascii?Q?hwfLN2bVZJWsbxJLRqUpy05V?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 88d9d17b-8a3c-495e-62b4-08d8ea2b20a7
X-MS-Exchange-CrossTenant-AuthSource: PH0PR10MB4664.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Mar 2021 16:30:22.6941 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: rkcJJQHh/Zaso6jZJArdoanYa5U3HQynyFMWy9Y9GeK1R4L7FTCqQC4etXKE4WoKDCdD+BAmKAoLWSxJZxWqtQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR10MB4727
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=9927
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 phishscore=0
 malwarescore=0 spamscore=0
 bulkscore=0 mlxlogscore=999 mlxscore=0 suspectscore=0 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2103180115
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=9927
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxscore=0
 suspectscore=0 adultscore=0
 spamscore=0 clxscore=1015 phishscore=0 malwarescore=0 priorityscore=1501
 bulkscore=0 mlxlogscore=999 lowpriorityscore=0 impostorscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2103180116
Received-SPF: pass client-ip=156.151.31.85;
 envelope-from=jonah.palmer@oracle.com; helo=userp2120.oracle.com
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

This patch implements HMP version of the virtio QMP commands

[Jonah: Added relative indicies, device type, and used index
in HMP virtio queue-status command.]

Signed-off-by: Laurent Vivier <lvivier@redhat.com>
Signed-off-by: Jonah Palmer <jonah.palmer@oracle.com>
---
 docs/system/monitor.rst |   2 +
 hmp-commands-virtio.hx  | 162 ++++++++++++++++++++++++++++++++++++++
 hmp-commands.hx         |  10 +++
 hw/virtio/virtio.c      | 204 +++++++++++++++++++++++++++++++++++++++++++++++-
 include/monitor/hmp.h   |   4 +
 meson.build             |   1 +
 monitor/misc.c          |  17 ++++
 7 files changed, 399 insertions(+), 1 deletion(-)
 create mode 100644 hmp-commands-virtio.hx

diff --git a/docs/system/monitor.rst b/docs/system/monitor.rst
index ff5c434..10418fc 100644
--- a/docs/system/monitor.rst
+++ b/docs/system/monitor.rst
@@ -21,6 +21,8 @@ The following commands are available:
 
 .. hxtool-doc:: hmp-commands.hx
 
+.. hxtool-doc:: hmp-commands-virtio.hx
+
 .. hxtool-doc:: hmp-commands-info.hx
 
 Integer expressions
diff --git a/hmp-commands-virtio.hx b/hmp-commands-virtio.hx
new file mode 100644
index 0000000..0ef01b9
--- /dev/null
+++ b/hmp-commands-virtio.hx
@@ -0,0 +1,162 @@
+HXCOMM Use DEFHEADING() to define headings in both help text and rST.
+HXCOMM Text between SRST and ERST is copied to the rST version and
+HXCOMM discarded from C version.
+HXCOMM DEF(command, args, callback, arg_string, help) is used to construct
+HXCOMM monitor info commands
+HXCOMM HXCOMM can be used for comments, discarded from both rST and C.
+HXCOMM
+HXCOMM In this file, generally SRST fragments should have two extra
+HXCOMM spaces of indent, so that the documentation list item for "virtio cmd"
+HXCOMM appears inside the documentation list item for the top level
+HXCOMM "virtio" documentation entry. The exception is the first SRST
+HXCOMM fragment that defines that top level entry.
+
+SRST
+``virtio`` *subcommand*
+  Show various information about virtio.
+
+  Example:
+
+  List all sub-commands::
+
+    (qemu) virtio
+    virtio query  -- List all available virtio devices
+    virtio status path -- Display status of a given virtio device
+    virtio queue-status path queue -- Display status of a given virtio queue
+    virtio queue-element path queue [index] -- Display element of a given virtio queue
+
+ERST
+
+    {
+        .name       = "query",
+        .args_type  = "",
+        .params     = "",
+        .help       = "List all available virtio devices",
+        .cmd        = hmp_virtio_query,
+        .flags      = "p",
+    },
+
+SRST
+  ``virtio query``
+    List all available virtio devices
+
+    Example:
+
+    List all available virtio devices in the machine::
+
+      (qemu) virtio query
+      /machine/peripheral-anon/device[3]/virtio-backend [virtio-net]
+      /machine/peripheral-anon/device[1]/virtio-backend [virtio-serial]
+      /machine/peripheral-anon/device[0]/virtio-backend [virtio-blk]
+
+ERST
+
+    {
+        .name       = "status",
+        .args_type  = "path:s",
+        .params     = "path",
+        .help       = "Display status of a given virtio device",
+        .cmd        = hmp_virtio_status,
+        .flags      = "p",
+    },
+
+SRST
+  ``virtio status`` *path*
+    Display status of a given virtio device
+
+    Example:
+
+    Dump the status of the first virtio device::
+
+      (qemu) virtio status /machine/peripheral-anon/device[3]/virtio-backend
+      /machine/peripheral-anon/device[3]/virtio-backend:
+        Device Id:        1
+        Guest features:   event-idx, indirect-desc, version-1
+                          ctrl-mac-addr, guest-announce, ctrl-vlan, ctrl-rx, ctrl-vq, status, mrg-rxbuf, host-ufo, host-ecn, host-tso6, host-tso4, guest-ufo, guest-ecn, guest-tso6, guest-tso4, mac, ctrl-guest-offloads, guest-csum, csum
+        Host features:    event-idx, indirect-desc, bad-feature, version-1, any-layout, notify-on-empty
+                          gso, ctrl-mac-addr, guest-announce, ctrl-rx-extra, ctrl-vlan, ctrl-rx, ctrl-vq, status, mrg-rxbuf, host-ufo, host-ecn, host-tso6, host-tso4, guest-ufo, guest-ecn, guest-tso6, guest-tso4, mac, ctrl-guest-offloads, guest-csum, csum
+        Backend features:
+        Endianness:       little
+        VirtQueues:       3
+
+ERST
+
+    {
+        .name       = "queue-status",
+        .args_type  = "path:s,queue:i",
+        .params     = "path queue",
+        .help       = "Display status of a given virtio queue",
+        .cmd        = hmp_virtio_queue_status,
+        .flags      = "p",
+    },
+
+SRST
+  ``virtio queue-status`` *path* *queue*
+    Display status of a given virtio queue
+
+    Example:
+
+    Dump the status of the first queue of the first virtio device::
+
+      (qemu) virtio queue-status /machine/peripheral-anon/device[3]/virtio-backend 0
+      /machine/peripheral-anon/device[3]/virtio-backend:
+        device_type:          virtio-net
+        index:                0
+        inuse:                0
+        last_avail_idx:       61 (61 % 256)
+        shadow_avail_idx:     292 (36 % 256)
+        used_idx:             61 (61 % 256)
+        signalled_used:       61 (61 % 256)
+        signalled_used_valid: 1
+        VRing:
+          num:         256
+          num_default: 256
+          align:       4096
+          desc:        0x000000006c352000
+          avail:       0x000000006c353000
+          used:        0x000000006c353240
+
+ERST
+
+    {
+        .name       = "queue-element",
+        .args_type  = "path:s,queue:i,index:i?",
+        .params     = "path queue [index]",
+        .help       = "Display element of a given virtio queue",
+        .cmd        = hmp_virtio_queue_element,
+        .flags      = "p",
+    },
+
+SRST
+  ``virtio queue-element`` *path* *queue* [*index*]
+    Display element of a given virtio queue
+
+    Example:
+
+    Dump the information of the head element of the first queue of
+    the first virtio device::
+
+      (qemu) virtio queue-element/machine/peripheral-anon/device[3]/virtio-backend 0
+      index:  67
+      ndescs: 1
+      descs:  addr 0x6fe69800 len 1536 (write)
+
+      (qemu) xp/128bx 0x6fe69800
+      000000006fe69800: 0x02 0x00 0x00 0x00 0x00 0x00 0x00 0x00
+      000000006fe69808: 0x00 0x00 0x01 0x00 0x52 0x54 0x00 0x12
+      000000006fe69810: 0x34 0x56 0x52 0x54 0x00 0x09 0x51 0xde
+      000000006fe69818: 0x08 0x00 0x45 0x00 0x00 0x4c 0x8f 0x32
+
+    device[3] is a virtio-net device and we can see in the element buffer the
+    MAC address of the card::
+
+      [root@localhost ~]# ip link show ens4
+      2: ens4: <BROADCAST,MULTICAST,UP,LOWER_UP> mtu 1500 qdisc fq_codel state UP m0
+          link/ether 52:54:00:12:34:56 brd ff:ff:ff:ff:ff:ff
+
+    and the MAC address of the gateway::
+
+      [root@localhost ~]# arp -a
+      _gateway (192.168.122.1) at 52:54:00:09:51:de [ether] on ens4
+
+ERST
diff --git a/hmp-commands.hx b/hmp-commands.hx
index d4001f9..19674bf 100644
--- a/hmp-commands.hx
+++ b/hmp-commands.hx
@@ -1852,6 +1852,16 @@ SRST
 ERST
 
     {
+        .name       = "virtio",
+        .args_type  = "name:S?",
+        .params     = "[cmd]",
+        .help       = "show various information about virtio",
+        .cmd        = hmp_virtio_help,
+        .sub_table  = hmp_virtio_cmds,
+        .flags      = "p",
+    },
+
+    {
         .name       = "info",
         .args_type  = "item:s?",
         .params     = "[subcommand]",
diff --git a/hw/virtio/virtio.c b/hw/virtio/virtio.c
index 735a6ae..0836c6d 100644
--- a/hw/virtio/virtio.c
+++ b/hw/virtio/virtio.c
@@ -32,6 +32,9 @@
 #include "sysemu/runstate.h"
 #include "standard-headers/linux/virtio_ids.h"
 #include CONFIG_DEVICES
+#include "monitor/hmp.h"
+#include "monitor/monitor.h"
+#include "qapi/qmp/qdict.h"
 
 static QTAILQ_HEAD(, VirtIODevice) virtio_list;
 
@@ -3903,6 +3906,32 @@ VirtioInfoList *qmp_x_debug_query_virtio(Error **errp)
     return list;
 }
 
+void hmp_virtio_query(Monitor *mon, const QDict *qdict)
+{
+    Error *err = NULL;
+    VirtioInfoList *list = qmp_x_debug_query_virtio(&err);
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
+                       VirtioType_str(node->value->type));
+        node = node->next;
+    }
+
+    qapi_free_VirtioInfoList(list);
+}
+
 static VirtIODevice *virtio_device_find(const char *path)
 {
     VirtIODevice *vdev;
@@ -3956,8 +3985,48 @@ VirtQueueStatus *qmp_x_debug_virtio_queue_status(const char *path,
     return status;
 }
 
+void hmp_virtio_queue_status(Monitor *mon, const QDict *qdict)
+{
+    Error *err = NULL;
+    const char *path = qdict_get_try_str(qdict, "path");
+    int queue = qdict_get_int(qdict, "queue");
+    VirtQueueStatus *s = qmp_x_debug_virtio_queue_status(path, queue, &err);
+
+    if (err != NULL) {
+        hmp_handle_error(mon, err);
+        return;
+    }
+
+    monitor_printf(mon, "%s:\n", path);
+    monitor_printf(mon, "  device_type:          %s\n",
+                   VirtioType_str(s->device_type));
+    monitor_printf(mon, "  index:                %d\n", s->queue_index);
+    monitor_printf(mon, "  inuse:                %d\n", s->inuse);
+    monitor_printf(mon, "  last_avail_idx:       %d (%"PRId64" %% %"PRId64")\n",
+                   s->last_avail_idx, s->last_avail_idx % s->vring_num,
+                   s->vring_num);
+    monitor_printf(mon, "  shadow_avail_idx:     %d (%"PRId64" %% %"PRId64")\n",
+                   s->shadow_avail_idx, s->shadow_avail_idx % s->vring_num,
+                   s->vring_num);
+    monitor_printf(mon, "  used_idx:             %d (%"PRId64" %% %"PRId64")\n",
+                   s->used_idx, s->used_idx % s->vring_num, s->vring_num);
+    monitor_printf(mon, "  signalled_used:       %d (%"PRId64" %% %"PRId64")\n",
+                   s->signalled_used, s->signalled_used % s->vring_num,
+                   s->vring_num);
+    monitor_printf(mon, "  signalled_used_valid: %d\n", s->signalled_used_valid);
+    monitor_printf(mon, "  VRing:\n");
+    monitor_printf(mon, "    num:         %"PRId64"\n", s->vring_num);
+    monitor_printf(mon, "    num_default: %"PRId64"\n", s->vring_num_default);
+    monitor_printf(mon, "    align:       %"PRId64"\n", s->vring_align);
+    monitor_printf(mon, "    desc:        0x%016"PRIx64"\n", s->vring_desc);
+    monitor_printf(mon, "    avail:       0x%016"PRIx64"\n", s->vring_avail);
+    monitor_printf(mon, "    used:        0x%016"PRIx64"\n", s->vring_used);
+
+    qapi_free_VirtQueueStatus(s);
+}
+
 #define CONVERT_FEATURES(type, map)                \
-    ({                                           \
+    ({                                             \
         type *list = NULL;                         \
         type *node;                                \
         for (i = 0; map[i].virtio_bit != -1; i++) {\
@@ -4090,6 +4159,93 @@ VirtioStatus *qmp_x_debug_virtio_status(const char* path, Error **errp)
     return status;
 }
 
+#define DUMP_FEATURES(type, field)                                         \
+    do {                                                                   \
+        type##FeatureList * list = features->u.field.features;              \
+        if (list) {                                                        \
+            monitor_printf(mon, "                    ");                   \
+            while (list) {                                                 \
+                monitor_printf(mon, "%s", type##Feature_str(list->value)); \
+                list = list->next;                                         \
+                if (list != NULL) {                                        \
+                    monitor_printf(mon, ", ");                             \
+                }                                                          \
+            }                                                              \
+            monitor_printf(mon, "\n");                                     \
+        }                                                                  \
+    } while (0)
+
+static void hmp_virtio_dump_features(Monitor *mon,
+                                     VirtioDeviceFeatures *features)
+{
+    VirtioTransportFeatureList *transport_list = features->transport;
+    while (transport_list) {
+        monitor_printf(mon, "%s",
+                       VirtioTransportFeature_str(transport_list->value));
+        transport_list = transport_list->next;
+        if (transport_list != NULL) {
+            monitor_printf(mon, ", ");
+        }
+    }
+    monitor_printf(mon, "\n");
+    switch (features->type) {
+    case VIRTIO_TYPE_VIRTIO_SERIAL:
+        DUMP_FEATURES(VirtioSerial, virtio_serial);
+        break;
+    case VIRTIO_TYPE_VIRTIO_BLK:
+        DUMP_FEATURES(VirtioBlk, virtio_blk);
+        break;
+    case VIRTIO_TYPE_VIRTIO_GPU:
+        DUMP_FEATURES(VirtioGpu, virtio_gpu);
+        break;
+    case VIRTIO_TYPE_VIRTIO_NET:
+        DUMP_FEATURES(VirtioNet, virtio_net);
+        break;
+    case VIRTIO_TYPE_VIRTIO_SCSI:
+        DUMP_FEATURES(VirtioScsi, virtio_scsi);
+        break;
+    case VIRTIO_TYPE_VIRTIO_BALLOON:
+        DUMP_FEATURES(VirtioBalloon, virtio_balloon);
+        break;
+    case VIRTIO_TYPE_VIRTIO_IOMMU:
+        DUMP_FEATURES(VirtioIommu, virtio_iommu);
+        break;
+    default:
+        g_assert_not_reached();
+    }
+    if (features->has_unknown_features) {
+        monitor_printf(mon, "                    "
+                            "unknown-features(0x%016"PRIx64")\n",
+                       features->unknown_features);
+    }
+}
+
+void hmp_virtio_status(Monitor *mon, const QDict *qdict)
+{
+    Error *err = NULL;
+    const char *path = qdict_get_try_str(qdict, "path");
+    VirtioStatus *s = qmp_x_debug_virtio_status(path, &err);
+
+    if (err != NULL) {
+        hmp_handle_error(mon, err);
+        return;
+    }
+
+    monitor_printf(mon, "%s:\n", path);
+    monitor_printf(mon, "  Device Id:        %"PRId64"\n", s->device_id);
+    monitor_printf(mon, "  Guest features:   ");
+    hmp_virtio_dump_features(mon, s->guest_features);
+    monitor_printf(mon, "  Host features:    ");
+    hmp_virtio_dump_features(mon, s->host_features);
+    monitor_printf(mon, "  Backend features: ");
+    hmp_virtio_dump_features(mon, s->backend_features);
+    monitor_printf(mon, "  Endianness:       %s\n",
+                   VirtioStatusEndianness_str(s->device_endian));
+    monitor_printf(mon, "  VirtQueues:       %d\n", s->num_vqs);
+
+    qapi_free_VirtioStatus(s);
+}
+
 static VirtioRingDescFlagsList *qmp_decode_vring_desc_flags(uint16_t flags)
 {
     VirtioRingDescFlagsList *list = NULL;
@@ -4225,6 +4381,52 @@ done:
     return element;
 }
 
+void hmp_virtio_queue_element(Monitor *mon, const QDict *qdict)
+{
+    Error *err = NULL;
+    const char *path = qdict_get_try_str(qdict, "path");
+    int queue = qdict_get_int(qdict, "queue");
+    int index = qdict_get_try_int(qdict, "index", -1);
+    VirtioQueueElement *element;
+    VirtioRingDescList *list;
+
+    element = qmp_x_debug_virtio_queue_element(path, queue, index != -1,
+                                               index, &err);
+    if (err != NULL) {
+        hmp_handle_error(mon, err);
+        return;
+    }
+
+    monitor_printf(mon, "index:  %d\n", element->index);
+    monitor_printf(mon, "ndescs: %d\n", element->ndescs);
+    monitor_printf(mon, "descs:  ");
+
+    list = element->descs;
+    while (list) {
+        monitor_printf(mon, "addr 0x%"PRIx64" len %d", list->value->addr,
+                       list->value->len);
+        if (list->value->flags) {
+            VirtioRingDescFlagsList *flag = list->value->flags;
+            monitor_printf(mon, " (");
+            while (flag) {
+                monitor_printf(mon, "%s", VirtioRingDescFlags_str(flag->value));
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
+
+    qapi_free_VirtioQueueElement(element);
+}
+
 static const TypeInfo virtio_device_info = {
     .name = TYPE_VIRTIO_DEVICE,
     .parent = TYPE_DEVICE,
diff --git a/include/monitor/hmp.h b/include/monitor/hmp.h
index ed2913f..7a63744 100644
--- a/include/monitor/hmp.h
+++ b/include/monitor/hmp.h
@@ -98,6 +98,10 @@ void hmp_qom_list(Monitor *mon, const QDict *qdict);
 void hmp_qom_get(Monitor *mon, const QDict *qdict);
 void hmp_qom_set(Monitor *mon, const QDict *qdict);
 void hmp_info_qom_tree(Monitor *mon, const QDict *dict);
+void hmp_virtio_query(Monitor *mon, const QDict *qdict);
+void hmp_virtio_status(Monitor *mon, const QDict *qdict);
+void hmp_virtio_queue_status(Monitor *mon, const QDict *qdict);
+void hmp_virtio_queue_element(Monitor *mon, const QDict *qdict);
 void object_add_completion(ReadLineState *rs, int nb_args, const char *str);
 void object_del_completion(ReadLineState *rs, int nb_args, const char *str);
 void device_add_completion(ReadLineState *rs, int nb_args, const char *str);
diff --git a/meson.build b/meson.build
index a923f24..2d836b9 100644
--- a/meson.build
+++ b/meson.build
@@ -1695,6 +1695,7 @@ if have_system
   hx_headers += [
     ['hmp-commands.hx', 'hmp-commands.h'],
     ['hmp-commands-info.hx', 'hmp-commands-info.h'],
+    ['hmp-commands-virtio.hx', 'hmp-commands-virtio.h'],
   ]
 endif
 foreach d : hx_headers
diff --git a/monitor/misc.c b/monitor/misc.c
index a7650ed..69542df 100644
--- a/monitor/misc.c
+++ b/monitor/misc.c
@@ -23,6 +23,7 @@
  */
 
 #include "qemu/osdep.h"
+#include CONFIG_DEVICES
 #include "monitor-internal.h"
 #include "cpu.h"
 #include "monitor/qdev.h"
@@ -220,6 +221,15 @@ static void hmp_info_help(Monitor *mon, const QDict *qdict)
     help_cmd(mon, "info");
 }
 
+static void hmp_virtio_help(Monitor *mon, const QDict *qdict)
+{
+#if defined(CONFIG_VIRTIO)
+    help_cmd(mon, "virtio");
+#else
+    monitor_printf(mon, "Virtio is disabled\n");
+#endif
+}
+
 static void monitor_init_qmp_commands(void)
 {
     /*
@@ -1654,6 +1664,13 @@ static HMPCommand hmp_info_cmds[] = {
     { NULL, NULL, },
 };
 
+static HMPCommand hmp_virtio_cmds[] = {
+#if defined(CONFIG_VIRTIO)
+#include "hmp-commands-virtio.h"
+#endif
+    { NULL, NULL, },
+};
+
 /* hmp_cmds and hmp_info_cmds would be sorted at runtime */
 HMPCommand hmp_cmds[] = {
 #include "hmp-commands.h"
-- 
1.8.3.1


