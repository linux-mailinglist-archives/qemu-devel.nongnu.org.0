Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A3AA22F1916
	for <lists+qemu-devel@lfdr.de>; Mon, 11 Jan 2021 16:03:36 +0100 (CET)
Received: from localhost ([::1]:46314 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kyyjH-0001vE-8w
	for lists+qemu-devel@lfdr.de; Mon, 11 Jan 2021 10:03:35 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:44724)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1kyygg-0000JV-9v
 for qemu-devel@nongnu.org; Mon, 11 Jan 2021 10:00:54 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:60711)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1kyygc-0001Fy-1c
 for qemu-devel@nongnu.org; Mon, 11 Jan 2021 10:00:54 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1610377248;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=KxzdHapvJrZ6HK01uYKk8KOJtCw1zgnm/U/457rwOUY=;
 b=g1+kEizlY1khWvBmGIGxOHLEZPgqa6huagntdBBrNAdO/CDa17vk7Tj47+k9ChVmRo52BB
 n/ujqiOaUuGdGgX/7EsFyP5uZHUbDkp+5szdFjTWwXrbB5XurN+DuCpGdt9hybtcq5fTtL
 NJICW1z4aI061WOzLc8DWuGKvX1pPes=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-556-SZByzLOYPP6bLumvNZd3Bg-1; Mon, 11 Jan 2021 10:00:46 -0500
X-MC-Unique: SZByzLOYPP6bLumvNZd3Bg-1
Received: by mail-wm1-f72.google.com with SMTP id g82so5228500wmg.6
 for <qemu-devel@nongnu.org>; Mon, 11 Jan 2021 07:00:46 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=KxzdHapvJrZ6HK01uYKk8KOJtCw1zgnm/U/457rwOUY=;
 b=S2Z4DddH5/DnxX352V+kfVaaq9KjiaowassLV2251MJbBkNWH7i7G8lZ5sOzNLJOSD
 qkpoz/Bysw3wkXgxKkYnXnErSRM4ByE8fGr5pGHySP76lpFobTyZvZasBrcT//5M88re
 /E3R40K2FhtmdzI3lVjIBbbELuiq4tnWbHa8VsNv/YFlEJdWyAlIucc8rPmMGf3zfO8I
 2Q1kHb/JrSLsv2+G24P6MM3FqAeeCwGpvYiw3FbMzVcSIdhgqS97NKbwayN6VyGjq+hQ
 JlGGkg3RwXNESsaHX14/QaQfdY/MS/UEYmbiRY4QWQvZFb9zGb9VRONVMYXXsMJ33AxF
 tHlQ==
X-Gm-Message-State: AOAM531QoJHAg42d/vqxcv1uLyxr7oaeZOZzOVV4Y9zWkWf2oAhrEp3B
 9kZx8enoz0yQVJ3FpqepN7uhARjXy6xZLpKKNVkxFcvzYGFzvRMWCHUGfecxJ0NXkEUBzaLtaKt
 4qXp+X+nOtI/zgZY=
X-Received: by 2002:adf:dc10:: with SMTP id t16mr17083057wri.345.1610377243924; 
 Mon, 11 Jan 2021 07:00:43 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzyTS9opi6IgP3DMDSSHvsVQKHar1uTwLU+pGjsFd/RhGAWjrGjgTtHwwpZm+hTMebcR0FwSw==
X-Received: by 2002:adf:dc10:: with SMTP id t16mr17083040wri.345.1610377243749; 
 Mon, 11 Jan 2021 07:00:43 -0800 (PST)
Received: from redhat.com (bzq-79-178-32-166.red.bezeqint.net. [79.178.32.166])
 by smtp.gmail.com with ESMTPSA id t16sm103448wmi.3.2021.01.11.07.00.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 11 Jan 2021 07:00:42 -0800 (PST)
Date: Mon, 11 Jan 2021 10:00:39 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Cornelia Huck <cohuck@redhat.com>
Subject: Re: [PATCH v3 2/3] Update linux headers to 5.11-rc2
Message-ID: <20210111100002-mutt-send-email-mst@kernel.org>
References: <20210104202057.48048-1-farman@linux.ibm.com>
 <20210104202057.48048-3-farman@linux.ibm.com>
 <20210111135404.52f18200.cohuck@redhat.com>
 <20210111075950-mutt-send-email-mst@kernel.org>
 <20210111144322.32812f16.cohuck@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210111144322.32812f16.cohuck@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=63.128.21.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.251,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Thomas Huth <thuth@redhat.com>, qemu-s390x@nongnu.org,
 Eric Farman <farman@linux.ibm.com>, qemu-devel@nongnu.org,
 Alex Williamson <alex.williamson@redhat.com>, stefanha@redhat.com,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, Jan 11, 2021 at 02:43:22PM +0100, Cornelia Huck wrote:
> On Mon, 11 Jan 2021 08:00:45 -0500
> "Michael S. Tsirkin" <mst@redhat.com> wrote:
> 
> > On Mon, Jan 11, 2021 at 01:54:04PM +0100, Cornelia Huck wrote:
> > > On Mon,  4 Jan 2021 21:20:56 +0100
> > > Eric Farman <farman@linux.ibm.com> wrote:
> > >   
> > > > Signed-off-by: Eric Farman <farman@linux.ibm.com>
> > > > ---
> > > >  .../infiniband/hw/vmw_pvrdma/pvrdma_ring.h    |  14 +-
> > > >  .../infiniband/hw/vmw_pvrdma/pvrdma_verbs.h   |   2 +-
> > > >  include/standard-headers/drm/drm_fourcc.h     | 175 +++++++++++++++++-
> > > >  include/standard-headers/linux/const.h        |  36 ++++
> > > >  include/standard-headers/linux/ethtool.h      |   2 +-
> > > >  include/standard-headers/linux/fuse.h         |  30 ++-
> > > >  include/standard-headers/linux/kernel.h       |   9 +-
> > > >  include/standard-headers/linux/pci_regs.h     |  16 ++
> > > >  include/standard-headers/linux/vhost_types.h  |   9 +
> > > >  include/standard-headers/linux/virtio_gpu.h   |  82 ++++++++
> > > >  include/standard-headers/linux/virtio_ids.h   |  44 +++--
> > > >  linux-headers/asm-arm64/kvm.h                 |   3 -
> > > >  linux-headers/asm-generic/unistd.h            |   6 +-
> > > >  linux-headers/asm-mips/unistd_n32.h           |   1 +
> > > >  linux-headers/asm-mips/unistd_n64.h           |   1 +
> > > >  linux-headers/asm-mips/unistd_o32.h           |   1 +
> > > >  linux-headers/asm-powerpc/unistd_32.h         |   1 +
> > > >  linux-headers/asm-powerpc/unistd_64.h         |   1 +
> > > >  linux-headers/asm-s390/unistd_32.h            |   1 +
> > > >  linux-headers/asm-s390/unistd_64.h            |   1 +
> > > >  linux-headers/asm-x86/kvm.h                   |   1 +
> > > >  linux-headers/asm-x86/unistd_32.h             |   1 +
> > > >  linux-headers/asm-x86/unistd_64.h             |   1 +
> > > >  linux-headers/asm-x86/unistd_x32.h            |   1 +
> > > >  linux-headers/linux/kvm.h                     |  56 +++++-
> > > >  linux-headers/linux/userfaultfd.h             |   9 +
> > > >  linux-headers/linux/vfio.h                    |   1 +
> > > >  linux-headers/linux/vhost.h                   |   4 +
> > > >  28 files changed, 461 insertions(+), 48 deletions(-)
> > > >  create mode 100644 include/standard-headers/linux/const.h
> > > > 
> > > > diff --git a/include/standard-headers/drivers/infiniband/hw/vmw_pvrdma/pvrdma_ring.h b/include/standard-headers/drivers/infiniband/hw/vmw_pvrdma/pvrdma_ring.h
> > > > index 7b4062a1a1..acd4c8346d 100644
> > > > --- a/include/standard-headers/drivers/infiniband/hw/vmw_pvrdma/pvrdma_ring.h
> > > > +++ b/include/standard-headers/drivers/infiniband/hw/vmw_pvrdma/pvrdma_ring.h
> > > > @@ -68,7 +68,7 @@ static inline int pvrdma_idx_valid(uint32_t idx, uint32_t max_elems)
> > > >  
> > > >  static inline int32_t pvrdma_idx(int *var, uint32_t max_elems)
> > > >  {
> > > > -	const unsigned int idx = qatomic_read(var);
> > > > +	const unsigned int idx = atomic_read(var);  
> > > 
> > > Hm, what was the state of these qatomic* instances in this header? Is
> > > it ok to rename them, or do we need to do some munging in the import
> > > script?
> > > 
> > > (Sorry, it's been a while.)  
> > 
> > 
> > Yea looks like it was done manually last time:
> > 
> > commit d73415a315471ac0b127ed3fad45c8ec5d711de1
> > Author: Stefan Hajnoczi <stefanha@redhat.com>
> > Date:   Wed Sep 23 11:56:46 2020 +0100
> > 
> >     qemu/atomic.h: rename atomic_ to qatomic_
> 
> It seems that this hunk was dropped manually last time:
> 
> commit 53ba2eee52bff5a746e96835539a1079f6bcadd1
> Author: Matthew Rosato <mjrosato@linux.ibm.com>
> Date:   Mon Oct 26 11:34:30 2020 -0400
> 
>     linux-headers: update against 5.10-rc1
>     
>     commit 3650b228f83adda7e5ee532e2b90429c03f7b9ec
>     
>     Signed-off-by: Matthew Rosato <mjrosato@linux.ibm.com>
>     [aw: drop pvrdma_ring.h changes to avoid revert of d73415a31547 ("qemu/atomic.h: rename atomic_ to qatomic_")]
>     Signed-off-by: Alex Williamson <alex.williamson@redhat.com>
> 
> I can do that as well, but I'm not sure that this is the best way
> forward.

Probably as easy as the following:

Signed-off-by: Michael S. Tsirkin <mst@redhat.com>



diff --git a/scripts/update-linux-headers.sh b/scripts/update-linux-headers.sh
index 9efbaf2f84..c1b4f468d3 100755
--- a/scripts/update-linux-headers.sh
+++ b/scripts/update-linux-headers.sh
@@ -70,6 +70,8 @@ cp_portable() {
         -e 's/__kernel_long_t/long/' \
         -e 's/__kernel_ulong_t/unsigned long/' \
         -e 's/struct ethhdr/struct eth_header/' \
+        -e 's/atomic_read/qatomic_read/' \
+        -e 's/atomic_set/qatomic_set/' \
         -e '/\#define _LINUX_ETHTOOL_H/a \\n\#include "net/eth.h"' \
         "$f" > "$to/$header";
 }

-- 
MST


