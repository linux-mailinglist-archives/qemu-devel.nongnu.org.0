Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4141438B1D0
	for <lists+qemu-devel@lfdr.de>; Thu, 20 May 2021 16:34:37 +0200 (CEST)
Received: from localhost ([::1]:47788 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ljjky-0004ms-5R
	for lists+qemu-devel@lfdr.de; Thu, 20 May 2021 10:34:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60858)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1ljjZr-00062J-EQ; Thu, 20 May 2021 10:23:07 -0400
Received: from mail-vi1eur05on2104.outbound.protection.outlook.com
 ([40.107.21.104]:17121 helo=EUR05-VI1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1ljjZp-0005pb-Ma; Thu, 20 May 2021 10:23:07 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kb7RQF1YN4AqBtG7mWqQhGgdwrQ/mzvQjDgqxWjPeqt0soAAryYdU0i/aHtXdZL7bqZkRUjArPK45W4B9OymLv1QRtgrbPWkrdY880zGMY0Y/Npv+LL3YSs8YkN/zCjccH8AOGUTa274nvvGYHXVn+IylHUjKy6roJJb/vJPEuBlYPAmVNJY0QzyrYR2zF5OvlNWzd35XwuGGteY3w4f2duzY6LA80ya6T7+xh06qmiNK4uIKGCqEaA0NGWKC0j9YltxwMaxSjpA6/eSp91vEeDH24lzc5y4/ELjLJf5PabGMDdkAWEhYbNWa5g4904cTieznuR/xvzAd+seotpAGA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rRjqWsdRaHSlMRZ3wsG16ISLEBj6Jx/2vsot2HJxcQU=;
 b=F4ord4DcE7vqOl6Og94BVeyFioR+ND/oZumiwEx1Xj4bkmYt9q4p68LbsEJ8thYOPTS169L2ozrqcBqbTEPCxdIBT5jJkrBLmwYnsO1x8gwMfx/goZpgK1mhsn67hhL5t04R3nK6i+i0cupf8E3+lZ5eSYkAQeZepWChtJgr3Lumyy3syVLbVfaP6TocztPtvcD3eoTCsDq4b5mBMQCVp/OchjAZjSpfC5JH3j90ClLz5Lta1KeoX+uKhkHXhfNTvkWOloncxGzfPgs8ZzJHfIvVtNYKiM79eZ62IDKeEBu54R46YAu3Jb4uRyrq0X5Y/JxKMGe/8SVct0HAH92tJg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rRjqWsdRaHSlMRZ3wsG16ISLEBj6Jx/2vsot2HJxcQU=;
 b=PlmxZuSWssAbZxD7JpZccvG7Db9LZq0+4uw0y8vm3QQRUiSFxIM4Susc1spA5Qee/lRZB3+rzjsNd+n1quGEqRN6bBzBBrJNXvIifAXjxUrzNFQxdVsu4s1fZ7YWO1PWVqkWWhGqKSopxzZYMParzfTTKO9pQZlQi/FozloFwKc=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AS8PR08MB7009.eurprd08.prod.outlook.com (2603:10a6:20b:34c::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4129.26; Thu, 20 May
 2021 14:23:03 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::b403:c1a9:6bb7:133]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::b403:c1a9:6bb7:133%7]) with mapi id 15.20.4129.033; Thu, 20 May 2021
 14:23:03 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, eblake@redhat.com, armbru@redhat.com,
 crosa@redhat.com, ehabkost@redhat.com, berrange@redhat.com,
 pbonzini@redhat.com, vsementsov@virtuozzo.com, jsnow@redhat.com,
 mreitz@redhat.com, kwolf@redhat.com, den@openvz.org
Subject: [PATCH v2 28/33] iotests: move 222 to tests/image-fleecing
Date: Thu, 20 May 2021 17:22:00 +0300
Message-Id: <20210520142205.607501-29-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210520142205.607501-1-vsementsov@virtuozzo.com>
References: <20210520142205.607501-1-vsementsov@virtuozzo.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [185.215.60.197]
X-ClientProxiedBy: HE1P190CA0034.EURP190.PROD.OUTLOOK.COM (2603:10a6:7:52::23)
 To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (185.215.60.197) by
 HE1P190CA0034.EURP190.PROD.OUTLOOK.COM (2603:10a6:7:52::23) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4150.23 via Frontend Transport; Thu, 20 May 2021 14:23:01 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: aee9927e-b6ca-4e8a-9662-08d91b9ac723
