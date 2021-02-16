Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8390D31CEAE
	for <lists+qemu-devel@lfdr.de>; Tue, 16 Feb 2021 18:11:15 +0100 (CET)
Received: from localhost ([::1]:50906 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lC3sY-00009a-Hu
	for lists+qemu-devel@lfdr.de; Tue, 16 Feb 2021 12:11:14 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:52908)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lC3U1-0006im-LC; Tue, 16 Feb 2021 11:45:53 -0500
Received: from mail-eopbgr60108.outbound.protection.outlook.com
 ([40.107.6.108]:14830 helo=EUR04-DB3-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lC3Ts-000776-Dw; Tue, 16 Feb 2021 11:45:51 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=epup5h/M2/CmdmdGGJ2V+/zKbC1HJG/MD526ruobNbRAex2kWaXAOLJzwSbeJsOwVERC2cxa7D8B/rY+bvONtyWFvKw3+MV5G1dq1YoodIW5D4jLcZa/2gUx6VGSmDrsnRcyVXyhegqOAxQyEbH3PJxb4GYOzWYhV39KkS6L3KQBr2kWnDuh58sjzaqwgMZuaTHHE7xM5YByP+LRBcyUEXyOajaaZyIN8902RfYdRWYrTpb6dx8zmuNNeoQFBN0RzaYdWXYu5u8+GH0opZupy1HmSTXef9lf/KUPWXYDI3PCKCxy1u67gcipWToAnPqK+DIWnGsDautMPeUYHzYzdA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QxssX9ooq5Mz096wFQMFl2L69jzdpkjrciIgdG07XuU=;
 b=k9pnY3aN6I1L+R5pzHUq1nnU0VzaInveTclU8FvPwAEqeKRULsuo/yP2FKWgFQqLVo04AXnEDdfXV6Imw9HOhC8u93wm4A3tQldQZdLS+n0OBkG/2mCeLdZGFreHWTTmMNy69597+mDbpjQLGj0ErKLZvbyT7GTZyFOG3vvFWgHRX6mXpqg79wUhEPPhVGCthrqyv6suVcSCY3xE4BK1Fs6Lz0g7BBmukWJ0U+CjMmV1TdQvTsyfLmWhNk8GXzZZsduBoAeOighV0gV0Sn3fLG5TQNeB1UMfCqi7oWxZt4EoIejrR1fZ16rdwd29bj0uGbyoGr0vLK6wd0qGclJ+yQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QxssX9ooq5Mz096wFQMFl2L69jzdpkjrciIgdG07XuU=;
 b=RvEXnqeFlcB3XqC6B3KZ84TTn5x75/XsKOZe6P3uRaQjOBILZdZv5mGC5zZ18uV+qyjKU/iJ9jHYMz6Fiszk8ezzBOYV+PtaARjv6vE2UnUmSULNum8JmSpG3g2keR6d7U6LJnQTETFUeG3rK8QGiZaM9zlL9D3/AnR0rsoZNdc=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AS8PR08MB6359.eurprd08.prod.outlook.com (2603:10a6:20b:31a::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3846.25; Tue, 16 Feb
 2021 16:45:40 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::f1f0:6610:11f5:5e4a]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::f1f0:6610:11f5:5e4a%9]) with mapi id 15.20.3846.043; Tue, 16 Feb 2021
 16:45:40 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, den@openvz.org, stefanha@redhat.com,
 mreitz@redhat.com, kwolf@redhat.com, jsnow@redhat.com,
 vsementsov@virtuozzo.com, eblake@redhat.com
Subject: [PATCH 0/5] parallels: load bitmap extension
Date: Tue, 16 Feb 2021 19:45:22 +0300
Message-Id: <20210216164527.37745-1-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.29.2
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [185.215.60.244]
X-ClientProxiedBy: AM3PR05CA0149.eurprd05.prod.outlook.com
 (2603:10a6:207:3::27) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from kvm.sw.ru (185.215.60.244) by
 AM3PR05CA0149.eurprd05.prod.outlook.com (2603:10a6:207:3::27) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3846.25 via Frontend Transport; Tue, 16 Feb 2021 16:45:39 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 11c73755-6ebf-4170-065b-08d8d29a4ae1
