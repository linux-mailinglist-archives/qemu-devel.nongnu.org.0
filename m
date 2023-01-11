Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 346A76660AE
	for <lists+qemu-devel@lfdr.de>; Wed, 11 Jan 2023 17:37:07 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pFe5U-0003fC-4f; Wed, 11 Jan 2023 11:36:28 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1pFe5F-0003Ya-CV
 for qemu-devel@nongnu.org; Wed, 11 Jan 2023 11:36:15 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1pFe5D-0007F1-8n
 for qemu-devel@nongnu.org; Wed, 11 Jan 2023 11:36:12 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1673454969;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=l13c3o75K3et7Wk5kw6G85u/qd13vG0Iuvtub6C+9bU=;
 b=XL5BVbBEL7XW+x4qvLmQsNWL5vTA2qjdTb66qvGKSuU/zLdB9tysYGrTUVIOH0Sp1k6eSj
 YP0VYEytuywekEZ6Hp7KtPD3I8DZv196pEyXJN+4vz0x2oLLuzSalz/w9gnE3ZL9IioXQC
 Kh7hz/gEXIvlQFDEUHOzvN8w3PKd5wg=
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-474-mQfLsoIBP6S5iERpJJzOcg-1; Wed, 11 Jan 2023 11:36:03 -0500
X-MC-Unique: mQfLsoIBP6S5iERpJJzOcg-1
Received: by mail-qk1-f200.google.com with SMTP id
 br6-20020a05620a460600b007021e1a5c48so11219672qkb.6
 for <qemu-devel@nongnu.org>; Wed, 11 Jan 2023 08:36:02 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=l13c3o75K3et7Wk5kw6G85u/qd13vG0Iuvtub6C+9bU=;
 b=lImPXosNrc8i/DjDwEgHiMPaMeNtE9cgrA8ZLYZ1ZMb0F17SZScYdXsKRK0SKjcqqx
 1qZuTgKiwkEMz/mWGL48uhwk84knmDxAK6eLTqDH2xa3uKtG7i1n0s5VwJrrrSakFFW1
 hjvgLRfJXgOWz83yr1C7ID7SdE1ShbEzBv9FWK+rpTS3ObiW5kFeuv+X8YM2fQFBl4Sp
 0yqqMAIwOlgos+JvWtt+1cpVexKFadOYBe0Zu1n4ftgezH8MWolzXEdI96NM0xI6JwOT
 rg7ywth0hIy2Q3hp+ciENx9wZnkYl/akoZkUm7GYuYDicJ9EGy/evI1YmeCG1QbqTaA+
 DaZQ==
X-Gm-Message-State: AFqh2krnp8NaDo+sY1MFdrbWfcuI4s1zo5m2zWWig0MEUmt1hqEbm3fL
 bhkncu0mArLjq3JfTNp0mM4awz8T7NH80UiPm5lxphlC2l5P5lvTV3vNnnErBMWHiRSBzeOmvtr
 CTyIjowvm7djWd9o=
X-Received: by 2002:ac8:544b:0:b0:3ae:d88a:7d1f with SMTP id
 d11-20020ac8544b000000b003aed88a7d1fmr11891765qtq.31.1673454961816; 
 Wed, 11 Jan 2023 08:36:01 -0800 (PST)
X-Google-Smtp-Source: AMrXdXv57GXWOKEMM7ni36gavhjfjPyLGT/X/JOmoMp0a1jvvsPreunekruVLWPSegstrVYMqdRCyQ==
X-Received: by 2002:ac8:544b:0:b0:3ae:d88a:7d1f with SMTP id
 d11-20020ac8544b000000b003aed88a7d1fmr11891738qtq.31.1673454961499; 
 Wed, 11 Jan 2023 08:36:01 -0800 (PST)
Received: from x1n (bras-base-aurron9127w-grc-56-70-30-145-63.dsl.bell.ca.
 [70.30.145.63]) by smtp.gmail.com with ESMTPSA id
 fg13-20020a05622a580d00b003a6a92a202esm7794039qtb.83.2023.01.11.08.36.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 11 Jan 2023 08:36:00 -0800 (PST)
Date: Wed, 11 Jan 2023 11:35:59 -0500
From: Peter Xu <peterx@redhat.com>
To: David Hildenbrand <david@redhat.com>
Cc: qemu-devel@nongnu.org, "Dr . David Alan Gilbert" <dgilbert@redhat.com>,
 Juan Quintela <quintela@redhat.com>,
 "Michael S . Tsirkin" <mst@redhat.com>,
 Michal Privoznik <mprivozn@redhat.com>
Subject: Re: [PATCH v3 1/6] migration: Allow immutable device state to be
 migrated early (i.e., before RAM)
Message-ID: <Y77lb+tUxWGKuQbo@x1n>
References: <20221222110215.130392-2-david@redhat.com> <Y7W2LtO5/m1r3VaL@x1n>
 <d60f9272-1e81-00da-8046-2264a9b97e58@redhat.com>
 <Y7cFplyGc4hIrYZW@x1n>
 <482fadb5-7420-e07b-982d-5b0f3e8c42f8@redhat.com>
 <Y7xw4RqLQUFWZyfI@x1n>
 <460b6ea0-67a6-891f-f8fb-a5f23e9985c4@redhat.com>
 <c6a66296-94a7-e1ef-e0c1-098071f961d2@redhat.com>
 <Y73Er/n86CgQTMYu@x1n>
 <fbde8341-660b-0ed1-4f74-0afe565d5be5@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <fbde8341-660b-0ed1-4f74-0afe565d5be5@redhat.com>
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

