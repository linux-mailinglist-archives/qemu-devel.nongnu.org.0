Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7656B502AE1
	for <lists+qemu-devel@lfdr.de>; Fri, 15 Apr 2022 15:23:06 +0200 (CEST)
Received: from localhost ([::1]:36028 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nfLui-0000ih-Nq
	for lists+qemu-devel@lfdr.de; Fri, 15 Apr 2022 09:23:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50284)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1nfLqy-0006PZ-AV; Fri, 15 Apr 2022 09:19:12 -0400
Received: from mail-ed1-x52b.google.com ([2a00:1450:4864:20::52b]:45936)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1nfLqw-0007pA-8C; Fri, 15 Apr 2022 09:19:12 -0400
Received: by mail-ed1-x52b.google.com with SMTP id v15so9871400edb.12;
 Fri, 15 Apr 2022 06:19:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=v+ts/zdWURwM1GQcg5OwCvGQPXlkMhHop0pU8mXkbkQ=;
 b=eICfNwazj5UJBzbGfCvQym7RdWYvs4Eff29/nsUs9BAi80jdGfv5b7I7evvhv7hTb6
 QUEtkHgkwjRa6/Qv4TrIqtDsIMEIHBdWXiGZNs7xbBhlStqHYy4EpCQyHMqxPcDCrDM9
 eVklQqr5MCE0dAyS/guonvZD5iCnOLLGYi16BU8rYOqqyzyfUeeo29cPO1x/jhS+tO2R
 grFOAQdAa50snY0C5++AhqKSNtCIuQSlQPTeAQh4euix0Ng7JaNCmMXLpv7gaAiwABWV
 NO4evj8kcqdHN1+tCm0ebNeakKd3qDUECjmgwNCQTJtrGdxD/WYRpXhJXRHdV0cfJ31q
 FtPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=v+ts/zdWURwM1GQcg5OwCvGQPXlkMhHop0pU8mXkbkQ=;
 b=TJYR/xcoJ8EA671428MrjfJvhzApC6oLScIVDhbTvPfI5OI4GaGUforuGajGrCdrZN
 RlbT0y4XiiK/Oey0ZySV1Y7kkvR1szp3Fekpq6T2s6VXe9TaxpCrdQVPpBan/SC1GPZq
 IjMQ2uZLm8iYIK5DoVtvitxA+RXo3HR7X6HhzedpJpMWgOf3PS/426tJCsOInmekPfFs
 FBBAzg51pS0qsOgblVLChfEj6P9miFhqxitj3v5KGVnmMdHSKTU/G6TngPzCwkcx382p
 eEzbL2AT42tV/the1h45LJA0RKrb07otN1eVwkfqESSaWjOWYsjg0TGke8R6E4HUcBtk
 0fBA==
X-Gm-Message-State: AOAM531ls/e1XzchJO7SZNZy9rkKtLCSl9SkAG4+nuuhBrTeYJkHlhn5
 znFfMdIl7a5i21kAEIbLYL1osp1rLZcVeQ==
X-Google-Smtp-Source: ABdhPJyZYsjKwSAunu1ZgP2yQ5j56s9TvlD5v+t2vjAIsLk6PJ+GL4c5e1WkDimJR4wQ277j+99Wag==
X-Received: by 2002:a05:6402:50d0:b0:419:7df9:55c8 with SMTP id
 h16-20020a05640250d000b004197df955c8mr8077279edb.79.1650028748456; 
 Fri, 15 Apr 2022 06:19:08 -0700 (PDT)
Received: from localhost.localdomain ([2001:b07:add:ec09:c399:bc87:7b6c:fb2a])
 by smtp.gmail.com with ESMTPSA id
 dn7-20020a17090794c700b006e8b176143bsm1683529ejc.155.2022.04.15.06.19.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 15 Apr 2022 06:19:07 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 00/19] block: fix coroutine_fn annotations
