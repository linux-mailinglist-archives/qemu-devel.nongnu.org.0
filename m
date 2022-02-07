Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 982304ABF8D
	for <lists+qemu-devel@lfdr.de>; Mon,  7 Feb 2022 14:26:45 +0100 (CET)
Received: from localhost ([::1]:42476 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nH42W-0008A0-9O
	for lists+qemu-devel@lfdr.de; Mon, 07 Feb 2022 08:26:44 -0500
Received: from eggs.gnu.org ([209.51.188.92]:35026)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1nH3SY-0005M2-9u
 for qemu-devel@nongnu.org; Mon, 07 Feb 2022 07:49:34 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:23877)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1nH3SU-0005Ux-R0
 for qemu-devel@nongnu.org; Mon, 07 Feb 2022 07:49:33 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1644238169;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=p6sRkc/bSFltWCuOmYQxsvHKRbn2HgpGjlihB6+OU2E=;
 b=jWbP3naYgE+HPZn7iUT1ZpE4HG1UkWgx7BxFxmYytOx4L/fU8k5XrobFhUtIp2btKNPNv2
 b+cgdlKBw0I9zIZqb1Z+xq1GHeVk5fuMwwamNo7WekjYROdXcYvhfTuBX7cleZZaO5ijc7
 xLvvDq19Fa86k5G18ow8bQnpAnuag0o=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-652-FUEOMW10P-mmdEEC34A80A-1; Mon, 07 Feb 2022 07:49:28 -0500
X-MC-Unique: FUEOMW10P-mmdEEC34A80A-1
Received: by mail-wm1-f69.google.com with SMTP id
 v185-20020a1cacc2000000b0034906580813so12204413wme.1
 for <qemu-devel@nongnu.org>; Mon, 07 Feb 2022 04:49:28 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=p6sRkc/bSFltWCuOmYQxsvHKRbn2HgpGjlihB6+OU2E=;
 b=jQqlemSpY5EAZAV0utRk5QwUkRAmZzERn427q5FT4qurI62fkRPjE3eU7k/Mz9MOVI
 breZEMjUKkmTq469IdJep+antrGbe5iHYGFgtmJIUyE4ATuuvNzGQ6rcmWqy1IsStxMP
 JHzEJX166sORiVk2g49HHmF9UNNtpOAr9sHw5UbR5GAVij5IXPZ2c8jfNH54+11k2aOE
 wTVnZsP+j+Q/PdX701+6bgPciMoUHVy7X7bjLbPrC29RtGpvdNqU49FwmmEN0fcHEgko
 /+etEgqQ8jP+Zb9IQhENBiuMF4H3hTJjGl6wXo6vZeXyIfY+Rw3vrnw6jeVdZq/leQ+x
 OwHQ==
X-Gm-Message-State: AOAM5307ueOpjWXdKAwD0O5t4MVvbgVeNgx+CNAuNZYDGOV3cQclItW3
 kV/Ie8A5Q9tbhWHR76fIuM9+I7SPSGV/NRZIRizzflWRJs4cul/JH8eB7H2f0HcoMoGTCOpoOwh
 FNleEUAXtLkU4KFQ=
X-Received: by 2002:adf:f90c:: with SMTP id b12mr9732031wrr.97.1644238167658; 
 Mon, 07 Feb 2022 04:49:27 -0800 (PST)
X-Google-Smtp-Source: ABdhPJy5OsOP5Jr0QvlqliI1Llo6d126kRPFvM/nxKs8MweYEOZ1pqYvOaKVxLQs2q88j2p3GXcv6A==
X-Received: by 2002:adf:f90c:: with SMTP id b12mr9732013wrr.97.1644238167422; 
 Mon, 07 Feb 2022 04:49:27 -0800 (PST)
Received: from work-vm (cpc109025-salf6-2-0-cust480.10-2.cable.virginm.net.
 [82.30.61.225])
 by smtp.gmail.com with ESMTPSA id z1sm17221653wmk.32.2022.02.07.04.49.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 07 Feb 2022 04:49:26 -0800 (PST)
Date: Mon, 7 Feb 2022 12:49:24 +0000
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: Vivek Goyal <vgoyal@redhat.com>
Subject: Re: [PATCH v5 0/9] virtiofsd: Add support for file security context
 at file creation
Message-ID: <YgEVVLBv9eWbhcDV@work-vm>
References: <20220202193935.268777-1-vgoyal@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20220202193935.268777-1-vgoyal@redhat.com>
User-Agent: Mutt/2.1.5 (2021-12-30)
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dgilbert@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=dgilbert@redhat.com;
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

* Vivek Goyal (vgoyal@redhat.com) wrote:
> Hi,
> 
> This is V5 of the patches. I posted V4 here.
> 
> https://listman.redhat.com/archives/virtio-fs/2022-January/msg00041.html
> 
> These will allow us to support SELinux with virtiofs. This will send
> SELinux context at file creation to server and server can set it on
> file.

I think that's pretty close; I've got some minor comments I've replied
to on the individual patches.

I do worry that the number of different paths for each operation is now
quite large so hard to test.
I also wonder what happens on something other than SELinux.

Dave

> Changes since V4
> ----------------
> - Parse only known current size of fuse_init_in. This will make sure
>   that future extension does not break existing code upon header
>   update. (David Gilbert)
> 
> - Changed order of one of the patch. It is first patch in series. This
>   will help fix the breakage before header update patch and code remains
>   git bisectable. (David Gilbert)
> 
> - Changed %lx to %llx at one place. (David Gilbert).
> 
> Thanks
> Vivek
>  
> Vivek Goyal (9):
>   virtiofsd: Fix breakage due to fuse_init_in size change
>   linux-headers: Update headers to v5.17-rc1
>   virtiofsd: Parse extended "struct fuse_init_in"
>   virtiofsd: Extend size of fuse_conn_info->capable and ->want fields
>   virtiofsd, fuse_lowlevel.c: Add capability to parse security context
>   virtiofsd: Move core file creation code in separate function
>   virtiofsd: Create new file with fscreate set
>   virtiofsd: Create new file using O_TMPFILE and set security context
>   virtiofsd: Add an option to enable/disable security label
> 
>  docs/tools/virtiofsd.rst                      |   7 +
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
>  tools/virtiofsd/fuse_lowlevel.c               | 162 +++++--
>  tools/virtiofsd/helper.c                      |   1 +
>  tools/virtiofsd/passthrough_ll.c              | 414 ++++++++++++++++--
>  32 files changed, 1013 insertions(+), 132 deletions(-)
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
-- 
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK


