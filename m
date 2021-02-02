Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C952130BEBE
	for <lists+qemu-devel@lfdr.de>; Tue,  2 Feb 2021 13:53:21 +0100 (CET)
Received: from localhost ([::1]:46774 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l6vBH-0004K9-3T
	for lists+qemu-devel@lfdr.de; Tue, 02 Feb 2021 07:53:20 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:46728)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1l6v8e-000135-Fd; Tue, 02 Feb 2021 07:50:36 -0500
Received: from mail-db8eur05on2116.outbound.protection.outlook.com
 ([40.107.20.116]:34912 helo=EUR05-DB8-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1l6v8c-0001pd-Gi; Tue, 02 Feb 2021 07:50:36 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=g9KO3acb3rNt4ZJHIL7LN8/qNhP0GlFeRtsFyNZpIV1v04GIF+Y+SgKNUseFMxjlHmum3kLdiFxVovvAF+eZdgRgPk+VrrfbN8jMeZ9g025fA1Pe4gqE7RcwHVcmrwkIj/PWFNjXQLpqfy/SqlkZm1ZraxR1UWo8r3ZKAPhC9PSuQQ0Q5xsoRTPmOalypWU6iLTP+B0f2o4yYd4HY0P1uMfaLr0NZX0tkJU03xU9Lf0BDWi3h1AAoO2211dfhvVcmE0RaLXrU14WOFGabXJcQHuUKn0Q9D0huFRrMwEVtFcQ+sbvF/CuY1qkpjRO5apsPsZq8K6UlNL/y96Nbfa8BA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CiP9JxoM2xXK/+I/+lv6isRYnK14FEbG10oWZyYNFBI=;
 b=RMg5/u3PC6QMAp7qefWe7mUbILncl3YWUbh0cRcEe10rAweMfjM1CouoTmyfv7u0Mfb4Uw1EGJ6k3YXAFPeIkpeCHgY3nluucsHpOtcCAbqNdNWXDjfutFpxVksa7cISXXlo445CFHfZQJgVoAixANd4TYajGjIk1h+xZy87U7Wo8+EtKg8k+FT+RYQbKr4t/mUIQv1lSVolu3FEk4nwIcLckeraxcHI83DPCDN7TJTimaLNnBr+iA1LEKhVYLxkRibYpA4sZ5nshW24PeCPJd7iWwHvsitSXzOeHeV+wpJn8YeRvNkxXUZ+bMehAyCFeyhtO2ZY1Va0ld8xyqTSWw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CiP9JxoM2xXK/+I/+lv6isRYnK14FEbG10oWZyYNFBI=;
 b=IkyV7tK5uGNU4MZki29QKAOFk3HDXebpSSWOrfcCq9cpJKkCe7or1OH9UGjUwDLOfVfaNrijwl821yvqjuaA7E10fOjuIqAmm6qjz2o9uQAgCywZWuE8cq8EtlTrqoDAnAYwR7k+cxh9jvoCmWeMegoxr0Q+fgJ0tyYqdouxmZM=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM6PR08MB3544.eurprd08.prod.outlook.com (2603:10a6:20b:4e::30)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3805.17; Tue, 2 Feb
 2021 12:50:31 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::f1f0:6610:11f5:5e4a]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::f1f0:6610:11f5:5e4a%8]) with mapi id 15.20.3805.028; Tue, 2 Feb 2021
 12:50:31 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Subject: [PATCH v7 00/14] block: deal with errp: part I
Date: Tue,  2 Feb 2021 15:49:42 +0300
Message-Id: <20210202124956.63146-1-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.29.2
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [185.215.60.137]
X-ClientProxiedBy: AM0PR02CA0002.eurprd02.prod.outlook.com
 (2603:10a6:208:3e::15) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from kvm.sw.ru (185.215.60.137) by
 AM0PR02CA0002.eurprd02.prod.outlook.com (2603:10a6:208:3e::15) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3825.17 via Frontend Transport; Tue, 2 Feb 2021 12:50:30 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 209124fe-b37b-4164-31dc-08d8c7791fee
