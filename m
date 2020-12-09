Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 957B72D4C8B
	for <lists+qemu-devel@lfdr.de>; Wed,  9 Dec 2020 22:11:50 +0100 (CET)
Received: from localhost ([::1]:32886 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kn6kX-0003s8-4x
	for lists+qemu-devel@lfdr.de; Wed, 09 Dec 2020 16:11:49 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:37392)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1kn6iE-0002lI-6X
 for qemu-devel@nongnu.org; Wed, 09 Dec 2020 16:09:26 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:51970)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1kn6i4-0007Yi-RU
 for qemu-devel@nongnu.org; Wed, 09 Dec 2020 16:09:25 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1607548153;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=RiaBUL5k4dMly9+omfwucdEG2CvRbzD1wN56fc/RXOE=;
 b=f20UxxdGrFBDKFnIUPIr1QswhcIUanswDlI8R0y7EqeIMJNIMgCvuGmRb+VGnuJniQntz1
 8+zNCqVctKNyHF8Tt3/Ke5FpIuHDOR6xAFIsSp0OTqWK2HC0QSnKL2Bk8CN2sMsZ9bRg4l
 jGWCgtqWRVOKGSpiTA1XnEpFSepV/8Y=
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com
 [209.85.219.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-330-RSuJjQWyMAGu0l08y41m8Q-1; Wed, 09 Dec 2020 16:09:10 -0500
X-MC-Unique: RSuJjQWyMAGu0l08y41m8Q-1
Received: by mail-qv1-f69.google.com with SMTP id h1so2211981qvr.7
 for <qemu-devel@nongnu.org>; Wed, 09 Dec 2020 13:09:10 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=RiaBUL5k4dMly9+omfwucdEG2CvRbzD1wN56fc/RXOE=;
 b=W3aSszZoA13SPaSmApcNklthHShTUwlSnmF1FxwW4VLDNl2tGEzmRyEFbKu9SeURdp
 WbL1AO4i/o7K5vScQ/P4g0hqUnCyhpRllFOFNV+giTuVnb+qCclQlIbKuDfZaxggX7KY
 IGL1X4Ej/NthwXsmszSOJQeXx5x0VgQ6LFpPTbJVKaycgICbVBSw9ynqFhTLLBH7ozK1
 I2BjaQLKjqBRtHqD2X8xUlqt5yFc+aFRhCx6j8Wh71D0q8e5DMcpChrzkuj9Mwe7Ilrh
 EN/WW32uQoqjweqCHhypXq9/LK/dIDKZG46yxSOF0NmZLHEaHk1b/7hxcf9/wsDaXix1
 O8Pw==
X-Gm-Message-State: AOAM530XxabCkZxcs1onBZZ4B3vp4/iYlJs//v7En5ZrB7Ov55W3/Ihz
 TzcUSaUOty5ufTpmgBwi0e2d5oQvaFtyMtIPBYZARbieYcaY9l6S6rMFExuxYLwb5J7zvwLT4DD
 q06hL8GbqUfDDANg=
X-Received: by 2002:a0c:bf0f:: with SMTP id m15mr5054411qvi.23.1607548149615; 
 Wed, 09 Dec 2020 13:09:09 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzKZuGFpl1daSb5ILNFa4veh5w9Fw+x4CFDzimF0yQw1i9otHc7dpVfpAPn9sCbbdJ3arZnYw==
X-Received: by 2002:a0c:bf0f:: with SMTP id m15mr5054390qvi.23.1607548149327; 
 Wed, 09 Dec 2020 13:09:09 -0800 (PST)
Received: from xz-x1 ([142.126.83.202])
 by smtp.gmail.com with ESMTPSA id w15sm1667315qta.95.2020.12.09.13.09.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 09 Dec 2020 13:09:08 -0800 (PST)
Date: Wed, 9 Dec 2020 16:09:07 -0500
From: Peter Xu <peterx@redhat.com>
To: Zenghui Yu <yuzenghui@huawei.com>
Subject: Re: [PATCH] kvm: Take into account the unaligned section size when
 preparing bitmap
Message-ID: <20201209210907.GA3211@xz-x1>
References: <20201208114013.875-1-yuzenghui@huawei.com>
 <20201208151654.GA6432@xz-x1>
 <bb4bcc8b-1d36-9529-d7cd-4d93162d092f@huawei.com>
MIME-Version: 1.0
In-Reply-To: <bb4bcc8b-1d36-9529-d7cd-4d93162d092f@huawei.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=peterx@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Received-SPF: pass client-ip=63.128.21.124; envelope-from=peterx@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: pbonzini@redhat.com, qemu-devel@nongnu.org, wanghaibin.wang@huawei.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Dec 09, 2020 at 10:33:41AM +0800, Zenghui Yu wrote:
> Hi Peter,
> 
> Thanks for having a look at it.
> 
> On 2020/12/8 23:16, Peter Xu wrote:
> > Hi, Zenghui,
> > 
> > On Tue, Dec 08, 2020 at 07:40:13PM +0800, Zenghui Yu wrote:
> > > The kernel KVM_CLEAR_DIRTY_LOG interface has align requirement on both the
> > > start and the size of the given range of pages. We have been careful to
> > > handle the unaligned cases when performing CLEAR on one slot. But it seems
> > > that we forget to take the unaligned *size* case into account when
> > > preparing bitmap for the interface, and we may end up clearing dirty status
> > > for pages outside of [start, start + size).
> > 
> > Thanks for the patch, though my understanding is that this is not a bug.
> > 
> > Please have a look at kvm_memslot_init_dirty_bitmap() where we'll allocate the
> > dirty bitmap to be aligned to 8 bytes (assuming that's the possible max of the
> > value sizeof(unsigned long)).  That exactly covers 64 pages.
> > 
> > So here as long as start_delta==0 (so the value of "bmap_npages - size / psize"
> > won't really matter a lot, imho), then we'll definitely have KVMSlot.dirty_bmap
> > long enough to cover the range we'd like to clear.
> 
> I agree.  But actually I'm not saying that KVMSlot.dirty_bmap is not
> long enough.  What I was having in mind is something like:
> 
>     // psize = qemu_real_host_page_size;
>     // slot.start_addr = 0;
>     // slot.memory_size = 64 * psize;
> 
>     kvm_log_clear_one_slot(slot, as, 0 * psize, 32 * psize);   --> [1]
>     kvm_log_clear_one_slot(slot, as, 32 * psize, 32 * psize);  --> [2]
> 
> So the @size is not aligned with 64 pages.  Before this patch, we'll
> clear dirty status for all pages(0-63) through [1].  It looks to me that
> this violates the caller's expectation since we only want to clear
> pages(0-31).

Now I see; I think you're right. :)

> 
> As I said, I don't think this will happen in practice -- the migration
> code should always provide us with a 64-page aligned section (right?).

Yes, migration is the major consumer, and that should be guaranteed indeed, see
CLEAR_BITMAP_SHIFT_MIN.

Not sure about VGA - that should try to do log clear even without migration,
but I guess that satisfies the 64-page alignment too, since it's not a huge
number (256KB).  The VGA buffer size could be related to screen resolution,
then N*1024*768 could still guarantee a safe use of the fast path.

> I'm just thinking about the correctness of the specific algorithm used
> by kvm_log_clear_one_slot().

Yeah, then I think it's okay to have this, just in case someday we'll hit it.

Acked-by: Peter Xu <peterx@redhat.com>

(It would be nicer if above example could be squashed into commit message)

Thanks,

-- 
Peter Xu


