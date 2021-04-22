Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9100A3684ED
	for <lists+qemu-devel@lfdr.de>; Thu, 22 Apr 2021 18:34:04 +0200 (CEST)
Received: from localhost ([::1]:32840 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lZcHD-0000tA-MB
	for lists+qemu-devel@lfdr.de; Thu, 22 Apr 2021 12:34:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54864)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lZcEP-0007DU-Jo; Thu, 22 Apr 2021 12:31:09 -0400
Received: from mail-eopbgr60110.outbound.protection.outlook.com
 ([40.107.6.110]:40766 helo=EUR04-DB3-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lZcEM-0003u4-8q; Thu, 22 Apr 2021 12:31:08 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cxqBQ/zTbK9/ZSwjBerGFOOjWLT3SP8nzPNLpy7H91gfHrFS54dcapuBkpUfDbovFJVSwvFlAWdkaRdfBmhC6CE/m+0RQ0gt3pNYOv6Qs1UOWkeVmLfWY96Ux3dUNn/7K03L5s1Hvbv0zW3gek4TsP6/QBikgtLOjPP29gnL3VeqRcnTPUa+IxAOGFSxV0/vBopWUEDcTMEMOxmmy7c2wZkRA2EF77Tq1RQw4TTPaNSymngM0W5MNr9MklneGEFaxaDH9BejwCS85E4a1BHUXd3XA4g6itjALq5RRguoa0jW1LJF6otxxRXyPutYE9I7jBXOspI1N9w2z666c6uyOg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Qu+aYiymqIMa5mncjlNVWoyVZ2ccB3cBQNiDSAeTmog=;
 b=ORW6CUAITCOqHQOdFmsKVGNQZZznSZ73Z6Ji07vauI+B69EpApG5PUh+hBKFEkqHkYm3zRmOc7rzyFsb3yDaIqXq4mIXL6qL9jS8nD9HYCAop+heMiOu1WMGI0f8hgkXot6Cc24Zpbr9Af6IZgnYxZuHcKQ+s+xU2Z9VS6jS9QlmrN7SnKGeXnpAcVneHtlEKaj2YLwdNjSvYxAINDjFUGr/CvUSTFd5EuCuTrla83HEcoe1w6UNI7ET0PvqdOqxsvrNPNldX1uyCxKwkghtXS/O5PwklcR3fHlKa9Lq3qHVIKxqekCJsgV+QYPGJ+Xl3WxFAeUvOTSz/By4AwVj1g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Qu+aYiymqIMa5mncjlNVWoyVZ2ccB3cBQNiDSAeTmog=;
 b=UOM7N6dhARqo0MWXUDU269UbCSL3x3BxbpWjuUD3QiieAj2EPPXVQJZVTqNWAwpbIFHxOmYzLIkeLX5aCBfQUsOsJszFE1EpvuvTIWa5Id6MQWhAlGden36pc5vhL3ehTeq2l4hWWD25lU5IcKNGmwW5iF5p6bVNzDvIm6ZrIy0=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM6PR08MB3447.eurprd08.prod.outlook.com (2603:10a6:20b:44::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4042.24; Thu, 22 Apr
 2021 16:31:01 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::b403:c1a9:6bb7:133]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::b403:c1a9:6bb7:133%7]) with mapi id 15.20.4065.021; Thu, 22 Apr 2021
 16:31:01 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, mreitz@redhat.com, kwolf@redhat.com,
 vsementsov@virtuozzo.com, den@openvz.org
Subject: [PATCH v6 00/12] qcow2: fix parallel rewrite and discard (lockless)
Date: Thu, 22 Apr 2021 19:30:34 +0300
Message-Id: <20210422163046.442932-1-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.29.2
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [185.215.60.222]
X-ClientProxiedBy: HE1PR0501CA0006.eurprd05.prod.outlook.com
 (2603:10a6:3:1a::16) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (185.215.60.222) by
 HE1PR0501CA0006.eurprd05.prod.outlook.com (2603:10a6:3:1a::16) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4042.16 via Frontend Transport; Thu, 22 Apr 2021 16:31:00 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 7e101c08-f5d4-407a-d08d-08d905ac0454
