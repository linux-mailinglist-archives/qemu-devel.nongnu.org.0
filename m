Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D34514B8761
	for <lists+qemu-devel@lfdr.de>; Wed, 16 Feb 2022 13:10:28 +0100 (CET)
Received: from localhost ([::1]:41822 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nKJ8d-0004qm-Gi
	for lists+qemu-devel@lfdr.de; Wed, 16 Feb 2022 07:10:27 -0500
Received: from eggs.gnu.org ([209.51.188.92]:54794)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1nKJ74-00047c-RN
 for qemu-devel@nongnu.org; Wed, 16 Feb 2022 07:08:50 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:37060)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1nKJ71-0003EB-6s
 for qemu-devel@nongnu.org; Wed, 16 Feb 2022 07:08:49 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1645013325;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=aFfEoOZI8eZ32VojTj7c21HXaRb7/hwtvPQ8itBHP2g=;
 b=eIr0jZvFuvmoJCC0/53N4qbBreHQHnLmhu+O0iFxyaWSu1L58azKaJM/vFw7shyGFALlBF
 HEkOJy0uQ6U6C+DPFWP5ocNqM58iIT0SQ0XrOrmUUwgGn5UMgDT53xfy9PeFDYSJY/9cD9
 XSpClIc8MyvS2IkcQQ/Pp5Vig8RfM8g=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-584-jiu6UBMANt-RdATt8Xv4mg-1; Wed, 16 Feb 2022 07:08:44 -0500
X-MC-Unique: jiu6UBMANt-RdATt8Xv4mg-1
Received: by mail-wm1-f71.google.com with SMTP id
 u14-20020a05600c210e00b0037bddd0562eso389522wml.1
 for <qemu-devel@nongnu.org>; Wed, 16 Feb 2022 04:08:44 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to:user-agent;
 bh=aFfEoOZI8eZ32VojTj7c21HXaRb7/hwtvPQ8itBHP2g=;
 b=R39uPYKA3xDn6B//TsNYL8X3hc9wUb/3HcQtyUpcFn1E/PQJIn/ubq6dg/LRGUnTCO
 ed3sPBrXMt0uGGXTSsZ6uHqYO+g8oIGfdm8MpIBn7h2fzECteUKK8rDd69PEVRDU11Zc
 +/kSo3PmGpwKhYi4ngYaoQ1HgmRsGcfxiIsXdeQvlDNdZz92td9YwiyhjcFJvKJ4UKP1
 6vt+UZ7QHKP7OcFd0mBt0ZVRkTyJXzX+j2R/lTgziIAV8zksghP6dHNy+SvWQlSPR8CG
 Vmtxyy3ZpMQ1TjzvJpngNZswcrWQQ8+Tb44/hio8vpLIZkIdCcQ05bYPLT3N3kj93DMP
 3rdw==
X-Gm-Message-State: AOAM531i7W8zJ9TarHCL9mma7H7IbmdmV/pQNyay1/Big8umkbXNGCcX
 CqdRe6eu+yoO7JaLLItDcphc2y7u3J7EkeN+zSQ2mHntwOlAWkffP2JOHq3zRxBVpj3q2R4X0yp
 2mVwbrYTasDh+k4g=
X-Received: by 2002:adf:e98d:0:b0:1e7:5ea6:7222 with SMTP id
 h13-20020adfe98d000000b001e75ea67222mr2030441wrm.579.1645013323299; 
 Wed, 16 Feb 2022 04:08:43 -0800 (PST)
X-Google-Smtp-Source: ABdhPJznjTbhZgyVSO2ZjOx1EQtP9RJcw0xp+9EQ60ArBChdrO3B0t8pdeOLsMC7EeM8P00cAiFy4w==
X-Received: by 2002:adf:e98d:0:b0:1e7:5ea6:7222 with SMTP id
 h13-20020adfe98d000000b001e75ea67222mr2030415wrm.579.1645013322897; 
 Wed, 16 Feb 2022 04:08:42 -0800 (PST)
Received: from work-vm (cpc109025-salf6-2-0-cust480.10-2.cable.virginm.net.
 [82.30.61.225])
 by smtp.gmail.com with ESMTPSA id c9sm15554840wrn.51.2022.02.16.04.08.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 16 Feb 2022 04:08:41 -0800 (PST)
Date: Wed, 16 Feb 2022 12:08:40 +0000
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: Vivek Goyal <vgoyal@redhat.com>
Subject: Re: [PATCH v6 00/10] virtiofsd: Add support for file security
 context at file creation
Message-ID: <YgzpSIIolYItX4Mj@work-vm>
References: <20220208204813.682906-1-vgoyal@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20220208204813.682906-1-vgoyal@redhat.com>
User-Agent: Mutt/2.1.5 (2021-12-30)
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dgilbert@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=dgilbert@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.083,
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
Cc: virtio-fs@redhat.com, mszeredi@redhat.com, berrange@redhat.com,
 qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Queued

