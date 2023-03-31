Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A9CF6D2A69
	for <lists+qemu-devel@lfdr.de>; Fri, 31 Mar 2023 23:54:04 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1piMfx-0007QL-Aa; Fri, 31 Mar 2023 17:52:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1piMfv-0007Q2-Ga
 for qemu-devel@nongnu.org; Fri, 31 Mar 2023 17:52:47 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1piMft-0002Ur-E3
 for qemu-devel@nongnu.org; Fri, 31 Mar 2023 17:52:47 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1680299563;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=wA9OnK3PIk3HDGoIswFZYfDYcbHahcwYzr8c5EPTcJQ=;
 b=Et8eoijU58wJ+mIZtEc8SqDBTmmwLpmLABnJO3qKsCczWuZuuf1pf4jdndR8Qslc9Kmpz9
 Lz9Qkk9W9aHO1W3jKfXhEO6Uf/j2t5buX0LM+XOc9kolRB7LKkUZ+LqCqAAQQM8ygEoQPJ
 s0XOHsmf4goTJD2HY7Fnvqg7QVZJwjg=
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com
 [209.85.219.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-501-d__bC6q6OeSXfN6RtzOK_Q-1; Fri, 31 Mar 2023 17:52:42 -0400
X-MC-Unique: d__bC6q6OeSXfN6RtzOK_Q-1
Received: by mail-qv1-f72.google.com with SMTP id
 6a1803df08f44-57c67ea348eso14929256d6.1
 for <qemu-devel@nongnu.org>; Fri, 31 Mar 2023 14:52:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680299562;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=wA9OnK3PIk3HDGoIswFZYfDYcbHahcwYzr8c5EPTcJQ=;
 b=l7J5BTPuekA7RH27rRGbcZ3AUc0iNqADSL5PDTEUO6yjGclCyG/eqajYAwZ4Utk+iq
 jpFupK7gALSxez061SA47ZKlficRtjpgTQoLfqdo0o4Mr3VA6PvtWFkEu6kaFrZmYd/u
 M/C5aI5yX5T9SLFK4FV1ODbK8Y2dhOfEAhIJiTOzy3wURENUGBAZCD+1FciBUPEnBRwD
 uU9gtY92nr1adSTwSCE3y+dtpWrn/XipAbv59r7B13/zuTz3bFtS54eBYuGcfZiNd6HV
 fUnOuRKpcU6W8+UdxnwG77RSiF3wdAR4mhBG3Ltik6i0XX60TbTNmMlLfURBvmnXtZO7
 QITw==
X-Gm-Message-State: AAQBX9faxnX1aZDOtpscrsgVlMjXdR25Ym177vTpyjSqL5SsbPBMXuEO
 1QlaXmujlCyJgQTm64XchilqKEA2gdhdhjGt+NS1696hKFfrKdo5Yyg9d624hOUu4UL2l6myqUB
 L9PSW15pAjoG6SgE=
X-Received: by 2002:a05:6214:2608:b0:5a9:ab44:5fdf with SMTP id
 gu8-20020a056214260800b005a9ab445fdfmr11097041qvb.0.1680299562023; 
 Fri, 31 Mar 2023 14:52:42 -0700 (PDT)
X-Google-Smtp-Source: AKy350ZQXOl68fqezsZHUsgS/cfUc/3I+maGNhS0vLBJnYG6fQSY3e57to01gfglRwpzBHJ4/EwIDw==
X-Received: by 2002:a05:6214:2608:b0:5a9:ab44:5fdf with SMTP id
 gu8-20020a056214260800b005a9ab445fdfmr11097018qvb.0.1680299561617; 
 Fri, 31 Mar 2023 14:52:41 -0700 (PDT)
Received: from x1n (bras-base-aurron9127w-grc-40-70-52-229-124.dsl.bell.ca.
 [70.52.229.124]) by smtp.gmail.com with ESMTPSA id
 l10-20020a0ce6ca000000b005dd8b9345b9sm884696qvn.81.2023.03.31.14.52.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 31 Mar 2023 14:52:40 -0700 (PDT)
Date: Fri, 31 Mar 2023 17:52:39 -0400
From: Peter Xu <peterx@redhat.com>
To: Fabiano Rosas <farosas@suse.de>
Cc: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>,
 qemu-devel@nongnu.org, Claudio Fontana <cfontana@suse.de>,
 jfehlig@suse.com, dfaggioli@suse.com, dgilbert@redhat.com,
 Juan Quintela <quintela@redhat.com>
Subject: Re: [RFC PATCH v1 00/26] migration: File based migration with
 multifd and fixed-ram
Message-ID: <ZCdWJ59rqY6oScvg@x1n>
References: <20230330180336.2791-1-farosas@suse.de> <ZCYCE0llX9WANK18@x1n>
 <87edp5oukh.fsf@suse.de> <ZCbzmZXz3JG/jElA@x1n>
 <878rfdos4a.fsf@suse.de> <ZCcCV8PIsuvab1lO@x1n>
 <ZCcF6I0qb+1xlPhJ@redhat.com> <ZCcKBDM9sLomGOQE@x1n>
 <875yagpywy.fsf@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <875yagpywy.fsf@suse.de>
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

On Fri, Mar 31, 2023 at 03:18:37PM -0300, Fabiano Rosas wrote:
> Peter Xu <peterx@redhat.com> writes:
> 
> > On Fri, Mar 31, 2023 at 05:10:16PM +0100, Daniel P. Berrangé wrote:
> >> On Fri, Mar 31, 2023 at 11:55:03AM -0400, Peter Xu wrote:
> >> > On Fri, Mar 31, 2023 at 12:30:45PM -0300, Fabiano Rosas wrote:
> >> > > Peter Xu <peterx@redhat.com> writes:
> >> > > 
> >> > > > On Fri, Mar 31, 2023 at 11:37:50AM -0300, Fabiano Rosas wrote:
> >> > > >> >> Outgoing migration to file. NVMe disk. XFS filesystem.
> >> > > >> >> 
> >> > > >> >> - Single migration runs of stopped 32G guest with ~90% RAM usage. Guest
> >> > > >> >>   running `stress-ng --vm 4 --vm-bytes 90% --vm-method all --verify -t
> >> > > >> >>   10m -v`:
> >> > > >> >> 
> >> > > >> >> migration type  | MB/s | pages/s |  ms
> >> > > >> >> ----------------+------+---------+------
> >> > > >> >> savevm io_uring |  434 |  102294 | 71473
> >> > > >> >
> >> > > >> > So I assume this is the non-live migration scenario.  Could you explain
> >> > > >> > what does io_uring mean here?
> >> > > >> >
> >> > > >> 
> >> > > >> This table is all non-live migration. This particular line is a snapshot
> >> > > >> (hmp_savevm->save_snapshot). I thought it could be relevant because it
> >> > > >> is another way by which we write RAM into disk.
> >> > > >
> >> > > > I see, so if all non-live that explains, because I was curious what's the
> >> > > > relationship between this feature and the live snapshot that QEMU also
> >> > > > supports.
> >> > > >
> >> > > > I also don't immediately see why savevm will be much slower, do you have an
> >> > > > answer?  Maybe it's somewhere but I just overlooked..
> >> > > >
> >> > > 
> >> > > I don't have a concrete answer. I could take a jab and maybe blame the
> >> > > extra memcpy for the buffer in QEMUFile? Or perhaps an unintended effect
> >> > > of bandwidth limits?
> >> > 
> >> > IMHO it would be great if this can be investigated and reasons provided in
> >> > the next cover letter.
> >> > 
> >> > > 
> >> > > > IIUC this is "vm suspend" case, so there's an extra benefit knowledge of
> >> > > > "we can stop the VM".  It smells slightly weird to build this on top of
> >> > > > "migrate" from that pov, rather than "savevm", though.  Any thoughts on
> >> > > > this aspect (on why not building this on top of "savevm")?
> >> > > >
> >> > > 
> >> > > I share the same perception. I have done initial experiments with
> >> > > savevm, but I decided to carry on the work that was already started by
> >> > > others because my understanding of the problem was yet incomplete.
> >> > > 
> >> > > One point that has been raised is that the fixed-ram format alone does
> >> > > not bring that many performance improvements. So we'll need
> >> > > multi-threading and direct-io on top of it. Re-using multifd
> >> > > infrastructure seems like it could be a good idea.
> >> > 
> >> > The thing is IMHO concurrency is not as hard if VM stopped, and when we're
> >> > 100% sure locally on where the page will go.
> >> 
> >> We shouldn't assume the VM is stopped though. When saving to the file
> >> the VM may still be active. The fixed-ram format lets us re-write the
> >> same memory location on disk multiple times in this case, thus avoiding
> >> growth of the file size.
> >
> > Before discussing on reusing multifd below, now I have a major confusing on
> > the use case of the feature..
> >
> > The question is whether we would like to stop the VM after fixed-ram
> > migration completes.  I'm asking because:
> >
> 
> We would.
> 
> >   1. If it will stop, then it looks like a "VM suspend" to me. If so, could
> >      anyone help explain why we don't stop the VM first then migrate?
> >      Because it avoids copying single pages multiple times, no fiddling
> >      with dirty tracking at all - we just don't ever track anything.  In
> >      short, we'll stop the VM anyway, then why not stop it slightly
> >      earlier?
> >
> 
> Looking at the previous discussions I don't see explicit mentions of a
> requirement either way (stop before or stop after). I agree it makes
> more sense to stop the guest first and then migrate without having to
> deal with dirty pages.
> 
> I presume libvirt just migrates without altering the guest run state so
> we implemented this to work in both scenarios. But even then, it seems
> QEMU could store the current VM state, stop it, migrate and restore the
> state on the destination.

Yes, I can understand having a unified interface for libvirt would be great
in this case.  So I am personally not against reusing qmp command "migrate"
if that would help in any case from libvirt pov.

However this is an important question to be answered very sure before
building more things on top.  IOW, even if reusing QMP migrate, we could
consider a totally different impl (e.g. don't reuse migration thread model).

As I mentioned above it seems just ideal we always stop the VM so it could
be part of the command (unlike normal QMP migrate), then it's getting more
like save_snapshot() as there's the vm_stop().  We should make sure when
the user uses the new cmd it'll always do that because that's the most
performant (comparing to enabling dirty tracking and live migrate).

> 
> I might be missing context here since I wasn't around when this work
> started. Someone correct me if I'm wrong please.

Yes, it would be great if someone can help clarify.

Thanks,

> 
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
> >
> 

-- 
Peter Xu