X-MS-TrafficTypeDiagnostic: AM6PR08MB3447:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM6PR08MB3447279D6E4B60CAF80B4497C1469@AM6PR08MB3447.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:5797;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 1nbbJH6CjSdPcNwy92WgR8gBd4eHggolhojSEFCGELQ32dpayoZrZOKp6id8Abz3jbWoHgVOdLbSdI8tikuYsN+qKLLojw01tgbdj/2z03O0+liEZLBLGe7cK0Os3p+QzE7JqWl7UlKUrAgJcwy/WfcbyvvlMAzpGzCLCXPr59yuBUKvmhSb4k8g1QjSyQ1iajTmwceLebxA2GRdoCm8SfyWxdcRvXy8Cz9QOaH4+uwQ9YljCgNjWB92YzCjao60hEtqY1GvJuunf8iEeO5pWOZUp8nMWQFX3Lxt7Y9Bms3BgHejDfeqV/R5XMlQTGfPCBQ3KrEGOI5jKvy24fId6/xt5IK8YkWorfjgJXc4f9kt806vGKU4WGlHIfzmscocy0pjoioSoVT6/3z3+XHkJbItzci9QDpzukb+segfbkZOQiUKii/GV5sGMHp7HiHv+aO1f7L4Jfy9StEqSsYXhcDJOFnz3bZVM8rNzyn3fgaMk0zcPxERBD69htPD94rYWOafG+tfI3827AJa1DXcNFImsTtnEGX2eTyBhs9cTlrs/d8uc+0ojyZ2PKJyG/4rxCJGAx24Py3kfWNyjSyIAooDuBhtDbfrA/Yi9iweMTx6t5YHn5p5ZqoJJwF6KN3NiMcM97gFywqlOzjer5jIAG86nhDwDkn6d0f/9aZ84fqOQeBjOvWj4n49KVnGizg5
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(376002)(136003)(39840400004)(366004)(346002)(396003)(8676002)(38350700002)(478600001)(186003)(6512007)(38100700002)(66556008)(2906002)(5660300002)(4326008)(26005)(86362001)(83380400001)(316002)(66946007)(52116002)(16526019)(1076003)(6486002)(6916009)(66476007)(36756003)(6506007)(956004)(2616005)(8936002)(6666004)(107886003)(69590400013);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?3hNazINen0GG6a+P0rMnmiWKlYhxiVoJOl2BGqtGUO3dZP6GpvZoyiYJgWC+?=
 =?us-ascii?Q?lUhuU97dC6Q61ArO5iq9y3WPHYSxTRIqEbBlHq3TTy7aEzXJ8raVEqzgx+uE?=
 =?us-ascii?Q?hxMXWYYxVi7BOlg8BVmKQHcYdhIDI+7+IT070JsNi32MbNQsiLDbE/+WhOQ3?=
 =?us-ascii?Q?tyUUlgkMhNFutBYly+UqG0OE+qvkH8lD7wg1pFZKSlMuKa40l3LH+7MlOdFT?=
 =?us-ascii?Q?N6+deqAJKzgxDK3F/yxVJsnWVJiPaMgigPdNStbAPw5CtBe67bg9nmgBlZOd?=
 =?us-ascii?Q?Mh1pRpBDKYsXW2Es0Rbw8YBKH9V11CkeB1e8RbtWlArRHOzr6/bHhc73OO9P?=
 =?us-ascii?Q?f39ZTrpVRhRSRjqL047T9+TQSfXosnxiHhG+OLKvtQhYGSUwDFHGmzCJxERr?=
 =?us-ascii?Q?PdkPcjYXhy1rUBlLX7oZGgbLndqn8NV6zAr5VjhVVppNtVAkexOrDRDdoGJC?=
 =?us-ascii?Q?6uVdw5qbBBHpzgVw8zrZFF8y/efknG8SlkIH6gRPrRe3Ice40HFVwfuDjTAx?=
 =?us-ascii?Q?oQXCptl4KkKRdWgqYjmdPZZ5nfGIP7NjKRtZUWbMJ4+ccPRKQjytlpQxXaBn?=
 =?us-ascii?Q?QaLl6eK1zdPfOGZvS+Vit+k4DyAqlYY7054whZiQd1tMVQezbFSmI3ZbCrgH?=
 =?us-ascii?Q?SOnsWntlOttffoInIFTdjGFUIILQWtaaq7c/Fzcnrw+MSP5ZXi1HEAT7lsNX?=
 =?us-ascii?Q?mOw25tTY7+9ewF6zXaTah3pNxzIW8pT4JcW4WDmruRnVIxz9pdlRUsNZ2Oeu?=
 =?us-ascii?Q?plfjDaU1rG7PtAxknOm7aEH1sCqjYNrbXOUPckmkmC0uxrsjIVI1reCwoeYx?=
 =?us-ascii?Q?0aYh2D1KHrvMf2nNLxZtkMpGI5Zz9bItBKrsc23G8UH47rGs7f2v938kRgBt?=
 =?us-ascii?Q?/6k9RBx2lQ9Zx7DYXMUgfVwWTmlRZy5ggqCZzGWm6sgAjIJtdKT1FB97gHFj?=
 =?us-ascii?Q?LZdtRL7gZaJX+i9QXSv29z0xvFWXyXa56pLgKSE2Yp+uMcxT69yqSru1eF/O?=
 =?us-ascii?Q?WTuOjsZAok1/4Jloc5Xt+6Pxh1LuwKOzTW8h1rvRV3uSC+2PXoqcvJmInS74?=
 =?us-ascii?Q?qG0g/uvsfbAxK70n0JgKgD7I0XQtDHePu6zSCRQn4ul5vV/cAq2k+KTlkIk+?=
 =?us-ascii?Q?nErZBnKwh9Iy9J9lnzpr12v4nhJcN9cOH9GOBTSVxIUkHuZgQCaYjhGgR1mb?=
 =?us-ascii?Q?xqveaoiDttBy/IJ8VYEpNq/rAcDuR/d3We5iDKaGNDaS2TmdU3L/peke0NG4?=
 =?us-ascii?Q?86hZcZ80/4iJk5GMwh0uamAZzRiR0Ss+TlVqTwL99DZ8bP/0c5dviJ6Ac1SV?=
 =?us-ascii?Q?feYF5y8QHtFmIjBx24jDYRqM?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7e101c08-f5d4-407a-d08d-08d905ac0454
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Apr 2021 16:31:01.7465 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: XxS4x+NthlM0LvTe1TSFhueINKcYcS19R0NbsYLMu8zoxLdiJeZXcinCcDPyswvDsy9XWjq0M1+ZTcWNACaMzfd76Z61feTbmCQg1d6Heic=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB3447
Received-SPF: pass client-ip=40.107.6.110;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR04-DB3-obe.outbound.protection.outlook.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 MSGID_FROM_MTA_HEADER=0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

