Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C1BB397879
	for <lists+qemu-devel@lfdr.de>; Tue,  1 Jun 2021 18:52:54 +0200 (CEST)
Received: from localhost ([::1]:52076 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lo7dN-0004xA-CI
	for lists+qemu-devel@lfdr.de; Tue, 01 Jun 2021 12:52:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47694)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lo7be-0001pc-T5; Tue, 01 Jun 2021 12:51:06 -0400
Received: from mail-am6eur05on2127.outbound.protection.outlook.com
 ([40.107.22.127]:14240 helo=EUR05-AM6-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lo7bb-0002Cd-W8; Tue, 01 Jun 2021 12:51:06 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VkG+KMSb5i0rWcplhE9QaJSYurh/P8TpBALQLqTQ6PDvW2aiYztkGP3qVGZgtY5NUvLjhlEw0KaZKNb6pBi0hnNcabXQVHTqltzte+wOTENfaJOyySbgh/9O+t+YnPGbczJ7LWY2UFr560yDwRRdmHY/Fxo13R+5RmW7xJW5JywqVKxxiN8bePld63ziqMRuoLWbxUQFGEgpNRIUnJZ+dPKl7JI4XUZVe88GAi2DmsvQT4hkaZyghCmTLFIr5fXpj1yx1In8Ks90DxUi9RtDZrW0bRfMv+raQnzbrZPu+D7v4EIp3U/xePUc7W0Gz43jV7zCMqmO77hLpoDtsHcJUg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GcDmkRP6T7exeOjoWL2xQA2aYy/2vOsfdDVeTK8LJ8w=;
 b=JJuDtDekWHwDuFmX/v9Bx4+hOb79sQeIu5jYXa67REriNG9fXK6Lc0CV+8WtcxcZWFWLR1Ym/oObwxb8eyhXHMgYZg9EK3QMDfokJwSICEcIB8RbCjzJb+gJMJ85x/ZCGrylsHvmHLGYQ5m8n8aWv+iVfb4djPxeTDe/G+9p2rzsmuqqjgbE0glQR0qoQjVdATeh+KbnKHUPe5iVFT9HdtL5pKQLSBHTGRoCSjMpSmzIS0yxulT0avRvwMDXDT/PhjboIoAOhEFcU+S4D0oZdWG56DXOWlJisyuY1oFMB/mgERCS8tVMPeJTlAn1GcYtpBoBixKRDNw7KUvKlMDY+Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GcDmkRP6T7exeOjoWL2xQA2aYy/2vOsfdDVeTK8LJ8w=;
 b=gVa0XDxqadQqZw85sTOy+LC5RGvAYhix54blLWWh7g77vSs3hWmoNvx19cecW34MkwABbO9iLKBggPbrrHh5aXEYJXLWJlHqAgZyCvXTjjd1jCwdO0ISIgzGl/JccIOrxwfhQmFAc8KNNl9dLdzhhXWaaOT6GwtwP60o5FnPR3Y=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM5PR0801MB1972.eurprd08.prod.outlook.com (2603:10a6:203:4b::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4173.24; Tue, 1 Jun
 2021 16:50:56 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::f928:f4f2:77c0:74b4]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::f928:f4f2:77c0:74b4%7]) with mapi id 15.20.4173.030; Tue, 1 Jun 2021
 16:50:56 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, eblake@redhat.com, armbru@redhat.com,
 crosa@redhat.com, ehabkost@redhat.com, berrange@redhat.com,
 pbonzini@redhat.com, vsementsov@virtuozzo.com, jsnow@redhat.com,
 mreitz@redhat.com, kwolf@redhat.com
Subject: [PATCH v3 10/35] block/backup: set copy_range and compress after
 filter insertion
Date: Tue,  1 Jun 2021 19:50:01 +0300
Message-Id: <20210601165026.326877-11-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210601165026.326877-1-vsementsov@virtuozzo.com>
References: <20210601165026.326877-1-vsementsov@virtuozzo.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [185.215.60.210]
X-ClientProxiedBy: HE1P189CA0028.EURP189.PROD.OUTLOOK.COM (2603:10a6:7:53::41)
 To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (185.215.60.210) by
 HE1P189CA0028.EURP189.PROD.OUTLOOK.COM (2603:10a6:7:53::41) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4173.20 via Frontend Transport; Tue, 1 Jun 2021 16:50:55 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 3a0bdcc8-c2dd-4e6e-ad53-08d9251d6d04
X-MS-TrafficTypeDiagnostic: AM5PR0801MB1972:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM5PR0801MB1972EF121C1236FA9134073EC13E9@AM5PR0801MB1972.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: kzQSAwSqdCCj1jFUg0LQ1zukWtgclvx60wKlu6eApTbYfstL37tSlAFeY+KduFyaMDPHP/gPNlChsbcgcD0JGDsDQLevtIBd9pxVMgg/vhy9vSIxfePqAj4jeR9YYUkWbtY9kje604U57WMzybzyjJlN7gqAc9QHlmIWuhW0EZX1ZOR/KIA+xb22/BvTVuzM2cpa2aFLLwl2meSljFYBcgzF7V+GhieJ+mfUGEwFtwoMnbVg0XqxTp0hyNf+FDrgd3Y1uTLcAApIgNz68H69CvLr/QDao32DF1rbQByJHGBw+GyepKPfJNWUIRuZ29O4vibeJozbZxurvP8N8hmT7JcBewqWFdvmOurLO6uOeG1Yd1yQc311QMnUyc9o/feokkm7ly9z9Q4OqVszvS56GZAi+bSTwNmE3NZUNX+RuvY4qaZJI5MvE5NPftnKsMp5DgNLQJAdDg0av1z04Ug3OJayhNXyKMQg7C3TFfsrsx11sfaa0QIas1G5ErdFeSihwIJjBTS1/6vDO2MR8JkNwWuZrAhA3ZHK3gG3axFucyYLaCEIcxTvQf+T/x77CwobGK5AXYUYt2mrxpLqdJXjJm2G5vAHHy9gYHd3lYtNC69nTI5IVAtImpD4VGa3iRaIINcKJlDOFEpL0QxfU5EedOvCYneg1kKBIj7496Ykjz1Yn1BSiORdhmutQ33tMA9C
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(136003)(376002)(396003)(39840400004)(346002)(52116002)(5660300002)(2906002)(478600001)(26005)(6916009)(1076003)(8936002)(2616005)(6486002)(38100700002)(4326008)(16526019)(186003)(38350700002)(6666004)(316002)(83380400001)(956004)(66556008)(86362001)(66476007)(66946007)(36756003)(6512007)(8676002)(7416002)(6506007)(69590400013);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?V5XS0wEnCCtbhtQdcf4R1ZRDcd1+bidipPYr5Xn71ZUhUQ4YBvt/sYyDW77d?=
 =?us-ascii?Q?YznYxpwQlB0fDQ9tj8qLO0JKlzXS8hIKnmDhLzLeXjwtou69mmdk/wEDhzpo?=
 =?us-ascii?Q?HzIdTe4xsrW4LS248UUobaaLsvvVZ1kErlmja8egugYD9rqX5Ze3EKNGdg28?=
 =?us-ascii?Q?s14qt5tiYM6CEg1EXtBrWq93WBgxKRxXlEonNPTx6DuX+TeBRcG5H0pr7+1b?=
 =?us-ascii?Q?HSyl8FNRIzE5UEW0CQPfpYqxJr0ociWH1L1x6vhRzqFzlC4pBJEcVjObsuaW?=
 =?us-ascii?Q?/uhPftowbfuJ47IkIYqgiFJnlYyOSyaOKr1Q3B/eKOpul3HcNIU/+w8dObRI?=
 =?us-ascii?Q?T+qDzJdDDvKY6xMDwNfe7RSunejx/jbguRl2q2ICnkqOSvTJnSIBrmgaG6oa?=
 =?us-ascii?Q?V62I6A2CKPQntKwJBTM4ETaYTFGzqEXK/gW5hCxous0VVNNpjQpgjA/Qw4mu?=
 =?us-ascii?Q?H1v8sQabcpZVkeanczDZUfn3JwhnWAYMB+2SKIMzrCU8utW3f96CtcM5M0rB?=
 =?us-ascii?Q?zenaFzFjECrbGEWKD+P6sgqs8abdcx5mTKkVxSOq/iQTmzPozRtiymq3/boX?=
 =?us-ascii?Q?MDI6mwGqu18pKKX+9uMruGsu/ct2sqHppIiat7/dgAkpiY65ZuI/Cy6VcB3Z?=
 =?us-ascii?Q?XNyHaLcBGiC4cV3M0LWnv3bF3bsQNDCaKdnm7kPJlJQEN7NkLtoKETFnhiuv?=
 =?us-ascii?Q?0gwVLyHhVrCXY16IQZKRFZkBeqy0pU4N941BciP0hZHwTgut/S/53JgmPVL/?=
 =?us-ascii?Q?e3hsazqpJhcPajXKBiOU/LZV/pvKkKyazv2F8Ka4ukEe7tl3bGcBCnDJ1lo7?=
 =?us-ascii?Q?ffiV6jlVYGYRrk26t2odBh4VfdtW9L4wmHfmYMLDMETLTta2TXIH8ccfEttY?=
 =?us-ascii?Q?eB9kfidbtaNPIZc4TLpwuiIdeM9Ch3SzLKnVm4DpruU7aM7cSLcVUes6IFjq?=
 =?us-ascii?Q?Iw/d5ZaKwRb3BpYRi3p3zk38/Ix3ArQ+n4w55sPQUzvZJGUw25iFKPjxl9eU?=
 =?us-ascii?Q?Ou89y8pb1JKmedGUG+JBaWyzf2mcASDZrfaR3sj8tfLdQo/aJjPzM2pX65ZU?=
 =?us-ascii?Q?gWYGobAhhMgRS6eYZqDMoDeijx4U2hzLbEcSTolEfDu3XYZEHR0xhHLru4xQ?=
 =?us-ascii?Q?07Kg+VbWcylSGO/56xkdQ78p3fF3NVBck88rJgAEuvgmJEI3n9AzzCfR1hfm?=
 =?us-ascii?Q?55Y5FfaroffYmgqXSbgDjm+SFWxrjs7edXpuzP1SLIWLoNUPWvXLTtZOp58z?=
 =?us-ascii?Q?Ib8eDcCFysIPH9kKGVquhQhLels0IoSC2yEAVHxZaj7XHOtUJUdMzIrarP4G?=
 =?us-ascii?Q?Qh7SQNS+MWyRaHyPnepdpMcr?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3a0bdcc8-c2dd-4e6e-ad53-08d9251d6d04
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Jun 2021 16:50:56.4113 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4bJ25mzhOpO0SwAX7mPCh2XLxTDfyidkamwZtDh53n2FnWHduqGk7RqxQ1mvXTP7dha7zSxYIVPnKdUxW11QndPe3BaqKQt0FK7xTe6VMKU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM5PR0801MB1972
Received-SPF: pass client-ip=40.107.22.127;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR05-AM6-obe.outbound.protection.outlook.com
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

We are going to publish copy-before-write filter, so it would be
initialized through options. Still we don't want to publish compress
and copy-range options, as

1. Modern way to enable compression is to use compress filter.

2. For copy-range it's unclean how to make proper interface:
 - it's has experimental prefix for backup job anyway
 - the whole BackupPerf structure doesn't make sense for the filter
 So, let's just add copy-range possibility to the filter later if
 needed.

Still, we are going to continue support for compression and
experimental copy-range in backup job. So, set these options after
filter creation.

Note, that we can drop "compress" argument of bdrv_cbw_append() now, as
well as "perf". The only reason not doing so is that now, when I
prepare this patch the big series around it is already reviewed and I
want to avoid extra rebase conflicts to simplify review of the
following version.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
---
 block/copy-before-write.h | 1 -
 block/backup.c            | 3 ++-
 block/copy-before-write.c | 4 +---
 3 files changed, 3 insertions(+), 5 deletions(-)

diff --git a/block/copy-before-write.h b/block/copy-before-write.h
index f37e2249ae..538aab8bdb 100644
--- a/block/copy-before-write.h
+++ b/block/copy-before-write.h
@@ -33,7 +33,6 @@ BlockDriverState *bdrv_cbw_append(BlockDriverState *source,
                                   BlockDriverState *target,
                                   const char *filter_node_name,
                                   uint64_t cluster_size,
-                                  BackupPerf *perf,
                                   bool compress,
                                   BlockCopyState **bcs,
                                   Error **errp);
diff --git a/block/backup.c b/block/backup.c
index 84f9a5f02c..b31fd99ab3 100644
--- a/block/backup.c
+++ b/block/backup.c
@@ -504,7 +504,7 @@ BlockJob *backup_job_create(const char *job_id, BlockDriverState *bs,
     }
 
     cbw = bdrv_cbw_append(bs, target, filter_node_name,
-                          cluster_size, perf, compress, &bcs, errp);
+                          cluster_size, false, &bcs, errp);
     if (!cbw) {
         goto error;
     }
@@ -530,6 +530,7 @@ BlockJob *backup_job_create(const char *job_id, BlockDriverState *bs,
     job->len = len;
     job->perf = *perf;
 
+    block_copy_set_copy_opts(bcs, perf->use_copy_range, compress);
     block_copy_set_progress_meter(bcs, &job->common.job.progress);
     block_copy_set_speed(bcs, speed);
 
diff --git a/block/copy-before-write.c b/block/copy-before-write.c
index 4337076c1c..235251a640 100644
--- a/block/copy-before-write.c
+++ b/block/copy-before-write.c
@@ -170,7 +170,6 @@ BlockDriverState *bdrv_cbw_append(BlockDriverState *source,
                                   BlockDriverState *target,
                                   const char *filter_node_name,
                                   uint64_t cluster_size,
-                                  BackupPerf *perf,
                                   bool compress,
                                   BlockCopyState **bcs,
                                   Error **errp)
@@ -217,8 +216,7 @@ BlockDriverState *bdrv_cbw_append(BlockDriverState *source,
 
     state->cluster_size = cluster_size;
     state->bcs = block_copy_state_new(top->backing, state->target,
-                                      cluster_size, perf->use_copy_range,
-                                      compress, errp);
+                                      cluster_size, false, compress, errp);
     if (!state->bcs) {
         error_prepend(errp, "Cannot create block-copy-state: ");
         goto fail;
-- 
2.29.2


