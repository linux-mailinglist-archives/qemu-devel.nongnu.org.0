Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E5E222DBB1F
	for <lists+qemu-devel@lfdr.de>; Wed, 16 Dec 2020 07:20:04 +0100 (CET)
Received: from localhost ([::1]:53036 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kpQAN-0004Zm-Sg
	for lists+qemu-devel@lfdr.de; Wed, 16 Dec 2020 01:20:03 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:53452)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1kpQ7r-0002cE-VZ; Wed, 16 Dec 2020 01:17:28 -0500
Received: from mail-eopbgr00135.outbound.protection.outlook.com
 ([40.107.0.135]:52920 helo=EUR02-AM5-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1kpQ7m-0001CD-CT; Wed, 16 Dec 2020 01:17:26 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PSCr5HeId78FWRo7Q2zhA5PH7P+4IRBfwZ/IXJ3HO2bBY21tG7rHIywGbfKevTUkedi/ic+CgOApnuin+Exuv5NmnrBGtfl4NEoy3tN46ZhEThZPpnLUGI+V6DdltucNaEaBPSeExgEpY5hL1mdKYJ+IJ1vq7f/OpoH+XEY1DqQBwFVyICMr+qkjwhjdQF3vfk08qKyJdFqB+CiBnwtRm+pCwTMaI5rnfYz53AnM7bWYgYVysWzotqqwYaPZwl0cfFjmy/RsDOuTIvkMOXuHbBC6RhzyJyICuSvYwA4kQg8FpzwibTC9Wv/LXksPD5m1+ku0K2OGHc/IgpdWO3RRrA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=K0HUT9mYD90ZoPz/ybVkNfsxODmhHMRVa9cA7k1Ezt0=;
 b=TO8B+Xf0HDu7bwS5aUPsLRIB3MaLo7x5ED4N9rQokYIDVmMAXbHGRo1zBslXGWdxjNQW9jYcpnhLzPBFG3bAA6fUyORBNqP9uRxoiDhRpXYWEC/Amf87q+DiR2yqPsmMFB1G0JiN10LprSBncndPNsoSv0LJp63uvySvW2hAUTz9zYnVcMW17p9Dwwb4ascG+rlN6GK5tChOzIjJ1l21AV5tI8Yvoq5TT5zC3xzV4rlXNuMjmmQ8QEv1OwXEX9UbS0PdD5En1X3PgmPGM9bHlrE8nKdIzzJjG5DpcVu5z4Rc3nItLwt2GaET7krZWRQhIKu/a9sS0MDWFut+3mxupw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=K0HUT9mYD90ZoPz/ybVkNfsxODmhHMRVa9cA7k1Ezt0=;
 b=DW8zmMq/iZmLPITWxraEiWyzIRcxI6LvCKd+yJwbsFl1ysp6r/hDAoeH+KnodNOkR57QtLTMlW5SSTRyRh386ZiLW0I9YnbLGIXDZ11ImNsGDYq57IQ8Zn/aoAgYUJ8Dx8wxbG6cDh+ine8GNZMX7HzZuabCIiimZ7S4Tj/SqnM=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AS8PR08MB6309.eurprd08.prod.outlook.com (2603:10a6:20b:29f::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3654.24; Wed, 16 Dec
 2020 06:17:16 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::d585:99a4:d7a4:d478]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::d585:99a4:d7a4:d478%4]) with mapi id 15.20.3654.024; Wed, 16 Dec 2020
 06:17:16 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Subject: [PATCH v15 00/13] Apply COR-filter to the block-stream permanently
