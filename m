Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 79DD54EE23A
	for <lists+qemu-devel@lfdr.de>; Thu, 31 Mar 2022 22:01:41 +0200 (CEST)
Received: from localhost ([::1]:43778 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1na0zE-0003y4-Iu
	for lists+qemu-devel@lfdr.de; Thu, 31 Mar 2022 16:01:40 -0400
Received: from eggs.gnu.org ([209.51.188.92]:37684)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <vladimir.sementsov-ogievskiy@openvz.org>)
 id 1na0v1-00072F-3x
 for qemu-devel@nongnu.org; Thu, 31 Mar 2022 15:57:19 -0400
Received: from [2a00:1450:4864:20::12a] (port=45875
 helo=mail-lf1-x12a.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1)
 (envelope-from <vladimir.sementsov-ogievskiy@openvz.org>)
 id 1na0uy-0005WE-L4
 for qemu-devel@nongnu.org; Thu, 31 Mar 2022 15:57:18 -0400
Received: by mail-lf1-x12a.google.com with SMTP id p10so1011164lfa.12
 for <qemu-devel@nongnu.org>; Thu, 31 Mar 2022 12:57:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=openvz-org.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=XtwutcgkuyE0keb8GJVzGI42YGdS9aTBp14aQa1t9Qw=;
 b=fxcSaif7JhjWFQVoc/ak4lUBDFF2kucv+xWN0ZQU/LL70MDXH7RYO/gE5Kh7KPgpjD
 jw94hwK184W628DoS26MxSIKsPq/LsKwxcS4QE3JWrIkZBfislN7LjbQmZ+HQVRnjUIx
 NzyoolSTCpwkhsp+XIVKa+ZwwEcPLe1oeQz/h7bk6SgDWrfoFIFqTt9ZgvsXSRULM5Az
 Hrvshrp086IJs0gl1cYwZYDbWnOOKE0jOaCi/zfwUauxFaTrTXorb0nT3+/JLBOqPnBm
 B5r0kEzCkRglVxh5/1Hl6MxN7TK4bIDKyQJXkybxUw7k6wJAA9oU+vZ+Oqs0WYqtjRbS
 7znw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=XtwutcgkuyE0keb8GJVzGI42YGdS9aTBp14aQa1t9Qw=;
 b=q602ta96HrMOd0ywCS+C66i4KE9UckYp7a0+77UhW4Qgkz5TbFVuwWzcOPCIuBjo3d
 R+P915XGJclK1C1hQNpB+1Kfktif0w2fatmpWLeDMp3K+R4t99v3HMjrKKJa5VnZIkZF
 VcRBemp8xX8TStHF/DdfZFlWun/1co9hkIDOMpW09FgwcqMv0gCUGU+FhG07Hc5Fq/ZD
 jKRKuio3JgaVXt5kLuZTPVIRYTueoufOvoT6WuE2PADMqgtxiMF9nCdudjztR8NixMbk
 9v3hZTKAYKc0xMMhUTmhIGWANCQES2txZcrvWJVzGFfpZ6nMbiohvDyPHGRvtNBAuga1
 M9cQ==
X-Gm-Message-State: AOAM530Q1O9ImXtG7NJM0Xob9l2BPn7HOJRpueeWLiXCRzuM66dYDLfq
 prQTYiIJB69X0aSXJHE7+dKzHw==
X-Google-Smtp-Source: ABdhPJxsjTD8kDpXjcqsGqMW/DwXRnKVA0g6HA2p3jlESp5YLekC5VlufUBgKae4Z/x0gtlTXtXnMg==
X-Received: by 2002:ac2:4e0c:0:b0:44a:3260:e35d with SMTP id
 e12-20020ac24e0c000000b0044a3260e35dmr11623332lfr.104.1648756634675; 
 Thu, 31 Mar 2022 12:57:14 -0700 (PDT)
Received: from fedora.. ([185.215.60.153]) by smtp.gmail.com with ESMTPSA id
 z26-20020ac2419a000000b004484bf6d1e6sm30539lfh.233.2022.03.31.12.57.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 31 Mar 2022 12:57:14 -0700 (PDT)
From: Vladimir Sementsov-Ogievskiy <vladimir.sementsov-ogievskiy@openvz.org>
X-Google-Original-From: Vladimir Sementsov-Ogievskiy <vsementsov@openvz.org>
To: qemu-block@nongnu.org
Subject: [PATCH 2/3] qapi: blockdev-backup: add discard-source parameter
Date: Thu, 31 Mar 2022 22:57:00 +0300
Message-Id: <20220331195701.220690-3-vsementsov@openvz.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220331195701.220690-1-vsementsov@openvz.org>
References: <20220331195701.220690-1-vsementsov@openvz.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::12a
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::12a;
 envelope-from=vladimir.sementsov-ogievskiy@openvz.org;
 helo=mail-lf1-x12a.google.com