X-MS-TrafficTypeDiagnostic: AS8PR08MB6359:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AS8PR08MB635942E24806EC0346E0739BC1879@AS8PR08MB6359.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:156;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: bqPga6TcKsECXEUXuxN3jIn2AMWbf10tF8Ofi4R5X2Pk9rTygo9ukyNFMVuJVANFPYH1bT88kQ2Jfa4ZWTsTP/Qmf6G/EE8Ew/hwiSTMBj/5y+u+mJPPSDPM01pF4gsLgKLbWT7b0HO6iYGAzteRzhFIqdl8JvAnEBXIoDzOsMdhqmJHz5n90eqP3q1nWl+7phA62ylS1TxJFKISldzqtC5ChOWiq39Sn3JD3e7M/vMIHjoN1BtcZZC9MrgrBjcULgVwqlQQJBvfqkocf4js/Tf2pIYJMg+C5iHoh3GHtoT+9/LjvmprtDDSAndO0CSJZrZs20mR8mycvQmewdQNBzT8fb0ut1Si9f8fd7+Y2u0tt/mxwtNT9qtA/fCDMuVoG+Bo2MTk1huRHhFIIyjcZxp1aeu5WEX5yp6n4cHSm735gC+4uac2HaHsh8y9YKfEil0gnCA1DquGLFv2WaTRWXUIvdWUKVq6XiF4XUVd2gFGKohivE3Q3LgznFZFAA/L9/9mSkbXykAIN92cjf5PmQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(376002)(366004)(136003)(346002)(39850400004)(396003)(8936002)(956004)(316002)(83380400001)(36756003)(26005)(8676002)(2616005)(5660300002)(1076003)(66946007)(66556008)(86362001)(52116002)(6512007)(186003)(2906002)(6486002)(6506007)(4326008)(16526019)(66476007)(6666004)(6916009)(478600001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?WQodXfaSYVKcIGVjkY6JIzQmYbs/Lov2esxM8PVGWk/2LrFgeGNvTobptfbf?=
 =?us-ascii?Q?zHtyjzRhTnYwq98h10KaSz8eTYRU7536i6t6sJNc/VNwTSLuJ9FD00s2onm5?=
 =?us-ascii?Q?b2BMSo8TDQR3g+lbgfuHFa1Fxv1Zez5zlBJNbtaMMTJppj4q6MH8JCxk5aX1?=
 =?us-ascii?Q?G72FzNNdp+JPqaEc/qf4Asooufuu/omybZ71qM3Viu1oIqdiMRBqE4uE4yfw?=
 =?us-ascii?Q?PYhplQSs2qy4QIcU4xVUH+7kJ2ILngo8BKU0TBS12QOOzdIozgffrRqGH+c9?=
 =?us-ascii?Q?nWno0Ye7fUiB3o5q81HjmmxWp8wIXZQ3iDodhSBD1b0ylia7HjJuDXKj5ph6?=
 =?us-ascii?Q?nA5uh7N5Y6+GNBy5PHUQ9f0TUjZ/MGGOyHybHzRd+iEdPInT7qpKD+Xep6Ra?=
 =?us-ascii?Q?c7KaAJG145DZJITSFXHfPqOOP+KGCTLA4KYMtoGJJlJ+jYOpQKosfgS6mubd?=
 =?us-ascii?Q?1z6McxQ2AwBNHfkJ3a2Q1OW5W7c/PtTMMzDDLQtkR6Yk4BcHXU1d19m6j9a7?=
 =?us-ascii?Q?CX76t0ULSPfM6UiAdMOKc954f+wcdPqTjdH/1Q3e1fRTnXORzFhePc6tzf6n?=
 =?us-ascii?Q?0lbO7/AT5Bc9J78EsZtNmOuT9+3eDxAAHOJbupLv2D0JrAsS4TpsqHFQ8Bho?=
 =?us-ascii?Q?GJCdwdS1/a32PNQhMSLrjbzg40Wx9hAI84Rbb97RBOV2FTDJb8dZSVkprDIZ?=
 =?us-ascii?Q?PWptfymbqNPIzu1YqXYHmPCBkbgcgG/b1ZeGqQ0E3zjDvs12aqTJWvuchzE2?=
 =?us-ascii?Q?v+pl8n5I1LqhJVpaxxmAMtaLPLfIqgVxhDFwtGua9KzsCfB8YzPvhschqmou?=
 =?us-ascii?Q?psrh1KHw1fnqciq3rUbgxwfqR9+r61cjo0Tw6yszd795l82DLyk0vHmwxNxp?=
 =?us-ascii?Q?CnLmotfIcFOs6LOIB2QfVweEAtZeEzv4u5wqI8LHaOhIm78eX/OvvfCJlNx8?=
 =?us-ascii?Q?v5ei83Q9AFSjOBlEY4UYfSkyc16VoGcKpk9/7aed3ZOhD8Q3i6X8BUihwicI?=
 =?us-ascii?Q?Vzj0sZyEcT7swXtHzf9H3TLy1bwjgqcy3emNiUCtuBeRFUb2OCPYmw7tOq5M?=
 =?us-ascii?Q?0qJ2QyNFEs19sJbmzUlE65X/FgX/luPktWkGQIJ8ZBNYcYkSuS/uWj6kMNVg?=
 =?us-ascii?Q?AF3TIq6XVM8rYQM5g0pVsKtR341iUB8J+AlKoOlJDWhTiBPzU2fBhNPUwZwL?=
 =?us-ascii?Q?4Eh2RXvYsvKrw2SSrXw3iDTcBNJc9W+Jb77iiKB0thY0cO5D9BG9otU9RtBh?=
 =?us-ascii?Q?VTQn6MSM1gNnjWcUwrGKVSWmicYZrvNFkZlZL1DW0iOt1rHU9O/ZhbkuFw1K?=
 =?us-ascii?Q?OeWE0XpQ9bv6AdrcnGS+9O90?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 11c73755-6ebf-4170-065b-08d8d29a4ae1
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Feb 2021 16:45:40.0194 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: l3eEu6RTP+MOAyLK97KHrx+4o53OwrHmm2MeH/CqbnmY7oWGEnlpK63AdhRee/w6QbmGioBmlYXQCimU6W1nnpqGyXjAgExjJhaL7BmixMQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB6359
Received-SPF: pass client-ip=40.107.6.108;
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

Suddenly we need to load bitmaps from parallels image in our product.
So here is a feature.

Vladimir Sementsov-Ogievskiy (5):
  qcow2-bitmap: make bytes_covered_by_bitmap_cluster() public
  parallels.txt: fix bitmap L1 table description
  parallels: support bitmap extension for read-only mode
  iotests.py: add unarchive_sample_image() helper
  iotests: add parallels-read-bitmap test

 docs/interop/parallels.txt                    |  15 +-
 block/parallels.h                             |   6 +-
 include/block/dirty-bitmap.h                  |   2 +
 block/dirty-bitmap.c                          |  13 +
 block/parallels-ext.c                         | 286 ++++++++++++++++++
 block/parallels.c                             |  18 ++
 block/qcow2-bitmap.c                          |  16 +-
 block/meson.build                             |   3 +-
 tests/qemu-iotests/iotests.py                 |  10 +
 .../sample_images/parallels-with-bitmap.bz2   | Bin 0 -> 203 bytes
 .../sample_images/parallels-with-bitmap.sh    |  33 ++
 .../qemu-iotests/tests/parallels-read-bitmap  |  57 ++++
 .../tests/parallels-read-bitmap.out           |   6 +
 13 files changed, 443 insertions(+), 22 deletions(-)
 create mode 100644 block/parallels-ext.c
 create mode 100644 tests/qemu-iotests/sample_images/parallels-with-bitmap.bz2
 create mode 100755 tests/qemu-iotests/sample_images/parallels-with-bitmap.sh
 create mode 100755 tests/qemu-iotests/tests/parallels-read-bitmap
 create mode 100644 tests/qemu-iotests/tests/parallels-read-bitmap.out

-- 
2.29.2