X-MS-TrafficTypeDiagnostic: AS8PR08MB7009:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AS8PR08MB7009D16CD395A0FB12FD150FC12A9@AS8PR08MB7009.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:497;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: MQepcpWttNOvzJzegodQezYxkRqe0qXDm8evarlKfxwNyTPAWOLdL0TnB1JwJl3bUdauwzuJvCdWSzNp7Qo4j2pMskV9lPRlBRz/y0sAFrS47iW6wcQ/jg0gkf2rV1LIq7qb7H4A1iZXbMuNXUo7n47QoJgXKaAo5uwfsyDoXDJFoe4L9UTcUFD7ARS0JXL2TfXg2R1ZCpjHDNI7C/rBhDUIqK5pl3I6farrMtziZRSVwQAXAIAWTGSR2I2P8AziZcAD//G+tW9lbGLAYg5NPaxZ9skUci/5J6knr6SsL/Lm5oFsTatLpWkhBL5bUjfAdFrPOxdQlt/fIjFlpiTnZ7hDJ+0yIGw8/o9S9ImQndPlWQ1rKS0d9LOcd6jw4uxKWrTyDJGEEmDjCLkUtQTqd9tETBC98o/oernphK/CzTNzC+j0bDYcwSzmW36HJ8s/rdeUnjGe5J3Mww329JpHXMDDleTNlI43b2gwbDJ0w8+m6eyHJRjo6a/7Fmw+kQWD+gPYkyn7v8k5k8DRwzVS/dvXhDp9MfHB4TlJJT0wW5MTC+a3NCMxeZZ6vPA4Nk9/DixRcnHwsCCyExD2jE2k6WxAxp4iJVvucIUMZ/MctPhYJaBccHsiTC/4LoNj2g1BbcZzRMFHMVMd44ta8RyeF9fzRKasTzQtYz9a/IQKImM7skj8JcchYDnr+4uqI2my
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(39850400004)(396003)(136003)(376002)(346002)(366004)(38100700002)(38350700002)(478600001)(86362001)(6916009)(6486002)(36756003)(83380400001)(4744005)(107886003)(8676002)(186003)(4326008)(16526019)(316002)(1076003)(5660300002)(8936002)(26005)(6506007)(7416002)(66556008)(66476007)(66946007)(2906002)(956004)(2616005)(6512007)(52116002)(69590400013);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?O5eQoDre4VcfgLEdKjGiwFZhuy1HOv3o5+bw6oRTyZcUiaGQ1E2V2UsSRGkp?=
 =?us-ascii?Q?IAzlkfFPJs4N0xJ28uosnkeehj7jHsfiktjENimS//F4O/ZG3w/R4j2PSOJg?=
 =?us-ascii?Q?PHK9qLz4nPlikfRkTDG8RY79wDgwX1QReIUnCJdFKlg+cPp/Xi89da+T9oMH?=
 =?us-ascii?Q?pd8gwl+HPv8t5FBavft9nT+Xt5Vl9/DaG1CCstRVjVqiy9uINdaofJ9jNuNn?=
 =?us-ascii?Q?E7rUaPDiyZ914taDiFT9D+JuYbBCUljf0dRmrP03EkV7XPKbDh5reNdvXkyB?=
 =?us-ascii?Q?B49JhaWtD6CukQNUrvghqR0nC5aI54DzPQMxJEhqODKKY2sdaCZGkI+kA1zh?=
 =?us-ascii?Q?DmL07OsiMJoT3Ym0Ttq2188vxLQPW3pOhfKD4Et0Ra9p9HiPwKd+oL+JZONz?=
 =?us-ascii?Q?okeD+WF2OneH8aZXx3BAwho+YMqEBn6VHQxxasBHe6D587/2F2q3zDl9Ta2v?=
 =?us-ascii?Q?gJZdw48pbx0QBMNK1f2pE0J5N96kO/ZVOlk5MN66Opx0oj8rq4fhMAOZLjCC?=
 =?us-ascii?Q?Lit3WDLRrEg3ZJjkG6peT/gOETa0gO9XgUXXGHZ94yuyDLXoxBk1SNsT2FFs?=
 =?us-ascii?Q?1zdhdpVvIIKmH3/bXuFEomyTisYY0gMhIqRqvYItV+VQgBVsLg3Pfw/BwULP?=
 =?us-ascii?Q?XyqNZ8DBQl3uG/97GRIz2nGkYDrpJjLjlUGe+Q9AzkUx+55H1aqCmQ/YBPUm?=
 =?us-ascii?Q?gIeYPiMm3PDeKQXp1YSkbLFQKlUDhJSkkhtHfGbfsL27APK2DuDAPQg5YQQa?=
 =?us-ascii?Q?Gg/lOyItjPorLoXwHedLPJfksxdLvmrMP+YLf4cT4TJ8ZpAATdsarjJFdC59?=
 =?us-ascii?Q?B7QtYYbMfPX67BYTVqTt4H3V3IDf1BvB4mUg5sEsBrxSqbLYlXEo3C+2kbeQ?=
 =?us-ascii?Q?heKAuSl4T866qLu+EiOgnLwrJ7Ca3ObeI7UjV+ZASV2nx8CXsMblevmoyL8j?=
 =?us-ascii?Q?FV11P7dRnKh+CyIKK0hFWeq/rPux78iQCZ5vLbKvs0pMW1VbqsqC+kMqqhCW?=
 =?us-ascii?Q?XRltDIABUNkwQ40mLNU3vYp55IPmM5dap/4wKAahM+OyVpnP/JzLmMIwbvLk?=
 =?us-ascii?Q?AJxrP45rpkiVI1WU6Uff7vkkn9NemrNh+NentYDMoHe8fchlgK64L2X2nWFx?=
 =?us-ascii?Q?pRvfG/A+mO1QQ5Pq5VeDxnKClRImHeCU1+qky/6Yi0FEHP6iWFAyK7hTHF/1?=
 =?us-ascii?Q?BN3WTQ0F4rlNBVs+IpY48NLBb7dSDdzL+Oao19t6EPrTaJ0qXbRLiuxaPvS+?=
 =?us-ascii?Q?JHxOh2xSlMVmJLzJIxJJqbpfw3doygbHOnIxGWn5XgS8XKLpkhMKsgBckIIy?=
 =?us-ascii?Q?fwcElQi40VIEBvrBVSnTn6Q4?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: aee9927e-b6ca-4e8a-9662-08d91b9ac723
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 May 2021 14:23:03.0881 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: l0l6kujzpMHt5lW57aMLOkjODSFnLYjPFrfoRER2QpVx2k4wB/4zWmquY01ns37o6M6p4Sh8j0DofdtY/qO2H7IT0+kevwqjSMI1skta1ZU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB7009
Received-SPF: pass client-ip=40.107.21.104;
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


