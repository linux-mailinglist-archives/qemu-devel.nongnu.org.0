Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C145662525F
	for <lists+qemu-devel@lfdr.de>; Fri, 11 Nov 2022 05:24:03 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1otLZp-0000d5-Qm; Thu, 10 Nov 2022 23:23:37 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=83144312e2=bin.meng@windriver.com>)
 id 1otLZn-0000c6-Vx
 for qemu-devel@nongnu.org; Thu, 10 Nov 2022 23:23:36 -0500
Received: from mx0a-0064b401.pphosted.com ([205.220.166.238])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=83144312e2=bin.meng@windriver.com>)
 id 1otLZl-0001cy-DD
 for qemu-devel@nongnu.org; Thu, 10 Nov 2022 23:23:35 -0500
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
 by mx0a-0064b401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 2AB4N5DO004957; Thu, 10 Nov 2022 20:23:21 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references :
 content-transfer-encoding : content-type : mime-version; s=PPS06212021;
 bh=M2j3E7ngWrmbtYmE4yi5nz0iPjbdn8UqvgKMNy/r2a4=;
 b=rrFiNqgNy6ptwe41MA506wGEz5vPr1gNJUrX6GbxeIdOg8Hq4VlF+1wIgliNI1b0oqM5
 BPRcrT92b0X7ogp/C1Swd+rJo2J+4ruWd/nw1xZh0uA82KDYsA1E5P6ETK2yLJLEfaUX
 jzgCS3fEUmYNHh7vjPbZLJdMq/8Q5XtarP6HiNdpvZw5rwSVl8KfwtNzqI81UvfyLQRq
 ytkr9zeYcdM0FjvZXEazshVtvzjTVQDOcYccoFQyr7O4AQnCjZOIOCJs/T0TsqhxM2+g
 6IYye5Skl05LXYyjvzsAex1JXM1wlggqneQAcvBqZI8H65Nsklp/EXvur/YyN4Wo6Tpa XQ== 
Received: from nam11-co1-obe.outbound.protection.outlook.com
 (mail-co1nam11lp2174.outbound.protection.outlook.com [104.47.56.174])
 by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3knk43d9me-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 10 Nov 2022 20:23:20 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dPxVvyoqq/OiE+9Eq8EqRkC2pLAzjmmvCGPYDustvyTfYEtRhEHodGGfx6cAL/zsRCM9PVjxTRCSuOQYLQYJqGIhZrSGC5TrrjqSPIFCDqUge741JEHP9BQIHaRmeXh6Q6V9I1MPPqkY4DTspUqlGToHTQSB0vWYoe51xeQL5Aiz9PWjLiI4cZLYLv4ugwinNrNi9KnTuBr6H+2jymHXm56quSfo9js2QBtgqEpJ9LykIiDEUnm+6KGzl/hJ5gOuqfh1Y3bdhjuR2sVoFf2Y6zokIWrZcLjR0ZODz6Y2smFCHPF0Hm3JCGuK9zsCkpJTQEKifN9IB5ItbtTpjXoNSA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=M2j3E7ngWrmbtYmE4yi5nz0iPjbdn8UqvgKMNy/r2a4=;
 b=bC9pTMbLZSK0/9AKHpg5tzZjcIZalETD81y7dXf1PFv8hbjkVK2kZ8qagxcTfTUoPB8hQrTGt/4zsoZs6ndYyYObs6/5Dyb3q4kmldYF3JdlKOUzZzVjqxxatDIaG/kCluQ2GZV+rSej7SqeL5qEJZ8znk0P0jgD5vWCs28tbeiy2k9nOWGB8wFfrAhWMUB5z5xWrTx1a/rCczt2HnSnRsJMtM1DVlAGDViL9k4wWB3YVichYkijHsGsn+zgF99oqRnrZvDGVrWFQ9Ap5ndMUxljbWkxQdClQRVyXoKFTk/6RViOh32gMVhLGeyQaJ6B+rjqMfACy+4LyyJo6Bydnw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DM4PR11MB5358.namprd11.prod.outlook.com (2603:10b6:5:395::7) by
 SJ0PR11MB5102.namprd11.prod.outlook.com (2603:10b6:a03:2ac::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5791.27; Fri, 11 Nov
 2022 04:23:19 +0000
Received: from DM4PR11MB5358.namprd11.prod.outlook.com
 ([fe80::8e5e:71da:1e29:bc15]) by DM4PR11MB5358.namprd11.prod.outlook.com
 ([fe80::8e5e:71da:1e29:bc15%5]) with mapi id 15.20.5813.013; Fri, 11 Nov 2022
 04:23:19 +0000
From: Bin Meng <bin.meng@windriver.com>
To: qemu-devel@nongnu.org
Cc: Guohuai Shi <guohuai.shi@windriver.com>,
 Christian Schoenebeck <qemu_oss@crudebyte.com>, Greg Kurz <groug@kaod.org>
Subject: [PATCH v2 16/19] fsdev: Disable proxy fs driver on Windows
Date: Fri, 11 Nov 2022 12:22:22 +0800
Message-Id: <20221111042225.1115931-17-bin.meng@windriver.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20221111042225.1115931-1-bin.meng@windriver.com>
References: <20221111042225.1115931-1-bin.meng@windriver.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SL2P216CA0138.KORP216.PROD.OUTLOOK.COM
 (2603:1096:101:1::17) To DM4PR11MB5358.namprd11.prod.outlook.com
 (2603:10b6:5:395::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB5358:EE_|SJ0PR11MB5102:EE_
X-MS-Office365-Filtering-Correlation-Id: cab7f9db-755a-4f9c-b7fa-08dac39c7620
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: j//FDTAYSQwZ9tG93H64GtqECBxGuhAPdaWePLZ94huLTB8P+H8x1IxFjomT1jL9f2CYnQe1IqKOhmM6bsiKz2VqrI7CvVhtsLY/+rcsJA3XaXPxTPrghasP53DLPk1YFk7yIcLWD8T8Bkji/FJ2dYpfRdBfzGjF49/8bDRb2x0sO0RX2EEjrllF8C8JO1Dg79MwdvhQaM6vXpwxpcMdaeonP1TFuexl5eaP1ujBnVs/tprX83MgGICKp1HRp1NAu/B6tPZpr0h9pzlrXhmNyN/MEQdDWVSfIRNYnOClyzUaWvZRP+sXVMweEenCvFN0mHZPQi0bJp+zYWPZ6R9TsqnHIiXOLEa4R8zO1j6VmbMTaL8QqaHaV+NKHeX7nBGhqWtDnnwZgKQYolBl2FoWcMEtzzTPcyYvPv/20WTVygXUXCxNjKxOy8hfF3DAZir6w+NL6uezskk0KghcDjDD8Q0SCm5jNWMAP75vlAODnVR9Dx8jncREmgBc1yGqWYa4VUZoHNZUVDpckZ1BUSfHqjVBonDJAkEmCmwggaTeXLYk1FwkeEPdObIahTRJNPG0XrTdIA/jJOMcIho2bvmoEfokXV77t2hS+vyaYSy8cqk7v3Cjdc5KIRYQzLERLwHq6M4YLeKhBlonZpYlahrfI0kWs4LWmu9ydW/b2RVEo92xMAkuHTHvHieFFcriXYatyEgGnJs80KySEOP8QEbqtICxQSl0gJ1ecSaThyOnWqiXuGbl/9411XFm4L/7nbkV
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5358.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(396003)(346002)(376002)(39850400004)(366004)(136003)(451199015)(66556008)(316002)(86362001)(8676002)(66476007)(66946007)(4326008)(38350700002)(38100700002)(36756003)(44832011)(83380400001)(52116002)(6512007)(2616005)(1076003)(26005)(6506007)(478600001)(6666004)(186003)(6486002)(4744005)(8936002)(41300700001)(6916009)(2906002)(54906003)(5660300002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?wgJ7vwcOGoQJ/eUTlS4WQ13iNiG2kBWuoSoaors8eSjExVrmobNFUEnXm/wI?=
 =?us-ascii?Q?fK2+Y97W1Xi1Ev5nqwceQ2c9KaPHPpxE/lxvenuQofYg9Ov4ca+3EUs60DjZ?=
 =?us-ascii?Q?cczNSp6++CRg+qiQxmVsggUP/ACnygSOaUKj40B2fxwxvVIUhx4EKTju49IO?=
 =?us-ascii?Q?JYX0PdWPvPKSwq1ILyxA4sCigy+WzP2QCbhG0eYhCcTRb6vxD1iA79M9+iw1?=
 =?us-ascii?Q?fYzlPNvm5Lo8wARxNkcuAVZHwfIT8OPzUnrYyQkyEvvKUaO7S0/U29/EtAxQ?=
 =?us-ascii?Q?xxvBq+iykI8Zj2tQG/aPy4C5fIQ3Owdp6tN/iYLrFgA08MA0/nkmGZQgwAk7?=
 =?us-ascii?Q?RxtS4kUUte97onXa7MQgyAFIq2aEjLyuOS7QAKS9TfyqSfTzd01OQrL9DRbt?=
 =?us-ascii?Q?bPhcx2hgf7ncsPeQgdtVcRZ6b7qNpoX4R/Pt8lgZRB20WrM12SRfdWJQDixz?=
 =?us-ascii?Q?WgJ0TALoIT+ZFa6gSRnNwtzO11PXrCawmpt/0d/QpbNGQ8dliSmPHYppve/Z?=
 =?us-ascii?Q?ZiO7pYirJXN93Yc+puhpAfyo2J3QMK2qepSC7jmZxkbWbS32ciIhXZ/ZhKzC?=
 =?us-ascii?Q?KmshOvE7+bVTFQ/nl9T+SBmDFcbpzT+2ZElXJJ+A/aV2OwNV0warNczJO+yb?=
 =?us-ascii?Q?VZIZHHMjnllCkie9Qc2Tx5sah0KlvXj2joXCiWZSa5c6zLUf1k1/iEz20GjE?=
 =?us-ascii?Q?mfMMFqpPlLnL5OWMdpia15p+1k2lANVs5cNlV6tgYCdK+VoWDEfS8H+c6j0Q?=
 =?us-ascii?Q?1guAEKaQ8XIN5WmQHHtaWuas32G72a91pRkE+c5MBEhlz48bKThgQacqijY1?=
 =?us-ascii?Q?Naeq7TlzGY9qgv9ICJOgJIrxVWixyLXsZQDaqEh4qoq4GMcooU6MY+99mCQ+?=
 =?us-ascii?Q?GYDhOWi2S6hEuYNmXUqLi0YwxGcukcS7CuxJiDMz87W0Hbfj+mDFGj1Bx9WP?=
 =?us-ascii?Q?5DPUywPQ5iIEn0DdPNe795yZWLTLLLZSsgbDdCwaaum7fTFefxSlFY0i0Fqs?=
 =?us-ascii?Q?mcDikMNtDxdJb0FTd5Ud9Z4eNH0fCaD3d/P0n/j5hfXWkBBTjlkyXw6MZiBn?=
 =?us-ascii?Q?VdLO/O2nKNrHMNz0uU2fRscEBjvqYnFE6HZGWAx6VrpwCSHkv6553Vb5w+15?=
 =?us-ascii?Q?A9nO/2OBTYL72PgI+4Nylcg2L0flpiNPWn1FftlnA/oGKmjDzxNgknXZy+mM?=
 =?us-ascii?Q?LeF70J3yd6858F12l+jK7CGJl9eKT3OI+fIl/DgCKZY/HOJm4wGCBA1ONREJ?=
 =?us-ascii?Q?zKmUFDvrIPCnRmHNt4GKyl3v9QPZojVhPcJVOgjT3qpphHcRIfu/OFqu54fj?=
 =?us-ascii?Q?JoeENH6Ft7nQZaM4pgeyTSyWtLpJNJyBhIZBtNDoe8ze+A6u6Ns3yVwzh0Y7?=
 =?us-ascii?Q?CSF7tl3rRrsjsNnzYlsAmcWJxWgJJkjC5lM/vcIztjWd5MW4yYw65UzqJFwK?=
 =?us-ascii?Q?wTPOyFik98plzhq2nXEAzXpHQU5Dm4P3Fvho2ffJk4UWVMzkDCf4rUj5jC3A?=
 =?us-ascii?Q?5YL4dmedXhblynLUgZOeW7lKNHjPn9MujoS3gPBGMRALSqNgOJ74J/C70SJZ?=
 =?us-ascii?Q?guWTVTx/ySfSq+pZzf+g/ofGACLdWCWhwZ3IzZGC?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cab7f9db-755a-4f9c-b7fa-08dac39c7620
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5358.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Nov 2022 04:23:19.3173 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: XTAICLoncrPjpCSC5zoDgkaXWJVjYJcr7ooGK2m43bV0NB59f8YeKykyAvhXDu4BSmvgFvsfnwzivEwustNOqw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB5102
X-Proofpoint-ORIG-GUID: nz3w7gHC8Qe2YUut-a2lPVKwbA7Y_I8E
X-Proofpoint-GUID: nz3w7gHC8Qe2YUut-a2lPVKwbA7Y_I8E
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.895,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-11-11_01,2022-11-09_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 clxscore=1015
 mlxlogscore=582 lowpriorityscore=0 suspectscore=0 priorityscore=1501
 phishscore=0 mlxscore=0 adultscore=0 impostorscore=0 bulkscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2210170000 definitions=main-2211110027
Received-SPF: pass client-ip=205.220.166.238;
 envelope-from=prvs=83144312e2=bin.meng@windriver.com;
 helo=mx0a-0064b401.pphosted.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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

We don't plan to support 'proxy' file system driver for 9pfs on
Windows. Disable it for Windows build.

Signed-off-by: Guohuai Shi <guohuai.shi@windriver.com>
Signed-off-by: Bin Meng <bin.meng@windriver.com>
---

(no changes since v1)

 fsdev/qemu-fsdev.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/fsdev/qemu-fsdev.c b/fsdev/qemu-fsdev.c
index 3da64e9f72..58e0710fbb 100644
--- a/fsdev/qemu-fsdev.c
+++ b/fsdev/qemu-fsdev.c
@@ -89,6 +89,7 @@ static FsDriverTable FsDrivers[] = {
             NULL
         },
     },
+#ifndef CONFIG_WIN32
     {
         .name = "proxy",
         .ops = &proxy_ops,
@@ -100,6 +101,7 @@ static FsDriverTable FsDrivers[] = {
             NULL
         },
     },
+#endif
 };
 
 static int validate_opt(void *opaque, const char *name, const char *value,
-- 
2.25.1


