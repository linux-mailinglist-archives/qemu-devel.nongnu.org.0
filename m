Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7894C5AAAD5
	for <lists+qemu-devel@lfdr.de>; Fri,  2 Sep 2022 11:04:44 +0200 (CEST)
Received: from localhost ([::1]:50784 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oU2bR-0008Nb-4r
	for lists+qemu-devel@lfdr.de; Fri, 02 Sep 2022 05:04:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40092)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alexander.ivanov@virtuozzo.com>)
 id 1oU2QT-0000J8-BG; Fri, 02 Sep 2022 04:53:23 -0400
Received: from mail-am7eur03on2138.outbound.protection.outlook.com
 ([40.107.105.138]:50657 helo=EUR03-AM7-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alexander.ivanov@virtuozzo.com>)
 id 1oU2QP-0006R5-Vb; Fri, 02 Sep 2022 04:53:19 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=eGLOkoeo6vmYDREMHvssKfkgyl/DCJdZvCr0D2CrdCmlB2SQe0r6HGWZygZoZPrGBRxZzkxKGcrfQ/CE0dj068i44uXdP9Jrd94sMfplzKgBMnw26r4epU4ASDVKlIPiHDiCt7vlFVXlNYbdc+2+2BBnbl9UsqF/40Y53Ws7CKpzxan8BjM8JAdnqutUjPwNzzrFNBRtSNnJ4geqHBiUit3SPjLb74gOkaelq4yBiYLyoRTgg2Si4eRMuUPn+By0iMDGTVQ+BfcEJZ3lBbqgKvuJ01McXPoIm2+eI14dTtk30ramvdkbog1f5EdZKnXGd8eZjdwJP7ICkw46rF32Lw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PsYERvTJUSmz9smYQdxnKoXJ6zezQRsY8vbAUxAvsf8=;
 b=nEizg/rXsWPcgGV/JVg8O43aHwLbITgSMXbZ4uyC9tItQdiCzoISXT+qsltG+cvy5xHbVQRcQpM2dvUThwUl8F6N/yqvd14CKkXthY/sZ+PPw1nyL4NijNk+kzAhHIsU+Gzi+NK8ECbKZN9zBzOKf2Sln7ccbUKDmifmtbSRWKq7Gil10BSBvjD7AGlc3hkasu0N8Va+/RPEJqv02QMJ0ekwtkqYBqP0o45v3dsUY6f/TAsI7Q9Wrny/GrMCgCAEfYA5Xinp8WGgpNgKj1M1L5WlFdvu+WW8P0+n/YgKupnenZdhoKgxKVb/4FNe2Xp9qqEyvNq1siqT4nQ9p/BTIQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PsYERvTJUSmz9smYQdxnKoXJ6zezQRsY8vbAUxAvsf8=;
 b=fIGQ91UvWGMMSHJma9g9oYBmooee+bfK4wqAMcsX4IXDLns5Xd9tT43YztQJwde13ZfKDaqDv7FOvRvbDaq7a/TqJ8RE6qCp+c8eVYu50r+6F4WqyZKNjW5Vfktj7pYk6PU1cR8hnYSi6Bsxw7mZ3j2RDO5eEZRVkVO0UEcGsjGa5uCONqn13vThL0lLTeHxrvOm6UaeLPqwWIaJKi2iRGpeRWUm9PKiRHEys4SVMWj5d+7mgXU608uHLQRhsPuTsJxRzyFi+DwKlQ/Auwl8hDwE0P6gMJGoPW8mmGtKp0n18gFooSSeNYRwBdn/lzxINShoMa0ia6knaZeJMSFZtA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=virtuozzo.com;
