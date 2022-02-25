Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 687664C5242
	for <lists+qemu-devel@lfdr.de>; Sat, 26 Feb 2022 00:48:23 +0100 (CET)
Received: from localhost ([::1]:57218 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nNkJy-0001gi-FY
	for lists+qemu-devel@lfdr.de; Fri, 25 Feb 2022 18:48:22 -0500
Received: from eggs.gnu.org ([209.51.188.92]:35052)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1nNkFQ-0006eG-2t; Fri, 25 Feb 2022 18:43:40 -0500
Received: from [2a01:111:f400:fe0e::72e] (port=3086
 helo=EUR04-VI1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1nNkFO-0005gS-7T; Fri, 25 Feb 2022 18:43:39 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KuLNc4TAgexm/+Q5XfjLjYcg5wvplj3je7UyuTgoxpEI8+O5atwacuYNmeMrvRjcxd4sNDXXDw7d4FZ/JMJAwI5CiN/3dBR9kob2GbpppwUduF2fO9k02rJ+zp5MuCd6Ro14OatQr3Psv0o8QcbxFytnGHyMZUG0c5wuw0RiC4pbz1wKO8oYtJY4wviUy9Rf+As6D965/sjASFwrhI/bRKUNNXKO7aNJ2UW/HFuDss/Nirk/wwakrPeOvyJvhMBk9E5ZgMLG60NQ3p7Hw91vsv9fXQMpPDIQmMGfgU5n1SHDeOzpxep3tVmm5Sdx11k5rF0glkdu5eMvTOdfnWoOvA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iWT+Drz8KsxKARuAufW0n5Xrz2LBbliOHFIe1h3KB/M=;
 b=DUsfdHracVhkYIDOZhHVpBIeGEhOEPPdYzJP0dkVYIP260/+2ubyGKHJckOOBDCa3rgNRJU8wjrpEDNC0Hd5tv5HloDx1auxaCNIRJmkVVEUYDOKRRUlMF8P5qyMBd8VdPOUdCNjSILr6YQyNYt34jSyZd5Murope9N2R/NWNzOSY3JMRs8edmAacRFX1+Yi4RYi89beSFhEHA7PNl6WE7HCT+JezJ4ZNnAyFJd5NkGp0Lrp56dkC5ZbWfJaUMVBLHDlokJriRnbLqURc0ZpLAoa9xSyDvsGDX3Gdnzg2K8fHXTrI9G9kRVteT/b6IHLFtvco674Jk/oogkl9N8nxw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iWT+Drz8KsxKARuAufW0n5Xrz2LBbliOHFIe1h3KB/M=;
 b=i/5KvoLrmWdOMb9HUOPZlrymou9Y3+mogzGjUY6LtNobvGiqSNnt5T74IV5Ii+P1iqVVmYOCuYShqrpw3C1N39lV0Mw9bmdG8MDrO2gywMEsgooYnHaH8sk0Gc2mAw08cX5fDTEIDSc1+yd1vkbz8VMbe37vLpJoYEi5PLiZWtY=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=virtuozzo.com;
Received: from AM9PR08MB6737.eurprd08.prod.outlook.com (2603:10a6:20b:304::18)
 by DB8PR08MB4172.eurprd08.prod.outlook.com (2603:10a6:10:af::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5017.21; Fri, 25 Feb
 2022 23:43:32 +0000
Received: from AM9PR08MB6737.eurprd08.prod.outlook.com
 ([fe80::49c:67e9:3e24:8714]) by AM9PR08MB6737.eurprd08.prod.outlook.com
 ([fe80::49c:67e9:3e24:8714%3]) with mapi id 15.20.5017.021; Fri, 25 Feb 2022
 23:43:32 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, pbonzini@redhat.com, eblake@redhat.com,
 armbru@redhat.com, hreitz@redhat.com, kwolf@redhat.com,
 vsementsov@virtuozzo.com, den@openvz.org, nshirokovskiy@virtuozzo.com,
 yur@virtuozzo.com, dim@virtuozzo.com, igor@virtuozzo.com,
 pkrempa@redhat.com, libvir-list@redhat.com, stefanha@redhat.com
Subject: [PATCH v3 01/11] block-backend: blk_root(): drop const specifier on
 return type
Date: Sat, 26 Feb 2022 00:42:58 +0100
Message-Id: <20220225234308.1754763-2-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20220225234308.1754763-1-vsementsov@virtuozzo.com>
References: <20220225234308.1754763-1-vsementsov@virtuozzo.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: VE1PR03CA0006.eurprd03.prod.outlook.com
 (2603:10a6:802:a0::18) To AM9PR08MB6737.eurprd08.prod.outlook.com
 (2603:10a6:20b:304::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 3a89e651-0450-4642-9b4a-08d9f8b8a135
X-MS-TrafficTypeDiagnostic: DB8PR08MB4172:EE_
X-Microsoft-Antispam-PRVS: <DB8PR08MB417298F35934C2FD79B12962C13E9@DB8PR08MB4172.eurprd08.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: MBkYNhbuA9Jm7R/ko7gOh9JGFeY1mEy53Zlv8YHU9DA7pZkrHMVZku7PsQDR2UdHtfTLNimbBv8kmF/JbHfhazzsJf437eHaU4JJJq5W9jU1kuDVwbezwvE54tbZXoCKNo7iISZ+eChBuyyKfekztHfeLps/xmwFs9/fbDrYND4brk1nf2WeNRBhaPFyTu4OZ71CBn98B19P23Um7nvWz4AEx8/+xGJR8DvqyBAfPwgZ92d+vInK5FjkxR/c3RFQj5rdLSguyhx/yddeHPBHbx3QjkrmqFzVtSseDepvJQ2bXQq/F8MgVlZm92JmuBo5zwPkDPkvJ9yelV4r/20AYZHnyVUFV2OLos7hFcrdyPaZyrhCrajxytpgL/g88T1BF1yKWnFrrAxnkY/EalScIkr5SQ8Nbe9d+XJHaLXK+g/Q/f4VEjzyRMsluyXS9VBxlFoWrSrr5EafuDdvpC9UTogU7spSPkXpzWQYV33SjiUJMSE8H08fZgBX9QEMMOxfrgxtX1gxqweI4x3MSJXNme7CzwxAyg9ptT1AK32c4WYj3lYzwESLaibMN1de7lvAracxOeynCigojq6G3HozvED4pa3AZ5xNv9IJ0INRGMNsk19uNgjqq2YDzizk0qW0qaRDjqktAI9W3I8ii5yuP1RWy05OcU/fpocoea+F0PIkI6/ekLIjr+Tj3fBy3Sx/4fpWcfGuJ5PbRpVZfpGrSA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM9PR08MB6737.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(6916009)(6506007)(8676002)(66556008)(5660300002)(83380400001)(6666004)(7416002)(8936002)(52116002)(508600001)(6486002)(6512007)(2616005)(26005)(316002)(36756003)(38350700002)(1076003)(38100700002)(2906002)(86362001)(4326008)(186003)(66946007)(66476007);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?SN6d6M4A5dbJLqSfF4I8gs6ZqW0LRes8yO/Hzva0nzu4WfQBFicYdmJfP1Jb?=
 =?us-ascii?Q?tPahyjO46Dy7+ZFF7B+1g6ZXhqc6CcZF7OMrp5uVK8NOqwwvSEIQePIi6nZs?=
 =?us-ascii?Q?IBgxvWMD0cLk6AwYknVJ2HEXQooMIIeOXLR1B8MH/P0fsVKNcKOR1nLBOjc/?=
 =?us-ascii?Q?HdEQWqEqBxeza7AbIhNOKvTouyYkSF2WZt4zSPQFEOedyQLOEJVWIblRGa68?=
 =?us-ascii?Q?+H1siTygOYYo2GUguQ+bJebLuCwP5Sr4vZAIWguKKagfzJ33v/xzeWWoHRC0?=
 =?us-ascii?Q?OlbzABlmTJQHCZPk2lFlsG80FE0IoAV3nL8cLIs2DB3IcKcbCwG3zj0Hjdzr?=
 =?us-ascii?Q?BdhCOGT/05F96Pr9otT2FPZqz79YaN+Jr37ogSCr3dvnsknopwW5khK2tcb5?=
 =?us-ascii?Q?0BPYQt9hoHDq/aagGjEdQFlhXKCYZAengQUWfFwdzhGqWBOfNOAaGsykuiAB?=
 =?us-ascii?Q?yC+2LJ5aa0JISuknG4RQjXs3pb1cdXmNb+XlFg/sCWtw2yo6YcJQxXAupRkg?=
 =?us-ascii?Q?ljRqUL7NkgiMu/GwdH0oJqOTUnRBDUnmDauyaxXWxmF/zCXwofYKXc51s7C1?=
 =?us-ascii?Q?nzQmD3GpvYFGii7paHwgDH+AKl+adnNRXEioF0TpgaosdHj2ZaXK1ND0+4Vl?=
 =?us-ascii?Q?M6/QwikltQ4jk+HXd3owESiv2EyOFkdjS+l2b9s4kNM7Gzsymjmu+IODuxxw?=
 =?us-ascii?Q?GeX9cuc5F2tdbAHLB3zHFXz0KINKpRDhvpJsUJCLYXc78SMBkR5owWAyHwER?=
 =?us-ascii?Q?k4Nf+zaFyY/FStsVUF+8sC7RKO8I9EPEaPLvfJtslL6YbWk5ZXKi/zi8JynF?=
 =?us-ascii?Q?YEZuraLJP58QalOLe1mham3lho0/WJmdnsGbJKzPvCu2QL1NiIQuk65Vy5Ci?=
 =?us-ascii?Q?4i1sP6xLx/2mZAir4pvb5h9Atcb95jAFXmBwZdwOqEKnUksk+cenfnMpUSnm?=
 =?us-ascii?Q?uW7vKeIDbvNVKdd1q6JupxnI+FAWChmPl98DP//IxUDXPJwWt4bHPIJ16b6X?=
 =?us-ascii?Q?lndzaCveW2ZPSim1nU1XPqyNEaOsDrLqZVP8+V3aJDeLcl1o6yKUjQILsbG5?=
 =?us-ascii?Q?6kuriTWEcSJL2uODwg+x6oC6cRt0zZFvh1RnDlYogaK794nUD0gHzSy7MPP/?=
 =?us-ascii?Q?cXy65Ay9lMOCjeUQxFFu8JH27d6B5WgSHMxf42OEa+NCvrS/BQ26t1zTnedz?=
 =?us-ascii?Q?50NZXsr4Ha5l1MD0jrbbZBP7SJujWzAyFCWxtjT3+15f+LkPJYS+g0cynaMI?=
 =?us-ascii?Q?f+jEwNBaS7xaJAzyakJt9GFg13AUdtK2pkhXuf3ga0G59mVOcvA+S2+ekmRw?=
 =?us-ascii?Q?PzYE+N/P2rIQfDF9KhPmKbAgZKPVGa590gBu008XSMqkD82t+2LIhzGYddGZ?=
 =?us-ascii?Q?+FNFJXFRgHjR+Ir8uJv/avenWQyWVYhTvor5txL0vX3e9Oz3sVaWPBzXY4XX?=
 =?us-ascii?Q?ov630Y+ikuMQLLAfHsMlrGvRH21B4WIZOvXQO43pgtdQxs2KT01aktpIIch9?=
 =?us-ascii?Q?mGP9TnYiJEeaJoGcufPBitOjknH95JOoHVBiQ1wSYoExIW1dmczjYIU5oNHY?=
 =?us-ascii?Q?AuSeeqFi7n98t20s+78XjAk5SlL5C4dR2vTvE4uJPB7dPoSv62VgAuC+0C53?=
 =?us-ascii?Q?WjFxSd4I3yirVwaint4oyedzhtsmXz1UmPibKIjzWw2pRXuiO2n8bsVZ3XMo?=
 =?us-ascii?Q?cLFPRkBZBN4P1xyqccAUHZJo1PQ=3D?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3a89e651-0450-4642-9b4a-08d9f8b8a135
X-MS-Exchange-CrossTenant-AuthSource: AM9PR08MB6737.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Feb 2022 23:43:32.3057 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: UshlzCkRCpB/HZpb8dOszO6ktjQc3u23aj8jvxeQljUDZD6DsTAnmIIpxFs5STxCUR6ozpEeq5qNxNClWCGZK0xFaf++qkWz0pMo7Sqhw9M=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR08MB4172
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a01:111:f400:fe0e::72e
 (failed)
Received-SPF: pass client-ip=2a01:111:f400:fe0e::72e;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR04-VI1-obe.outbound.protection.outlook.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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

We'll need get non-const child pointer for graph modifications in
further commits.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
---
 include/sysemu/block-backend.h | 2 +-
 block/block-backend.c          | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/include/sysemu/block-backend.h b/include/sysemu/block-backend.h
index e5e1524f06..904d70f49c 100644
--- a/include/sysemu/block-backend.h
+++ b/include/sysemu/block-backend.h
@@ -277,7 +277,7 @@ int coroutine_fn blk_co_copy_range(BlockBackend *blk_in, int64_t off_in,
                                    int64_t bytes, BdrvRequestFlags read_flags,
                                    BdrvRequestFlags write_flags);
 
-const BdrvChild *blk_root(BlockBackend *blk);
+BdrvChild *blk_root(BlockBackend *blk);
 
 int blk_make_empty(BlockBackend *blk, Error **errp);
 
diff --git a/block/block-backend.c b/block/block-backend.c
index 4ff6b4d785..97913acfcd 100644
--- a/block/block-backend.c
+++ b/block/block-backend.c
@@ -2464,7 +2464,7 @@ int coroutine_fn blk_co_copy_range(BlockBackend *blk_in, int64_t off_in,
                               bytes, read_flags, write_flags);
 }
 
-const BdrvChild *blk_root(BlockBackend *blk)
+BdrvChild *blk_root(BlockBackend *blk)
 {
     return blk->root;
 }
-- 
2.31.1


