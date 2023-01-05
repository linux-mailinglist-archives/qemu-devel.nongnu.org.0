Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F2F2765F2A7
	for <lists+qemu-devel@lfdr.de>; Thu,  5 Jan 2023 18:29:05 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pDTqN-0002N7-2P; Thu, 05 Jan 2023 12:15:55 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1pDTpv-0002HA-8d
 for qemu-devel@nongnu.org; Thu, 05 Jan 2023 12:15:27 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1pDTpt-0000lB-Dj
 for qemu-devel@nongnu.org; Thu, 05 Jan 2023 12:15:27 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1672938922;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=19rEDQUJa/04G2sMkl9Jb1YHfgutkCrkTIItHorCDjo=;
 b=LV/Aq0EeXVdCRPU81I+VduT4pKzOWnAGANSlE1hDHHhsglGsmE9bOG2BjtfWoRz9CShdUG
 3ShZZ0F6JvQI5JyuisNx4TOXHpLMZeLh2xjgcfAWGWCVxfwJrfX3LLM6/gGUFwnm/FIXRS
 2lS28lSD0GuhmcPXDXGBvBvYQKiYDYI=
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com
 [209.85.160.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-297-lFIcFB8BMV6kaDyW4rvdGw-1; Thu, 05 Jan 2023 12:15:21 -0500
X-MC-Unique: lFIcFB8BMV6kaDyW4rvdGw-1
Received: by mail-qt1-f200.google.com with SMTP id
 g12-20020ac870cc000000b003a8112df2e9so13360806qtp.9
 for <qemu-devel@nongnu.org>; Thu, 05 Jan 2023 09:15:20 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=19rEDQUJa/04G2sMkl9Jb1YHfgutkCrkTIItHorCDjo=;
 b=RdCXlsRjUFo52qh9KYR/gEzo8rGqY4qgbaMdB0/ygUemk1hDDM/RxOigON55Dn4ib9
 3bEPkAdOBRlReJmxSEm0ssaFQ0+RV8m4gg86E2ebeSLelj3klegctE0ss8YeZxNOZLea
 c5iRubQsF9wKxD7M8Plj+LhEbmYLrseXpR8nsJYSC0me19cBumKwJMI1f7fYGD137pzG
 EIOAZrJYVQStj64oJwaWySbA9dcMlLWH6wm7rnK9RB18FoFBEWnu8o1Qh7+2urpNvyps
 ejHbRLRRbIS83UIwNpGMcfEk4TQ5obnS+Wftu0oo2tP8913bDsb/yGpPNGZsykMIsZpg
 boNQ==
X-Gm-Message-State: AFqh2kpUFPoBkB/Jvl5onm5S/NrKbzN/grbXz1eSpzRpvDTAchyjcvs2
 ZvdjQ6O+p/XhGn4Q9lAURuhFkwWvA8Q+GDxHXXjx1mX8vJIMDpAGIcs83yFqJbMm/YskjIaHe6W
 QT+xHoEsyZbW28gc=
X-Received: by 2002:a05:622a:11c8:b0:3a5:3134:48ac with SMTP id
 n8-20020a05622a11c800b003a5313448acmr100270526qtk.3.1672938920357; 
 Thu, 05 Jan 2023 09:15:20 -0800 (PST)
X-Google-Smtp-Source: AMrXdXs10nkxitSCtIfcJILEAeoVAyV3JigscA6OBWhYs+L/whM7hhwUNagPnsTZNUgGNnWpotgiaw==
X-Received: by 2002:a05:622a:11c8:b0:3a5:3134:48ac with SMTP id
 n8-20020a05622a11c800b003a5313448acmr100270485qtk.3.1672938920020; 
 Thu, 05 Jan 2023 09:15:20 -0800 (PST)
Received: from x1n (bras-base-aurron9127w-grc-39-70-52-228-144.dsl.bell.ca.
 [70.52.228.144]) by smtp.gmail.com with ESMTPSA id
 t3-20020ac85303000000b0039cba52974fsm21946832qtn.94.2023.01.05.09.15.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 05 Jan 2023 09:15:19 -0800 (PST)
Date: Thu, 5 Jan 2023 12:15:18 -0500
From: Peter Xu <peterx@redhat.com>
To: David Hildenbrand <david@redhat.com>
Cc: qemu-devel@nongnu.org, "Dr . David Alan Gilbert" <dgilbert@redhat.com>,
 Juan Quintela <quintela@redhat.com>,
 "Michael S . Tsirkin" <mst@redhat.com>,
 Michal Privoznik <mprivozn@redhat.com>
Subject: Re: [PATCH v3 1/6] migration: Allow immutable device state to be
 migrated early (i.e., before RAM)
Message-ID: <Y7cFplyGc4hIrYZW@x1n>
References: <20221222110215.130392-1-david@redhat.com>
 <20221222110215.130392-2-david@redhat.com> <Y7W2LtO5/m1r3VaL@x1n>
 <d60f9272-1e81-00da-8046-2264a9b97e58@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <d60f9272-1e81-00da-8046-2264a9b97e58@redhat.com>
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

On Thu, Jan 05, 2023 at 09:35:54AM +0100, David Hildenbrand wrote:
> On 04.01.23 18:23, Peter Xu wrote:
> > On Thu, Dec 22, 2022 at 12:02:10PM +0100, David Hildenbrand wrote:
> > > Migrating device state before we start iterating is currently impossible.
> > > Introduce and use qemu_savevm_state_start_precopy(), and use
> > > a new special migration priority -- MIG_PRI_POST_SETUP -- to decide whether
> > > state will be saved in qemu_savevm_state_start_precopy() or in
> > > qemu_savevm_state_complete_precopy_*().
> > 
> > Can something like this be done in qemu_savevm_state_setup()?
> 
> Hi Peter,

Hi, David,

> 
> Do you mean
> 
> (a) Moving qemu_savevm_state_start_precopy() effectively into
>     qemu_savevm_state_setup()
> 
> (b) Using se->ops->save_setup()

I meant (b).

> 
> I first tried going via (b), but decided to go the current way of using a
> proper vmstate with properties (instead of e.g., filling the stream
> manually), which also made vmdesc handling possible (and significantly
> cleaner).
> 
> Regarding (a), I decided to not move logic of
> qemu_savevm_state_start_precopy() into qemu_savevm_state_setup(), because it
> looked cleaner to save device state with the BQL held and for background
> snapshots, the VM has been stopped. To decouple device state saving from the
> setup path, just like we do it right now for all vmstates.

Is BQL required or optional?  IIUC it's at least still not taken in the
migration thread path, only in savevm path.

> 
> Having that said, for virtio-mem, it would still work because that state is
> immutable once migration starts, but it felt cleaner to separate the setup()
> phase from actual device state saving.

I get the point.  My major concerns are:

  (1) The new migration priority is changing the semantic of original,
      making it over-complicated

  (2) The new precopy-start routine added one more step to the migration
      framework, while it's somehow overlapping (if not to say, mostly the
      same as..) save_setup().

For (1): the old priority was only deciding the order of save entries in
the global list, nothing more than that.  Even if we want to have a
precopy-start phase, I'd suggest we use something else and keep the
migration priority simple.  Otherwise we really need serious documentation
for MigrationPriority and if so I'd rather don't bother and not reuse the
priority field.

For (2), if you see there're a bunch of save_setup() that already does
things like transferring static data besides the device states.  Besides
the notorious ram_save_setup() there's also dirty_bitmap_save_setup() which
also sends a bitmap during save_setup() and some others.  It looks clean to
me to do it in the same way as we used to.

Reusing vmstate_save() and vmsd structures are useful too which I totally
agree.  So.. can we just call vmstate_save_state() in the save_setup() of
the other new vmsd of virtio-mem?

Thanks,

-- 
Peter Xu


