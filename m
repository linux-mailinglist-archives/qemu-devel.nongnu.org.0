Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 107796AB27F
	for <lists+qemu-devel@lfdr.de>; Sun,  5 Mar 2023 22:28:38 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pYvtb-00017U-SX; Sun, 05 Mar 2023 16:27:55 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1pYvtZ-00017K-Jg
 for qemu-devel@nongnu.org; Sun, 05 Mar 2023 16:27:53 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1pYvtX-0004IF-SY
 for qemu-devel@nongnu.org; Sun, 05 Mar 2023 16:27:53 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1678051670;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=k734qmaN9PRhJ3oHmIcNARK9SfC+11nEE2VWWgbE73c=;
 b=C+X6dw0P+Q7REzqr/4WaJZQIuoNqmDThAuKcGy8YumvyRETgeR+/DuGT5MvpdMuJahJjHC
 G3ajHO53BfW6XllLVKXu/JGbw6Eqv2WTUgSrzTX1ir8s9uODoR1EivfFkXL32b0lLpAM34
 goufcr0I5l2ZfdOr7LlSl58twmGE0tk=
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-230-CIfZvI76NW6Zl0HsLEA65w-1; Sun, 05 Mar 2023 16:27:48 -0500
X-MC-Unique: CIfZvI76NW6Zl0HsLEA65w-1
Received: by mail-qk1-f198.google.com with SMTP id
 19-20020a370c13000000b007428253bb55so4369113qkm.23
 for <qemu-devel@nongnu.org>; Sun, 05 Mar 2023 13:27:48 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678051668;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=k734qmaN9PRhJ3oHmIcNARK9SfC+11nEE2VWWgbE73c=;
 b=YhKLGRdEQofR6y1VFjGjIP3RRvAe0cL3Wb4PW9R99q2tvjHL3/sjVtBEg90B6R/rr3
 xmQWXD5xGEgdz4uRmB8N2Iphhp4EAhraiN2tkbRI0/C3ukxD1wSaAQL8bZ/yUCm0ViWI
 NqUFwH0zVMADgBSEc8gnbcTOlXMy9mYj8gcbmMMbW7VxyT88+L+KHOT+mwK1RW8PEPux
 DlxoVorreL3lrk+dCnw05L82FX0DqH07VidV6vUCTUMILEkUqHfYlQyulXVu4hACoe01
 WH9K/0VzVaBxKZtg/zzgwaoZlgEsJbGmtrlLJOniSQGeTcNkxPrRPrZW5WJsSi4Ng+L7
 ZB4A==
X-Gm-Message-State: AO0yUKXvgmiUddpybbw15fRd99i+/f+GU6UmJXULvPG78Esc13Pd4QRG
 MIFflySqXwkyARVZQ/A7jb4KniMFo+Ohsv3kIvmKeWUn+MpNK7AC6Pn93vtV0MSe8zjQS8nXxFv
 NCpKhEvo69ZIwtWY=
X-Received: by 2002:ac8:4e49:0:b0:3bf:c458:5bac with SMTP id
 e9-20020ac84e49000000b003bfc4585bacmr17748814qtw.0.1678051668335; 
 Sun, 05 Mar 2023 13:27:48 -0800 (PST)
X-Google-Smtp-Source: AK7set+DePi4Gs38tIEZMxVVRZR/Wo4n/nPn//5/yNvFBJkSz3S27/dGC3qgJkX/a2uY/lnLl5SvdQ==
X-Received: by 2002:ac8:4e49:0:b0:3bf:c458:5bac with SMTP id
 e9-20020ac84e49000000b003bfc4585bacmr17748788qtw.0.1678051668078; 
 Sun, 05 Mar 2023 13:27:48 -0800 (PST)
Received: from x1n (bras-base-aurron9127w-grc-56-70-30-145-63.dsl.bell.ca.
 [70.30.145.63]) by smtp.gmail.com with ESMTPSA id
 t1-20020a37ea01000000b00742301f1bfbsm6151246qkj.45.2023.03.05.13.27.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 05 Mar 2023 13:27:47 -0800 (PST)
Date: Sun, 5 Mar 2023 16:27:45 -0500
From: Peter Xu <peterx@redhat.com>
To: Jason Wang <jasowang@redhat.com>
Cc: "Longpeng(Mike)" <longpeng2@huawei.com>, pbonzini@redhat.com,
 david@redhat.com, philmd@linaro.org, mst@redhat.com,
 qemu-devel@nongnu.org, eperezma@redhat.com, arei.gonglei@huawei.com,
 yechuan@huawei.com
