Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B86553B9DEB
	for <lists+qemu-devel@lfdr.de>; Fri,  2 Jul 2021 11:12:00 +0200 (CEST)
Received: from localhost ([::1]:53330 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lzFDL-00067l-OR
	for lists+qemu-devel@lfdr.de; Fri, 02 Jul 2021 05:11:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36336)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pl@kamp.de>) id 1lzFBX-0003KB-O0
 for qemu-devel@nongnu.org; Fri, 02 Jul 2021 05:10:07 -0400
Received: from kerio.kamp.de ([195.62.97.192]:54504)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pl@kamp.de>) id 1lzFBU-0006ea-R4
 for qemu-devel@nongnu.org; Fri, 02 Jul 2021 05:10:06 -0400
X-Footer: a2FtcC5kZQ==
Received: from submission.kamp.de ([195.62.97.28]) by kerio.kamp.de with ESMTPS
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256 bits))
 for qemu-devel@nongnu.org; Fri, 2 Jul 2021 11:09:41 +0200
Received: (qmail 37492 invoked from network); 2 Jul 2021 09:09:43 -0000
Received: from lieven-pc.kamp-intra.net (HELO lieven-pc)
 (relay@kamp.de@::ffff:172.21.12.60)
 by submission.kamp.de with ESMTPS (DHE-RSA-AES256-GCM-SHA384 encrypted) ESMTPA;
 2 Jul 2021 09:09:43 -0000
Received: by lieven-pc (Postfix, from userid 1060)
 id B4CA613DD24; Fri,  2 Jul 2021 11:09:43 +0200 (CEST)
From: Peter Lieven <pl@kamp.de>
To: qemu-block@nongnu.org
Subject: [PATCH V4 0/6] block/rbd: migrate to coroutines and add write zeroes
 support
Date: Fri,  2 Jul 2021 11:09:29 +0200
Message-Id: <20210702090935.15300-1-pl@kamp.de>
X-Mailer: git-send-email 2.17.1
Received-SPF: pass client-ip=195.62.97.192; envelope-from=pl@kamp.de;
 helo=kerio.kamp.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: kwolf@redhat.com, idryomov@redhat.com, berrange@redhat.com,
 Peter Lieven <pl@kamp.de>, qemu-devel@nongnu.org, ct@flyingcircus.io,
 pbonzini@redhat.com, idryomov@gmail.com, mreitz@redhat.com,
 dillaman@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

this series migrates the qemu rbd driver from the old aio emulation
to native coroutines and adds write zeroes support which is important
for block operations.

To achive this we first bump the librbd requirement to the already
outdated luminous release of ceph to get rid of some wrappers and
ifdef'ry in the code.

V4->V4:
 - this patch is now rebased on top of current master
 - Patch 1: just mention librbd, tweak version numbers [Ilya]
 - Patch 3: use rbd_get_size instead of rbd_stat [Ilya]
 - Patch 4: retain comment about using a BH in the callback [Ilya]
 - Patch 5: set BDRV_REQ_NO_FALLBACK and silently ignore BDRV_REQ_MAY_UNMAP [Ilya]

V2->V3:
 - this patch is now rebased on top of current master
 - Patch 1: only use cc.links and not cc.run to not break
   cross-compiling. [Kevin]
   Since Qemu 6.1 its okay to rely on librbd >= 12.x since RHEL-7
   support was dropped [Daniel]
 - Patch 4: dropped
 - Patch 5: store BDS in RBDTask and use bdrv_get_aio_context() [Kevin]

V1->V2:
 - this patch is now rebased on top of current master with Paolos
   upcoming fixes for the meson.build script included:
    - meson: accept either shared or static libraries if --disable-static
    - meson: honor --enable-rbd if cc.links test fails
 - Patch 1: adjusted to meson.build script
 - Patch 2: unchanged
 - Patch 3: new patch
 - Patch 4: do not implement empty detach_aio_context callback [Jason]
 - Patch 5: - fix aio completion cleanup in error case [Jason]
            - return error codes from librbd
 - Patch 6: - add support for thick provisioning [Jason]
            - do not set write zeroes alignment
 - Patch 7: new patch

Peter Lieven (6):
  block/rbd: bump librbd requirement to luminous release
  block/rbd: store object_size in BDRVRBDState
  block/rbd: update s->image_size in qemu_rbd_getlength
  block/rbd: migrate from aio to coroutines
  block/rbd: add write zeroes support
  block/rbd: drop qemu_rbd_refresh_limits

 block/rbd.c | 406 ++++++++++++++++------------------------------------
 meson.build |   7 +-
 2 files changed, 128 insertions(+), 285 deletions(-)

-- 
2.17.1



