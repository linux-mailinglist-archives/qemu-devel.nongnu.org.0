Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D4574AC2CA
	for <lists+qemu-devel@lfdr.de>; Mon,  7 Feb 2022 16:17:56 +0100 (CET)
Received: from localhost ([::1]:34348 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nH5m6-00071p-QN
	for lists+qemu-devel@lfdr.de; Mon, 07 Feb 2022 10:17:54 -0500
Received: from eggs.gnu.org ([209.51.188.92]:60086)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vgoyal@redhat.com>) id 1nH531-0002GT-Ip
 for qemu-devel@nongnu.org; Mon, 07 Feb 2022 09:31:20 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:25581)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vgoyal@redhat.com>) id 1nH52u-0007Bu-MW
 for qemu-devel@nongnu.org; Mon, 07 Feb 2022 09:31:16 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1644244259;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=KSGJoWMRD1sObywWs1688vkFdWAq+6277m+HmjKir2w=;
 b=DYhTHjZkyAfKfAo+fWSE3R6ZicE1Vvti0pESxBzIK2g8j3vFE8hAuU+cRSHuXoLyGJWfQV
 Db8KLJvMaBA4PWKqCquBB6VEDuS/z+w7ykqcmFoHyJ9SQxWBnmO2THOSEkqtdsXzWUSkPK
 erKxYPPO6hqtOO6EHDTIdcgLsOtCcEI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-398-i2sqnLxENLm2OCwpE827Lw-1; Mon, 07 Feb 2022 09:30:56 -0500
X-MC-Unique: i2sqnLxENLm2OCwpE827Lw-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 1024886A8A0
 for <qemu-devel@nongnu.org>; Mon,  7 Feb 2022 14:30:56 +0000 (UTC)
Received: from horse.redhat.com (unknown [10.22.9.190])
 by smtp.corp.redhat.com (Postfix) with ESMTP id BBD8A7DE28;
 Mon,  7 Feb 2022 14:30:55 +0000 (UTC)
Received: by horse.redhat.com (Postfix, from userid 10451)
 id 1057E2237EB; Mon,  7 Feb 2022 09:30:55 -0500 (EST)
Date: Mon, 7 Feb 2022 09:30:55 -0500
From: Vivek Goyal <vgoyal@redhat.com>
To: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
Subject: Re: [PATCH v5 0/9] virtiofsd: Add support for file security context
 at file creation
Message-ID: <YgEtH+MQquXg7CPN@redhat.com>
References: <20220202193935.268777-1-vgoyal@redhat.com>
 <YgEVVLBv9eWbhcDV@work-vm>
MIME-Version: 1.0
In-Reply-To: <YgEVVLBv9eWbhcDV@work-vm>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=vgoyal@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=vgoyal@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: virtio-fs@redhat.com, mszeredi@redhat.com, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, Feb 07, 2022 at 12:49:24PM +0000, Dr. David Alan Gilbert wrote:
> * Vivek Goyal (vgoyal@redhat.com) wrote:
> > Hi,
> > 
> > This is V5 of the patches. I posted V4 here.
> > 
> > https://listman.redhat.com/archives/virtio-fs/2022-January/msg00041.html
> > 
> > These will allow us to support SELinux with virtiofs. This will send
> > SELinux context at file creation to server and server can set it on
> > file.
> 
> I think that's pretty close; I've got some minor comments I've replied
> to on the individual patches.
> 
> I do worry that the number of different paths for each operation is now
> quite large so hard to test.

It is indeed many combinations to test. During development, I have made
sure to test every path atleast once to make sure it works.

> I also wonder what happens on something other than SELinux.

As of now this pretty much works only for SELinux. Especially usage of
fscreate knob is very specific to SELinux.

In some cases, it will work with some other LSM other than SELinux
as well. But lets not go there. 

If we want to support multiple security contexts at some point of time,
fuse procotol changes have been written in such a way so that fuse
can send mutiple security context and then we will have to modify
code to be able to deal with that.

In short, for now, this code is pretty much expectin one security
context that too SELinux. This is very much in line with ceph and
nfs.

Vivek
> 
> Dave
> 
> > Changes since V4
> > ----------------
> > - Parse only known current size of fuse_init_in. This will make sure
> >   that future extension does not break existing code upon header
> >   update. (David Gilbert)
> > 
> > - Changed order of one of the patch. It is first patch in series. This
> >   will help fix the breakage before header update patch and code remains
> >   git bisectable. (David Gilbert)
> > 
> > - Changed %lx to %llx at one place. (David Gilbert).
> > 
> > Thanks
> > Vivek
> >  
> > Vivek Goyal (9):
> >   virtiofsd: Fix breakage due to fuse_init_in size change
> >   linux-headers: Update headers to v5.17-rc1
> >   virtiofsd: Parse extended "struct fuse_init_in"
> >   virtiofsd: Extend size of fuse_conn_info->capable and ->want fields
> >   virtiofsd, fuse_lowlevel.c: Add capability to parse security context
> >   virtiofsd: Move core file creation code in separate function
> >   virtiofsd: Create new file with fscreate set
> >   virtiofsd: Create new file using O_TMPFILE and set security context
> >   virtiofsd: Add an option to enable/disable security label
> > 
> >  docs/tools/virtiofsd.rst                      |   7 +
> >  include/standard-headers/asm-x86/kvm_para.h   |   1 +
> >  include/standard-headers/drm/drm_fourcc.h     |  11 +
> >  include/standard-headers/linux/ethtool.h      |   1 +
> >  include/standard-headers/linux/fuse.h         |  60 ++-
> >  include/standard-headers/linux/pci_regs.h     | 142 +++---
> >  include/standard-headers/linux/virtio_gpio.h  |  72 +++
> >  include/standard-headers/linux/virtio_i2c.h   |  47 ++
> >  include/standard-headers/linux/virtio_iommu.h |   8 +-
> >  .../standard-headers/linux/virtio_pcidev.h    |  65 +++
> >  include/standard-headers/linux/virtio_scmi.h  |  24 +
> >  linux-headers/asm-generic/unistd.h            |   5 +-
> >  linux-headers/asm-mips/unistd_n32.h           |   2 +
> >  linux-headers/asm-mips/unistd_n64.h           |   2 +
> >  linux-headers/asm-mips/unistd_o32.h           |   2 +
> >  linux-headers/asm-powerpc/unistd_32.h         |   2 +
> >  linux-headers/asm-powerpc/unistd_64.h         |   2 +
> >  linux-headers/asm-riscv/bitsperlong.h         |  14 +
> >  linux-headers/asm-riscv/mman.h                |   1 +
> >  linux-headers/asm-riscv/unistd.h              |  44 ++
> >  linux-headers/asm-s390/unistd_32.h            |   2 +
> >  linux-headers/asm-s390/unistd_64.h            |   2 +
> >  linux-headers/asm-x86/kvm.h                   |  16 +-
> >  linux-headers/asm-x86/unistd_32.h             |   1 +
> >  linux-headers/asm-x86/unistd_64.h             |   1 +
> >  linux-headers/asm-x86/unistd_x32.h            |   1 +
> >  linux-headers/linux/kvm.h                     |  17 +
> >  tools/virtiofsd/fuse_common.h                 |   9 +-
> >  tools/virtiofsd/fuse_i.h                      |   7 +
> >  tools/virtiofsd/fuse_lowlevel.c               | 162 +++++--
> >  tools/virtiofsd/helper.c                      |   1 +
> >  tools/virtiofsd/passthrough_ll.c              | 414 ++++++++++++++++--
> >  32 files changed, 1013 insertions(+), 132 deletions(-)
> >  create mode 100644 include/standard-headers/linux/virtio_gpio.h
> >  create mode 100644 include/standard-headers/linux/virtio_i2c.h
> >  create mode 100644 include/standard-headers/linux/virtio_pcidev.h
> >  create mode 100644 include/standard-headers/linux/virtio_scmi.h
> >  create mode 100644 linux-headers/asm-riscv/bitsperlong.h
> >  create mode 100644 linux-headers/asm-riscv/mman.h
> >  create mode 100644 linux-headers/asm-riscv/unistd.h
> > 
> > -- 
> > 2.34.1
> > 
> -- 
> Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK
> 