Subject: Re: [PATCH] memory: avoid unnecessary iteration when updating
 ioeventfds
Message-ID: <ZAUJUfxeqDDpRhZW@x1n>
References: <20230228142514.2582-1-longpeng2@huawei.com>
 <CACGkMEtvGwCVzSa1UpXK971bynNqybPAVa3QQ9e9Hw04j-ivHQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CACGkMEtvGwCVzSa1UpXK971bynNqybPAVa3QQ9e9Hw04j-ivHQ@mail.gmail.com>
Received-SPF: pass client-ip=170.10.133.124; envelope-from=peterx@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Wed, Mar 01, 2023 at 04:36:20PM +0800, Jason Wang wrote:
> On Tue, Feb 28, 2023 at 10:25 PM Longpeng(Mike) <longpeng2@huawei.com> wrote:
> >
> > From: Longpeng <longpeng2@huawei.com>
> >
> > When updating ioeventfds, we need to iterate all address spaces and
> > iterate all flat ranges of each address space. There is so much
> > redundant process that a FlatView would be iterated for so many times
> > during one commit (memory_region_transaction_commit).
> >
> > We can mark a FlatView as UPDATED and then skip it in the next iteration
> > and clear the UPDATED flag at the end of the commit. The overhead can
> > be significantly reduced.
> >
> > For example, a VM with 16 vdpa net devices and each one has 65 vectors,
> > can reduce the time spent on memory_region_transaction_commit by 95%.
> >
> > Signed-off-by: Longpeng <longpeng2@huawei.com>
> > ---
> >  include/exec/memory.h |  2 ++
> >  softmmu/memory.c      | 28 +++++++++++++++++++++++++++-
> >  2 files changed, 29 insertions(+), 1 deletion(-)
> >
> > diff --git a/include/exec/memory.h b/include/exec/memory.h
> > index 2e602a2fad..974eabf765 100644
> > --- a/include/exec/memory.h
> > +++ b/include/exec/memory.h
> > @@ -1093,6 +1093,8 @@ struct FlatView {
> >      unsigned nr_allocated;
> >      struct AddressSpaceDispatch *dispatch;
> >      MemoryRegion *root;
> > +#define FLATVIEW_FLAG_IOEVENTFD_UPDATED (1 << 0)
> > +    unsigned flags;
> >  };
> >
> >  static inline FlatView *address_space_to_flatview(AddressSpace *as)
> > diff --git a/softmmu/memory.c b/softmmu/memory.c
> > index 9d64efca26..71ff996712 100644
> > --- a/softmmu/memory.c
> > +++ b/softmmu/memory.c
> > @@ -815,6 +815,15 @@ FlatView *address_space_get_flatview(AddressSpace *as)
> >      return view;
> >  }
> >
> > +static void address_space_reset_view_flags(AddressSpace *as, unsigned mask)
> > +{
> > +    FlatView *view = address_space_get_flatview(as);
> > +
> > +    if (view->flags & mask) {
> > +        view->flags &= ~mask;
> > +    }
> > +}
> > +
> >  static void address_space_update_ioeventfds(AddressSpace *as)
> >  {
> >      FlatView *view;
> > @@ -825,6 +834,12 @@ static void address_space_update_ioeventfds(AddressSpace *as)
> >      AddrRange tmp;
> >      unsigned i;
> >
> > +    view = address_space_get_flatview(as);
> > +    if (view->flags & FLATVIEW_FLAG_IOEVENTFD_UPDATED) {
> > +        return;
> > +    }
> > +    view->flags |= FLATVIEW_FLAG_IOEVENTFD_UPDATED;
> > +
> 
> Won't we lose the listener calls if multiple address spaces have the
> same flatview?

I have the same concern with Jason.  I don't think it matters in reality,
since only address_space_io uses it so far. but it doesn't really look
reasonable and clean.

One other idea of optimizing ioeventfd update is we can add a per-AS
counter (ioeventfd_notifiers), increase if any eventfd_add|del is
registered in memory_listener_register(), and decrease when unregister.
Then address_space_update_ioeventfds() can be skipped completely if
ioeventfd_notifiers==0.

Side note: Jason, do you think we should drop vhost_eventfd_add|del?
They're all no-ops right now.

Thanks,

-- 
Peter Xu


