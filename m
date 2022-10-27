Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E2D336101A6
	for <lists+qemu-devel@lfdr.de>; Thu, 27 Oct 2022 21:30:05 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1oo7le-000245-9H; Thu, 27 Oct 2022 14:38:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1oo7h7-0002Fs-Nl
 for qemu-devel@nongnu.org; Thu, 27 Oct 2022 14:33:38 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1oo7gl-0002fW-60
 for qemu-devel@nongnu.org; Thu, 27 Oct 2022 14:33:18 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1666895590;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Ont5OY/p1dCszK0NdqMlPoyItWNOK6wvLadp9Tq8jhY=;
 b=Cc35LD+I7/6xON9xE68NuZ1jpLbirOyhq32812LmtIz2OhKlvgB10Cia9GbYE/xVPQCwKE
 krW9GRnCGjsUD0XvMSlS2iWsgnd1KttJikQONTyQp1HnWTgt6Gx6ubKepgFcdfWTDx3wif
 FNx35CVEX6LrL6lkDmtkz2QA/5srqas=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-25-fsN_soeoNiKV-0fRKkr9Sw-1; Thu, 27 Oct 2022 14:33:08 -0400
X-MC-Unique: fsN_soeoNiKV-0fRKkr9Sw-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
 [10.11.54.3])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 17E72185A78B;
 Thu, 27 Oct 2022 18:33:08 +0000 (UTC)
Received: from merkur.fritz.box (unknown [10.39.194.12])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 573F41121320;
 Thu, 27 Oct 2022 18:33:07 +0000 (UTC)
From: Kevin Wolf <kwolf@redhat.com>
To: qemu-block@nongnu.org
Cc: kwolf@redhat.com,
	stefanha@redhat.com,
	qemu-devel@nongnu.org
Subject: [PULL 58/58] block/block-backend: blk_set_enable_write_cache is
 IO_CODE
Date: Thu, 27 Oct 2022 20:31:46 +0200
Message-Id: <20221027183146.463129-59-kwolf@redhat.com>
In-Reply-To: <20221027183146.463129-1-kwolf@redhat.com>
References: <20221027183146.463129-1-kwolf@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.3
Received-SPF: pass client-ip=170.10.129.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -25
X-Spam_score: -2.6
X-Spam_bar: --
X-Spam_report: (-2.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.515,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

From: Emanuele Giuseppe Esposito <eesposit@redhat.com>

blk_set_enable_write_cache() is defined as GLOBAL_STATE_CODE
but can be invoked from iothreads when handling scsi requests.
This triggers an assertion failure:

 0x00007fd6c3515ce1 in raise () from /lib/x86_64-linux-gnu/libc.so.6
 0x00007fd6c34ff537 in abort () from /lib/x86_64-linux-gnu/libc.so.6
 0x00007fd6c34ff40f in ?? () from /lib/x86_64-linux-gnu/libc.so.6
 0x00007fd6c350e662 in __assert_fail () from /lib/x86_64-linux-gnu/libc.so.6
 0x000056149e2cea03 in blk_set_enable_write_cache (wce=true, blk=0x5614a01c27f0)
   at ../src/block/block-backend.c:1949
 0x000056149e2d0a67 in blk_set_enable_write_cache (blk=0x5614a01c27f0,
   wce=<optimized out>) at ../src/block/block-backend.c:1951
 0x000056149dfe9c59 in scsi_disk_apply_mode_select (p=0x7fd6b400c00e "\004",
   page=<optimized out>, s=<optimized out>) at ../src/hw/scsi/scsi-disk.c:1520
 mode_select_pages (change=true, len=18, p=0x7fd6b400c00e "\004", r=0x7fd6b4001ff0)
   at ../src/hw/scsi/scsi-disk.c:1570
 scsi_disk_emulate_mode_select (inbuf=<optimized out>, r=0x7fd6b4001ff0) at
   ../src/hw/scsi/scsi-disk.c:1640
 scsi_disk_emulate_write_data (req=0x7fd6b4001ff0) at ../src/hw/scsi/scsi-disk.c:1934
 0x000056149e18ff16 in virtio_scsi_handle_cmd_req_submit (req=<optimized out>,
   req=<optimized out>, s=0x5614a12f16b0) at ../src/hw/scsi/virtio-scsi.c:719
 virtio_scsi_handle_cmd_vq (vq=0x7fd6bab92140, s=0x5614a12f16b0) at
   ../src/hw/scsi/virtio-scsi.c:761
 virtio_scsi_handle_cmd (vq=<optimized out>, vdev=<optimized out>) at
   ../src/hw/scsi/virtio-scsi.c:775
 virtio_scsi_handle_cmd (vdev=0x5614a12f16b0, vq=0x7fd6bab92140) at
   ../src/hw/scsi/virtio-scsi.c:765
 0x000056149e1a8aa6 in virtio_queue_notify_vq (vq=0x7fd6bab92140) at
   ../src/hw/virtio/virtio.c:2365
 0x000056149e3ccea5 in aio_dispatch_handler (ctx=ctx@entry=0x5614a01babe0,
   node=<optimized out>) at ../src/util/aio-posix.c:369
 0x000056149e3cd868 in aio_dispatch_ready_handlers (ready_list=0x7fd6c09b2680,
   ctx=0x5614a01babe0) at ../src/util/aio-posix.c:399
 aio_poll (ctx=0x5614a01babe0, blocking=blocking@entry=true) at
   ../src/util/aio-posix.c:713
 0x000056149e2a7796 in iothread_run (opaque=opaque@entry=0x56149ffde500) at
   ../src/iothread.c:67
 0x000056149e3d0859 in qemu_thread_start (args=0x7fd6c09b26f0) at
   ../src/util/qemu-thread-posix.c:504
 0x00007fd6c36b9ea7 in start_thread () from /lib/x86_64-linux-gnu/libpthread.so.0
 0x00007fd6c35d9aef in clone () from /lib/x86_64-linux-gnu/libc.so.6

Changing GLOBAL_STATE_CODE in IO_CODE is allowed, since GSC callers are
allowed to call IO_CODE.

Resolves: #1272

Signed-off-by: Emanuele Giuseppe Esposito <eesposit@redhat.com>
Message-Id: <20221027072726.2681500-1-eesposit@redhat.com>
Reviewed-by: Kevin Wolf <kwolf@redhat.com>
Reviewed-by: Hanna Reitz <hreitz@redhat.com>
Tested-by: Antoine Damhet <antoine.damhet@shadow.tech>
Signed-off-by: Kevin Wolf <kwolf@redhat.com>
---
 block/block-backend.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/block/block-backend.c b/block/block-backend.c
index 705afef9b3..ec17dc49a9 100644
--- a/block/block-backend.c
+++ b/block/block-backend.c
@@ -1944,7 +1944,7 @@ bool blk_enable_write_cache(BlockBackend *blk)
 
 void blk_set_enable_write_cache(BlockBackend *blk, bool wce)
 {
-    GLOBAL_STATE_CODE();
+    IO_CODE();
     blk->enable_write_cache = wce;
 }
 
-- 
2.37.3


