Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B42322F1347
	for <lists+qemu-devel@lfdr.de>; Mon, 11 Jan 2021 14:06:57 +0100 (CET)
Received: from localhost ([::1]:60744 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kywuO-0006uv-Q5
	for lists+qemu-devel@lfdr.de; Mon, 11 Jan 2021 08:06:56 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:41650)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1kywoZ-0004Ha-CM
 for qemu-devel@nongnu.org; Mon, 11 Jan 2021 08:00:55 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:43334)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1kywoX-0002HB-HC
 for qemu-devel@nongnu.org; Mon, 11 Jan 2021 08:00:55 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1610370052;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=SaB5XYOWLr705pPFzmGzwiZhjZu5MoF9x8WntSjLBHE=;
 b=FK7XMAWnR9WkmdEZUSAF9//U3q2zZrpi5eDa5wwAXmvTa+KmzD4ane29GhFFUEOcyOBBHc
 UHoPzlMtn1DFTmdSNwW/5ncGNkwig3aqepPKZD9fTI/vGhzZeeKsO577ud3Ej5pLVD9bO8
 e5LJ4dE6YfuITNDi+trgamHvgOr33a0=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-482-ht1xYo65NqCcRbbZz2lNAg-1; Mon, 11 Jan 2021 08:00:50 -0500
X-MC-Unique: ht1xYo65NqCcRbbZz2lNAg-1
Received: by mail-wr1-f69.google.com with SMTP id w5so7730351wrl.9
 for <qemu-devel@nongnu.org>; Mon, 11 Jan 2021 05:00:50 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=SaB5XYOWLr705pPFzmGzwiZhjZu5MoF9x8WntSjLBHE=;
 b=EOCpP6EPM2Vlm663XABdj0JW9556J40SBUc9yoGJ5bODjOQcBNJ5wTsf7VGS1y4vGg
 Vy0rZyU8KxziPM9klny/7ubWXGT2igLFTLYQ73m1Up6JGZkAXyJRorwXVJsK2vnnu41X
 mFt0n8WqCGUJfR/VFXxJqgifyF4Wew6QVmiTDl6La3yR5Nzz2O9avPdCVkKjAQQD4hMW
 AFrQ/BzKaZLM4lzb9s3yVqzcp2oi5ejliWKDvSaJaEzPLhx9VkwVtpE84Eyj9CZwPPJf
 F1hk4WEvA1gVk61XmrJPeNi7bq6vr7e9Iih/UT2d+bNIi2SCq6KAM5axaKofDvZFd68l
 7tdw==
X-Gm-Message-State: AOAM531ZEYfeu2eJ1Xfjc5zxj12W0rcJutiglHmEz5pS80ZI6wjQHUsz
 jeYOy2IP7NggJ2+kR1qmglF0zrK5qA03WQn0q0lcwaCtJW+1LbNnrK+Xdddh2qy49wlx290vPcW
 a3uxQOTO/lNnKWs0=
X-Received: by 2002:adf:dd11:: with SMTP id a17mr16318257wrm.360.1610370049671; 
 Mon, 11 Jan 2021 05:00:49 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzqF4wBfBvfgJ6ePE3H0xhobFzvMuO7X/1P3OnLpdKjjVGuH676xOeiA4SVmbnngkwuNg0q/Q==
X-Received: by 2002:adf:dd11:: with SMTP id a17mr16318230wrm.360.1610370049406; 
 Mon, 11 Jan 2021 05:00:49 -0800 (PST)
Received: from redhat.com (bzq-79-178-32-166.red.bezeqint.net. [79.178.32.166])
 by smtp.gmail.com with ESMTPSA id v1sm21818104wmj.31.2021.01.11.05.00.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 11 Jan 2021 05:00:48 -0800 (PST)
Date: Mon, 11 Jan 2021 08:00:45 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Cornelia Huck <cohuck@redhat.com>
Subject: Re: [PATCH v3 2/3] Update linux headers to 5.11-rc2
Message-ID: <20210111075950-mutt-send-email-mst@kernel.org>
References: <20210104202057.48048-1-farman@linux.ibm.com>
 <20210104202057.48048-3-farman@linux.ibm.com>
 <20210111135404.52f18200.cohuck@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210111135404.52f18200.cohuck@redhat.com>
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

On Mon, Jan 11, 2021 at 01:54:04PM +0100, Cornelia Huck wrote:
> On Mon,  4 Jan 2021 21:20:56 +0100
> Eric Farman <farman@linux.ibm.com> wrote:
> 
> > Signed-off-by: Eric Farman <farman@linux.ibm.com>
> > ---
> >  .../infiniband/hw/vmw_pvrdma/pvrdma_ring.h    |  14 +-
> >  .../infiniband/hw/vmw_pvrdma/pvrdma_verbs.h   |   2 +-
> >  include/standard-headers/drm/drm_fourcc.h     | 175 +++++++++++++++++-
> >  include/standard-headers/linux/const.h        |  36 ++++
> >  include/standard-headers/linux/ethtool.h      |   2 +-
> >  include/standard-headers/linux/fuse.h         |  30 ++-
> >  include/standard-headers/linux/kernel.h       |   9 +-
> >  include/standard-headers/linux/pci_regs.h     |  16 ++
> >  include/standard-headers/linux/vhost_types.h  |   9 +
> >  include/standard-headers/linux/virtio_gpu.h   |  82 ++++++++
> >  include/standard-headers/linux/virtio_ids.h   |  44 +++--
> >  linux-headers/asm-arm64/kvm.h                 |   3 -
> >  linux-headers/asm-generic/unistd.h            |   6 +-
> >  linux-headers/asm-mips/unistd_n32.h           |   1 +
> >  linux-headers/asm-mips/unistd_n64.h           |   1 +
> >  linux-headers/asm-mips/unistd_o32.h           |   1 +
> >  linux-headers/asm-powerpc/unistd_32.h         |   1 +
> >  linux-headers/asm-powerpc/unistd_64.h         |   1 +
> >  linux-headers/asm-s390/unistd_32.h            |   1 +
> >  linux-headers/asm-s390/unistd_64.h            |   1 +
> >  linux-headers/asm-x86/kvm.h                   |   1 +
> >  linux-headers/asm-x86/unistd_32.h             |   1 +
> >  linux-headers/asm-x86/unistd_64.h             |   1 +
> >  linux-headers/asm-x86/unistd_x32.h            |   1 +
> >  linux-headers/linux/kvm.h                     |  56 +++++-
> >  linux-headers/linux/userfaultfd.h             |   9 +
> >  linux-headers/linux/vfio.h                    |   1 +
> >  linux-headers/linux/vhost.h                   |   4 +
> >  28 files changed, 461 insertions(+), 48 deletions(-)
> >  create mode 100644 include/standard-headers/linux/const.h
> > 
> > diff --git a/include/standard-headers/drivers/infiniband/hw/vmw_pvrdma/pvrdma_ring.h b/include/standard-headers/drivers/infiniband/hw/vmw_pvrdma/pvrdma_ring.h
> > index 7b4062a1a1..acd4c8346d 100644
> > --- a/include/standard-headers/drivers/infiniband/hw/vmw_pvrdma/pvrdma_ring.h
> > +++ b/include/standard-headers/drivers/infiniband/hw/vmw_pvrdma/pvrdma_ring.h
> > @@ -68,7 +68,7 @@ static inline int pvrdma_idx_valid(uint32_t idx, uint32_t max_elems)
> >  
> >  static inline int32_t pvrdma_idx(int *var, uint32_t max_elems)
> >  {
> > -	const unsigned int idx = qatomic_read(var);
> > +	const unsigned int idx = atomic_read(var);
> 
> Hm, what was the state of these qatomic* instances in this header? Is
> it ok to rename them, or do we need to do some munging in the import
> script?
> 
> (Sorry, it's been a while.)


Yea looks like it was done manually last time:

commit d73415a315471ac0b127ed3fad45c8ec5d711de1
Author: Stefan Hajnoczi <stefanha@redhat.com>
Date:   Wed Sep 23 11:56:46 2020 +0100

    qemu/atomic.h: rename atomic_ to qatomic_



> >  
> >  	if (pvrdma_idx_valid(idx, max_elems))
> >  		return idx & (max_elems - 1);
> > @@ -77,17 +77,17 @@ static inline int32_t pvrdma_idx(int *var, uint32_t max_elems)
> >  
> >  static inline void pvrdma_idx_ring_inc(int *var, uint32_t max_elems)
> >  {
> > -	uint32_t idx = qatomic_read(var) + 1;	/* Increment. */
> > +	uint32_t idx = atomic_read(var) + 1;	/* Increment. */
> >  
> >  	idx &= (max_elems << 1) - 1;		/* Modulo size, flip gen. */
> > -	qatomic_set(var, idx);
> > +	atomic_set(var, idx);
> >  }
> >  
> >  static inline int32_t pvrdma_idx_ring_has_space(const struct pvrdma_ring *r,
> >  					      uint32_t max_elems, uint32_t *out_tail)
> >  {
> > -	const uint32_t tail = qatomic_read(&r->prod_tail);
> > -	const uint32_t head = qatomic_read(&r->cons_head);
> > +	const uint32_t tail = atomic_read(&r->prod_tail);
> > +	const uint32_t head = atomic_read(&r->cons_head);
> >  
> >  	if (pvrdma_idx_valid(tail, max_elems) &&
> >  	    pvrdma_idx_valid(head, max_elems)) {
> > @@ -100,8 +100,8 @@ static inline int32_t pvrdma_idx_ring_has_space(const struct pvrdma_ring *r,
> >  static inline int32_t pvrdma_idx_ring_has_data(const struct pvrdma_ring *r,
> >  					     uint32_t max_elems, uint32_t *out_head)
> >  {
> > -	const uint32_t tail = qatomic_read(&r->prod_tail);
> > -	const uint32_t head = qatomic_read(&r->cons_head);
> > +	const uint32_t tail = atomic_read(&r->prod_tail);
> > +	const uint32_t head = atomic_read(&r->cons_head);
> >  
> >  	if (pvrdma_idx_valid(tail, max_elems) &&
> >  	    pvrdma_idx_valid(head, max_elems)) {


