Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0AA2F625273
	for <lists+qemu-devel@lfdr.de>; Fri, 11 Nov 2022 05:25:34 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1otLZp-0000cv-4y; Thu, 10 Nov 2022 23:23:37 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=83144312e2=bin.meng@windriver.com>)
 id 1otLZn-0000br-0T
 for qemu-devel@nongnu.org; Thu, 10 Nov 2022 23:23:35 -0500
Received: from mx0b-0064b401.pphosted.com ([205.220.178.238])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=83144312e2=bin.meng@windriver.com>)
 id 1otLZk-0001ct-0m
 for qemu-devel@nongnu.org; Thu, 10 Nov 2022 23:23:33 -0500
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
 by mx0a-0064b401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 2AB4N0iQ024928; Fri, 11 Nov 2022 04:23:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references :
 content-transfer-encoding : content-type : mime-version; s=PPS06212021;
 bh=HhvM9ZgPJi+DYq8Q/mtUG28QrtcJGsvXNZ7mGlaWzwA=;
 b=q/hw80tBuoKY8YQcpRgVzOvoXSr8UmIkozjr23210Et5+m6TbRLjS4TSfFqyO7Ey7Z5+
 /jFJCxiGakNAk0DOu7nbYJkmjSJ8/3pTBunrm91hkffXNJxtkSTz7gZE63DkKHGYDcB9
 BFIQ5x/pDSY+cNfBroa46O1W51+QwmeIC7qre830N2S5YgP1rmLizZ/ft2YKb2HHDD94
 5Y/Mj2JnEZYC6C/MR5D7jfWHauvgguQXqZyCB0f1YBbcZA2rYaG5oZufVn7gvso1EQIq
 wZjOwMNH2bb2k1D+EUsc+q3twGghzuRWd6dE8Tyi2hf96x7mPpYdE+J7bTKADy8dl/QJ xw== 
