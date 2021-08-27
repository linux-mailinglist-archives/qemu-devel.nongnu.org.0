Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 664DD3F9E79
	for <lists+qemu-devel@lfdr.de>; Fri, 27 Aug 2021 20:04:30 +0200 (CEST)
Received: from localhost ([::1]:55750 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mJgDD-0003Sa-Do
	for lists+qemu-devel@lfdr.de; Fri, 27 Aug 2021 14:04:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56636)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jag.raman@oracle.com>)
 id 1mJg3M-0005d5-Np
 for qemu-devel@nongnu.org; Fri, 27 Aug 2021 13:54:08 -0400
Received: from mx0a-00069f02.pphosted.com ([205.220.165.32]:32584)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jag.raman@oracle.com>)
 id 1mJg3J-0006vc-B5
 for qemu-devel@nongnu.org; Fri, 27 Aug 2021 13:54:08 -0400
Received: from pps.filterd (m0246617.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 17RH9dZJ025438; 
 Fri, 27 Aug 2021 17:54:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : content-type :
 mime-version; s=corp-2021-07-09;
 bh=KisP+5WTiznmLb6i3eK76RZlqh4SbpCBxf1ru1SblEQ=;
 b=ZfL1SwHSmfFe1oOj+6LBY5oL3zWK0CxKHgoqC+CpXjnqqS24CvbsODnqHYqhvnj9CQVN
 QiV5PJo2FUYLpIE39CvOohSr5UjDt6gJ4ci9mxnmwLDV3b3IoUEy3iDEQIvhh8MR5QMl
 S82ihXsYtGLMPKlDn74MuE7ECFj4ivhkaelB48ULKqkmZPn1UfABVFREurpskIFSM1h7
 /JRVhknj3qg9+mgrlMCP1KI8O6hMjmYa7btAh5cqRCNNSwdoEZht8JcD+ttvHz4fbmEL
 xQJgzkW7C4sryJK4/ET+E45L0YozdgsNkQlWqAtu4q6CLQtDOVTd4TTTEu79o5S/cyLm Qw== 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : content-type :
 mime-version; s=corp-2020-01-29;
 bh=KisP+5WTiznmLb6i3eK76RZlqh4SbpCBxf1ru1SblEQ=;
 b=mDr9hC7hPaXUNhKCe5/8PDVbpn9jyCOPxMou09bPa+dWcLiljtpHCH61tZCUL6fEuTd2
 zGg7YbX5Apz+IaakscHX4GFsY6wq7KrAM8Fm4jB1rZ8okZxZtBpEuZfGuKaNcQp517n1
 u5+lHYptwaFxp8Xv6rFa8en1KqghZ0S47dsu4FEEaDze0yZniHDF9N86oeyaseHnFcd5
 3EEICKfEeW4AeXgUsdPPsBHQIlw6fyVPXOmtJZFdfxCt+Xc27Rpi92y5yoYGtxdiXoiW
 4mULaUl2Wv2cDUNQO829igAw/7ZbCcZAMRDripUlk5W7hMdlCCTLuiA40TqeLBp21iuZ pw== 
Received: from userp3020.oracle.com (userp3020.oracle.com [156.151.31.79])
 by mx0b-00069f02.pphosted.com with ESMTP id 3aq1kvgh9a-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 27 Aug 2021 17:54:01 +0000
Received: from pps.filterd (userp3020.oracle.com [127.0.0.1])
 by userp3020.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 17RHnuc2179067;
 Fri, 27 Aug 2021 17:53:59 GMT
Received: from nam12-mw2-obe.outbound.protection.outlook.com
 (mail-mw2nam12lp2043.outbound.protection.outlook.com [104.47.66.43])
 by userp3020.oracle.com with ESMTP id 3akb92hj7q-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 27 Aug 2021 17:53:59 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FNvvC6uj5SONTxVnf15W2mcHCKZc5Z0h3tdN1Cb/1O99/fI+PDpTI8dwo6OsPN19VOllsBZM/mSfmdSW5v0QdcM2Hj8Y6XTeUe2mPZeIajew0F0swcDwv2A5TV5NOoOUh0Zt/iPeDdPbqOpGkOzW48QHMdRV3x6cRgzkf4XMT5MvSKwkSxk6hpG0mXGqq5hKw6BydtueYkQ7gruGoeXZPoiP68fvgmXCnDlIfBLvUX7rtWy/Xeb7uDQdRNftL4ICAfy6y63qdGBgOw60Ru7GTQGr6MVOLbEr+u+oAZfbvxyxWBRRHeDL3XLeLF9AT0asRS7NnzVkI5gFljyUGz07hA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KisP+5WTiznmLb6i3eK76RZlqh4SbpCBxf1ru1SblEQ=;
 b=dC4f2gGK26u5IZnx0HxITmiP3hW+lTXuK0jF8jATJFMvINYaAgHYAOvbD0JA0CwceSjJtB+aaPeoiUp9D65CXsxHKLfuCrjGSs3fB5FZU48leLchFLSYTJgh3UAmv2Kqwju2NqCoz5JmHIdAcjzAsuZnEPuBPmpvLT2xFCBX9CZrj13UzXrpFpyBtqk08j1X59G/q2uZha+feuuGuobTf6NH13fJi+iV3AhrvFC8gIKa22FOhZBSC2uobSR8cR0ce9kt7sxxvj5Wc/Qpwuum0JHOagOzC15RBbU09Ym2+04kqHQAYOtFVS0NLSddcX/Uj5jJdtzem90d11c3oNfH+w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KisP+5WTiznmLb6i3eK76RZlqh4SbpCBxf1ru1SblEQ=;
 b=Q9vIJdaZfsZcts4YqpXzwA+H7i/VIfRlPaU+AoFSKaqYTiBdNfpH7vI3wUvpjbYHQPpQjqTa5ROSZhjGqT0noXmDNe16fPVJPjg80gJIAzBUOHX7Z1jRrmAUECGiMNQy5MgTn2qQovuhoCaFnflm8k1CuDYKo8XXqdaNS58dKi4=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=oracle.com;
Received: from MN2PR10MB4013.namprd10.prod.outlook.com (2603:10b6:208:185::25)
 by BLAPR10MB4865.namprd10.prod.outlook.com (2603:10b6:208:334::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4436.23; Fri, 27 Aug
 2021 17:53:56 +0000
Received: from MN2PR10MB4013.namprd10.prod.outlook.com
 ([fe80::282e:c371:7a10:b122]) by MN2PR10MB4013.namprd10.prod.outlook.com
 ([fe80::282e:c371:7a10:b122%5]) with mapi id 15.20.4457.023; Fri, 27 Aug 2021
 17:53:56 +0000
From: Jagannathan Raman <jag.raman@oracle.com>
To: qemu-devel@nongnu.org
Subject: [PATCH RFC server v2 06/11] vfio-user: handle PCI config space
 accesses
Date: Fri, 27 Aug 2021 13:53:25 -0400
Message-Id: <5f371fa15eb347317ce9ce56a329a24c713129e0.1630084211.git.jag.raman@oracle.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <cover.1630084211.git.jag.raman@oracle.com>
References: <cover.1629131628.git.elena.ufimtseva@oracle.com>
 <cover.1630084211.git.jag.raman@oracle.com>
Content-Type: text/plain
X-ClientProxiedBy: BYAPR11CA0093.namprd11.prod.outlook.com
 (2603:10b6:a03:f4::34) To MN2PR10MB4013.namprd10.prod.outlook.com
 (2603:10b6:208:185::25)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from jaraman-bur-1.us.oracle.com (209.17.40.46) by
 BYAPR11CA0093.namprd11.prod.outlook.com (2603:10b6:a03:f4::34) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4457.20 via Frontend Transport; Fri, 27 Aug 2021 17:53:54 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 8376b326-fb01-4a92-d458-08d96983a415
X-MS-TrafficTypeDiagnostic: BLAPR10MB4865:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <BLAPR10MB4865566E8E8787506359196D90C89@BLAPR10MB4865.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:91;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: zIA6qHs3EKr8qb3CASQSvazISzoO8gNodpu0j9bXqEvSFLzYedmZDxpa25TjqlcggiNYpzGBdOfRt1xj6lljUYKKyYBxS5DzPRkSJmwq+LcnFwZSm5bZdvFtA+scHJuWa/ZotQr/Q+izCAOSe6DJnjOYrpjfrFFsuD+NSEqoj0C+pj7v7HpAgvNiP+I2/X5sABolQSPx7OXH6eXhYZ+ox3kvNTKCRLUTaPDw2RBYqGLx4E6YKkPtVdyo4hk9v66JS+szwO9AOPNtEsZJfW2Ebcyc6Z6aOHw2+1OA6jhup+NtDBvfdBx32fkY8H1OmjNYGFXgX3I9FR/yFsFa5c13otQYxWtkq3aXUYKcTmI19fdIaXgn53l/935GUE5eM7ei87B4j+xgknxTD4GbDnawWllzOm77emttQX1TnOfTTbIN2FoDjMS1zhICZB6E/CVMM7u0FXGt/qMBpFujUEiRg2gnraLU7mBZwxGs6uOvHJNL44Ch4MF670wJ+kOzfBP7oO854jVebFP+oYeqXMOpKIL1ZbJkbgPrY+dvPz4C6IKgPPYntUTWV5+KUjI8XlviSMO3w8exneAiUT3FDEy567fdjpAOMcKJAIbkoUUIQhfwAtcQKq/f9ri335exN8RlonY64Ee/k63/8MisNEdDsh8vvchJHplqlGLHH77vw5wdhxVdFiM9Sy0ihQmXKUe2Wc0ZDiNJoyOEbhN6oPkERQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR10MB4013.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(346002)(376002)(39860400002)(366004)(136003)(396003)(2906002)(186003)(2616005)(8936002)(26005)(8676002)(38100700002)(36756003)(52116002)(7696005)(83380400001)(107886003)(478600001)(38350700002)(956004)(7416002)(6486002)(4326008)(6666004)(66946007)(5660300002)(66556008)(66476007)(316002)(6916009)(86362001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?i8ofpC2hInUu6WrYAXGdK73tNaxAg8IzdWc3suvGOzuBgAMqpemejPD8Hv9w?=
 =?us-ascii?Q?zmzuN+5f6fqJBBpMXDV0RwwsPv7ZNbx9eymDRZQfD/pBaYYGR12mg5QrPbDt?=
 =?us-ascii?Q?J/UGdXIr44dPCXvqzs5JmCiz8zgv0Sj7p1OtoF49J6fhFw3JDEcKV1yLGlx5?=
 =?us-ascii?Q?M561XkF97qL5/tSyGjqjAz8xR16WkfyK9dmeps44jLWWO55XhB2Kg+uR83KY?=
 =?us-ascii?Q?dvHRpP+vkEOhBCdSRqb/3o4LyXMONJr2amFT051OIMk7iFfuKFyOMmDnn9tm?=
 =?us-ascii?Q?qJWiPXT7VBCucAT+UuaDz194jP4zXTCvxb4DukArKrfw4AQFX+v2l8IZGf96?=
 =?us-ascii?Q?h+3ZEbUh9HlH9Rw0+JwQ5xOh/k1eEn6z6zJJ6RLse9e6SMIgjuJMVmuTSnH4?=
 =?us-ascii?Q?pVZCSrTCPf4y2xwrPfW0kGW85wrw9hpuMiE205XyZIsdCZ2Ix8lHctsdn1Z4?=
 =?us-ascii?Q?6Rb66wtsRyL5wgnE8J3QOeoQOMAVDZtgZyo6YqVqA+MO46w3G0MeAausxbw5?=
 =?us-ascii?Q?O9UeUpVeOOGBea04s9qKzdPl5HGWvVFhYaxQHIU+BMOJO5KUyxOZ9dg76n8J?=
 =?us-ascii?Q?UFvk1zs5IyiCM5ToCm3xZ6JyAWaOnw58Tzn4ZfljyoZAQG/JFzVYfInCMPA3?=
 =?us-ascii?Q?ZyHdTCIyogAtiUsUIrHeAd8u0b2MdnqEQ14vKBSYWMxJM8ABAoAidqPkNqNX?=
 =?us-ascii?Q?oYW+RB0A7prpZex3kxa6DFovxzpgQM4qiLHDik99po27d/nNMtXrvhQ2OUJi?=
 =?us-ascii?Q?W8KNbvssaJ8irNVXYyEg/ROYv8RLUcOCsuxfUjVWNegN9KVdr5AZfHpEFf3Z?=
 =?us-ascii?Q?GEqRKd1IMCyRK99EcROqIws0YjgKbQ4l8RApziIijF663zNGrF/lSIzp1KiK?=
 =?us-ascii?Q?hRPPRKDMvNSYPpGkX6wscFMevir/LvCe9e7q62BpXEdcKqgkvEYzVoxyebCU?=
 =?us-ascii?Q?zvk/lrNaxsigZQAXZJOjxyIr0Z14O0qoxivMILX3Q0ZovOXXClYM7sg6bjWG?=
 =?us-ascii?Q?NCHvy+CZ3X+j4Tq9C6lmjZlv4tKDIPTadQ3b1LjiUCFzKENFCq99Y/78JQO+?=
 =?us-ascii?Q?ZiG8R0XqC1/FUCYW/LGQ+w6Xz+f6Gc367wfjunDQm7dw9UfE/3csp9h6ZDoe?=
 =?us-ascii?Q?EPcW/sKSPwQNPOlimrvy3sega/JLCnde4Le49OZwtCAJl8APqH4OU17p6a+R?=
 =?us-ascii?Q?dO8lZUMXMUxh48GnA3AtaNYsJ21FozLsJVGstM/dnE/K8s/1BfzEgj7Su5U5?=
 =?us-ascii?Q?l2kr4MTbaRubS9yn+SlGU7Pg1bOY/syE8nBF3XBS7M2qmusKG0PwgUk94x6P?=
 =?us-ascii?Q?txBadjgqyipGa7c4Ck/wBy5Z?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8376b326-fb01-4a92-d458-08d96983a415
X-MS-Exchange-CrossTenant-AuthSource: MN2PR10MB4013.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Aug 2021 17:53:56.6201 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1842XpMvWtRNjcIBzCaSkA6Ckkxn/gcr8GBHupnxmKEwkwcqV2jrsnzl/zHk7dSOjCyj3rPTDXPLMP2OaSjTrQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BLAPR10MB4865
X-Proofpoint-Virus-Version: vendor=nai engine=6300 definitions=10089
 signatures=668682
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0
 phishscore=0 spamscore=0
 bulkscore=0 mlxlogscore=999 malwarescore=0 adultscore=0 mlxscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2107140000
 definitions=main-2108270105
X-Proofpoint-GUID: tunsE8dv9RUDcb8K8cbOUk8QXcToIDqp
X-Proofpoint-ORIG-GUID: tunsE8dv9RUDcb8K8cbOUk8QXcToIDqp
Received-SPF: pass client-ip=205.220.165.32; envelope-from=jag.raman@oracle.com;
 helo=mx0a-00069f02.pphosted.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 MSGID_FROM_MTA_HEADER=0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: elena.ufimtseva@oracle.com, john.g.johnson@oracle.com, thuth@redhat.com,
 jag.raman@oracle.com, swapnil.ingle@nutanix.com, john.levon@nutanix.com,
 philmd@redhat.com, alex.williamson@redhat.com, marcandre.lureau@gmail.com,
 stefanha@redhat.com, thanos.makatos@nutanix.com, alex.bennee@linaro.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Define and register handlers for PCI config space accesses

Signed-off-by: Elena Ufimtseva <elena.ufimtseva@oracle.com>
Signed-off-by: John G Johnson <john.g.johnson@oracle.com>
Signed-off-by: Jagannathan Raman <jag.raman@oracle.com>
---
 hw/remote/vfio-user-obj.c | 44 ++++++++++++++++++++++++++++++++++++++++++++
 hw/remote/trace-events    |  2 ++
 2 files changed, 46 insertions(+)

diff --git a/hw/remote/vfio-user-obj.c b/hw/remote/vfio-user-obj.c
index 0726eb9..13011ce 100644
--- a/hw/remote/vfio-user-obj.c
+++ b/hw/remote/vfio-user-obj.c
@@ -36,6 +36,7 @@
 #include "sysemu/runstate.h"
 #include "qemu/notify.h"
 #include "qemu/thread.h"
+#include "qemu/main-loop.h"
 #include "qapi/error.h"
 #include "sysemu/sysemu.h"
 #include "libvfio-user.h"
@@ -144,6 +145,38 @@ retry_attach:
     return NULL;
 }
 
+static ssize_t vfu_object_cfg_access(vfu_ctx_t *vfu_ctx, char * const buf,
+                                     size_t count, loff_t offset,
+                                     const bool is_write)
+{
+    VfuObject *o = vfu_get_private(vfu_ctx);
+    uint32_t pci_access_width = sizeof(uint32_t);
+    size_t bytes = count;
+    uint32_t val = 0;
+    char *ptr = buf;
+    int len;
+
+    while (bytes > 0) {
+        len = (bytes > pci_access_width) ? pci_access_width : bytes;
+        if (is_write) {
+            memcpy(&val, ptr, len);
+            pci_default_write_config(PCI_DEVICE(o->pci_dev),
+                                     offset, val, len);
+            trace_vfu_cfg_write(offset, val);
+        } else {
+            val = pci_default_read_config(PCI_DEVICE(o->pci_dev),
+                                          offset, len);
+            memcpy(ptr, &val, len);
+            trace_vfu_cfg_read(offset, val);
+        }
+        offset += len;
+        ptr += len;
+        bytes -= len;
+    }
+
+    return count;
+}
+
 static void vfu_object_machine_done(Notifier *notifier, void *data)
 {
     VfuObject *o = container_of(notifier, VfuObject, machine_done);
@@ -182,6 +215,17 @@ static void vfu_object_machine_done(Notifier *notifier, void *data)
         return;
     }
 
+    ret = vfu_setup_region(o->vfu_ctx, VFU_PCI_DEV_CFG_REGION_IDX,
+                           pci_config_size(o->pci_dev), &vfu_object_cfg_access,
+                           VFU_REGION_FLAG_RW | VFU_REGION_FLAG_ALWAYS_CB,
+                           NULL, 0, -1, 0);
+    if (ret < 0) {
+        error_setg(&error_abort,
+                   "vfu: Failed to setup config space handlers for %s- %s",
+                   o->devid, strerror(errno));
+        return;
+    }
+
     ret = vfu_realize_ctx(o->vfu_ctx);
     if (ret < 0) {
         error_setg(&error_abort, "vfu: Failed to realize device %s- %s",
diff --git a/hw/remote/trace-events b/hw/remote/trace-events
index 7da12f0..2ef7884 100644
--- a/hw/remote/trace-events
+++ b/hw/remote/trace-events
@@ -5,3 +5,5 @@ mpqemu_recv_io_error(int cmd, int size, int nfds) "failed to receive %d size %d,
 
 # vfio-user-obj.c
 vfu_prop(const char *prop, const char *val) "vfu: setting %s as %s"
+vfu_cfg_read(uint32_t offset, uint32_t val) "vfu: cfg: 0x%u -> 0x%x"
+vfu_cfg_write(uint32_t offset, uint32_t val) "vfu: cfg: 0x%u <- 0x%x"
-- 
1.8.3.1


