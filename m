Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BC9D6D2507
	for <lists+qemu-devel@lfdr.de>; Fri, 31 Mar 2023 18:14:41 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1piHNu-0001IR-FB; Fri, 31 Mar 2023 12:13:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1piHNs-0001IC-BM
 for qemu-devel@nongnu.org; Fri, 31 Mar 2023 12:13:48 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1piHNq-0001nS-DQ
 for qemu-devel@nongnu.org; Fri, 31 Mar 2023 12:13:47 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1680279224;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=AbJyR3sI4pURpF3D6csX0LjtdN04uagJA3zgoGOqOTk=;
 b=KO1aGdsK5s/QRVfmnNvIixcONTrNFPM4Le0xqjdqiGWuMW+N24EbIsvJTAf+NLdhpH9Y22
 gHM7T0NJ4ZggVqD8n9tCtar+S7wqKLkfFn/AqyGOUauE9rh0+bkBnbenODK1Hh6wHfPqcB
 n+uZ31JeyPiNVdNBVyw3OEDKtaBbOpY=
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com
 [209.85.219.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-262-B4mjrJSkM9m64DOGHpd3YA-1; Fri, 31 Mar 2023 12:13:35 -0400
X-MC-Unique: B4mjrJSkM9m64DOGHpd3YA-1
Received: by mail-qv1-f69.google.com with SMTP id
 g6-20020ad45426000000b005a33510e95aso9973409qvt.16
 for <qemu-devel@nongnu.org>; Fri, 31 Mar 2023 09:13:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680279215; x=1682871215;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=AbJyR3sI4pURpF3D6csX0LjtdN04uagJA3zgoGOqOTk=;
 b=BD+cJPaDZmOvl5Gg4mF+dYnJDuKhPzXsHh4wDj9OFDvzaObI4DhtZAehTKcOZ+tF/g
 yA6wzExWlhD3Qxd3QbxR6zx2kgsJfbA6Kj7R5OBfKaQKb1XUAc+uGNAtQ04AeYXUVlvK
 4LlsVHBW/2nBqEnPWrECwnJa+TQWHC2fHhVecSv13zxHw0S08v+2ZZ2G07TOULaXLypU
 KI8hIuoe6ryOIone4ECz3SvN2dUN7rfZ9KDeAheszVyoKnZ6OH9KUdRUK7RyMqr7/cvi
 c9gcoqF0WOz36f8nmNKBtiSUF/3sTfNyo5MnM0kNE+wFPXw+9BzP47LhT9jhpsU73hJ8
 Z87A==
X-Gm-Message-State: AAQBX9cuySfDWs2dUM7Ugl7AZGcoVuk6HyF0wRVFOPMTsagXBNeVb+dv
 87qsZHNt0kW+teITlP7IiC8WGOCBhbAabWRN3hIUjpnEwwbKdHapPjx3tQCr4mJAO14pknPqxDe
 lL68wI7ZqVq8mYvs=
X-Received: by 2002:ad4:5c6f:0:b0:56e:f7dd:47ad with SMTP id
 i15-20020ad45c6f000000b0056ef7dd47admr42361157qvh.5.1680279214858; 
 Fri, 31 Mar 2023 09:13:34 -0700 (PDT)
X-Google-Smtp-Source: AKy350b8mv9Z1VWodYmgup4E5JrMpAg4U6IvVDsb7nTaZ5UufSaJRd0FcjuT2u+1tQxAix+9d2VniA==
X-Received: by 2002:ad4:5c6f:0:b0:56e:f7dd:47ad with SMTP id
 i15-20020ad45c6f000000b0056ef7dd47admr42361117qvh.5.1680279214557; 
 Fri, 31 Mar 2023 09:13:34 -0700 (PDT)
Received: from x1n (bras-base-aurron9127w-grc-40-70-52-229-124.dsl.bell.ca.
 [70.52.229.124]) by smtp.gmail.com with ESMTPSA id
 kr24-20020a0562142b9800b005dd8b934570sm704960qvb.8.2023.03.31.09.13.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 31 Mar 2023 09:13:34 -0700 (PDT)
Date: Fri, 31 Mar 2023 12:13:32 -0400
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
Message-ID: <ZCcGrEkSA64z6MpV@x1n>
References: <20230330180336.2791-1-farosas@suse.de>
 <20230330180336.2791-11-farosas@suse.de> <ZCYGz3ht61FBQs3e@x1n>
 <ZCaSEfMphjQ1ic2j@redhat.com> <ZCbwm8qLMOyK93T/@x1n>
 <ZCb9oVI6WUaGizwm@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ZCb9oVI6WUaGizwm@redhat.com>
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

On Fri, Mar 31, 2023 at 04:34:57PM +0100, Daniel P. Berrangé wrote:
> On Fri, Mar 31, 2023 at 10:39:23AM -0400, Peter Xu wrote:
> > On Fri, Mar 31, 2023 at 08:56:01AM +0100, Daniel P. Berrangé wrote:
> > > On Thu, Mar 30, 2023 at 06:01:51PM -0400, Peter Xu wrote:
> > > > On Thu, Mar 30, 2023 at 03:03:20PM -0300, Fabiano Rosas wrote:
> > > > > From: Nikolay Borisov <nborisov@suse.com>
> > > > > 
> > > > > Implement 'fixed-ram' feature. The core of the feature is to ensure that
> > > > > each ram page of the migration stream has a specific offset in the
> > > > > resulting migration stream. The reason why we'd want such behavior are
> > > > > two fold:
> > > > > 
> > > > >  - When doing a 'fixed-ram' migration the resulting file will have a
> > > > >    bounded size, since pages which are dirtied multiple times will
> > > > >    always go to a fixed location in the file, rather than constantly
> > > > >    being added to a sequential stream. This eliminates cases where a vm
> > > > >    with, say, 1G of ram can result in a migration file that's 10s of
> > > > >    GBs, provided that the workload constantly redirties memory.
> > > > > 
> > > > >  - It paves the way to implement DIO-enabled save/restore of the
> > > > >    migration stream as the pages are ensured to be written at aligned
> > > > >    offsets.
> > > > > 
> > > > > The feature requires changing the stream format. First, a bitmap is
> > > > > introduced which tracks which pages have been written (i.e are
> > > > > dirtied) during migration and subsequently it's being written in the
> > > > > resulting file, again at a fixed location for every ramblock. Zero
> > > > > pages are ignored as they'd be zero in the destination migration as
> > > > > well. With the changed format data would look like the following:
> > > > > 
> > > > > |name len|name|used_len|pc*|bitmap_size|pages_offset|bitmap|pages|
> > > > 
> > > > What happens with huge pages?  Would page size matter here?
> > > > 
> > > > I would assume it's fine it uses a constant (small) page size, assuming
> > > > that should match with the granule that qemu tracks dirty (which IIUC is
> > > > the host page size not guest's).
> > > > 
> > > > But I didn't yet pay any further thoughts on that, maybe it would be
> > > > worthwhile in all cases to record page sizes here to be explicit or the
> > > > meaning of bitmap may not be clear (and then the bitmap_size will be a
> > > > field just for sanity check too).
> > > 
> > > I think recording the page sizes is an anti-feature in this case.
> > > 
> > > The migration format / state needs to reflect the guest ABI, but
> > > we need to be free to have different backend config behind that
> > > either side of the save/restore.
> > > 
> > > IOW, if I start a QEMU with 2 GB of RAM, I should be free to use
> > > small pages initially and after restore use 2 x 1 GB hugepages,
> > > or vica-verca.
> > > 
> > > The important thing with the pages that are saved into the file
> > > is that they are a 1:1 mapping guest RAM regions to file offsets.
> > > IOW, the 2 GB of guest RAM is always a contiguous 2 GB region
> > > in the file.
> > > 
> > > If the src VM used 1 GB pages, we would be writing a full 2 GB
> > > of data assuming both pages were dirty.
> > > 
> > > If the src VM used 4k pages, we would be writing some subset of
> > > the 2 GB of data, and the rest would be unwritten.
> > > 
> > > Either way, when reading back the data we restore it into either
> > > 1 GB pages of 4k pages, beause any places there were unwritten
> > > orignally  will read back as zeros.
> > 
> > I think there's already the page size information, because there's a bitmap
> > embeded in the format at least in the current proposal, and the bitmap can
> > only be defined with a page size provided in some form.
> > 
> > Here I agree the backend can change before/after a migration (live or
> > not).  Though the question is whether page size matters in the snapshot
> > layout rather than what the loaded QEMU instance will use as backend.
> 
> IIUC, the page size information merely sets a constraint on the granularity
> of unwritten (sparse) regions in the file. If we didn't want to express
> page size directly in the file format we would need explicit start/end
> offsets for each written block. This is less convenient that just having
> a bitmap, so I think its ok to use the page size bitmap

I'm perfectly fine with having the bitmap.  The original question was about
whether we should store page_size into the same header too along with the
bitmap.

Currently I think the page size can be implied by either the system
configuration (e.g. arch, cpu setups) and also the size of bitmap.  So I'm
wondering whether it'll be cleaner to replace the bitmap size with page
size (hence one can calculate the bitmap size from the page size), or just
keep both of them for sanity.

Besides, since we seem to be defining a new header format to be stored on
disks, maybe it'll be worthwhile to leave some space for future extentions
of the image?

So the image format can start with a versioning (perhaps also with field
explaning what it contains). Then if someday we want to extend the image,
the new qemu binary will still be able to load the old image even if the
format may change.  Or vice versa, where the old qemu binary would be able
to identify it's loading a new image that it doesn't really understand, so
to properly notify the user rather than weird loading errors.

-- 
Peter Xu


