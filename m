Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4BBD86630D5
	for <lists+qemu-devel@lfdr.de>; Mon,  9 Jan 2023 20:55:51 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pEyDv-00081b-Ma; Mon, 09 Jan 2023 14:54:23 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1pEyDp-00080f-OT
 for qemu-devel@nongnu.org; Mon, 09 Jan 2023 14:54:18 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1pEyDn-0005vJ-V2
 for qemu-devel@nongnu.org; Mon, 09 Jan 2023 14:54:17 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1673294053;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=JyR8K/S+Q7QCFM0a4/dn0Aq3yIIJ+PVKQ9cVQjgRq5A=;
 b=dMOr8EWKty9/0K36G0/JHUb4GIBpHIMdYnNSmzZjXj/3fmOoGJX8gzKxpEJTLhBhpTS3YH
 DNpNcYlowD5LCrIkAa4BB91XXgBVHIBBqGsLsLqUdtdVpJkGuO/ONsR+LM0uQX2HC/dO92
 JyIsD2HmxpM4TaSyhF8jlHMv285sWh8=
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com
 [209.85.219.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-588-ymCRmdHhPv628xs7PC3R6g-1; Mon, 09 Jan 2023 14:54:12 -0500
X-MC-Unique: ymCRmdHhPv628xs7PC3R6g-1
Received: by mail-qv1-f70.google.com with SMTP id
 c10-20020a05621401ea00b004c72d0e92bcso5688364qvu.12
 for <qemu-devel@nongnu.org>; Mon, 09 Jan 2023 11:54:11 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=JyR8K/S+Q7QCFM0a4/dn0Aq3yIIJ+PVKQ9cVQjgRq5A=;
 b=xUc2pbG9e71dBtarNiVI8xEWPiGq0rZxw9jMnwBkfzJ6P+3hmM5hO85sLNtgMRvxGu
 ps3BJe6elyIeHa2pKzb3sgyaGNNufTHW+TOzYrVxJdI2I7qfvlopyP45d06VEyka8+5O
 eS+bnjLjli34y1TtzMkuxnplXJAbMZP5EFJOwfPv07om/BZ2t/mWWoKxibmucJta1Trb
 pqqNsdPa1Uocd92soHpIhniWTHQQA2YJyEtA4F25iGUkPtUYv7WTc4OtQdgsW0J+yW1p
 VEVQa95bvOxIeRCTmPeid2N4a5ivMVKfudC3BkYXqZK/0z3csER4zrmrn+Ap3U4YpAvV
 08Aw==
X-Gm-Message-State: AFqh2ko/vBav8WsAGZEPu++dyobY0PvP4Th5Sv+2bGvWOep+AeYCS+6z
 k1qD8+ze0auwt5M19YHAj//DJgHJ7hS0Mp5GMwHVLi4hFdjaVBegvyNND0HNYIHt3bc5dQ1mkHD
 158uKbllVlRsqLs0=
X-Received: by 2002:a05:6214:2f05:b0:4c7:5f22:8d5 with SMTP id
 od5-20020a0562142f0500b004c75f2208d5mr107991085qvb.39.1673294051559; 
 Mon, 09 Jan 2023 11:54:11 -0800 (PST)
X-Google-Smtp-Source: AMrXdXsUxWGx5BbM4+e+WIWWwVPm3NI0YrmQKzO+5afk/UzSKYyTS1VytR1PU+PQEs8uS3plCfkcRg==
X-Received: by 2002:a05:6214:2f05:b0:4c7:5f22:8d5 with SMTP id
 od5-20020a0562142f0500b004c75f2208d5mr107991063qvb.39.1673294051302; 
 Mon, 09 Jan 2023 11:54:11 -0800 (PST)
Received: from x1n (bras-base-aurron9127w-grc-39-70-52-228-144.dsl.bell.ca.
 [70.52.228.144]) by smtp.gmail.com with ESMTPSA id
 h9-20020a05620a244900b006fc2cee4486sm5933120qkn.62.2023.01.09.11.54.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 09 Jan 2023 11:54:10 -0800 (PST)
Date: Mon, 9 Jan 2023 14:54:09 -0500
From: Peter Xu <peterx@redhat.com>
To: David Hildenbrand <david@redhat.com>
Cc: qemu-devel@nongnu.org, "Dr . David Alan Gilbert" <dgilbert@redhat.com>,
 Juan Quintela <quintela@redhat.com>,
 "Michael S . Tsirkin" <mst@redhat.com>,
 Michal Privoznik <mprivozn@redhat.com>
Subject: Re: [PATCH v3 1/6] migration: Allow immutable device state to be
 migrated early (i.e., before RAM)
Message-ID: <Y7xw4RqLQUFWZyfI@x1n>
References: <20221222110215.130392-1-david@redhat.com>
 <20221222110215.130392-2-david@redhat.com> <Y7W2LtO5/m1r3VaL@x1n>
 <d60f9272-1e81-00da-8046-2264a9b97e58@redhat.com>
 <Y7cFplyGc4hIrYZW@x1n>
 <482fadb5-7420-e07b-982d-5b0f3e8c42f8@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <482fadb5-7420-e07b-982d-5b0f3e8c42f8@redhat.com>
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

On Mon, Jan 09, 2023 at 03:34:48PM +0100, David Hildenbrand wrote:
> On 05.01.23 18:15, Peter Xu wrote:
> > On Thu, Jan 05, 2023 at 09:35:54AM +0100, David Hildenbrand wrote:
> > > On 04.01.23 18:23, Peter Xu wrote:
> > > > On Thu, Dec 22, 2022 at 12:02:10PM +0100, David Hildenbrand wrote:
> > > > > Migrating device state before we start iterating is currently impossible.
> > > > > Introduce and use qemu_savevm_state_start_precopy(), and use
> > > > > a new special migration priority -- MIG_PRI_POST_SETUP -- to decide whether
> > > > > state will be saved in qemu_savevm_state_start_precopy() or in
> > > > > qemu_savevm_state_complete_precopy_*().
> > > > 
> > > > Can something like this be done in qemu_savevm_state_setup()?
> > > 
> > > Hi Peter,
> > 
> > Hi, David,
> > 
> > > 
> > > Do you mean
> > > 
> > > (a) Moving qemu_savevm_state_start_precopy() effectively into
> > >      qemu_savevm_state_setup()
> > > 
> > > (b) Using se->ops->save_setup()
> > 
> > I meant (b).
> > 
> > > 
> > > I first tried going via (b), but decided to go the current way of using a
> > > proper vmstate with properties (instead of e.g., filling the stream
> > > manually), which also made vmdesc handling possible (and significantly
> > > cleaner).
> > > 
> > > Regarding (a), I decided to not move logic of
> > > qemu_savevm_state_start_precopy() into qemu_savevm_state_setup(), because it
> > > looked cleaner to save device state with the BQL held and for background
> > > snapshots, the VM has been stopped. To decouple device state saving from the
> > > setup path, just like we do it right now for all vmstates.
> > 
> > Is BQL required or optional?  IIUC it's at least still not taken in the
> > migration thread path, only in savevm path.
> > 
> > > 
> > > Having that said, for virtio-mem, it would still work because that state is
> > > immutable once migration starts, but it felt cleaner to separate the setup()
> > > phase from actual device state saving.
> > 
> > I get the point.  My major concerns are:
> > 
> >    (1) The new migration priority is changing the semantic of original,
> >        making it over-complicated
> > 
> >    (2) The new precopy-start routine added one more step to the migration
> >        framework, while it's somehow overlapping (if not to say, mostly the
> >        same as..) save_setup().
> > 
> > For (1): the old priority was only deciding the order of save entries in
> > the global list, nothing more than that.  Even if we want to have a
> > precopy-start phase, I'd suggest we use something else and keep the
> > migration priority simple.  Otherwise we really need serious documentation
> > for MigrationPriority and if so I'd rather don't bother and not reuse the
> > priority field.
> > 
> > For (2), if you see there're a bunch of save_setup() that already does
> > things like transferring static data besides the device states.  Besides
> > the notorious ram_save_setup() there's also dirty_bitmap_save_setup() which
> > also sends a bitmap during save_setup() and some others.  It looks clean to
> > me to do it in the same way as we used to.
> > 
> > Reusing vmstate_save() and vmsd structures are useful too which I totally
> > agree.  So.. can we just call vmstate_save_state() in the save_setup() of
> > the other new vmsd of virtio-mem?
> 
> 
> I went halfway that way, by moving stuff into qemu_savevm_state_setup()
> and avoiding using a new migration priority. Seems to work:

The whole point of my suggestion is not moving things into
qemu_savevm_state_setup(), but avoid introducing more complexity to the
migration framework if unnecessary, so keep the generic framework as simple
as possible.

> 
> I think we could go one step further and perform it from a save_setup() callback,
> however, I'm not convinced that this gets particularly cleaner (vmdesc handling
> eventually).

What I wanted to suggest is exactly trying to avoid vmsd handling.  To be
more explicit, I mean: besides vmstate_virtio_mem_device_early, virtio-mem
can register with another new SaveVMHandlers with both save_setup and
load_setup registered, then e.g. in its save_setup(), one simply calls:

  vmstate_save_state(f, &vmstate_virtio_mem_device_early, virtio_mem_dev,
                     NULL);

I'm not sure whether the JSONWriter* is required in this case, maybe not
yet to at least make it work.

We'll need to impl the load part, but then IIUC we don't need to touch the
migration framework at all, and we keep all similar things (like other
devices I mentioned) to be inside save_setup().

Would that work?

-- 
Peter Xu


