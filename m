Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C41BC51FA07
	for <lists+qemu-devel@lfdr.de>; Mon,  9 May 2022 12:35:25 +0200 (CEST)
Received: from localhost ([::1]:49178 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1no0jc-0007C5-Ru
	for lists+qemu-devel@lfdr.de; Mon, 09 May 2022 06:35:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53580)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1no0er-0004FE-HY
 for qemu-devel@nongnu.org; Mon, 09 May 2022 06:30:32 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:45926)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1no0eo-0002ki-Vm
 for qemu-devel@nongnu.org; Mon, 09 May 2022 06:30:28 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1652092225;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:  content-type:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=Hcr9HOwDCFFTUOx0tE5rv9cghsaZIP80SakwjlhFm34=;
 b=Mm5bCLklZaznVXb27a83wew5p+68igtvqD8UnMhznsRAcJCwNzZGWnz5DEpZ/f1b1R+Nwf
 s4kQYfodEBMRUHe2zh788KdJ4paUS8kf5l5GUjFfy8Mn7Kr2DLfhyANyYgcDDJa0eQuL4n
 mHituE9hDJGu++labZ5w6FbdElFsVPY=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-582-Z8fT0QKxPMyaXb6fMPzBtQ-1; Mon, 09 May 2022 06:30:23 -0400
X-MC-Unique: Z8fT0QKxPMyaXb6fMPzBtQ-1
Received: by mail-wm1-f71.google.com with SMTP id
 q6-20020a1cf306000000b0038c5726365aso3720847wmq.3
 for <qemu-devel@nongnu.org>; Mon, 09 May 2022 03:30:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Hcr9HOwDCFFTUOx0tE5rv9cghsaZIP80SakwjlhFm34=;
 b=uBVxxpj81S26IMfZNqRQWwxA0AxsJ8L6az4JaLyslFbAT+BTN1rnbUvbVeaxf5zvQ1
 LkMDDj6ExVHHGSyAEqcmUghX0xV/AQ7LOkuM+3r51Bi6rZkrMCMtBeV/q+QNC3BmIU5Z
 EvUEZApLMz2x/x1GsC8DnYtPSicKeUnwjiIA2/Yhnv9J2RDSNgCrj73XX4jJOEGa3OiP
 kcgsgU6jO/ly+Iso4uL2mL1LJLAqH/GcSrn7ZB/fwe60tis3sDJ7K6LTtR89UtBDCSAC
 LeTX3QxsJx7kcRtcutXpGIvbUyGNbXx/VATys88VKfytTOvXTb6OUlugjCEYMMCDqUXT
 DKWw==
X-Gm-Message-State: AOAM5334daqPHjrNBLlfO+FrSnNCZ4ysV7IbE+EqrlCONqirJVT3bi/m
 6XKGD2f3rpC5NAfDN8tupJvBInlWFUsUNIE2LFZZ/S/G4jDS5dGoM5T3Yt+mYzQxz8sGo5ZnBmb
 i/DrOoSBduvyp97cnz+YvngJveEcKM7Fy25B1w2jMO7VcomMQEbGmBNewwKZ8qd5eqJA=
X-Received: by 2002:a5d:4f05:0:b0:20a:dd25:5725 with SMTP id
 c5-20020a5d4f05000000b0020add255725mr13282505wru.546.1652092222152; 
 Mon, 09 May 2022 03:30:22 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyC4MqcZviH4cjbiK1Kb2kObcpTCSxVYS9NdmTrb8FY2eKxOre6JIDQWVzNU4ySYEa+ELEzEA==
X-Received: by 2002:a5d:4f05:0:b0:20a:dd25:5725 with SMTP id
 c5-20020a5d4f05000000b0020add255725mr13282457wru.546.1652092221522; 
 Mon, 09 May 2022 03:30:21 -0700 (PDT)
Received: from [192.168.10.118] ([2001:b07:6468:f312:e3ec:5559:7c5c:1928])
 by smtp.gmail.com with ESMTPSA id
 bj13-20020a0560001e0d00b0020c5253d912sm9814610wrb.94.2022.05.09.03.30.20
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 09 May 2022 03:30:20 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 00/26] block: fix coroutine_fn annotations
Date: Mon,  9 May 2022 12:29:53 +0200
Message-Id: <20220509103019.215041-1-pbonzini@redhat.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Type: text/plain
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PP_MIME_FAKE_ASCII_TEXT=0.999, RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

The patches are exactly the same as v1, but I have improved the commit
messages for the "remove incorrect coroutine_fn annotations" bits.

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


