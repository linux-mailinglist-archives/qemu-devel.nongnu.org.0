Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id ADB785A13D3
	for <lists+qemu-devel@lfdr.de>; Thu, 25 Aug 2022 16:38:10 +0200 (CEST)
Received: from localhost ([::1]:59530 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oRDzl-0006sj-8I
	for lists+qemu-devel@lfdr.de; Thu, 25 Aug 2022 10:38:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58388)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alexander.ivanov@virtuozzo.com>)
 id 1oRDtP-0000Wg-Fg; Thu, 25 Aug 2022 10:31:39 -0400
Received: from mail-vi1eur05on2096.outbound.protection.outlook.com
 ([40.107.21.96]:43230 helo=EUR05-VI1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alexander.ivanov@virtuozzo.com>)
 id 1oRDtL-0004oG-Bm; Thu, 25 Aug 2022 10:31:34 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mROkpIbfDrdEZLCxPz69wCAMJFxSi4ZfemgHIlLAGQqLA779cguaPpb47SUWAQ1JvycnbtAlM3GRqPH+EPd+zNM5N1H3b0kKVmxZKc4LtvGWuPg0lNupBf/0dPNheB2GPDvu97Dk59yiMais4RDTNzKhkMyG9MMm44dlQNnUJGWhHuHZm7PqEba1bh2drmsMWc3b+2g33RMxvpWho0hh2h9sfl8SWf0FzDiMVH3JAqQk453WzZcIZJ+nZtLoI/ylC0E7Q8/EL2zoQ3H6QVPj0NSX0ljynw8v/R4v8vWej+AAasTJSmV8AwCTykWDlINUWUw2w2lsoV3yHAyTZ3jp9w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hXiZWYH4GQKj+agxiL4jJy3UmL+cscbUpVNuzQWcsJs=;
 b=hkBrIGyQt8Zo1/u5VFqqifrclvcqW1DUbJYg0XTV4bsYuuRGAlVJhxWLXYbCStAaEeiS8vuKY+nehV7bSXkYH/Oj6ufahwVXTS6+O+DIKkkZvM86KsFfq2OaWQfdFZ3pecRGlEeWRm4Rvq+zBqOjMbEZS6xzJMQh2n//TdX6Kit5ijQkI40w+m1dChBBa847NZRaGMiYJeUws4mKhHGWmn2n4SFjikpmypR2MxcP687i1IoNwsvyRmmC0zoOjznec5MMDgQFZZuS2BciZOs75TAdt9LO8E6dsbucoBKqhbxfJuiWWPbpm83Wccl5QzPLvx6BRD9RALjJaNH2U07WpA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hXiZWYH4GQKj+agxiL4jJy3UmL+cscbUpVNuzQWcsJs=;
 b=XlGuRdLYUPhS0JcuL4xkPQ72PMU+1kgnjr4r875YvxyEAz+nuns0/OpeqNyxKfyCbRu4aatXk2PAD+SavrCd96i9MJDKRFBroKctEZ4NFs+ToYWjKoLx6begldXcQw+11MR2RYT5jiWUevxGH0HqI2ZJGMFJH2iWIKCT0x8RKc7B7qZpVSF4Sdc1byS3B4oYyLjNhdERVz65UpwF6HbnZk6+tI2RaB2IGL3I2NVUavtrnYyyIIyNm14hib7/avmG4T3VyCtu7rTeAk4UGDc/IyUblFzlZGZL1IxFN9/zN0skiNvAjDDthcIgCHApKQaQjCyaPr2aDzLVksnSGfEqlA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=virtuozzo.com;
