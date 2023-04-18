Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F4206E6CEC
	for <lists+qemu-devel@lfdr.de>; Tue, 18 Apr 2023 21:27:25 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1poqyi-0005QV-NI; Tue, 18 Apr 2023 15:27:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1poqyc-0005QF-9L
 for qemu-devel@nongnu.org; Tue, 18 Apr 2023 15:26:54 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1poqyZ-0004QY-R9
 for qemu-devel@nongnu.org; Tue, 18 Apr 2023 15:26:54 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1681846010;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=/85skPWIY0zVf2qWrvnKLQw98OfHM6i8+jnt+HWHn1k=;
 b=g0msLZRVFFVefCdD+8Us5KYIDeXWP1sxB/H9fwlFmwNjLAbJFewDHlY/blKnAbaayJYk6v
 gvrW5f1ZjR+uxm1c5azR/CsjsmCRbdR4ttZ3E9ak6IQHhdX0W10FZoLqhahRvwNidaW5M2
 vSm73SIEMU+/xNSaGnRE5nygghoWJQ4=
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-331-NxdOGA0HOQqwEUeemeIsTg-1; Tue, 18 Apr 2023 15:26:48 -0400
X-MC-Unique: NxdOGA0HOQqwEUeemeIsTg-1
Received: by mail-qk1-f200.google.com with SMTP id
 af79cd13be357-74e0a11dce7so6878685a.1
 for <qemu-devel@nongnu.org>; Tue, 18 Apr 2023 12:26:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1681846008; x=1684438008;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=/85skPWIY0zVf2qWrvnKLQw98OfHM6i8+jnt+HWHn1k=;
 b=VuV8CpjJXxJxn8u2AEZkA9bC6mOrAYMmoP780Dhm9uMqHFgVcBbwxHMn05WG9T/zFj
 PqvZO+cYiW3Co83jQdVNx9vEO3eumQK8Tf7FKFRwmfZgedqzLXkd++3fOryPVJzFRETO
 81ZEZ00XcTBJC3sHIA4ywmIkiZGE9pyKzKgc4Hbc5PHEjx/7voXuky8pDfgAtdF1mEWh
 t1IkWtkOfxR/H7ZBy9s8b3ZVSxAG8d4rP4OZyoqW65loKREoQ2sT2/+MawqXuc8CPSCo
 E8MKSHPyBXduv4GvrB+8rQJgIFoPuee60d3Sc/IW1pGyOLWaMeELqF4OAUEabqVqVcGy
 oY2A==
X-Gm-Message-State: AAQBX9d9OzP1WQV+I4Xwz596Uq3CblxwOQAU1lB/lBQbMNysq6QxCuWK
 j7an8cZhN2WVoOOY1BZ7hDpfM0qWcYcF/koNLs4Hy36DPdOT/D10rSESrO3//Uy1eRJXtueoxaX
 fonFhntfDLq1l85s=
X-Received: by 2002:a05:6214:260d:b0:5ef:5456:7845 with SMTP id
 gu13-20020a056214260d00b005ef54567845mr22721032qvb.1.1681846008019; 
 Tue, 18 Apr 2023 12:26:48 -0700 (PDT)
X-Google-Smtp-Source: AKy350aEgAnn3ZpeD3KOekaEryqNTQkovL2XYLO+uXwomI9YCawzXmgZMh3tvkkzScV3nYR6GKSA9g==
X-Received: by 2002:a05:6214:260d:b0:5ef:5456:7845 with SMTP id
 gu13-20020a056214260d00b005ef54567845mr22721000qvb.1.1681846007598; 
 Tue, 18 Apr 2023 12:26:47 -0700 (PDT)
Received: from x1n (bras-base-aurron9127w-grc-40-70-52-229-124.dsl.bell.ca.
 [70.52.229.124]) by smtp.gmail.com with ESMTPSA id
 ei18-20020ad45a12000000b005eac706d223sm3906814qvb.124.2023.04.18.12.26.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 18 Apr 2023 12:26:46 -0700 (PDT)
Date: Tue, 18 Apr 2023 15:26:45 -0400
From: Peter Xu <peterx@redhat.com>
To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
Cc: Fabiano Rosas <farosas@suse.de>, qemu-devel@nongnu.org,
 Claudio Fontana <cfontana@suse.de>, jfehlig@suse.com,
 dfaggioli@suse.com, dgilbert@redhat.com,
 Juan Quintela <quintela@redhat.com>
