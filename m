Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 637A340205A
	for <lists+qemu-devel@lfdr.de>; Mon,  6 Sep 2021 21:17:01 +0200 (CEST)
Received: from localhost ([::1]:45000 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mNK72-0001iS-G2
	for lists+qemu-devel@lfdr.de; Mon, 06 Sep 2021 15:17:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42294)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1mNJxd-0005XV-7h; Mon, 06 Sep 2021 15:07:18 -0400
Received: from mail-eopbgr80094.outbound.protection.outlook.com
 ([40.107.8.94]:32928 helo=EUR04-VI1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1mNJxb-0002Fk-7x; Mon, 06 Sep 2021 15:07:17 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cLhJh8bENQ/mIbjxKkdzJVvID/Bw638Y59bu/QL6kQ4ZYeSElTXSG+X7z7mfDKzbZTQA5Yg5viK3gzYaV/mELt348FlKd8IJ7rJc0Qh9YdmXsG6FddFzYZkaH2UetzIXxuEAsKzFACsztzBCarso+sbp4NDDyd898q7ayUyMh87OV7UqDj/GekIrqdbu8ob18gMPjmFFG/0t247SFY7SgvSvkn7J5FWjBrNXbI1SQyA221hCZcq+5goNpajYL4xBqiI1zM/44JGoIqzsuCIJM6WrgvK8YA24zcDgHVwlUuSc0KfhaQ3bJCHXA+G95vCflykFEu8eQsPp8HS1Xwttbg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version; 
 bh=pZ7eUGGervxArR3btPw//NjXC251e2gkBHSSQsjV7/I=;
 b=B5H/ynReosbH7q4sttbIYX3VkRdNCdgAMRWdBP3V8hcUC+PplHXkW0naYvggWeSlxW877PfIoFkwvhNZt8zcNrd6yZQplUg8UVn5bkjPBNF17JmbBty6HIkk5ZfOekh9OnnoM/qWe8HA3aNZWuFDYaEhlJrxyCxtgvR+DSU/kTTJbkTZTwpBfkWGfhKKf9kWEnoSgzGeaS4VviFcTZEWYrtjGzRTvKEtLWKmQq71GapgK7ZXLNYfEfGSTlt1OP40UPOb21ytKQMG8Qzi8wCi2fsxjjtAYyuT8LRos03ksY2R3HyirYhwlyVA3442pbSOypHAThSpvTHtNwbnPN/USg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pZ7eUGGervxArR3btPw//NjXC251e2gkBHSSQsjV7/I=;
 b=RWK5GSpIhRgpsAcewF+MCKK+X8xprzYRk0eoiIk4PMJhzeoI4a5sW0bYQV4nR99r7lzfYZ400saMcrMFPDav5H9i9G6PMVdj4Pf2OSkmwJI3iz02vN81VrbysPYb34iXRc6gT7pzlf7QPVYpOf9qMPmngmwP4byCmzs8TFHgi8E=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM6PR08MB4849.eurprd08.prod.outlook.com (2603:10a6:20b:c3::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4478.24; Mon, 6 Sep
 2021 19:07:08 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::2817:53b3:f8b4:fe22]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::2817:53b3:f8b4:fe22%8]) with mapi id 15.20.4478.025; Mon, 6 Sep 2021
 19:07:08 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, armbru@redhat.com, hreitz@redhat.com,
 kwolf@redhat.com, vsementsov@virtuozzo.com, eblake@redhat.com,
 den@openvz.org
Subject: [PATCH v3 0/9] nbd reconnect on open
Date: Mon,  6 Sep 2021 22:06:45 +0300
Message-Id: <20210906190654.183421-1-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.29.2
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: HE1PR05CA0302.eurprd05.prod.outlook.com
 (2603:10a6:7:93::33) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (185.215.60.196) by
 HE1PR05CA0302.eurprd05.prod.outlook.com (2603:10a6:7:93::33) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4478.17 via Frontend Transport; Mon, 6 Sep 2021 19:07:07 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 270e165c-abba-44e0-e029-08d971698607