X-Spam_score_int: -4
X-Spam_score: -0.5
X-Spam_bar: /
X-Spam_report: (-0.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001,
 RDNS_NONE=0.793, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: kwolf@redhat.com, v.sementsov-og@mail.ru, wencongyang2@huawei.com,
 xiechanglong.d@gmail.com, qemu-devel@nongnu.org, armbru@redhat.com,
 jsnow@redhat.com, hreitz@redhat.com,
 Vladimir Sementsov-Ogievskiy <vsementsov@openvz.org>, eblake@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Add a parameter that enables discard-after-copy. That is mostly useful
in "push backup with fleecing" scheme, when source is snapshot-access
format driver node, based on copy-before-write filter snapshot-access
API:

[guest]      [snapshot-access] ~~ blockdev-backup ~~> [backup target]
   |            |
   | root       | file
   v            v
[copy-before-write]
   |             |
   | file        | target
   v             v
[active disk]   [temp.img]

In this case discard-after-copy does two things:

 - discard data in temp.img to save disk space
 - avoid further copy-before-write operation in discarded area

Note that we have to declare WRITE permission on source in
copy-before-write filter, for discard to work. Alternative is to pass
an option to bdrv_cbw_append(), add some internal open-option for
copy-before-write filter to require WRITE permission only for backup
with discard-source=true. But I'm not sure it worth the complexity.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@openvz.org>
---
 block/backup.c                         |  5 +++--
 block/block-copy.c                     | 10 ++++++++--
 block/copy-before-write.c              |  2 +-
 block/replication.c                    |  4 ++--
 blockdev.c                             |  2 +-
 include/block/block-copy.h             |  2 +-
 include/block/block_int-global-state.h |  2 +-
 qapi/block-core.json                   |  4 ++++
 8 files changed, 21 insertions(+), 10 deletions(-)

diff --git a/block/backup.c b/block/backup.c
index 5cfd0b999c..d0d512ec61 100644
--- a/block/backup.c
+++ b/block/backup.c
@@ -355,7 +355,7 @@ BlockJob *backup_job_create(const char *job_id, BlockDriverState *bs,
                   BlockDriverState *target, int64_t speed,
                   MirrorSyncMode sync_mode, BdrvDirtyBitmap *sync_bitmap,
                   BitmapSyncMode bitmap_mode,
-                  bool compress,
+                  bool compress, bool discard_source,
                   const char *filter_node_name,
                   BackupPerf *perf,
                   BlockdevOnError on_source_error,
@@ -486,7 +486,8 @@ BlockJob *backup_job_create(const char *job_id, BlockDriverState *bs,
     job->len = len;
     job->perf = *perf;
 
-    block_copy_set_copy_opts(bcs, perf->use_copy_range, compress);
+    block_copy_set_copy_opts(bcs, perf->use_copy_range, compress,
+                             discard_source);
     block_copy_set_progress_meter(bcs, &job->common.job.progress);
     block_copy_set_speed(bcs, speed);
 
diff --git a/block/block-copy.c b/block/block-copy.c
index 9626043480..2d8373f63f 100644
--- a/block/block-copy.c
+++ b/block/block-copy.c
@@ -133,6 +133,7 @@ typedef struct BlockCopyState {
     CoMutex lock;
     int64_t in_flight_bytes;
     BlockCopyMethod method;
+    bool discard_source;
     BlockReqList reqs;
     QLIST_HEAD(, BlockCopyCallState) calls;
     /*
@@ -278,11 +279,12 @@ static uint32_t block_copy_max_transfer(BdrvChild *source, BdrvChild *target)
 }
 
 void block_copy_set_copy_opts(BlockCopyState *s, bool use_copy_range,
-                              bool compress)
+                              bool compress, bool discard_source)
 {
     /* Keep BDRV_REQ_SERIALISING set (or not set) in block_copy_state_new() */
     s->write_flags = (s->write_flags & BDRV_REQ_SERIALISING) |
         (compress ? BDRV_REQ_WRITE_COMPRESSED : 0);
+    s->discard_source = discard_source;
 
     if (s->max_transfer < s->cluster_size) {
         /*
@@ -405,7 +407,7 @@ BlockCopyState *block_copy_state_new(BdrvChild *source, BdrvChild *target,
                                     cluster_size),
     };
 
-    block_copy_set_copy_opts(s, false, false);
+    block_copy_set_copy_opts(s, false, false, false);
 
     ratelimit_init(&s->rate_limit);
     qemu_co_mutex_init(&s->lock);
@@ -575,6 +577,10 @@ static coroutine_fn int block_copy_task_entry(AioTask *task)
     co_put_to_shres(s->mem, t->req.bytes);
     block_copy_task_end(t, ret);
 
+    if (s->discard_source && ret == 0) {
+        bdrv_co_pdiscard(s->source, t->req.offset, t->req.bytes);
+    }
+
     return ret;
 }
 
diff --git a/block/copy-before-write.c b/block/copy-before-write.c
index 79cf12380e..3e77313a9a 100644
--- a/block/copy-before-write.c
+++ b/block/copy-before-write.c
@@ -319,7 +319,7 @@ static void cbw_child_perm(BlockDriverState *bs, BdrvChild *c,
         bdrv_default_perms(bs, c, role, reopen_queue,
                            perm, shared, nperm, nshared);
 
-        *nperm = *nperm | BLK_PERM_CONSISTENT_READ;
+        *nperm = *nperm | BLK_PERM_CONSISTENT_READ | BLK_PERM_WRITE;
         *nshared &= ~(BLK_PERM_WRITE | BLK_PERM_RESIZE);
     }
 }
diff --git a/block/replication.c b/block/replication.c
index 2f17397764..f6a0b23563 100644
--- a/block/replication.c
+++ b/block/replication.c
@@ -587,8 +587,8 @@ static void replication_start(ReplicationState *rs, ReplicationMode mode,
 
         s->backup_job = backup_job_create(
                                 NULL, s->secondary_disk->bs, s->hidden_disk->bs,
-                                0, MIRROR_SYNC_MODE_NONE, NULL, 0, false, NULL,
-                                &perf,
+                                0, MIRROR_SYNC_MODE_NONE, NULL, 0, false, false,
+                                NULL, &perf,
                                 BLOCKDEV_ON_ERROR_REPORT,
                                 BLOCKDEV_ON_ERROR_REPORT, JOB_INTERNAL,
                                 backup_job_completed, bs, NULL, &local_err);
diff --git a/blockdev.c b/blockdev.c
index 89167fbc08..946073a732 100644
--- a/blockdev.c
+++ b/blockdev.c
@@ -2924,7 +2924,7 @@ static BlockJob *do_backup_common(BackupCommon *backup,
 
     job = backup_job_create(backup->job_id, bs, target_bs, backup->speed,
                             backup->sync, bmap, backup->bitmap_mode,
-                            backup->compress,
+                            backup->compress, backup->discard_source,
                             backup->filter_node_name,
                             &perf,
                             backup->on_source_error,
diff --git a/include/block/block-copy.h b/include/block/block-copy.h
index b03eb5f016..e3cf0b200b 100644
--- a/include/block/block-copy.h
+++ b/include/block/block-copy.h
@@ -31,7 +31,7 @@ BlockCopyState *block_copy_state_new(BdrvChild *source, BdrvChild *target,
 
 /* Function should be called prior any actual copy request */
 void block_copy_set_copy_opts(BlockCopyState *s, bool use_copy_range,
-                              bool compress);
+                              bool compress, bool discard_source);
 void block_copy_set_progress_meter(BlockCopyState *s, ProgressMeter *pm);
 
 void block_copy_state_free(BlockCopyState *s);
diff --git a/include/block/block_int-global-state.h b/include/block/block_int-global-state.h
index aed62a45d9..dc540868ec 100644
--- a/include/block/block_int-global-state.h
+++ b/include/block/block_int-global-state.h
@@ -183,7 +183,7 @@ BlockJob *backup_job_create(const char *job_id, BlockDriverState *bs,
                             MirrorSyncMode sync_mode,
                             BdrvDirtyBitmap *sync_bitmap,
                             BitmapSyncMode bitmap_mode,
-                            bool compress,
+                            bool compress, bool discard_source,
                             const char *filter_node_name,
                             BackupPerf *perf,
                             BlockdevOnError on_source_error,
diff --git a/qapi/block-core.json b/qapi/block-core.json
index 6e944e4f52..ffc26d06ee 100644
--- a/qapi/block-core.json
+++ b/qapi/block-core.json
@@ -1436,6 +1436,9 @@
 #                    above node specified by @drive. If this option is not given,
 #                    a node name is autogenerated. (Since: 4.2)
 #
+# @discard-source: Discard blocks on source which are already copied to the
+#                  target. (Since: 7.1)
+#
 # @x-perf: Performance options. (Since 6.0)
 #
 # Features:
@@ -1456,6 +1459,7 @@
             '*on-target-error': 'BlockdevOnError',
             '*auto-finalize': 'bool', '*auto-dismiss': 'bool',
             '*filter-node-name': 'str',
+            '*discard-source': 'bool',
             '*x-perf': { 'type': 'BackupPerf',
                          'features': [ 'unstable' ] } } }
 
-- 
2.35.1


