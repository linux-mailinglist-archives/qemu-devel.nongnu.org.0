Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 65E1C649F90
	for <lists+qemu-devel@lfdr.de>; Mon, 12 Dec 2022 14:12:27 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p4iP7-0000Ww-ST; Mon, 12 Dec 2022 07:59:33 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1p4iP3-0000TD-6d
 for qemu-devel@nongnu.org; Mon, 12 Dec 2022 07:59:32 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1p4iP1-0000X6-A7
 for qemu-devel@nongnu.org; Mon, 12 Dec 2022 07:59:28 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1670849966;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=i24EeqZTZ6h8iyIpdY1D6GnWqc5hXVy2mIGsj1z8Mmg=;
 b=MxMj/6gGy4tFk6mBJLp53QiY/EBXww4UqhgbS5ltAwCiLdyGv6L6RhDrGkIQEpoRC9f/Mv
 oXXwSKCuP3mS4XuXYoqwNfxhEGUSKqd0YsvkTxJ3hbFLj4U93Rsjb3rCNmtr2mdzIh85Gt
 Sesn/UQpIjjlg1ApNPyjbljb2z1cWbA=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-313-iKKHrT-bNoiemKZ56QR3MQ-1; Mon, 12 Dec 2022 07:59:25 -0500
X-MC-Unique: iKKHrT-bNoiemKZ56QR3MQ-1
Received: by mail-wm1-f71.google.com with SMTP id
 b47-20020a05600c4aaf00b003d031aeb1b6so4132799wmp.9
 for <qemu-devel@nongnu.org>; Mon, 12 Dec 2022 04:59:25 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=i24EeqZTZ6h8iyIpdY1D6GnWqc5hXVy2mIGsj1z8Mmg=;
 b=fQu2TbKGGA6fEkqisNCbX8iTTuD/+oaFvmab0asZv02IJIlMS+pfpsKf57QmEHHEVl
 7Icrw3inXoGNnB/GmWSIDU8FtaQjXOY+roEgLLOuiL1rGpaSD4SGWPHxafke46Xy3PzW
 gNdL8M/pmav8cypwZxqqEouhIt32Wv3ffv+g7+0F1Be6LTH+XasKj+w321JFi5ToKx8D
 tbNlEUAllO6NOaljKSjo0fxN31kOhWDWsFArXe7ZGI4mt3d3pl/Cub6L8fh+6QDXiVMz
 p9PkjOIsxSQ0zq5t1sS3slw+iTnXMfT3VNfrM2+zTuO8/j6IM1wPgEhrdfLeL+tAAhiO
 FcDg==
X-Gm-Message-State: ANoB5pmJ+Rh5C6BFU3OSupXO18+4CWwKLdZcmk9uHzXTJUju01ipINkO
 uRNV2HzJHQ4g2uZwhhyM5+G7fmzJdhgb3akYX1tPXNH/jTkvIhTfkblyj1K0R8ZoUuzm86/y/wi
 +P10q5TAzmRs2BjSymN+FVCuU+ARJ7w3sC41smA5n+rscVz5eNZ7Ia3M4txLlnyTWwuQ=
X-Received: by 2002:a5d:4537:0:b0:242:4835:8e69 with SMTP id
 j23-20020a5d4537000000b0024248358e69mr9648450wra.46.1670849963846; 
 Mon, 12 Dec 2022 04:59:23 -0800 (PST)
X-Google-Smtp-Source: AA0mqf7Qggk+mDK5M6tgGEWmUtv3AtRehUQQxkboD72c4Rbc/69X6RwRvSXxlRTogSZJFQMILHyPoA==
X-Received: by 2002:a5d:4537:0:b0:242:4835:8e69 with SMTP id
 j23-20020a5d4537000000b0024248358e69mr9648431wra.46.1670849963515; 
 Mon, 12 Dec 2022 04:59:23 -0800 (PST)
