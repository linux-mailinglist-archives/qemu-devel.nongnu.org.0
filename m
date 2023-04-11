Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BC4D6DDFEE
	for <lists+qemu-devel@lfdr.de>; Tue, 11 Apr 2023 17:50:04 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pmGEb-0006RM-8A; Tue, 11 Apr 2023 11:48:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1pmGEZ-0006R0-6h
 for qemu-devel@nongnu.org; Tue, 11 Apr 2023 11:48:39 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1pmGEV-0002aU-BA
 for qemu-devel@nongnu.org; Tue, 11 Apr 2023 11:48:38 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1681228113;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=dVxzr7wrA6jlsPwsyny51l/KWCffQupMiahZAGRGLEc=;
 b=hvzsE7tsy1yCI1wPfgf5n1ITjMt1+4rm+qbzM7x/S4PrbbFgZ2cRIfauMFLJWqdRkgYW8u
 s+OPaApoJo33Eu1B2vUUbGwEkpBQmYQd0lPc2QUldJZ+c983GUAZ7/y8dE86fLwpH2GbA7
 TP+iIp7IcGvN1bbozbg9sayuhcbWuds=
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com
 [209.85.219.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-75-DalYmTraO6CVvtInoKPqPg-1; Tue, 11 Apr 2023 11:48:30 -0400
X-MC-Unique: DalYmTraO6CVvtInoKPqPg-1
Received: by mail-qv1-f70.google.com with SMTP id
 6a1803df08f44-5e965c54827so6088386d6.0
 for <qemu-devel@nongnu.org>; Tue, 11 Apr 2023 08:48:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1681228109; x=1683820109;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=dVxzr7wrA6jlsPwsyny51l/KWCffQupMiahZAGRGLEc=;
 b=6dKPyTNrmNMuyR4HU5UXlZLUg264LhNAU1VfcQqXluXMLBI03LGh1PBSlqlBuYxaw6
 HInflxeB4ygjOusKcIUl90CIGwds3uJSRHD5Q/W1snLu5+XUbKkrw//Y0tU4tefK1jT4
 KJRHj1zVr9MYQ6G48eCNgq1tpeDR0C1pXW9cW3AdmAWfAGcezUMe/2UBY3BSaWrR9xM5
 2WWpThKkZKogWKVDjXXWYHTdA0AbwNM9mQik8lJpR5z0yWqNxLXa+Ty3qw9soXvRwf7O
 5xmXByQaQwAyNj5mYp681xIGTd3wv8/OUhmWy548e6j8xZGqeWqDxvXiYwZr27ccA1jc
 Hx5w==
X-Gm-Message-State: AAQBX9dMnjoF2TM1rAyDrlwpZJYLL6L/OQZ0LPdOLbhZJFJM9pQgrPW8
 s+QXRCrXvctOAbbfWLs5cCIUpuMN7V0/85N+hw93nxQtAGx+2ofDGbRfO8y3duK0uzdAH0bb5CM
 cuMyyilxoFQoaGAA=
X-Received: by 2002:a05:6214:4009:b0:5ac:325c:a28f with SMTP id
 kd9-20020a056214400900b005ac325ca28fmr23125566qvb.0.1681228109491; 
 Tue, 11 Apr 2023 08:48:29 -0700 (PDT)
X-Google-Smtp-Source: AKy350ZV0otyLTD79ROs+F7POakv0O8h+7n3OYAtckiV1cV5eQDFXb8+tH1a2+w3DKr1/BpLePbPbg==
X-Received: by 2002:a05:6214:4009:b0:5ac:325c:a28f with SMTP id
 kd9-20020a056214400900b005ac325ca28fmr23125507qvb.0.1681228108953; 
 Tue, 11 Apr 2023 08:48:28 -0700 (PDT)
Received: from x1n (bras-base-aurron9127w-grc-40-70-52-229-124.dsl.bell.ca.
 [70.52.229.124]) by smtp.gmail.com with ESMTPSA id
 y7-20020a0ce807000000b005e96ebf9bbdsm2627936qvn.5.2023.04.11.08.48.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 11 Apr 2023 08:48:27 -0700 (PDT)
Date: Tue, 11 Apr 2023 11:48:26 -0400
From: Peter Xu <peterx@redhat.com>
To: Claudio Fontana <cfontana@suse.de>
Cc: Fabiano Rosas <farosas@suse.de>,
 Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>,
 qemu-devel@nongnu.org, jfehlig@suse.com, dfaggioli@suse.com,
 dgilbert@redhat.com, Juan Quintela <quintela@redhat.com>
Subject: Re: [RFC PATCH v1 00/26] migration: File based migration with
 multifd and fixed-ram
Message-ID: <ZDWBSuGDU9IMohEf@x1n>
References: <875yagpywy.fsf@suse.de> <ZCdWJ59rqY6oScvg@x1n>
 <d2b40262-3791-8820-5104-e4eb313cd796@suse.de>
 <ZCsogia3r7ePKBR9@x1n>
 <e4a0c911-aa51-e700-640d-2876881bd077@suse.de>
 <ZCw56BMiiZlX6nTH@x1n>
 <ef16fb3d-e7ff-198a-6cb6-d0bdae5dfb3c@suse.de>
 <ZCxIwtW0rrbHEEJu@x1n> <87fs9duff9.fsf@suse.de>
 <2cc6ddd3-9cd3-242c-cc06-29a58dd796ad@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <2cc6ddd3-9cd3-242c-cc06-29a58dd796ad@suse.de>
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

On Fri, Apr 07, 2023 at 12:36:24PM +0200, Claudio Fontana wrote:
> On 4/6/23 18:46, Fabiano Rosas wrote:
> > Peter Xu <peterx@redhat.com> writes:
> > 
> >> On Tue, Apr 04, 2023 at 05:10:52PM +0200, Claudio Fontana wrote:
> >>> On 4/4/23 16:53, Peter Xu wrote:
> >>>> On Tue, Apr 04, 2023 at 10:00:16AM +0200, Claudio Fontana wrote:
> >>>>> Hi Peter,
> >>>>
> >>>> Hi, Claudio,
> >>>>
> >>>>>
> >>>>> On 4/3/23 21:26, Peter Xu wrote:
> >>>>>> Hi, Claudio,
> >>>>>>
> >>>>>> Thanks for the context.
> >>>>>>
> >>>>>> On Mon, Apr 03, 2023 at 09:47:26AM +0200, Claudio Fontana wrote:
> >>>>>>> Hi, not sure if what is asked here is context in terms of the previous
> >>>>>>> upstream discussions or our specific requirement we are trying to bring
> >>>>>>> upstream.
> >>>>>>>
> >>>>>>> In terms of the specific requirement we are trying to bring upstream, we
> >>>>>>> need to get libvirt+QEMU VM save and restore functionality to be able to
> >>>>>>> transfer VM sizes of ~30 GB (4/8 vcpus) in roughly 5 seconds.  When an
> >>>>>>> event trigger happens, the VM needs to be quickly paused and saved to
> >>>>>>> disk safely, including datasync, and another VM needs to be restored,
> >>>>>>> also in ~5 secs.  For our specific requirement, the VM is never running
> >>>>>>> when its data (mostly consisting of RAM) is saved.
> >>>>>>>
> >>>>>>> I understand that the need to handle also the "live" case comes from
> >>>>>>> upstream discussions about solving the "general case", where someone
> >>>>>>> might want to do this for "live" VMs, but if helpful I want to highlight
> >>>>>>> that it is not part of the specific requirement we are trying to address,
> >>>>>>> and for this specific case won't also in the future, as the whole point
> >>>>>>> of the trigger is to replace the running VM with another VM, so it cannot
> >>>>>>> be kept running.
> >>>>>>
> >>>>>> From what I read so far, that scenario suites exactly what live snapshot
> >>>>>> would do with current QEMU - that at least should involve a snapshot on the
> >>>>>> disks being used or I can't see how that can be live.  So it looks like a
> >>>>>> separate request.
> >>>>>>
> >>>>>>> The reason we are using "migrate" here likely stems from the fact that
> >>>>>>> existing libvirt code currently uses QMP migrate to implement the save
> >>>>>>> and restore commands.  And in my personal view, I think that reusing the
> >>>>>>> existing building blocks (migration, multifd) would be preferable, to
> >>>>>>> avoid having to maintain two separate ways to do the same thing.  That
> >>>>>>> said, it could be done in a different way, if the performance can keep
> >>>>>>> up. Just thinking of reducing the overall effort and also maintenance
> >>>>>>> surface.
> >>>>>>
> >>>>>> I would vaguely guess the performance can not only keep up but better than
> >>>>>> what the current solution would provide, due to the possibility of (1)
> >>>>>> batch handling of continuous guest pages, and (2) completely no dirty
> >>>>>> tracking overhead.
> >>>>>>
> >>>>>> For (2), it's not about wr-protect page faults or vmexits due to PML being
> >>>>>> full (because vcpus will be stopped anyway..), it's about enabling the
> >>>>>> dirty tracking (which already contains overhead, especially when huge pages
> >>>>>> are enabled, to split huge pages in EPT pgtables) and all the bitmap
> >>>>>> operations QEMU does during live migration even if the VM is not live.
> >>>>>
> >>>>> something we could profile for, I do not remember it being really an important source of overhead in my previous profile runs,
> >>>>> but maybe worthwhile redoing the profiling with Fabiano's patchset.
> >>>>
> >>>> Yes I don't know the detailed number either, it should depend on the guest
> >>>> configuration (mem size, mem type, kernel version etc).  It could be less a
> >>>> concern comparing to the time used elsewhere.  More on this on below.
> >>>>
> >>>>>
> >>>>>>
> >>>>>> IMHO reusing multifd may or may not be a good idea here, because it'll of
> >>>>>> course also complicate multifd code, hence makes multifd harder to
> >>>>>> maintain, while not in a good way, because as I mentioned I don't think it
> >>>>>> can use much of what multifd provides.
> >>>>>
> >>>>>
> >>>>> The main advantage we get is the automatic multithreading of the qemu_savevm_state_iterate code in my view.
> >>>>>
> >>>>> Reimplementing the same thing again has the potential to cause bitrot for this use case, and using multiple fds for the transfer is exactly what is needed here,
> >>>>> and in my understanding the same exact reason multifd exists: to take advantage of high bandwidth migration channels.
> >>>>>
> >>>>> The only adjustment needed to multifd is the ability to work with block devices (file fds) as the migration channels instead of just sockets,
> >>>>> so it seems a very natural extension of multifd to me.
> >>>>
> >>>> Yes, since I haven't looked at the multifd patches at all so I don't have
> >>>> solid clue on how much it'll affect multifd.  I'll leave that to Juan.
> >>>>
> >>>>>
> >>>>>>
> >>>>>> I don't have a strong opinion on the impl (even though I do have a
> >>>>>> preference..), but I think at least we should still check on two things:
> >>>>>>
> >>>>>>   - Being crystal clear on the use case above, and double check whether "VM
> >>>>>>     stop" should be the default operation at the start of the new cmd - we
> >>>>>>     shouldn't assume the user will be aware of doing this, neither should
> >>>>>>     we assume the user is aware of the performance implications.
> >>>>>
> >>>>>
> >>>>> Not sure I can identify what you are asking specifically: the use case is to stop executing the currently running VM as soon as possible, save it to disk, then restore another VM as soon as possible.
> >>>>> Probably I missed something there.
> >>>>
> >>>> Yes, then IMHO as mentioned we should make "vm stop" part of the command
> >>>> procedure if vm was still running when invoked.  Then we can already
> >>>> optimize dirty logging of above (2) with the current framework. E.g., we
> >>>> already optimized live snapshot to not enable dirty logging:
> >>>>
> >>>>         if (!migrate_background_snapshot()) {
> >>>>             memory_global_dirty_log_start(GLOBAL_DIRTY_MIGRATION);
> >>>>             migration_bitmap_sync_precopy(rs);
> >>>>         }
> >>>>
> >>>> Maybe that can also be done for fixed-ram migration, so no matter how much
> >>>> overhead there will be, that can be avoided.
> >>>
> >>> Understood, agree.
> >>>
> >>> Would it make sense to check for something like if (!runstate_is_running())
> >>> instead of checking for the specific multifd + fixed-ram feature?
> >>>
> >>> I think from a high level perspective, there should not be dirtying if the vcpus are not running right?
> >>> This could even be a bit more future proof to avoid checking for many features, if they all happen to share the fact that vcpus are not running.
> >>
> >> Hmm I'm not sure.  I think we still allow use to stop/start VMs during
> >> migration?  If so, probably not applicable.
> >>
> >> And it won't cover live snapshot too - live snapshot always run with VM
> >> running, but it doesn't need to track dirty.  It actually needs to track
> >> dirty, but in a synchronous way to make it efficient (while kvm dirty
> >> tracking is asynchronous, aka, vcpu won't be blocked if dirtied).
> >>
> >> So here we can make it "if (migrate_needs_async_dirty_tracking())", and
> >> having both live snapshot and fixed-ram migration covered in the helper to
> >> opt-out dirty tracking.
> >>
> >> One thing worth keeping an eye here is if we go that way we need to make
> >> sure VM won't be started during the fixed-ram migration.  IOW, we can
> >> cancel the fixed-ram migration (in this case, more suitable to be called
> >> "vm suspend") if the user starts the VM during the process.
> >>
> >>>
> >>>>
> >>>> PS: I think similar optimizations can be done too in ram_save_complete() or
> >>>> ram_state_pending_exact().. maybe we should move the check into
> >>>> migration_bitmap_sync_precopy() so it can be skipped as a whole when it can.
> >>>
> >>> makes sense, interesting.
> >>>
> >>> I wonder if ramblock_is_ignored() could be optimized a bit too, since it seems to consume roughly the same amount of cpu as the dirty bitmap handling, even when "ignore-shared" is not used.
> >>
> >> Do you mean we can skip dirty tracking when ramblock_is_ignored() for a
> >> ramblock?  I think it's doable but it'll be slightly more involved, because
> >> ignored/shared ramblocks can be used together with private/non-ignored
> >> ramblocks, hence at least it's not applicable globally.
> >>
> >>>
> >>> this feature was added by:
> >>>
> >>> commit fbd162e629aaf8a7e464af44d2f73d06b26428ad
> >>> Author: Yury Kotov <yury-kotov@yandex-team.ru>
> >>> Date:   Fri Feb 15 20:45:46 2019 +0300
> >>>
> >>>     migration: Add an ability to ignore shared RAM blocks
> >>>     
> >>>     If ignore-shared capability is set then skip shared RAMBlocks during the
> >>>     RAM migration.
> >>>     Also, move qemu_ram_foreach_migratable_block (and rename) to the
> >>>     migration code, because it requires access to the migration capabilities.
> >>>     
> >>>     Signed-off-by: Yury Kotov <yury-kotov@yandex-team.ru>
> >>>     Message-Id: <20190215174548.2630-4-yury-kotov@yandex-team.ru>
> >>>     Reviewed-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
> >>>     Signed-off-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
> >>>
> >>> Probably not that important, just to mention since we were thinking of possible small optimizations.
> >>> I would like to share the complete previous callgrind data, but cannot find a way to export them in a readable state, could export the graph though as PDF if helpful.
> >>>
> >>> Likely we'd need a new round of measurements with perf...
> >>
> >> Yes it would be good to know. Said that, I think it'll also be fine if
> >> optimizations are done on top, as long as the change will be compatible
> >> with the interface being proposed.
> >>
> >> Here e.g. "stop the VM within the cmd" is part of the interface so IMHO it
> >> should be decided before this series got merged.
> >>
> > 
> > Ok, so in summary, the high level requirement says we need to stop the
> > VM and we've determined that stopping it before the migration is what
> > probably makes more sense.
> > 
> > Keeping in mind that the design of fixed-ram already supports live
> > migration, I see three options for the interface so far:
> 
> (just my opinion here, I might be wrong and is not directly a requirement I am presenting here)
> 
> Maybe there are other reasons to provide the fixed-ram offsets thing beyond the live case? I am unclear on that.
> 
> If the live case is a potential requirement for someone else, or there are other reasons for fixed-ram offsets anyway,
> I think it would be better to leave the decision of whether to stop or not to stop the vm prior to transfer to the user, or to the management tools (libvirt ...)

We'll need someone stand up and explain the use case.  IMHO we should not
assume something can happen and design the interface with an assumption,
especially if there can be an impact on the design with the assumption.
Per my own experience that's the major source of over-engineering.

If we live migrate the VM then stop it after migration completes, it means
we're "assuming" the ultimate disk image will match with the VM image we're
going to create, but I doubt it.

Here the whole process actually contains a few steps:

     (1)                  (2)                     (3)               (4)
  VM running --> start live migration --> migration completes --> VM stop
                   (fixed-ram=on)

We have the VM image containing all the VM states (including device and
memory) at step (3), then we can optionally & quickly turn off the VM at
step (4).  IOW, the final disk image contains states in step (4) not step
(3).  The question is could something changed on the disk or IO flush
happened during step (3) and (4)?

IOW, I think the use case so far can only be justified if it's VM suspend.

> 
> We care about the stop case, but since the proposal already supports live too, there is no real good reason I think to force the user to stop the VM, forcing our own use case when others might find use for "live".
> 
> If we want to detect the two cases at runtime separately in the future for potential additional performance gain, that is a possibility in my view for future work,
> but we know already experimentally that the bits of extra overhead for the dirty bitmap tracking is not the real bottleneck at least in our testing,
> even with devices capable of transfering ~6 gigabytes per second.

Is that device assigned to the guest?  I'm very curious why that wouldn't
make a difference.

It could be that the device is reusing a small buffer of the guest so even
if it dirtied very fast it's still a small range impact.  Logically high
dirty loads definitely will make a difference irrelevant of dirty tracking
overheads (e.g., besides tracking overhead that we'll also need to migrate
dirtied pages >1 times; while we don't need to do that with live snapshot).

> 
> But again this is assuming that the live case is compatible and does not make things overly complicated,
> otherwise looking instead at the thing from purely these business requirements perspective we don't need it, and we could even scrap live.
> 
> > 
> > 1) Add a new command that does vm_stop + fixed-ram migrate;
> > 
> > 2) Arbitrarily declare that fixed-ram is always non-live and hardcode
> >    that;
> > 
> > 3) Add a new migration capability "live migration", ON by default and
> >    have the management layer set fixed-ram=on, live-migration=off.
> 
> (just minor point, for the case where this would apply): instead of an additional options, could we not just detect whether we are "live" or not by just checking whether the guest is in a running state?
> I suppose we don't allow to start/stop guests while the migration is running..
> 
> 
> > 
> > I guess this also largely depends on what direction we're going with the
> > migration code in general. I.e. do we prefer a more isolated
> > implementation or keep the new feature flexible for future use-cases?
> 
> right, looking for the migration experts and maintainers to chime in here :-)
> 
> > 
> > I'll give people time to catch up and in the meantime work on adding the
> > stop and the safeguards around the user re-starting.
> > 
> > Thanks all for the input so far.
> 
> Thanks and as again: all this is just my 2c truly.
> 
> Ciao,
> 
> Claudio
> 

-- 
Peter Xu


