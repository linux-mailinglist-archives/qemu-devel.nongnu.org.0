Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 820B959BC8F
	for <lists+qemu-devel@lfdr.de>; Mon, 22 Aug 2022 11:17:00 +0200 (CEST)
Received: from localhost ([::1]:53788 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oQ3YJ-0006M1-Mz
	for lists+qemu-devel@lfdr.de; Mon, 22 Aug 2022 05:16:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53084)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alexander.ivanov@virtuozzo.com>)
 id 1oQ3NT-0005pF-Pb; Mon, 22 Aug 2022 05:05:47 -0400
Received: from mail-eopbgr60133.outbound.protection.outlook.com
 ([40.107.6.133]:44801 helo=EUR04-DB3-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alexander.ivanov@virtuozzo.com>)
 id 1oQ3NR-0006xe-MY; Mon, 22 Aug 2022 05:05:47 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YXeiNZ7ir63NTGVC5Rf32ARy1WoYbT4OlHZNNmbMTy1jUB+ObXBESOaTpwpjEAEXSBXtjTgEnKP/JhnrxhykIhI8Au0/l6IBQd/S2zqTsejZ6ttLK+WhmwlnGR8qN1QEIN/dpXM7xb9dGIa8YnmY+HV55sL1jM2ViWEYmwR91hgm73lIV5yiL0a59031snmznFVBDMA89NMJV9s4+goQkE1GiBmoea7n5B2PtmZGbBSlIdCBPBm7kJcsJJqk1aNDGb7GHOr13mX/J6hOafzDgUVPEJZjEe+VTmL0ng7nQxZK/or5UXKteNvUlzCTMoN8aRmOqn5z4DwACVyNH97JSw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lKby+1IUvLf++yw2IWxy9kCV73GPYkijaDD2GtrXcRM=;
 b=lB6Lqj11R3NSz42/N8Ce2HwHKhx7zTO7BpClm9Lt5+204oD+PulwdVWV5MWxxRvXOTpYylcm45IVbIW90/+svQI0IUwse9sa0Jyd/N3ikJYzzzuteya0sQQCrMJMIPsDFbcmguBWNMJAcuGvraMEO/OsNlTfM0B+Xi4JYI+xUWLdB1O80lv2nhBq+AmyqKd69IMlvaAcDjW3Es6g6NoAGHnS0OYw0P6XWEmdboyClSa8i0Xt3iIv9aXIiCCeZuVhRIYkP2qX9y1XP4dFnGJz4eqyfnknmbMMNlwz9CLvHKyry+ouqP1Irwt5pT7J8RewjnY+SuSbrz4Z1MFuZSvdgQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lKby+1IUvLf++yw2IWxy9kCV73GPYkijaDD2GtrXcRM=;
 b=XeH0dHeq6BkbZrnfP9arWN8TmPFrgJ7eLb06KlpMoNO8dAUOQ/epD6cL27Neu3VOmXZY2Yov63pFLtWpYQ1ub4LiNGGAJjHJecLeD2wtM8t9iCFGsfq/MGAlCu1CCe/s+dlHAC3g9crRRtRKotC9ui9Bgitwz9phF9bJevuEaP2xCpqZe883hTQgUtc2j33AVJVfR0vF7cfVlL/TSM1YV/claSgsQ8zOq78557dVAMJPLXizgSoSJ/qRBbWNPtRomD0M53R1+EQm6kHmWPp9GmFgvkz5v28IdMCs9Io0ixvtf1Ao9y6kbEjwyRTYf26fwEKj6fJrB8SLXTlUvBQGmA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=virtuozzo.com;
Received: from AS8PR08MB7095.eurprd08.prod.outlook.com (2603:10a6:20b:402::11)
 by AM6PR08MB3382.eurprd08.prod.outlook.com (2603:10a6:20b:47::29)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5546.16; Mon, 22 Aug
 2022 09:05:33 +0000