It's an alternative lock-less solution to
  [PATCH v4 0/3] qcow2: fix parallel rewrite and discard (rw-lock)

In v6 a lot of things are rewritten.

What is changed:

1. rename the feature to host_range_refcnt, move it to separate file
2. better naming for everything (I hope)
3. cover reads, not only writes
4. do "ref" in qcow2_get_host_offset(), qcow2_alloc_host_offset(),
    qcow2_alloc_compressed_cluster_offset().
   and callers do "unref" appropriately.

Vladimir Sementsov-Ogievskiy (12):
  iotests: add qcow2-discard-during-rewrite
  qcow2: fix cache discarding in update_refcount()
  block/qcow2-cluster: assert no data_file on compressed write path
  block/qcow2-refcount: rename and publish update_refcount_discard()
  block/qcow2: introduce qcow2_parse_compressed_cluster_descriptor()
  block/qcow2: refactor qcow2_co_preadv_task() to have one return
  block/qcow2: qcow2_co_pwrite_zeroes: use QEMU_LOCK_GUARD
  qcow2: introduce is_cluster_free() helper
  qcow2: introduce host-range-refs
  qcow2: introduce qcow2_host_cluster_postponed_discard()
  qcow2: protect data writing by host range reference
  qcow2: protect data reading by host range reference

 block/qcow2.h                                 |  26 +++
 block/qcow2-cluster.c                         |  55 +++++-
 block/qcow2-host-range-refs.c                 | 174 ++++++++++++++++++
 block/qcow2-refcount.c                        |  61 ++++--
 block/qcow2.c                                 | 118 ++++++++----
 block/meson.build                             |   1 +
 .../tests/qcow2-discard-during-rewrite        |  72 ++++++++
 .../tests/qcow2-discard-during-rewrite.out    |  21 +++
 8 files changed, 475 insertions(+), 53 deletions(-)
 create mode 100644 block/qcow2-host-range-refs.c
 create mode 100755 tests/qemu-iotests/tests/qcow2-discard-during-rewrite
 create mode 100644 tests/qemu-iotests/tests/qcow2-discard-during-rewrite.out

-- 
2.29.2


