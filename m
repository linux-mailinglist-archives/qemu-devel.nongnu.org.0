Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 190662EFFAF
	for <lists+qemu-devel@lfdr.de>; Sat,  9 Jan 2021 14:02:19 +0100 (CET)
Received: from localhost ([::1]:47156 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kyDso-000865-3W
	for lists+qemu-devel@lfdr.de; Sat, 09 Jan 2021 08:02:18 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:55274)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1kyDpR-00066i-04; Sat, 09 Jan 2021 07:58:50 -0500
Received: from mail-eopbgr60103.outbound.protection.outlook.com
 ([40.107.6.103]:49158 helo=EUR04-DB3-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1kyDpM-0003dJ-LC; Sat, 09 Jan 2021 07:58:48 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XBZaaO3JFbrNjuHSPpuLvbPbu0bx6fvoHIYyd5pc03C0uljpQb/WnTEDMd7Snv3K7bppqU0nluj6V6mOl0R+fGXYA6kX459cRE19ONnta+19nJq1XBDSQE1u46+uAMmBlbOfaQYFAn5e4/Z3BPDqRfLgD45/DV8B7KVzWrVFkBuun8SAlIIzxOQyzAKM5wkgzP1j8jzAbpuupwDS9xqV6M8PwVy0y6wP2k/gwfIKVJ/vS7n7V3uCIlZAku4rV6DcB/A3z9a6M2sBfy+g6ONTvKjEqv19Aq6C/WO0Yg0IQSiZ4T2QINxozMXZ2MHeypoIl94jHdT9MgDyz76yahzYxA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FzcAv+i/f9DQmRaT8RmMDGPW7uP1Do0TkGZ/TLG53FM=;
 b=Tq7YZ2h3LSF6hTJ2WvoCG2JnntEuRgjjfvMNI3hQJKv0eF+10yR1jtG+UYZYsQIKuquz71MSHWocAhYQq8wB9x5BnIhc9vQQEVPpNvBvsu0DV6HlueoaT2vKIwbakwOEU+F6hhMcc/tWBorWvQylax4r5AVwYNbrulL3IXgkzRf1TEJJ/RiZQc5hek1ixgUdUbVc936WIy4bNEJA7y1Qc+xNr1Er26+UarPjIhpk4ckkKSn5+x1Hu6xp44IHTQ5NIEiybHa4Gcf70QvX2T6K48SFLhydSLlJqi5DJBu8jtIk+DpI9fIIZXHafzSiUtzAy/+T33TyqPtC6PLBoEOK0Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FzcAv+i/f9DQmRaT8RmMDGPW7uP1Do0TkGZ/TLG53FM=;
 b=X7xu0CI9fKIjRrVImukEH49Vffj9x2YB/1oryupfcWw/qLb/ToTjTAhe3MrkU39fKDd3bWEpCo2qFxdIVv05hpsco1RLu9P1VnwjFN/EWfSQyXsfboLRqJvGF0L+IJ2WNCsIhxxh/rveT/rEpl4rNV4HftuTEI6eAWU0+EfS46U=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM5PR0802MB2418.eurprd08.prod.outlook.com (2603:10a6:203:9f::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3742.6; Sat, 9 Jan
 2021 12:58:40 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::214a:3545:368c:7ae8]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::214a:3545:368c:7ae8%7]) with mapi id 15.20.3742.011; Sat, 9 Jan 2021
 12:58:40 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Subject: [PATCH v5 00/14] block: deal with errp: part I
Date: Sat,  9 Jan 2021 15:57:57 +0300
Message-Id: <20210109125811.209870-1-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.29.2
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [185.215.60.119]
X-ClientProxiedBy: AM0PR04CA0053.eurprd04.prod.outlook.com
 (2603:10a6:208:1::30) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from kvm.sw.ru (185.215.60.119) by
 AM0PR04CA0053.eurprd04.prod.outlook.com (2603:10a6:208:1::30) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3742.6 via Frontend Transport; Sat, 9 Jan 2021 12:58:39 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: affd69c6-5c2b-4f96-57eb-08d8b49e495d
