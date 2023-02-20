Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E39A69C852
	for <lists+qemu-devel@lfdr.de>; Mon, 20 Feb 2023 11:12:34 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pU36c-00089m-Fh; Mon, 20 Feb 2023 05:09:10 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=1415163841=bin.meng@windriver.com>)
 id 1pU36a-00088p-2o
 for qemu-devel@nongnu.org; Mon, 20 Feb 2023 05:09:08 -0500
Received: from mx0a-0064b401.pphosted.com ([205.220.166.238])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=1415163841=bin.meng@windriver.com>)
 id 1pU36X-00009L-4T
 for qemu-devel@nongnu.org; Mon, 20 Feb 2023 05:09:07 -0500
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
 by mx0a-0064b401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 31K9f822020143; Mon, 20 Feb 2023 02:08:53 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references :
 content-transfer-encoding : content-type : mime-version; s=PPS06212021;
 bh=6HWeoVpOMG9q1+I4TbjLKgFJbW2Ar0pkOMatkPjkfsU=;
 b=V3TGqk4EktLjI0BRPDsnn2oT5oU2FSIxbGRNjTRLW+Ei63zMxP866m/pVsU2qbE2EaM8
 QuiBqfOD79u8MUBqYMk5gkYEsLcVEHyOREJ9KiMEKq/jeuPlFYAoyUi06A9GnEglYevg
 7IVlp+qEo4sh57x2wyAAsepKPnssQMPalkYnTtjlMY0eZE+2QFBFIwrKjfQLMcjtmpA0
 KnDgy9K7E19WEjooIFbwxmhtYy9Ib/tZpZ1fMdJNxKm5FZUDgyDWzi31tCg35MImJp47
 Vk7fjAXghl7W+T3MiW+ytYWgWFMOf/9+aFMaqn0cbyF84PYiJkgiRBkB1F0SV64jm7QB fQ== 
Received: from nam12-dm6-obe.outbound.protection.outlook.com
 (mail-dm6nam12lp2170.outbound.protection.outlook.com [104.47.59.170])
 by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3nty2psac0-2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 20 Feb 2023 02:08:53 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Mj7JzmJdUumY7xvYA2re5XJnaQMbC0CLqeRXFx7PnIPoBLFhFKGh60zUqFfXBUz9ZQd4++ZT8jN0PPBwC6LcYVw/j3Mpsx5lZVh65GT6oKNLPpPpTHpPalUShe0Lao4x63IL0Bj1Mfmsm9hv/h0XSvQkhLNeD+JIQNYtiTs7Mgl0sZfa7XLSfkUhQ974djcJKyBP2K/qjOk0byjEMuL4Q6h3MS8qK3O12KrSbV+JTxld3SYvq3G533RNzw76XLAabn+uYvuv4oduSkJeoXivT2j02mCsoe7OLAntmDz5sy6YBV4AIR/IbPiyQ8XgWwEYVeuuxF91ZT0BLV7IPsMY1w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6HWeoVpOMG9q1+I4TbjLKgFJbW2Ar0pkOMatkPjkfsU=;
 b=Zq0NyqrByUYer0Op6g5r31pwMj0w2WuF1oc3aL/Yu2OiHIvOsfeSIP3VPSDojkZlZ9nZO8huar2lsA1qApGpCGnRVFmpo0RJXB3s1p6G8HhD5qzzQMszT5CjN/S4hxZAQPvXNGHiNGxqNVIFao5PoLeBmygC07wjOWc8Bh0DUdIqDJl+HpBq9ewgGNqjjbDBQ3czW1slRpWhYR1/3NgaaVUhckihH7C5Ae6ihl3RGhCT18AT6aqmWfEHE+kpIsrymiCPgMiO31kVXgqYCiQy1Yl74l9Uqpt/TO2CmSdxJvQxgxLzYMVKjBZuUeuwGxd2B7GerZ0+ct36Rs92+h0O6w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DM4PR11MB5358.namprd11.prod.outlook.com (2603:10b6:5:395::7) by
 IA0PR11MB7912.namprd11.prod.outlook.com (2603:10b6:208:3dd::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6111.20; Mon, 20 Feb
 2023 10:08:49 +0000
Received: from DM4PR11MB5358.namprd11.prod.outlook.com
 ([fe80::6c5d:5b92:1599:ce9]) by DM4PR11MB5358.namprd11.prod.outlook.com
 ([fe80::6c5d:5b92:1599:ce9%4]) with mapi id 15.20.6111.019; Mon, 20 Feb 2023
 10:08:49 +0000
From: Bin Meng <bin.meng@windriver.com>
To: Christian Schoenebeck <qemu_oss@crudebyte.com>, Greg Kurz <groug@kaod.org>,
 qemu-devel@nongnu.org
Cc: Guohuai Shi <guohuai.shi@windriver.com>
Subject: [PATCH v5 10/16] hw/9pfs: Update v9fs_set_fd_limit() for Windows
Date: Mon, 20 Feb 2023 18:08:09 +0800
Message-Id: <20230220100815.1624266-11-bin.meng@windriver.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230220100815.1624266-1-bin.meng@windriver.com>
References: <20230220100815.1624266-1-bin.meng@windriver.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR03CA0220.namprd03.prod.outlook.com
 (2603:10b6:a03:39f::15) To DM4PR11MB5358.namprd11.prod.outlook.com
 (2603:10b6:5:395::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB5358:EE_|IA0PR11MB7912:EE_
X-MS-Office365-Filtering-Correlation-Id: b4dfcb4e-b6b5-4fdd-f070-08db132a75dd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: TGhNY7aHIMPlSyM5wFjwh8Iq7PXSuPtlHNY5yEaFq5cOnnz2MXYCnYzeYS0pjbc+IyUQ6ZsYlwtFRyQZ/mbPAoLNv/k8y5GfPbFLtTUKVo3bk2pY3Jp8eXmUeBJk+G/j1ER2vkyjFhTvWhoHdteukMRCvQ3gOFUTDcklxAjLSNhQY068WITAVi8ToB9cg9YzXb063BgpYqctPZbz3BLZ8rm1aP9qW5373aqUki+9JPqmokg9Y1BTtacKgfJ6ZWm5LAl1w3UI5VmfdTdsRRwBPkMoLI8Mg6wxyDsiMLygUr0kqQVfvIWlHQAvNOvLnTohUZRvlf8sdd06OpqEtpKivFs9mNVO5ti2F+pyKBG/SVpjLeyYzqRKGLvMDvHkEvGX8j51dLtsUT13j2aAzbW+KtO9b1fAtgc5l+T48/+Gqf8pgrs7LBqt+kpN+5bUy0st8BDtCV0gQl+hGV23j0qZ/Oa1uqJC/wvHfRonwdo1NvGf9+QcZaT3aRy+5i7oMZRz7jOiMxUkMkzNY3xXZMV/Chh6gbnpd376zgSlMznCbe0WGg4H34oO1XqpJZfaSH6cvX5fbJ+ZXW/ooAs+LLpU6SrvFEcrzEmQsb25Jinip3jwyPCyVK76Co9Lg1trrXF0IGN5aV2kEQdPDth0JicF8dn9hS3FQ4rBgwjCv3lmGsDSxuEB9aNnG/afRLWL0E+FDdJu9hINag6U6NOBTIJwLw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5358.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(4636009)(346002)(376002)(396003)(39850400004)(366004)(136003)(451199018)(8936002)(83380400001)(5660300002)(41300700001)(86362001)(44832011)(2906002)(4326008)(52116002)(6486002)(6666004)(186003)(26005)(6512007)(1076003)(107886003)(66556008)(8676002)(66946007)(66476007)(316002)(478600001)(2616005)(110136005)(38350700002)(36756003)(38100700002)(6506007);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?URH4uKLieMCigidfCAgmsxJCqSnF5Zi5IiNO/Q7OvZPSL0V/1gMRhLH97qgy?=
 =?us-ascii?Q?Mvi0/J7GgWttWjBWr28OgP7k6Y8bFmffgJw/TTGjvk6FVGwnXHXLtoHn0V3s?=
 =?us-ascii?Q?aLuWjSeXcja4tdkzrscB6DHjgzCtwAoXnmcBEhQL8eAyQKAIpfmHWHCslCoJ?=
 =?us-ascii?Q?c9cIN6ww8OYlyzLB5/ujsjs7hZfb/SIhhq+bW9fegtvX96HZeMn8x2kRGBMz?=
 =?us-ascii?Q?tg16tX8yFxVXPsXdhfhAVHOClfV7JUZRmdU9KA9mOw4cZKeI7CNvNPGSfxyz?=
 =?us-ascii?Q?hFWMZ8mK8aNAV2mRXsI8SwerJ0LF6KHJtH4isgkWlGW6Wus7OV7nyBqveXFy?=
 =?us-ascii?Q?dwuT7+/GGTnU1U8XGekcTjB8yC9bpRjBPE6jcWg85Re2L0WEdfHxjVokdtpS?=
 =?us-ascii?Q?hZ4Fv6D6FhUsaXdk1GLA2GcPfVIi5b/9Y5/TVv1aAEgPr4knvlVnk5KjhEt2?=
 =?us-ascii?Q?57FCoGns1T4vPJ4Gi3q6Yh9xtQW27ArxDmr6haKSpVdQd4/s9V7swZ9EtrLh?=
 =?us-ascii?Q?RP5VdCYkIElDfgPBeLJmMZiuu9zpP3s7J+YZ+QSeJDuwvK6jC5HJfQTTyqD5?=
 =?us-ascii?Q?CEokmnhNnBJ4Ypwd9pYQHlYjvj5BdI5up0ZGVzPJxZ9tg9olgZOY4JKcjHlL?=
 =?us-ascii?Q?ryOPHUEGxDKBj0rLDpgNR/Tzad3meVP7ykHwMQiAbl9lW+GRMTGo+0SqhAPG?=
 =?us-ascii?Q?TzJr7PcC6XT0M/TBthpL/Sx6zVSgwOKDc7+0yYQokN9/Q4nyRdUMEyjTV7Ne?=
 =?us-ascii?Q?DDdm5TL6wkAGZ71al0WiRQSlR3c45QpBxo73VSpe4cZirToOXZ7iwCetDlAu?=
 =?us-ascii?Q?neQG9sdc+s/6P9Z0DBUXt71IioNeUxhak0jUFlieNaLdvUyLnwL36Pb38NHd?=
 =?us-ascii?Q?o/uTSPZEbfRZ0r6RwRvN+mqQqXnTXrhzsUYtaE133OcWW5bHrJqYKyT94Uwu?=
 =?us-ascii?Q?FQSmFJPjsW6bTnQ5aTQ/viFE/kpbisV697UXWiWfBV3rtJj6zO8bvB7sssVz?=
 =?us-ascii?Q?FoZfFp7uB4070OblJX5KkmEBTpzQLrYwiE0EnSu73dtCdAlV0lBrmLwpBZ1j?=
 =?us-ascii?Q?9jZPcfsXAC2iRNElki0r5JPWCiDZiNymXULEQihrlkc1hm1gMpSsAFglJuvn?=
 =?us-ascii?Q?0/M2d37+NxLz/CivChvc/znhj32Gm40/l0szswFCdmxoSIu+nVlWV5XO5dGu?=
 =?us-ascii?Q?GnNla3bHeBaPuFDuwlGwAQ6CrWRKmzIcFS98zP8kyARKPD4gJFd1ciHRdSAl?=
 =?us-ascii?Q?LxFk5IXh/Rqjus3nDKX1j5LxItD9sh3TE5o8Q84mgfW+OchFZkS0ux38EOaA?=
 =?us-ascii?Q?4HcK3gcv9+BQVb+WIlPd4nJATMUp+Zc7mIyHFPpB0VrWVegBqgGJN8nq00tn?=
 =?us-ascii?Q?EnGuC0REVrjo6EQdu9CwkerJIcFdJlYj5YfHHGLLRhbSWkcBp6iTjejRYglK?=
 =?us-ascii?Q?eyEWooeh25SOtYO+GyZOrP7V4B2XIS6Lt5bkDyWa5hg7KkoZS9x/IT7DiIsQ?=
 =?us-ascii?Q?AxwKIdNVx/ICYlizhBURL2z+VOtEXopSh9Ssd6sWo4f05NvGzH0EsOdTwx/l?=
 =?us-ascii?Q?WAuHEv0atzdur/t86ouSCC2IXJZJKymyQVn6mHiFkMYMOp+kQazqD8Fzn8SB?=
 =?us-ascii?Q?VA=3D=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b4dfcb4e-b6b5-4fdd-f070-08db132a75dd
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5358.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Feb 2023 10:08:49.2903 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: U8sqMlIfLKG+jPvfOPrR30lziMz4DoSE4+EvN2ki0G1dU3kmqvPh+eOoS2Z0UtUKu7b3/OQRuxlSUhZ6nAeZUQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR11MB7912
X-Proofpoint-ORIG-GUID: ySZiCw_Nue8Jlf-PX3JfQT1QEzBSI-aP
X-Proofpoint-GUID: ySZiCw_Nue8Jlf-PX3JfQT1QEzBSI-aP
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.930,Hydra:6.0.562,FMLib:17.11.170.22
 definitions=2023-02-20_08,2023-02-17_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015
 lowpriorityscore=0 phishscore=0 adultscore=0 suspectscore=0 bulkscore=0
 mlxlogscore=999 spamscore=0 priorityscore=1501 malwarescore=0 mlxscore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2212070000 definitions=main-2302200091
Received-SPF: pass client-ip=205.220.166.238;
 envelope-from=prvs=1415163841=bin.meng@windriver.com;
 helo=mx0a-0064b401.pphosted.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
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

From: Guohuai Shi <guohuai.shi@windriver.com>

Use _getmaxstdio() to set the fd limit on Windows.

Signed-off-by: Guohuai Shi <guohuai.shi@windriver.com>
Signed-off-by: Bin Meng <bin.meng@windriver.com>
---

 hw/9pfs/9p.c | 23 ++++++++++++++++++++---
 1 file changed, 20 insertions(+), 3 deletions(-)

diff --git a/hw/9pfs/9p.c b/hw/9pfs/9p.c
index 768f20f2ac..6b2977f637 100644
--- a/hw/9pfs/9p.c
+++ b/hw/9pfs/9p.c
@@ -4394,11 +4394,28 @@ void v9fs_reset(V9fsState *s)
 
 static void __attribute__((__constructor__)) v9fs_set_fd_limit(void)
 {
+    int rlim_cur;
+    int ret;
+
+#ifndef CONFIG_WIN32
     struct rlimit rlim;
-    if (getrlimit(RLIMIT_NOFILE, &rlim) < 0) {
+    ret = getrlimit(RLIMIT_NOFILE, &rlim);
+    rlim_cur = rlim.rlim_cur;
+#else
+    /*
+     * On Windows host, _getmaxstdio() actually returns the number of max
+     * open files at the stdio level. It *may* be smaller than the number
+     * of open files by open() or CreateFile().
+     */
+    ret = _getmaxstdio();
+    rlim_cur = ret;
+#endif
+
+    if (ret < 0) {
         error_report("Failed to get the resource limit");
         exit(1);
     }
-    open_fd_hw = rlim.rlim_cur - MIN(400, rlim.rlim_cur / 3);
-    open_fd_rc = rlim.rlim_cur / 2;
+
+    open_fd_hw = rlim_cur - MIN(400, rlim_cur / 3);
+    open_fd_rc = rlim_cur / 2;
 }
-- 
2.25.1


