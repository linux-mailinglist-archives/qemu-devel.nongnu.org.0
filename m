Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B829C6D2454
	for <lists+qemu-devel@lfdr.de>; Fri, 31 Mar 2023 17:47:35 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1piGxq-0007Lg-Pg; Fri, 31 Mar 2023 11:46:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1piGxo-0007LW-OQ
 for qemu-devel@nongnu.org; Fri, 31 Mar 2023 11:46:52 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1piGxl-0004Dj-PZ
 for qemu-devel@nongnu.org; Fri, 31 Mar 2023 11:46:52 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1680277608;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=OSwZc/ZNAbS+6OQLuQvsrkp88p7IIT8E1dTWcdMhqWU=;
 b=Hv+CaezPUDG5TzL+wa+Yh6snqM+YsdaIZnHdFmH3Pg+yTNRHfREHM5xZl+qAO17iGM4nlL
 RyPUdk8ls21ga+fIWJTqtbaaTzuatb2l30vC20p9d+9hN+Iz/3IRNLZSo5bsWD19Nmm5Hu
 0bXHOjbQ5v3iWVbMjK9H5+UiaimvJkQ=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-490-Kn5BaCrTNlqCO6ODrGZpEA-1; Fri, 31 Mar 2023 11:46:46 -0400
X-MC-Unique: Kn5BaCrTNlqCO6ODrGZpEA-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id DC9EE80D08E;
 Fri, 31 Mar 2023 15:46:45 +0000 (UTC)
Received: from redhat.com (unknown [10.33.36.67])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id E25FC492B00;
 Fri, 31 Mar 2023 15:46:42 +0000 (UTC)
Date: Fri, 31 Mar 2023 16:46:37 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Peter Xu <peterx@redhat.com>
Cc: Fabiano Rosas <farosas@suse.de>, qemu-devel@nongnu.org,
 Claudio Fontana <cfontana@suse.de>, jfehlig@suse.com,
 dfaggioli@suse.com, dgilbert@redhat.com,
 Juan Quintela <quintela@redhat.com>
Subject: Re: [RFC PATCH v1 00/26] migration: File based migration with
 multifd and fixed-ram
Message-ID: <ZCcAXVYwscS+ERv8@redhat.com>
References: <20230330180336.2791-1-farosas@suse.de> <ZCYCE0llX9WANK18@x1n>
 <87edp5oukh.fsf@suse.de> <ZCbzmZXz3JG/jElA@x1n>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <ZCbzmZXz3JG/jElA@x1n>
User-Agent: Mutt/2.2.9 (2022-11-12)
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.9
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

On Fri, Mar 31, 2023 at 10:52:09AM -0400, Peter Xu wrote:
> On Fri, Mar 31, 2023 at 11:37:50AM -0300, Fabiano Rosas wrote:
> > >> Outgoing migration to file. NVMe disk. XFS filesystem.
> > >> 
> > >> - Single migration runs of stopped 32G guest with ~90% RAM usage. Guest
> > >>   running `stress-ng --vm 4 --vm-bytes 90% --vm-method all --verify -t
> > >>   10m -v`:
> > >> 
> > >> migration type  | MB/s | pages/s |  ms
> > >> ----------------+------+---------+------
> > >> savevm io_uring |  434 |  102294 | 71473
> > >
> > > So I assume this is the non-live migration scenario.  Could you explain
> > > what does io_uring mean here?
> > >
> > 
> > This table is all non-live migration. This particular line is a snapshot
> > (hmp_savevm->save_snapshot). I thought it could be relevant because it
> > is another way by which we write RAM into disk.
> 
> I see, so if all non-live that explains, because I was curious what's the
> relationship between this feature and the live snapshot that QEMU also
> supports.
> 
> I also don't immediately see why savevm will be much slower, do you have an
> answer?  Maybe it's somewhere but I just overlooked..
> 
> IIUC this is "vm suspend" case, so there's an extra benefit knowledge of
> "we can stop the VM".  It smells slightly weird to build this on top of
> "migrate" from that pov, rather than "savevm", though.  Any thoughts on
> this aspect (on why not building this on top of "savevm")?

Currently savevm covers memory, device state and disk snapshots
saving into the VM's disks, which basically means only works
with qcow2.

Libvirt's save logic only cares about saving memory and device
state, and supports saving guests regardless of what storage is
used, saving it externally from the disk.

This is only possible with 'migrate' today and so 'savevm' isn't
useful for this tasks from libvirt's POV.

In the past it has been suggested that actually 'savevm' command
as a concept is redundant, and that we could in fact layer it
on top of a combination of migration and block snapshot APIs.
eg if we had a 'blockdev:' migration protocol for saving the
vmstate.

With regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


