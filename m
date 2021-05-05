Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A386A3735DA
	for <lists+qemu-devel@lfdr.de>; Wed,  5 May 2021 09:52:55 +0200 (CEST)
Received: from localhost ([::1]:42642 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1leCL0-0007B9-NM
	for lists+qemu-devel@lfdr.de; Wed, 05 May 2021 03:52:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55468)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1leCIg-0005EN-D2; Wed, 05 May 2021 03:50:31 -0400
Received: from mail-eopbgr80109.outbound.protection.outlook.com
 ([40.107.8.109]:41697 helo=EUR04-VI1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1leCId-0002WS-EA; Wed, 05 May 2021 03:50:29 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ejnvME/xzRj11hS3kcYHpTquH9RoJcTF1j6oZZrIJEB8O7QWBPiNaaHgCIzNvCZhxyCU8IbywS2H817gX+m4Z4RIWl+Biu110fB/g2gHWl+z5UtSblvReSgAMtQG2M9Vi0X2pzKyQp3xcqOFI3J9ScEHFHhNR/GSquMQ00DYw5lcuSLaukhs7v2TPvlLxi0nI954urQMCEQ0J0s33K7ZuN+WNW47G/neD61WppQOqGi4X0h0SaeH3tDGX+OtxfHigUTeTqNsXhEA2ZrLDCxoWiWTzEQw3lrxE2ei2ONhOCBIkWFo5YzotUH7pUGkhAraCvtG6vk9dnZUXG8rRFQDRg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=p3RIbNJgXfnWkRd5Dma/YLR3FhINg7PIi5yxzgzz4CQ=;
 b=V7VaCEZ+PnsGazZbZIVTRnR6mJ4fjbnhTQSHYWLIaqJsaX+pzAMnx44Q/Yn0eRwqOFl/oKlMtJLIOm604VXL1X7u7bfdYtFbnHvrN7NeOP/NePWhgjDDu0tpPL9TkcIuV5HWHLiO9Z9JPnJKnBszhGKoYdZy3QPQuq37UR5nNvacGgyh/d1S3xz9ftiVvI7+Lz6jGyLZVZ8/vuXaNQrAEM0rcbPWGqzgZcPXqwGKEyKDP5BlwvmymTTBV4sCQsWY3H8YWHPQcnFt+UkDLKkiHsTccNohoisQ1i/feEjZR4g9HNr/57Y/6GEtcfljoD9c47ClTp0y2EXAEBpQ0Fchgg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=p3RIbNJgXfnWkRd5Dma/YLR3FhINg7PIi5yxzgzz4CQ=;
 b=hzR7d5s/psg8/RtcPTN3OWIa0MeCBV0eckywQzLb5P8FUlqNTIK4XsXhtBNjqyQYplfhkgmfTmm5YYa3Ps6z9wZY/DVBneBrT5co9vjILn2YUolU+AsDKBUL/KW2p7wfTBy8yCZv0rUSCQtizgrI2VT3qEBknrusSFIsdaPpxKc=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AS8PR08MB6839.eurprd08.prod.outlook.com (2603:10a6:20b:352::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4087.39; Wed, 5 May
 2021 07:50:23 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::b403:c1a9:6bb7:133]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::b403:c1a9:6bb7:133%7]) with mapi id 15.20.4108.026; Wed, 5 May 2021
 07:50:23 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, eblake@redhat.com, stefanha@redhat.com,
 kwolf@redhat.com, mreitz@redhat.com, vsementsov@virtuozzo.com,
 John Snow <jsnow@redhat.com>, Ari Sundholm <ari@tuxera.com>,
 Pavel Dovgalyuk <pavel.dovgaluk@ispras.ru>,
 Paolo Bonzini <pbonzini@redhat.com>, Stefan Weil <sw@weilnetz.de>,
 Fam Zheng <fam@euphon.net>, Ronnie Sahlberg <ronniesahlberg@gmail.com>,
 Peter Lieven <pl@kamp.de>, Alberto Garcia <berto@igalia.com>,
 Jason Dillaman <dillaman@redhat.com>, Liu Yuan <namei.unix@gmail.com>,
 integration@gluster.org
