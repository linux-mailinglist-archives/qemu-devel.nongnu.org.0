Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B5E4D6661CC
	for <lists+qemu-devel@lfdr.de>; Wed, 11 Jan 2023 18:29:10 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pFeto-0006ZU-Ky; Wed, 11 Jan 2023 12:28:28 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1pFetl-0006VH-Ga
 for qemu-devel@nongnu.org; Wed, 11 Jan 2023 12:28:25 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1pFeti-0001OT-Jx
 for qemu-devel@nongnu.org; Wed, 11 Jan 2023 12:28:25 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1673458100;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=oMBgKgZ9rfrfst1YYeKRJbSJwF8uJt8+Nzoujm7eClk=;
 b=MVIpx6rTjc/PIPV/0rxjqzy4qOjBGSQFgdfYeCC3ZxL23u0J00KZBYR9g8wLATLD+vhvO2
 6dMnieVMYv4ZfDQJAednm1T/NHG5U1qs7lL6t5XTxeSC3/jIt5V2MIFETrpzI2aC7dK+YS
 5CngxJ4yiwttm19ihDz9RCzyIhpUoug=
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com
 [209.85.160.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-647-yEheFGcvN1Gj74siTsEhbA-1; Wed, 11 Jan 2023 12:28:19 -0500
X-MC-Unique: yEheFGcvN1Gj74siTsEhbA-1
Received: by mail-qt1-f199.google.com with SMTP id
 f4-20020ac86ec4000000b003ad41e7dbf2so4357493qtv.11
 for <qemu-devel@nongnu.org>; Wed, 11 Jan 2023 09:28:19 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=oMBgKgZ9rfrfst1YYeKRJbSJwF8uJt8+Nzoujm7eClk=;
 b=JXkiCnDql/AzWya4F78aGpJDPzAcDRv/ALiMm1WQZvYVDcV16YPafA8tJ+VjVcgH9D
 a1CHbmsEn2rnOvLSieqPfe004d4Tk3tAq52KJM/5v+sTDRNTEoYmJJ4NByL0gjNzbE+q
 IAuNT40ysnSrPS4AXIs04D+0dyoA+6S5+YuDJOEURySONQi1WvSJEXMs3HAyEbVR3P2L
 mM8HVwvpARM01709M61etbsXsl2/wIpAuSbPYNOD3Ozntng7OSRv1t4N96SlNf0FGSgo
 SpMdU8tIDeV9rcZAhO/5lsLJNsh7zB4Wfd6ZVK49myJvAlYv4dc4k97sz16CU8m1NcCE
 KHJQ==
X-Gm-Message-State: AFqh2koxL8BDaTKnxbEMh5XH8uGiG8hGEeFYP2DHynIxiRxmYUXwr9j2
 Ft8v0xAlO4osSQsQ8fFIyTvgdhhpjRtg5Ot/N7lnIodnVrCIubEhYFVKwXwSkBuX69tRhRLYfHu
 94hMlV3iShZydzQ8=
X-Received: by 2002:a05:6214:3493:b0:531:d9b0:c8bd with SMTP id
 mr19-20020a056214349300b00531d9b0c8bdmr51031228qvb.33.1673458098736; 
 Wed, 11 Jan 2023 09:28:18 -0800 (PST)
X-Google-Smtp-Source: AMrXdXs2/mb5+3ME3DZtj5b1f6iCAsNpt4IlORRb7rBAjzqHDv4dG5AdRxQQngYOeeBqGJNxP/omGA==
X-Received: by 2002:a05:6214:3493:b0:531:d9b0:c8bd with SMTP id
 mr19-20020a056214349300b00531d9b0c8bdmr51031192qvb.33.1673458098396; 
 Wed, 11 Jan 2023 09:28:18 -0800 (PST)
Received: from x1n (bras-base-aurron9127w-grc-56-70-30-145-63.dsl.bell.ca.
 [70.30.145.63]) by smtp.gmail.com with ESMTPSA id
 d3-20020ae9ef03000000b00705e0ad29cdsm1244235qkg.77.2023.01.11.09.28.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 11 Jan 2023 09:28:17 -0800 (PST)
Date: Wed, 11 Jan 2023 12:28:16 -0500
From: Peter Xu <peterx@redhat.com>
To: David Hildenbrand <david@redhat.com>
Cc: qemu-devel@nongnu.org, "Dr . David Alan Gilbert" <dgilbert@redhat.com>,
 Juan Quintela <quintela@redhat.com>,
 "Michael S . Tsirkin" <mst@redhat.com>,
 Michal Privoznik <mprivozn@redhat.com>
Subject: Re: [PATCH v3 1/6] migration: Allow immutable device state to be
 migrated early (i.e., before RAM)
Message-ID: <Y77xsBnqW2per5sE@x1n>
References: <d60f9272-1e81-00da-8046-2264a9b97e58@redhat.com>
 <Y7cFplyGc4hIrYZW@x1n>
 <482fadb5-7420-e07b-982d-5b0f3e8c42f8@redhat.com>
 <Y7xw4RqLQUFWZyfI@x1n>
 <460b6ea0-67a6-891f-f8fb-a5f23e9985c4@redhat.com>
 <c6a66296-94a7-e1ef-e0c1-098071f961d2@redhat.com>
 <Y73Er/n86CgQTMYu@x1n>
 <fbde8341-660b-0ed1-4f74-0afe565d5be5@redhat.com>
 <Y77lb+tUxWGKuQbo@x1n>
 <6c017410-cdb6-6a7c-ab02-a8412e37ecba@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <6c017410-cdb6-6a7c-ab02-a8412e37ecba@redhat.com>
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

On Wed, Jan 11, 2023 at 05:58:36PM +0100, David Hildenbrand wrote:
> On 11.01.23 17:35, Peter Xu wrote:
> > On Wed, Jan 11, 2023 at 02:48:09PM +0100, David Hildenbrand wrote:
> > > On 10.01.23 21:03, Peter Xu wrote:
> > > > On Tue, Jan 10, 2023 at 12:52:32PM +0100, David Hildenbrand wrote:
> > > > > The following seems to work,
> > > > 
> > > > That looks much better at least from the diffstat pov (comparing to the
> > > > existing patch 1+5 and the framework changes), thanks.
> > > > 
> > > > > but makes analyze-migration.py angry:
> > > > > 
> > > > > $ ./scripts/analyze-migration.py -f STATEFILE
> > > > > Traceback (most recent call last):
> > > > >     File "/home/dhildenb/git/qemu/./scripts/analyze-migration.py", line 605, in <module>
> > > > >       dump.read(dump_memory = args.memory)
> > > > >     File "/home/dhildenb/git/qemu/./scripts/analyze-migration.py", line 539, in read
> > > > >       classdesc = self.section_classes[section_key]
> > > > >                   ~~~~~~~~~~~~~~~~~~~~^^^^^^^^^^^^^
> > > > > KeyError: ('0000:00:03.0/virtio-mem-early', 0)
> > > > > 
> > > > > 
> > > > > We need the vmdesc to create info for the device.
> > > > 
> > > > Migration may ignore the save entry if save_state() not provided in the
> > > > "devices" section:
> > > > 
> > > >           if ((!se->ops || !se->ops->save_state) && !se->vmsd) {
> > > >               continue;
> > > >           }
> > > > 
> > > > Could you try providing a shim save_state() for the new virtio-mem save
> > > > entry?
> > > > 
> > > > /*
> > > >    * Shim function to make sure the save entry will be dumped into "devices"
> > > >    * section, to make analyze-migration.py happy.
> > > >    */
> > > > static void virtio_mem_save_state_early(QEMUFile *file, void *opaque)
> > > > {
> > > > }
> > > > 
> > > > Then:
> > > > 
> > > > static const SaveVMHandlers vmstate_virtio_mem_device_early_ops = {
> > > >       .save_setup = virtio_mem_save_setup_early,
> > > >       .save_state = virtio_mem_save_state_early,
> > > >       .load_state = virtio_mem_load_state_early,
> > > > };
> > > > 
> > > > I'm not 100% sure it'll work yet, but maybe worth trying.
> > > 
> > > It doesn't. virtio_mem_load_state_early() will get called twice (once with
> > > state saved during save_setup() and once with effectively nothing during
> > > save_state(), which breaks the whole migration).
> > 
> > Oh hold on.. so load_state() to pair save_setup()? Maybe you should pair it
> > with load_setup(), which I just noticed..  Then the load_state() needs to
> > be another shim like save_state().
> 
> Let me see if that improves the situation. E.g., ram.c writes state in
> save_setup() but doesn't load any state in load_setup() -- it's all done in
> load_state().
> 
> ... no, still not working. It will read garbage during load_setup() now.
> 
> qemu-system-x86_64: Property 'memaddr' changed from 0x100000002037261 to
> 0x140000000
> qemu-system-x86_64: Failed to load virtio-mem-device-early:tmp
> qemu-system-x86_64: Load state of device 0000:00:03.0/virtio-mem-early
> failed
> qemu-system-x86_64: load of migration failed: Invalid argument
> 
> 
> I don't think that load_setup() is supposed to consume anything useful from
> the migration stream. I suspects it should actually not even consume a QEMU
> file right now, because they way it's used is just for initializing stuff.
> 
> qemu_loadvm_state_main() does the actual loading part, parsing sections etc.
> qemu_loadvm_state_setup() doesn't do any of that.
> 
> AFAIKS, at least qemu_loadvm_state_setup() would have to parse sections and
> the save_setup() users would have to be converted into using load_setup() as
> well. Not sure if more is missing.

