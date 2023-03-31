Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E46A66D24C7
	for <lists+qemu-devel@lfdr.de>; Fri, 31 Mar 2023 18:11:57 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1piHKk-0000Mk-8N; Fri, 31 Mar 2023 12:10:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1piHKh-0000MZ-A8
 for qemu-devel@nongnu.org; Fri, 31 Mar 2023 12:10:31 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1piHKf-00015v-5p
 for qemu-devel@nongnu.org; Fri, 31 Mar 2023 12:10:31 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1680279028;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=M0ekIqf3ffMBacN1WlWol8GEJII/3FXedWbtGZbqW5U=;
 b=OAQcFqtIFiO5iCsMPGMCow+PM+ysnGM8aB17k3HtRmSy0zphyf98tm5wCw0YRLLc3HzLNS
 sRzl7GZFm8dhbta7/jbAbMydSNThF6xrWsGGPNEmeNB+LYB5YzLnKWwDSgUPjM7z4swGTR
 rcLGSq3ZXCqnFBfW7Ao5oP+VPS+PK28=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-652-OoE5hcUYPOafHzdK7JhP4w-1; Fri, 31 Mar 2023 12:10:24 -0400
X-MC-Unique: OoE5hcUYPOafHzdK7JhP4w-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
 [10.11.54.6])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 75C978030DA;
 Fri, 31 Mar 2023 16:10:20 +0000 (UTC)
Received: from redhat.com (unknown [10.33.36.67])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 0BAED2166B33;
 Fri, 31 Mar 2023 16:10:18 +0000 (UTC)
Date: Fri, 31 Mar 2023 17:10:16 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Peter Xu <peterx@redhat.com>
Cc: Fabiano Rosas <farosas@suse.de>, qemu-devel@nongnu.org,
 Claudio Fontana <cfontana@suse.de>, jfehlig@suse.com,
 dfaggioli@suse.com, dgilbert@redhat.com,
 Juan Quintela <quintela@redhat.com>
Subject: Re: [RFC PATCH v1 00/26] migration: File based migration with
 multifd and fixed-ram
Message-ID: <ZCcF6I0qb+1xlPhJ@redhat.com>
References: <20230330180336.2791-1-farosas@suse.de> <ZCYCE0llX9WANK18@x1n>
 <87edp5oukh.fsf@suse.de> <ZCbzmZXz3JG/jElA@x1n>
 <878rfdos4a.fsf@suse.de> <ZCcCV8PIsuvab1lO@x1n>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <ZCcCV8PIsuvab1lO@x1n>
User-Agent: Mutt/2.2.9 (2022-11-12)
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.6
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

On Fri, Mar 31, 2023 at 11:55:03AM -0400, Peter Xu wrote:
> On Fri, Mar 31, 2023 at 12:30:45PM -0300, Fabiano Rosas wrote:
> > Peter Xu <peterx@redhat.com> writes:
> > 
> > > On Fri, Mar 31, 2023 at 11:37:50AM -0300, Fabiano Rosas wrote:
> > >> >> Outgoing migration to file. NVMe disk. XFS filesystem.
> > >> >> 
> > >> >> - Single migration runs of stopped 32G guest with ~90% RAM usage. Guest
> > >> >>   running `stress-ng --vm 4 --vm-bytes 90% --vm-method all --verify -t
> > >> >>   10m -v`:
> > >> >> 
> > >> >> migration type  | MB/s | pages/s |  ms
> > >> >> ----------------+------+---------+------
> > >> >> savevm io_uring |  434 |  102294 | 71473
> > >> >
> > >> > So I assume this is the non-live migration scenario.  Could you explain
> > >> > what does io_uring mean here?
> > >> >
> > >> 
> > >> This table is all non-live migration. This particular line is a snapshot
> > >> (hmp_savevm->save_snapshot). I thought it could be relevant because it
> > >> is another way by which we write RAM into disk.
> > >
> > > I see, so if all non-live that explains, because I was curious what's the
> > > relationship between this feature and the live snapshot that QEMU also
> > > supports.
> > >
> > > I also don't immediately see why savevm will be much slower, do you have an
> > > answer?  Maybe it's somewhere but I just overlooked..
> > >
> > 
> > I don't have a concrete answer. I could take a jab and maybe blame the
> > extra memcpy for the buffer in QEMUFile? Or perhaps an unintended effect
> > of bandwidth limits?
> 
> IMHO it would be great if this can be investigated and reasons provided in
> the next cover letter.
> 
> > 
> > > IIUC this is "vm suspend" case, so there's an extra benefit knowledge of
> > > "we can stop the VM".  It smells slightly weird to build this on top of
> > > "migrate" from that pov, rather than "savevm", though.  Any thoughts on
> > > this aspect (on why not building this on top of "savevm")?
> > >
> > 
> > I share the same perception. I have done initial experiments with
> > savevm, but I decided to carry on the work that was already started by
> > others because my understanding of the problem was yet incomplete.
> > 
> > One point that has been raised is that the fixed-ram format alone does
> > not bring that many performance improvements. So we'll need
> > multi-threading and direct-io on top of it. Re-using multifd
> > infrastructure seems like it could be a good idea.
> 
> The thing is IMHO concurrency is not as hard if VM stopped, and when we're
> 100% sure locally on where the page will go.

We shouldn't assume the VM is stopped though. When saving to the file
the VM may still be active. The fixed-ram format lets us re-write the
same memory location on disk multiple times in this case, thus avoiding
growth of the file size.

> IOW, I think multifd provides a lot of features that may not really be
> useful for this effort, meanwhile using those features may need to already
> pay for the overhead to support those features.
> 
> For example, a major benefit of multifd is it allows pages sent out of
> order, so it indexes the page as a header.  I didn't read the follow up
> patches, but I assume that's not needed in this effort.
> 
> What I understand so far with fixes-ram is we dump the whole ramblock
> memory into a chunk at offset of a file.  Can concurrency of that
> achievable easily by creating a bunch of threads dumping altogether during
> the savevm, with different offsets of guest ram & file passed over?

I feel like the migration code is already insanely complicated and
the many threads involved have caused no end of subtle bugs. 

It was Juan I believe who expressed a desire to entirely remove
non-multifd code in the future, in order to reduce the maint burden.
IOW, ideally we would be pushing mgmt apps towards always using
multifd at all times, even if they only ask it to create 1 single
thread.

That would in turn suggest against creating new concurrency
mechanisms on top of non-multifd code, both to avoid adding yet
more complexity and also because it would make it harder to later
delete the non-multifd code.

On the libvirt side wrt fixed-ram, we could just use multifd
exclusively, as there should be no downside to it even for a
single FD.

With regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


