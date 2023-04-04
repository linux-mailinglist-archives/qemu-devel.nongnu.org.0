Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A954C6D65DC
	for <lists+qemu-devel@lfdr.de>; Tue,  4 Apr 2023 16:54:19 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pji2c-0008Pg-Q1; Tue, 04 Apr 2023 10:53:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1pji2Y-0008NV-TC
 for qemu-devel@nongnu.org; Tue, 04 Apr 2023 10:53:42 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1pji2W-0001Qi-3K
 for qemu-devel@nongnu.org; Tue, 04 Apr 2023 10:53:41 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1680620019;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=VK7GDAVF543LQFsrieVUY8QizJj5a0Yj+LhGnnwFQ+8=;
 b=J+wCMDk9ELtDQm2kdfXKwhWv5U3EGSW49q9ubPJL8oxFR0e5bl66n05nxbJnCJ+uf4vjNi
 9awy+fWy4QfrUXJBAAp5FvpdfY9JjcvO92QVX3/dU1O6MoXCPuwqoL43rBfXV6izCF9PUG
 ogssa6UQcuSs+mnmX9SDV2wu/IWWJ8w=
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-445-7ub6vxxDM3Gg5FwdjNe7wQ-1; Tue, 04 Apr 2023 10:53:37 -0400
X-MC-Unique: 7ub6vxxDM3Gg5FwdjNe7wQ-1
Received: by mail-qk1-f200.google.com with SMTP id
 195-20020a3705cc000000b00746a3ab9426so14793643qkf.20
 for <qemu-devel@nongnu.org>; Tue, 04 Apr 2023 07:53:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680620017;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=VK7GDAVF543LQFsrieVUY8QizJj5a0Yj+LhGnnwFQ+8=;
 b=qllTyG6dwrtxJnuaCjdZh9J+XVxtvNcS73wLurHigeJQLKeVLbcRyRwzS7ygxnsWe1
 DfYIxqjxomdSxZ4vCzMD5/bzpmmxHn2ykeuD210xZzEYcgng+XHWc9UEKa8IgzPvX7GD
 fp8W1J/ZLLmdXUBWe7IHDn8lGw4rpsJpLeb7Y9n33u3MC3cRPQx1XkaNXIoAWD9CcHMC
 C0XUVe5bsVRYvJcz7yuOG/T0/xfrd6lSRLDmYdhTPA3Zm32vk/3rat3K5c+jIlc1WHYu
 Kp/+9qfL687RwZuqH5Pf4/uL/eR+i+twSZQcLmQgrt8bhas457EMdbwPTHoL05CRs1Kn
 TAoQ==
X-Gm-Message-State: AAQBX9fDYylcjurJb8A1KjPPn+AY91GnunZ+c+PdfS9xynY3Ym4a5NPf
 TQlQT/q2IkLYsC7FnMj8kXAjFr3M7mEwO4/gCLrglwzwVYNtgqNx8vHwJBN/2bcVvotkVkIC8pE
 6vDINHXy0SJClYKo=
X-Received: by 2002:a05:622a:1a91:b0:3e3:7e6b:50ce with SMTP id
 s17-20020a05622a1a9100b003e37e6b50cemr4000797qtc.4.1680620016783; 
 Tue, 04 Apr 2023 07:53:36 -0700 (PDT)
X-Google-Smtp-Source: AKy350YHqTq+9Tw6NaH9AqC3DWQhZrFrzfZObV8CSWzCWFcaOqUlZMPYjAM3DZPLyvup+PX69TLd9Q==
X-Received: by 2002:a05:622a:1a91:b0:3e3:7e6b:50ce with SMTP id
 s17-20020a05622a1a9100b003e37e6b50cemr4000746qtc.4.1680620016357; 
 Tue, 04 Apr 2023 07:53:36 -0700 (PDT)
Received: from x1n (bras-base-aurron9127w-grc-40-70-52-229-124.dsl.bell.ca.
 [70.52.229.124]) by smtp.gmail.com with ESMTPSA id
 dt36-20020a05620a47a400b0074852cdc4bcsm3623557qkb.62.2023.04.04.07.53.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 04 Apr 2023 07:53:35 -0700 (PDT)
Date: Tue, 4 Apr 2023 10:53:28 -0400
From: Peter Xu <peterx@redhat.com>
To: Claudio Fontana <cfontana@suse.de>
Cc: Fabiano Rosas <farosas@suse.de>,
 Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>,
 qemu-devel@nongnu.org, jfehlig@suse.com, dfaggioli@suse.com,
 dgilbert@redhat.com, Juan Quintela <quintela@redhat.com>
Subject: Re: [RFC PATCH v1 00/26] migration: File based migration with
 multifd and fixed-ram
Message-ID: <ZCw56BMiiZlX6nTH@x1n>
References: <ZCbzmZXz3JG/jElA@x1n> <878rfdos4a.fsf@suse.de>
 <ZCcCV8PIsuvab1lO@x1n> <ZCcF6I0qb+1xlPhJ@redhat.com>
 <ZCcKBDM9sLomGOQE@x1n> <875yagpywy.fsf@suse.de>
 <ZCdWJ59rqY6oScvg@x1n>
 <d2b40262-3791-8820-5104-e4eb313cd796@suse.de>
 <ZCsogia3r7ePKBR9@x1n>
 <e4a0c911-aa51-e700-640d-2876881bd077@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <e4a0c911-aa51-e700-640d-2876881bd077@suse.de>
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

On Tue, Apr 04, 2023 at 10:00:16AM +0200, Claudio Fontana wrote:
> Hi Peter,

Hi, Claudio,