Ouch, yeah, load_setup() is unfortunate. :(

I think load_setup() should be named load_init() without having the
qemufile at all.  But let's keep that aside for now, and see what other
option we have..

> 
> Even with that, I doubt that it would make analyze-migration.py work,
> because what we store is something different than what we record in the
> vmdesc.
> 
> > 
> > > 
> > > vmdesc handling is also wrong, because analyze-migration.py gets confused
> > > because it receives data stored during save_setup() but vmdesc created
> > > during save_state() was told that there would be "nothing" to interpret ...
> > > 
> > > $ ./scripts/analyze-migration.py -f STATEFILE
> > > {
> > >      "ram (2)": {
> > >          "section sizes": {
> > >              "0000:00:03.0/mem0": "0x0000000f00000000",
> > >              "pc.ram": "0x0000000100000000",
> > >              "/rom@etc/acpi/tables": "0x0000000000020000",
> > >              "pc.bios": "0x0000000000040000",
> > >              "0000:00:02.0/e1000.rom": "0x0000000000040000",
> > >              "pc.rom": "0x0000000000020000",
> > >              "/rom@etc/table-loader": "0x0000000000001000",
> > >              "/rom@etc/acpi/rsdp": "0x0000000000001000"
> > >          }
> > >      },
> > >      "0000:00:03.0/virtio-mem-early (51)": {
> > >          "data": ""
> > >      }
> > > }
> > 
> > Yeah this is expected, because the whole data stream within the setup phase
> > is a black box and not described by anything.  "ram" can display correctly
> > only because it's hard coded in the python script, I think.  The trick
> > above can only make the script not break but not teaching the script to
> > also check for the early vmsd.
> 
> Note that the issue here is that the scripts stops the output after the
> virtio-mem device. So I'm not complaining about the "data": "", but about
> the vmstate according to the vmdesc not having any other devices :)
> 
> > 
> > But that's one step forward and IMHO it's fine for special devices. For
> > example, even with your initial patch, I think the static analyzer (aka,
> > qemu -dump-vmstate) will also ignore your new vmsd anyway because it's not
> > directly bound to the DeviceState* but registered separately.  So no ideal
> > solution so far, afaict, without more work done on this aspect.
> > 
> > > 
> > > 
> > > Not sure if the whole thing becomes nicer when manually looking up the
> > > vmdesc ... because filling it will also requires manually storing the
> > > se->idstr and the se->instance_id, whereby both are migration-internal and
> > > not available inside save_setup().
> > > 
> > > 
> > > Hm, I really prefer something like the simplified version that let's
> > > migration core deal with vmstate to be migrated during save_setup() phase.
> > > We could avoid the vmstate->immutable flag and simply use a separate
> > > function for registering the vmstate, like:
> > > 
> > > vmstate_register_immutable()
> > > vmstate_register_early()
> > > ...
> > 
> > I agree, this looks useful.  It's just that the devices that need this will
> > be rare, and unfortunately some of them already implemented the stream in
> > other ways so maybe non-trivial to convert them.
> 
> Right, I agree about the "rare" part and that conversion might be hard,
> because they are not using a vmstate descriptor.
> 
> The only way to avoid that is moving away from using a vmstate descriptor
> and storing everything manually in virtio-mem code. Not particularly happy
> about that, but it would be the only feasible option without touching
> migration code that I can see.
> 
> > 
> > Not against it if you want to keep exploring, but if so please avoid using
> > the priority field, also I'd hope the early vmsd will be saved within
> > qemu_savevm_state_setup() so maybe it can be another alternative to
> > save_setup().
> > 
> > Maybe it's still easier we keep going with the save_setup() and the shim
> > functions above, if it works for you.
> 
> I'll happy to go the path you suggested if we can make it work. I'd be happy
> to have something "reasonable" for the virtio-mem device in the
> analyze-migration.py output. But I could live with just nothing useful for
> the device itself -- as long as at least the other devices still show up.

So, let's see whether we can go back to the load_state() approach..

static const SaveVMHandlers vmstate_virtio_mem_device_early_ops = {
      .save_setup = virtio_mem_save_setup_early,
      .save_state = virtio_mem_save_state_early,
      .load_state = virtio_mem_load_state_early,
};

vfio handled it using a single header flag for either save_setup() or
save_state(), then load_state() identifies it:

    data = qemu_get_be64(f);
    ...
        switch (data) {
        case VFIO_MIG_FLAG_DEV_CONFIG_STATE:
        ...
        case VFIO_MIG_FLAG_DEV_SETUP_STATE:
        ...

Maybe play the same trick here?  The flag needs to be hard coded but at
least not the vmsd.  Based on previous experience, I could have missed
something else, though. :)

Or if you like go the other way I'm fine too.

Thanks,

-- 
Peter Xu


