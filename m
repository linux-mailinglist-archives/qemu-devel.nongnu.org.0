Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F16844CC667
	for <lists+qemu-devel@lfdr.de>; Thu,  3 Mar 2022 20:46:39 +0100 (CET)
Received: from localhost ([::1]:42642 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nPrPK-0006Wm-JA
	for lists+qemu-devel@lfdr.de; Thu, 03 Mar 2022 14:46:38 -0500
Received: from eggs.gnu.org ([209.51.188.92]:38930)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1nPrMw-0003fo-U5; Thu, 03 Mar 2022 14:44:11 -0500
Received: from [2a01:111:f400:7d00::72c] (port=28672
 helo=EUR05-VI1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1nPrMu-0004Wu-Fd; Thu, 03 Mar 2022 14:44:09 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=eqzQvPg/QNPNgAxl54wWhgkSSR4oeCl/l6l6C6YtHjNN+ErhYmOmYiQaPsl9tls+DPhSxECU0U5UpE1c3xQ+/IVJUZJggzLdlVtcXX8sGdeALXxGJjLwWHmNmiLy1of8htu5UJNeblfM26U/+jGrpgTvtJPblSMvsj5OyqGrhpsbuMSG8jYsAp9JlMWfj4xrd4BV79sIU2hAWhntgN5q6gzySsKET3/Uy43DzTbWWoJ62MfliTT7OUin66eKC+UNfJY1oaNzI1JPXmqJE7DOXkiK7urf6avEPPjoKwo6CqfvW5X6sXpXBIwD/4B2rqJsDT5oES9I3X/gk5qw6V1/Xg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=maAwAIjZNMJat2dKuF4E7YdBND+6xThXQlpXIiX8cuI=;
 b=f2AHh0DjNNh3DiCJRZADZzFqDSKGsbdeM7jumoH6hcC8v64ezNDybHdPl9cB9b70x694wBKbT4Fs5xywBHe52+AuhFI4BGFhJQrcM3KRBlBg2hOJSDtJTnwaJx1TdoBOT9j0OqPig4Zpa8MRGDKg54qrLNQ+j4wQ+13kDCu/AdeEw/72T52BmZWZh0FHAbaJYEOOoZFMVw1YMEh+Vf0cvM6ChRe+vmQ1+zXODqQfcgBXK73kj6GyvdHDUYXQ9KhwDsUde5dw9gN4Wc1zOPS+l361GfDZrP25wui9W/8EtdnO+YS1jjSfiZHdW3QUeKvEMhssYyfL4vNbHlFk9wruXA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=maAwAIjZNMJat2dKuF4E7YdBND+6xThXQlpXIiX8cuI=;
 b=TtRRJalssMYWTeaptjyFkSeaROCnkFw/5e7xHgjfaIdT9Wky+ASBjXhXHrAH0yo/D4Ab2HULVSpAsyEweqXO2VRTmhllASNruBqlkgUEz7V4rm3C0idv1BZYbTkKENU0lOFNJRSZ0wtFrLWeFIUmqkFnySN+TUVGSc/2211aTew=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=virtuozzo.com;
Received: from AM9PR08MB6737.eurprd08.prod.outlook.com (2603:10a6:20b:304::18)
 by VE1PR08MB4736.eurprd08.prod.outlook.com (2603:10a6:802:a6::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5017.26; Thu, 3 Mar
 2022 19:44:04 +0000
Received: from AM9PR08MB6737.eurprd08.prod.outlook.com
 ([fe80::4545:8e0c:19c7:2a6d]) by AM9PR08MB6737.eurprd08.prod.outlook.com
 ([fe80::4545:8e0c:19c7:2a6d%5]) with mapi id 15.20.5038.014; Thu, 3 Mar 2022
 19:44:04 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, armbru@redhat.com, fam@euphon.net,
 stefanha@redhat.com, eblake@redhat.com, hreitz@redhat.com,
 kwolf@redhat.com, vsementsov@virtuozzo.com, jsnow@redhat.com
Subject: [PATCH v6 00/16] Make image fleecing more usable
Date: Thu,  3 Mar 2022 20:43:33 +0100
Message-Id: <20220303194349.2304213-1-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.31.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: VE1PR03CA0038.eurprd03.prod.outlook.com
 (2603:10a6:803:118::27) To AM9PR08MB6737.eurprd08.prod.outlook.com
 (2603:10a6:20b:304::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 4e9ffadb-aa79-4ae7-cc43-08d9fd4e2c34
X-MS-TrafficTypeDiagnostic: VE1PR08MB4736:EE_
X-Microsoft-Antispam-PRVS: <VE1PR08MB4736671195E7B4D7CF88BF8CC1049@VE1PR08MB4736.eurprd08.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 8WXmEBBfMt/KLAuj3FTfgtLs8N5DUzYIEllDGUc2b9MnVmnS63BjMru8JVDYtKJNSaXnvhe/Tcu9eoKV8j/hmfz92o/tAqFWx1DfAJewT3VbjUhFnssS0uqLT+GmJmbc36ystAN7cdLqKX/Gb9qizjfMGJOHW8Qj2/J2cXivvOI50+rKdSasXrmBpVFqGWR0PezGxgo4RpN1NDNF8vqtqirdpcNfXM5GWwnJ6qnVPcS0fTEaYqQbr8PGZKUK2HvNjz1Q23TknvIay8YfU+57cYAn2e60PuThtDfSl2UccwaZIjg7PKjQ4me1QZUv77DEnEx1oRsgAG4DjCSaxK8C3pAyQD5xNc0Qi0pUAxop7qvYyHayUTDf1KRaCzQbqjg+tjAiBqRJrrqTpktv2301CzBOYJMWyptxCym7CuLmDzSBZ6y7mJgS0DqxcjFG8PaI8CrvHh+K0v22+ZVjTo8p1zgF0GEDQLZpqgGv+H3KPEGHOvnZQOADLxaLK0AQtzgrTWxHBrfoLyDj77E2UFsVxEnDsDUriQup7ZuNRZP0tRs5wRdwWUZ3FzeTpqpER0tQyArxA2gcIIZqwjdstLb6iFdA2RSWGCnz7+1rssRw1f43JTdKSx3tFDRB2Jo+IOjSRrHrx5RPF7GeykeWIZAKbge/RBQg49ANRKSmsF0iaSYVB1a3zb5TVGW/A8rNIiweMGXDDwMiAQTyzT4sJOA2MQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM9PR08MB6737.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(6506007)(6512007)(26005)(6486002)(6666004)(186003)(1076003)(2616005)(316002)(6916009)(508600001)(36756003)(4326008)(8676002)(66476007)(83380400001)(66556008)(66946007)(86362001)(8936002)(5660300002)(52116002)(38100700002)(2906002)(38350700002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?UCiv53h9+2W83GrRX1ijdwsKi48N/9HRQlTFitPLMkVIZZ62rb54+urndgBk?=
 =?us-ascii?Q?qoacSwX12vfwtFoAlJOzcpulw7IHcAWfTafJoGxetyQd3sWuwrnvHMtpMzRv?=
 =?us-ascii?Q?gpgposQIeG6hyc96YoduSAn/MjiIp5GsH98+t+zfugthZ8bAicvhFQf1/o6i?=
 =?us-ascii?Q?K0cVNzqjy+WsMNAQt6UFEjt678nfl8u0TiORe9mboFn/PqoXldH5K57I5YVu?=
 =?us-ascii?Q?mOrvgejyPDnLKPa/ZAvvbTMhFNUKHD1aL0h3NAM5bTt+gukBAQXvvIblZq3o?=
 =?us-ascii?Q?HIjXCTRxM5pPbXYSVVhp538MFIEntDmrutsSeD9WX07TizUjZovQPzvmyK7W?=
 =?us-ascii?Q?fc0QElCgREp4mEJNSfzsJjPaxVaiWAq22H7+ENvkt5ae3OSE6qetKNJutR4H?=
 =?us-ascii?Q?+GG0RYCmTfPOrBF84Lgrw7Kw55CrrluZ5pOqIrAZt8HGOTT4W6B53M4VIHDo?=
 =?us-ascii?Q?N16fvpRD6Wd8T3qnM5CkJtIFRQay3M9TMuQk9C5hZL1gzg9rtLqmPUDl1sxv?=
 =?us-ascii?Q?pauNNOoEqmHmKWaEDbeFuWQKFS7obLSncu5jITBuMC34lqXn+qDKPih6t8Ss?=
 =?us-ascii?Q?8F6IH4I0Z3uAwjkxgTrClc0+LJslYL+qarkcZMx3IFlwBAXdePJCo8xUiK+p?=
 =?us-ascii?Q?PklKDng+ipIC5544eCMWcMgXzmIpXrE6JGxU4dMrjCXXMJxRcA9s1MdkUmYl?=
 =?us-ascii?Q?H6mjvC02EEeAJF5FQ70VK39hpQrBABCu2NSduWIUo6Aof20Sw2U/k3GjCSxA?=
 =?us-ascii?Q?Lc8w3lcx/SOCmk1O8Tf615cT7c+XS/l3dTioH4gCBFtR2TehYdLxzuLcoXg+?=
 =?us-ascii?Q?A30pbltym+wfC6PJXXvHugp6HnZQPal17q5DLdMIJyrSD1bF3wcXZZ1/nhgX?=
 =?us-ascii?Q?hBMnyP1Wv1mFURPji42AgOUS1iW5LmM6pBvrLRRhFF5QHlBa9nep//yUO82R?=
 =?us-ascii?Q?CaAKDfv2imrQSy8e5O6uICBGlPZ18E0GHdKYzTiBpaOAtdmYGKSKA6ACjO9o?=
 =?us-ascii?Q?Lvkg8CDxGzfrevQXOdEOT6w9zMkPSjRz04XjqH5q03dT1HiD4axaEnrQcEKk?=
 =?us-ascii?Q?5h3TVRbP3MjWrYdxJt2sd9Ax04+2iJEIapf+W6zPbFl+v9j0sI7Mdv2FdDAs?=
 =?us-ascii?Q?o3GB0haJXo7rbNLvGuFw9V1T67lOFvAifBMfGIfZb7kEeGy6DAKy510ObKUY?=
 =?us-ascii?Q?Xhoo/MPWnoq65qgRCK2GdmGWGkNYSjvBGCmDSzBdfNM3gVGZ/otn9NQBDs2a?=
 =?us-ascii?Q?nEcUCrCdLGj/8DEGfawa2uQiHu8Mjqcdj8HWTq0Slibj7gd7lPZtbmwekXAh?=
 =?us-ascii?Q?3IbFQ6hq6EXVxDuLEb0EXHB3hLbSDGH53mftjahZ5LcR8+u0YSJ28JS0hP3Y?=
 =?us-ascii?Q?YSP/2cGVuGnD5UeUXt/kh0eFWXbHCJOWti+kWdr19X1roePqe3nBsvUt6Eu9?=
 =?us-ascii?Q?DmxFSL0oV14vzKGAvGSKKcQDRCmb4V/hBFni7eF2x7ZiaD9uZ2QeHs61NDGG?=
 =?us-ascii?Q?A/6YdqkAdoWbogU12XL3F+1gUN9iGsGCX27PzvLm8sa5L1t5qF+bumeUhs4E?=
 =?us-ascii?Q?9odhD9V+iBdh/wXqWvP5UVXbfGIwpid7SDiCvx4JcwEFBC6K0sgV2m1imyEH?=
 =?us-ascii?Q?BF3L02Y9EIlAeQNrR9PXVsXqFmSpKf8YrrqGA4ZhOc6z+L1RWnRRnXvqXo9v?=
 =?us-ascii?Q?PK5/Tg=3D=3D?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4e9ffadb-aa79-4ae7-cc43-08d9fd4e2c34
X-MS-Exchange-CrossTenant-AuthSource: AM9PR08MB6737.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Mar 2022 19:44:04.2303 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: w8zIG+8daxgDA6+qTG1hbsiwPcEbLFtdsFoSA/uMPVuEmJLmXuqTQdu7Rw7eOpGZL23eBgPRGba3DOlE0cK+bO0HQZPEb+pnO8h1jK/Msr8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR08MB4736
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a01:111:f400:7d00::72c
 (failed)
Received-SPF: pass client-ip=2a01:111:f400:7d00::72c;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR05-VI1-obe.outbound.protection.outlook.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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

v6:
11: add comment
15: limit to qcow2 with unsupported compat
    fix style
16: fix style
    change log('Backup finished ...') to assertion and comment

Vladimir Sementsov-Ogievskiy (16):
  block/block-copy: move copy_bitmap initialization to
    block_copy_state_new()
  block/dirty-bitmap: bdrv_merge_dirty_bitmap(): add return value
  block/block-copy: block_copy_state_new(): add bitmap parameter
  block/copy-before-write: add bitmap open parameter
  block/block-copy: add block_copy_reset()
  block: intoduce reqlist
  block/reqlist: reqlist_find_conflict(): use ranges_overlap()
  block/dirty-bitmap: introduce bdrv_dirty_bitmap_status()
  block/reqlist: add reqlist_wait_all()
  block/io: introduce block driver snapshot-access API
  block: introduce snapshot-access block driver
  block: copy-before-write: realize snapshot-access API
  iotests/image-fleecing: add test-case for fleecing format node
  iotests.py: add qemu_io_pipe_and_status()
  iotests/image-fleecing: add test case with bitmap
  iotests/image-fleecing: test push backup with fleecing

 qapi/block-core.json                        |  14 +-
 include/block/block-copy.h                  |   2 +
 include/block/block_int.h                   |  33 +++
 include/block/dirty-bitmap.h                |   4 +-
 include/block/reqlist.h                     |  75 ++++++
 include/qemu/hbitmap.h                      |  12 +
 block/block-copy.c                          | 150 +++++------
 block/copy-before-write.c                   | 265 +++++++++++++++++++-
 block/dirty-bitmap.c                        |  15 +-
 block/io.c                                  |  69 +++++
 block/monitor/bitmap-qmp-cmds.c             |   5 +-
 block/reqlist.c                             |  85 +++++++
 block/snapshot-access.c                     | 132 ++++++++++
 util/hbitmap.c                              |  33 +++
 MAINTAINERS                                 |   5 +-
 block/meson.build                           |   2 +
 tests/qemu-iotests/257.out                  | 224 +++++++++++++++++
 tests/qemu-iotests/iotests.py               |   3 +
 tests/qemu-iotests/tests/image-fleecing     | 185 +++++++++++---
 tests/qemu-iotests/tests/image-fleecing.out | 223 +++++++++++++++-
 20 files changed, 1394 insertions(+), 142 deletions(-)
 create mode 100644 include/block/reqlist.h
 create mode 100644 block/reqlist.c
 create mode 100644 block/snapshot-access.c

-- 
2.31.1


