Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B5ABF1F51D4
	for <lists+qemu-devel@lfdr.de>; Wed, 10 Jun 2020 12:05:50 +0200 (CEST)
Received: from localhost ([::1]:53946 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jixcD-00013u-6b
	for lists+qemu-devel@lfdr.de; Wed, 10 Jun 2020 06:05:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54194)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1jixaV-0007wq-53; Wed, 10 Jun 2020 06:04:03 -0400
Received: from mail-eopbgr130125.outbound.protection.outlook.com
 ([40.107.13.125]:18851 helo=EUR01-HE1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1jixaS-0005wi-GT; Wed, 10 Jun 2020 06:04:01 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fmVRfkRHK2uUNMCPtNnEK4RMILCeVuooYwWm/cL5eupJUKnnDrDwPrqDkojXrPNYFJ2o4xdM6iBOT8v+xostMiiV/XIpNPr6TKkF3+WYyU+inmxbI4WEC6e4uILVHikSt+/XXIhVyb4/jXr05V2ssINxvkajpL18cyu+SbZMP51/25c7q4d3ALuQFKhWVVZ5oeyoXvSem7rhRwSAoV9Mfr0Y4CAB9duY6zd2PaPjjtjQQcmjJOPjt0iwvHsQX5QNdGK8NoxkVADHajRuHKiW5Km76T83+QFMnh55t1OeDAgsTJo1R+yJZydZIaxL5UoiGbsxN/VLzKyVTokwwxpsMA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZykUeyGiGvnBWtT1/BBJ56UwJ3CqoLT3e9zaeGNid/o=;
 b=P4XAFpskxlQOnzHOk6QG0fl/19ysf9sHCD39xlYY8TLL7kyxzKeDHRkizpB08Jm/uQr3efg/Uq9NQagAC0+LqDnppyIaEqIWENEMJfHE079s6RKE4fSO5RgP0cF6Xb4sF8sYeYxrXL/9kuUVJmP7QeKRDM48bHx/inD0UPnbsfj4wFc+vLNwafFtmE9WP2SOEl7ATLdOreFJ9LD/eorS+y1bC5GkAlW+tZeDf3QcyhGHvH2TFT4EFpYDnbpMrcQnayG9qKbG15uL0TDPc1/8zKTnbyt+XhIEOm/kxQYyMuSbwTYVeWBKdp6sKUzTVs2sCp5C5vhc0Pov4DFIHlv4wA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZykUeyGiGvnBWtT1/BBJ56UwJ3CqoLT3e9zaeGNid/o=;
 b=Nb5/FDNgc9m3OG1dLRttcTYNsg0099RCMMgDyuu2aYry+scEKIy2tQYgstkAdk/IVKpfhaMyVMyk4vApkrxSafBgrzUF0fM+2Etl7WpSaqi04C4VIzgMoyQBzzisyJ5vFKDEybqS92OlGq1GoZ72r8OGr4+pq3BOAz8t3D1bxGI=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM7PR08MB5525.eurprd08.prod.outlook.com (2603:10a6:20b:107::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3066.18; Wed, 10 Jun
 2020 10:03:56 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::a408:2f0f:bc6c:d312]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::a408:2f0f:bc6c:d312%3]) with mapi id 15.20.3066.023; Wed, 10 Jun 2020
 10:03:56 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Subject: [PATCH v7 0/7] coroutines: generate wrapper code
Date: Wed, 10 Jun 2020 13:03:29 +0300
Message-Id: <20200610100336.23451-1-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.21.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: AM0PR03CA0005.eurprd03.prod.outlook.com
 (2603:10a6:208:14::18) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (185.215.60.166) by
 AM0PR03CA0005.eurprd03.prod.outlook.com (2603:10a6:208:14::18) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3088.19 via Frontend Transport; Wed, 10 Jun 2020 10:03:55 +0000
