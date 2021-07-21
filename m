Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 415D83D0C82
	for <lists+qemu-devel@lfdr.de>; Wed, 21 Jul 2021 12:42:59 +0200 (CEST)
Received: from localhost ([::1]:37304 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m69go-0006cp-3e
	for lists+qemu-devel@lfdr.de; Wed, 21 Jul 2021 06:42:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48970)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1m697y-0008Sp-Pu; Wed, 21 Jul 2021 06:06:59 -0400
Received: from mail-vi1eur05on2135.outbound.protection.outlook.com
 ([40.107.21.135]:17760 helo=EUR05-VI1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1m697x-0002He-5r; Wed, 21 Jul 2021 06:06:58 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=U5iJrnsxJp/ajQwWAEcYktWRVEalrat0aFNYPG4V9VwLQSjsEzwDyACInzqkH8l0cRm8Ju5w+TZ4ItQAZBbRJJnfHvd2Hck8REhvst48KEODWUQfZKnpk38fAZdCubEjNbxoh/33/zKrKbxohUlIL2Y8ksrdfkTwGxzrAjYCA0mRuELNNxwoCZ/0MzSCWKyNZWlwy/XKnC0epPtzoB+NM/wScDAONywR/ZMjnhFl4fD/lRtslpOf8PpFGBwWKWv8KSHLKUfn5Cf0z9sYwsJ0uCXqZXaj42uf3mt/rdvtCXlYESZjK5Iiil5GMWbo0gsC3yC2L9hGvCq/YWnjC6g8+Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pm/DX8vEH9U0U4+GCtPJAxsZlteqTAW/fTB5aMXiQYE=;
 b=E5yrFTcHyj4m2InwZiZbVT9uhnmrS36wcxSGmP3uSbU2h57g2uIK6XP4fdrCYrNV+/wD4yZQNnD3QUUxglZlK446vySycpv74WeDMbCZepj2usFzThvoVWX/U1VlUNCY2tBxnV/vqjSF9CCMP/V0rkxzguTM/fcjOFaV0eJlaeiq0Rrds67rw0grHpPxogWbMx4L975sw97PiY0jd3Xsl4v6DflJzYa5of69YLRhf3vp4gSWaAxKbqmIys+Sj8qNgZtv+J9+0ZTbktYmsFtFKinXRXzGzAhpgw7aMquWSe8fvtd2h1ySaG9250YSRSIuHEYlOwBAiy8PSjh7LJbCuQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pm/DX8vEH9U0U4+GCtPJAxsZlteqTAW/fTB5aMXiQYE=;
 b=S4cm1YTatCfBNDRTgiYcZWAbJ26bx0jzcWkrJW27velecNFJeLx3ZJ/VV7Hu71s/dZnpt0jefCXOxaERGEHlus9zhyr8roqAKTAWIoWECd27pFEUA+jHZv1shvWxloR305tPNf7+L+50ZrXD731+BmFqL8u6gY5d+aX3KfzDnQc=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4331.25; Wed, 21 Jul
 2021 10:06:49 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::44b9:68ac:bdc7:e23c]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::44b9:68ac:bdc7:e23c%6]) with mapi id 15.20.4331.034; Wed, 21 Jul 2021
 10:06:49 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, armbru@redhat.com, eblake@redhat.com,
 crosa@redhat.com, ehabkost@redhat.com, berrange@redhat.com,
 pbonzini@redhat.com, vsementsov@virtuozzo.com, jsnow@redhat.com,
 mreitz@redhat.com, kwolf@redhat.com
Subject: [PATCH v6 28/33] iotests: move 222 to tests/image-fleecing
Date: Wed, 21 Jul 2021 13:05:50 +0300
Message-Id: <20210721100555.45594-29-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210721100555.45594-1-vsementsov@virtuozzo.com>
References: <20210721100555.45594-1-vsementsov@virtuozzo.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: HE1PR0701CA0068.eurprd07.prod.outlook.com
 (2603:10a6:3:64::12) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (185.215.60.211) by
 HE1PR0701CA0068.eurprd07.prod.outlook.com (2603:10a6:3:64::12) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4352.12 via Frontend Transport; Wed, 21 Jul 2021 10:06:48 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: a264240f-9b57-43cd-86f3-08d94c2f413c
