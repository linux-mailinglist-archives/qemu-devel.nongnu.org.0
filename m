Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 657E246E9E9
	for <lists+qemu-devel@lfdr.de>; Thu,  9 Dec 2021 15:26:08 +0100 (CET)
Received: from localhost ([::1]:60332 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mvKN4-00083I-Tv
	for lists+qemu-devel@lfdr.de; Thu, 09 Dec 2021 09:26:06 -0500
Received: from eggs.gnu.org ([209.51.188.92]:49760)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1mvKKJ-0006TB-3a
 for qemu-devel@nongnu.org; Thu, 09 Dec 2021 09:23:17 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:30033)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1mvKKF-0002FL-7K
 for qemu-devel@nongnu.org; Thu, 09 Dec 2021 09:23:12 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1639059790;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=6HXk94Amc9Res95h63mWGwKBtpPj+cAGMHMrZFyisj8=;
 b=JGD0c2WjqmiKXO31yoI2DQQAj9jo5qt1GLgl09gtnvSHzW4e0kqtGTRX7Nk1bqacnxHU43
 biogHOQITwXy7w0HgRXMtYKBMiz8/7SHaYhwqW/L5c26jEZ8d5jDdJrrp7jhpuzYrWXXpQ
 AWn+p65xAS3TKguQNVniQ0hKZvL9tQE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-257-tF03HV_yNSindHJsRwHn7Q-1; Thu, 09 Dec 2021 09:23:07 -0500
X-MC-Unique: tF03HV_yNSindHJsRwHn7Q-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 57111100C623;
 Thu,  9 Dec 2021 14:23:06 +0000 (UTC)
Received: from localhost (unknown [10.39.194.236])
 by smtp.corp.redhat.com (Postfix) with ESMTP id EFE425D6CF;
 Thu,  9 Dec 2021 14:23:05 +0000 (UTC)
From: Stefan Hajnoczi <stefanha@redhat.com>
To: qemu-devel@nongnu.org
Subject: [RFC] block-backend: prevent dangling BDS pointer in blk_drain()
Date: Thu,  9 Dec 2021 14:23:04 +0000
Message-Id: <20211209142304.381253-1-stefanha@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=stefanha@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.129.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -33
X-Spam_score: -3.4
X-Spam_bar: ---
X-Spam_report: (-3.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.618,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Kevin Wolf <kwolf@redhat.com>, Hanna Reitz <hreitz@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, qemu-block@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The BlockBackend root child can change during bdrv_drained_begin() when
aio_poll() is invoked. In fact the BlockDriverState can reach refcnt 0
and blk_drain() is left with a dangling BDS pointer.

One example is scsi_device_purge_requests(), which calls blk_drain() to
wait for in-flight requests to cancel. If the backup blockjob is active,
then the BlockBackend root child is a temporary filter BDS owned by the
blockjob. The blockjob can complete during bdrv_drained_begin() and the
last reference to the BDS is released when the temporary filter node is
removed. This results in a use-after-free when blk_drain() calls
bdrv_drained_end(bs) on the dangling pointer.

The general problem is that a function and its callers must not assume
that bs is still valid across aio_poll(). Explicitly hold a reference to
bs in blk_drain() to avoid the dangling pointer.

Signed-off-by: Stefan Hajnoczi <stefanha@redhat.com>
---
I found that BDS nodes are sometimes deleted with bs->quiesce_counter >
0 (at least when running "make check"), so it is currently not possible
to put the bdrv_ref/unref() calls in bdrv_do_drained_begin() and
bdrv_do_drained_end() because they will be unbalanced. That would have
been a more general solution than only fixing blk_drain().

Any suggestions for a better fix?

I think it's likely that more "dangling pointer across aio_poll()"
problems exist :(.

Here is the (hacky) reproducer:

  build/qemu-system-x86_64 \
     -name 'avocado-vt-vm1'  \
     -sandbox on  \
     -machine q35,memory-backend=mem-machine_mem \
     -device pcie-root-port,id=pcie-root-port-0,multifunction=on,bus=pcie.0,addr=0x1,chassis=1 \
     -device pcie-pci-bridge,id=pcie-pci-bridge-0,addr=0x0,bus=pcie-root-port-0  \
     -nodefaults \
     -device VGA,bus=pcie.0,addr=0x2 \
     -m 1024 \
     -object memory-backend-ram,size=1024M,id=mem-machine_mem  \
     -smp 10,maxcpus=10,cores=5,threads=1,dies=1,sockets=2  \
     -cpu 'Cascadelake-Server-noTSX',+kvm_pv_unhalt \
     -chardev socket,wait=off,server=on,id=qmp_id_qmpmonitor1,path=/tmp/qmp.sock  \
     -mon chardev=qmp_id_qmpmonitor1,mode=control \
     -chardev socket,wait=off,server=on,id=qmp_id_catch_monitor,path=/tmp/catch_monitor.sock  \
     -mon chardev=qmp_id_catch_monitor,mode=control \
     -device pvpanic,ioport=0x505,id=idgKHYrQ \
     -chardev socket,wait=off,server=on,id=chardev_serial0,path=/tmp/serial.sock \
     -device isa-serial,id=serial0,chardev=chardev_serial0  \
     -chardev socket,id=seabioslog_id_20211110-012521-TNCkxDmn,path=/tmp/seabios.sock,server=on,wait=off \
     -device isa-debugcon,chardev=seabioslog_id_20211110-012521-TNCkxDmn,iobase=0x402 \
     -device pcie-root-port,id=pcie-root-port-2,port=0x2,addr=0x1.0x2,bus=pcie.0,chassis=3 \
     -device virtio-scsi-pci,id=virtio_scsi_pci0,bus=pcie-root-port-2,addr=0x0 \
     -blockdev node-name=file_image1,driver=file,auto-read-only=on,discard=unmap,aio=threads,filename=test.img,cache.direct=on,cache.no-flush=off \
     -blockdev node-name=drive_image1,driver=raw,read-only=off,cache.direct=on,cache.no-flush=off,file=file_image1 \
     -device scsi-hd,id=image1,drive=drive_image1,write-cache=on \
     -blockdev node-name=file_src1,driver=file,auto-read-only=on,discard=unmap,aio=threads,filename=sr1.qcow2,cache.direct=on,cache.no-flush=off \
     -blockdev node-name=drive_src1,driver=qcow2,read-only=off,cache.direct=on,cache.no-flush=off,file=file_src1 \
     -device scsi-hd,id=src1,drive=drive_src1,write-cache=on \
     -device pcie-root-port,id=pcie-root-port-3,port=0x3,addr=0x1.0x3,bus=pcie.0,chassis=4 \
     -device virtio-net-pci,mac=9a:11:64:b0:5d:a8,id=idxnEEYY,netdev=idBjpylo,bus=pcie-root-port-3,addr=0x0  \
     -netdev user,id=idBjpylo  \
     -vnc :0  \
     -rtc base=utc,clock=host,driftfix=slew  \
     -boot menu=off,order=cdn,once=c,strict=off \
     -enable-kvm \
     -device pcie-root-port,id=pcie_extra_root_port_0,multifunction=on,bus=pcie.0,addr=0x3,chassis=5 &

  sleep 8 # delay for VM startup and socket creation

  nc -U /tmp/qmp.sock <<EOF
  {'execute': 'qmp_capabilities'}
  {'execute': 'blockdev-create', 'arguments': {'options': {'driver': 'file', 'filename': 'dst1.qcow2', 'size': 209715200}, 'job-id': 'file_dst1'}, 'id': 'Fk1bF3FV'}
  EOF
  sleep 1 # wait for blockdev-create completion
  nc -U /tmp/qmp.sock <<EOF
  {'execute': 'qmp_capabilities'}
  {'execute': 'job-dismiss', 'arguments': {'id': 'file_dst1'}, 'id': '13R5TDSj'}
  {'execute': 'blockdev-add', 'arguments': {'node-name': 'file_dst1', 'driver': 'file', 'filename': 'dst1.qcow2', 'aio': 'threads', 'auto-read-only': true, 'discard': 'unmap'}, 'id': 'VIzrN0zy'}
  {'execute': 'blockdev-create', 'arguments': {'options': {'driver': 'qcow2', 'file': 'file_dst1', 'size': 209715200}, 'job-id': 'drive_dst1'}, 'id': 'YX8t8hBs'}
  EOF
  sleep 1 # wait for blockdev-create completion
  nc -U /tmp/qmp.sock <<EOF
  {'execute': 'qmp_capabilities'}
  {'execute': 'job-dismiss', 'arguments': {'id': 'drive_dst1'}, 'id': 'OTZwYb7J'}
  {'execute': 'blockdev-add', 'arguments': {'node-name': 'drive_dst1', 'driver': 'qcow2', 'file': 'file_dst1', 'read-only': false}, 'id': 'QHyUxtql'}
  {'execute': 'system_reset', 'id': 'OREutgnz'}
  {'execute': 'blockdev-backup', 'arguments': {'device': 'drive_src1', 'target': 'drive_dst1', 'job-id': 'drive_src1_qnFF', 'sync': 'full', 'speed': 0, 'compress': false, 'auto-finalize': true, 'auto-dismiss': true, 'on-source-error': 'report', 'on-target-error': 'report'}, 'id': 'WbDARa8c'}
  EOF
---
 block/block-backend.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/block/block-backend.c b/block/block-backend.c
index 12ef80ea17..5608c0451b 100644
--- a/block/block-backend.c
+++ b/block/block-backend.c
@@ -1705,6 +1705,7 @@ void blk_drain(BlockBackend *blk)
     BlockDriverState *bs = blk_bs(blk);
 
     if (bs) {
+        bdrv_ref(bs);
         bdrv_drained_begin(bs);
     }
 
@@ -1714,6 +1715,7 @@ void blk_drain(BlockBackend *blk)
 
     if (bs) {
         bdrv_drained_end(bs);
+        bdrv_unref(bs);
     }
 }
 
-- 
2.33.1