X-MS-TrafficTypeDiagnostic: AM5PR0802MB2418:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM5PR0802MB2418678E942EBD0AE3716B0AC1AD0@AM5PR0802MB2418.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:16;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: JNC44az6ApuL/VV6XFsR0mBaEj7coETD8dtnhNwzNI5AQFt07DpoAD8NGyMAzLPJbPEMpuM2eAM5EEbjRJkwa02JKI+vn0KGq8FzcHufyco5STLNNQXXooZ17N0oupf19IoDhLQFxhnqTE48sACOD4rlcdzsCGZtmTsoQ1eVeuyayKZ2o3+nMFooEAoNzi4JpkoISGsC6ZLzJEjoFUW6opa7TUdx+HVQ/K5ETzwhi2TmgRaHzL5hAwGELAAAZ0QZpgJNr72J/WyC9arkOdD7ZrJwYtZ4tQ8DPUoGcgCuevbnH1wzzoAkXmqm/IPgxzuq+u+1vpBsrF8uy+A8D65Vh7Yhd5vK4yeX/KLs4aye+5aqXJcudG0Q3TqChP/2iYxqxKufamMpCO5uz9pTLRIpXQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(136003)(346002)(396003)(376002)(39840400004)(956004)(2616005)(66946007)(478600001)(8676002)(5660300002)(66476007)(66556008)(6916009)(83380400001)(52116002)(2906002)(6666004)(8936002)(1076003)(6506007)(316002)(26005)(4326008)(186003)(16526019)(7416002)(36756003)(6512007)(6486002)(86362001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?GT/DTGDrEspPGD/v9vPloyNAv65NISkjZZ7OitMk0d3A3squj34D+fHklveN?=
 =?us-ascii?Q?xzt38h4+HLCpgFc5oUge4oDZlEyLt8wp2FKOWT+LU1dmc454TKh0iFJlgVUk?=
 =?us-ascii?Q?CNNJocI1VG028LDZ/s7jPpbCMIMuHR6IufXKCNpSwoGnrjUwYHAgKqj0mEUV?=
 =?us-ascii?Q?0sdpcI6WJi9nSaHBCzq6WuP3QiOK7xsuwsJgQ5Dm/eK7FS1sdgDNQUGxC2UX?=
 =?us-ascii?Q?NNZt8X6MBqP7xu8xYH2bnBFX49RAHkQrXXGoXRSiLJG1cnn8/fnnIK5AKxqf?=
 =?us-ascii?Q?DLWrDK8lVMzlzxmwknKCloQzp6sBLjAWQQC3HqmTBJA2GGHYQV70rRW8ILh+?=
 =?us-ascii?Q?gnbjqfk2Tg+SWmvvrXwpUrJILqrnG8prWTOP9fj8zJdL6ffgZ0SmTPIgMRjF?=
 =?us-ascii?Q?o97F7MxSSsVwUXfMoEk3LVFpbCX6Yy2DAI08i1BhvACxF9cZEMGzl/e8sxbY?=
 =?us-ascii?Q?pDqD0FZK4djd4RL5Jm59eSJbId3J8rFpKHxVK95DZqvS1XE01qGMG66t6SLW?=
 =?us-ascii?Q?2gsaJPH0VwvGjC7tQz1tcF0RBK1CUpPrtEiTh1xoXNDiz60UE+YqCitLIeTz?=
 =?us-ascii?Q?MhcQxQ2xTMjVrscKx0xkQvz2UMJ6tN40zD6+wcq+Gj12dqUM71T8Io5ejsqV?=
 =?us-ascii?Q?VqNgCEhacEECbSgimhKF0wKLMqsB3cUV5jcLlwXP773H0A5CPtNsJeUNQQFj?=
 =?us-ascii?Q?mMuW9jJi7arXaZqvlNQz4Fx3rebvcqW1+02dv1/Yqmuq+W0c1SGyxvYNClls?=
 =?us-ascii?Q?5eR9QbmNhQwAHW6lzAmWQbcE0KUCo4YHW2kpms6jLV8JEgXgqCArzzzDbtCG?=
 =?us-ascii?Q?RLDd6ZgDhrDF9JwXIVes7BBl4WqajYMlLsLG1r1pts93nal68ss6hAZExO1J?=
 =?us-ascii?Q?VHcoQRj6RvehAHqa5WGOTmY8JkEhvUGjlKX9viHRHwoU17CVvWgjwARs2lCC?=
 =?us-ascii?Q?D2X0gPxAwmFro8W3GTkKxOvKNvz7N8N4lyp8+4F7C6oqrwyjogji0R1560zB?=
 =?us-ascii?Q?Bcmi?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jan 2021 12:58:40.0566 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-Network-Message-Id: affd69c6-5c2b-4f96-57eb-08d8b49e495d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: PWAnj5KVRbgxo5GTIeQWY07IX5H8rYXsRP1UnR36faptzkgTwvLURRtUdyqwSqszLnyWEFBUj0Yj+cG3qJEow0zaNrs1b10DxoWFQGhu5dw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM5PR0802MB2418
Received-SPF: pass client-ip=40.107.6.103;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR04-DB3-obe.outbound.protection.outlook.com
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

v5: rebase on master

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
 block.c                     | 69 ++++++++++++++++++++++---------------
 block/backup-top.c          | 23 ++++++-------
 block/blkdebug.c            |  6 ++--
 block/blklogwrites.c        | 10 +++---
 block/blkreplay.c           |  6 ++--
 block/blkverify.c           | 11 +++---
 block/commit.c              |  6 ++--
 block/mirror.c              | 18 ++++------
 block/qcow2-bitmap.c        | 67 ++++++++++++++++++-----------------
 block/qcow2.c               | 64 +++++++++++++++-------------------
 block/qed.c                 | 24 ++++++++-----
 block/quorum.c              |  6 ++--
 blockdev.c                  | 10 +++---
 blockjob.c                  | 18 +++++-----
 tests/test-bdrv-graph-mod.c |  6 ++--
 18 files changed, 180 insertions(+), 187 deletions(-)

-- 
2.29.2