Subject: [PATCH v5 00/11] 64bit block-layer: part II
Date: Wed,  5 May 2021 10:49:50 +0300
Message-Id: <20210505075001.45041-1-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.29.2
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [185.215.60.236]
X-ClientProxiedBy: HE1P195CA0024.EURP195.PROD.OUTLOOK.COM (2603:10a6:3:fd::34)
 To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (185.215.60.236) by
 HE1P195CA0024.EURP195.PROD.OUTLOOK.COM (2603:10a6:3:fd::34) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4108.25 via Frontend Transport; Wed, 5 May 2021 07:50:22 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 6c3e1f6d-2848-4b30-304a-08d90f9a708d
X-MS-TrafficTypeDiagnostic: AS8PR08MB6839:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AS8PR08MB6839A68969FB9DBC56CDA9FBC1599@AS8PR08MB6839.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1227;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: LXniU8OM0dptnMuwLgGgzhWWmXpX2cyxLuRuc6+hvn5bo3aZ8c5apmYSFdvg5qtgVYXN3oAGQ+b/gvNOZQKHCJMLSfJhexLwoo67ZyePOO1316v8DiLFjSjbxn0vsoQZHCQsHkAMP6eZ3qZiLRcij4RyPOGzJS81bReLfWODBr57nRJyJovgpbrIv7ZFP1LTEuJNTgkR9TKJcHzayDu4VD+7+/go/KbjAxOWy/rOJvziKx0dt7bueMgJhGiH+lYZFaWq5o4tq0np1VMrSoDkA/sxe7gsMkifWJN+vb6I28v+FIo0eI0WSpDbcESyVHHzI9NcoX8svr+uCFcZrl2qwBf40IecCR/Xfjt3gpOemRE6xU4eFi5OKRWCjmgLgFW+WBGXbtxJeFISzPXVQZNU1Z+xHjJnstSl3saDmeMx5tClMEsGC+RlkKiUsYvTNuazDq3PrKGuxk63cHD7ekkqtt9gr4/omtpyHaIqUwKYtJhihMPcxycOTehE580l5FOXZxQcKaqnIW29Hsg7KPQyw/X4bXNi1obl5bHWBcqyQ4UlwPqbIajOnFlMXc3sxZCWmAvyYz5c76hU2LK9E0OzpkudZ5pOl8vI+Zj2ZvkU7Wq47Cx/JwlWJSLEkXixbO19WrwY3Q4BmViuVF30QKzCczMfs3drD9D9/Rkpptbt6KCkO75XQouOnbUTKJ4ODsv+
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(39840400004)(376002)(346002)(396003)(366004)(136003)(38350700002)(38100700002)(66946007)(26005)(66556008)(6506007)(66476007)(86362001)(16526019)(83380400001)(6666004)(7416002)(54906003)(6916009)(4326008)(36756003)(478600001)(316002)(8676002)(6512007)(2616005)(2906002)(186003)(52116002)(956004)(6486002)(8936002)(5660300002)(1076003)(69590400013);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?+s/3Ho4qcO1HloogLdSN4ab2oMCB9V5rZYkjRXgQqPo+bblweRpy2V1b43GJ?=
 =?us-ascii?Q?JeDhtHJvtdndLANX4Riekk1xeMVyvRL5J5H4sceDO8APYccTlLVRhv9YDmnO?=
 =?us-ascii?Q?Kf8k5qFxMWjKbAi8nWuE3tAPkYwweG1CPjXg8dZTLVetb3f/36TKGggdUybN?=
 =?us-ascii?Q?BU3OewnF/xKTT7Sy9zRAozt/V/YOXd9+Ad6H9lsE3xBvezo7jIZYX84UpIaN?=
 =?us-ascii?Q?o7eF2Fklpy3Dznwxbf/KY8ajfalmaTpYKTiKAUIP19tQZir9sn9bhNAEiMP9?=
 =?us-ascii?Q?Ndcjy7nd9mGGO1YFWrowqkxcSvn4uDVp7F1Gd9lN5EzJIeOe4Ymu6Av6BVB1?=
 =?us-ascii?Q?lSzvjpDZZHhvT4aS7UkKPgID25cm6M/wAOYBIf24MuqG26cVrASZR41Ko3px?=
 =?us-ascii?Q?rEy0/v2l4KAenO2h/wkDx3fTIhrcWIojAe1NLEsCPAdkdOGgkwZHun8Km/Jf?=
 =?us-ascii?Q?Oz7jGD43gJAYo+M9MB4RaCztdUHeWcePZwbesjYQlIIXlGTSxNybHu6x87o4?=
 =?us-ascii?Q?EhiAVQHPHDCygKEoUahxnZ9aIR5Rs0Mbn6tK5taSFQc9QdFIIQHWbUpWBVmB?=
 =?us-ascii?Q?Nk809DWKo+CruSJ0VGwqqrNYEHYgBnh1ckXUskbH9SxWy4SC32ABIRdUkSw3?=
 =?us-ascii?Q?ZmcYKRT3BMNK6Qs3II1PqKuA8rM4PNxnyBYAgmTlTPoc6lzgb37W2ISXvWY3?=
 =?us-ascii?Q?kpSk+3uN4Wvqx2fLdllxGBSj5eMW35n59IpPw/KANwB1QBNIfkn4jbzXK4vc?=
 =?us-ascii?Q?FBs+DET5sUAdGgFONR2wZBR5gz3/mFH2IyAzjfFRcD+bUbFM66UuDeO6gfyH?=
 =?us-ascii?Q?BdkUkWabQD58K7BlXq+an3tk3daeAXtMJD8v/ln5wfQo20UTXtkOU8j2j3AJ?=
 =?us-ascii?Q?ZwpYE2KnvX8megouByJId/xKPXmVoAOFDQmvnVT/gU735kTewlqkqqzF6Fav?=
 =?us-ascii?Q?q5/H8wcziYhTJnDBXcvNhHI9WU4UWe/yswXpI89atRk6R+YlRw4QKzIeKxPD?=
 =?us-ascii?Q?aqGDjNZrW0NVfCv4XGHzj46pJxFUCmAQu2pAXWYm1AaCPDGzhrBNN3jnG8Lu?=
 =?us-ascii?Q?9hL+dGLIWpiPwnVPkXWeaiVTD27bTzH8sOQqdDHSTWgYF1BtLFHKHcwrLpHk?=
 =?us-ascii?Q?Bz+792Q+fnqQsyj4XnvxpYqvWeo1qHWXRqJVo6G7zxLIGmYD1iHSUUT5HYhz?=
 =?us-ascii?Q?mvgizpENY+ibPNfi3s5HIR/RugRIb7OCk94I4Ldk/vOLb2nOVWPqY9ErAkD2?=
 =?us-ascii?Q?3ErcFFlzY5RfGvgk0lXHmmc/iip5BXcY2h2yZhAppQxPmFJFU/VAhIH3jEZ5?=
 =?us-ascii?Q?KI6H2feiJptNbNck8TRXujr8?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6c3e1f6d-2848-4b30-304a-08d90f9a708d
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 May 2021 07:50:23.8711 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: pnojnOvO6i5Iz63wUaePicLvNSpPRr+ePOdhW7S+pHdqFTwVNc9rEywMURkDsEKBHvYPRiVKslq/XzanzFePqudQNm4ofL2m09S/zzUsktc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB6839
Received-SPF: pass client-ip=40.107.8.109;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR04-VI1-obe.outbound.protection.outlook.com
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

