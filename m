Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 197046E81B2
	for <lists+qemu-devel@lfdr.de>; Wed, 19 Apr 2023 21:08:43 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ppD9M-0002hx-Qp; Wed, 19 Apr 2023 15:07:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1ppD9K-0002hl-Ma
 for qemu-devel@nongnu.org; Wed, 19 Apr 2023 15:07:26 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1ppD9I-0007M4-TD
 for qemu-devel@nongnu.org; Wed, 19 Apr 2023 15:07:26 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1681931243;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=oG8x0zHfnZ3On7PfG3KG5zHhWEUzzkaJwBkhmcsMMtA=;
 b=UQqCMnDZBFb6f8/JdJyIpZTLE7cRKaeFWa/+083t0wCS3lUy7CWbTXTzY0sJN7vTsRwpVc
 ZEIrgs3KPvgwmolfcorNHugY/vBhTip3jIrcdd/SdFpB8CarYkjHOnRTZsaI1UxJX+MdOK
 iE5NKnGNawZ3qmnWcM+JSrpKz0jXbwc=
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com
 [209.85.219.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-153-W-FsYGEoNeOQWh69-YE3UA-1; Wed, 19 Apr 2023 15:07:22 -0400
X-MC-Unique: W-FsYGEoNeOQWh69-YE3UA-1
Received: by mail-qv1-f69.google.com with SMTP id
 6a1803df08f44-5ef5b8a60d7so231416d6.1
 for <qemu-devel@nongnu.org>; Wed, 19 Apr 2023 12:07:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1681931242; x=1684523242;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=oG8x0zHfnZ3On7PfG3KG5zHhWEUzzkaJwBkhmcsMMtA=;
 b=GC8t96U/tjp5z3XXH2RuWAgeYbVHRMdKJeeQmo4sY5n/lXSj22o+G4n80ZqBCSjwTu
 +NS5O91BZRPGSnZnfjq8aG5BVG3PuhMpDi5HuQwKBD3Gm0xWHcG1i64BhfLBM3FvflTn
 Gz+qq71w/zACxegmeyXk8rGyYB1zgzVBVOvd3R1qjIgi33hBmsLaWcfgIFzoZf3u/oBe
 xN3ByA9CMmtjnMdI2tkw7isRnqWhHqVbAAMiV2HGUh93Bx9hsGC2/uyzvdpoKM2cDPqP
 9fas6ZzKbUFthUoa5PMEskzF1XV/Gv8PWBjBNmse0Yp/Dk6NKzEWLCx6rNUiQI27vUEG
 kkcQ==
X-Gm-Message-State: AAQBX9cDO7x1C/pfA6ZrfL2SsolR8Sw+hp+JtV0tw5+EJCJtfi6X1U0c
 uW9OvjLVAMNEqw7KKz/jQUYXd6y2GFRcZ12aVClTKao/XibOen0UVrm4BhJ8ntSd8oF3T2ZE/r+
 kXWtAqoznNEDsX0c=
X-Received: by 2002:a05:6214:3011:b0:5ef:5132:7ad7 with SMTP id
 ke17-20020a056214301100b005ef51327ad7mr30044705qvb.2.1681931241827; 
 Wed, 19 Apr 2023 12:07:21 -0700 (PDT)
X-Google-Smtp-Source: AKy350ZYw11eUZ/nrxmXjNp9V1qiZxN0ujFB3BkovNr6m/Rv4nbj4J71UuLcALKrHTj+K9GQPaMhYA==
X-Received: by 2002:a05:6214:3011:b0:5ef:5132:7ad7 with SMTP id
 ke17-20020a056214301100b005ef51327ad7mr30044672qvb.2.1681931241503; 
 Wed, 19 Apr 2023 12:07:21 -0700 (PDT)
Received: from x1n (bras-base-aurron9127w-grc-40-70-52-229-124.dsl.bell.ca.
 [70.52.229.124]) by smtp.gmail.com with ESMTPSA id
 i3-20020ad45383000000b005e3c45c5cbdsm3488616qvv.96.2023.04.19.12.07.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 19 Apr 2023 12:07:20 -0700 (PDT)
Date: Wed, 19 Apr 2023 15:07:19 -0400
From: Peter Xu <peterx@redhat.com>
To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
Cc: Fabiano Rosas <farosas@suse.de>, qemu-devel@nongnu.org,
 Claudio Fontana <cfontana@suse.de>, jfehlig@suse.com,
 dfaggioli@suse.com, dgilbert@redhat.com,
 Juan Quintela <quintela@redhat.com>
Subject: Re: [RFC PATCH v1 00/26] migration: File based migration with
 multifd and fixed-ram
Message-ID: <ZEA759BSs75ldW6Y@x1n>
References: <ZCYCE0llX9WANK18@x1n> <87edp5oukh.fsf@suse.de>
 <ZCbzmZXz3JG/jElA@x1n> <878rfdos4a.fsf@suse.de>
 <ZCcCV8PIsuvab1lO@x1n> <ZCcF6I0qb+1xlPhJ@redhat.com>
 <ZCcKBDM9sLomGOQE@x1n> <ZD7MRGQ+4QsDBtKR@redhat.com>
 <ZD7u9YHTor4edGWw@x1n> <ZEAg5QJS44jzAV/v@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ZEAg5QJS44jzAV/v@redhat.com>
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

On Wed, Apr 19, 2023 at 06:12:05PM +0100, Daniel P. Berrangé wrote:
> On Tue, Apr 18, 2023 at 03:26:45PM -0400, Peter Xu wrote:
> > On Tue, Apr 18, 2023 at 05:58:44PM +0100, Daniel P. Berrangé wrote:
> > > Libvirt has multiple APIs where it currently uses its migrate-to-file
> > > approach
> > > 
> > >   * virDomainManagedSave()
> > > 
> > >     This saves VM state to an libvirt managed file, stops the VM, and the
> > >     file state is auto-restored on next request to start the VM, and the
> > >     file deleted. The VM CPUs are stopped during both save + restore
> > >     phase
> > > 
> > >   * virDomainSave/virDomainRestore
> > > 
> > >     The former saves VM state to a file specified by the mgmt app/user.
> > >     A later call to virDomaniRestore starts the VM using that saved
> > >     state. The mgmt app / user can delete the file state, or re-use
> > >     it many times as they desire. The VM CPUs are stopped during both
> > >     save + restore phase
> > > 
> > >   * virDomainSnapshotXXX
> > > 
> > >     This family of APIs takes snapshots of the VM disks, optionally
> > >     also including the full VM state to a separate file. The snapshots
> > >     can later be restored. The VM CPUs remain running during the
> > >     save phase, but are stopped during restore phase
> > 
> > For this one IMHO it'll be good if Libvirt can consider leveraging the new
> > background-snapshot capability (QEMU 6.0+, so not very new..).  Or is there
> > perhaps any reason why a generic migrate:fd approach is better?
> 
> I'm not sure I fully understand the implications of 'background-snapshot' ?
> 
> Based on what the QAPI comment says, it sounds potentially interesting,
> as conceptually it would be nicer to have the memory / state snapshot
> represent the VM at the point where we started the snapshot operation,
> rather than where we finished the snapshot operation.
> 
> It would not solve the performance problems that the work in this thread
> was intended to address though.  With large VMs (100's of GB of RAM),
> saving all the RAM state to disk takes a very long time, regardless of
> whether the VM vCPUs are paused or running.

I think it solves the performance problem by only copy each of the guest
page once, even if the guest is running.

Different from mostly all the rest of "migrate" use cases, background
snapshot does not use the generic dirty tracking at all (for KVM that's
get-dirty-log), instead it uses userfaultfd wr-protects, so that when
taking the snapshot all the guest pages will be protected once.

Then when each page is written, the guest cannot proceed before copying the
snapshot page over first.  After one guest page is unprotected, any write
to it will be with full speed because the follow up writes won't matter for
a snapshot.

It guarantees the best efficiency of creating a snapshot with VM running,
afaict.  I sincerely think Libvirt should have someone investigating and
see whether virDomainSnapshotXXX() can be implemented by this cap rather
than the default migration.

I actually thought the Libvirt support was there. I think it must be that
someone posted support for Libvirt but it didn't really land for some
reason.

> 
> Currently when doing this libvirt has a "libvirt_iohelper" process
> that we use so that we can do writes with O_DIRECT set. This avoids
> thrashing the host OS's  I/O buffers/cache, and thus negatively
> impacting performance of anything else on the host doing I/O. This
> can't take advantage of multifd though, and even if extended todo
> so, it still imposes extra data copies during the save/restore paths.
> 
> So to speed up the above 3 libvirt APIs, we want QEMU to be able to
> directly save/restore mem/vmstate to files, with parallization and
> O_DIRECT.

Here IIUC above question can be really important on whether existing
virDomainSnapshotXXX() can (and should) use "background-snapshot" to
implement, because that's the only one that will need to support migration
live (out of 3 use cases).

If virDomainSnapshotXXX() can be implemented differently, I think it'll be
much easier to have both virDomainManagedSave() and virDomainSave() trigger
a migration command that will stop the VM first by whatever way.

It's probably fine if we still want to have CAP_FIXED_RAM as a new
capability describing the file property (so that libvirt will know iohelper
is not needed anymore), it can support live migrating even if it shouldn't
really use it.  But then we could probably have another CAP_SUSPEND which
gives QEMU a hint so QEMU can be smart on this non-live migration.

It's just that AFAIU CAP_FIXED_RAM should just always be set with
CAP_SUSPEND, because it must be a SUSPEND to fixed ram or one should just
use virDomainSnapshotXXX() (or say, live snapshot).

Thanks,

-- 
Peter Xu


