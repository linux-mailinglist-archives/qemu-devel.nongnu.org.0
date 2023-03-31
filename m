Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A8F406D22C8
	for <lists+qemu-devel@lfdr.de>; Fri, 31 Mar 2023 16:40:26 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1piFui-0005CY-Gh; Fri, 31 Mar 2023 10:39:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1piFue-0005AL-SF
 for qemu-devel@nongnu.org; Fri, 31 Mar 2023 10:39:32 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1piFuc-00072O-RL
 for qemu-devel@nongnu.org; Fri, 31 Mar 2023 10:39:32 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1680273569;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=YoXzIfaII3Xn5i7FlEH28kc14gYoVkLshvwLgrr4C4c=;
 b=EcIwUkuK1YtDp1juBZKudVa6BZefNx/hN8JWgzjbECEhcLI88iEBl71qxeOQ1fENU2Dmbh
 qAjg8VZjfxk5xMX8++itnWdy4IhFl/WAdUBxKUL9Y9fl8AwDwdyDvVW6U4Y9f612NyVy6b
 14WvYJGgVELz5XxRhb8rFl3ksR/xPsg=
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com
 [209.85.160.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-595-8wasZsiTPyaPh3z695XcjA-1; Fri, 31 Mar 2023 10:39:26 -0400
X-MC-Unique: 8wasZsiTPyaPh3z695XcjA-1
Received: by mail-qt1-f199.google.com with SMTP id
 l13-20020a05622a174d00b003e4df699997so12567882qtk.20
 for <qemu-devel@nongnu.org>; Fri, 31 Mar 2023 07:39:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680273566;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=YoXzIfaII3Xn5i7FlEH28kc14gYoVkLshvwLgrr4C4c=;
 b=tCePEJqxAD/AI1pHBjoFlR6IySzDi6tYrU7L8FuYzeGUl9ydufNxO67PFBezAprkNv
 7OKp9wFFfiztd0obfH0oqBS4IWqpzNH0GC8SzpVOVWkiKPrmtPu87pwSVHYPRki6IggP
 QONVkc7w128EwN5m1E0FS5QCPJeLCauZFCutRoI1xMI5JH/sRt7lVme3taofvEPVp4ob
 ddBwqXsl41wfcKMZgDX2XojZBihimrnDVIFWGY3o8J6CZrMuLLVsR+BoNy+ShollwtAV
 8gAkvYcStGukLR8y7bGOr0IiSe5GFDxS4uxDjP7ty29ahqNMWncre67PsEYm4rIiUX+p
 pDUA==
X-Gm-Message-State: AAQBX9fAJenPlGrBPySy3ATNXTlJvbV/tP2ugHVZklOnxKYDzWWpnWPJ
 2ORmDqegp9OQX4FFwrCipxS8pRLDhSzGwN866T9FesKTW9m2qtSzUgZtrC07OR8p7o8RLFH2yPv
 WCOABGRHDTHPyOQk=
X-Received: by 2002:a05:622a:1802:b0:3bf:c458:5bac with SMTP id
 t2-20020a05622a180200b003bfc4585bacmr9070458qtc.0.1680273565829; 
 Fri, 31 Mar 2023 07:39:25 -0700 (PDT)
X-Google-Smtp-Source: AKy350Z1Am+wypvFewRcYu/S8+bqrovPuxnSCzW6X5gjtEq2SsoLbRQyOcH9HZPPFIGrs0npQE9HIQ==
X-Received: by 2002:a05:622a:1802:b0:3bf:c458:5bac with SMTP id
 t2-20020a05622a180200b003bfc4585bacmr9070399qtc.0.1680273565282; 
 Fri, 31 Mar 2023 07:39:25 -0700 (PDT)
Received: from x1n (bras-base-aurron9127w-grc-40-70-52-229-124.dsl.bell.ca.
 [70.52.229.124]) by smtp.gmail.com with ESMTPSA id
 q19-20020ac87353000000b003e387a2fbdfsm675185qtp.0.2023.03.31.07.39.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 31 Mar 2023 07:39:24 -0700 (PDT)
Date: Fri, 31 Mar 2023 10:39:23 -0400
From: Peter Xu <peterx@redhat.com>
To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
Cc: Fabiano Rosas <farosas@suse.de>, qemu-devel@nongnu.org,
 Claudio Fontana <cfontana@suse.de>, jfehlig@suse.com,
 dfaggioli@suse.com, dgilbert@redhat.com,
 Juan Quintela <quintela@redhat.com>, Nikolay Borisov <nborisov@suse.com>,
 Paolo Bonzini <pbonzini@redhat.com>, David Hildenbrand <david@redhat.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Eric Blake <eblake@redhat.com>, Markus Armbruster <armbru@redhat.com>
Subject: Re: [RFC PATCH v1 10/26] migration/ram: Introduce 'fixed-ram'
 migration stream capability
Message-ID: <ZCbwm8qLMOyK93T/@x1n>
References: <20230330180336.2791-1-farosas@suse.de>
 <20230330180336.2791-11-farosas@suse.de> <ZCYGz3ht61FBQs3e@x1n>
 <ZCaSEfMphjQ1ic2j@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ZCaSEfMphjQ1ic2j@redhat.com>
Received-SPF: pass client-ip=170.10.129.124; envelope-from=peterx@redhat.com;
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

On Fri, Mar 31, 2023 at 08:56:01AM +0100, Daniel P. Berrangé wrote:
> On Thu, Mar 30, 2023 at 06:01:51PM -0400, Peter Xu wrote:
> > On Thu, Mar 30, 2023 at 03:03:20PM -0300, Fabiano Rosas wrote:
> > > From: Nikolay Borisov <nborisov@suse.com>
> > > 
> > > Implement 'fixed-ram' feature. The core of the feature is to ensure that
> > > each ram page of the migration stream has a specific offset in the
> > > resulting migration stream. The reason why we'd want such behavior are
> > > two fold:
> > > 
> > >  - When doing a 'fixed-ram' migration the resulting file will have a
> > >    bounded size, since pages which are dirtied multiple times will
> > >    always go to a fixed location in the file, rather than constantly
> > >    being added to a sequential stream. This eliminates cases where a vm
> > >    with, say, 1G of ram can result in a migration file that's 10s of
> > >    GBs, provided that the workload constantly redirties memory.
> > > 
> > >  - It paves the way to implement DIO-enabled save/restore of the
> > >    migration stream as the pages are ensured to be written at aligned
> > >    offsets.
> > > 
> > > The feature requires changing the stream format. First, a bitmap is
> > > introduced which tracks which pages have been written (i.e are
> > > dirtied) during migration and subsequently it's being written in the
> > > resulting file, again at a fixed location for every ramblock. Zero
> > > pages are ignored as they'd be zero in the destination migration as
> > > well. With the changed format data would look like the following:
> > > 
> > > |name len|name|used_len|pc*|bitmap_size|pages_offset|bitmap|pages|
> > 
> > What happens with huge pages?  Would page size matter here?
> > 
> > I would assume it's fine it uses a constant (small) page size, assuming
> > that should match with the granule that qemu tracks dirty (which IIUC is
> > the host page size not guest's).
> > 
> > But I didn't yet pay any further thoughts on that, maybe it would be
> > worthwhile in all cases to record page sizes here to be explicit or the
> > meaning of bitmap may not be clear (and then the bitmap_size will be a
> > field just for sanity check too).
> 
> I think recording the page sizes is an anti-feature in this case.
> 
> The migration format / state needs to reflect the guest ABI, but
> we need to be free to have different backend config behind that
> either side of the save/restore.
> 
> IOW, if I start a QEMU with 2 GB of RAM, I should be free to use
> small pages initially and after restore use 2 x 1 GB hugepages,
> or vica-verca.
> 
> The important thing with the pages that are saved into the file
> is that they are a 1:1 mapping guest RAM regions to file offsets.
> IOW, the 2 GB of guest RAM is always a contiguous 2 GB region
> in the file.
> 
> If the src VM used 1 GB pages, we would be writing a full 2 GB
> of data assuming both pages were dirty.
> 
> If the src VM used 4k pages, we would be writing some subset of
> the 2 GB of data, and the rest would be unwritten.
> 
> Either way, when reading back the data we restore it into either
> 1 GB pages of 4k pages, beause any places there were unwritten
> orignally  will read back as zeros.

I think there's already the page size information, because there's a bitmap
embeded in the format at least in the current proposal, and the bitmap can
only be defined with a page size provided in some form.

Here I agree the backend can change before/after a migration (live or
not).  Though the question is whether page size matters in the snapshot
layout rather than what the loaded QEMU instance will use as backend.

> 
> > If postcopy might be an option, we'd want the page size to be the host page
> > size because then looking up the bitmap will be straightforward, deciding
> > whether we should copy over page (UFFDIO_COPY) or fill in with zeros
> > (UFFDIO_ZEROPAGE).
> 
> This format is only intended for the case where we are migrating to
> a random-access medium, aka a file, because the fixed RAM mappings
> to disk mean that we need to seek back to the original location to
> re-write pages that get dirtied. It isn't suitable for a live
> migration stream, and thus postcopy is inherantly out of scope.

Yes, I've commented also in the cover letter, but I can expand a bit.

I mean support postcopy only when loading, but not when saving.

Saving to file definitely cannot work with postcopy because there's no dest
qemu running.

Loading from file, OTOH, can work together with postcopy.

Right now AFAICT current approach is precopy loading the whole guest image
with the supported snapshot format (if I can call it just a snapshot).

What I want to say is we can consider supporting postcopy on loading in
that we start an "empty" QEMU dest node, when any page fault triggered we
do it using userfault and lookup the snapshot file instead rather than
sending a request back to the source.  I mentioned that because there'll be
two major benefits which I mentioned in reply to the cover letter quickly,
but I can also extend here:

  - Firstly, the snapshot format is ideally storing pages in linear
    offsets, it means when we know some page missing we can use O(1) time
    looking it up from the snapshot image.

  - Secondly, we don't need to let the page go through the wires, neither
    do we need to send a request to src qemu or anyone.  What we need here
    is simply test the bit on the snapshot bitmap, then:

    - If it is copied, do UFFDIO_COPY to resolve page faults,
    - If it is not copied, do UFFDIO_ZEROPAGE (e.g., if not hugetlb,
      hugetlb can use a fake UFFDIO_COPY)

So this is a perfect testing ground for using postcopy in a very efficient
way against a file snapshot.

Thanks,

-- 
Peter Xu


