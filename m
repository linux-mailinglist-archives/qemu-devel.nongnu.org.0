Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F0F0D2F197D
	for <lists+qemu-devel@lfdr.de>; Mon, 11 Jan 2021 16:20:09 +0100 (CET)
Received: from localhost ([::1]:54182 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kyyzI-0001Kt-PH
	for lists+qemu-devel@lfdr.de; Mon, 11 Jan 2021 10:20:08 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:49812)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1kyyxv-0000dI-6s
 for qemu-devel@nongnu.org; Mon, 11 Jan 2021 10:18:43 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:23005)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1kyyxq-0003vN-9J
 for qemu-devel@nongnu.org; Mon, 11 Jan 2021 10:18:42 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1610378317;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=H+ZBty/oZwt6h8zQQ4eN19BC0MhGCkaMP0tAwP5roSI=;
 b=ELIWLd6yzQ3C6BJ3TpaCjZf9p1D6n24YlJ1xFdWo9H89Y5KSpkvZg9Msypkv03bE73wJG+
 ViPIYngCMUcazOG4bMlMyCb/CDShhb8E7kHOsV1kcb73m6pitdMmjfp4cjOufWRooeU7EY
 ZAcZrSogrrg/0P9HcDyIltufslro46s=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-307-wpXDVDLfPk2uE-vHldrZ8g-1; Mon, 11 Jan 2021 10:18:35 -0500
X-MC-Unique: wpXDVDLfPk2uE-vHldrZ8g-1
Received: by mail-wr1-f72.google.com with SMTP id q18so7969006wrc.20
 for <qemu-devel@nongnu.org>; Mon, 11 Jan 2021 07:18:35 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=H+ZBty/oZwt6h8zQQ4eN19BC0MhGCkaMP0tAwP5roSI=;
 b=KBQZaP7jLOMcA7dl4nebC3uozVD9+Gr8vdGADraKQ+4IXugza5Rbzkc2OAWr/QsH73
 Tnmi8zuElpY876PGri8Tb/+K3mHyoBLFvYJc5SvNViAM2GnQzS3jjPlbVYI7G5qk+3TQ
 /rUb6FskPVSc4Xw6HH3RFRhHyVcWaIPGOHuDva4Jq/td+Nw+PKg4jNAq+nuhSePkESeJ
 JstUduN53J2dGb1Mw/vBp6U31L4YTGXbdhOY1+dkB8sjhZkLE+GsysJ2KBe+P/qrvqfL
 fWtEwsuj/aJlgjnHnNiDmYBToy9ooXLFvOejkv0XFxd4pAJH8/loraOvMCeSKhoSaWtL
 nDxA==
X-Gm-Message-State: AOAM5323BBlUC16/mzswm4+P8rooWsqgUu/A4KMle0coqiwRfjVXYQSV
 H9lvpXEe21gTdDtfrtcV0B8fWsUH5SDzi747IQvKCrB0+D7qkjEraoEAMibJ0LmJe+x+UcPYK8L
 B82nFQ4FzSMXVoUg=
X-Received: by 2002:adf:f18a:: with SMTP id h10mr17748056wro.244.1610378312665; 
 Mon, 11 Jan 2021 07:18:32 -0800 (PST)
X-Google-Smtp-Source: ABdhPJz16g2OHuc3rLXp1sjwYGEhzkzF6kfzO9Njrzqed0W6zAiXmSQz/Mz6VhAtqOkUUer4iiRdpg==
X-Received: by 2002:adf:f18a:: with SMTP id h10mr17748024wro.244.1610378312387; 
 Mon, 11 Jan 2021 07:18:32 -0800 (PST)
Received: from redhat.com (bzq-79-178-32-166.red.bezeqint.net. [79.178.32.166])
 by smtp.gmail.com with ESMTPSA id c4sm28021351wrw.72.2021.01.11.07.18.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 11 Jan 2021 07:18:31 -0800 (PST)
Date: Mon, 11 Jan 2021 10:18:28 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Eric Farman <farman@linux.ibm.com>
Subject: Re: [PATCH v3 2/3] Update linux headers to 5.11-rc2
Message-ID: <20210111101313-mutt-send-email-mst@kernel.org>
References: <20210104202057.48048-1-farman@linux.ibm.com>
 <20210104202057.48048-3-farman@linux.ibm.com>
 <20210111135404.52f18200.cohuck@redhat.com>
 <20210111075950-mutt-send-email-mst@kernel.org>
 <20210111144322.32812f16.cohuck@redhat.com>
 <20210111100002-mutt-send-email-mst@kernel.org>
 <5c93b577-7db7-681a-307a-8283bb0ccbe8@linux.ibm.com>
MIME-Version: 1.0
In-Reply-To: <5c93b577-7db7-681a-307a-8283bb0ccbe8@linux.ibm.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.251,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Thomas Huth <thuth@redhat.com>, Cornelia Huck <cohuck@redhat.com>,
 Alex Williamson <alex.williamson@redhat.com>, qemu-devel@nongnu.org,
 qemu-s390x@nongnu.org, stefanha@redhat.com,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, Jan 11, 2021 at 10:11:23AM -0500, Eric Farman wrote:
> 
> 
> On 1/11/21 10:00 AM, Michael S. Tsirkin wrote:
> > On Mon, Jan 11, 2021 at 02:43:22PM +0100, Cornelia Huck wrote:
> > > On Mon, 11 Jan 2021 08:00:45 -0500
> > > "Michael S. Tsirkin" <mst@redhat.com> wrote:
> > > 
> > > > On Mon, Jan 11, 2021 at 01:54:04PM +0100, Cornelia Huck wrote:
> > > > > On Mon,  4 Jan 2021 21:20:56 +0100
> > > > > Eric Farman <farman@linux.ibm.com> wrote:
> > > > > > Signed-off-by: Eric Farman <farman@linux.ibm.com>
> > > > > > ---
> > > > > >   .../infiniband/hw/vmw_pvrdma/pvrdma_ring.h    |  14 +-
> > > > > >   .../infiniband/hw/vmw_pvrdma/pvrdma_verbs.h   |   2 +-
> > > > > >   include/standard-headers/drm/drm_fourcc.h     | 175 +++++++++++++++++-
> > > > > >   include/standard-headers/linux/const.h        |  36 ++++
> > > > > >   include/standard-headers/linux/ethtool.h      |   2 +-
> > > > > >   include/standard-headers/linux/fuse.h         |  30 ++-
> > > > > >   include/standard-headers/linux/kernel.h       |   9 +-
> > > > > >   include/standard-headers/linux/pci_regs.h     |  16 ++
> > > > > >   include/standard-headers/linux/vhost_types.h  |   9 +
> > > > > >   include/standard-headers/linux/virtio_gpu.h   |  82 ++++++++
> > > > > >   include/standard-headers/linux/virtio_ids.h   |  44 +++--
> > > > > >   linux-headers/asm-arm64/kvm.h                 |   3 -
> > > > > >   linux-headers/asm-generic/unistd.h            |   6 +-
> > > > > >   linux-headers/asm-mips/unistd_n32.h           |   1 +
> > > > > >   linux-headers/asm-mips/unistd_n64.h           |   1 +
> > > > > >   linux-headers/asm-mips/unistd_o32.h           |   1 +
> > > > > >   linux-headers/asm-powerpc/unistd_32.h         |   1 +
> > > > > >   linux-headers/asm-powerpc/unistd_64.h         |   1 +
> > > > > >   linux-headers/asm-s390/unistd_32.h            |   1 +
> > > > > >   linux-headers/asm-s390/unistd_64.h            |   1 +
> > > > > >   linux-headers/asm-x86/kvm.h                   |   1 +
> > > > > >   linux-headers/asm-x86/unistd_32.h             |   1 +
> > > > > >   linux-headers/asm-x86/unistd_64.h             |   1 +
> > > > > >   linux-headers/asm-x86/unistd_x32.h            |   1 +
> > > > > >   linux-headers/linux/kvm.h                     |  56 +++++-
> > > > > >   linux-headers/linux/userfaultfd.h             |   9 +
> > > > > >   linux-headers/linux/vfio.h                    |   1 +
> > > > > >   linux-headers/linux/vhost.h                   |   4 +
> > > > > >   28 files changed, 461 insertions(+), 48 deletions(-)
> > > > > >   create mode 100644 include/standard-headers/linux/const.h
> > > > > > 
> > > > > > diff --git a/include/standard-headers/drivers/infiniband/hw/vmw_pvrdma/pvrdma_ring.h b/include/standard-headers/drivers/infiniband/hw/vmw_pvrdma/pvrdma_ring.h
> > > > > > index 7b4062a1a1..acd4c8346d 100644
> > > > > > --- a/include/standard-headers/drivers/infiniband/hw/vmw_pvrdma/pvrdma_ring.h
> > > > > > +++ b/include/standard-headers/drivers/infiniband/hw/vmw_pvrdma/pvrdma_ring.h
> > > > > > @@ -68,7 +68,7 @@ static inline int pvrdma_idx_valid(uint32_t idx, uint32_t max_elems)
> > > > > >   static inline int32_t pvrdma_idx(int *var, uint32_t max_elems)
> > > > > >   {
> > > > > > -	const unsigned int idx = qatomic_read(var);
> > > > > > +	const unsigned int idx = atomic_read(var);
> > > > > 
> > > > > Hm, what was the state of these qatomic* instances in this header? Is
> > > > > it ok to rename them, or do we need to do some munging in the import
> > > > > script?
> > > > > 
> > > > > (Sorry, it's been a while.)
> > > > 
> > > > 
> > > > Yea looks like it was done manually last time:
> > > > 
> > > > commit d73415a315471ac0b127ed3fad45c8ec5d711de1
> > > > Author: Stefan Hajnoczi <stefanha@redhat.com>
> > > > Date:   Wed Sep 23 11:56:46 2020 +0100
> > > > 
> > > >      qemu/atomic.h: rename atomic_ to qatomic_
> > > 
> > > It seems that this hunk was dropped manually last time:
> > > 
> > > commit 53ba2eee52bff5a746e96835539a1079f6bcadd1
> > > Author: Matthew Rosato <mjrosato@linux.ibm.com>
> > > Date:   Mon Oct 26 11:34:30 2020 -0400
> > > 
> > >      linux-headers: update against 5.10-rc1
> > >      commit 3650b228f83adda7e5ee532e2b90429c03f7b9ec
> > >      Signed-off-by: Matthew Rosato <mjrosato@linux.ibm.com>
> > >      [aw: drop pvrdma_ring.h changes to avoid revert of d73415a31547 ("qemu/atomic.h: rename atomic_ to qatomic_")]
> > >      Signed-off-by: Alex Williamson <alex.williamson@redhat.com>
> > > 
> > > I can do that as well, but I'm not sure that this is the best way
> > > forward.
> > 
> > Probably as easy as the following:
> > 
> > Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
> > 
> > 
> > 
> > diff --git a/scripts/update-linux-headers.sh b/scripts/update-linux-headers.sh
> > index 9efbaf2f84..c1b4f468d3 100755
> > --- a/scripts/update-linux-headers.sh
> > +++ b/scripts/update-linux-headers.sh
> > @@ -70,6 +70,8 @@ cp_portable() {
> >           -e 's/__kernel_long_t/long/' \
> >           -e 's/__kernel_ulong_t/unsigned long/' \
> >           -e 's/struct ethhdr/struct eth_header/' \
> > +        -e 's/atomic_read/qatomic_read/' \
> > +        -e 's/atomic_set/qatomic_set/' \
> >           -e '/\#define _LINUX_ETHTOOL_H/a \\n\#include "net/eth.h"' \
> >           "$f" > "$to/$header";
> >   }
> > 
> 
> Possibly, but Paolo mentioned the problem in this space some months ago:
> 
> """
> > It looks like the changes in this file are going to get reverted the
> > next time someone does a linux header sync.
> 
> Source code should not be at all imported from Linux.  The hacks that
> accomodate pvrdma in update-linux-headers.sh (like s/atomic_t/u32/)
> really have no place there; the files in
> include/standard-headers/drivers/infiniband/hw/vmw_pvrdma should all be
> moved in hw/.
> 
> Paolo
> """
> 
> https://lore.kernel.org/qemu-devel/45ba3626-0e06-96c7-5ed8-ea561ae20f15@redhat.com/


Oh right. I think they really should be moved to UAPI in Linux.
Any takers? Maybe it's just this basically:

Signed-off-by: Michael S. Tsirkin <mst@redhat.com>


diff --git a/drivers/infiniband/hw/vmw_pvrdma/pvrdma.h b/drivers/infiniband/hw/vmw_pvrdma/pvrdma.h
index c142f5e7f25f..4a4834de9677 100644
--- a/drivers/infiniband/hw/vmw_pvrdma/pvrdma.h
+++ b/drivers/infiniband/hw/vmw_pvrdma/pvrdma.h
@@ -57,9 +57,9 @@
 #include <rdma/ib_verbs.h>
 #include <rdma/vmw_pvrdma-abi.h>
 
-#include "pvrdma_ring.h"
+#include <linux/pvrdma_ring.h>
 #include "pvrdma_dev_api.h"
-#include "pvrdma_verbs.h"
+#include <linux/pvrdma_verbs.h>
 
 /* NOT the same as BIT_MASK(). */
 #define PVRDMA_MASK(n) ((n << 1) - 1)
diff --git a/drivers/infiniband/hw/vmw_pvrdma/pvrdma_dev_api.h b/drivers/infiniband/hw/vmw_pvrdma/pvrdma_dev_api.h
index 86a6c054ea26..d9a8ee79b9c0 100644
--- a/drivers/infiniband/hw/vmw_pvrdma/pvrdma_dev_api.h
+++ b/drivers/infiniband/hw/vmw_pvrdma/pvrdma_dev_api.h
@@ -48,7 +48,7 @@
 
 #include <linux/types.h>
 
-#include "pvrdma_verbs.h"
+#include <linux/pvrdma_verbs.h>
 
 /*
  * PVRDMA version macros. Some new features require updates to PVRDMA_VERSION.
diff --git a/drivers/infiniband/hw/vmw_pvrdma/pvrdma_ring.h b/include/uapi/linux/pvrdma_ring.h
similarity index 100%
rename from drivers/infiniband/hw/vmw_pvrdma/pvrdma_ring.h
rename to include/uapi/linux/pvrdma_ring.h
diff --git a/drivers/infiniband/hw/vmw_pvrdma/pvrdma_verbs.h b/include/uapi/linux/pvrdma_verbs.h
similarity index 100%
rename from drivers/infiniband/hw/vmw_pvrdma/pvrdma_verbs.h
rename to include/uapi/linux/pvrdma_verbs.h
-- 
MST