> 
> On 4/3/23 21:26, Peter Xu wrote:
> > Hi, Claudio,
> > 
> > Thanks for the context.
> > 
> > On Mon, Apr 03, 2023 at 09:47:26AM +0200, Claudio Fontana wrote:
> >> Hi, not sure if what is asked here is context in terms of the previous
> >> upstream discussions or our specific requirement we are trying to bring
> >> upstream.
> >>
> >> In terms of the specific requirement we are trying to bring upstream, we
> >> need to get libvirt+QEMU VM save and restore functionality to be able to
> >> transfer VM sizes of ~30 GB (4/8 vcpus) in roughly 5 seconds.  When an
> >> event trigger happens, the VM needs to be quickly paused and saved to
> >> disk safely, including datasync, and another VM needs to be restored,
> >> also in ~5 secs.  For our specific requirement, the VM is never running
> >> when its data (mostly consisting of RAM) is saved.
> >>
> >> I understand that the need to handle also the "live" case comes from
> >> upstream discussions about solving the "general case", where someone
> >> might want to do this for "live" VMs, but if helpful I want to highlight
> >> that it is not part of the specific requirement we are trying to address,
> >> and for this specific case won't also in the future, as the whole point
> >> of the trigger is to replace the running VM with another VM, so it cannot
> >> be kept running.
> > 
> > From what I read so far, that scenario suites exactly what live snapshot
> > would do with current QEMU - that at least should involve a snapshot on the
> > disks being used or I can't see how that can be live.  So it looks like a
> > separate request.
> > 
> >> The reason we are using "migrate" here likely stems from the fact that
> >> existing libvirt code currently uses QMP migrate to implement the save
> >> and restore commands.  And in my personal view, I think that reusing the
> >> existing building blocks (migration, multifd) would be preferable, to
> >> avoid having to maintain two separate ways to do the same thing.  That
> >> said, it could be done in a different way, if the performance can keep
> >> up. Just thinking of reducing the overall effort and also maintenance
> >> surface.
> > 
> > I would vaguely guess the performance can not only keep up but better than
> > what the current solution would provide, due to the possibility of (1)
> > batch handling of continuous guest pages, and (2) completely no dirty
> > tracking overhead.
> > 
> > For (2), it's not about wr-protect page faults or vmexits due to PML being
> > full (because vcpus will be stopped anyway..), it's about enabling the
> > dirty tracking (which already contains overhead, especially when huge pages
> > are enabled, to split huge pages in EPT pgtables) and all the bitmap
> > operations QEMU does during live migration even if the VM is not live.
> 
> something we could profile for, I do not remember it being really an important source of overhead in my previous profile runs,
> but maybe worthwhile redoing the profiling with Fabiano's patchset.

Yes I don't know the detailed number either, it should depend on the guest
configuration (mem size, mem type, kernel version etc).  It could be less a
concern comparing to the time used elsewhere.  More on this on below.

> 
> > 
> > IMHO reusing multifd may or may not be a good idea here, because it'll of
> > course also complicate multifd code, hence makes multifd harder to
> > maintain, while not in a good way, because as I mentioned I don't think it
> > can use much of what multifd provides.
> 
> 
> The main advantage we get is the automatic multithreading of the qemu_savevm_state_iterate code in my view.
> 
> Reimplementing the same thing again has the potential to cause bitrot for this use case, and using multiple fds for the transfer is exactly what is needed here,
> and in my understanding the same exact reason multifd exists: to take advantage of high bandwidth migration channels.
> 
> The only adjustment needed to multifd is the ability to work with block devices (file fds) as the migration channels instead of just sockets,
> so it seems a very natural extension of multifd to me.

Yes, since I haven't looked at the multifd patches at all so I don't have
solid clue on how much it'll affect multifd.  I'll leave that to Juan.

> 
> > 
> > I don't have a strong opinion on the impl (even though I do have a
> > preference..), but I think at least we should still check on two things:
> > 
> >   - Being crystal clear on the use case above, and double check whether "VM
> >     stop" should be the default operation at the start of the new cmd - we
> >     shouldn't assume the user will be aware of doing this, neither should
> >     we assume the user is aware of the performance implications.
> 
> 
> Not sure I can identify what you are asking specifically: the use case is to stop executing the currently running VM as soon as possible, save it to disk, then restore another VM as soon as possible.
> Probably I missed something there.

Yes, then IMHO as mentioned we should make "vm stop" part of the command
procedure if vm was still running when invoked.  Then we can already
optimize dirty logging of above (2) with the current framework. E.g., we
already optimized live snapshot to not enable dirty logging:

        if (!migrate_background_snapshot()) {
            memory_global_dirty_log_start(GLOBAL_DIRTY_MIGRATION);
            migration_bitmap_sync_precopy(rs);
        }

Maybe that can also be done for fixed-ram migration, so no matter how much
overhead there will be, that can be avoided.

PS: I think similar optimizations can be done too in ram_save_complete() or
ram_state_pending_exact().. maybe we should move the check into
migration_bitmap_sync_precopy() so it can be skipped as a whole when it can.

Thanks,

> 
> > 
> >   - Making sure the image layout is well defined, so:
> > 
> >     - It'll be extensible in the future, and,
> > 
> >     - If someone would like to refactor it to not use the migration thread
> >       model anymore, the image format, hopefully, can be easy to keep
> >       untouched so it can be compatible with the current approach.
> > 
> > Just my two cents. I think Juan should have the best grasp on this.
> > 
> > Thanks,
> > 
> 
> Ciao,
> 
> Claudio
> 

-- 
Peter Xu