Received: from nam10-bn7-obe.outbound.protection.outlook.com
 (mail-bn7nam10lp2107.outbound.protection.outlook.com [104.47.70.107])
 by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3knd21ndvj-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 11 Nov 2022 04:23:22 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HJVsus9I4zlYWjW3CilfVL7Nya87qV2ZjMvegaJGSq2OQoFOxkrgYxtGifenvfVIfj07uvspvmsJfUJlz/oUemay+Eh0FPvAuskZGSEOpXesaE1AtipZ46TJOBlpjOUhy65l695YCBBREA8FQxTHaiXv+bS0e45Q80Gjr8/8GQF25g19d02sUvPYgsJWoW+rUZBJNktshI7zcUpE3Ovk4T0af4wwEsTTvnyNA/cbQMyEDaqSo1Ykoajh5mEwSRYfSyzZkRHWQIwRelx6uhMrds/FtkIx4F7f7sa0j5Qy/MwsQdJAH5upehF79GJs2ge68u+L7bfXl7OH7boz1Ka/gw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HhvM9ZgPJi+DYq8Q/mtUG28QrtcJGsvXNZ7mGlaWzwA=;
 b=Eb/V0peuFcXv5rJI6JT+nKGf5VYrTvWnoJLqCvsVqfbGMPp6z8ObO60qo15+bQQ+ikGrtxIXbWQRDefZ7kmN1rUFBTg0UIriQXqxiyUxjidEke8Qp7Vq8qiR+xZOaxzobFLjuy05gS5e/xJ10qHOXG4udrTDUfZpobMtVG/NP+QyrtJVFQ2zUJVSs+u1vU+aeZyZ59gQGENt2WldySIce6xP6uI2AL8S9f1Yf4o/G+f3ZsC6wuRNcnGsc/q8e8T8D6kktsP+9PCSNL4SJ79mAiIS48A+UMte6kyLGzqVt5yob2CKO+x5p+RFS19dubJx1NmBvEP6as3MEmQGE2KzMQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DM4PR11MB5358.namprd11.prod.outlook.com (2603:10b6:5:395::7) by
 SJ0PR11MB5102.namprd11.prod.outlook.com (2603:10b6:a03:2ac::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5791.27; Fri, 11 Nov
 2022 04:23:21 +0000
Received: from DM4PR11MB5358.namprd11.prod.outlook.com
 ([fe80::8e5e:71da:1e29:bc15]) by DM4PR11MB5358.namprd11.prod.outlook.com
 ([fe80::8e5e:71da:1e29:bc15%5]) with mapi id 15.20.5813.013; Fri, 11 Nov 2022
 04:23:21 +0000
From: Bin Meng <bin.meng@windriver.com>
To: qemu-devel@nongnu.org
Cc: Guohuai Shi <guohuai.shi@windriver.com>,
 Christian Schoenebeck <qemu_oss@crudebyte.com>, Greg Kurz <groug@kaod.org>
Subject: [PATCH v2 17/19] hw/9pfs: Update synth fs driver for Windows
Date: Fri, 11 Nov 2022 12:22:23 +0800
Message-Id: <20221111042225.1115931-18-bin.meng@windriver.com>
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
X-MS-Office365-Filtering-Correlation-Id: e1482a10-dfff-41a3-54b3-08dac39c7760
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: MCAIxJhSx8j5j+57bsNU31y1fZMDOCD7hBma0XHYNhAaZrynTGc7lhEqVlw4aRF9kdBMglQRhFixo3wV0QUC/Dh63BgSZ3ic2cTiXCGhYeI618UIyOICZvW75UGAOLt3ecx32ZRqR2sJnIDQ+1I6c9LFNkRVP/HjMpGN4l4ntz7+4HIoKHl5h6jSy08vZ8z82zlISGXkhWy0MjZzbUs/UfXfzBUZYaBtfp2NJnixpIkl8qyDWcUSIWB6+cNKKvR1WVo9O3UXmQ+RQuv76DZcM8TaeTocKdECGZSaQG2scCDK3aG/jhjLqNCvk0YiayRBE6Vz0Dvfe9ovia6mmBGRbWd7j6c4aHubKeltM7QU1LlW+esxKlF2IB2aOBQ/NKyaPP4DFIc+vtmzUDvD8l47Na4IG4ssymOe/Y5FpKpWzf/du6cgIKTvBZYIaMFn29B+3ZxtERs+S4Jgvv7qNcUSnDxwlxDIH1ILjYvTypOTRc/cJuC/NsG6LccLXSEmd49PUX+TCgFu0x3ThIYLYkQpeJnki0Yq7H7uB6uo0NrUrhvnVaL6abNbP6VPNOWZmQ2xNJJs/+EFwAyTw2SNpQQPlaRxJs5FXiBQnOkZWj9vGG/6SBFU5kJbhyX6Js0aU6SONKNdXy5r+teOL97/17GtEZiApgbqp8V/67KKsI/cap51UWKhmhZ3AqV8qPKRJpDtEIN4bMvQH7JOrF/Fgxeo1137qaPci8OtaKJoWY0AWA52nnIjOJCHlmumHXzOWKHogSN0nrENMLVD9dTanZGzUA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5358.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(396003)(346002)(376002)(39850400004)(366004)(136003)(451199015)(66556008)(316002)(86362001)(8676002)(66476007)(66946007)(4326008)(38350700002)(38100700002)(36756003)(44832011)(83380400001)(52116002)(6512007)(2616005)(1076003)(26005)(6506007)(478600001)(186003)(6486002)(4744005)(8936002)(41300700001)(6916009)(2906002)(54906003)(5660300002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?+HXWuou49PGT2cJKQpH/+NhjYzTVHK3ZZjVI6ynk10KR3ORpugBJkoSgqVZL?=
 =?us-ascii?Q?ttwJrI2oRuSuQGdthp2QQW6QUbDvoMYPnL9kicTh0VB4QTaK5/uKqMJ+C2oO?=
 =?us-ascii?Q?RZAyOx/+UsU6NA0GU7u/n1xPKY7YsOJ0A5FOzRMd9zqjqq9t962oLRd5QKge?=
 =?us-ascii?Q?ZliYy0xCYnmp5rU2ypXf9Rqo5PWnX27STJU/ALxKZP2z19echCuhBxbpkXLg?=
 =?us-ascii?Q?nRz5XesUrupIBX7A59mU6Yr3eNyF4m4mKyt6lqGeuWTi/RWo4oi/JFfXQQhw?=
 =?us-ascii?Q?YG1WlNXj92w4eaMFmUosIlbw9maVI6hLHxZyeizYhUqKCtDaKvHziQqs3AhA?=
 =?us-ascii?Q?YK8Gs7pUYX4wEPASX2W3G3zTWMf1Pph1HJI65/aP+gA0kRS2bWTiJofmPY7a?=
 =?us-ascii?Q?pIU09SyE5/Gut4couL4xxTjQp2lq2/mvyzgIcoYHW4wvqpF0QGge4GIxHkNQ?=
 =?us-ascii?Q?1ju+pKwY21kym1dpUarZ4bu9ND/zEKjLFs/nffYfIczIfJExqrVzFXXHEAER?=
 =?us-ascii?Q?pJP1VS+COqbid7hNV2P33hISJw/exlRzlwiAlw7/NBELTwcXMrfAo4YSH6qx?=
 =?us-ascii?Q?o1ihiPcexg2Hjtrbg9yAA2tufn3CpPp+0G9Pf8vGQW00646R307IWpVuuig2?=
 =?us-ascii?Q?amvG9Szaa86v7M34+DRvXKon1ELaTqhwy2wTRaDMqQFoVS4882vro2qyEsPU?=
 =?us-ascii?Q?kAexu2fbxpnr57jj3QAc8iq7HXL8Y1WquW6g+EvZ9Mqpo/AqBvt4iWfKLqSP?=
 =?us-ascii?Q?JoH1p4eag7/Ah2vd7m2Qx6ugmGInr6Qhx9KfDqH/MN2XWvtD4P4RfJyaOc9D?=
 =?us-ascii?Q?basoz3Qgw5yOjCT4jm1qCo7ThJ6wU9W1tiO7JAW1r5T4MsR06r3e6Km3sROh?=
 =?us-ascii?Q?/oqQGqzPvbqwWR1lvIcU6kfgoVNEQij0lmCJ02urfFWBsXwSgwysjVR6MOsP?=
 =?us-ascii?Q?dL46ug8q4wXmPU7V+/1/IF8WCBEbdoFMTQ4HgD88c10qFB+Fvp7a/K6pHgMN?=
 =?us-ascii?Q?rBBJuDO2jk5mDdK4rcHCYA6cpShUBRkjSFhLCi5PZq8hHC+3gKnG05PE62Vl?=
 =?us-ascii?Q?Yn5qoI2S2zVN3gVNVHFLgL0p6UfHacgk6uBWsxuAZLb+F2UbF63W6JqLg1dt?=
 =?us-ascii?Q?UAk5Ol80KOw/j9Hnx4+haYTsS/EyP9IM3FX8MifWdVMV2QYy705h7McJtvDa?=
 =?us-ascii?Q?kUZpfrzhZt4AyPwd0r7gu3tOsMlDnRR400TtUz9VwOU89DNZZXenTzOheCWT?=
 =?us-ascii?Q?dhVsY4Yv92qcIdxScPGxVbIcYzyGuk5t43Rpt6umwVY1goAWYXUPGLzOcQGo?=
 =?us-ascii?Q?JM2N73doVJmIgOv22AY03dMGdUkHa4SwQpsMtVVs3t/LZm/+NJObbtWHPadP?=
 =?us-ascii?Q?RlMX2VkBKwojRrwpMWYsPl6k4qQGendJzYyPhOQ1q3/RnY1GvwwXaDya2oYZ?=
 =?us-ascii?Q?TSfqxD5xA1ZoAXBfpZ+5F4rPu1PqMRwGkKxpqcZCzNCUIOnqg0JWBRetPHPV?=
 =?us-ascii?Q?7iniiBnD/dzZHsfYu8fsD47/I1Zp0J9m7a4IxAIy9ye6ioKG+cqtpi3nXvQE?=
 =?us-ascii?Q?AzrXYwKOLcXNX37CaARqOenu81sTvbkwJrC0TAMb?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e1482a10-dfff-41a3-54b3-08dac39c7760
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5358.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Nov 2022 04:23:21.4118 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Edrd3YhQGIB1BLCo58/uVYa3pcbfVkRKP7f9/QJB+4VWxaMGYCdFdpOJYVaKm/4e3S7Qq0s2rKR2t/LjRhy3mQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB5102
X-Proofpoint-GUID: 9bmFtbLuG-VQuVSyOxWFLKdPzeK3MqPy
X-Proofpoint-ORIG-GUID: 9bmFtbLuG-VQuVSyOxWFLKdPzeK3MqPy
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.895,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-11-11_01,2022-11-09_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 clxscore=1015
 suspectscore=0 lowpriorityscore=0 mlxscore=0 malwarescore=0 adultscore=0
 bulkscore=0 phishscore=0 impostorscore=0 priorityscore=1501
 mlxlogscore=946 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2210170000 definitions=main-2211110027
Received-SPF: pass client-ip=205.220.178.238;
 envelope-from=prvs=83144312e2=bin.meng@windriver.com;
 helo=mx0b-0064b401.pphosted.com
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

Adapt synth fs driver for Windows in preparation to running qtest
9p testing on Windows.

Signed-off-by: Guohuai Shi <guohuai.shi@windriver.com>
Signed-off-by: Bin Meng <bin.meng@windriver.com>
---

(no changes since v1)

 hw/9pfs/9p-synth.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/hw/9pfs/9p-synth.c b/hw/9pfs/9p-synth.c
index 1c5813e4dd..6d33eb1cf3 100644
--- a/hw/9pfs/9p-synth.c
+++ b/hw/9pfs/9p-synth.c
@@ -152,8 +152,10 @@ static void synth_fill_statbuf(V9fsSynthNode *node, struct stat *stbuf)
     stbuf->st_gid = 0;
     stbuf->st_rdev = 0;
     stbuf->st_size = 0;
+#ifndef CONFIG_WIN32
     stbuf->st_blksize = 0;
     stbuf->st_blocks = 0;
+#endif
     stbuf->st_atime = 0;
     stbuf->st_mtime = 0;
     stbuf->st_ctime = 0;
@@ -236,7 +238,8 @@ static void synth_direntry(V9fsSynthNode *node,
     entry->d_ino = node->attr->inode;
 #ifdef CONFIG_DARWIN
     entry->d_seekoff = off + 1;
-#else
+#endif
+#ifdef CONFIG_LINUX
     entry->d_off = off + 1;
 #endif
 }
-- 
2.25.1


