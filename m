Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CEF558FED0
	for <lists+qemu-devel@lfdr.de>; Thu, 11 Aug 2022 17:08:53 +0200 (CEST)
Received: from localhost ([::1]:48848 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oM9no-0003Oz-6p
	for lists+qemu-devel@lfdr.de; Thu, 11 Aug 2022 11:08:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37424)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alexander.ivanov@virtuozzo.com>)
 id 1oM9gJ-0002Y8-Qm; Thu, 11 Aug 2022 11:01:07 -0400
Received: from mail-eopbgr70098.outbound.protection.outlook.com
 ([40.107.7.98]:21646 helo=EUR04-HE1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alexander.ivanov@virtuozzo.com>)
 id 1oM9gC-0003aJ-Cv; Thu, 11 Aug 2022 11:01:07 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Ar9Bq6awdSZDKy0G3M39yX7eI3vxOHq/lLw9XzJrCvbP97ENVTduK0UfZkd4gFgKnh5VSj5kphsrM0bND+gwwjIAJEUvVcpb0mxJgvUrfagqoAWNQJ4scF9JEsfI22HNHCBQWa6qDlrtr3gislsiiRI7KK/wsxL3O/TUjvpGg42Vi0CHfXGpCfRVYUbgkDqhRGGcreoAiLNafgOxnlNnFVrJN9PB9sX4cltOjIR2exgYSOML0vPvRI90/qECB944/7Jn+5vGqDtV0f3+l/64autUjlbguQaOdCZegDddJnzNBCY8PozrblMtQgY6GgON7MMzhpJHja+xyODH2CUT1w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=X7+pvL58+EbFL/1W3MLOb0ORkY039uxoB6meTmf1IJg=;
 b=V35gdS+x258Uxjr4hvMH24tMCCADlJs2PaB2CKxQTVHvA2Lwv2JrDTJVz+QD4sXiIa1Vr/itdIoZF1Rz90MhPp6u8q6L3/yizNSok0gH2M0GlYirB652YPmhWLzZqcPDCABOAt6XUUg8BBVpTrtwWHF32E8AlpRCPK8zXiOWJKC1bf1YPJmdBdjKnlOmzvgM8eznFszeuBW4RWQyuV3yzb6tXt5C/zsg9UGZ0mUL/So33o4Jh4hPh2UwophQbRs5Tcuf8IoJydS2JtNyWzQFJKaGZxxRd7+kJTIVXSOsjW9F5blWz10l23/TevMuga/oi6WLHyfPpdRez2utLjohqQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=X7+pvL58+EbFL/1W3MLOb0ORkY039uxoB6meTmf1IJg=;
 b=lu4RfqfuHAFCxT9gzYQStAeeoYsTWYVkRVE58vpoaIgVmn8fqpO/cKbXKJnWygFtRQF4YEPnyFYNs3nnC+dLj9+trrYW8EJfJPYDlm5zJXZ6xGLzTfa4WoDFURiqdooKQElbNnZL2INSfk9xyYgDhf/QSZY0UweDQQFPpasEJzPP9vJdVMKIeuMDXGqfozHcqcs9nMCUZMrq21vN7SSDhHFYQf6lZCfrCxR2pAndLWMKr0QFbgWPlbcA0wTH9EUgyFfwWph/dPom0e2w12pP9IinW/4QbzY1yWJsaoPQ3dsvDiaByXnufJszhsWTgWcuRQyOYKhs9QywUigApnDaAw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=virtuozzo.com;