v5: rebase on master, fix block comments style and over-80 line.
01: s/{}/()/ in subject, so that email not to be mangled.

part II aims to update block drivers to int64_t.

I remind that main aim of this update of the whole block-layer to 64bit
is to implement 64bit write-zeroes NBD request.

Vladimir Sementsov-Ogievskiy (11):
  block/io: bring request check to bdrv_co_(read,write)v_vmstate
  qcow2: check request on vmstate save/load path
  block: use int64_t instead of uint64_t in driver read handlers
  block: use int64_t instead of uint64_t in driver write handlers
  block: use int64_t instead of uint64_t in copy_range driver handlers
  block: make BlockLimits::max_pwrite_zeroes 64bit
  block: use int64_t instead of int in driver write_zeroes handlers
  block/io: allow 64bit write-zeroes requests
  block: make BlockLimits::max_pdiscard 64bit
  block: use int64_t instead of int in driver discard handlers
  block/io: allow 64bit discard requests

 include/block/block_int.h        | 66 ++++++++++++++++--------------
 block/backup-top.c               | 14 +++----
 block/blkdebug.c                 | 12 +++---
 block/blklogwrites.c             | 16 ++++----
 block/blkreplay.c                |  8 ++--
 block/blkverify.c                |  8 ++--
 block/bochs.c                    |  4 +-
 block/cloop.c                    |  4 +-
 block/commit.c                   |  2 +-
 block/copy-on-read.c             | 19 +++++----
 block/crypto.c                   |  8 ++--
 block/curl.c                     |  3 +-
 block/dmg.c                      |  4 +-
 block/file-posix.c               | 35 ++++++++--------
 block/file-win32.c               |  8 ++--
 block/filter-compress.c          | 15 +++----
 block/gluster.c                  | 13 +++---
 block/io.c                       | 44 +++++++++++++++-----
 block/iscsi.c                    | 53 ++++++++++++++----------
 block/mirror.c                   |  8 ++--
 block/nbd.c                      | 22 ++++++----
 block/nfs.c                      | 12 +++---
 block/null.c                     | 18 ++++----
 block/nvme.c                     | 48 ++++++++++++++++++----
 block/preallocate.c              | 14 +++----
 block/qcow.c                     | 16 ++++----
 block/qcow2-cluster.c            | 14 ++++++-
 block/qcow2.c                    | 70 +++++++++++++++++++++++---------
 block/qed.c                      |  9 +++-
 block/quorum.c                   | 11 ++---
 block/raw-format.c               | 36 ++++++++--------
 block/rbd.c                      | 10 +++--
 block/sheepdog.c                 | 15 ++++++-
 block/throttle.c                 | 18 ++++----
 block/vdi.c                      |  8 ++--
 block/vmdk.c                     | 14 +++----
 block/vpc.c                      |  8 ++--
 block/vvfat.c                    | 12 +++---
 tests/unit/test-bdrv-drain.c     | 16 ++++----
 tests/unit/test-block-iothread.c | 21 +++++++---
 block/trace-events               | 10 ++---
 41 files changed, 456 insertions(+), 290 deletions(-)


Cc: John Snow <jsnow@redhat.com>
Cc: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Cc: Kevin Wolf <kwolf@redhat.com>
Cc: Max Reitz <mreitz@redhat.com>
Cc: Ari Sundholm <ari@tuxera.com>
Cc: Pavel Dovgalyuk <pavel.dovgaluk@ispras.ru>
Cc: Paolo Bonzini <pbonzini@redhat.com>
Cc: Stefan Hajnoczi <stefanha@redhat.com>
Cc: Stefan Weil <sw@weilnetz.de>
Cc: Fam Zheng <fam@euphon.net>
Cc: Ronnie Sahlberg <ronniesahlberg@gmail.com>
Cc: Peter Lieven <pl@kamp.de>
Cc: Eric Blake <eblake@redhat.com>
Cc: Alberto Garcia <berto@igalia.com>
Cc: Jason Dillaman <dillaman@redhat.com>
Cc: Liu Yuan <namei.unix@gmail.com>
Cc: qemu-block@nongnu.org
Cc: integration@gluster.org

-- 
2.29.2