Received: from AS8PR08MB7095.eurprd08.prod.outlook.com (2603:10a6:20b:402::11)
 by AM8PR08MB5619.eurprd08.prod.outlook.com (2603:10a6:20b:1d8::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5588.10; Fri, 2 Sep
 2022 08:53:08 +0000
Received: from AS8PR08MB7095.eurprd08.prod.outlook.com
 ([fe80::5174:25c7:6df8:741b]) by AS8PR08MB7095.eurprd08.prod.outlook.com
 ([fe80::5174:25c7:6df8:741b%8]) with mapi id 15.20.5588.014; Fri, 2 Sep 2022
 08:53:08 +0000
From: Alexander Ivanov <alexander.ivanov@virtuozzo.com>
To: qemu-devel@nongnu.org
Cc: qemu-block@nongnu.org, den@virtuozzo.com, stefanha@redhat.com,
 vsementsov@yandex-team.ru, kwolf@redhat.com, hreitz@redhat.com
Subject: [PATCH 0/6] parallels: Add duplication check, repair at open, fix bugs
Date: Fri,  2 Sep 2022 10:52:54 +0200
Message-Id: <20220902085300.508078-1-alexander.ivanov@virtuozzo.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: FR3P281CA0120.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a3::18) To AS8PR08MB7095.eurprd08.prod.outlook.com
 (2603:10a6:20b:402::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: ec1035d3-9183-4521-687a-08da8cc08eb0
X-MS-TrafficTypeDiagnostic: AM8PR08MB5619:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 56l7LVgz9+aG1FOls800Ii3DKheSa4lsAiphyFlZHH6SehqM/GTr6O+hHsUiyHPbe7hBXnI2zImSmT3OHU+vaB2TipH85m8Oy8Q/ZP5x2uF65Jmg5SHM2vC8SJtnOBkHGoKsN3F1XlCRM/WqjIL6pqUnlFM+4uouy7iEUkja2vQ2yjEVW6VNfv5bAwWRt5KhA0T9ExDP0KVTsXgfeixWVTc+yTNk4d+GwUCPs/Sc5Jycyjq4oufy9iRv9LPL2CPwq+n978lS3AWCDU3G12AwRg5CQY3DKlX1HjH71EKTJv9P1Drq9zlCmiZI/XVqiVFUxooFmaaGRaGOMOmD6HBIKn0IdzGlYBw7a2LrjJNlccgFA5eErH2q48jbWIfz3ipMxqidRieNSuesjH1axL8HhHm2d9WlOkQODDOjM94J4QrFmFdtQ4xIQQECZWOcxJqKW6/i4MiLhy9x70UYYYz1gJwlu7bhwTbYAMniF4HQFQKAeeguN4j592wx1ynWHBRUVPLhIIR+VCHFveSPEctLIfSF3YDqiIZGLPm3wfamMcWeYvkZP7/9cL+ri9x6BhUE6s196Mcyb6JtZUwjhwVi4I+JrDWe1kpyYfnQg031XGBUELrnd6HSlIar6XtNDzybXZSCSJNycEHgSZR75iLWpjs0N4RZsBHgijYLPWKMHwZM9vYp5yOip9kejgmA8Rr0JBWivK1na6qc45LWlKCVM3Q6dCr7qkTSQAS4dCDf4F4dQEj2dRSOJkXK01c/ch3WBxQioIkFev9s323HIrhx6g==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AS8PR08MB7095.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(4636009)(346002)(396003)(376002)(136003)(366004)(39850400004)(8936002)(6916009)(8676002)(86362001)(66556008)(66476007)(4326008)(66946007)(316002)(6512007)(26005)(2616005)(83380400001)(1076003)(186003)(478600001)(966005)(6486002)(6506007)(52116002)(6666004)(38350700002)(41300700001)(38100700002)(36756003)(4744005)(44832011)(2906002)(5660300002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?B8zWvHgPPLJRKA8a12FbAknO5YVVBqVR1fLWeCcrwTT2O4ziMgts5xTTGyTb?=
 =?us-ascii?Q?yuRJHXjyxYc3DEMJPSvFpU7rvdRw990wNKHrYelNn/A7PW3TeV0DwbOKVyGf?=
 =?us-ascii?Q?PupuSL6QBEGk0tuVMep95KG4YnwwnWwGBaZJ6ZVgKtQUu7q2GYVOjvL64BeL?=
 =?us-ascii?Q?uqrMa3xbEW60bEg/Gus71HiR2AwH0h72/qufI5nxOvb7oDT+Pog8hKqNJ8oE?=
 =?us-ascii?Q?Znb8oICwwp+W93e/JgMF6wPN38vUf7BQ5qud5+Yz0v+XXStMEtmxZB4KUa/3?=
 =?us-ascii?Q?RaesWbH/RODAb4KRf3pBl3ZonfiwtQsPklf+sMnFWgsAViUfz+ifYb92+C1l?=
 =?us-ascii?Q?THh8LQMWvmK14fmKIA2CcZjU4oJciDsMNkJN7xZ5PFuUwb6EW4GdihOOV0mz?=
 =?us-ascii?Q?uR/g9ENY6lYAes2jGfuU2LpJzxu2J62QRuS1dGTtTXLlTiPuW9gGE9dljwpi?=
 =?us-ascii?Q?RG1wRFqi5HrePqnYBK9B+m5tv7oZXyUATxiJPAiGAZkFCd35eU7NMNrIfUmx?=
 =?us-ascii?Q?GZBO5ty7dXZDYp5w13yAAcc9hlGiIH8dR64R+Wh9/fGdxolO9mwlUyKZXbPm?=
 =?us-ascii?Q?G5OkkDU8xzVSXYH4Ya8EUnVkTr6fym1KY/9CZzbnJYwT5dn6g1gD8H4fIy1s?=
 =?us-ascii?Q?73UIir/i8bnPDBrDhwpbfm2V6pdy2S+UK0aeHa4yKz7Fhx5/6Gxc4MZsl71I?=
 =?us-ascii?Q?l9TjkOwx8GT0xuJNDyZHOcvxUoPiqrClwYFJzgE+AUenbeZRWQbfZbbbVJXJ?=
 =?us-ascii?Q?AFZwKDTv77z4eL2Hq62pC9cuQy+qe/L7uRAHR/d5cN8r5q1iI5UaXo4BDWsF?=
 =?us-ascii?Q?1zVapOa36+PRYUJPX6PLcHcs5NggV0alcZ3zdPPop1K38JGplSRALnILaH10?=
 =?us-ascii?Q?pNl5NUCB2TKif9S+lFbzqCWwkyMvYIBMODrhUum6FZUR4dEoJcAaomIfSfw1?=
 =?us-ascii?Q?h+QcLkyNupyDb1IpzvBqWZ4+d0nStiqzrv0SVYjH70LDhs0u0bWOV763mpcB?=
 =?us-ascii?Q?5CgIltygML7quEmtVY6Yd1jdRX2hJonYx2ihjuG829jVZKyxlNSEVebFrTbZ?=
 =?us-ascii?Q?14AWyjcWpEGqTXX/rrgo84OaK+f1g6sUOtXPrfVjmGbNwC5JPCP3sxT2pNzZ?=
 =?us-ascii?Q?0UkiJ0ECrraeKzY3WrljR01lQyXvEfH5QSv2nXmaKfKshxwaRiyfxEGmPmZ5?=
 =?us-ascii?Q?cXyTCpiyimnTma3kcbNw2lnuSj+JUxnUuN053Oij03m0aO2zKTtukAG1NZrg?=
 =?us-ascii?Q?EnizhviLfkhK+Lu6+TccKBLDWHq6J/8Ef1INGVpyAvASviu/9g93Oj7b/boG?=
 =?us-ascii?Q?B5hL8ZnPxQN+n/6er4r0z8mkGaUkEDX/zDZzb5QDTJjF2oIt7f1ST099RFha?=
 =?us-ascii?Q?FnNzoX3p4/CiEoAUI6eJGhmo1anKR+qRs7Jz31kqiO591YUaCPC8x2mv/Koe?=
 =?us-ascii?Q?KLmJQDd3tTCK/QkBkV6J2nH9VLVszkSryPpfRl2es73SUCfusGa4aQmJ3I6j?=
 =?us-ascii?Q?BdCcoYFmEICnb7EhFWUkqcmYsaMce0F/KAoZRI4cHdNYNX+9+vHmLjgm3qy/?=
 =?us-ascii?Q?ZsL4VN9poMU48Hf8bzkZ63tZglajEMnmTJkvEw3ksS3NTTjVIU+XDc6aVxVr?=
 =?us-ascii?Q?h8OFFqfm5CJKvAeavIUqPAI=3D?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ec1035d3-9183-4521-687a-08da8cc08eb0
X-MS-Exchange-CrossTenant-AuthSource: AS8PR08MB7095.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Sep 2022 08:53:08.3287 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: oT9i5xZRMf1jyxdzzNPPfhCGs390071GBm4LjloWtlNkMa9kqM7vHupBPkb7nxjE3tDbwdqP3HysJ3RXaY+pdM2F/uEng6sncFrjG3sCd/Q=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR08MB5619
Received-SPF: pass client-ip=40.107.105.138;
 envelope-from=alexander.ivanov@virtuozzo.com;
 helo=EUR03-AM7-obe.outbound.protection.outlook.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_PASS=-0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

This patchset is based on
git: https://src.openvz.org/~den/qemu.git parallels

Fix incorrect data end calculation in parallels_open().

Add parallels_handle_leak() and highest_offset() helpers.

Add checking and repairing duplicate offsets in BAT.

Deduplicate highest offset calculation.

Replace fprintf() by qemu_log().

Add check and repair to parallels_open().


Alexander Ivanov (6):
  parallels: Incorrect data end calculation in parallels_open()
  parallels: Create parallels_handle_leak() to truncate excess clusters
  parallels: Add checking and repairing duplicate offsets in BAT
  parallels: Use highest_offset() helper in leak check
  parallels: Replace fprintf by qemu_log
  parallels: Image repairing in parallels_open()

 block/parallels.c | 297 +++++++++++++++++++++++++++++++++++++---------
 1 file changed, 241 insertions(+), 56 deletions(-)

-- 
2.34.1