Date: Fri, 15 Apr 2022 15:18:34 +0200
Message-Id: <20220415131900.793161-1-pbonzini@redhat.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-type: text/plain
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::52b;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ed1-x52b.google.com
X-Spam_score_int: -4
X-Spam_score: -0.5
X-Spam_bar: /
X-Spam_report: (-0.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 PP_MIME_FAKE_ASCII_TEXT=0.999, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: malureau@redhat.com, kwolf@redhat.com, hreitz@redhat.com,
 stefanha@redhat.com, qemu-block@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This is the initial result of reviving Marc-André's series at
https://patchew.org/QEMU/20170704220346.29244-1-marcandre.lureau@redhat.com/.
A lot of the patches are similar to the ones that Marc-André wrote,
but due to the changes in the code it was easier to redo them.

For nbd, the patch is on top of "nbd: mark more coroutine_fns" that
I sent a few days ago and that (AIUI) Eric has already queued; only
one function was missing, much to my surprise.

Apart from this, I also identified the following functions that
can be called both in coroutine context and outside:

- qmp_dispatch
- schedule_next_request
- nvme_get_free_req
- bdrv_create
- bdrv_remove_persistent_dirty_bitmap
- bdrv_can_store_new_dirty_bitmap
- bdrv_do_drained_begin
- bdrv_do_drained_end
- bdrv_drain_all_begin
- qcow2_open
- qcow2_has_zero_init
- bdrv_qed_open
- qio_channel_readv_full_all_eof
- qio_channel_writev_full_all

besides, of course, everything that is generated by
scripts/block-coroutine-wrapper.py.

Thanks,

Paolo

Supersedes: <20170704220346.29244-1-marcandre.lureau@redhat.com>

Marc-André Lureau (3):
  9p: add missing coroutine_fn annotations
  migration: add missing coroutine_fn annotations
  test-coroutine: add missing coroutine_fn annotations

Paolo Bonzini (23):
  block: remove incorrect coroutine_fn annotations
  qcow2: remove incorrect coroutine_fn annotations
  nbd: remove incorrect coroutine_fn annotations
  coroutine: remove incorrect coroutine_fn annotations
  blkdebug: add missing coroutine_fn annotations
  blkverify: add missing coroutine_fn annotations
  block: add missing coroutine_fn annotations
  file-posix: add missing coroutine_fn annotations
  iscsi: add missing coroutine_fn annotations
  nbd: add missing coroutine_fn annotations
  nfs: add missing coroutine_fn annotations
  nvme: add missing coroutine_fn annotations
  parallels: add missing coroutine_fn annotations
  qcow2: add missing coroutine_fn annotations
  copy-before-write: add missing coroutine_fn annotations
  curl: add missing coroutine_fn annotations
  qed: add missing coroutine_fn annotations
  quorum: add missing coroutine_fn annotations
  throttle: add missing coroutine_fn annotations
  vmdk: add missing coroutine_fn annotations
  job: add missing coroutine_fn annotations
  coroutine-lock: add missing coroutine_fn annotations
  raw-format: add missing coroutine_fn annotations

 block/blkdebug.c            | 14 +++++++-------
 block/blkverify.c           |  2 +-
 block/block-backend.c       | 26 +++++++++++++-------------
 block/copy-before-write.c   |  8 ++++----
 block/curl.c                |  2 +-
 block/file-posix.c          |  2 +-
 block/io.c                  | 24 ++++++++++++------------
 block/iscsi.c               |  2 +-
 block/nbd.c                 | 10 +++++-----
 block/nfs.c                 |  2 +-
 block/nvme.c                |  5 +++--
 block/parallels.c           |  5 +++--
 block/qcow2-cluster.c       | 18 +++++++++---------
 block/qcow2-refcount.c      |  6 +++---
 block/qcow2.c               |  4 ++--
 block/qcow2.h               | 18 +++++++++---------
 block/qed.c                 |  4 ++--
 block/quorum.c              | 35 ++++++++++++++++++-----------------
 block/raw-format.c          |  2 +-
 block/throttle.c            |  2 +-
 block/vmdk.c                | 20 ++++++++++----------
 hw/9pfs/9p.h                |  9 ++++++---
 include/block/nbd.h         |  2 +-
 include/qemu/coroutine.h    |  2 +-
 include/qemu/job.h          |  2 +-
 job.c                       |  2 +-
 migration/migration.c       |  3 ++-
 tests/unit/test-coroutine.c |  2 +-
 util/qemu-coroutine-lock.c  | 14 +++++++-------
 util/qemu-coroutine.c       |  2 +-
 30 files changed, 128 insertions(+), 121 deletions(-)

-- 
2.35.1