X-MS-TrafficTypeDiagnostic: AM6PR08MB4849:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM6PR08MB484981F9D6F42EAEE025BDD8C1D29@AM6PR08MB4849.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:4125;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 37Z3tyE3kUeG5brVg9WC5im8ubWOS1ZPvBEnI1ZlbqM1OHg8/snx6bo7yJAN/Bi1U91IsSy54QMKMMeMz0Jpqpz1foqBTInDZHDnsxgiBB61EKq+Mij7I0m8T0zdGeagYjACdyyWxj3O9x/yprSUUQz+jRn+NVDm4evizoxDhqb7jgCzn+Gvgkm3Kina65qiTFWiYy46uxU18p8B72wIgxW8C06BEFZGxgKb+p8c2Mo6/fVP7JDcWkZZFFbommuwlPqq+oA5tunGvZBtSVlYoOWhzps3BkYiJ/cgyJOsBWcE6vLzrv2c1XXH2twRpEfRol7/JThNDEfacv7BXx1yel+zjcQh4DoUeILspm/F32DnsonIJpG+7tt+mX/0g+0fxUKkhbqzablmgWmHFs6TODNb2WgHiUA0cPxpH/lvkiHYA5OAGFtg8o2daj4aRQo0vRqaVPOhIdagEjFpyLHFoClsVxYtR31F97dyQ9q9Of+FKrmr3S/cSucgRf/RFSy/fvmbmW531FXEhRnKMwrd+oFKY4By4rTg2E0Z+tVNgeZIEwdSDQvaK7vo4pBjYCUR38trJz/tvoKhQxUuJG8UqDhPghHKwy4kJXUe357GZsNZuEpD9Eeq6kz/LlWVFtPGuI4LV5cb5qTbeTfQ/flMTCNEY6r+gumg4uZIWRC4Ke7XPzVhrXxKbpEbWAuWnouAZWO0M6ktm86RlekckcColg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(376002)(39840400004)(346002)(366004)(396003)(136003)(66476007)(66556008)(38350700002)(478600001)(83380400001)(26005)(66946007)(8676002)(5660300002)(1076003)(186003)(38100700002)(52116002)(2616005)(4326008)(8936002)(36756003)(107886003)(6506007)(86362001)(6666004)(956004)(6512007)(316002)(6486002)(2906002)(6916009);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?R0227k6g+i+2prHsdFErcD+SvTzblB0OMUMTwz4EZvFYh6OG8CPCHewUngw4?=
 =?us-ascii?Q?Rz4qg7GkniT07gBaNMh4OIFsO6yhqPYrhqL75jsFwotL68HhTKrWLXaBoOCw?=
 =?us-ascii?Q?Xj2YiYMicmm4l6/YDxSTka/RzmOzLw71jEmxIGDdR5k3HvZIXOoLBDSrBdC+?=
 =?us-ascii?Q?3gll1HhMMXk5GklEuwTraOasGQAMvK6WSNC7bUzPSW2sB3fCy9VUzGx/gyAD?=
 =?us-ascii?Q?3wj4WqvBLdE1gCao3+PLjSSNyM3QjqX4UjxuXGggphKxUCrJKcJyQm7m3pUA?=
 =?us-ascii?Q?/SMV1o9reGbprOqxw/AmoS0HyTZDoDQoa9rQ9kFVyvCI+Ytlrq3vq2CGnqL8?=
 =?us-ascii?Q?+5o5+j4Za5L6vT504CACUK5qUlMUf6QFBAUFPqvbhNJbwvIQHrSA+VnPifNb?=
 =?us-ascii?Q?NSK7/dpQXCPhRECYkZ9BAgPxAtNmhnAO0DAOL9lpSkudmPyt/2BLtjXbo0ze?=
 =?us-ascii?Q?DoGxnOzBZK59he8v6CvAgujDPQ0rym1rKCaCZ7Dvd3iG3mq27AYaplks8fwG?=
 =?us-ascii?Q?ZbxaJ2JYVX9OV81rYg/NVaHJOP98U3G1ur4llILWAQa1x4AR+p8d/5XmvmJc?=
 =?us-ascii?Q?Q7Dt6qdtdZIWywxvsCKAKbLscLGkDyvAOuyaScLJjjDSlVNbiB1L4Ii5D//t?=
 =?us-ascii?Q?1xE/bnTIsBlPEacMqVyLJvaqjv8TGK7Ju26/wlhvghSLXx7z05OeU1imvuJF?=
 =?us-ascii?Q?k98Duspf6E6HLaduNk4l66CspcqsPKuIwPsF2ZChrZmkMIC9qNCM0edI6nKv?=
 =?us-ascii?Q?Lv6ouoZ4dMRY4Y6q6bmlwNlTW7bFwQPG2xqDvSv9wSpq8ZbfnFh8nk+F+qp6?=
 =?us-ascii?Q?0zy1gCfcqOEQqdU+BDBOxoKLwh/hYDMoVw/EnPMof0gjNWNE+QOegB4JfPzp?=
 =?us-ascii?Q?PEXNeWpA5alzKIZZsHpW5pC4qXM43nYBe/dmsJYncFyAai/63yO2UPyVzXIO?=
 =?us-ascii?Q?WTn4uswek8kdy6FM4gxdNHay28eiztwcgcx3j0CDpCQLeVawJX9KdWNAoxDY?=
 =?us-ascii?Q?VPIiE81XJmXXXLRgl2E/rAbqt30Jqtcl8uZ+U+1u5p8zIMfNMooTI1uSHbzg?=
 =?us-ascii?Q?gVpB4+lwJyeSKwdfW8H+9M4GEaOpWetxSM5RhiEzwDT8l2JNvVaLdAlb8WS1?=
 =?us-ascii?Q?FM+M6KqLt7Z648/QERtEh4T634ZKPCdLUVkHUaCAdR5XBhVQETVrydTshWDG?=
 =?us-ascii?Q?/Ig4TZj4tFwI2wWeCpAkeuPX4xNOxELK9u86qwCLxl/lzoK7S2PJJPBudyB5?=
 =?us-ascii?Q?C+dI6ha/0ptlmJB04VX6T3M/U9RW9Kpvbibp/swboOlQ9zHIxt+EArxRLKDi?=
 =?us-ascii?Q?sJbCJJVPqBMjdKozzknbXY/4?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 270e165c-abba-44e0-e029-08d971698607
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Sep 2021 19:07:08.6063 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: SqklDxu5STv7yskGS1Nuk/wM2+EOvzRG/q0FF2guU3r71jMjqajhlZHXxsvTtsy1kEwOO8HgLydCORO6wNVdgQMVVkED8v842lJ6rtnDTOM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB4849
Received-SPF: pass client-ip=40.107.8.94;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR04-VI1-obe.outbound.protection.outlook.com
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

