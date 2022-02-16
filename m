Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2AD094B9180
	for <lists+qemu-devel@lfdr.de>; Wed, 16 Feb 2022 20:42:16 +0100 (CET)
Received: from localhost ([::1]:33996 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nKQBq-0001h9-PV
	for lists+qemu-devel@lfdr.de; Wed, 16 Feb 2022 14:42:14 -0500
Received: from eggs.gnu.org ([209.51.188.92]:54986)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1nKQA5-0000q9-8C
 for qemu-devel@nongnu.org; Wed, 16 Feb 2022 14:40:25 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:41714)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1nKQA0-00059T-No
 for qemu-devel@nongnu.org; Wed, 16 Feb 2022 14:40:23 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1645040419;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=1qO5qFUkgFtuIzgPNUYi1VS5oFNi5ibYwiujOCxMKw8=;
 b=XWoa0cWnYjTYDF+53DfCEAvcJZihber9wBH8fGQWmCbGBdnJyQjua0DZyvgnRc7NHVRS7y
 XWohQQxmQWYeFRxHpHxGkC9MSjw1MBlkUVvClRLg/0u8Kr8ZRRSiP4S87DHJ5tBsNq8b7J
 cxV3ffEntHA55v1/EBDtzYhcYwiKCIc=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-217-B2rMcWl3Nbemumy19Y75Jg-1; Wed, 16 Feb 2022 14:40:18 -0500
X-MC-Unique: B2rMcWl3Nbemumy19Y75Jg-1
Received: by mail-wm1-f72.google.com with SMTP id
 ay41-20020a05600c1e2900b0037c5168b3c4so3283242wmb.7
 for <qemu-devel@nongnu.org>; Wed, 16 Feb 2022 11:40:18 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=1qO5qFUkgFtuIzgPNUYi1VS5oFNi5ibYwiujOCxMKw8=;
 b=jGHQ0GQRfih7vuN8V11+6giCxtRuBJeAjLKt0/OvpWiPc//2qFutyeij3GA0sOA0cL
 CZsasp9JHOCvpeepzWOu0D4PhE7Sa6vQ8lS2Wat84+oPXWALuIWl5GSVQLXR8/4Kjvik
 qbPB1PfsHkiDyCFbA1gZbHheWN5gWySdk3lc246hZx/Zeo/hjEh3eZOtnyvOelqeTWva
 Rj4S+mwmuYtaEQcj57FMKlFs37o+v6rrcaHlfu3qEN30ELCC+BPGKrhWROY55I6Oq+Ix
 IzFOZd9kEVQKWIeLFNYW3cC/0ukjsLYDaFT+531hbJhIVdYPnZKMaeXNB5un6s75oJAT
 UGng==
X-Gm-Message-State: AOAM532il5k4jEGwLkpCf8Xk0zvGiiJpOVw/uDJbSOjek7hK0yBG9c0g
 SmhOLwlqOVJkNwXc7Ojijm3H96HM8thCzII6utnh+DdC/pw+PQVc4fDCe4dvE4x0MOfe/Ejz0Jc
 denyI6VNDNI+HiEAKHb9YtVPwfplfe7WjIIYapAGnq0GWmHuRIEFXjt8mDpvSZZtb9oA=
X-Received: by 2002:a05:600c:2158:b0:37b:f39b:d4bf with SMTP id
 v24-20020a05600c215800b0037bf39bd4bfmr3069070wml.129.1645040416882; 
 Wed, 16 Feb 2022 11:40:16 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwnkcYDh/iaB91QxcbXE9oSj9Ju54draTRU2y9V5RdlmORcPTCEJrI8pHCRQooTSj+5JilrLQ==
X-Received: by 2002:a05:600c:2158:b0:37b:f39b:d4bf with SMTP id
 v24-20020a05600c215800b0037bf39bd4bfmr3069041wml.129.1645040416558; 
 Wed, 16 Feb 2022 11:40:16 -0800 (PST)
Received: from work-vm (cpc109025-salf6-2-0-cust480.10-2.cable.virginm.net.
 [82.30.61.225])
 by smtp.gmail.com with ESMTPSA id b16sm27914494wrj.26.2022.02.16.11.40.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 16 Feb 2022 11:40:16 -0800 (PST)
Date: Wed, 16 Feb 2022 19:40:14 +0000
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: qemu-devel@nongnu.org, vgoyal@redhat.com, groug@kaod.org,
 sebastian.hasler@stuvus.uni-stuttgart.de
Subject: Re: [Virtio-fs] [PULL 00/12] virtiofs queue
Message-ID: <Yg1THoNoxjSAcK7u@work-vm>
References: <20220216173625.128109-1-dgilbert@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20220216173625.128109-1-dgilbert@redhat.com>
User-Agent: Mutt/2.1.5 (2021-12-30)
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dgilbert@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.129.124; envelope-from=dgilbert@redhat.com;
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
Cc: virtio-fs@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

