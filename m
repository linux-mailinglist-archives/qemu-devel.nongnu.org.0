Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 62FD3680A03
	for <lists+qemu-devel@lfdr.de>; Mon, 30 Jan 2023 10:54:33 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pMQqJ-0002zg-Bl; Mon, 30 Jan 2023 04:52:51 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=13943e2a21=bin.meng@windriver.com>)
 id 1pMQqH-0002yo-2K
 for qemu-devel@nongnu.org; Mon, 30 Jan 2023 04:52:49 -0500
Received: from mx0b-0064b401.pphosted.com ([205.220.178.238])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=13943e2a21=bin.meng@windriver.com>)
 id 1pMQqE-00020r-VC
 for qemu-devel@nongnu.org; Mon, 30 Jan 2023 04:52:48 -0500
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
 by mx0a-0064b401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 30U7ovuD022584; Mon, 30 Jan 2023 09:52:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references :
 content-transfer-encoding : content-type : mime-version; s=PPS06212021;
 bh=PkUIwXcPmGDDh7XO6a8+bxOq5aULYYoUZNE5Gf50AF8=;
 b=BmWEcPi55uUm6ZAfe3tEK0oBx9MSW2HOIyNhnAHRVLBjfl7Ctaz8bOVVU5Rw39pj61Mg
 LcPNzVYXSg3KzdBRJxYCXKxXgxRl0IMyHtvV+mddkWnqkylWEcDmW3ROrFBDmcHlBWlM
 0eXMnKc6Wk4s12umUi0eI3VlP6wMQ3PPUDxCxXWnXFaJ/avhILUoIqEI8ZZsbssNNX+v
 x+RMBD+6AfmHTf5ZjGJwp3jb89nJoEGj7sSRnJ9khKOZLPDUuZch1jw47DJlLoy1YUPS
 NYAjhzgebfaABqarWVEbLEEvKVTq7MbRUt+altsyqMTFjAdrUx5aGpEugN2RBJoE3ein RQ== 
Received: from nam11-dm6-obe.outbound.protection.outlook.com
 (mail-dm6nam11lp2175.outbound.protection.outlook.com [104.47.57.175])
 by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3ncrx3a45e-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 30 Jan 2023 09:52:37 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YPgoa7wumEAJ6QkqifYT1bP8zS2mJpW54xbfr/dOz5uCGvFZYzjt3sNamtewQBXQadue1Ro/wMCKjdVT0i0EB2dh2+up9ZMdjb+Fh8/IwCL9uyNzqrmF80rnIy0fZk+5jWA4UjHRuijt6HCLy70ldmn+kl/UWenl6ppgXieWWNj6PtTQc5XAQzHaT8/LMsLyf3EriyU0HRA9gzfJ/Wih5mHdnZ/Zjf0osEYjr0LaaWd4okTB8h31pNI/BbtfOu2rttE0+jX0Pbs/fEzOF8XD5TUjOauq3FX2mlfKegr6tN6iMiCMpsAj2HbuUXc7hbXk68CefwZ/CixjjPNWVl3gTg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PkUIwXcPmGDDh7XO6a8+bxOq5aULYYoUZNE5Gf50AF8=;
 b=Kytiygs7t5d7YVYU4MXnZ8vIysI7tzq7Z1LqgbBKDwMzrXdM2YhY6VgocJmmuiV4z4FIEukHuKAQ7Crjx3jZ9Eqfq2OkOtgpf0sXWLh2YfMXkBo3L1YUCL1Fa9iD5Ye7dAV6pHGvC/v8REi1zqXmzDpcxDihBj0WFIYhdXmZE0g9KPwcs8OX9AhaSQDIftg9hmju18Ab6hNsz5Bx7GU6KJoMpsKcpqcVpJCBvONdFfBl5u6Ug8kZ07VWA5dNWyxnHLzkb2sXLbPTGRwFA8jLu9J4dOzCcFvex6HBGYnLNNcWlJO9VAEGmpSa8zB7PMtnQfqR4v1YQk67x5TSrgbtgg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DM4PR11MB5358.namprd11.prod.outlook.com (2603:10b6:5:395::7) by
 BL1PR11MB6025.namprd11.prod.outlook.com (2603:10b6:208:390::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6043.36; Mon, 30 Jan
 2023 09:52:36 +0000
Received: from DM4PR11MB5358.namprd11.prod.outlook.com
 ([fe80::6c5d:5b92:1599:ce9]) by DM4PR11MB5358.namprd11.prod.outlook.com
 ([fe80::6c5d:5b92:1599:ce9%2]) with mapi id 15.20.6043.036; Mon, 30 Jan 2023
 09:52:36 +0000
From: Bin Meng <bin.meng@windriver.com>
To: Greg Kurz <groug@kaod.org>, Christian Schoenebeck <qemu_oss@crudebyte.com>,
 qemu-devel@nongnu.org
Cc: Guohuai Shi <guohuai.shi@windriver.com>
Subject: [PATCH v4 08/16] hw/9pfs: Add a helper qemu_stat_blksize()
Date: Mon, 30 Jan 2023 17:51:54 +0800
Message-Id: <20230130095202.2773186-9-bin.meng@windriver.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230130095202.2773186-1-bin.meng@windriver.com>
References: <20230130095202.2773186-1-bin.meng@windriver.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BYAPR02CA0061.namprd02.prod.outlook.com
 (2603:10b6:a03:54::38) To DM4PR11MB5358.namprd11.prod.outlook.com
 (2603:10b6:5:395::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB5358:EE_|BL1PR11MB6025:EE_
X-MS-Office365-Filtering-Correlation-Id: d8d086af-92a7-46a1-9677-08db02a7b70d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: p1kV7PJBC5i27NYqDPWgWdbEGZgMRoFACgyjxCAxYeAceAsvd+e32omz/NeCOOi8CINpRY7njHeUpFBk6f45RMund10VNF7NJ4V7RwodXHy5cYlmD9HLFEyMhD2zxu2TlL9Win3Ju6adjmxMqxZPYbEzxai4ph5i6lvex5azXzA+eeISedfhCGMwmM0xSBpyJy+hvQAbwF/G1m6e/kEbgKIX5fRWSyTMRE/GLNrde6zytOAotNMrf9zPSSnSMDisbAYYNZWSxzYofDCQOzOSPHnonjhnsYN9x/RiUXigFU94cYmZxPymn/nv/ESrabmHwRYXYuLibK3i9/WZ5WKMQfuhmP5CLIa2Zx7C1CpAPZXCifYqSn/h9on47fjQhdAqmf1litoItrRhwmf9GZ034xmixdAfjAnIwjmqmMJkwcrQK8wL5CIjJ3LAuEIh/M6pUv7q+49p8+3gFMd5d+yNc6NqX21iuhQnuWfIhOXZ0uWkkyH/fo2E4w7a31lEAVSwLIQP9pbYRT90az5TEtJ92h+xqKQ0v/bC/OMwq68qn5gVmJE+sr89Hz+n41PMpYvQvwF5XJ82PzABAYX/F4l2w7SXzxOHoxw8KyS7DWdp9pitYLAlmH6BCFLXW0My6PWMD26m4BvX7FZWF8BGH3ICKz5HT27r8TW+nuI1LgDkWhZcdtBcLQqUl420LHuQPsZegrUNf8OMwZqSQBicvivXgw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5358.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(4636009)(396003)(136003)(346002)(366004)(376002)(39850400004)(451199018)(2906002)(26005)(6512007)(186003)(478600001)(6666004)(107886003)(6486002)(316002)(110136005)(36756003)(86362001)(38100700002)(38350700002)(41300700001)(8936002)(2616005)(4326008)(66556008)(66476007)(66946007)(8676002)(52116002)(6506007)(1076003)(5660300002)(44832011)(83380400001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?pOlvmteUV7ci7kQJpFUSG9zTPM7hXCKx8XIVNIqoL0d0cqEc3LtXncVLbpFF?=
 =?us-ascii?Q?CLGy1vSxYeM3KLOAaJHkxqEbNkA3rXpnPNUmO7lwRY+KHw+6a5/IJRJzbCnZ?=
 =?us-ascii?Q?ZL9hyson7j0etdHcUTYHLK2uNCh0ZWAalsbHv7jzISvhAfREVTqHnij746kL?=
 =?us-ascii?Q?C9iCyhQW3/4QQU+w6ZZAxuIOVZUF/Vkx56BzHLRS0srg/nVzzyOXhBzRXtrN?=
 =?us-ascii?Q?CVnIhJOI9D0y1CQ94fOYi/uzecn2k8QaKI42OVj3knrR49TIIlv++7AYkgdV?=
 =?us-ascii?Q?/VH1qOGMfisCgjpX+HuRC3Oy/hN37BOnaymWoV2QPt+gi6ironsQ4oa6cA48?=
 =?us-ascii?Q?BqSQnDgYw0Gu2TQd/7lPE/aIPBY5rRVg/t3xZlr6mS5N8nnYwoTg1n/0Z00V?=
 =?us-ascii?Q?wIGry+LOPF/rJEXs+iAPGnRPPRhpuV665Zpx8p+WKpRwHLZnw152IUzWw3V1?=
 =?us-ascii?Q?VjwxtQPeBXIZasYuE8xE67+/O+S0dGOm78wpUhM9rDcyQL0uupqnFpNh4J8z?=
 =?us-ascii?Q?Mg8XgOZjcIDqrDk3FCp5FoVUPBpuxmxQ3I00Ld9KqHqAt5AYSNYgJMKfFUT4?=
 =?us-ascii?Q?Ixu1E2YwMKcMWiZPjnoFf30khkyESCT2I00QTtsmphNgFQNacXwig/6jsB9H?=
 =?us-ascii?Q?iM3V9FI8k1H86p8HLBKGNej0NJOHDcTwAExIkkMeqSbHw8quMEgkKIdO8Qu5?=
 =?us-ascii?Q?u5LQ760rzBwu7/1Xw13aXYwdQ6d6qfgtUE0rGWZqByLoyj20cp5/k44eGpYT?=
 =?us-ascii?Q?UgmN/fi2vHGoI8HrqUvyZ1APu5JTJkklmroSxHlxrfv0sWINXYrsIoY1uJue?=
 =?us-ascii?Q?HqIiVLQ9M49ISv000JaoygHmN8laOrxT8xjTwnFPjFMNS37V392lYgpqOZN2?=
 =?us-ascii?Q?qNaMUQnneDGF8JIrSoVlJSFFmDRztczX3k/+ijGjnfZrRn2uruubbzGojRBW?=
 =?us-ascii?Q?HitJoxnP46qM1Jqu3tMYq2RK2pgK98EslnE0KjdpxB5NfBMxH80FcqkNBR+O?=
 =?us-ascii?Q?IaOItKuUNWirzqs7RH8oH2wzVJDFPuEZD85+wiMPobWQOqrSTJNQlgWjq2i6?=
 =?us-ascii?Q?f/rqSh4X1WXgCkq2WdKOywEMW/dSyd7vVGmVVhnfJ86jUeR7bIbV8UXWG31T?=
 =?us-ascii?Q?qdDbRbN5+YRdO/c+AyGz/EYRq/5SLXva5TlsivIwtC/Shqkf0b/oGDA67D/2?=
 =?us-ascii?Q?3phzNhA1xA82aUHDcB+6VKlSvmUrr4lnWNIcBLQyTbVD1+B4X0tKPya3cpGJ?=
 =?us-ascii?Q?ivXxks2A4p1YNbz41Eg8iE+1JLthct3vkvkOrvdjAINUSIO89FY9LXTMtBiA?=
 =?us-ascii?Q?wHRjoDlUFdQiZdmXyCLHHQ+UkEutqfKoPulzMF/UMLYnig3jqXQqXGYH+dCj?=
 =?us-ascii?Q?+ot15zrx4JUKnsCkExd4jwVyOGvfFUYyNdNl6G9MwmC9VcaLPZN9GmmT5BrA?=
 =?us-ascii?Q?uzh3+6+EUuMdHfgVf9cr6YZQgp9yIQrX7w/E74sU6JO8Q3yQC8Ogiy6UHzrB?=
 =?us-ascii?Q?bTYb0e5+BwgAuEAIEpws0Ah0FusmbQbMu9RUnxfsu6GHepEtVDYHfLkzJAT3?=
 =?us-ascii?Q?ox1y7N9AQ6zMJzIPL5bBZ78I+3kuP1PXiKqqK4TTwvrSmWNviZjUBNidjLOq?=
 =?us-ascii?Q?vA=3D=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d8d086af-92a7-46a1-9677-08db02a7b70d
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5358.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jan 2023 09:52:35.9784 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3zMoEnRd7KlZiJ9IoAOXi/29THNQnGPTxPJZH8yWL37f66hZx6/FEwHxVgtdzoYMW94/aVIUo8IQj2mVbVfinA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR11MB6025
X-Proofpoint-GUID: cqhlAtBoy9gwQ7IkqNGMvBUQpg6rTDfY
X-Proofpoint-ORIG-GUID: cqhlAtBoy9gwQ7IkqNGMvBUQpg6rTDfY
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.930,Hydra:6.0.562,FMLib:17.11.122.1
 definitions=2023-01-30_09,2023-01-27_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 mlxscore=0
 lowpriorityscore=0 suspectscore=0 phishscore=0 impostorscore=0
 adultscore=0 malwarescore=0 clxscore=1015 mlxlogscore=999 spamscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2212070000 definitions=main-2301300094
Received-SPF: pass client-ip=205.220.178.238;
 envelope-from=prvs=13943e2a21=bin.meng@windriver.com;
 helo=mx0b-0064b401.pphosted.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

As Windows host does not have stat->st_blksize field, we use the one
we calculated in init_win32_root_directory().

Add a helper qemu_stat_blksize() and use it to avoid direct access to
stat->st_blksize.

Co-developed-by: Guohuai Shi <guohuai.shi@windriver.com>
Signed-off-by: Bin Meng <bin.meng@windriver.com>
---

 hw/9pfs/9p-util.h       | 13 +++++++++++++
 hw/9pfs/9p-util-win32.c |  7 +++++++
 hw/9pfs/9p.c            | 13 ++++++++++++-
 3 files changed, 32 insertions(+), 1 deletion(-)

diff --git a/hw/9pfs/9p-util.h b/hw/9pfs/9p-util.h
index 1fb54d0b97..ea8c116059 100644
--- a/hw/9pfs/9p-util.h
+++ b/hw/9pfs/9p-util.h
@@ -156,6 +156,7 @@ void seekdir_win32(DIR *pDir, long pos);
 long telldir_win32(DIR *pDir);
 off_t qemu_dirent_off_win32(struct V9fsState *s, union V9fsFidOpenState *fs);
 uint64_t qemu_stat_rdev_win32(struct FsContext *fs_ctx);
+uint64_t qemu_stat_blksize_win32(struct FsContext *fs_ctx);
 #endif
 
 static inline void close_preserve_errno(int fd)
@@ -285,6 +286,18 @@ static inline uint64_t qemu_stat_rdev(const struct stat *stbuf,
 #endif
 }
 
+static inline uint64_t qemu_stat_blksize(const struct stat *stbuf,
+                                         struct FsContext *fs_ctx)
+{
+#if defined(CONFIG_LINUX) || defined(CONFIG_DARWIN)
+    return stbuf->st_blksize;
+#elif defined(CONFIG_WIN32)
+    return qemu_stat_blksize_win32(fs_ctx);
+#else
+#error Missing qemu_stat_blksize() implementation for this host system
+#endif
+}
+
 /*
  * As long as mknodat is not available on macOS, this workaround
  * using pthread_fchdir_np is needed. qemu_mknodat is defined in
diff --git a/hw/9pfs/9p-util-win32.c b/hw/9pfs/9p-util-win32.c
index 5f6d43b62c..5ece1db7aa 100644
--- a/hw/9pfs/9p-util-win32.c
+++ b/hw/9pfs/9p-util-win32.c
@@ -1296,3 +1296,10 @@ uint64_t qemu_stat_rdev_win32(struct FsContext *fs_ctx)
 
     return rdev;
 }
+
+uint64_t qemu_stat_blksize_win32(struct FsContext *fs_ctx)
+{
+    LocalData *data = fs_ctx->private;
+
+    return data ? (uint64_t)data->block_size : 0;
+}
diff --git a/hw/9pfs/9p.c b/hw/9pfs/9p.c
index 36916fe581..def85a57fa 100644
--- a/hw/9pfs/9p.c
+++ b/hw/9pfs/9p.c
@@ -1335,12 +1335,14 @@ static int32_t blksize_to_iounit(const V9fsPDU *pdu, int32_t blksize)
 
 static int32_t stat_to_iounit(const V9fsPDU *pdu, const struct stat *stbuf)
 {
-    return blksize_to_iounit(pdu, stbuf->st_blksize);
+    return blksize_to_iounit(pdu, qemu_stat_blksize(stbuf, &pdu->s->ctx));
 }
 
 static int stat_to_v9stat_dotl(V9fsPDU *pdu, const struct stat *stbuf,
                                 V9fsStatDotl *v9lstat)
 {
+    dev_t rdev = qemu_stat_rdev(stbuf, &pdu->s->ctx);
+
     memset(v9lstat, 0, sizeof(*v9lstat));
 
     v9lstat->st_mode = stbuf->st_mode;
@@ -1350,7 +1352,16 @@ static int stat_to_v9stat_dotl(V9fsPDU *pdu, const struct stat *stbuf,
     v9lstat->st_rdev = host_dev_to_dotl_dev(rdev);
     v9lstat->st_size = stbuf->st_size;
     v9lstat->st_blksize = stat_to_iounit(pdu, stbuf);
+#if defined(CONFIG_LINUX) || defined(CONFIG_DARWIN)
     v9lstat->st_blocks = stbuf->st_blocks;
+#elif defined(CONFIG_WIN32)
+    if (v9lstat->st_blksize == 0) {
+        v9lstat->st_blocks = 0;
+    } else {
+        v9lstat->st_blocks = ROUND_UP(v9lstat->st_size / v9lstat->st_blksize,
+                                      v9lstat->st_blksize);
+    }
+#endif
     v9lstat->st_atime_sec = stbuf->st_atime;
     v9lstat->st_mtime_sec = stbuf->st_mtime;
     v9lstat->st_ctime_sec = stbuf->st_ctime;
-- 
2.25.1