After a long delay here is v3.

v3 is rebased on top of big refactoring of nbd connection code, and on
top of last portion of it, not yet merged:
Based-on: <20210902103805.25686-1-vsementsov@virtuozzo.com>
   "[PATCH v6 0/5] block/nbd: drop connection_co"

So, the core patch (02) is changed a lot. QAPI interface added.

Vladimir Sementsov-Ogievskiy (9):
  nbd/client-connection: nbd_co_establish_connection(): fix non set errp
  qapi: make blockdev-add a coroutine command
  nbd: allow reconnect on open, with corresponding new options
  nbd/client-connection: nbd_co_establish_connection(): return real
    error
  nbd/client-connection: improve error message of cancelled attempt
  iotests.py: add qemu_tool_popen()
  iotests.py: add and use qemu_io_wrap_args()
  iotests.py: add qemu_io_popen()
  iotests: add nbd-reconnect-on-open test

 qapi/block-core.json                          | 12 +++-
 block/nbd.c                                   | 45 +++++++++++-
 nbd/client-connection.c                       | 56 +++++++++++----
 tests/qemu-iotests/iotests.py                 | 39 ++++++----
 .../qemu-iotests/tests/nbd-reconnect-on-open  | 71 +++++++++++++++++++
 .../tests/nbd-reconnect-on-open.out           | 11 +++
 6 files changed, 203 insertions(+), 31 deletions(-)
 create mode 100755 tests/qemu-iotests/tests/nbd-reconnect-on-open
 create mode 100644 tests/qemu-iotests/tests/nbd-reconnect-on-open.out

-- 
2.29.2