Received: from avogadro.local ([2001:b07:6468:f312:9af8:e5f5:7516:fa89])
 by smtp.gmail.com with ESMTPSA id
 l4-20020a5d5604000000b00241ce5d605dsm8835380wrv.110.2022.12.12.04.59.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 12 Dec 2022 04:59:22 -0800 (PST)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Cc: qemu-block@nongnu.org,
	eesposit@redhat.com,
	kwolf@redhat.com
Subject: [PATCH 00/12] More cleanups and fixes for drain
Date: Mon, 12 Dec 2022 13:59:05 +0100
Message-Id: <20221212125920.248567-1-pbonzini@redhat.com>
X-Mailer: git-send-email 2.38.1
MIME-Version: 1.0
Content-Type: text/plain
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

There are a few more lines of code that can be removed around draining
code, but especially the logic can be simplified by removing unnecessary
parameters.

Due to the failure of the block-next branch, the first three patches
drop patches 14+15 of Kevin's drain cleanup series, and then redo
patch 15 in a slightly less satisfactory way that still enables the
remaining cleanups.  These reverts are not supposed to be applied;
either the offending patches are dropped from the branch, or if the
issue is fixed then my first three patches can go away.

The next three are taken from Emanuele's old subtree drain attempt
at removing the AioContext.  The main one is the second, which is needed
to avoid testcase failures, but I included all of them for simplicity.

Patch 7 fixes another latent bug exposed by the later cleanups, and while
looking for a fix I noticed a general lack of thread-safety in BlockBackend's
drain code.  There are some global properties that only need to be documented
and enforced to be set only at creation time (patches 8/9), but also
queued_requests is not protected by any mutex, which is fixed in patch 10.

Finally, patches 11-15 are the actual simplification.

Applies on top of block-next.

Paolo

Emanuele Giuseppe Esposito (3):
  test-bdrv-drain.c: remove test_detach_by_parent_cb()
  tests/unit/test-bdrv-drain.c: graph setup functions can't run in
    coroutines
  tests/qemu-iotests/030: test_stream_parallel should use
    auto_finalize=False

Paolo Bonzini (12):
  Revert "block: Remove poll parameter from
    bdrv_parent_drained_begin_single()"
  Revert "block: Don't poll in bdrv_replace_child_noperm()"
  block: Pull polling out of bdrv_parent_drained_begin_single()
  block-backend: enter aio coroutine only after drain
  nbd: a BlockExport always has a BlockBackend
  block-backend: make global properties write-once
  block-backend: always wait for drain before starting operation
  block-backend: make queued_requests thread-safe
  block: limit bdrv_co_yield_to_drain to drain_begin
  block: second argument of bdrv_do_drained_end is always NULL
  block: second argument of bdrv_do_drained_begin and bdrv_drain_poll is
    always NULL
  block: only get out of coroutine context for polling

 block.c                           | 109 ++++----------------
 block/block-backend.c             |  91 +++++++++-------
 block/commit.c                    |   4 +-
 block/export/export.c             |   2 +-
 block/io.c                        | 136 +++++++++---------------
 block/mirror.c                    |   4 +-
 block/parallels.c                 |   2 +-
 block/qcow.c                      |   2 +-
 block/qcow2.c                     |   2 +-
 block/qed.c                       |   2 +-
 block/stream.c                    |   4 +-
 block/vdi.c                       |   2 +-
 block/vhdx.c                      |   2 +-
 block/vmdk.c                      |   4 +-
 block/vpc.c                       |   2 +-
 include/block/block-io.h          |  29 +-----
 include/block/block_int-io.h      |  21 ++++
 include/sysemu/block-backend-io.h |   6 +-
 nbd/server.c                      |  15 ++-
 tests/qemu-iotests/030            |  12 +--
 tests/unit/test-bdrv-drain.c      | 166 +++++++++++++++---------------
 tests/unit/test-block-iothread.c  |   2 +-
 22 files changed, 258 insertions(+), 361 deletions(-)

-- 
2.38.1


