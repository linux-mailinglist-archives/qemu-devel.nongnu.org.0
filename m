Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 87A636D241B
	for <lists+qemu-devel@lfdr.de>; Fri, 31 Mar 2023 17:36:26 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1piGmX-00042y-Ql; Fri, 31 Mar 2023 11:35:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1piGmU-00042Z-S9
 for qemu-devel@nongnu.org; Fri, 31 Mar 2023 11:35:10 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1piGmS-0001YD-Hj
 for qemu-devel@nongnu.org; Fri, 31 Mar 2023 11:35:10 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1680276906;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=HUYyqtNNBlf/v8Vp/Iz9wFjBHFMWnMNU/saJUYvA94E=;
 b=bDFCNDNFir3GmXbABz6Bi+HCOj2n/gJjm/ou5jV3Vifdnp9gf1xqXiQ4u+lu6/wYShV3+R
 /ExRButl95+KtxT6MfIZ8CUT+SoPGp4n2kopERkfo+Qmab3Wchl37btCNA8J5XnIzpfwgj
 mhHRb+iByG7cBdgh9mXhw5fh/u1epM8=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-490-4_XU-02fN86IJV1SectkIQ-1; Fri, 31 Mar 2023 11:35:03 -0400
X-MC-Unique: 4_XU-02fN86IJV1SectkIQ-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 5A1503C0F24E;
 Fri, 31 Mar 2023 15:35:02 +0000 (UTC)
Received: from redhat.com (unknown [10.33.36.67])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id D42434020C82;
 Fri, 31 Mar 2023 15:34:59 +0000 (UTC)
Date: Fri, 31 Mar 2023 16:34:57 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Peter Xu <peterx@redhat.com>
Cc: Fabiano Rosas <farosas@suse.de>, qemu-devel@nongnu.org,
 Claudio Fontana <cfontana@suse.de>, jfehlig@suse.com,
 dfaggioli@suse.com, dgilbert@redhat.com,
 Juan Quintela <quintela@redhat.com>, Nikolay Borisov <nborisov@suse.com>,
 Paolo Bonzini <pbonzini@redhat.com>, David Hildenbrand <david@redhat.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Eric Blake <eblake@redhat.com>, Markus Armbruster <armbru@redhat.com>
Subject: Re: [RFC PATCH v1 10/26] migration/ram: Introduce 'fixed-ram'
 migration stream capability
Message-ID: <ZCb9oVI6WUaGizwm@redhat.com>
References: <20230330180336.2791-1-farosas@suse.de>
 <20230330180336.2791-11-farosas@suse.de> <ZCYGz3ht61FBQs3e@x1n>
 <ZCaSEfMphjQ1ic2j@redhat.com> <ZCbwm8qLMOyK93T/@x1n>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ZCbwm8qLMOyK93T/@x1n>
