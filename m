Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id ABDF44910FE
	for <lists+qemu-devel@lfdr.de>; Mon, 17 Jan 2022 21:35:27 +0100 (CET)
Received: from localhost ([::1]:47568 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n9Yis-0002fc-8Y
	for lists+qemu-devel@lfdr.de; Mon, 17 Jan 2022 15:35:26 -0500
Received: from eggs.gnu.org ([209.51.188.92]:55522)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1n9Ygu-0001Ux-E6
 for qemu-devel@nongnu.org; Mon, 17 Jan 2022 15:33:24 -0500
Received: from mail-eopbgr80120.outbound.protection.outlook.com
 ([40.107.8.120]:15870 helo=EUR04-VI1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1n9Ygr-0005Uv-2q
 for qemu-devel@nongnu.org; Mon, 17 Jan 2022 15:33:23 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PQr98rIOFrUnk3CebCQkTAQwA80BzbusOIExlLqjM1FP9kAzdkJuaZVtTn2V7b88X8CriAnd77A3PaubTCKOK3Z9s/WecRcf6orYXCVVXdJc7Q70N0GvbIGPFOd2E0+r6B9p1PXm9IZepu9YC/xt30SolOsrJ2bRo6JX1W9q7pa7dUkp4YLIBwuU7/ZeNfHCbRZQcov0FdAupGeVbEeblDZQSeX8yYgwEUKik4BRtvay5/lw5X4nHkbRXcCLgm+Gdw3wqghRTm6eEkhAFyNlTQZwUJllUbyWaJZdsCaN6Wp1gY2fvT1iXCUjMKY7qujZ25pJJj1JgKsfXqbwECGgZw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=J+WGWD88FcHvUWlqRIyHSQC7wt+XJsoWAtgKjDwGFNU=;
 b=hLFgUZ2yaB/7acRV+eyJv8cCuSOOjf1f/FvJvVsAmwT1myRUeGQDdejSbwF2Ecvv8i+DrtVV50nGEDFMnGBByQPMJnIiZj2lWSc2js/vcrQ096PqWZQnZvudH696lYlYRIPRthCYQEbmq9AYCRP5QxvtD3/ldsi7Kd/EfBCkVm7zuidE2NduKbEHm74pOe3CSD6+TpgdFrH/9enN8rL4i4JtNzNQAA1ah8vQ3I9iqFbwRsDlmrW7yV1TPXaa6ag2sXPM8l+MHSIjvxA/p1GNSRLVn8Z4c5T9XSv/QL6RrVg7HYsZYrzkaHibRgyzM74bzqSdtSWl/4Z/snhn4lckWQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=J+WGWD88FcHvUWlqRIyHSQC7wt+XJsoWAtgKjDwGFNU=;
 b=Dj+prlaIl8eWb+T8UxIWVjE5f//dcP0RaGvulGpGxDNJ6HLIzeQb8Ws2DWo4rCW4CMoUE0hOtKXZbLC0AeuAxb35N4lstRum2DJRTK/iS54lytCd+rOum7m3PNuBcvAhiYedzho8CtgarQwn7y5D489Lgko+ojnvfd8+/LRMPnk=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=virtuozzo.com;
Received: from AM9PR08MB6737.eurprd08.prod.outlook.com (2603:10a6:20b:304::18)
 by VI1PR08MB2957.eurprd08.prod.outlook.com (2603:10a6:803:43::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4888.11; Mon, 17 Jan
 2022 20:19:02 +0000
Received: from AM9PR08MB6737.eurprd08.prod.outlook.com
 ([fe80::b435:c0de:ef6b:5917]) by AM9PR08MB6737.eurprd08.prod.outlook.com
 ([fe80::b435:c0de:ef6b:5917%7]) with mapi id 15.20.4888.014; Mon, 17 Jan 2022
 20:19:02 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-devel@nongnu.org
Cc: stefanha@redhat.com, michael.roth@amd.com, armbru@redhat.com,
 vsementsov@virtuozzo.com, jsnow@redhat.com, hreitz@redhat.com,
 kwolf@redhat.com, pbonzini@redhat.com
Subject: [PATCH v3 0/3] trace qmp commands
Date: Mon, 17 Jan 2022 21:18:42 +0100
Message-Id: <20220117201845.2438382-1-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.31.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: AM6P193CA0069.EURP193.PROD.OUTLOOK.COM
 (2603:10a6:209:8e::46) To AM9PR08MB6737.eurprd08.prod.outlook.com
 (2603:10a6:20b:304::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 50e57880-b57d-457e-f364-08d9d9f69a43
X-MS-TrafficTypeDiagnostic: VI1PR08MB2957:EE_
X-Microsoft-Antispam-PRVS: <VI1PR08MB29574D77C18B81CEBE5F43B7C1579@VI1PR08MB2957.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:348;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: g+xRhYkylS2DUFSvPoL67y44M3GVvv69ZhLsp9mWqPhg+TXO+1p8FeNm3xohHZDkV6ttzKqNGf997kXCxiy+Vk3ieqMegZFnSLBjOywzuyePlnb9uAa+UpiflulcY6PBOqiXhkN9je96rtaVCuN69mWXQFJPneUmxq8s5s0bMzYINY4TDiO+f2rAGAcrlm1iBqvbc0TdFp3rwuf97HSaMaZLQuJo5XnJv6AJk73p0ETSKRWznEEa5dGM4t62OUQTEoWsQuf9fhK6249bi+04Azaf3Z0IaqwKcfHtJ2fKvjFtexoRPgRMO4jvovai44EfSe7foKiPF63S4I4reKo67MoaqJEUVtjt1FVyM4doFOaqH8megXnJF8YL+rVmb4qMA8hn81VddOQVQW+TjMdI9VPB5eynAyn8Vt1efV2ZO5IvbJpCm/fD+928FY48lk6ZUwA+OLQ0/qY/E38BpP90OlrcZuwx1MtQuWQydaFNs60ucmArwr4Hzqfc5osxJSypaTfJ8B8zKWl6SC2+OC1NJsJMtnwROX1Mi4XCbAnq6PNbXU93PRsygwH21DOrJxqYnUDScr+/1x2JjMciLl5RCBjupeaslamppX3M8EzybRMDtMCZ0/4gtilr/XO8nazwUavS9PoAc3S113rCZdueHfTLqNc5A4oPuxt+6yj7+89BPYBQsxyGml3kLHaHpmfM9KFl0jVdTB9XhD7iO4gZvg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM9PR08MB6737.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(36756003)(8936002)(4326008)(86362001)(66946007)(4744005)(508600001)(26005)(6512007)(6486002)(66476007)(66556008)(52116002)(6916009)(2616005)(186003)(38100700002)(38350700002)(2906002)(6506007)(5660300002)(316002)(8676002)(1076003)(83380400001)(6666004);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?PZRChlQ1o2kVZmH7JhHd7e43sdNt/toveSqpHC/L9Y7+KJ+ZODyKUVs2SO8k?=
 =?us-ascii?Q?z31jFgveGLWrrH//S02BdnydS+NxdqLGM8ApXr9dc/t23uNDO755/FKO3ydP?=
 =?us-ascii?Q?/5zelLr4PJw3ScQ0Duy87on37XRZaHXvbmugbaVKBEfdYhgqjgE0otKP/4xl?=
 =?us-ascii?Q?S6hG5XqnERXtMvM9UejPluwedXG/S5fHPjsDDguaJOKtDGmyDq8ytVwLH6C9?=
 =?us-ascii?Q?tLMw01cYU1EIJN2W5C7o/mrZvJDp4CvHgnRL2+zNdtkRB098paDwmEnC5k5X?=
 =?us-ascii?Q?DcaIZ8W1Bc5zG4PutUC2skTV66vQRgXLuQuZ1D+U7/0AnIk2ENMeKzrdFKNt?=
 =?us-ascii?Q?lbCfxfLXbc/BN9bgFhjru+GU7nD3qizGnk7shQu4lb9GsrdBM0StaF6MeiLV?=
 =?us-ascii?Q?OQPWNBHBm+78gpZVcfc6YqnbX5Xp30PP/8ZwClE862Iww0MuI74hucJFkL48?=
 =?us-ascii?Q?ZOr2izYMiF+X/0RENPBbGUySdWwWpnqS+mMdGd1Pz8N1GvyvxCxE2ZCu/Zay?=
 =?us-ascii?Q?9xqWF32A4yxZWysOsBap7VgT5twK4JHOzYvomQoB0P7UHnW9wy3H8DkaAIQ9?=
 =?us-ascii?Q?idpceo5JNGFnVB77hyZoIfmtplzcF+bOLpzI1gD5ZI+rTS5sVYM2BDYa/0H5?=
 =?us-ascii?Q?MwGK8VxX6DE31765DnD8ZCrcQhUTj72JDWlYabzNhpiDExq11Dnwc5u0TfTT?=
 =?us-ascii?Q?z/jn5l2pjW4HgqPmlISgzIPmtfWyS9WxOMohjwaDk/leyTfOYb/nf0xXVPi/?=
 =?us-ascii?Q?jpOnbghkQzi6dJx2TLYX1hjVPqGl/vp1UPNHDIN+PW1ESERAscAS5LjbXbHf?=
 =?us-ascii?Q?yZ2+n3GUJTUAK4aQenz7Y5qIObjLohEcrpo4grqfu0+bnXHnuvSjcCMpXD5x?=
 =?us-ascii?Q?EUir2Mi/PLLDuX/B1bZXScRMBy8r5nkcmnLieF4noiJyOetY8Qill8IWG4gt?=
 =?us-ascii?Q?lyt70FBdk+AZ0LgRtMElcAWZuJwuRJbtZFZ6V1YSceUCw+UNQ3V0z3xORYAM?=
 =?us-ascii?Q?+jddxiyxqZKcO7pA0vYbwHGJJKrRyCK5QroYxsfQKE0U1Ddu1VUa95PCeKt9?=
 =?us-ascii?Q?pdqhmX5H0IZoFKUgo1T6mbml0pPyjoh0YI+QxmPy/USuq0o+/8rpMGdGg0ep?=
 =?us-ascii?Q?Jxyd3SotZHukNoNneVUT6MfzRymtufAyo6hxLVu+0upA2suLgRUJrGgyCnCI?=
 =?us-ascii?Q?/Jkaeh1OyEBdnVIW3amjAxHWQ8ysjsqS7kcXLdhmBb5A78dPVziQJJktdzUO?=
 =?us-ascii?Q?rzawo0A/G4N/V/+bLkEFWwoDw+42658MZ5L+33WnZkYPoklRSuyjr9spE1q7?=
 =?us-ascii?Q?+Cf/CSuyj6iQy/97mlrBOuAmG7omD0n3cBaOWSr406Znm/j0fo+lT+tv+TQw?=
 =?us-ascii?Q?74eSQUbNn08xU+vrG/cygPqJ0UDTchO/NYw/mcrEdYOP+XXGwdMF2ivKRQ0j?=
 =?us-ascii?Q?RMEKL5QZra766MT8iL1IxXayr+YX71Y5XlPB1+S5XWKvj8gAvRLzzsrzKTgn?=
 =?us-ascii?Q?KhCzusyCVnag4BiNQBzXeSkmYzrDjV+XOEjohJag9p6Pf0J43WYRM6Qujx+C?=
 =?us-ascii?Q?DfRh7MAfFTanRvd7R1/ORHpYfuPJYL6vJ0KBbWRYjheeBM+Grg7voSxUw13H?=
 =?us-ascii?Q?+rNmol27756Ynosyw5haSi5XizPHmtIsbwM71CUFD4jvhdyeomVT2qfpkbgw?=
 =?us-ascii?Q?kmQKFA=3D=3D?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 50e57880-b57d-457e-f364-08d9d9f69a43
X-MS-Exchange-CrossTenant-AuthSource: AM9PR08MB6737.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jan 2022 20:19:02.4992 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: r73PcUJSsbccCouHM/ezmj9qdHlm/JLn1na48jKFPaWWkGxHagdBzqwlPgd7qALhu4Fj3hboSUQ5x1jp5iZnA4nJJHQUwDtipL7zA9Ppn2I=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR08MB2957
Received-SPF: pass client-ip=40.107.8.120;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR04-VI1-obe.outbound.protection.outlook.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_PASS=-0.001,
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi all!

This series aims to add trace points for each qmp command with help of
qapi code generator.

v3:
 - don't drop old trace events
 - make pair of qmp_enter_ and qmp_exit_ trace events
 - improve patch splitting
 - use term "trace events" constantly instead of "trace points"
 - add comment on subdir ordering to last commit

Vladimir Sementsov-Ogievskiy (3):
  scripts/qapi/gen.py: add .trace-events file for module
  scripts/qapi-gen.py: add --add-trace-events option
  meson: generate trace events for qmp commands

 meson.build              |  5 +++
 qapi/meson.build         |  9 +++-
 scripts/qapi/commands.py | 91 ++++++++++++++++++++++++++++++++++------
 scripts/qapi/gen.py      | 13 ++++--
 scripts/qapi/main.py     | 10 +++--
 trace/meson.build        | 11 +++--
 6 files changed, 116 insertions(+), 23 deletions(-)

-- 
2.31.1