Received: from AS8PR08MB7095.eurprd08.prod.outlook.com (2603:10a6:20b:402::11)
 by HE1PR0802MB2298.eurprd08.prod.outlook.com (2603:10a6:3:c4::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5566.15; Thu, 25 Aug
 2022 14:31:17 +0000
Received: from AS8PR08MB7095.eurprd08.prod.outlook.com
 ([fe80::5174:25c7:6df8:741b]) by AS8PR08MB7095.eurprd08.prod.outlook.com
 ([fe80::5174:25c7:6df8:741b%5]) with mapi id 15.20.5566.015; Thu, 25 Aug 2022
 14:31:17 +0000
From: Alexander Ivanov <alexander.ivanov@virtuozzo.com>
To: qemu-devel@nongnu.org
Cc: qemu-block@nongnu.org, den@virtuozzo.com, stefanha@redhat.com,
 vsementsov@yandex-team.ru, kwolf@redhat.com, hreitz@redhat.com
Subject: [PATCH v6 00/10] parallels: Refactor the code of images checks and
 fix a bug
Date: Thu, 25 Aug 2022 16:30:59 +0200
Message-Id: <20220825143109.176582-1-alexander.ivanov@virtuozzo.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: AS9PR05CA0046.eurprd05.prod.outlook.com
 (2603:10a6:20b:489::29) To AS8PR08MB7095.eurprd08.prod.outlook.com
 (2603:10a6:20b:402::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 843edbcc-2223-4e85-3f53-08da86a67856
X-MS-TrafficTypeDiagnostic: HE1PR0802MB2298:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: r7VsOPRjZqHuWKIFyHLl6FSQWoxDl9o0W0lpDWyC56qnK0Inej+e83fjeorkunaFZ7EAN7TzsAra6BHiuNep3n5BpXOAKbz9RQ7j9MQGLp/U+chhQAlRHU82ty37RAXUHRBime6ksuqlFkzXSovYPdyVXncVeV/QHRRfIvFkptv9UPKvaCjCdMIkFmcSTu5g+q4mOXsTptN/zlLcOpLkPD/MXjW7Pj4RPIkZDMEyK8LrD7/skUDMIcAKcpcDWYvUl9/rTe00KRXo3n5Dlm9rie64oOlKRycp75KV1bFqVUWiJvnQm+tcBpSavi/KKX7xc7AoKNVng1FhzVrDbiomuJ/95rjQm9mFGOcsWV7KR1y9NiLCj5TNIjLEMsCzafq9w7Q89+GlU72u+rvyzdFHdzKa0A/3gqiVsKnGHirK3OJ8g7dvfkUeRvc2aKtTvkXiWyedn3Uk4wGqt7KbSXnagZYA4I5c7tkeJnrrViBsz7bolMXUK+s6fpe1Kd/XwQbIfQ7mLCOaTrg8xXS+xZ8TNEoPnuoUfia1tP+/ZWG93aELheICgzL1Fn4g3QjSrONn6r0QTaJlgp08yJgeX8Q3m6oiL+Ai656CsqRZnyKgwVt/FOi9G0kc+012lXVp6UUFRMKGFdFJBhwLd3Mvs42kiaU/gwncwV0InvdiN2aet98ZpQjP8CiKGJ1KM1Zx6aKPIjPhYigOf1sJVZU+0Px4NHg/wVa2RHtnIk0UGRGGwh/LEQgvwL37ykw7qxzG4lkj
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AS8PR08MB7095.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(4636009)(39850400004)(376002)(366004)(396003)(136003)(346002)(36756003)(83380400001)(186003)(1076003)(2616005)(6506007)(6512007)(5660300002)(52116002)(2906002)(26005)(44832011)(478600001)(38100700002)(38350700002)(8676002)(6916009)(316002)(66946007)(4326008)(86362001)(66556008)(6666004)(66476007)(8936002)(6486002)(41300700001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?ds5du5FA74zTYfHqQbEXzRHXM57TWjwysEhdOPIjj8yCBD6JFrkwedsgSE2w?=
 =?us-ascii?Q?idXdqsQBk4CT7lA6uuA/QqmxKbZiNPzzeFYqXZYHRk7Jo7zktopB81W7fRlG?=
 =?us-ascii?Q?MElTchPSIRojA7fIdxFJq7K3qP5z1MJTWtcu3WPmyFalKwnHvpFbvJcBLkIc?=
 =?us-ascii?Q?iVgbxEa4C/j6zPk4Vo0Ptv19pyDzFF2K2XQVei1qPwGBI0MuoX19HbabGxOi?=
 =?us-ascii?Q?iPfAlr7eBI9erGoKYNRbVamGofPsMx4DYz6CewDpvBsgqwyLiaOsj1vChMX/?=
 =?us-ascii?Q?Vetf83IEH31lNJerlP19uGKi5EDzQPDYse5zIM8XRmwHrDGPDtCVAjZQ9w7t?=
 =?us-ascii?Q?RuyiZx82auEcp4gKQhXrDO74wpaNvEQ1XD1UqNPDGNCEeulhPdX7Vy2QjALi?=
 =?us-ascii?Q?24ZMBUk7eRgeN3jBqlePBQiZx1EDySn6ZKLcCex9kcBbW7U1anjgaDMwjbJJ?=
 =?us-ascii?Q?71OhLH/Pe15RbSKPjLUIft5MqajDb8UAREsUBAUnMZQ519xNY8z5HUo71rX2?=
 =?us-ascii?Q?uGFnfulvvEE7ZEqNBAzZB8AtKNTXh1TSf9YoJo9p8hufHxlToEGWiKNkBKde?=
 =?us-ascii?Q?tyZffyIZA8sYrKl6wonFEiVXOHrQn3WISd64qJZibl+wn6pbFXMf4Qsh9fu/?=
 =?us-ascii?Q?8zT9lIV7Qd61ZHCtF6YBZ9cZGyAqQgFad02/I9mfOR9l3zxgNmZPSwcqpAna?=
 =?us-ascii?Q?jaFnNu72MLaDg1c1b+0Q5YemWMYyx8WBhkeqDUcsAigS1n7OkRU7IZaxLh0r?=
 =?us-ascii?Q?ZtsMOxJf5swovwl6oNhjLghzqgx7sTLamGk1cXlxqJYlAYMB+FebT578qiLX?=
 =?us-ascii?Q?GuMopP1jsHWyyoTkifbfbl7tMbO0CWSjW7NuFdSAXco+362HcngzLYs0qowc?=
 =?us-ascii?Q?n3tDk/MaxrVrB4hg9/5tbySp5AIftfvNkY0BXBHgANOuGTpYISivM5P+4EGz?=
 =?us-ascii?Q?0f0nirFYolr8rFr6k4djFQuvyQJWyA9lrdsLLDr3KmqdrdTFfy2MCJvEosHY?=
 =?us-ascii?Q?2tqrSAEVoKvIzDOVfxUl+Wn/zyzsse62rAl6ezkiE6Mz+9X5n+g5VYooH+CZ?=
 =?us-ascii?Q?o1uJqlJTqUtZ7WtBxRcFCBlxAk7kj/j9OkCeVRF4plSDiCr4VogBunmNPmXU?=
 =?us-ascii?Q?2sZ1deCC1sTzPfUs27gU30ArpiPGyX0nO8HJayQrlrrUEx15VAa6aNumsmt6?=
 =?us-ascii?Q?UligwS7B9S2gSUb1qZHdJ3GXwXeIzsn1N4hwZsvf1zmdW/qCJmHSQz9EJBZM?=
 =?us-ascii?Q?GPVRCZXxBD3AtgZaJxZaJ3yzSJXNSU2OdE6uub7+IeHOWqXM4RNq/UGF2LjJ?=
 =?us-ascii?Q?PUa4JhsY4CXU+t+xvQsiw3wFtFq2g9t3C5jqPmPDE/xN4s24/WJl3cOBVyqa?=
 =?us-ascii?Q?Io7NS2WGS16S+6jLhDRdCow/0CeovPNbH+fIKH+xpwrrtb19AHW0CktBc6Nm?=
 =?us-ascii?Q?pyCHJT1dyv/yNRZ3cVhbZhJCxCynQP1mYW17glCY9j9UgGgsaETUEoUNum6D?=
 =?us-ascii?Q?LESSEH/FSEG7aWDfla64rSUEA7nbC2Q5AvDyh3q1PRebpTLLtXSa5VBOYhb+?=
 =?us-ascii?Q?fgvudefZxrEKMisa8fEXM6k2nJMB6StKVDYRYl2AkHwGjYCNIwwNHXft42mT?=
 =?us-ascii?Q?DSwE9pz//CyvircKIx+ppSc=3D?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 843edbcc-2223-4e85-3f53-08da86a67856
X-MS-Exchange-CrossTenant-AuthSource: AS8PR08MB7095.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Aug 2022 14:31:16.9363 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: DAZHOqIi/BFyViFujlXFxy112zYmA9WcrqCzi4w3q2Ti/YoAYe0Csl+IhzkR8Cu907NNG3gncUClZlW4ARouqu5MuKnVyQ6+I9rczExbKeQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HE1PR0802MB2298
Received-SPF: pass client-ip=40.107.21.96;
 envelope-from=alexander.ivanov@virtuozzo.com;
 helo=EUR05-VI1-obe.outbound.protection.outlook.com
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

Use WITH_QEMU_LOCK_GUARD for simplier code.


v6:
1: Move the error check inside the loop. Move file size getting
   to the function beginning. Skip out-of-image offsets.
2: A new patch - don't let high_off be more than the end of the last cluster.
3: Set data_end without any condition.
7: Move data_end setting to parallels_check_outside_image().
8: Remove s->data_end setting from parallels_check_leak().
   Fix 'i' type.

v5:
2: Change the way of data_end fixing.
6,7: Move data_end check to parallels_check_leak().

v4:
1: Move s->data_end fix to parallels_co_check(). Split the check
   in parallels_open() and the fix in parallels_co_check() to two patches.
2: A new patch - a part of the patch 1.
   Add a fix for data_end to parallels_co_check().
3: Move offset convertation to parallels_set_bat_entry().
4: Fix 'ret' rewriting by bdrv_co_flush() results.
7: Keep 'i' as uint32_t.

v3:

1-8: Fix commit message.

v2:

2: A new patch - a part of the splitted patch 2.
3: Patch order was changed so the replacement is done in parallels_co_check.
   Now we use a helper to set BAT entry and mark the block dirty.
4: Revert the condition with s->header_unclean.
5: Move unrelated helper parallels_set_bat_entry creation to a separate patch.
7: Move fragmentation counting code to this function too.
8: Fix an incorrect usage of WITH_QEMU_LOCK_GUARD.


Alexander Ivanov (10):
  parallels: Out of image offset in BAT leads to image inflation
  parallels: Fix high_off calculation in parallels_co_check()
  parallels: Fix data_end after out-of-image check
  parallels: create parallels_set_bat_entry_helper() to assign BAT value
  parallels: Use generic infrastructure for BAT writing in
    parallels_co_check()
  parallels: Move check of unclean image to a separate function
  parallels: Move check of cluster outside image to a separate function
  parallels: Move check of leaks to a separate function
  parallels: Move statistic collection to a separate function
  parallels: Replace qemu_co_mutex_lock by WITH_QEMU_LOCK_GUARD

 block/parallels.c | 193 +++++++++++++++++++++++++++++++++-------------
 1 file changed, 138 insertions(+), 55 deletions(-)

-- 
2.34.1


