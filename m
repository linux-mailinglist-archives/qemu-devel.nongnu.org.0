Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 428906D2577
	for <lists+qemu-devel@lfdr.de>; Fri, 31 Mar 2023 18:28:23 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1piHbX-0007VZ-Pa; Fri, 31 Mar 2023 12:27:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1piHbW-0007V9-Eg
 for qemu-devel@nongnu.org; Fri, 31 Mar 2023 12:27:54 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1piHbU-0005V6-HC
 for qemu-devel@nongnu.org; Fri, 31 Mar 2023 12:27:54 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1680280072;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=cbg97NtzlljOfMredh/ATzo6syGR+cDNFDj4ok8toZ0=;
 b=cJpkfZQz0FW3B2rDyXTV0gnjB0GNNCn9JFbJHmT9nhOBYkCw0SmuwdJ9wfZbviOkbOa+TB
 2WByuN6gboqUifZe1zuo1MY1rayA9wWnYobteo/Jg4o2spjkKagN3d5EnjRMqSBgt1QjXK
 YE8IaUoqQBQ1KB5bxMlnCiXNAS02kDw=
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com
 [209.85.219.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-463-cWIpxOWcPMuGcB7OREPi-Q-1; Fri, 31 Mar 2023 12:27:50 -0400
X-MC-Unique: cWIpxOWcPMuGcB7OREPi-Q-1
Received: by mail-qv1-f69.google.com with SMTP id
 m3-20020a0cbf03000000b005de7233ca79so7763228qvi.3
 for <qemu-devel@nongnu.org>; Fri, 31 Mar 2023 09:27:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680280070; x=1682872070;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=cbg97NtzlljOfMredh/ATzo6syGR+cDNFDj4ok8toZ0=;
 b=z3RnLxjS3TNz0RZ+zJvbEesbGf85CHT8qegylyLYJWVmwyQTx3qIRoKRaszVOTZwZy
 4bHKiz8eq6Bv3eiInPXdTFFXh8z3pUGsp1jDJFIpI2iU7seHrG178yKW+avlmQA5qNaS
 Bp4KlJveUwAYU6dpxpbjkxlbeaXvm2q78qJcYOmHWBfRS1ySLWPlUknusYcn4UGXC5JE
 rHJagePM0akw7TTNfk/ZmqNNm2lZubCD7YfnNUuP+J6uwTekc9KeBbE0RHYZBJmRs4DH
 rtLUm08akHu0z6StRIfIcEpZEtfmYRIH6mpI485Dpko9x2bSdZq/HZhC0uhIapQ9RWmM
 hovw==
X-Gm-Message-State: AAQBX9ch/EOmGnmVAx3Dc8+9n0KY0ojjm4keT15bko+HDd1hgyEyUL0S
 kBfgFOL8MdK0IIpFhZJ4L+0KPRHJu2N2Rw89LuKddq79RN7qcyFffvjrj05HmWVeGKzEWgyQnHA
 IwbuLeQmgTthLEpg=
X-Received: by 2002:a05:6214:f67:b0:5e0:3825:9adb with SMTP id
 iy7-20020a0562140f6700b005e038259adbmr10217404qvb.2.1680280070060; 
 Fri, 31 Mar 2023 09:27:50 -0700 (PDT)
X-Google-Smtp-Source: AKy350Y4dMsANgiJ/Ega8fDGBe69mISCQcllQSVmhmbk3cIYp0zWEMn+M7XiYUX/Ps/4MXPwJwtlCA==
X-Received: by 2002:a05:6214:f67:b0:5e0:3825:9adb with SMTP id
 iy7-20020a0562140f6700b005e038259adbmr10217376qvb.2.1680280069785; 
 Fri, 31 Mar 2023 09:27:49 -0700 (PDT)
Received: from x1n (bras-base-aurron9127w-grc-40-70-52-229-124.dsl.bell.ca.
 [70.52.229.124]) by smtp.gmail.com with ESMTPSA id
 b10-20020a0cbf4a000000b005dd8b9345d6sm685349qvj.110.2023.03.31.09.27.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 31 Mar 2023 09:27:49 -0700 (PDT)
Date: Fri, 31 Mar 2023 12:27:48 -0400
From: Peter Xu <peterx@redhat.com>
To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
Cc: Fabiano Rosas <farosas@suse.de>, qemu-devel@nongnu.org,
 Claudio Fontana <cfontana@suse.de>, jfehlig@suse.com,
 dfaggioli@suse.com, dgilbert@redhat.com,
 Juan Quintela <quintela@redhat.com>
Subject: Re: [RFC PATCH v1 00/26] migration: File based migration with
 multifd and fixed-ram
Message-ID: <ZCcKBDM9sLomGOQE@x1n>
References: <20230330180336.2791-1-farosas@suse.de> <ZCYCE0llX9WANK18@x1n>
 <87edp5oukh.fsf@suse.de> <ZCbzmZXz3JG/jElA@x1n>
 <878rfdos4a.fsf@suse.de> <ZCcCV8PIsuvab1lO@x1n>
 <ZCcF6I0qb+1xlPhJ@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ZCcF6I0qb+1xlPhJ@redhat.com>
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

On Fri, Mar 31, 2023 at 05:10:16PM +0100, Daniel P. Berrangé wrote:
> On Fri, Mar 31, 2023 at 11:55:03AM -0400, Peter Xu wrote:
> > On Fri, Mar 31, 2023 at 12:30:45PM -0300, Fabiano Rosas wrote:
> > > Peter Xu <peterx@redhat.com> writes:
> > > 
> > > > On Fri, Mar 31, 2023 at 11:37:50AM -0300, Fabiano Rosas wrote:
> > > >> >> Outgoing migration to file. NVMe disk. XFS filesystem.
> > > >> >> 
> > > >> >> - Single migration runs of stopped 32G guest with ~90% RAM usage. Guest
> > > >> >>   running `stress-ng --vm 4 --vm-bytes 90% --vm-method all --verify -t
> > > >> >>   10m -v`:
> > > >> >> 
> > > >> >> migration type  | MB/s | pages/s |  ms
> > > >> >> ----------------+------+---------+------
> > > >> >> savevm io_uring |  434 |  102294 | 71473
> > > >> >
> > > >> > So I assume this is the non-live migration scenario.  Could you explain
> > > >> > what does io_uring mean here?
> > > >> >
> > > >> 
> > > >> This table is all non-live migration. This particular line is a snapshot
> > > >> (hmp_savevm->save_snapshot). I thought it could be relevant because it
> > > >> is another way by which we write RAM into disk.
> > > >
> > > > I see, so if all non-live that explains, because I was curious what's the
> > > > relationship between this feature and the live snapshot that QEMU also
> > > > supports.
> > > >
> > > > I also don't immediately see why savevm will be much slower, do you have an
> > > > answer?  Maybe it's somewhere but I just overlooked..
> > > >
> > > 
> > > I don't have a concrete answer. I could take a jab and maybe blame the
> > > extra memcpy for the buffer in QEMUFile? Or perhaps an unintended effect
> > > of bandwidth limits?
> > 
> > IMHO it would be great if this can be investigated and reasons provided in
> > the next cover letter.
> > 
> > > 
> > > > IIUC this is "vm suspend" case, so there's an extra benefit knowledge of
> > > > "we can stop the VM".  It smells slightly weird to build this on top of
> > > > "migrate" from that pov, rather than "savevm", though.  Any thoughts on
> > > > this aspect (on why not building this on top of "savevm")?
> > > >
> > > 
> > > I share the same perception. I have done initial experiments with
> > > savevm, but I decided to carry on the work that was already started by
> > > others because my understanding of the problem was yet incomplete.
> > > 
> > > One point that has been raised is that the fixed-ram format alone does
> > > not bring that many performance improvements. So we'll need
> > > multi-threading and direct-io on top of it. Re-using multifd
> > > infrastructure seems like it could be a good idea.
> > 
> > The thing is IMHO concurrency is not as hard if VM stopped, and when we're
> > 100% sure locally on where the page will go.
> 
> We shouldn't assume the VM is stopped though. When saving to the file
> the VM may still be active. The fixed-ram format lets us re-write the
> same memory location on disk multiple times in this case, thus avoiding
> growth of the file size.

Before discussing on reusing multifd below, now I have a major confusing on
the use case of the feature..

The question is whether we would like to stop the VM after fixed-ram
migration completes.  I'm asking because:

  1. If it will stop, then it looks like a "VM suspend" to me. If so, could
     anyone help explain why we don't stop the VM first then migrate?
     Because it avoids copying single pages multiple times, no fiddling
     with dirty tracking at all - we just don't ever track anything.  In
     short, we'll stop the VM anyway, then why not stop it slightly
     earlier?

  2. If it will not stop, then it's "VM live snapshot" to me.  We have
     that, aren't we?  That's more efficient because it'll wr-protect all
     guest pages, any write triggers a CoW and we only copy the guest pages
     once and for all.

Either way to go, there's no need to copy any page more than once.  Did I
miss anything perhaps very important?

I would guess it's option (1) above, because it seems we don't snapshot the
disk alongside.  But I am really not sure now..

> 
> > IOW, I think multifd provides a lot of features that may not really be
> > useful for this effort, meanwhile using those features may need to already
> > pay for the overhead to support those features.
> > 
> > For example, a major benefit of multifd is it allows pages sent out of
> > order, so it indexes the page as a header.  I didn't read the follow up
> > patches, but I assume that's not needed in this effort.
> > 
> > What I understand so far with fixes-ram is we dump the whole ramblock
> > memory into a chunk at offset of a file.  Can concurrency of that
> > achievable easily by creating a bunch of threads dumping altogether during
> > the savevm, with different offsets of guest ram & file passed over?
> 
> I feel like the migration code is already insanely complicated and
> the many threads involved have caused no end of subtle bugs. 
> 
> It was Juan I believe who expressed a desire to entirely remove
> non-multifd code in the future, in order to reduce the maint burden.
> IOW, ideally we would be pushing mgmt apps towards always using
> multifd at all times, even if they only ask it to create 1 single
> thread.
> 
> That would in turn suggest against creating new concurrency
> mechanisms on top of non-multifd code, both to avoid adding yet
> more complexity and also because it would make it harder to later
> delete the non-multifd code.
> 
> On the libvirt side wrt fixed-ram, we could just use multifd
> exclusively, as there should be no downside to it even for a
> single FD.
> 
> With regards,
> Daniel
> -- 
> |: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
> |: https://libvirt.org         -o-            https://fstop138.berrange.com :|
> |: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|
> 

Thanks,

-- 
Peter Xu