Date: Wed, 16 Dec 2020 09:16:50 +0300
Message-Id: <20201216061703.70908-1-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.25.4
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [185.215.60.92]
X-ClientProxiedBy: AM4PR0202CA0008.eurprd02.prod.outlook.com
 (2603:10a6:200:89::18) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from kvm.sw.ru (185.215.60.92) by
 AM4PR0202CA0008.eurprd02.prod.outlook.com (2603:10a6:200:89::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3654.12 via Frontend
 Transport; Wed, 16 Dec 2020 06:17:15 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: c5ac18a1-9fcf-4374-94b1-08d8a18a3ca0
X-MS-TrafficTypeDiagnostic: AS8PR08MB6309:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AS8PR08MB6309D4C3B9EB3A2460475DBEC1C50@AS8PR08MB6309.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:125;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: T5Vf5o8Mg5yfulziVu+5fizcAzNGwcLdEdjX2QkqagBe1Qj5Qa6zWmd7sDVh4dIV2acHNmpkUTtPq2j2sSsssl+xMjoL4SenE+KdLkHsVXK2oI0vghcdoxR/0rymRyIWy6mrB2qav8IEyXf4Gw5+NHiqWeEQEH1GISTH+FsJoXN3UfHqeBUUbskdW2pRsqHpSgGd5qws45qHfT3+EiQr3JIyUADjF5fF5iFk1iBe6lwkYi2Vl1wA/FzfbgyfBwNuQD1LTkFE/OTOFAIijhjgn500CaNk4fActVHWSS/LVR9A/wRxzHaoctkjH4u2XOIA+/aBfd4jVckJ7umEI0cCkg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(376002)(136003)(396003)(366004)(39830400003)(346002)(4326008)(5660300002)(66556008)(66476007)(186003)(16526019)(956004)(6506007)(6512007)(2616005)(66946007)(36756003)(6666004)(1076003)(86362001)(6916009)(316002)(6486002)(52116002)(2906002)(8676002)(83380400001)(107886003)(478600001)(8936002)(26005);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?qWfnmVcUQp5nhxd5wq3HQ2KnFitb7jVMTHjHS59r2AtMwOInHMd6+n71vDAT?=
 =?us-ascii?Q?4/wMP6Mm4xGGfOtNCIh5Ql6tVPYggIivdiqHFQDVwNCRdDpTq+bOWEuCmuM1?=
 =?us-ascii?Q?Kvj/987y5U2CLbIYzs493ZWKr53sAQ6Wp9td2C936dpVaqNBgADjTK3Iv1kr?=
 =?us-ascii?Q?871zVcESQTDSRx+CTYrHxozCWw21MSLWshAHNR1VMV0VTO/TuqF6mUjBs0S6?=
 =?us-ascii?Q?vARrSLk+aC0qubFMmgStt2wdkz+F885vscPRnHnO7AkZlaBz6KR3x5vX8Q7C?=
 =?us-ascii?Q?3vHEqoeTydfeeWUx8sAJ3X80g+fEcaFycwa2FTJ/LmJ7pVWmaeJuTfTFXsLt?=
 =?us-ascii?Q?48M3UBI2kNSbH8xrsj2ZYj3H3NiZPIn1CJ+z1oFf3nLPfQlODqZLb2vImyQf?=
 =?us-ascii?Q?xPLrDcvVf/KcYyG5DQGQCri2ecv67vtaaQZYmlqZ6tOZ9a/2qntcmCdfkXOl?=
 =?us-ascii?Q?L6uG51c55Ql+IXumEte6VmRTkzsH/uFzmiDUVLxZhA5EV4FX5b8kAVj4vVae?=
 =?us-ascii?Q?McJcfJ8snG4FDMCCWRo7rJl402Q0BENx+mmZDxd93g+lC4P0HvZCe2TgQq9S?=
 =?us-ascii?Q?d8kESE63hK9WtByj6DUTCcs3wCxau7BhwH3DTJehsDXo0Hw8eHpjhfd1fDEH?=
 =?us-ascii?Q?kgd7UDk9R7D1SpBU533jpRBL9yT4PE8OrhQzncZYbu9FRyR/5Ww0ul3t/kU6?=
 =?us-ascii?Q?bcG7IaiAYyzJkh46L2XUU9eBwAgncBlqKdXPEYn/ThTJLeLM7+9vE/3Cc5Nc?=
 =?us-ascii?Q?ykUz+7xEJSSa3BSrG3CbAsl+t/R5cyYAjy/zfSMUsRJhsRPunD6DGzKrIuz/?=
 =?us-ascii?Q?h5hlM4e3I8FXgyc5GYPtGzSd2V0+IAziUxqzYjwyEGkTOA5Np4HKX6y/ut3K?=
 =?us-ascii?Q?wQWSMGimIDriEPoNMmCVlZekPqc6QyhXKlRP0ADCnZ6v6IutXUlVGqG5RfE7?=
 =?us-ascii?Q?ZUSVfdFi62x5cV5WbYU76NNomsdypkyTIP904jD/NPcjMhjutndbzLIbzm5N?=
 =?us-ascii?Q?UVP2?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Dec 2020 06:17:16.7232 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-Network-Message-Id: c5ac18a1-9fcf-4374-94b1-08d8a18a3ca0
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: kpWpxY302PfpZ42u/iJwOkz9GKtIxSHbN05ndJ84tgTEdhAsKWiIx7+OHk92DWDf1gaojzsPhlpwXf8IxPphxkAA3mczGQ7AMPcVtK42t2M=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB6309
Received-SPF: pass client-ip=40.107.0.135;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR02-AM5-obe.outbound.protection.outlook.com
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
Cc: fam@euphon.net, kwolf@redhat.com, vsementsov@virtuozzo.com,
 qemu-devel@nongnu.org, armbru@redhat.com, stefanha@redhat.com, den@openvz.org,
 andrey.shinkevich@virtuozzo.com, mreitz@redhat.com, jsnow@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi all!

Here is a new version of cor-filter in block-stream series. Main change
is freezing the chain in cor-filter itself.

v15:
02: s/ =  / = /
    add Max's r-b
03: add Max's r-b
04: since: 6.0
    indent comment
    add Max's r-b
05: changed commit msg
    wording
    document the default
    since: 6.0
    use bdrv_find_node(), fix errp overwriting
    freeze the chain
    check bottom is not filter
    ref bottom_bs
06: limit to qcow2 to not care
    use qemu-img rebase -u -b ''
07: use assert instead of abort
    add Max's r-b
08: add Max's r-b
09: changed commit msg (was "stream: skip filters when writing backing file name to QCOW2 header")
    keep mostly same logic for the case when backing-file is specified, don't do bdrv_find_backing_image()
10: don't restrict backing-file for now
11: add Max's r-b
12: add Max's r-b
13: chain is now frozen in filter, so the logic changed around add/remove fitlter

Andrey Shinkevich (10):
  copy-on-read: support preadv/pwritev_part functions
  block: add API function to insert a node
  copy-on-read: add filter drop function
  qapi: add filter-node-name to block-stream
  qapi: copy-on-read filter: add 'bottom' option
  iotests: add #310 to test bottom node in COR driver
  block: include supported_read_flags into BDS structure
  copy-on-read: skip non-guest reads if no copy needed
  stream: rework backing-file changing
  block: apply COR-filter to block-stream jobs

Vladimir Sementsov-Ogievskiy (3):
  qapi: block-stream: add "bottom" argument
  iotests: 30: prepare to COR filter insertion by stream job
  block/stream: add s->target_bs

 qapi/block-core.json           |  38 ++++++-
 block/copy-on-read.h           |  32 ++++++
 include/block/block.h          |  10 +-
 include/block/block_int.h      |  12 ++-
 block.c                        |  25 +++++
 block/copy-on-read.c           | 184 +++++++++++++++++++++++++++++---
 block/io.c                     |  10 +-
 block/monitor/block-hmp-cmds.c |   7 +-
 block/stream.c                 | 185 ++++++++++++++++++++-------------
 blockdev.c                     |  69 +++++++++---
 tests/qemu-iotests/030         |  12 ++-
 tests/qemu-iotests/141.out     |   2 +-
 tests/qemu-iotests/245         |  20 ++--
 tests/qemu-iotests/310         | 116 +++++++++++++++++++++
 tests/qemu-iotests/310.out     |  15 +++
 tests/qemu-iotests/group       |   1 +
 16 files changed, 608 insertions(+), 130 deletions(-)
 create mode 100644 block/copy-on-read.h
 create mode 100755 tests/qemu-iotests/310
 create mode 100644 tests/qemu-iotests/310.out

-- 
2.25.4