* Dr. David Alan Gilbert (git) (dgilbert@redhat.com) wrote:
> From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
> 
> The following changes since commit c13b8e9973635f34f3ce4356af27a311c993729c:
> 
>   Merge remote-tracking branch 'remotes/alistair/tags/pull-riscv-to-apply-20220216' into staging (2022-02-16 09:57:11 +0000)
> 
> are available in the Git repository at:
> 
>   https://gitlab.com/dagrh/qemu.git tags/pull-virtiofs-20220216
> 
> for you to fetch changes up to 47cc3ef597b2ee926c13c9433f4f73645429e128:
> 
>   virtiofsd: Add basic support for FUSE_SYNCFS request (2022-02-16 17:29:32 +0000)

NAK
this doesn't build on older Linuxes.

Rework version in the works.

Dave

> ----------------------------------------------------------------
> virtiofs pull 2022-02-16
> 
> Security label improvements from Vivek
>   - includes a fix for building against new kernel headers
> Blocking flock disable from Sebastian
> SYNCFS support from Greg
> 
> Signed-off-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
> 
> ----------------------------------------------------------------
> Greg Kurz (1):
>       virtiofsd: Add basic support for FUSE_SYNCFS request
> 
> Sebastian Hasler (1):
>       virtiofsd: Do not support blocking flock
> 
> Vivek Goyal (10):
>       virtiofsd: Fix breakage due to fuse_init_in size change
>       linux-headers: Update headers to v5.17-rc1
>       virtiofsd: Parse extended "struct fuse_init_in"
>       virtiofsd: Extend size of fuse_conn_info->capable and ->want fields
>       virtiofsd, fuse_lowlevel.c: Add capability to parse security context
>       virtiofsd: Move core file creation code in separate function
>       virtiofsd: Add helpers to work with /proc/self/task/tid/attr/fscreate
>       virtiofsd: Create new file with security context
>       virtiofsd: Create new file using O_TMPFILE and set security context
>       virtiofsd: Add an option to enable/disable security label
> 
>  docs/tools/virtiofsd.rst                       |  32 ++
>  include/standard-headers/asm-x86/kvm_para.h    |   1 +
>  include/standard-headers/drm/drm_fourcc.h      |  11 +
>  include/standard-headers/linux/ethtool.h       |   1 +
>  include/standard-headers/linux/fuse.h          |  60 +++-
>  include/standard-headers/linux/pci_regs.h      | 142 ++++----
>  include/standard-headers/linux/virtio_gpio.h   |  72 ++++
>  include/standard-headers/linux/virtio_i2c.h    |  47 +++
>  include/standard-headers/linux/virtio_iommu.h  |   8 +-
>  include/standard-headers/linux/virtio_pcidev.h |  65 ++++
>  include/standard-headers/linux/virtio_scmi.h   |  24 ++
>  linux-headers/asm-generic/unistd.h             |   5 +-
>  linux-headers/asm-mips/unistd_n32.h            |   2 +
>  linux-headers/asm-mips/unistd_n64.h            |   2 +
>  linux-headers/asm-mips/unistd_o32.h            |   2 +
>  linux-headers/asm-powerpc/unistd_32.h          |   2 +
>  linux-headers/asm-powerpc/unistd_64.h          |   2 +
>  linux-headers/asm-riscv/bitsperlong.h          |  14 +
>  linux-headers/asm-riscv/mman.h                 |   1 +
>  linux-headers/asm-riscv/unistd.h               |  44 +++
>  linux-headers/asm-s390/unistd_32.h             |   2 +
>  linux-headers/asm-s390/unistd_64.h             |   2 +
>  linux-headers/asm-x86/kvm.h                    |  16 +-
>  linux-headers/asm-x86/unistd_32.h              |   1 +
>  linux-headers/asm-x86/unistd_64.h              |   1 +
>  linux-headers/asm-x86/unistd_x32.h             |   1 +
>  linux-headers/linux/kvm.h                      |  17 +
>  tools/virtiofsd/fuse_common.h                  |   9 +-
>  tools/virtiofsd/fuse_i.h                       |   7 +
>  tools/virtiofsd/fuse_lowlevel.c                | 179 ++++++++--
>  tools/virtiofsd/fuse_lowlevel.h                |  13 +
>  tools/virtiofsd/helper.c                       |   1 +
>  tools/virtiofsd/passthrough_ll.c               | 467 +++++++++++++++++++++++--
>  tools/virtiofsd/passthrough_seccomp.c          |   1 +
>  34 files changed, 1122 insertions(+), 132 deletions(-)
>  create mode 100644 include/standard-headers/linux/virtio_gpio.h
>  create mode 100644 include/standard-headers/linux/virtio_i2c.h
>  create mode 100644 include/standard-headers/linux/virtio_pcidev.h
>  create mode 100644 include/standard-headers/linux/virtio_scmi.h
>  create mode 100644 linux-headers/asm-riscv/bitsperlong.h
>  create mode 100644 linux-headers/asm-riscv/mman.h
>  create mode 100644 linux-headers/asm-riscv/unistd.h
> 
> _______________________________________________
> Virtio-fs mailing list
> Virtio-fs@redhat.com
> https://listman.redhat.com/mailman/listinfo/virtio-fs
> 
-- 
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK


