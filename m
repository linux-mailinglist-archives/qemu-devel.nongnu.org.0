Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 331CA37145C
	for <lists+qemu-devel@lfdr.de>; Mon,  3 May 2021 13:36:02 +0200 (CEST)
Received: from localhost ([::1]:33872 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ldWrp-0001P6-7X
	for lists+qemu-devel@lfdr.de; Mon, 03 May 2021 07:36:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43528)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1ldWqD-00085H-Uq; Mon, 03 May 2021 07:34:21 -0400
Received: from mail-db8eur05on2096.outbound.protection.outlook.com
 ([40.107.20.96]:36951 helo=EUR05-DB8-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1ldWqB-000054-FY; Mon, 03 May 2021 07:34:21 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LNMoXzqFh7U7P71aTe1sLFI3EyLEt0I/XufPE/pKhwMqepFuia2N4W275le/V+9MwDb49/M7Oiqw9W9a9ZPSHercsnnMTf2dgOYkPPP37ZLRrxBaTXfF+mvWdtZTEHkQyFj7gHZ/sIMwiEQPXDvcMXjyehKLD5ciSlFGd7R9emV5NUYj2Fs5K/El8k+2hRulYrQVWvuTiNYvvICpnW2nwGMXctRDbjaOqwiWsCwMQh2vLMCypnhtGI7mHexMkwZJjD1HMF4wHrqN5b3yFrVLjvmOMngjWzfmDbhQEMdb+OFgg3tJjq16Fz6nnYho6nlUiUvxljo1bUevvfBcdgvBoQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uvmio4q7uZPUsUd2Dn4wM+gRCugidOSzFVt55r/pRWw=;
 b=dkb4cA2kXhUABqtdlBZhfk9YRwyGBQxYnkQzY+FvW8blwbK49qa1VFAiavgkcC3fKDE3bQ8V2g8MOinO4RAdv5yz3BGla8znpAGKKpywka84hTEQyEArI3DsDhTrKCOSkWECG0LnmYsoc0tDIPTRETvDxUFEaYcxnDf89Sk8prr5DJ2feeOc/E/rxdLyDNdojWbxvEP6JJTZUlOGj4GwNNNBeW4Dpis9hxFjfnF343Yzs6rNbuos5R+3DaU6kX/Mdv85dST28kGZfvP2A+y9P5GRi6C5uEGaEmnwqw86lIgb400bxlPoWfxYNgKNlXCTei1bWA54HszpPWIStVAP5A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uvmio4q7uZPUsUd2Dn4wM+gRCugidOSzFVt55r/pRWw=;
 b=CprzPKnDhgXEEptb+30t+cIxgGlzIEVWlrT7RCOT/BnKtnHpzxcK0Ysll1j6gmMii5F4a5QriGQEHa6CtwD8xH43qyLwpcRuINaMt3oQwj4Dcf8UhSeBZh+TV1ihDI8dSS3n0WNP5h6XugJb0+Pu/im/ZKgW+BQg+qvzR9DBZrI=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM5PR0801MB1713.eurprd08.prod.outlook.com (2603:10a6:203:34::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4087.41; Mon, 3 May
 2021 11:34:16 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::b403:c1a9:6bb7:133]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::b403:c1a9:6bb7:133%7]) with mapi id 15.20.4087.039; Mon, 3 May 2021
 11:34:16 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, mreitz@redhat.com, kwolf@redhat.com,
 vsementsov@virtuozzo.com
Subject: [PATCH 0/6] block permission updated follow-up
Date: Mon,  3 May 2021 14:33:56 +0300
Message-Id: <20210503113402.185852-1-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.29.2
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [185.215.60.251]
X-ClientProxiedBy: HE1PR05CA0255.eurprd05.prod.outlook.com
 (2603:10a6:3:fb::31) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (185.215.60.251) by
 HE1PR05CA0255.eurprd05.prod.outlook.com (2603:10a6:3:fb::31) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4087.27 via Frontend Transport; Mon, 3 May 2021 11:34:15 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 95600836-e6e7-420a-d6be-08d90e2761ef
X-MS-TrafficTypeDiagnostic: AM5PR0801MB1713:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM5PR0801MB1713D7F9ACF75690BB0DEFD4C15B9@AM5PR0801MB1713.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:318;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 3EoLB3ZIiAtr/W7WI/Du2ogdnVmxvqmbnhm5Q51Vwti+cIe9vBzysU72GulVITyiUK/gwzSnH8ED0tilHywozy2QbfEi9w1Z3/hJw1OGCW1jOpIYSkmG+6PFmL2kOvM2BFJpJW7pbzvzk+HyMIwnnkkikQkXrLnUtNSsbt3XL/pycnpOCGVmGjdILwfhoVnpvqt8CqNIGGIfpBFndeD9PWM6tKUMQ9N/vFzyk4ui18bCl1cImGYipZws29rV515hpZ/860K9SmgLNvk0uSo6vgLcX6GWBWm/KJ3LVZ7ckX91tGukAD7ECl894jbRwL+jb8y/8h6auWOlwk6UtCTynydz+gZGvWlNb85HZTaO2+Src3q0w7OAkfK/kVV2J8XZIxO3+jw7ZXCdhkvvkyApbsyBxLS4y9jqYSQRd1A+HBG8tVwDOPmXESu+pXJgaCbjPhL4BMFu9FLY7emYAJEM0XkPIoR9k0s2bfYYQOtiR/52R6Z6kRKyeWLRJP3nvy10/elRYYXL/r0CmptrBlO5pDRu6eHKYdDOVVIEPnFEUpSs0+uthtzEybnx6anXbD2wor2DePm2byzOAQvFwyDbzjEiqufYynD7uyxaFlwXr4rddbq8kpZM87LZSEPKU4PsmNXPKZNGgFDpiVuWzgH80BZW1nhgO1WM1ZHOIxrUoxhtLkIe6bOw6IbmMLymjOS+
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(136003)(366004)(376002)(39830400003)(346002)(396003)(107886003)(5660300002)(6506007)(956004)(1076003)(2616005)(6916009)(4744005)(6512007)(52116002)(4326008)(16526019)(15650500001)(2906002)(186003)(36756003)(38100700002)(83380400001)(66556008)(66946007)(66476007)(86362001)(6486002)(8676002)(8936002)(478600001)(26005)(6666004)(316002)(38350700002)(69590400013);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?WqImTd8gCPKYsfciX3W8Hm2etEVZNRyRdvFsOE8r8WPc8D8Sab2OkVQ9RESH?=
 =?us-ascii?Q?D7lXxDs+xwq+jp60y3QTyuiH9Aedk3dttepy/DCD9ZLAsDvTmkcg22me557+?=
 =?us-ascii?Q?QGQ+bilhvD8HRVx6Qha29mQ6NLP7QXh0wGL3q/pxmCD5PW9xR4wA86D5MWfO?=
 =?us-ascii?Q?rVFiNeqzVLlPFB3yliYXg74pqfK5iUfCN5K9rJ8xIvQmb+mqh8o/pZcuonXG?=
 =?us-ascii?Q?pwS4TfrHHFAvjYfLDcikcxCnmRu+fhsFQhY7vQv5Zlk1kBXgN+ss36b4yiZN?=
 =?us-ascii?Q?MM5/KN/GOtC4/cZghZyaNNE+sSPrSCkwvrlr1py+jfM44VvKKMuiCyIZPxSB?=
 =?us-ascii?Q?Sb3Zqt9FXmAMiR+VV3G4sZ6z+Zf4xvuBmGrXqIp6v7z/IXStZOEGjVznv34u?=
 =?us-ascii?Q?1mu1gZAZMNmvj/z5CTWUcVw2tF0/Y1P3urkoBDy3oS3PApF4dYD50TcJztMI?=
 =?us-ascii?Q?BXj+PSk5N2jiUVGpbA+oZ8JovgP8CVnV+OJXb5oXfZe8IIe3kCsaIC2l/aj5?=
 =?us-ascii?Q?4ILE8I7hYBiBeSrMraZcGxchQ8ykluj0OvTaDWjucUPerXXVkGd99bHk0TDQ?=
 =?us-ascii?Q?sALirNeErU8kBVQIWzVKIUddZJDbOp40ykFXhtUngyBKafuCiWazoy8kVWEw?=
 =?us-ascii?Q?UGLrVxMqRUIDttq7DjxH3v5FK6CZIXbbfeO7zvZYFjvOdXIEuXltm7vy63m+?=
 =?us-ascii?Q?EZUEq16CKqeoXfhVRkwYiDMuEJ/runia8DA1BDa23Fn2TddNLxsJm9JMTEWt?=
 =?us-ascii?Q?DtmcCkFif4/enThjj4IBa5PT4LRGxwP28KhEdSAwK48oO4kIDjQzfmdCIQuu?=
 =?us-ascii?Q?iYfRoNCa1WxCXlmkFrGDzxqS0NKsZi6WbHL4OLLxcN+ABSZY4WlQhYLIUyMv?=
 =?us-ascii?Q?VYlFCKaSC7dESRVTflaQ3ux/NMXSt9GkFTnTCgJJ/DBsYAfqesJoiukgQ1Mc?=
 =?us-ascii?Q?NEYeCtjctjpHFRyMq4ZCBIzWyChaTMAgob7LBPy9iZv0luLugaUnmbkrSMzK?=
 =?us-ascii?Q?EyLpmoT6S3fPBHVpy3IyIFfGWLa6/2grIItRDm1ZgHUqA/widDdSbp9EV+gk?=
 =?us-ascii?Q?OROkMjugw8ziUUK7+n5T1651JWj0up8I7uTd7Tczw51KSYmFjIMvjDi0+Pf4?=
 =?us-ascii?Q?/6JwqoBwoU3imqRUARGe9DCYMc5gK0wNrgtsPpzJCKOYa99f8XrXYOJ6rqqL?=
 =?us-ascii?Q?nggvlYrcvbLhf9W5KrxmVfw4SvWp1AGIPmOssgMK9Mcd+G3UArGmMBW+MmrO?=
 =?us-ascii?Q?TAXAJcceZcOOg1dRdLCqw9bj7ODDu5a9ddgjLKzhLKDPdAtpp+FbI6oKKi2R?=
 =?us-ascii?Q?+u0+WW9HBjDmkUu3O/WbmyIu?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 95600836-e6e7-420a-d6be-08d90e2761ef
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 May 2021 11:34:16.0979 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ivDVhrpjBubQeTSGKLmAzi7oXLw7WyFOSOebIlZZA3fT61AKgjJg7cEqBE8bUW203p4NHaL7n6pGs/a7iApHO2jybQUxWxO7jfG7M7BOWWk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM5PR0801MB1713
Received-SPF: pass client-ip=40.107.20.96;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR05-DB8-obe.outbound.protection.outlook.com
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

Hi all!

Here are two coverity fixes and improvement of error message.

Vladimir Sementsov-Ogievskiy (6):
  block: fix leak of tran in bdrv_root_attach_child
  block: bdrv_reopen_multiple(): fix leak of tran object
  block-backend: improve blk_root_get_parent_desc()
  block: improve bdrv_child_get_parent_desc()
  block: simplify bdrv_child_user_desc()
  block: improve permission conflict error message

 block.c                               | 51 ++++++++++++++++++---------
 block/block-backend.c                 |  9 +++--
 tests/qemu-iotests/283.out            |  2 +-
 tests/qemu-iotests/307.out            |  2 +-
 tests/qemu-iotests/tests/qsd-jobs.out |  2 +-
 5 files changed, 42 insertions(+), 24 deletions(-)

-- 
2.29.2


