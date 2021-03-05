Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C974732F23A
	for <lists+qemu-devel@lfdr.de>; Fri,  5 Mar 2021 19:15:36 +0100 (CET)
Received: from localhost ([::1]:44568 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lIEz9-0006Yy-QS
	for lists+qemu-devel@lfdr.de; Fri, 05 Mar 2021 13:15:35 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:42742)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lIEMO-0004RL-UM; Fri, 05 Mar 2021 12:35:32 -0500
Received: from mail-eopbgr30124.outbound.protection.outlook.com
 ([40.107.3.124]:32132 helo=EUR03-AM5-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lIEMJ-0005C4-JJ; Fri, 05 Mar 2021 12:35:31 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=aV+5y1qY3aBPlZkJ9rrMX82nXWWIMfBUKp2TyIvoBnoZSwYjg4Kfrg9NVHea0MCoEWG9DOp/jQn5+I9VL35I5rsC2F1EaUvblUVhqv2F5Ei9amoaRH3jvcx9hv2iYJCZK2n8hOuCYT6x5P7ituOM6kCAGFbpnUGZXXib2bRASoNX+3ZVygT1F9rFjXsN5tFNSXplJUFKHCQXp8WN3Lqb6huxBaAH3DXWTopayvo8HxjpkNSw3LAbeDFiNsFIqqFMwnirmlxjz6UQiq/l10Ii7ML66hMp2V49Ge+f91rrZDC/1NNbX0yyMVVG4P/bkf9m7BuRjax3i/n980lwNeguuA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Jb2TR/B7p/gYdnlEc/1XPf1n/auhf3bh2/00HFH17nc=;
 b=WKbgFZ/ec8bg3NxyZQ7IgBbDwRgZ9KJ52R9teX6lU00Y9kOXDBcXphYaxJ00vNvIPmWkHaFXmDsL0ST/BBnXXqaUbtf5Y/x61HZGu86UFucWaM4tIwbnfU9dTLEOFstaawjeGaSruRs9EmWQg0fht85waiJyncw//pG5vOMrr5MtP/pq7D7RgHuf8FMceQ7Q7ehiZ2cnP14pqmByJNTxz1V6KRayus276kIpPK0pdrZLkhjjfm5d/YwbZemc+MZRetdOBWO8RhS3UKwZB9aYunWUviQJS1LbKeJ0sv2X/3R26wORx0uEUBsz3d/mfluvEHUANpW/ZaAMSoFGzI5dmA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Jb2TR/B7p/gYdnlEc/1XPf1n/auhf3bh2/00HFH17nc=;
 b=RggacUcyUqF8hdfXALj9MoZrJ4t5xa+mvJSoS12eRNU/8tqGNV9EXyd76FDgnau2DUsoPwr/Unxs35jYKSwq30HqKeutmKoK19GbctZgxuNLFjzGUrMqbx4+KAYnCy0KfnFg25aDZxPq8GJdTFl7QTZpGGoKd53md+d9EKWbKZk=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM6PR08MB4408.eurprd08.prod.outlook.com (2603:10a6:20b:be::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3890.19; Fri, 5 Mar
 2021 17:35:23 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::f1f0:6610:11f5:5e4a]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::f1f0:6610:11f5:5e4a%8]) with mapi id 15.20.3912.024; Fri, 5 Mar 2021
 17:35:23 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, crosa@redhat.com, ehabkost@redhat.com,
 mreitz@redhat.com, kwolf@redhat.com, vsementsov@virtuozzo.com,
 jsnow@redhat.com
Subject: [PATCH v3 0/6] qcow2: compressed write cache
Date: Fri,  5 Mar 2021 20:35:01 +0300
Message-Id: <20210305173507.393137-1-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.29.2
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [185.215.60.202]
X-ClientProxiedBy: HE1PR02CA0119.eurprd02.prod.outlook.com
 (2603:10a6:7:29::48) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (185.215.60.202) by
 HE1PR02CA0119.eurprd02.prod.outlook.com (2603:10a6:7:29::48) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3912.17 via Frontend Transport; Fri, 5 Mar 2021 17:35:22 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 904c770e-338f-471f-200b-08d8dffd0e50