X-MS-TrafficTypeDiagnostic: AM7PR08MB5494:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM7PR08MB5494DDD62A63F23ED647A8ABC1E39@AM7PR08MB5494.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:497;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: CeppxF50O3PTH7bZv4vKj09OJgx0QCniRaB+tkVfGMpmuAKyaYmK+jh/1+QEBD5CEkofp1FS8HF4O+roxW0TTTRJegFSBViyXoHQ2V4VYqr3KgewpxCMoOXFSMpcKsA5xGaB482VN/Fsx6C2iUz0KmInADLd55Kmn6EByZ3VwzVWwU6qwX5pWDKTtoKutr4Ai2Yp7SjuXDgEEbWzH2EAeSey7Ey9lxC7H66tOmhnT55mwtX7Og2SVxiQ/CJ5I7GpKj65dH4C7+OxSrm71k0uX8wIjVnRxA8oN8BTniHFWfsxAtrJU+C+C5bkGj+KI4aSdiPpMp1Wxc4AkVcFYYNr6AfCkCIkhP1paUIvBJ/jl9gAEimYjOwApfi2JlWCKiQ0fRfskBgH8xgnMT/f2bseiN3TDQNcYRJ26JJuvrQ6pNnGv20Ceol+c2qE5Ea+qowqu7kCOQVa7c6g4QdPfjgIAnvQG52H5hHZ04vYz0ey6Oc3MzFyyctqrId1mnlbuwuzobe16tW2DTEYK/ahSlX8tsZCaxKAl9yK+Vz+yzVEMvPsaDqzDZNBcJoXw0NAJTfzT0HjPhbTwssqdYl6UYgo8PTfb4YwJXtMUASyFt1ktJVpWZ+VsO37wup0RvI1ZVRtdtn2A0WWomTz7q2HCgWwmS0C5qp5wYCBhmIJQDtLGFrKes+wto079sboilWxgoym9FY7064HwBadx+FAFS2NQg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(39840400004)(376002)(366004)(346002)(396003)(136003)(4326008)(36756003)(186003)(8676002)(478600001)(6666004)(66946007)(86362001)(83380400001)(66476007)(7416002)(8936002)(66556008)(5660300002)(2616005)(956004)(26005)(4744005)(6916009)(52116002)(2906002)(316002)(6486002)(6512007)(6506007)(1076003)(38100700002)(38350700002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?5eEz/xfZMZ/kUdSx2qJ/3FWSdz9s0/lX5RWzRdzELf/e2q7hIMd+lFpKbNQ3?=
 =?us-ascii?Q?XggMQydq6UWRoAnAD54H12bu0iAHC72AP7NqrQLMPmIklfT5Z/mP0DFLzVpy?=
 =?us-ascii?Q?YSX+3q/En+80wSkkAMzyVv9s9QtHLthKpEBh/fjsmi6bQKL557M3mI7shJje?=
 =?us-ascii?Q?87XAk9OCU0clPDXNq74FQaEPjTKGj+sHkBL6uT7D4ai5VXLDg3fvRx26c6vW?=
 =?us-ascii?Q?Wb8RgeB9fnBw9hrU+k5t49if8K/vGqDTSMrhefba56M0PNgQkGC4tbOrKb8t?=
 =?us-ascii?Q?wwu4YbqIlTkRcPZRmCJv6Nhe8RE0h4NfaVAIYOKsns1bI+6GDT/ay+vnz02Q?=
 =?us-ascii?Q?0sO28ObxgAz0MW9fuiMK5wetwEolkAC++CdRjojOACu7fTPjn9R1eDYBRUUD?=
 =?us-ascii?Q?dX7d1AulzUsJIJpxi56Vy7OR2dwsByhDroh3HRVjQIsWfp+sabOXSCBY/Mmu?=
 =?us-ascii?Q?Ft1kk2Yo8VWfeCIADkNw6FyMe/lF31Gv6n1Op8jSLDLHwMMqft8mlilhHbNl?=
 =?us-ascii?Q?DK85X6EghxWYfuWfJZT7CxeL9MQ9QZb3VSdKRUvU4WAsbj822LbNufbcT5ky?=
 =?us-ascii?Q?TWhPEvdGqdCPAPnSxynKy28eFPX4iQxIKTAv67pXNh02czDv3mcDHx5x/Rhp?=
 =?us-ascii?Q?TK5LD9TWWDq820RJ/VU9Z6ngkUloLq1RZHttrLRDV8jWExyvCnpCWs3ELt13?=
 =?us-ascii?Q?9bc6NCDIO77kdkqV1/PVAqVbUElUCP7U1b6vcX8i4vynSWnWk4royeVtLSsR?=
 =?us-ascii?Q?VCku/8cIEOIrqVI/zamYehCNK1ccgQ0YZeSW/0AHhtIJpe/n05HFu+v/SSa0?=
 =?us-ascii?Q?DaMDWiedw6vW1LTtmtOh3nQt8U5VTZWvC1qPf92YNyUhTJsQl1t+/cewIVmc?=
 =?us-ascii?Q?9upWQvoY1d2gzFfzZ0gZvU6dSlOAUjlr4exerwOXLsSg0fYT/n5gLxmHfyiG?=
 =?us-ascii?Q?F74WQgMaO1yiiSr4kGWOpcogux7J65UEGQ4OXiKtTBxwWkqWdMsCGZaS550u?=
 =?us-ascii?Q?8fTdnHUbpuXEVbsO6UBK7uQM+XEu3lVlIGXtttcbnX5B9QRPaGJ5ffMKmyT/?=
 =?us-ascii?Q?wDT80ZxoBaZ6WxGO0HgrEUHei1Hnn4Ml3CAU123efYIV3afRSTYMeWisXKga?=
 =?us-ascii?Q?dhTc+3kPNMlnIihbKvwXVB5u5AB5slje9Oh4R2zIY43dZwbI2e6Q06IiuyGH?=
 =?us-ascii?Q?BB46MNcCJb9Nfal9sHUAnL0F4Co5aPFPz84JF9yu0NHbU0pYsdoqCZsQyFG4?=
 =?us-ascii?Q?aieIn8c5LtKVE0eunPuTE0bXe39zUjlGJWvvJFMskyNDZN9z16nCxk+1A1EN?=
 =?us-ascii?Q?84TFo8PDxL+5QeM3VmEmxTSt?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a264240f-9b57-43cd-86f3-08d94c2f413c
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jul 2021 10:06:49.2928 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: cMmbSW6hWV8ljB9agGQuEtElOvRe8ftLmxQkSrjQ1oEgTTT+ASbfaQBVle0ZmiuzPSEUqhjZtt7dUuxibO7lzSJ8lk/CHILViuE9M3CyynA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR08MB5494
Received-SPF: pass client-ip=40.107.21.135;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR05-VI1-obe.outbound.protection.outlook.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 MSGID_FROM_MTA_HEADER=0.001, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Give a good name to test file.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Reviewed-by: Max Reitz <mreitz@redhat.com>
---
 tests/qemu-iotests/{222 => tests/image-fleecing}         | 0
 tests/qemu-iotests/{222.out => tests/image-fleecing.out} | 0
 2 files changed, 0 insertions(+), 0 deletions(-)
 rename tests/qemu-iotests/{222 => tests/image-fleecing} (100%)
 rename tests/qemu-iotests/{222.out => tests/image-fleecing.out} (100%)

diff --git a/tests/qemu-iotests/222 b/tests/qemu-iotests/tests/image-fleecing
similarity index 100%
rename from tests/qemu-iotests/222
rename to tests/qemu-iotests/tests/image-fleecing
diff --git a/tests/qemu-iotests/222.out b/tests/qemu-iotests/tests/image-fleecing.out
similarity index 100%
rename from tests/qemu-iotests/222.out
rename to tests/qemu-iotests/tests/image-fleecing.out
-- 
2.29.2


