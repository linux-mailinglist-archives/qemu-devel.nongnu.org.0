Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BA3466EAC1F
	for <lists+qemu-devel@lfdr.de>; Fri, 21 Apr 2023 15:57:13 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pprFp-0006S2-Gx; Fri, 21 Apr 2023 09:56:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1pprFm-0006Re-0K
 for qemu-devel@nongnu.org; Fri, 21 Apr 2023 09:56:46 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1pprFi-0001Cp-4t
 for qemu-devel@nongnu.org; Fri, 21 Apr 2023 09:56:45 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1682085401;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=SHu+MAdnkjKfarJhF4jeY2MKpjIHFuxgxvo8O56sRdA=;
 b=ishccXlbSrUG4S+zrHD3VZHmPqWeRNkLFh1jeur4+MSwtLC5HYIU23G9XtNbbhwME3BeTk
 UF7DSE4ScOfwpde4U7OBjfIBAwYl6FC+7OdkC8ZwgAUVEJ0vSQIAAtvmxq0WyUXeSQiKOU
 +kQTfjid8LoJRGnLdWAsiOe7SLvpjSo=
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com
 [209.85.160.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-294-TXwdmKigN2WTtEvcsGujUw-1; Fri, 21 Apr 2023 09:56:39 -0400
X-MC-Unique: TXwdmKigN2WTtEvcsGujUw-1
Received: by mail-qt1-f198.google.com with SMTP id
 d75a77b69052e-3ef32210cabso4140441cf.0
 for <qemu-devel@nongnu.org>; Fri, 21 Apr 2023 06:56:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682085399; x=1684677399;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=SHu+MAdnkjKfarJhF4jeY2MKpjIHFuxgxvo8O56sRdA=;
 b=LXsfpNb+v3QE17GfJFf/s6uxzF0Xoi2jL1OuyVJKu7XnG982t4fed0Gfk/F0WYt0hw
 Q87zB0CfPl8N88P9jQx+0ymO4WBP0oMu5bqxM94XTsLO1oYOcgKsdX70/Jee7Qod/nDl
 6jYZ8OpVfGTI+t7OSz3IZWO7GzByquD98jY8uVWGhKd/SCkimoaee1ObizwSqsbHnvjL
 JUWfB2a2a4LIcOLMLxSeDzCIFoAX3tYzWSnwfFSJEGNzgvhzYIqayGXQy5EidhOyrIDD
 /mjWSDWEOCKGh/qT1hvkUDkfzKHoCHxrrPjZENEuMXGv1L/aHEkCd3KpRceaAq7KuM73
 v3YA==
X-Gm-Message-State: AAQBX9cYCb2BfvC3aKY2+QZB62bRc78mLlr5hppdVrT3hIsgFthxBF0I
 3Gbm2A146HvnG6jFuj93R/wRUkCDpZL0ak8BKnqcYxpkrJGVMVfqf1upt0ELl27/dzBG+UpnejU
 VO9WOyWYeh5wCk64=
X-Received: by 2002:ac8:5c56:0:b0:3e6:8da4:427 with SMTP id
 j22-20020ac85c56000000b003e68da40427mr9392011qtj.6.1682085399134; 
 Fri, 21 Apr 2023 06:56:39 -0700 (PDT)
X-Google-Smtp-Source: AKy350ZShw67wlpCG206nq5Hq/6fWpy712JvHkfXdocbkn2hG3jxZUVdn1KBi3ooqog8x8tgWo8Imw==
X-Received: by 2002:ac8:5c56:0:b0:3e6:8da4:427 with SMTP id
 j22-20020ac85c56000000b003e68da40427mr9391976qtj.6.1682085398764; 
 Fri, 21 Apr 2023 06:56:38 -0700 (PDT)
Received: from x1n (bras-base-aurron9127w-grc-40-70-52-229-124.dsl.bell.ca.
 [70.52.229.124]) by smtp.gmail.com with ESMTPSA id
 b142-20020ae9eb94000000b0074cd846d215sm1347945qkg.64.2023.04.21.06.56.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 21 Apr 2023 06:56:38 -0700 (PDT)
Date: Fri, 21 Apr 2023 09:56:36 -0400
From: Peter Xu <peterx@redhat.com>
To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
Cc: Fabiano Rosas <farosas@suse.de>, qemu-devel@nongnu.org,
 Claudio Fontana <cfontana@suse.de>, jfehlig@suse.com,
 dfaggioli@suse.com, dgilbert@redhat.com,
 Juan Quintela <quintela@redhat.com>
Subject: Re: [RFC PATCH v1 00/26] migration: File based migration with
 multifd and fixed-ram
Message-ID: <ZEKWFMRxjYKhu40U@x1n>
References: <ZCcCV8PIsuvab1lO@x1n> <ZCcF6I0qb+1xlPhJ@redhat.com>
 <ZCcKBDM9sLomGOQE@x1n> <ZD7MRGQ+4QsDBtKR@redhat.com>
 <ZD7u9YHTor4edGWw@x1n> <ZEAg5QJS44jzAV/v@redhat.com>
 <ZEA759BSs75ldW6Y@x1n> <ZED/s1zB0NWnqs6P@redhat.com>
 <ZEGQS++pjDODjwks@x1n> <ZEI/sgTCwzsWv6l6@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ZEI/sgTCwzsWv6l6@redhat.com>
Received-SPF: pass client-ip=170.10.133.124; envelope-from=peterx@redhat.com;
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

On Fri, Apr 21, 2023 at 08:48:02AM +0100, Daniel P. Berrangé wrote:
> On Thu, Apr 20, 2023 at 03:19:39PM -0400, Peter Xu wrote:
> > On Thu, Apr 20, 2023 at 10:02:43AM +0100, Daniel P. Berrangé wrote:
> > > On Wed, Apr 19, 2023 at 03:07:19PM -0400, Peter Xu wrote:
> > > > On Wed, Apr 19, 2023 at 06:12:05PM +0100, Daniel P. Berrangé wrote:
> > > > > On Tue, Apr 18, 2023 at 03:26:45PM -0400, Peter Xu wrote:
> > > > > > On Tue, Apr 18, 2023 at 05:58:44PM +0100, Daniel P. Berrangé wrote:
> > > > > > > Libvirt has multiple APIs where it currently uses its migrate-to-file
> > > > > > > approach
> > > > > > > 
> > > > > > >   * virDomainManagedSave()
> > > > > > > 
> > > > > > >     This saves VM state to an libvirt managed file, stops the VM, and the
> > > > > > >     file state is auto-restored on next request to start the VM, and the
> > > > > > >     file deleted. The VM CPUs are stopped during both save + restore
> > > > > > >     phase
> > > > > > > 
> > > > > > >   * virDomainSave/virDomainRestore
> > > > > > > 
> > > > > > >     The former saves VM state to a file specified by the mgmt app/user.
> > > > > > >     A later call to virDomaniRestore starts the VM using that saved
> > > > > > >     state. The mgmt app / user can delete the file state, or re-use
> > > > > > >     it many times as they desire. The VM CPUs are stopped during both
> > > > > > >     save + restore phase
> > > > > > > 
> > > > > > >   * virDomainSnapshotXXX
> > > > > > > 
> > > > > > >     This family of APIs takes snapshots of the VM disks, optionally
> > > > > > >     also including the full VM state to a separate file. The snapshots
> > > > > > >     can later be restored. The VM CPUs remain running during the
> > > > > > >     save phase, but are stopped during restore phase
> > > > > > 
> > > > > > For this one IMHO it'll be good if Libvirt can consider leveraging the new
> > > > > > background-snapshot capability (QEMU 6.0+, so not very new..).  Or is there
> > > > > > perhaps any reason why a generic migrate:fd approach is better?
> > > > > 
> > > > > I'm not sure I fully understand the implications of 'background-snapshot' ?
> > > > > 
> > > > > Based on what the QAPI comment says, it sounds potentially interesting,
> > > > > as conceptually it would be nicer to have the memory / state snapshot
> > > > > represent the VM at the point where we started the snapshot operation,
> > > > > rather than where we finished the snapshot operation.
> > > > > 
> > > > > It would not solve the performance problems that the work in this thread
> > > > > was intended to address though.  With large VMs (100's of GB of RAM),
> > > > > saving all the RAM state to disk takes a very long time, regardless of
> > > > > whether the VM vCPUs are paused or running.
> > > > 
> > > > I think it solves the performance problem by only copy each of the guest
> > > > page once, even if the guest is running.
> > > 
> > > I think we're talking about different performance problems.
> > > 
> > > What you describe here is about ensuring the snapshot is of finite size
> > > and completes in linear time, by ensuring each page is written only
> > > once.
> > > 
> > > What I'm talking about is being able to parallelize the writing of all
> > > RAM, so if a single thread can saturate the storage, using multiple
> > > threads will make the overal process faster, even when we're only
> > > writing each page once.
> > 
> > It depends on how much we want it.  Here the live snapshot scenaior could
> > probably leverage a same multi-threading framework with a vm suspend case
> > because it can assume all the pages are static and only saved once.
> > 
> > But I agree it's at least not there yet.. so we can directly leverage
> > multifd at least for now.
> > 
> > > 
> > > > Different from mostly all the rest of "migrate" use cases, background
> > > > snapshot does not use the generic dirty tracking at all (for KVM that's
> > > > get-dirty-log), instead it uses userfaultfd wr-protects, so that when
> > > > taking the snapshot all the guest pages will be protected once.
> > > 
> > > Oh, so that means this 'background-snapshot' feature only works on
> > > Linux, and only when permissions allow it. The migration parameter
> > > probably should be marked with 'CONFIG_LINUX' in the QAPI schema
> > > to make it clear this is a non-portable feature.
> > 
> > Indeed, I can have a follow up patch for this.  But it'll be the same as
> > some other features, like, postcopy (and all its sub-features including
> > postcopy-blocktime and postcopy-preempt)?
> > 
> > > 
> > > > It guarantees the best efficiency of creating a snapshot with VM running,
> > > > afaict.  I sincerely think Libvirt should have someone investigating and
> > > > see whether virDomainSnapshotXXX() can be implemented by this cap rather
> > > > than the default migration.
> > > 
> > > Since the background-snapshot feature is not universally available,
> > > it will only ever be possible to use it as an optional enhancement
> > > with virDomainSnapshotXXX, we'll need the portable impl to be the
> > > default / fallback.
> > 
> > I am actually curious on how a live snapshot can be implemented correctly
> > if without something like background snapshot.  I raised this question in
> > another reply here:
> > 
> > https://lore.kernel.org/all/ZDWBSuGDU9IMohEf@x1n/
> > 
> > I was using fixed-ram and vm suspend as example, but I assume it applies to
> > any live snapshot that is based on current default migration scheme.
> > 
> > For a real live snapshot (not vm suspend), IIUC we have similar challenges.
> > 
> > The problem is when migration completes (snapshot taken) the VM is still
> > running with a live disk image.  Then how can we take a snapshot exactly at
> > the same time when we got the guest image mirrored in the vm dump?  What
> > guarantees that there's no IO changes after VM image created but before we
> > take a snapshot on the disk image?
> > 
> > In short, it's a question on how libvirt can make sure the VM image and
> > disk snapshot image be taken at exactly the same time for live.
> 
> It is just a matter of where you have the synchronization point.
> 
> With background-snapshot, you have to snapshot the disks at the
> start of the migrate operation. Without background-snapshot
> yu have to snapshot the disks at the end of the migrate
> operation. The CPUs are paused at the end of the migrate, so
> when the CPUs pause, initiate the storage snapshot in the
> background and then let the CPUs resume.

Ah, indeed.

Thanks.

-- 
Peter Xu