X-MS-TrafficTypeDiagnostic: AM6PR08MB4408:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM6PR08MB44087FF5D811A3722DC71DCCC1969@AM6PR08MB4408.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:935;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: EA9uCUfLk6EzixZayQvQvLMTiRD7W5XovLAh683Vz1BbZtADyT+VRVDYxJezUVybD5GFPOILZZDPfoBK2/bzn5r5ihRoHue2ExeJrfRZ0GFHjoZ4WosiPOh3I8ZLlEkHtF0fBb6wNIMV1tnCljQAjoig/gt9riLX+a+QnArN1dN0fysBqAumwjAFJPS5O+8vWUkl6EuBlxQjo3bWcsPEptBRyZlVU4OBkgzSh3CLIhXaWI8fVUUNXwQtqzIKOcPkmH8WTHH0DvrYUAsy4Q41DXYuKHCk8gZ1vEapXSBEHc2BCrZ/oQvXhkQAStyOrgOhYnc2Xvhjg2ua2XNeJyKmYKc6IDka/6wUZvSM8EfItnRJf6sM/Hnarn7QeP9PMnuYmU+T0UTBcNSNFeuPbgQtZ0M1ygz0izb7qBx/QZnb2BdFrNIurXstnfK9PVZ4p2O+7lPeKyQAyrF5pY6mf/TX9iJzJkNpL0xFrfHHKMWZBPQSYe3d4FNRIg6eKcVuIJv2lHDlwjfqohTc9QvWS7VTFxKonkjyE4g9AweKopaPOTm7aelN/niwx+UUa1qViq1G9A82IUCax0TWnKKeiIEqZA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(136003)(366004)(39850400004)(396003)(376002)(346002)(16526019)(66476007)(478600001)(186003)(8936002)(8676002)(6916009)(1076003)(956004)(6486002)(83380400001)(69590400012)(52116002)(26005)(6666004)(6506007)(2906002)(2616005)(4326008)(66556008)(316002)(6512007)(36756003)(66946007)(86362001)(5660300002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?X7dWaINvY4aH0ZdV5lQ5/Sl1qJveEreyn5FXVCUDMsEE5r3iClsHx/vF2ibL?=
 =?us-ascii?Q?2h6uFV+qd8FGzEBgUOkE2419BFRMCrL50n8aFx2AGw3D1b49pvIbE7hJ7OS+?=
 =?us-ascii?Q?2fgHHFFfNLHIbPY8sFthQ8TDQGUSFPkXBs+PmVOEoAxjAEFh7HAXA+38k6uz?=
 =?us-ascii?Q?s1tEgEL3QK1qwGGTjXCkPWBEHPbJM9SLBXofSKt312oc07nh7ldcVB+WJKwP?=
 =?us-ascii?Q?WyIM+/sjJEO/cqjTftNzKk7QrwvvUt1vmf3dQoWmPp8Oh5xwGOFl1VuJPh7C?=
 =?us-ascii?Q?w2jna5Dsrf3Jauhj9a3H5W1bU7L1qHLesczXZDwcKCs+hJ2xrmU74FrLHK56?=
 =?us-ascii?Q?jt2U8F+40m0HqcC1eK+HC8q45gfmTn8R2Eng/88FvWJTLvbVrm8v+u555p73?=
 =?us-ascii?Q?yP+lcKKqhpcOCQvJmLLZxA7r/OPg4psn7cYlhVtwAG6K2y8PfUxVAAMMkEOD?=
 =?us-ascii?Q?VvNMLeKwmfI8PhAwgx5Ex67zdkqYKErYPPZ6cAQcyZq5EExe6OOmW1A2zIii?=
 =?us-ascii?Q?o1xL65QuKvsVZ9ownwZOyIzUuQPZVaH9Z33XUzBLFkcNK7l3g6b2RIegZtgr?=
 =?us-ascii?Q?Sz9bDek2BjFdjL2iftT00k8wbu8gfFFK2sMOhPyzRiAxsV5rOx/NmOHK9b3C?=
 =?us-ascii?Q?S+h/0RzPF8JqCqtL6jZGWYc6K3Kb9/+qAqJbPYXlGTXDTFcWLEbRBmhDngNc?=
 =?us-ascii?Q?BXUP8d1y07qHTpy+EU4Z/qdIRAFtoixiBdjyuCQQWWa0nPWem94GiaB93laQ?=
 =?us-ascii?Q?EpafEqQ4GZv6q/hzambSMv87SP9LDkkAzafMN1BR79kfENaWxOrEMqSWB/tH?=
 =?us-ascii?Q?XHbpgRPX28il0ZO9ChbY9Uu+8vLQOvmTZar3XgdXLXNBtK30HkkqZS2iyl3L?=
 =?us-ascii?Q?4h6eNCptu0Q8Fl5w293bB68blpQPytQ/Y1MHtyHv6t6lP3a+2kG6+NCvPPf5?=
 =?us-ascii?Q?H3JxShRmN4dJcYM6M82xiQB5dP42bETlrKkGpqc/pLzMdix946xG6N0sYBf0?=
 =?us-ascii?Q?iqMaVeXyNGQC/5II+uyUm/rdtWAV1dJDi+f6Sydt4piNL6gRw2jhdziQLPr7?=
 =?us-ascii?Q?iRR1Nh9wUvcEQwkQ4P7MIWPIbWr2J7la9L9wYu2SNUAfDkckKDCrnlTTbuaH?=
 =?us-ascii?Q?bB3zh/43aiOF5I1dGwkmuTKwudaBsawLgTkLFq3MNUps+TNfvKisPm/Zmlud?=
 =?us-ascii?Q?sZrgVLCwjO++FWQdpkEPmMD27CxiODrY2/oZSH4nK5Eack5FTy15XVD6l7wz?=
 =?us-ascii?Q?g8SdmAJkt+RblziH4yF7M4jtrvvilBLsZ3M9svphj7zBzDjmFLkCE1LUtcYi?=
 =?us-ascii?Q?vkb7KhF2zCkuy9BolmcVPEkJ?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 904c770e-338f-471f-200b-08d8dffd0e50
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Mar 2021 17:35:23.4320 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: UTbTxPm92FOD5WoU07bLRNMtqFb3RgfAn01cbo+m/ONkqbHCQ7ieed+D3g7/xk3nMy3XDatFIvmx5bKxNVL6QTrzSsgRenfroMqdN+5a6U8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB4408
Received-SPF: pass client-ip=40.107.3.124;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR03-AM5-obe.outbound.protection.outlook.com
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

The series inherits "[PATCH 0/7] qcow2: compressed write cache"
(changed a lot, the cache is rewritten), and
"[PATCH v2(RFC) 0/3] qcow2: fix parallel rewrite and "
(the fix solution is taken from v1 instead, as the are problems with v2,
 described in cover letter)

Core changes in v3:

 - cache is rewritten and now is separated even from block-layer
 - I'm tired of trying to catch degradation when use both pagecache and
   my new cache.. So, I decided that using both caches is just a bad
   idea and in v3 cache is enabled only when qcow2 file child opened in
   O_DIRECT

Vladimir Sementsov-Ogievskiy (6):
  block-jobs: flush target at the end of .run()
  iotests: add qcow2-discard-during-rewrite
  block/qcow2: introduce inflight writes counters: fix discard
  util: implement seqcache
  block-coroutine-wrapper: allow non bdrv_ prefix
  block/qcow2: use seqcache for compressed writes

 block/coroutines.h                            |   3 +
 block/qcow2.h                                 |  13 +
 include/block/blockjob_int.h                  |  18 +
 include/qemu/seqcache.h                       |  42 ++
 block/backup.c                                |   8 +-
 block/commit.c                                |   2 +
 block/mirror.c                                |   2 +
 block/qcow2-refcount.c                        | 159 +++++++-
 block/qcow2.c                                 | 178 ++++++++-
 block/stream.c                                |   2 +
 blockjob.c                                    |  16 +
 util/seqcache.c                               | 361 ++++++++++++++++++
 MAINTAINERS                                   |   6 +
 scripts/block-coroutine-wrapper.py            |   7 +-
 .../tests/qcow2-discard-during-rewrite        |  72 ++++
 .../tests/qcow2-discard-during-rewrite.out    |  21 +
 util/meson.build                              |   1 +
 17 files changed, 893 insertions(+), 18 deletions(-)
 create mode 100644 include/qemu/seqcache.h
 create mode 100644 util/seqcache.c
 create mode 100755 tests/qemu-iotests/tests/qcow2-discard-during-rewrite
 create mode 100644 tests/qemu-iotests/tests/qcow2-discard-during-rewrite.out

-- 
2.29.2