Received: from AS8PR08MB7095.eurprd08.prod.outlook.com
 ([fe80::7da2:4a5a:2854:26f2]) by AS8PR08MB7095.eurprd08.prod.outlook.com
 ([fe80::7da2:4a5a:2854:26f2%7]) with mapi id 15.20.5546.022; Mon, 22 Aug 2022
 09:05:33 +0000
From: Alexander Ivanov <alexander.ivanov@virtuozzo.com>
To: qemu-devel@nongnu.org
Cc: qemu-block@nongnu.org, den@virtuozzo.com, stefanha@redhat.com,
 vsementsov@yandex-team.ru, kwolf@redhat.com, hreitz@redhat.com
Subject: [PATCH v5 5/9] parallels: Move check of unclean image to a separate
 function
Date: Mon, 22 Aug 2022 11:05:13 +0200
Message-Id: <20220822090517.2289697-6-alexander.ivanov@virtuozzo.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220822090517.2289697-1-alexander.ivanov@virtuozzo.com>
References: <20220822090517.2289697-1-alexander.ivanov@virtuozzo.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: FR3P281CA0088.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:1f::16) To AS8PR08MB7095.eurprd08.prod.outlook.com
 (2603:10a6:20b:402::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 05336854-d66c-4ee8-dfd8-08da841d77eb
X-MS-TrafficTypeDiagnostic: AM6PR08MB3382:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: up0tkKSL9XmOkZytzq5BqWeGbrJ641mWwruzhs9TTVG6KpduyXE0+NlUdoMQW6GKkL+JjqPY+TqPnIzPd5+XtKPDKtI55XXG44aMVFLjdoPw+0B/E/G1qVeyXYEC9gWBz/D6DZOkPOBRdFTBkzOqQHjlksYM6TYEDgrIw0fOefgseHVQH4WyuIuR2R4zpkj7A4I5R2d9PKs4Zt3gZiBFrjAx0A4zIIlDE1ByhkDO85VtktsjZgvqh5hXlN1VptFGr03R2iZ/JmNRbJZiwF11oV0rAurBae+agXV0+th/CuRIfeUWtTp16p+TvEd2D8lSbCG8YxO4/VpG5/I1/wo0sPe6HrvtVBohoyfHi69o2oHhuP9PI456cKG++E314/Xr6aOKBiwbhuByglYuUw8fuiSr9yit+sreFIGfGaC7gSZ1hzEGNPqO3ZK0GN8nBw0czGDhi3ryEW99IOtjHAn1iaytGasa+6gh4oHoG0OAyqPa4BOVsKtzuQIBZwJP11OiQzbDUydOnTW1A9UTt8XYR+o+6dPCPyBeoPCDIm/oj1SlOEUfw8Ls0lA0lu/78k1xM5hr1wk+E28H7lfKB4qsJ286NWKWtxhpXb2SZUJuz4jyypdb+PuzmHBpterJrfhbbpJaWH61D5jAxDefgeFERJtuoQhrsEcaUhb2s0YnId4UG6gXiCFj+Z2lzWk1o8x/Ls2QHjyhfyPnaPOf8RhXzOoxqRdSWtO0yFcmrsNyZWt02MfTf888vbN8kVgPm9LUF3cF9s8ogtMb45Z9EWpKJg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AS8PR08MB7095.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(4636009)(376002)(136003)(346002)(39840400004)(396003)(366004)(4326008)(8936002)(6666004)(6506007)(6512007)(26005)(5660300002)(44832011)(52116002)(83380400001)(36756003)(6916009)(316002)(66946007)(8676002)(66476007)(66556008)(2906002)(38350700002)(38100700002)(2616005)(1076003)(186003)(86362001)(6486002)(41300700001)(478600001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?5duVW64RARiGmNYcw3MnGnpyxOQNLB5shC5zWx5XWBGXlv+ZJXjSO7O7fjOo?=
 =?us-ascii?Q?yeUqbXvQVPhQj6O4WAA7gFomCr4zFtLqBH+ao/6qXrAYDJpuUC30B2LGtjuc?=
 =?us-ascii?Q?Ph17l/GfamwvgojQmktKsTdma6M1Kkv7e8vkVBDc58e91JAv9xiIETlndCF1?=
 =?us-ascii?Q?4dgJBOsoIEE3zBHhIrYnzGOJFUf05uEV20r0A3762Mog6Nr9JzrRP+YUMkdz?=
 =?us-ascii?Q?TvChJSYE6X0aYFKiukpAMOqYgB/nOBOk5zr7eCjl8R7+mBjOxPPMD9YV9d08?=
 =?us-ascii?Q?rdn5T6h4my9jo/FyZGQ4ko2YdrgOwnBndfRrhkbOw7odMW6oKa/YMZzF5284?=
 =?us-ascii?Q?SDVINZScU4vwca2HPDxiJxRUaYY7V327S1TZWM42qqkpugBOHfO5CV0CtkdB?=
 =?us-ascii?Q?YfQkVhQE03xNOtzmAjBnRl0AnW3Z0bsWxLLh8qf/GLqPJpGaQmeMyiqQ933E?=
 =?us-ascii?Q?mGEF4xeI7M2+eRsHL+lob1GYA/GTMUk4SyonsBDCJ18bezpoYX4xbOP5fzAf?=
 =?us-ascii?Q?uFBNaI4FJIMVThTNU8lzLzHlm+EKYzXEgAVt9MzPuhdVYJugjmfWgz8o53Ue?=
 =?us-ascii?Q?gaQ5nb2BE4wrkA8BkT/MjFoDVpAJpptq+WJnUj00JSSsTVF7CHwCsY3qu4NB?=
 =?us-ascii?Q?ef1+ZDk+4khFRAKLnzgyRyk/76+IPvdshL24UVGLwCUWtKYlThkGgRMpuCBi?=
 =?us-ascii?Q?Lpmig1yiqCHOcoPA2cWX5XoKzAh+XxINu/rxTR80iKtGE7E8PJ/gGYeeA2bV?=
 =?us-ascii?Q?+727dTMrsFuXtJ47NWMekMr25UjPeYfYN5Fuu9fs/3Xv/rWug0Wgri4RSOIX?=
 =?us-ascii?Q?ySNAPsguglLJFpWH2tvDSERPOO9Hd/x/z07KUk4IrOHTfJpcjyE//Nb8NElJ?=
 =?us-ascii?Q?J3mCS9tT1QQpPM3hCQIlk9hWiR7gHTJfR+RTV95NvmTguYqeVz2sILbJWuvR?=
 =?us-ascii?Q?7wU8ndg+684OC47BWg0Lu14nmo14NPEcluu4Zy086cFxXZw/kEsxPzLdPvPc?=
 =?us-ascii?Q?lezcGJxYGjgqdregehEYTDHP1zV/3iefvLVRZGC2k1REGNypLFHxvSPJqOE7?=
 =?us-ascii?Q?nrtOLPtfAHSt5sA1/VLYtX9kNnnbco++ZzSlnPl8Chl2IuIBtG5Bj3VIXZgL?=
 =?us-ascii?Q?lhAxftiIS2koNjDTKzRzr/YtPBPqJFC72RUU7FKM80buuJ5MnRvqoifSQwEq?=
 =?us-ascii?Q?ut5NqN38TJJYSUtymJaRySr1Jvefj2SRb66NQDyOTexga8K79XsouPALboRe?=
 =?us-ascii?Q?3kOTnM+9nClajBK46QMRrnPmMddO2cPcKNnmF9pn1VXgmgzzc2e8N1LqJH8C?=
 =?us-ascii?Q?+306J+gQc1r6OO8hU/IOEH/dney8Xq/qLA4O95DrC5LdTEjxE8vWdHjvV7Ze?=
 =?us-ascii?Q?icjr3QJzzOT4nD7KcV066mN3YMctCTjO4YRI44XY2a2DKoD2NDyo2TIjo7uj?=
 =?us-ascii?Q?NsF71A+ZFXnOEiSm6dfNJwatl2hOya7zzaQmiNIczzWG8ivRSMLv9t3BaRSn?=
 =?us-ascii?Q?wof2Tf0S9KlFFG75n7z/e+wp1WOd5CYsVNMBttbWtSyZVxlwOaXcgCajWPdJ?=
 =?us-ascii?Q?z7AutmiAxY7s8VWb9AFmcJ3m+ugDxtSL5REBHgJrMTxndnOh5HpYV9OMDvEI?=
 =?us-ascii?Q?OWUmU+ZMZ6l/zdHeSXYn5qE=3D?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 05336854-d66c-4ee8-dfd8-08da841d77eb
X-MS-Exchange-CrossTenant-AuthSource: AS8PR08MB7095.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Aug 2022 09:05:33.0179 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: QSS1X07ksc0zyO0+VV93MAMwhucaZhMqr4833zRoVEsQTAlcIZx4rjvg6sEH7xsUOCFjqqbaPHHL+jmwjhrFcuwnHYcbSVOcHE7YXM0hMZs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB3382
Received-SPF: pass client-ip=40.107.6.133;
 envelope-from=alexander.ivanov@virtuozzo.com;
 helo=EUR04-DB3-obe.outbound.protection.outlook.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

We will add more and more checks so we need a better code structure
in parallels_co_check. Let each check performs in a separate loop
in a separate helper.

Signed-off-by: Alexander Ivanov <alexander.ivanov@virtuozzo.com>
Reviewed-by: Denis V. Lunev <den@openvz.org> 
Reviewed-by: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>
---
 block/parallels.c | 31 +++++++++++++++++++++----------
 1 file changed, 21 insertions(+), 10 deletions(-)

diff --git a/block/parallels.c b/block/parallels.c
index 357c345517..a35035e231 100644
--- a/block/parallels.c
+++ b/block/parallels.c
@@ -418,6 +418,25 @@ static coroutine_fn int parallels_co_readv(BlockDriverState *bs,
     return ret;
 }
 
+static void parallels_check_unclean(BlockDriverState *bs,
+                                    BdrvCheckResult *res,
+                                    BdrvCheckMode fix)
+{
+    BDRVParallelsState *s = bs->opaque;
+
+    if (!s->header_unclean) {
+        return;
+    }
+
+    fprintf(stderr, "%s image was not closed correctly\n",
+            fix & BDRV_FIX_ERRORS ? "Repairing" : "ERROR");
+    res->corruptions++;
+    if (fix & BDRV_FIX_ERRORS) {
+        /* parallels_close will do the job right */
+        res->corruptions_fixed++;
+        s->header_unclean = false;
+    }
+}
 
 static int coroutine_fn parallels_co_check(BlockDriverState *bs,
                                            BdrvCheckResult *res,
@@ -435,16 +454,8 @@ static int coroutine_fn parallels_co_check(BlockDriverState *bs,
     }
 
     qemu_co_mutex_lock(&s->lock);
-    if (s->header_unclean) {
-        fprintf(stderr, "%s image was not closed correctly\n",
-                fix & BDRV_FIX_ERRORS ? "Repairing" : "ERROR");
-        res->corruptions++;
-        if (fix & BDRV_FIX_ERRORS) {
-            /* parallels_close will do the job right */
-            res->corruptions_fixed++;
-            s->header_unclean = false;
-        }
-    }
+
+    parallels_check_unclean(bs, res, fix);
 
     res->bfi.total_clusters = s->bat_size;
     res->bfi.compressed_clusters = 0; /* compression is not supported */
-- 
2.34.1


