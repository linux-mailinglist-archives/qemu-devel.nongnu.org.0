Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 69BCD323AC0
	for <lists+qemu-devel@lfdr.de>; Wed, 24 Feb 2021 11:49:27 +0100 (CET)
Received: from localhost ([::1]:50000 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lErjR-0008HE-P2
	for lists+qemu-devel@lfdr.de; Wed, 24 Feb 2021 05:49:25 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:41776)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lErhc-0006eW-LX; Wed, 24 Feb 2021 05:47:32 -0500
Received: from mail-eopbgr10109.outbound.protection.outlook.com
 ([40.107.1.109]:50657 helo=EUR02-HE1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lErhZ-0007IR-8I; Wed, 24 Feb 2021 05:47:31 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=aaXE6VNY+4SRXJbO3Euk9ziJUWspZGOCZT89L3ws9Dpj6JoaXfSPJC2/OvSb6e7uK9HK8uS0U5BB5pBFjfJWzP/2pe6XSfwlUSNN+2VHlwhRtWGvfb0/voucbhfVl2C1TDVrpYWeGO9sfTag9ee6/RZ/wXPKRM78OEQ2vklJNPzE8deg5+6eYlC8j+u2krkezxio4Qjv/kAsn1JVyEw4djo113BEreOjLnPQNg+gJThBfcwV8ScTVuxJ9fDECO13k6pxfK2QqrHMs2r7WzoCWnTN+OkobCPmDN71OPA1Z3rSp7p2OXRA96haoiiAqeWOe+Nb3lSic/I8jXNROijh5g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=N7FzsZgdC32Uq74hjQIuBmqd3+xQg5+rFLBPfrHyuHM=;
 b=nExYEduRHlL1tVMk/lJtlhEHZdwba6tzjPqHOZ0ciR1iIl4nuldDLSswTxVwBkPBY7xGBw4rue+TTBV8TrJPC9Offrn/oJjNQWPskZSgZzuMPxxG40GYMpuw6zCHv1KeWVhZAsQM0wDFL8o2C6wnztCvClFsEa4VY5z92z38TClqwudwZ0pU5+WuHyanmWwzDXAGSWM9XchICSn5QpTmW6g2aXjVyQXskS2tkXAligo95YDWX7SJNCxa9/P/MwO3Gy1lDuLdK3A70WoCoCMkUvq1QxFqUacIsKt+2Twzu4T89caxe1TiT+5er3fgwiSBKTUX6AVLE4s/CF6BgDZP1g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=N7FzsZgdC32Uq74hjQIuBmqd3+xQg5+rFLBPfrHyuHM=;
 b=kOWBYdQUGDsOT2g1lAnlMuJW5D5rEYMusGjS7rGIJik/0w0GpNCGW93oUELcCtvxts+qcnz/sSdydUax97yxwLCb/o1TIE1qM8UcjCS97F0SJ2hgsfj+rrwtDVAVX1M5yWui5EfFsNSJOigFERtRYEZltjTAz18dB1uio/dJZHw=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM6PR08MB3574.eurprd08.prod.outlook.com (2603:10a6:20b:4e::28)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3868.28; Wed, 24 Feb
 2021 10:47:24 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::f1f0:6610:11f5:5e4a]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::f1f0:6610:11f5:5e4a%9]) with mapi id 15.20.3868.032; Wed, 24 Feb 2021
 10:47:24 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, den@openvz.org, stefanha@redhat.com,
 mreitz@redhat.com, kwolf@redhat.com, jsnow@redhat.com,
 vsementsov@virtuozzo.com, eblake@redhat.com
Subject: [PATCH v2 0/6] parallels: load bitmap extension
Date: Wed, 24 Feb 2021 13:47:01 +0300
Message-Id: <20210224104707.88430-1-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.29.2
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [185.215.60.244]
X-ClientProxiedBy: HE1PR05CA0177.eurprd05.prod.outlook.com
 (2603:10a6:3:f8::25) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (185.215.60.244) by
 HE1PR05CA0177.eurprd05.prod.outlook.com (2603:10a6:3:f8::25) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3890.19 via Frontend Transport; Wed, 24 Feb 2021 10:47:22 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: fea438c0-2fda-4f14-3273-08d8d8b1919f