* Vivek Goyal (vgoyal@redhat.com) wrote:
> Hi,
> 
> This is V6 of the patches. I posted V5 here.
> 
> https://listman.redhat.com/archives/virtio-fs/2022-February/msg00012.html
> 
> This patch series basically allows client to send a security context 
> (which is expected to be xattr security.selinux and its content) to
> virtiofsd and it will set that security context on file during creation
> based on various settings. Hence, this patch series basically allows
> supporting SELinux with virtiofs.
> 
> There are primarily 3 modes.
> 
> - If no security context enabled, then it continues to create files without
>   security context.
> 
> - If security context is enabled and but security.selinux has not been
>   remapped, then it uses /proc/thread-self/attr/fscreate knob to set
>   security context and then create the file. This will make sure that
>   newly created file gets the security context as set in "fscreate" and
>   this is atomic w.r.t file creation.
> 
>   This is useful and host and guest SELinux policies don't conflict and
>   can work with each other. In that case, guest security.selinux xattr
>   is not remapped and it is passthrough as "security.selinux" xattr
>   on host.
> 
> - If security context is enabled but security.selinux xattr has been
>   remapped to something else, then it first creates the file and then
>   uses setxattr() to set the remapped xattr with the security context.
>   This is a non-atomic operation w.r.t file creation.
> 
>   This mode will be most versatile and allow host and guest to have their
>   own separate SELinux xattrs and have their own separate SELinux policies.
> 
> Changes since V5:
> 
> - Added some documentation to recommend using xattr remapping to remap
>   "security.selinux" to "trusted.virtiofs.security.selinux" and also 
>   give CAP_SYS_ADMIN to daemon. Also put a warning to make users aware
>   of trade-off involved here. ("Daniel P. Berrangé")
> 
> - Used macro endof() to determine end of fuse_init_in struct. (David
>   Gilbert).
> 
> - Added a check to make sure fsecctx->size is not zero. Also added
>   "return" statement at few places where it was required. (David Gilbert)
> 
> - Split patch 7 in the series. Some of the handling of setting and
>   clearing fscreate knob has been moved into a separate patch. Found
>   it hard to break it down further. So it helps a bit but not too
>   much. (David Gilbert).
> 
> Thanks
> Vivek
> 
> Vivek Goyal (10):
>   virtiofsd: Fix breakage due to fuse_init_in size change
>   linux-headers: Update headers to v5.17-rc1
>   virtiofsd: Parse extended "struct fuse_init_in"
>   virtiofsd: Extend size of fuse_conn_info->capable and ->want fields
>   virtiofsd, fuse_lowlevel.c: Add capability to parse security context
>   virtiofsd: Move core file creation code in separate function
>   virtiofsd: Add helpers to work with /proc/self/task/tid/attr/fscreate
>   virtiofsd: Create new file with security context
>   virtiofsd: Create new file using O_TMPFILE and set security context
>   virtiofsd: Add an option to enable/disable security label
> 
>  docs/tools/virtiofsd.rst                      |  32 ++
>  include/standard-headers/asm-x86/kvm_para.h   |   1 +
>  include/standard-headers/drm/drm_fourcc.h     |  11 +
>  include/standard-headers/linux/ethtool.h      |   1 +
>  include/standard-headers/linux/fuse.h         |  60 ++-
>  include/standard-headers/linux/pci_regs.h     | 142 +++---
>  include/standard-headers/linux/virtio_gpio.h  |  72 +++
>  include/standard-headers/linux/virtio_i2c.h   |  47 ++
>  include/standard-headers/linux/virtio_iommu.h |   8 +-
>  .../standard-headers/linux/virtio_pcidev.h    |  65 +++
>  include/standard-headers/linux/virtio_scmi.h  |  24 +
>  linux-headers/asm-generic/unistd.h            |   5 +-
>  linux-headers/asm-mips/unistd_n32.h           |   2 +
>  linux-headers/asm-mips/unistd_n64.h           |   2 +
>  linux-headers/asm-mips/unistd_o32.h           |   2 +
>  linux-headers/asm-powerpc/unistd_32.h         |   2 +
>  linux-headers/asm-powerpc/unistd_64.h         |   2 +
>  linux-headers/asm-riscv/bitsperlong.h         |  14 +
>  linux-headers/asm-riscv/mman.h                |   1 +
>  linux-headers/asm-riscv/unistd.h              |  44 ++
>  linux-headers/asm-s390/unistd_32.h            |   2 +
>  linux-headers/asm-s390/unistd_64.h            |   2 +
>  linux-headers/asm-x86/kvm.h                   |  16 +-
>  linux-headers/asm-x86/unistd_32.h             |   1 +
>  linux-headers/asm-x86/unistd_64.h             |   1 +
>  linux-headers/asm-x86/unistd_x32.h            |   1 +
>  linux-headers/linux/kvm.h                     |  17 +
>  tools/virtiofsd/fuse_common.h                 |   9 +-
>  tools/virtiofsd/fuse_i.h                      |   7 +
>  tools/virtiofsd/fuse_lowlevel.c               | 168 +++++--
>  tools/virtiofsd/helper.c                      |   1 +
>  tools/virtiofsd/passthrough_ll.c              | 414 ++++++++++++++++--
>  32 files changed, 1044 insertions(+), 132 deletions(-)
>  create mode 100644 include/standard-headers/linux/virtio_gpio.h
>  create mode 100644 include/standard-headers/linux/virtio_i2c.h
>  create mode 100644 include/standard-headers/linux/virtio_pcidev.h
>  create mode 100644 include/standard-headers/linux/virtio_scmi.h
>  create mode 100644 linux-headers/asm-riscv/bitsperlong.h
>  create mode 100644 linux-headers/asm-riscv/mman.h
>  create mode 100644 linux-headers/asm-riscv/unistd.h
> 
> -- 
> 2.34.1
> 
> 
-- 
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK


