Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EBD1636D60D
	for <lists+qemu-devel@lfdr.de>; Wed, 28 Apr 2021 13:04:50 +0200 (CEST)
Received: from localhost ([::1]:33562 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lbhzt-0007WF-F6
	for lists+qemu-devel@lfdr.de; Wed, 28 Apr 2021 07:04:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35822)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1lbhwY-0005lr-7Y
 for qemu-devel@nongnu.org; Wed, 28 Apr 2021 07:01:22 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:53634)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1lbhwT-0004i8-2m
 for qemu-devel@nongnu.org; Wed, 28 Apr 2021 07:01:21 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1619607675;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=4uRVeKt+FTB3xrJx1aQO+TnvqfhXBS5ooAUna5Gld30=;
 b=U/M+x6C3Y5cr4dHsQq9CmWBTmzY1qd9QosIE64sboP0c438LaNP1ufusQMsd1mlqnNtJ0w
 pnw82SA7e22MEqLBhzhSGJrmAeekDg5rRvnal6VWxJpcnVUvhlf24TOWM6FeWcrRL4kn9w
 zMgw9PRLmWG10qEgYtACNDn26TEJzBQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-439-UElF3sWyMmiXW_UkyFRCyQ-1; Wed, 28 Apr 2021 07:01:10 -0400
X-MC-Unique: UElF3sWyMmiXW_UkyFRCyQ-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E134D107ACCD;
 Wed, 28 Apr 2021 11:01:09 +0000 (UTC)
Received: from dgilbert-t580.localhost (ovpn-115-35.ams2.redhat.com
 [10.36.115.35])
 by smtp.corp.redhat.com (Postfix) with ESMTP id A07C91002388;
 Wed, 28 Apr 2021 11:01:02 +0000 (UTC)
From: "Dr. David Alan Gilbert (git)" <dgilbert@redhat.com>
To: qemu-devel@nongnu.org, vgoyal@redhat.com, stefanha@redhat.com,
 groug@kaod.org
Subject: [PATCH v3 00/26] virtiofs dax patches
Date: Wed, 28 Apr 2021 12:00:34 +0100
Message-Id: <20210428110100.27757-1-dgilbert@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dgilbert@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=dgilbert@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.22,
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
Cc: virtio-fs@redhat.com
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

(This series, with a couple of other patches, is at:
https://gitlab.com/virtio-fs/qemu/-/tree/dgilbert-dax-2021-04-28 )

Dave

v3
  Review cleanups
  Fix some printf formating issues

Dr. David Alan Gilbert (21):
  virtiofs: Fixup printf args
  virtiofsd: Don't assume header layout
  DAX: vhost-user: Rework slave return values
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
 hw/virtio/vhost-user.c                    |  62 +++-
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
 tools/virtiofsd/passthrough_ll.c          | 138 +++++++-
 26 files changed, 1393 insertions(+), 130 deletions(-)

-- 
2.31.1