User-Agent: Mutt/2.2.9 (2022-11-12)
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.2
Received-SPF: pass client-ip=170.10.133.124; envelope-from=berrange@redhat.com;
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
Reply-To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Fri, Mar 31, 2023 at 10:39:23AM -0400, Peter Xu wrote:
> On Fri, Mar 31, 2023 at 08:56:01AM +0100, Daniel P. Berrangé wrote:
> > On Thu, Mar 30, 2023 at 06:01:51PM -0400, Peter Xu wrote:
> > > On Thu, Mar 30, 2023 at 03:03:20PM -0300, Fabiano Rosas wrote:
> > > > From: Nikolay Borisov <nborisov@suse.com>
> > > > 
> > > > Implement 'fixed-ram' feature. The core of the feature is to ensure that
> > > > each ram page of the migration stream has a specific offset in the
> > > > resulting migration stream. The reason why we'd want such behavior are
> > > > two fold:
> > > > 
> > > >  - When doing a 'fixed-ram' migration the resulting file will have a
> > > >    bounded size, since pages which are dirtied multiple times will
> > > >    always go to a fixed location in the file, rather than constantly
> > > >    being added to a sequential stream. This eliminates cases where a vm
> > > >    with, say, 1G of ram can result in a migration file that's 10s of
> > > >    GBs, provided that the workload constantly redirties memory.
> > > > 
> > > >  - It paves the way to implement DIO-enabled save/restore of the
> > > >    migration stream as the pages are ensured to be written at aligned
> > > >    offsets.
> > > > 
> > > > The feature requires changing the stream format. First, a bitmap is
> > > > introduced which tracks which pages have been written (i.e are
> > > > dirtied) during migration and subsequently it's being written in the
> > > > resulting file, again at a fixed location for every ramblock. Zero
> > > > pages are ignored as they'd be zero in the destination migration as
> > > > well. With the changed format data would look like the following:
> > > > 
> > > > |name len|name|used_len|pc*|bitmap_size|pages_offset|bitmap|pages|
> > > 
> > > What happens with huge pages?  Would page size matter here?
> > > 
> > > I would assume it's fine it uses a constant (small) page size, assuming
> > > that should match with the granule that qemu tracks dirty (which IIUC is
> > > the host page size not guest's).
> > > 
> > > But I didn't yet pay any further thoughts on that, maybe it would be
> > > worthwhile in all cases to record page sizes here to be explicit or the
> > > meaning of bitmap may not be clear (and then the bitmap_size will be a
> > > field just for sanity check too).
> > 
> > I think recording the page sizes is an anti-feature in this case.
> > 
> > The migration format / state needs to reflect the guest ABI, but
> > we need to be free to have different backend config behind that
> > either side of the save/restore.
> > 
> > IOW, if I start a QEMU with 2 GB of RAM, I should be free to use
> > small pages initially and after restore use 2 x 1 GB hugepages,
> > or vica-verca.
> > 
> > The important thing with the pages that are saved into the file
> > is that they are a 1:1 mapping guest RAM regions to file offsets.
> > IOW, the 2 GB of guest RAM is always a contiguous 2 GB region
> > in the file.
> > 
> > If the src VM used 1 GB pages, we would be writing a full 2 GB
> > of data assuming both pages were dirty.
> > 
> > If the src VM used 4k pages, we would be writing some subset of
> > the 2 GB of data, and the rest would be unwritten.
> > 
> > Either way, when reading back the data we restore it into either
> > 1 GB pages of 4k pages, beause any places there were unwritten
> > orignally  will read back as zeros.
> 
> I think there's already the page size information, because there's a bitmap
> embeded in the format at least in the current proposal, and the bitmap can
> only be defined with a page size provided in some form.
> 
> Here I agree the backend can change before/after a migration (live or
> not).  Though the question is whether page size matters in the snapshot
> layout rather than what the loaded QEMU instance will use as backend.

IIUC, the page size information merely sets a constraint on the granularity
of unwritten (sparse) regions in the file. If we didn't want to express
page size directly in the file format we would need explicit start/end
offsets for each written block. This is less convenient that just having
a bitmap, so I think its ok to use the page size bitmap

> > > If postcopy might be an option, we'd want the page size to be the host page
> > > size because then looking up the bitmap will be straightforward, deciding
> > > whether we should copy over page (UFFDIO_COPY) or fill in with zeros
> > > (UFFDIO_ZEROPAGE).
> > 
> > This format is only intended for the case where we are migrating to
> > a random-access medium, aka a file, because the fixed RAM mappings
> > to disk mean that we need to seek back to the original location to
> > re-write pages that get dirtied. It isn't suitable for a live
> > migration stream, and thus postcopy is inherantly out of scope.
> 
> Yes, I've commented also in the cover letter, but I can expand a bit.
> 
> I mean support postcopy only when loading, but not when saving.
> 
> Saving to file definitely cannot work with postcopy because there's no dest
> qemu running.
> 
> Loading from file, OTOH, can work together with postcopy.

Ahh, I see what you mean.

> Right now AFAICT current approach is precopy loading the whole guest image
> with the supported snapshot format (if I can call it just a snapshot).
> 
> What I want to say is we can consider supporting postcopy on loading in
> that we start an "empty" QEMU dest node, when any page fault triggered we
> do it using userfault and lookup the snapshot file instead rather than
> sending a request back to the source.  I mentioned that because there'll be
> two major benefits which I mentioned in reply to the cover letter quickly,
> but I can also extend here:
> 
>   - Firstly, the snapshot format is ideally storing pages in linear
>     offsets, it means when we know some page missing we can use O(1) time
>     looking it up from the snapshot image.
> 
>   - Secondly, we don't need to let the page go through the wires, neither
>     do we need to send a request to src qemu or anyone.  What we need here
>     is simply test the bit on the snapshot bitmap, then:
> 
>     - If it is copied, do UFFDIO_COPY to resolve page faults,
>     - If it is not copied, do UFFDIO_ZEROPAGE (e.g., if not hugetlb,
>       hugetlb can use a fake UFFDIO_COPY)
> 
> So this is a perfect testing ground for using postcopy in a very efficient
> way against a file snapshot.

Yes, that's an nice unexpected benefit of this fixed ram file format.

With regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