Subject: Re: [RFC PATCH v1 00/26] migration: File based migration with
 multifd and fixed-ram
Message-ID: <ZD7u9YHTor4edGWw@x1n>
References: <20230330180336.2791-1-farosas@suse.de> <ZCYCE0llX9WANK18@x1n>
 <87edp5oukh.fsf@suse.de> <ZCbzmZXz3JG/jElA@x1n>
 <878rfdos4a.fsf@suse.de> <ZCcCV8PIsuvab1lO@x1n>
 <ZCcF6I0qb+1xlPhJ@redhat.com> <ZCcKBDM9sLomGOQE@x1n>
 <ZD7MRGQ+4QsDBtKR@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ZD7MRGQ+4QsDBtKR@redhat.com>
Received-SPF: pass client-ip=170.10.129.124; envelope-from=peterx@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

On Tue, Apr 18, 2023 at 05:58:44PM +0100, Daniel P. Berrangé wrote:
> On Fri, Mar 31, 2023 at 12:27:48PM -0400, Peter Xu wrote:
> > On Fri, Mar 31, 2023 at 05:10:16PM +0100, Daniel P. Berrangé wrote:
> > > On Fri, Mar 31, 2023 at 11:55:03AM -0400, Peter Xu wrote:
> > > > On Fri, Mar 31, 2023 at 12:30:45PM -0300, Fabiano Rosas wrote:
> > > > > Peter Xu <peterx@redhat.com> writes:
> > > > > 
> > > > > > On Fri, Mar 31, 2023 at 11:37:50AM -0300, Fabiano Rosas wrote:
> > > > > >> >> Outgoing migration to file. NVMe disk. XFS filesystem.
> > > > > >> >> 
> > > > > >> >> - Single migration runs of stopped 32G guest with ~90% RAM usage. Guest
> > > > > >> >>   running `stress-ng --vm 4 --vm-bytes 90% --vm-method all --verify -t
> > > > > >> >>   10m -v`:
> > > > > >> >> 
> > > > > >> >> migration type  | MB/s | pages/s |  ms
> > > > > >> >> ----------------+------+---------+------
> > > > > >> >> savevm io_uring |  434 |  102294 | 71473
> > > > > >> >
> > > > > >> > So I assume this is the non-live migration scenario.  Could you explain
> > > > > >> > what does io_uring mean here?
> > > > > >> >
> > > > > >> 
> > > > > >> This table is all non-live migration. This particular line is a snapshot
> > > > > >> (hmp_savevm->save_snapshot). I thought it could be relevant because it
> > > > > >> is another way by which we write RAM into disk.
> > > > > >
> > > > > > I see, so if all non-live that explains, because I was curious what's the
> > > > > > relationship between this feature and the live snapshot that QEMU also
> > > > > > supports.
> > > > > >
> > > > > > I also don't immediately see why savevm will be much slower, do you have an
> > > > > > answer?  Maybe it's somewhere but I just overlooked..
> > > > > >
> > > > > 
> > > > > I don't have a concrete answer. I could take a jab and maybe blame the
> > > > > extra memcpy for the buffer in QEMUFile? Or perhaps an unintended effect
> > > > > of bandwidth limits?
> > > > 
> > > > IMHO it would be great if this can be investigated and reasons provided in
> > > > the next cover letter.
> > > > 
> > > > > 
> > > > > > IIUC this is "vm suspend" case, so there's an extra benefit knowledge of
> > > > > > "we can stop the VM".  It smells slightly weird to build this on top of
> > > > > > "migrate" from that pov, rather than "savevm", though.  Any thoughts on
> > > > > > this aspect (on why not building this on top of "savevm")?
> > > > > >
> > > > > 
> > > > > I share the same perception. I have done initial experiments with
> > > > > savevm, but I decided to carry on the work that was already started by
> > > > > others because my understanding of the problem was yet incomplete.
> > > > > 
> > > > > One point that has been raised is that the fixed-ram format alone does
> > > > > not bring that many performance improvements. So we'll need
> > > > > multi-threading and direct-io on top of it. Re-using multifd
> > > > > infrastructure seems like it could be a good idea.
> > > > 
> > > > The thing is IMHO concurrency is not as hard if VM stopped, and when we're
> > > > 100% sure locally on where the page will go.
> > > 
> > > We shouldn't assume the VM is stopped though. When saving to the file
> > > the VM may still be active. The fixed-ram format lets us re-write the
> > > same memory location on disk multiple times in this case, thus avoiding
> > > growth of the file size.
> > 
> > Before discussing on reusing multifd below, now I have a major confusing on
> > the use case of the feature..
> > 
> > The question is whether we would like to stop the VM after fixed-ram
> > migration completes.  I'm asking because:
> > 
> >   1. If it will stop, then it looks like a "VM suspend" to me. If so, could
> >      anyone help explain why we don't stop the VM first then migrate?
> >      Because it avoids copying single pages multiple times, no fiddling
> >      with dirty tracking at all - we just don't ever track anything.  In
> >      short, we'll stop the VM anyway, then why not stop it slightly
> >      earlier?
> > 
> >   2. If it will not stop, then it's "VM live snapshot" to me.  We have
> >      that, aren't we?  That's more efficient because it'll wr-protect all
> >      guest pages, any write triggers a CoW and we only copy the guest pages
> >      once and for all.
> > 
> > Either way to go, there's no need to copy any page more than once.  Did I
> > miss anything perhaps very important?
> > 
> > I would guess it's option (1) above, because it seems we don't snapshot the
> > disk alongside.  But I am really not sure now..
> 
> It is both options above.
> 
> Libvirt has multiple APIs where it currently uses its migrate-to-file
> approach
> 
>   * virDomainManagedSave()
> 
>     This saves VM state to an libvirt managed file, stops the VM, and the
>     file state is auto-restored on next request to start the VM, and the
>     file deleted. The VM CPUs are stopped during both save + restore
>     phase
> 
>   * virDomainSave/virDomainRestore
> 
>     The former saves VM state to a file specified by the mgmt app/user.
>     A later call to virDomaniRestore starts the VM using that saved
>     state. The mgmt app / user can delete the file state, or re-use
>     it many times as they desire. The VM CPUs are stopped during both
>     save + restore phase
> 
>   * virDomainSnapshotXXX
> 
>     This family of APIs takes snapshots of the VM disks, optionally
>     also including the full VM state to a separate file. The snapshots
>     can later be restored. The VM CPUs remain running during the
>     save phase, but are stopped during restore phase

