Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A67533DABDF
	for <lists+qemu-devel@lfdr.de>; Thu, 29 Jul 2021 21:33:52 +0200 (CEST)
Received: from localhost ([::1]:47418 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m9Bmx-0004Az-ML
	for lists+qemu-devel@lfdr.de; Thu, 29 Jul 2021 15:33:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43762)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1m9Blo-0003Kf-R2
 for qemu-devel@nongnu.org; Thu, 29 Jul 2021 15:32:42 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:53731)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1m9Bll-0006Cf-Cy
 for qemu-devel@nongnu.org; Thu, 29 Jul 2021 15:32:39 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1627587155;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=LbaKCDi7MQCMWqlM7t+MrEs8Tvz5MgCM8BWqgUiIU+4=;
 b=I6wGCIBh82JY98tXJW/2rfugXgkAyb2fuwNLf2jIakRLP4Inol0zLusDSCi7bUomCJE8bY
 rAEBbGLigInqL+WAD3gMgACrXrWS2I/9etHvClNpbytPJZtaFZEgxHHZxVlQOx5Da/Yq0S
 psxtbZI4Cr2woVJiF0ODQMLXqi8HTx4=
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com
 [209.85.219.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-107-aSTqb3LPMBWNgy3uI6-CqA-1; Thu, 29 Jul 2021 15:32:34 -0400
X-MC-Unique: aSTqb3LPMBWNgy3uI6-CqA-1
Received: by mail-qv1-f70.google.com with SMTP id
 r14-20020a0c8d0e0000b02902e82df307f0so4473573qvb.4
 for <qemu-devel@nongnu.org>; Thu, 29 Jul 2021 12:32:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=LbaKCDi7MQCMWqlM7t+MrEs8Tvz5MgCM8BWqgUiIU+4=;
 b=uAB8MQ99bZDZOtd90quxV2iGozJHH0LyOnmgwOgzrDBDcp1/3+8Tc/M9IehA0aEhk5
 A6hcXtLdauKC0BQQRt64fhYaPnLGQpb2vCm6Bt3twZihTGhhyqqE2l1YPXgvXsziO9vI
 D6wNNeP+iSfz23SKZ0hazpyzflToALQHKtl7M/JBd89QghwTjjtL1PwjrvayzqV4Iz6d
 suGLT+UOHiTXwoMqEpR31k09brwLsH9kyNIqbYDRAz5WXdOS7kONA2x3NkHaHewvzf3Z
 5xrONY7/hFUFYc/C+ZgcDSEGZH9tBRWNz9j1cUuq8koIDXMeIDlBS6liuZ1CaDVLdNn7
 3Nrw==
X-Gm-Message-State: AOAM530VO58i8tUpVBuwf3MdJNky9sewUX7m4FwuiFAUx3hON/KuNJdO
 /W7NjFAgX1LSVJS5ktH59/RPQurI+rUyXqhFhw3IwDy215GVfYfYicDiYqkRiFAykjVyI4A3o5d
 jIbNbPXLsHpkDfF8=
X-Received: by 2002:a0c:aacd:: with SMTP id g13mr7033339qvb.20.1627587154338; 
 Thu, 29 Jul 2021 12:32:34 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzN+kqFSGhAz61G2uTto2Cvrx1/peEvvgTqZgTRaotVpKRk+zP+Hez2HPakmGqlr+IeirDY/A==
X-Received: by 2002:a0c:aacd:: with SMTP id g13mr7033320qvb.20.1627587154146; 
 Thu, 29 Jul 2021 12:32:34 -0700 (PDT)
Received: from t490s
 (bras-base-toroon474qw-grc-65-184-144-111-238.dsl.bell.ca. [184.144.111.238])
 by smtp.gmail.com with ESMTPSA id o18sm2344014qko.63.2021.07.29.12.32.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 29 Jul 2021 12:32:33 -0700 (PDT)
Date: Thu, 29 Jul 2021 15:32:32 -0400
From: Peter Xu <peterx@redhat.com>
To: David Hildenbrand <david@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Juan Quintela <quintela@redhat.com>
Subject: Re: [PATCH v2 0/6] migration/ram: Optimize for virtio-mem via
 RamDiscardManager
Message-ID: <YQMCUHWuviDcIc+I@t490s>
References: <YPtAd+JqfNeQqGib@t490s>
 <da54f4ab-2f20-a780-1a9c-b6f4c1c50969@redhat.com>
 <YQA+CUCWV4YDdu9C@t490s>
 <74271964-c481-7168-2a70-ea9eb5067450@redhat.com>
 <YQGzLl9IHod5rJRb@t490s>
 <b54cab91-87a6-298c-e527-0f75f8c38c74@redhat.com>
 <YQG74AsEBE0uaN4U@t490s>
 <a1c80a40-2828-3373-c906-870f0dbb6db8@redhat.com>
 <YQLTUIvrVe+TM/lw@t490s>
 <df5c7623-9986-d282-2ee9-eb28908d2994@redhat.com>
MIME-Version: 1.0
In-Reply-To: <df5c7623-9986-d282-2ee9-eb28908d2994@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=peterx@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=peterx@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.717,
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
Cc: Eduardo Habkost <ehabkost@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Pankaj Gupta <pankaj.gupta@cloud.ionos.com>,
 Juan Quintela <quintela@redhat.com>, teawater <teawaterz@linux.alibaba.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>, qemu-devel@nongnu.org,
 Alex Williamson <alex.williamson@redhat.com>,
 Marek Kedzierski <mkedzier@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Andrey Gruzdev <andrey.gruzdev@virtuozzo.com>,
 Wei Yang <richard.weiyang@linux.alibaba.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Jul 29, 2021 at 06:19:31PM +0200, David Hildenbrand wrote:
> On 29.07.21 18:12, Peter Xu wrote:
> > On Thu, Jul 29, 2021 at 10:14:47AM +0200, David Hildenbrand wrote:
> > > > > > > > The thing is I still think this extra operation during sync() can be ignored by
> > > > > > > > simply clear dirty log during bitmap init, then.. why not? :)
> > > > > > > 
> > > > > > > I guess clearing the dirty log (especially in KVM) might be more expensive.
> > > > > > 
> > > > > > If we send one ioctl per cb that'll be expensive for sure.  I think it'll be
> > > > > > fine if we send one clear ioctl to kvm, summarizing the whole bitmap to clear.
> > > > > > 
> > > > > > The other thing is imho having overhead during bitmap init is always better
> > > > > > than having that during sync(). :)
> > > > > 
> > > > > Oh, right, so you're saying, after we set the dirty bmap to all ones and
> > > > > excluded the discarded parts, setting the respective bits to 0, we simply
> > > > > issue clearing of the whole area?
> > > > > 
> > > > > For now I assumed we would have to clear per cb.
> > > > 
> > > > Hmm when I replied I thought we can pass in a bitmap to ->log_clear() but I
> > > > just remembered memory API actually hides the bitmap interface..
> > > > 
> > > > Reset the whole region works, but it'll slow down migration starts, more
> > > > importantly that'll be with mmu write lock so we will lose most clear-log
> > > > benefit for the initial round of migration and stuck the guest #pf at the
> > > > meantime...
> > > > 
> > > > Let's try do that in cb()s as you mentioned; I think that'll still be okay,
> > > > because so far the clear log block size is much larger (1gb), 1tb is worst case
> > > > 1000 ioctls during bitmap init, slightly better than 250k calls during sync(),
> > > > maybe? :)
> > > 
> > > Just to get it right, what you propose is calling
> > > migration_clear_memory_region_dirty_bitmap_range() from each cb().
> > 
> > Right.  We can provide a more complicated memory api for passing in bitmap but
> > I think that can be an overkill and tricky.
> > 
> > > Due to the clear_bmap, we will end up clearing each chunk (e.g., 1GB) at most
> > > once.
> > > 
> > > But if our layout is fragmented, we can actually end up clearing all chunks
> > > (1024 ioctls for 1TB), resulting in a slower migration start.
> > > 
> > > Any gut feeling how much slower migration start could be with largish (e.g.,
> > > 1 TiB) regions?
> > 
> > I had a vague memory of KVM_GET_DIRTY_LOG that I used to measure which took
> > ~10ms for 1g guest mem, supposing that's mostly used to protect the pages or
> > clearing dirties in the EPT pgtables.  Then the worst case is ~1 second for
> > 1tb.
> > 
> > But note that it's still during setup phase, so we should expect to see a
> > somehow large setup time and longer period that migration stays in SETUP state,
> > but I think it's fine.  Reasons:
> > 
> >    - We don't care too much about guest dirtying pages during the setup process
> >      because we haven't migrated anything yet, meanwhile we should not block any
> >      other thread either (e.g., we don't hold BQL).
> > 
> >    - We don't block guest execution too.  Unlike KVM_GET_DIRTY_LOG without CLEAR
> >      we won't hold the mmu lock for a huge long time but do it only in 1g chunk,
> >      so guest page faults can still be serviced.  It'll be affected somehow
> >      since we'll still run with the mmu write lock critical sections for each
> >      single ioctl(), but we do that for 1gb each time so we frequently yield it.
> > 
> 
> Please note that we are holding the iothread lock while setting up the
> bitmaps + syncing the dirty log. I'll have to make sure that that code runs
> outside of the BQL, otherwise we'll block guest execution.

Oh right.

> 
> In the meantime I adjusted the code but it does the clearing under the
> iothread lock, which should not be what we want ... I'll have a look.

Thanks; if it takes more changes than expected we can still start from simple,
IMHO, by taking bql and timely yield it.

At the meantime, I found two things in ram_init_bitmaps() that I'm not sure we
need them of not:

  1. Do we need WITH_RCU_READ_LOCK_GUARD() if with both bql and ramlist lock?
     (small question)

  2. Do we need migration_bitmap_sync_precopy() even if dirty bmap is all 1's?
     (bigger question)

I feel like those can be dropped.  Dave/Juan?

-- 
Peter Xu


