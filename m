Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id ED6173F9E71
	for <lists+qemu-devel@lfdr.de>; Fri, 27 Aug 2021 20:01:19 +0200 (CEST)
Received: from localhost ([::1]:51130 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mJgAI-000079-QO
	for lists+qemu-devel@lfdr.de; Fri, 27 Aug 2021 14:01:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56594)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jag.raman@oracle.com>)
 id 1mJg3G-0005Na-SL
 for qemu-devel@nongnu.org; Fri, 27 Aug 2021 13:54:02 -0400
Received: from mx0a-00069f02.pphosted.com ([205.220.165.32]:25196)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jag.raman@oracle.com>)
 id 1mJg3E-0006sL-Sx
 for qemu-devel@nongnu.org; Fri, 27 Aug 2021 13:54:02 -0400
Received: from pps.filterd (m0246617.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 17RH9dZB025438; 
 Fri, 27 Aug 2021 17:53:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : content-type :
 mime-version; s=corp-2021-07-09;
 bh=vkI9doTy+j7/2OfL6gp+DWi7Z/gg+WTLjNM7brzCH/g=;
 b=CN+sjEphxkKmUorEdO7VIr9oOlL31wKGgRyyfu0RL0YUN6xorJAHI4UKN770vJVDEE+r
 cTmM+RZebv/zqwwFy217fILmtBrY2Es1Ey6Fx+MYdw2LKsXEgOiZiPwhWKiPC28OfVqZ
 7URz/bYAxPMsmoSXhOTo9yFJd+kMjb2otFkD1zX3kHP0x9hTGDdTu9Oh4CjsTM77cil7
 gB9Hpwuq1MUDm8JyyPX8a3LLm6gUjkn2BH3HmWfCyEclbi6zxh10Sc3By/sT9KyRBYLs
 HRYJeFh/JQKBikxiuQXF2oJ9zv6O6kAQO+vElJRO5GueGQidvWcT05AoGkfV3ElhDHot gw== 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : content-type :
 mime-version; s=corp-2020-01-29;
 bh=vkI9doTy+j7/2OfL6gp+DWi7Z/gg+WTLjNM7brzCH/g=;
 b=cPTVaMYdFmFaszcNRjeyzXiCF41halSibTYcJBbL8Dzi8tIB2cGwSMIPbjvvQfK/Zd9W
 MXn/u/uRyMq5NNzR0wgePPbYLWjBvGXpVcQacL4NjbRC5v3lrtpsiW6J54PjxtKwA8lP
 8IWc7cNUACOe34KGstOyVy0ypi5SMHfueHxPnkoPxhDlZLXgv5OZ6rOkJtz2KN83f4F7
 8RRqyJDuIuBPrMpVDqsgj17i9UAZnz2Ycoy6UgRyBRWkghO3WiBFRSvp4+BIU/M9USiK
 FO3qP9JJ0cJ79UbJNMu5A4kKGTfNECA4HCYGpJYjB7hFyamunpItdqUQw1SQKAOMVMXP iw== 
Received: from aserp3020.oracle.com (aserp3020.oracle.com [141.146.126.70])
 by mx0b-00069f02.pphosted.com with ESMTP id 3aq1kvgh8p-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 27 Aug 2021 17:53:57 +0000
Received: from pps.filterd (aserp3020.oracle.com [127.0.0.1])
 by aserp3020.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 17RHpksH005402;
 Fri, 27 Aug 2021 17:53:56 GMT
Received: from nam12-mw2-obe.outbound.protection.outlook.com
 (mail-mw2nam12lp2049.outbound.protection.outlook.com [104.47.66.49])
 by aserp3020.oracle.com with ESMTP id 3ajsabkbyk-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 27 Aug 2021 17:53:55 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MIP7odLgeHWvFgo+aJlsSs59CkkL8i4T6Rmw+sydiISsQ7F35m/SO+rXbOUfVCufPZsVsAHPijK1FErPeNo2JCzdPFcsC3FAbkICI44rzo9HvsARapxAtGamUD0ZmuNhuPGQC7OFD3V2w6pSmduch21LGvqaZKLhlEMTPs1xQ1b0GqlMZPVSXH3qCKLX79aqlB28adBh9NLglw6wWVQZ/L4R3LPwD8ncGVmhex8OggdS2dZJ7UR4t7gr/JMoRCMvRjTlb1YSOoTeIgIusPUn7aI5DSOPlhQ5fk+rerk5wrAdzO+BWgFvoeuaFa6BQJhu5qQyYqI1wO4BQjVXO6RSGA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vkI9doTy+j7/2OfL6gp+DWi7Z/gg+WTLjNM7brzCH/g=;
 b=DcvSR4mdrTn/yAA+qfxNZ6LbcYbsbb6rNL5rQjC/qHZSvG5rU8Nlrcwa7A3Ho5lI790g7su2dT55vM0dhp9fxbnV5X31nVK5gMcs7pFkuOs7tFfzLjn7eTk/vCynSBn1W7ihecFxj/kAoc2YYbS4D2+wHkRlGndTH68zn1V6aPa+QaD+D8P0Pi355scLxCb2VqgbMln3XhFNiygckkZBn1uVTwI11JCRofyLN/HChxGGR9RAwd8HdtsU2v02QuCAo/FGaKR0NP2XnQ+loFaTBiijd2E9h3k0hKsHvVlnIdHJZ6s/Io+wJ2jxvJVN2I4C6RxUhmd6n2KVNY0/wG/67Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vkI9doTy+j7/2OfL6gp+DWi7Z/gg+WTLjNM7brzCH/g=;
 b=rqlcglIhG8MFkGqaWJRCIHLGjQOiVvQejp4FCdh93XOwuyOuBhS5C0g5syw4J3SFi+6zaGJJzVEbJeoAPaCG6CkeExXRZkHxBWXwd/MtY/Ng7CYjd5zT9Idkf1Rzv9wTmTo0PLnQukszCRuxYfzcTfFGpY+S2g7PyQzLwFuRbXw=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=oracle.com;
Received: from MN2PR10MB4013.namprd10.prod.outlook.com (2603:10b6:208:185::25)
 by BLAPR10MB4865.namprd10.prod.outlook.com (2603:10b6:208:334::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4436.23; Fri, 27 Aug
 2021 17:53:54 +0000
Received: from MN2PR10MB4013.namprd10.prod.outlook.com
 ([fe80::282e:c371:7a10:b122]) by MN2PR10MB4013.namprd10.prod.outlook.com
 ([fe80::282e:c371:7a10:b122%5]) with mapi id 15.20.4457.023; Fri, 27 Aug 2021
 17:53:54 +0000
From: Jagannathan Raman <jag.raman@oracle.com>
To: qemu-devel@nongnu.org
Subject: [PATCH RFC server v2 05/11] vfio-user: run vfio-user context
Date: Fri, 27 Aug 2021 13:53:24 -0400
Message-Id: <3c043becf2b6e820f5392e0cadb465d5d9b9e6f8.1630084211.git.jag.raman@oracle.com>
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
 15.20.4457.20 via Frontend Transport; Fri, 27 Aug 2021 17:53:51 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 3ea69878-ae3f-466c-72eb-08d96983a27c
X-MS-TrafficTypeDiagnostic: BLAPR10MB4865:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <BLAPR10MB4865E660709A781BE1F0AF7E90C89@BLAPR10MB4865.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:792;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: QP8qXtnfDWHrKq8iDVbeYSO4tvI/X+PLvRuzkSI1EsP0hiE8ojTCmUdbB/RCqP3ZTO/ElI3cqDJyJmpRRZcTr4MsBJtCPUA99ZxqJLalVD+z3pBL8GqGe08XdTOAYQMBaMusxrBq1MD254Bwfaapd9ZYY84SPTyeaGiyNelgXI3LVHIZzD/7U76wRhpbRk8X/JoXEHwZC/4ZMLME7DVDZW0f7WMuBrAFMtq5GMKoUTY1E4DqGPhiMUwisdlN45WQm60NcVQZjoghaYAGApgMTIYnytQg8NmZLAwEXoGdwDJ5HFc3lvmagGGRq3x+I7Z4KeA1LM60jWFa1kG5yyMHS1aCIjf5WYlslDwcku5UyoM2avuPvTx45qQy6Vy7sf5BRw19ukRUDf1eeCFgBgqnCipDBp1iOH3LeMySiGRs0dnEIG3FnhPplwOIRsZ4xQj/Z9HBy/jq23dh9gj3BabRug4Fp09lip7cvOcpNofCpav/z4DZvdhLpP4Px7KW597HoZGp0yljiB1CJHu/2WZd+LFLBEqok/RwtQFUpIMdLt8V8q6cF09fdkLknuvrTx2U1QEQ6gDngIrKIOPPdnoqHTUdPapfTLc4uPQ+PNtyGvbERvTkRtUKUrg57GYUKU+Lp15xMX7eqAqYfhlo4FthHl1gxdCCM9BCaXbDSGnmMULaQS4iNuYP4pPMZ6kUv85MtR7B/2EeLykGRmDunPIO6Q==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR10MB4013.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(346002)(376002)(39860400002)(366004)(136003)(396003)(2906002)(186003)(2616005)(8936002)(26005)(8676002)(38100700002)(36756003)(52116002)(7696005)(83380400001)(107886003)(478600001)(38350700002)(956004)(7416002)(6486002)(4326008)(6666004)(66946007)(5660300002)(66556008)(66476007)(316002)(6916009)(86362001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?HpMmg2En9r52p7N0OFGLeOAehYZqUtzQZ6LGiJpxRjYE+U190JpSpc5Eigbs?=
 =?us-ascii?Q?bHmE9IdTS7LPW+BW+6ux3Jlk9+jDFe5Vj/gNE1+CLp9v30qKRlaoW8zG44Hz?=
 =?us-ascii?Q?nwx2D9ZKcoBkTeqU8eGQ7QmmLfNOFh5hmIkAbzEVlKr8HCVwb9ukEZAXQekR?=
 =?us-ascii?Q?1kgfQkBVuw5cDbS6w5Fb5j5+GvFkvW2Q6MyvSrJIvDTpF+T+ssEUfcsB7fCg?=
 =?us-ascii?Q?UnFKVX5zJeORz4h5MKuO04Vj6ZMBKjgEG0o5PRGg9dF4ol3ONIlmkPrEDLcG?=
 =?us-ascii?Q?MDumt5lRuPSwMpQIgB+isSQowEt/34YagxJ7pMJp7vHe3OZjuu0kqq1d30af?=
 =?us-ascii?Q?N1N8vV0YABTbZk6A2FpGnqZhkGQ6rOOHbZJUh3b7pGAWclVgAxYAwjB9gSeI?=
 =?us-ascii?Q?5NMbc+YnRFQY9jYsPcZTMjL5vFZfKpzaZzzqY0NfV7GJ0XryKDfMV7buib3X?=
 =?us-ascii?Q?Il7ARISvSvNEiSlsX4ZGVHcDhkTnMyArwr+ZfkwR5EXUC17VhB7Pd8n3y6J2?=
 =?us-ascii?Q?O8bD2xfyWsrWPmIZJ+UhFSZcg7OqR2Kd8TN4fdQwRL2O1c0+Rb+rDSGgdDHE?=
 =?us-ascii?Q?yVlWMsmhEDB37Ifn6Ry/htPJBsYYZIUPyoEr0ACrXRRXV2N08yB0I4w3l6S4?=
 =?us-ascii?Q?syG+IXoiqQ9dYvoTMe9Z0IeMDmzx4i1H+689aZxEgj7ZeSL0L3Gfctx2ngR1?=
 =?us-ascii?Q?TAr/YM4jcArN+sRJIaQWFW4GprKwHBNUbHh0YFFfZpduqF+tw0XR7kCCogE+?=
 =?us-ascii?Q?8v1oL/utINsn/Gy/gRRUzR6B+wopSZfVjggG5BMvaeAd4DT3JTpofZvijTEV?=
 =?us-ascii?Q?tlAiTTiNUoGIkQV56+DY0RUwPjLiMa475r9Lvyk91v293VPBAG+Q4IQxGKn0?=
 =?us-ascii?Q?y/oO9vO+Vvw3+AbsPII74Ce20Cd2LGZM6jJB3yxlS+gl3TjA4mT1Uk6mOimS?=
 =?us-ascii?Q?LYdAVcJOgP9uLHDW/wmsMx7/byMqto2aZelUeuWB2SQK0PY+qyNCNxuHdQgl?=
 =?us-ascii?Q?EvaYhZI3VxH9bnZ50uyFKwkLqjdU5A5PX8c1I9AchAkYB+tQ02Qb+Q0Lqb8q?=
 =?us-ascii?Q?B22YmAiJyqSE9zrI/pIh/SxvMV41hglFis5RDDjKva3YpiyeFM6Dy0aeO5eT?=
 =?us-ascii?Q?e8Rn1klz8mJtaV2t0PebonlFBB9ffsIlg3J29wt9/j44xCCuqkmpjPtwtYm5?=
 =?us-ascii?Q?5hGVToYQyECyMdXN7E6RbH0IQ46HVSsY6mmO6BWqm8TonXGUkqeLMwCYzRgW?=
 =?us-ascii?Q?3gJpS2NOoW33hd0pLX9818PMSJivOqJ5Zq6NwgPSOlmd0WEqXyraVfL/DXBk?=
 =?us-ascii?Q?cJjpV4BWzOfUswiShxYtSnWs?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3ea69878-ae3f-466c-72eb-08d96983a27c
X-MS-Exchange-CrossTenant-AuthSource: MN2PR10MB4013.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Aug 2021 17:53:53.9652 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: VCqdodF03cersX/LtogT02rk0/wZVJ0iageu0anWgYIMOe0YR7rad/LEUXmN/RPOCiQwyK+6H5262Z6szL55DQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BLAPR10MB4865
X-Proofpoint-Virus-Version: vendor=nai engine=6300 definitions=10089
 signatures=668682
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 phishscore=0
 spamscore=0
 mlxlogscore=999 bulkscore=0 mlxscore=0 adultscore=0 malwarescore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2107140000 definitions=main-2108270105
X-Proofpoint-GUID: cmx-CZots4pp1nyVP75BdyCVCy1sLTKh
X-Proofpoint-ORIG-GUID: cmx-CZots4pp1nyVP75BdyCVCy1sLTKh
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

Setup a handler to run vfio-user context. The context is driven by
messages to the file descriptor associated with it - get the fd for
the context and hook up the handler with it

Signed-off-by: Elena Ufimtseva <elena.ufimtseva@oracle.com>
Signed-off-by: John G Johnson <john.g.johnson@oracle.com>
Signed-off-by: Jagannathan Raman <jag.raman@oracle.com>
---
 hw/remote/vfio-user-obj.c | 71 ++++++++++++++++++++++++++++++++++++++++++++++-
 1 file changed, 70 insertions(+), 1 deletion(-)

diff --git a/hw/remote/vfio-user-obj.c b/hw/remote/vfio-user-obj.c
index 5ae0991..0726eb9 100644
--- a/hw/remote/vfio-user-obj.c
+++ b/hw/remote/vfio-user-obj.c
@@ -35,6 +35,7 @@
 #include "trace.h"
 #include "sysemu/runstate.h"
 #include "qemu/notify.h"
+#include "qemu/thread.h"
 #include "qapi/error.h"
 #include "sysemu/sysemu.h"
 #include "libvfio-user.h"
@@ -65,6 +66,8 @@ struct VfuObject {
     vfu_ctx_t *vfu_ctx;
 
     PCIDevice *pci_dev;
+
+    int vfu_poll_fd;
 };
 
 static void vfu_object_set_socket(Object *obj, const char *str, Error **errp)
@@ -89,13 +92,67 @@ static void vfu_object_set_devid(Object *obj, const char *str, Error **errp)
     trace_vfu_prop("devid", str);
 }
 
+static void vfu_object_ctx_run(void *opaque)
+{
+    VfuObject *o = opaque;
+    int ret = -1;
+
+    while (ret != 0) {
+        ret = vfu_run_ctx(o->vfu_ctx);
+        if (ret < 0) {
+            if (errno == EINTR) {
+                continue;
+            } else if (errno == ENOTCONN) {
+                qemu_set_fd_handler(o->vfu_poll_fd, NULL, NULL, NULL);
+                o->vfu_poll_fd = -1;
+                object_unparent(OBJECT(o));
+                break;
+            } else {
+                error_setg(&error_abort, "vfu: Failed to run device %s - %s",
+                           o->devid, strerror(errno));
+                 break;
+            }
+        }
+    }
+}
+
+static void *vfu_object_attach_ctx(void *opaque)
+{
+    VfuObject *o = opaque;
+    int ret;
+
+retry_attach:
+    ret = vfu_attach_ctx(o->vfu_ctx);
+    if (ret < 0 && (errno == EAGAIN || errno == EWOULDBLOCK)) {
+        goto retry_attach;
+    } else if (ret < 0) {
+        error_setg(&error_abort,
+                   "vfu: Failed to attach device %s to context - %s",
+                   o->devid, strerror(errno));
+        return NULL;
+    }
+
+    o->vfu_poll_fd = vfu_get_poll_fd(o->vfu_ctx);
+    if (o->vfu_poll_fd < 0) {
+        error_setg(&error_abort, "vfu: Failed to get poll fd %s", o->devid);
+        return NULL;
+    }
+
+    qemu_set_fd_handler(o->vfu_poll_fd, vfu_object_ctx_run,
+                        NULL, o);
+
+    return NULL;
+}
+
 static void vfu_object_machine_done(Notifier *notifier, void *data)
 {
     VfuObject *o = container_of(notifier, VfuObject, machine_done);
     DeviceState *dev = NULL;
+    QemuThread thread;
     int ret;
 
-    o->vfu_ctx = vfu_create_ctx(VFU_TRANS_SOCK, o->socket, 0,
+    o->vfu_ctx = vfu_create_ctx(VFU_TRANS_SOCK, o->socket,
+                                LIBVFIO_USER_FLAG_ATTACH_NB,
                                 o, VFU_DEV_TYPE_PCI);
     if (o->vfu_ctx == NULL) {
         error_setg(&error_abort, "vfu: Failed to create context - %s",
@@ -124,6 +181,16 @@ static void vfu_object_machine_done(Notifier *notifier, void *data)
                    o->devid, strerror(errno));
         return;
     }
+
+    ret = vfu_realize_ctx(o->vfu_ctx);
+    if (ret < 0) {
+        error_setg(&error_abort, "vfu: Failed to realize device %s- %s",
+                   o->devid, strerror(errno));
+        return;
+    }
+
+    qemu_thread_create(&thread, o->socket, vfu_object_attach_ctx, o,
+                       QEMU_THREAD_DETACHED);
 }
 
 static void vfu_object_init(Object *obj)
@@ -147,6 +214,8 @@ static void vfu_object_init(Object *obj)
 
     o->machine_done.notify = vfu_object_machine_done;
     qemu_add_machine_init_done_notifier(&o->machine_done);
+
+    o->vfu_poll_fd = -1;
 }
 
 static void vfu_object_finalize(Object *obj)
-- 
1.8.3.1