X-Mailer: git-send-email 2.21.0
X-Originating-IP: [185.215.60.166]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 010a03fd-1c65-4d17-b60b-08d80d259623
X-MS-TrafficTypeDiagnostic: AM7PR08MB5525:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM7PR08MB5525C2478B8F6D662057F22AC1830@AM7PR08MB5525.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:785;
X-Forefront-PRVS: 0430FA5CB7
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: k62JjpZdTNQh/0kf511dwqyyBZuQ1rcakYYQkbL6azghaRnXYVnwQc9leQl5BWeWEaXgBFGTPrVmLRlAwiLu0HqLhntU3b9kwgf/X3G2gILzXyP70FKW4UDOqbV0JHiKKRWAAeWpS39OD036+cGd53DixTvE1iEJ03FFQtn7El6JORuQkw1gd+Dy16+SQShD6x0fRYVOpmEIvvWDRCivxRJ5C75z7j5E1ELb2nPQ8mnwDAoc0Nif5pY6rdOzE6Jjns2GJYtb1RYNjVCr1HhaQkvDL9I20+uN0nkNFOm6lPBpDTRxEzh+qW9uMkCbAGKnNhDDbOmC0N0er8iJn1/33AUYTYgXbgczSTyjtsSDZgsYmAL0r5RlJlIk3TxxD7DJ
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFTY:;
 SFS:(4636009)(39850400004)(346002)(136003)(366004)(376002)(396003)(478600001)(83380400001)(66556008)(66476007)(956004)(6666004)(316002)(5660300002)(6512007)(2616005)(36756003)(8936002)(107886003)(69590400007)(6916009)(6486002)(26005)(4326008)(66946007)(186003)(8676002)(6506007)(52116002)(1076003)(2906002)(86362001)(16526019);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: b6qBVN/oCLxUGri+/cBp9/ezVTsIGQGFDue37Rb2OFOEcZcjwjaHJADMQDcGuSYEwA+n6W+is1BlI0Ea0gfhWRouACAII3buOcL0cjs0wg4zqy0Rr2CXNi54+te62OF9hdAuI9CKJUC6RG18TZRcrEZgWQMwsCGe5zr32HOn7/OuSOnpSz/eXzrPWuzapwxgR+WZIcDB9bHpeftiWRIRHgNa9LtEVJQ9HASQs4VsvH+I0zoljUofBFX9QMwqz9CuuMyYRPqezBfCbCUuKjUHBjct5qqx2AmkGJYdtM5Bkp1k7JdwQOKY+YrjVB8dc2mN/FAgynyi6TJh+s73RonaB689a8nKEdOfvFOaeEPWGOfr/nDqnBDyBBNeOSemIzmF5bQ5lbS6jkQ//LYe2+/ftbUQSea7pDWQfaG6Hgae3Hji6URcRnqoRcGkLgVqRvt8tIvzxqhpdopuDDgilvUH2PiP2zlzeuIZyBYnxH4RPBsZZJyUhirBKxR0kId9uD0R
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 010a03fd-1c65-4d17-b60b-08d80d259623
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jun 2020 10:03:56.0273 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: g77abDxUgFOHWdlVovldqYc+BXk8rHhBWPzzqJqKRCT3nGl87WPFIKHIWIa8JxbagOrXlyiQbsjxG7f3Q9cm3annusf283JPq37eUoxuQVE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR08MB5525
Received-SPF: pass client-ip=40.107.13.125;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR01-HE1-obe.outbound.protection.outlook.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/06/10 06:03:57
X-ACL-Warn: Detected OS   = Windows NT kernel [generic] [fuzzy]
X-Spam_score_int: -37
X-Spam_score: -3.8
X-Spam_bar: ---
X-Spam_report: (-3.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 MSGID_FROM_MTA_HEADER=0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-1,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=_AUTOLEARN
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
Cc: fam@euphon.net, kwolf@redhat.com, vsementsov@virtuozzo.com,
 ehabkost@redhat.com, qemu-devel@nongnu.org, mreitz@redhat.com,
 stefanha@redhat.com, crosa@redhat.com, den@openvz.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi all!

The aim of the series is to reduce code-duplication and writing
parameters structure-packing by hand around coroutine function wrappers.

Benefits:
 - no code duplication
 - less indirection

v7: apply Eric's suggestions
02: fix grammar in commit msg, add Eric's r-b
04: - don't create separate header for generated_co_wrapper thing
    - inline aio_wait_kick() call
    - use json.dumps to make style for clang-format
05: - drop "#include "block/generated-co-wrapper.h" (since the header is removed)
    - add Eric's r-b

Vladimir Sementsov-Ogievskiy (7):
  block: return error-code from bdrv_invalidate_cache
  block/io: refactor coroutine wrappers
  block: declare some coroutine functions in block/coroutines.h
  scripts: add coroutine-wrapper.py
  block: generate coroutine-wrapper code
  block: drop bdrv_prwv
  block/io: refactor save/load vmstate

 Makefile                     |   8 +
 block/block-gen.h            |  49 +++++
 block/coroutines.h           |  65 +++++++
 include/block/block.h        |  31 ++--
 block.c                      |  97 ++--------
 block/io.c                   | 336 +++++------------------------------
 tests/test-bdrv-drain.c      |   2 +-
 block/Makefile.objs          |   1 +
 scripts/coroutine-wrapper.py | 180 +++++++++++++++++++
 9 files changed, 388 insertions(+), 381 deletions(-)
 create mode 100644 block/block-gen.h
 create mode 100644 block/coroutines.h
 create mode 100755 scripts/coroutine-wrapper.py

-- 
2.21.0