Received: from AS8PR08MB7095.eurprd08.prod.outlook.com (2603:10a6:20b:402::11)
 by AS8PR08MB8659.eurprd08.prod.outlook.com (2603:10a6:20b:563::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5504.14; Thu, 11 Aug
 2022 15:00:54 +0000
Received: from AS8PR08MB7095.eurprd08.prod.outlook.com
 ([fe80::7da2:4a5a:2854:26f2]) by AS8PR08MB7095.eurprd08.prod.outlook.com
 ([fe80::7da2:4a5a:2854:26f2%6]) with mapi id 15.20.5504.021; Thu, 11 Aug 2022
 15:00:54 +0000
From: Alexander Ivanov <alexander.ivanov@virtuozzo.com>
To: qemu-devel@nongnu.org
Cc: qemu-block@nongnu.org, den@virtuozzo.com, stefanha@redhat.com,
 vsementsov@yandex-team.ru, kwolf@redhat.com, hreitz@redhat.com
Subject: [PATCH v2 0/8] parallels: Refactor the code of images checks and fix
 a bug
Date: Thu, 11 Aug 2022 17:00:36 +0200
Message-Id: <20220811150044.1704013-1-alexander.ivanov@virtuozzo.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: FR3P281CA0145.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:95::8) To AS8PR08MB7095.eurprd08.prod.outlook.com
 (2603:10a6:20b:402::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 86396ea6-e5c5-4a09-0967-08da7baa49ea
X-MS-TrafficTypeDiagnostic: AS8PR08MB8659:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: SV2/b+o/Kb1jXsnSeEAEp+7ovSqNPb3mcqXvumIOlCUFOvnHgrfJfvdiXswAuMFR/QAu0TS5wWWozuETN3M2wb/lwkmuEz/LoOdytYUot37KeFhPn4xfo8DI0p5fuo9fOIFMyq9LYl+mM+mt2XU+TaS+gLERf8B976vQhC/5MP/rnybwE9quwp85v4wk0uUVokvAC5tMfuT43aJT2F7/i61op4BsiUjTtP3qZGkbQTLysVEnf4Q4uZXjRYA8BeZw20DbCdjfXfIYC/34GFtR4KMwPR7Xe516XcaZHNdpproJ+6bYSLbq+pjmtRySHLlz7/GGBYtnUxikTBdouDuuopja9TYF1Q6kgMKfos5Isfq+TlzHXLMutb27+USCS6+xBmSCZOFhEAKY+T13ejlDQdN3VY4oU2iLc6WPTvRL7AsJfU75k8dCWfBm5H2HhcpJQ9u/oTRdCPwZsLhghkPFv6NLftaq3EsfcKan5YxVDg/Jr+1xdbf6CR1zXzmw+gr14RRHi8wrMrOS7l0AO93Y8kBB4UvZe8sl/EnLBEjyWD6r+E1JUED0KgthwwtdNSl4dVDBcLI54gTeRR87U/NhIfb+hOIfoHNvLzYzPquA9unNdKYRLp4Ce2Of76OXqqcCmdZICSTxIGryAW78ihCLpxPRhbq6UYKsH1PTl9ssrx8qZrXqCuryRk4lDJYN6BlOrmXCl9F4S5Ra/nbPRXcLrheZglA+sU1P13lHD9vaMzEv5Ye3dmg5fjmcQCwqAOjNpAWIDKL4+K7rtOSfNgW78KvS1a5VjYN4Xc6OOVBppKo=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AS8PR08MB7095.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(4636009)(376002)(366004)(39850400004)(396003)(346002)(136003)(52116002)(4326008)(26005)(6666004)(41300700001)(6512007)(66946007)(6506007)(83380400001)(38100700002)(66476007)(8676002)(6486002)(186003)(316002)(6916009)(86362001)(44832011)(1076003)(4744005)(2906002)(66556008)(2616005)(478600001)(36756003)(38350700002)(8936002)(5660300002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?EcpF553uZmXk2M0KWJRSHzQ86kThcH0GAKLHpJockcuivx8gAuu2v7JoIKSC?=
 =?us-ascii?Q?4reyBaG3GdU0ie6R/iOlHmDhFeTrR8rqHjm0EKseig36IguFdeZ/uU8B/CHI?=
 =?us-ascii?Q?EbRb0ME7v7zDZI92vpUW2GBYRtX/Ys919QNWRRiWxqkOyJUhbdqV2vZ65E0T?=
 =?us-ascii?Q?dcEWt4dvoha/enOg7SKv4Kz+wE0hskszaIfnrRVaHiR7nT1SSO4akhpdhhZ+?=
 =?us-ascii?Q?UIaTdrq/uhgXC5eedMKoUibREhQtIN5LkD33kQz6g52K4OlRlV0jvZ6KtOT5?=
 =?us-ascii?Q?ZZaA0+FhXTMFZ5+K47FfgEZTt0WS9SaP2U+AqdXqwtydIOTXxtm7ODNfNjGf?=
 =?us-ascii?Q?g5TZ6nuwMCJ+se/lVjRWJwCzpl/UZOtXG9TegjVjrmxTcR4plSepRvXUixrV?=
 =?us-ascii?Q?pHDk2JXBMhO6GNeAp9G/+Syl8kXL337oHE2yj/kVkFy3Evr5MWeIhdpO10bJ?=
 =?us-ascii?Q?gPEjvg+9Nk9WARooaqZxo+LuMuK+8KSTqPh9fiY72U+Lg8U5WXYWUZdPoSEi?=
 =?us-ascii?Q?NASb9CbjeY32V8DuhqLGCCIfVISIkLi+faVv60Mbw1aSmj047kE5025oGzOd?=
 =?us-ascii?Q?rlUnF+JI5ekYWIW1Ka2ARQ6c7ZApDRV9LJx/52ANYZuAdW4wOzLoz8gD3NwV?=
 =?us-ascii?Q?bxhlGcB5Kv0bjEYWsKQoMRRD0qSjuqKz4r3R1EOVSUYJMIB8P7JhrbB63pBf?=
 =?us-ascii?Q?J6FOSCbRSs4mftEVYIYP04cvBMu/K++qsInX5enTwrX+GRPDd7z/8ZM8XEGX?=
 =?us-ascii?Q?sjUZRDnjpADadR4c3OIASrds6f/FJU9v0nlVIsrai72aGNLA8MD0wckUD1gr?=
 =?us-ascii?Q?eIZFA6dV8xUWkDJO13IWYprc9ehxdKKZwg8IyZeIBnebpTcC5HvW7Na5FtAG?=
 =?us-ascii?Q?sLBVTM2OGxAelsc0x86dHuAU7VKnfm8QkAJG/i5oJw+eNW+2xNRa5nHERoFu?=
 =?us-ascii?Q?ox61hEiLP9j+Ys/gHBD023MJ2QZ4D7dRT1cTSl9Dvb6kYHsVSiL09+toU1D7?=
 =?us-ascii?Q?mI3bNtmHzX8BVnHPy5aZkIZwjKrxDVIoTBR+k3A++6POLKVBHHKlyfnNURJb?=
 =?us-ascii?Q?zrgx9DX6m3vRRubdYpy3KUOEHaSLibgNatLxqe4PFq6bf5c+MP3nZe5lX3Xs?=
 =?us-ascii?Q?/fx1fABSmgQhEyKAAYupqaMi23VRXf0KaRBjUj8bP63OxX0xkQUTM8AoYifv?=
 =?us-ascii?Q?ZO1DH1pYwCQzuEbWNcGuRIWN0kxAj9NkX88VG2pnF+kiWeijs9Ua4myeWd6d?=
 =?us-ascii?Q?u0LFRg6EHaRofwnNRhBmugcE6SVbyVGhVxfGwUa/QJOlYRUUhH3gJsuh/R18?=
 =?us-ascii?Q?i+1tlDEJRfMEcci9sDo1BreKQd4WPh6zM9mQy7J78bScAYBkHDEdJkzygVv/?=
 =?us-ascii?Q?KtXCQh09ESKnYOdo+5pz66I9ZTkcdggMiNbhK7fBE5EvytdHzphvZdYQkA57?=
 =?us-ascii?Q?R90cL/oGm/UOG9FN8h6I/Rnj6B8aLYVZtqt51O9sSJWuL1HkHH19xwdiGsjI?=
 =?us-ascii?Q?vT+sXdaX2jFt+/TdIrfcL3LxD7LuJunT0YulnNUat3PmvHwLD3O/7TmMfapT?=
 =?us-ascii?Q?q12cNgBnpdr2hsAyonu+oyzMos7Hotcf0Sn1rhzN/VPiG1k33Ph4j9DVI3Z0?=
 =?us-ascii?Q?L7uki6pLvub3FJUBaUdHZas=3D?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 86396ea6-e5c5-4a09-0967-08da7baa49ea
X-MS-Exchange-CrossTenant-AuthSource: AS8PR08MB7095.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Aug 2022 15:00:54.2952 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8Ndu39nqpL/i7xOzF/MNlRwSCh+eim9lFAwtL5c71o2siDgvhhnON/eC3D/NYve0q9P7vsxMmjwEUf2XLO6vcuGjpAgmAslt5OSJbwVIeXY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB8659
Received-SPF: pass client-ip=40.107.7.98;
 envelope-from=alexander.ivanov@virtuozzo.com;
 helo=EUR04-HE1-obe.outbound.protection.outlook.com
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

Fix image inflation when offset in BAT is out of image.

Replace whole BAT syncing by flushing only dirty blocks.

Move all the checks outside the main check function in
separate functions

Use WITH_QEMU_LOCK_GUARD for more clean code.

Alexander Ivanov (8):
  parallels: Out of image offset in BAT leads to image inflation
  parallels: Move BAT entry setting to a separate function
  parallels: Replace bdrv_co_pwrite_sync by bdrv_co_flush for BAT
    flushing
  parallels: Move check of unclean image to a separate function
  parallels: Move check of cluster outside image to a separate function
  parallels: Move check of leaks to a separate function
  parallels: Move statistic collection to a separate function
  parallels: Replace qemu_co_mutex_lock by WITH_QEMU_LOCK_GUARD

 block/parallels.c | 188 ++++++++++++++++++++++++++++++++--------------
 1 file changed, 132 insertions(+), 56 deletions(-)

-- 
2.34.1