X-MS-TrafficTypeDiagnostic: AM6PR08MB3544:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM6PR08MB3544BBC20F9A153E426EDA5EC1B59@AM6PR08MB3544.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:15;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: IPU6aa2ScjKKrMn+jC8f8ZzcfQJBrGVVJwqQgOtVnS0O6PiWZtSrH0ensrtJ/aYV2Gh+YFjXtavSLBvxmqCRZayhYcreVHuUeGQW+ml9vxBoE0KR47pYLMaKDI/Gr959fWhH2Jv33RwoofGqvPX9I8nEKVGtsJNpt5DKACIVmsbbtl2ZDASzHqiVm3SLDCXGSK/jv9F9mA6xWwew935kkZz4lqTckyCb/06BAiDxasplQId5XoVwBFHZgQW6drWQyrUHKnQuw2ZZPBc8AjOpvmp5lD54H7eOs2FgUqj0/ZRs0bqZXq4rbG0biWmHALEd9PEOe911XQOH4nZiqkI2rI/DHI2qoeFYZsOTA37wsrGcbZYpvjRFupxV/x37qe0HTb/c34ybDs9tW6dqPQv3zVkJCgXc/4/ADxhn0Z8QNSGqyk6arwmvwGwRYqQKVEcBPftYKrmSiHd48OxXKy/Ok9Or/kgjwxJ935RIsfCiQs2ra2AwP6zhYneqbmzuchkEG/qJcNV7Me0YTvM/bJMmsg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(396003)(346002)(39850400004)(136003)(366004)(376002)(478600001)(956004)(186003)(26005)(86362001)(4326008)(5660300002)(83380400001)(8936002)(6506007)(8676002)(66476007)(2906002)(6916009)(2616005)(1076003)(66946007)(66556008)(6666004)(316002)(36756003)(7416002)(52116002)(6486002)(16526019)(6512007);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?8SKFamFxPW/rx93W0BfY4JafL+s+aBeT4w/RhiyvrAOEIPwKziNISduRVY8v?=
 =?us-ascii?Q?cMt/QZkiqMhDKQS3qxnBoN3xsJfGSvnK8bSa6CTr67AzUej6vyqEEJ9AzOTL?=
 =?us-ascii?Q?VlmK4ogPh60u355lSnaiqZK6274n8rP31bVTIfUZC9zj5nIpZVdi+zu5aPJ3?=
 =?us-ascii?Q?GWpaWbJ0Li/yb5VYS75Vuppji0VGYdCu3EcT09VkiY5ilAZzYC2W8fkhi8xf?=
 =?us-ascii?Q?zcfjhD5lSjAd9HED/PySh1Ph6hXBBPRUgBX9zkZVUaCUm8xzs1ARwhsSzmyC?=
 =?us-ascii?Q?PpmYYQ1e2oZ8a4FYSWk2Na298FeiweazvxHGz7akpEp5G04tpyIBEC1cliff?=
 =?us-ascii?Q?qmoc72Iwqs/I94CRn9x0j7xfmk0a6fMukqWdiNl30VN0vxkTNhLoJ/HCa3yW?=
 =?us-ascii?Q?dCMlNzcn6V9T0LA4xunb4n+l8+wpF27BzW5m0iqrXDqcsZGjYBkBBXzRCc2k?=
 =?us-ascii?Q?C2FShKJOj7Ll6uxHVrUDwIswC2YA+O/0u8P/L6APi69QWe5LoNYKzZUTLJgf?=
 =?us-ascii?Q?nXVHJatvrvdQhMqCbE/xZ/5nh/0/tGZ4ka2HvJMV3a6IjPlyZeY0vrRsv85v?=
 =?us-ascii?Q?K2lQhHWbOPtkGPLS3BZPebVLMq0MnG3LbP/hNfNaQjlxnLFgtxMG/fLplDba?=
 =?us-ascii?Q?dkdokVDNyuo3XrQN78sVxs3xWYXi4LUuCMCfEk4dFBXttxw5Mp3gzH+llBn7?=
 =?us-ascii?Q?PnyQVAQ4DC+9PEAYQTOKasE95xvEVWNpiN86YdXvQXOpLkyKuQ4N2cZ0JPIn?=
 =?us-ascii?Q?f+D0wTmCa4prfXm2S4bexmrBytoprQo6EXAq251bJi8rYALL5O9e8Aclw4XL?=
 =?us-ascii?Q?yzF1e+nHaQBGmXt54fHkszUMS1wVewlgcu8ZAs+1JyWUj4j9UZ8X/art2Gp5?=
 =?us-ascii?Q?1fk0pUkEbgCvsApex4b60uC02l8q5F+ueT9mhUu6Kh0MNtAJmtwVs/FozR0c?=
 =?us-ascii?Q?FQa5FhA6q1NhqeFnsc8Ax2lafNi6bUToQ3OQD/jZSWHPPnxhi+1+Jxdm+YJ8?=
 =?us-ascii?Q?ApzncCQlzIq8xgXEDcPHpWK+CKurI9MMaIfvUvjsn8edA25o6zPr6Me20dAF?=
 =?us-ascii?Q?AOTZw/bi?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 209124fe-b37b-4164-31dc-08d8c7791fee
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Feb 2021 12:50:31.5252 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Y7WRZvohHzuaaXPHPFycs1ZGj5ousHQDm9q2XlH2nCcjP/aQYY1271RtS2hjJL43/RM+bADdGuS4IYkb3pUof+J2SQkbKV6qKZ47Q6XQZ9o=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB3544
Received-SPF: pass client-ip=40.107.20.116;
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
Cc: kwolf@redhat.com, vsementsov@virtuozzo.com, berto@igalia.com,
 pavel.dovgaluk@ispras.ru, qemu-devel@nongnu.org, armbru@redhat.com,
 stefanha@redhat.com, pbonzini@redhat.com, mreitz@redhat.com, jsnow@redhat.com,
 ari@tuxera.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