On Wed, Jan 11, 2023 at 02:48:09PM +0100, David Hildenbrand wrote:
> On 10.01.23 21:03, Peter Xu wrote:
> > On Tue, Jan 10, 2023 at 12:52:32PM +0100, David Hildenbrand wrote:
> > > The following seems to work,
> > 
> > That looks much better at least from the diffstat pov (comparing to the
> > existing patch 1+5 and the framework changes), thanks.
> > 
> > > but makes analyze-migration.py angry:
> > > 
> > > $ ./scripts/analyze-migration.py -f STATEFILE
> > > Traceback (most recent call last):
> > >    File "/home/dhildenb/git/qemu/./scripts/analyze-migration.py", line 605, in <module>
> > >      dump.read(dump_memory = args.memory)
> > >    File "/home/dhildenb/git/qemu/./scripts/analyze-migration.py", line 539, in read
> > >      classdesc = self.section_classes[section_key]
> > >                  ~~~~~~~~~~~~~~~~~~~~^^^^^^^^^^^^^
> > > KeyError: ('0000:00:03.0/virtio-mem-early', 0)
> > > 
> > > 
> > > We need the vmdesc to create info for the device.
> > 
> > Migration may ignore the save entry if save_state() not provided in the
> > "devices" section:
> > 
> >          if ((!se->ops || !se->ops->save_state) && !se->vmsd) {
> >              continue;
> >          }
> > 
> > Could you try providing a shim save_state() for the new virtio-mem save
> > entry?
> > 
> > /*
> >   * Shim function to make sure the save entry will be dumped into "devices"
> >   * section, to make analyze-migration.py happy.
> >   */
> > static void virtio_mem_save_state_early(QEMUFile *file, void *opaque)
> > {
> > }
> > 
> > Then:
> > 
> > static const SaveVMHandlers vmstate_virtio_mem_device_early_ops = {
> >      .save_setup = virtio_mem_save_setup_early,
> >      .save_state = virtio_mem_save_state_early,
> >      .load_state = virtio_mem_load_state_early,
> > };
> > 
> > I'm not 100% sure it'll work yet, but maybe worth trying.
> 
> It doesn't. virtio_mem_load_state_early() will get called twice (once with
> state saved during save_setup() and once with effectively nothing during
> save_state(), which breaks the whole migration).

Oh hold on.. so load_state() to pair save_setup()? Maybe you should pair it
with load_setup(), which I just noticed..  Then the load_state() needs to
be another shim like save_state().

> 
> vmdesc handling is also wrong, because analyze-migration.py gets confused
> because it receives data stored during save_setup() but vmdesc created
> during save_state() was told that there would be "nothing" to interpret ...
> 
> $ ./scripts/analyze-migration.py -f STATEFILE
> {
>     "ram (2)": {
>         "section sizes": {
>             "0000:00:03.0/mem0": "0x0000000f00000000",
>             "pc.ram": "0x0000000100000000",
>             "/rom@etc/acpi/tables": "0x0000000000020000",
>             "pc.bios": "0x0000000000040000",
>             "0000:00:02.0/e1000.rom": "0x0000000000040000",
>             "pc.rom": "0x0000000000020000",
>             "/rom@etc/table-loader": "0x0000000000001000",
>             "/rom@etc/acpi/rsdp": "0x0000000000001000"
>         }
>     },
>     "0000:00:03.0/virtio-mem-early (51)": {
>         "data": ""
>     }
> }

Yeah this is expected, because the whole data stream within the setup phase
is a black box and not described by anything.  "ram" can display correctly
only because it's hard coded in the python script, I think.  The trick
above can only make the script not break but not teaching the script to
also check for the early vmsd.

But that's one step forward and IMHO it's fine for special devices. For
example, even with your initial patch, I think the static analyzer (aka,
qemu -dump-vmstate) will also ignore your new vmsd anyway because it's not
directly bound to the DeviceState* but registered separately.  So no ideal
solution so far, afaict, without more work done on this aspect.

> 
> 
> Not sure if the whole thing becomes nicer when manually looking up the
> vmdesc ... because filling it will also requires manually storing the
> se->idstr and the se->instance_id, whereby both are migration-internal and
> not available inside save_setup().
> 
> 
> Hm, I really prefer something like the simplified version that let's
> migration core deal with vmstate to be migrated during save_setup() phase.
> We could avoid the vmstate->immutable flag and simply use a separate
> function for registering the vmstate, like:
> 
> vmstate_register_immutable()
> vmstate_register_early()
> ...

I agree, this looks useful.  It's just that the devices that need this will
be rare, and unfortunately some of them already implemented the stream in
other ways so maybe non-trivial to convert them.

Not against it if you want to keep exploring, but if so please avoid using
the priority field, also I'd hope the early vmsd will be saved within
qemu_savevm_state_setup() so maybe it can be another alternative to
save_setup().

Maybe it's still easier we keep going with the save_setup() and the shim
functions above, if it works for you.

-- 
Peter Xu


