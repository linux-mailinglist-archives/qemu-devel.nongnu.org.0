Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1464B35F844
	for <lists+qemu-devel@lfdr.de>; Wed, 14 Apr 2021 17:55:01 +0200 (CEST)
Received: from localhost ([::1]:59036 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lWhr2-00019E-3R
	for lists+qemu-devel@lfdr.de; Wed, 14 Apr 2021 11:55:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34152)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1lWho0-0007mZ-Hz
 for qemu-devel@nongnu.org; Wed, 14 Apr 2021 11:51:52 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:54239)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1lWhnv-0000JT-EI
 for qemu-devel@nongnu.org; Wed, 14 Apr 2021 11:51:52 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1618415506;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=4vybUiUK2X6zwUqPhg1FqEHm9YGKL0jFThPAGvYlZ6Q=;
 b=CznTCBZNlI9xj7cP/n5mUvszmq6c6eXAdtBsqeDO2HjS0Kxv6i6ETa06sk1uwWMdkDTJJz
 yqpajRF8rKi2v2YyzSYMc8+DAIa1FxdK9JQUGzAxErUCMQft/HW/Raaxzxag4hIEHj0Nr6
 1ittnYr4EfDMZHhySkLEMbC/dvxfjWM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-431-7ipLM1XZOHKJX7PTb_MuIg-1; Wed, 14 Apr 2021 11:51:42 -0400
X-MC-Unique: 7ipLM1XZOHKJX7PTb_MuIg-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 86A5E106BB4D
 for <qemu-devel@nongnu.org>; Wed, 14 Apr 2021 15:51:41 +0000 (UTC)
Received: from dgilbert-t580.localhost (ovpn-115-158.ams2.redhat.com
 [10.36.115.158])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 653E160240;
 Wed, 14 Apr 2021 15:51:40 +0000 (UTC)
From: "Dr. David Alan Gilbert (git)" <dgilbert@redhat.com>
To: qemu-devel@nongnu.org, stefanha@redhat.com, vgoyal@redhat.com,
 virtio-fs@redhat.com
Subject: [PATCH v2 00/25] virtiofs dax patches
Date: Wed, 14 Apr 2021 16:51:12 +0100
Message-Id: <20210414155137.46522-1-dgilbert@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dgilbert@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=dgilbert@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>

  This series adds support for acceleration of virtiofs via DAX
mapping, using features added in the 5.11 Linux kernel.

  DAX originally existed in the kernel for mapping real storage
devices directly into memory, so that reads/writes turn into
reads/writes directly mapped into the storage device.

  virtiofs's DAX support is similar; a PCI BAR is exposed on the
virtiofs device corresponding to a DAX 'cache' of a user defined size.
The guest daemon then requests files to be mapped into that cache;
when that happens the virtiofsd sends filedescriptors and commands back
to the QEMU that mmap's those files directly into the memory slot
exposed to kvm.  The guest can then directly read/write to the files
exposed by virtiofs by reading/writing into the BAR.

  A typical invocation would be:
     -device vhost-user-fs-pci,queue-size=1024,chardev=char0,tag=myfs,cache-size=4G 

and then the guest must mount with -o dax

  Note that the cache doesn't really take VM up on the host, because
everything placed there is just an mmap of a file, so you can afford
to use quite a large cache size.

  Unlike a real DAX device, the cache is a finite size that's
potentially smaller than the underlying filesystem (especially when
mapping granuality is taken into account).  Mapping, unmapping and
remapping must take place to juggle files into the cache if it's too
small.  Some workloads benefit more than others.

Gotchas:
  a) If something else on the host truncates an mmap'd file,
kvm gets rather upset;  for this reason it's advised that DAX is
currently only suitable for use on non-shared filesystems.

Dave

v2
  Cleanups from first review, rebase on current head

Dr. David Alan Gilbert (20):
  DAX: vhost-user: Rework slave return values
  virtiofsd: Don't assume header layout
  DAX: libvhost-user: Route slave message payload
  DAX: libvhost-user: Allow popping a queue element with bad pointers
  DAX subprojects/libvhost-user: Add virtio-fs slave types
  DAX: virtio: Add shared memory capability
  DAX: virtio-fs: Add cache BAR
  DAX: virtio-fs: Add vhost-user slave commands for mapping
  DAX: virtio-fs: Fill in slave commands for mapping
  DAX: virtiofsd Add cache accessor functions
  DAX: virtiofsd: Add setup/remove mappings fuse commands
  DAX: virtiofsd: Add setup/remove mapping handlers to passthrough_ll
  DAX: virtiofsd: Wire up passthrough_ll's lo_setupmapping
  DAX: virtiofsd: route se down to destroy method
  DAX: virtiofsd: Perform an unmap on destroy
  DAX/unmap: virtiofsd: Add VHOST_USER_SLAVE_FS_IO
  DAX/unmap virtiofsd: Add wrappers for VHOST_USER_SLAVE_FS_IO
  DAX/unmap virtiofsd: Parse unmappable elements
  DAX/unmap virtiofsd: Route unmappable reads
  DAX/unmap virtiofsd: route unmappable write to slave command

Stefan Hajnoczi (1):
  DAX:virtiofsd: implement FUSE_INIT map_alignment field

Vivek Goyal (4):
  DAX: virtiofsd: Make lo_removemapping() work
  vhost-user-fs: Extend VhostUserFSSlaveMsg to pass additional info
  vhost-user-fs: Implement drop CAP_FSETID functionality
  virtiofsd: Ask qemu to drop CAP_FSETID if client asked for it

 block/export/vhost-user-blk-server.c      |   2 +-
 contrib/vhost-user-blk/vhost-user-blk.c   |   3 +-
 contrib/vhost-user-gpu/vhost-user-gpu.c   |   5 +-
 contrib/vhost-user-input/main.c           |   4 +-
 contrib/vhost-user-scsi/vhost-user-scsi.c |   2 +-
 docs/interop/vhost-user.rst               |  37 ++
 hw/virtio/meson.build                     |   1 +
 hw/virtio/trace-events                    |   6 +
 hw/virtio/vhost-backend.c                 |   6 +-
 hw/virtio/vhost-user-fs-pci.c             |  32 ++
 hw/virtio/vhost-user-fs.c                 | 395 ++++++++++++++++++++++
 hw/virtio/vhost-user.c                    |  60 +++-
 hw/virtio/virtio-pci.c                    |  20 ++
 hw/virtio/virtio-pci.h                    |   4 +
 include/hw/virtio/vhost-backend.h         |   2 +-
 include/hw/virtio/vhost-user-fs.h         |  43 +++
 meson.build                               |   6 +
 subprojects/libvhost-user/libvhost-user.c | 113 ++++++-
 subprojects/libvhost-user/libvhost-user.h |  57 +++-
 tests/vhost-user-bridge.c                 |   4 +-
 tools/virtiofsd/buffer.c                  |  22 +-
 tools/virtiofsd/fuse_common.h             |  17 +-
 tools/virtiofsd/fuse_lowlevel.c           |  92 ++++-
 tools/virtiofsd/fuse_lowlevel.h           |  78 ++++-
 tools/virtiofsd/fuse_virtio.c             | 372 ++++++++++++++++----
 tools/virtiofsd/passthrough_ll.c          | 117 ++++++-
 26 files changed, 1380 insertions(+), 120 deletions(-)

-- 
2.31.1