X-MS-TrafficTypeDiagnostic: AM6PR08MB3574:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM6PR08MB35745EDABC03B4C93CE50A84C19F9@AM6PR08MB3574.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:33;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ZzCZ5wqhHHApOI2i99/Lx2thlgh4HDIhs7IbNtAaPfEvQVbr5si9Zf5dM8FwLh8+wUOGIKrdl28GbrIls89plyVf9W5JqfGM0CC6n5E2WTFelkdD4nqs8megP1JMoy/8tKOwKcWHKnyAFfsJ+X1F8X5ZBijeihwRbbP6sv+VtczL0V3S+v90dhi6Y0DTH2c+JruNumfcjav/r8aVeLtrUXv/StsHPvRb+RDrZpeZ3kw5XqYhdXKeQMFUjBqDv5qyBxRuNC8+/gSTqQOYbCtxrv1NFuO+7xYxm51cNp4cxrxzJkWd6J7YUBUCdqo58jcTGN49ou3gkj5pdzzEQLdx7YTXRtpLZgZlRILaPK1QFi6et23P82yZy6ImsHs/+Tr0MmrJYmXm5OueKQbMwqZrT/5eq1leqlrUJFyfJX/m2z0j6QBQGh0vJdm7eVSqt9G8ZrqSVEUoSO7bpcqwAU6yaDVhGU31SYtMls9CX1vmBlc4pA/R0pCI5Vxer6gio+OIkr95NQ0qlWGRLTeFESQeR9i6rULGiEJJfvNCWbTCJXfa6JT+P8iQOfFr3o1xSYOne1o8+94q9L0s274AmNoUYg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(376002)(396003)(39840400004)(346002)(366004)(136003)(4326008)(6486002)(6916009)(6512007)(186003)(2616005)(478600001)(5660300002)(52116002)(66476007)(6666004)(956004)(36756003)(66946007)(83380400001)(316002)(69590400012)(1076003)(26005)(6506007)(16526019)(8936002)(86362001)(66556008)(8676002)(2906002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?9BoHHVOdCtj/eRAgYlC6E2+MEQMRZKqeE3yq/wODBMVwJlmZf2wE2f7VaUOm?=
 =?us-ascii?Q?uG/j4zyt9CfdQ9jSOuWHB2jd3hzknfK4MuLIITbopupMJvGS0vTsWnpE6NSO?=
 =?us-ascii?Q?sH60cV7AFYu4xSWxD3x0uzND+cK2GxqNzx2lOeaigqHbPF0IUgoXAQIj4kOv?=
 =?us-ascii?Q?rI0DIPGX+HMMykfh77K1n5tE/uh/lLhwNVf47NJ8l0bNgP7FGqEOvgwraL4W?=
 =?us-ascii?Q?mnNCx/oWItkuWTqKWYRbcKp33kPm/kMWm8JA204U5xuq0owjZdKQTRyfEDM4?=
 =?us-ascii?Q?2BY/AGTrpzXXYpqTGtY7Ls1xMR7SDRDdY1VZ6TNWs8TNCBS+a7XgsdiyGj47?=
 =?us-ascii?Q?KEG2ahoH0eKEypEjaVYGvRlUVUcJaJ7lngY8y/sNZWghQ2qlwjefn+p52peB?=
 =?us-ascii?Q?2SwDXGsUtKDJgamg4s3MQR9vZ1a+o9DcP6gGOqt3OJU80Wq/ujTundQYw/hn?=
 =?us-ascii?Q?b09HNVagJA5Dvw8cqgWzT9xwHokBddyvCxrGbCuPndhTBDpz47GMTEpIHISU?=
 =?us-ascii?Q?jzjKq7CP6eibX7m9H4PEYxGZWaX38XV75hCqSXfh/V2I53O35r7XX212FBIc?=
 =?us-ascii?Q?XUH9atoL19ZT2GdsaGJlSnCtGxjeWjMzNVW5WZsa5zCu7FRV4obn/Ah8fQwx?=
 =?us-ascii?Q?4emmrJIQXrYc5tVtDfhk8FfyEcdT28SGEPCc7hqq2roDl8pzC3UUTMc47URz?=
 =?us-ascii?Q?c7q+oM/Or/C98MZj6OmsNZi9r37piJSp9R+NqwjP1G+WrXaWV57fRCPzj5mF?=
 =?us-ascii?Q?hSMIj6zq/9JZdyqmTNDtO6ZBpVXf0vrCISRwTlItSOMSn0CxyGWso/CGk/LN?=
 =?us-ascii?Q?nXB+8zm4MA2kSV9aJPrFYFJah6VcgJu9/nAVuYkCXUZLnuQxYDt/lWPX4WGl?=
 =?us-ascii?Q?LvvImKpcT5ddAqYsl9uiPOpDqtZ1NYUgfgY+8gkx2jb3RxbC2PfDaL31GjLA?=
 =?us-ascii?Q?YFYJh0SMcmJrEl5PXmzQ0bCqKxFJehjlMKH+tnwr+otPMNcOIv+LDJHubnXY?=
 =?us-ascii?Q?d+3SGvqpPRIiwCf1cjDrKpm75hLZYrigk31PBxm3GV0+c0HwhIJdwsuel0oT?=
 =?us-ascii?Q?dqXNDxjU5RS+2GL8qH2zgCdUIu4gRCiFS1Cfo0pvF5mAbBrmXUBrHW8hTARb?=
 =?us-ascii?Q?wuSFT17gR+vVpIcT0EesoVMmc6KMng7ogIRp1FBXtiAvpLFDNI6cln1FBs+/?=
 =?us-ascii?Q?tHegAWByxtZmFCgoA0bdjMVb+YPadjjyOrYAJhqwg9WqTc5iqt11Tni5nKEt?=
 =?us-ascii?Q?qn+1RjqR5JgHFiZedgO6gF+n0xI/RpYEycKYf/lWC8r3X2OaB6/a04WOs5Jt?=
 =?us-ascii?Q?LqfPaGTrCTrOHqFVBZy7MrBJ?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fea438c0-2fda-4f14-3273-08d8d8b1919f
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Feb 2021 10:47:23.9553 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: l6eQrhizT+lYSmLzhGNDcrG/kL4vTUc7PPMe0NQmOKrL9rDI6H5mN5ITPYkheSGXdNcuaaPnZeAgw+V16+pdjBZoMkoaz8USTHvS+f0tSoI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB3574
Received-SPF: pass client-ip=40.107.1.109;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR02-HE1-obe.outbound.protection.outlook.com
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

We need to load bitmaps from parallels image in our product.
So here is a feature.

v2:
01: tweak commit message, add r-bs by Eric and Denis
02: tweak wording by Denis's suggestions
03: new, suggested by Denis
04: rebase on 03, add several error checking,
    convert l1 table to cpu from small-endian,
    allow loading several bitmaps
06: add copyright, drop "/work/mega"

Vladimir Sementsov-Ogievskiy (6):
  qcow2-bitmap: make bytes_covered_by_bitmap_cluster() public
  parallels.txt: fix bitmap L1 table description
  block/parallels: BDRVParallelsState: add cluster_size field
  parallels: support bitmap extension for read-only mode
  iotests.py: add unarchive_sample_image() helper
  iotests: add parallels-read-bitmap test

 docs/interop/parallels.txt                    |  27 +-
 block/parallels.h                             |   7 +-
 include/block/dirty-bitmap.h                  |   2 +
 block/dirty-bitmap.c                          |  13 +
 block/parallels-ext.c                         | 300 ++++++++++++++++++
 block/parallels.c                             |  26 +-
 block/qcow2-bitmap.c                          |  16 +-
 block/meson.build                             |   3 +-
 tests/qemu-iotests/iotests.py                 |  10 +
 .../sample_images/parallels-with-bitmap.bz2   | Bin 0 -> 203 bytes
 .../sample_images/parallels-with-bitmap.sh    |  51 +++
 .../qemu-iotests/tests/parallels-read-bitmap  |  55 ++++
 .../tests/parallels-read-bitmap.out           |   6 +
 13 files changed, 484 insertions(+), 32 deletions(-)
 create mode 100644 block/parallels-ext.c
 create mode 100644 tests/qemu-iotests/sample_images/parallels-with-bitmap.bz2
 create mode 100755 tests/qemu-iotests/sample_images/parallels-with-bitmap.sh
 create mode 100755 tests/qemu-iotests/tests/parallels-read-bitmap
 create mode 100644 tests/qemu-iotests/tests/parallels-read-bitmap.out

-- 
2.29.2