v7:
08: rebase onto QAPI_LIST_APPEND used, drop r-b

Vladimir Sementsov-Ogievskiy (14):
  block: return status from bdrv_append and friends
  block: use return status of bdrv_append()
  block: check return value of bdrv_open_child and drop error
    propagation
  blockdev: fix drive_backup_prepare() missed error
  block: drop extra error propagation for bdrv_set_backing_hd
  block/mirror: drop extra error propagation in commit_active_start()
  blockjob: return status from block_job_set_speed()
  block/qcow2: qcow2_get_specific_info(): drop error propagation
  block/qcow2-bitmap: improve qcow2_load_dirty_bitmaps() interface
  block/qcow2-bitmap: return status from
    qcow2_store_persistent_dirty_bitmaps
  block/qcow2: read_cache_sizes: return status value
  block/qcow2: simplify qcow2_co_invalidate_cache()
  block/qed: bdrv_qed_do_open: deal with errp
  block/qcow2: refactor qcow2_update_options_prepare error paths

 block/qcow2.h               |  9 ++---
 include/block/block.h       | 12 +++----
 include/block/blockjob.h    |  2 +-
 block.c                     | 70 ++++++++++++++++++++++---------------
 block/backup-top.c          | 23 ++++++------
 block/blkdebug.c            |  6 ++--
 block/blklogwrites.c        | 10 +++---
 block/blkreplay.c           |  6 ++--
 block/blkverify.c           | 11 +++---
 block/commit.c              |  6 ++--
 block/mirror.c              | 18 ++++------
 block/qcow2-bitmap.c        | 65 ++++++++++++++++++----------------
 block/qcow2.c               | 64 +++++++++++++++------------------
 block/qed.c                 | 24 ++++++++-----
 block/quorum.c              |  6 ++--
 blockdev.c                  | 10 +++---
 blockjob.c                  | 18 +++++-----
 tests/test-bdrv-graph-mod.c |  6 ++--
 18 files changed, 179 insertions(+), 187 deletions(-)

-- 
2.29.2