For this one IMHO it'll be good if Libvirt can consider leveraging the new
background-snapshot capability (QEMU 6.0+, so not very new..).  Or is there
perhaps any reason why a generic migrate:fd approach is better?

> 
> All these APIs end up calling the same code inside libvirt that uses
> the libvirt-iohelper, together with QEMU migrate:fd driver.
> 
> IIUC, Suse's original motivation for the performance improvements was
> wrt to the first case of virDomainManagedSave. From the POV of actually
> supporting this in libvirt though, we need to cover all the scenarios
> there. Thus we need this to work both when CPUs are running and stopped,
> and if we didn't use migrate in this case, then we basically just end
> up re-inventing migrate again which IMHO is undesirable both from
> libvirt's POV and QEMU's POV.

Just to make sure we're on the same page - I always think it fine to use
the QMP "migrate" command to do this.

Meanwhile, we can also reuse the migration framework if we think that's
still the good way to go (even if I am not 100% sure on this... I still
think _lots_ of the live migration framework as plenty of logics trying to
take care of a "live" VM, IOW, those logics will become pure overheads if
we reuse the live migration framework for vm suspend).

However could you help elaborate more on why it must support live mode for
a virDomainManagedSave() request?  As I assume this is the core of the goal.

IMHO virDomainManagedSave() is a good interface design, because it contains
the target goal of what it wants to do (according to above).  To ask in
another way, I'm curious whether virDomainManagedSave() will stop the VM
before triggering the QMP "migrate" to fd: If it doesn't, why not?  If it
does, then why we can't have that assumption also for QEMU?

That assumption is IMHO important for QEMU because non-live VM migration
can avoid tons of overhead that a live migration will need.  I've mentioned
this in the other reply, even if we keep using the migration framework, we
can still optimize other things like dirty tracking.  We probably don't
even need any bitmap at all because we simply scan over all ramblocks.

OTOH, if QEMU supports live mode for a "vm suspend" in the initial design,
not only it doesn't sound right at all from interface level, it means QEMU
will need to keep doing so forever because we need to be compatible with
the old interfaces even on new binaries.  That's why I keep suggesting we
should take "VM turned off" part of the cmd if that's what we're looking
for.

Thanks,

-- 
Peter Xu


