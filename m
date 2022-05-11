Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A7DF52305D
	for <lists+qemu-devel@lfdr.de>; Wed, 11 May 2022 12:12:05 +0200 (CEST)
Received: from localhost ([::1]:45722 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nojK7-0004z7-84
	for lists+qemu-devel@lfdr.de; Wed, 11 May 2022 06:12:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51254)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1nojIL-00047I-3V
 for qemu-devel@nongnu.org; Wed, 11 May 2022 06:10:13 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:35486)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1nojIH-0006tl-PD
 for qemu-devel@nongnu.org; Wed, 11 May 2022 06:10:11 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1652263808;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=SVRRkFuVRUEGR8xVM4F38nC6EGwcOpSeHUzVVtWOF3Y=;
 b=XUb0yyk60zB+fw3uxn6L7P+0lz1F4q7HjXx/3MiXceFsdBWV0JAbzTLWhKB6CaFT+hN6cZ
 8ja+C0O74Kn/oPH876ei7O/N7c+n7pcPBKytpLPFuAlkotHoFI/IFpRXYXtoDvb+OC11kS
 tZ/+R9oew+1WhbrjEcHqcyn7HHJVq8Q=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-480-xI2qkbpxPZ2aFV3s2LhChw-1; Wed, 11 May 2022 06:10:07 -0400
X-MC-Unique: xI2qkbpxPZ2aFV3s2LhChw-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com
 [10.11.54.7])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 2053D805F46
 for <qemu-devel@nongnu.org>; Wed, 11 May 2022 10:10:07 +0000 (UTC)
Received: from redhat.com (unknown [10.33.36.142])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 2EE251468F31;
 Wed, 11 May 2022 10:10:05 +0000 (UTC)
Date: Wed, 11 May 2022 11:10:03 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: David Hildenbrand <david@redhat.com>
Cc: Michal Privoznik <mprivozn@redhat.com>, qemu-devel@nongnu.org
Subject: Re: [PATCH] util: NUMA aware memory preallocation
Message-ID: <YnuLe7cVlEYsw78o@redhat.com>
References: <ffdcd118d59b379ede2b64745144165a40f6a813.1652165704.git.mprivozn@redhat.com>
 <Ynt/v2SHmnO2afg4@redhat.com>
 <8a6b84ed-50bc-8f6e-4b71-7e15247c4ac0@redhat.com>
 <YnuDONrdbMcJT08p@redhat.com>
 <a11ca582-3d17-b064-6736-bd66ed5a5ec4@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <a11ca582-3d17-b064-6736-bd66ed5a5ec4@redhat.com>
User-Agent: Mutt/2.1.5 (2021-12-30)
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.7
Received-SPF: pass client-ip=170.10.133.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, May 11, 2022 at 12:03:24PM +0200, David Hildenbrand wrote:
> On 11.05.22 11:34, Daniel P. Berrangé wrote:
> > On Wed, May 11, 2022 at 11:31:23AM +0200, David Hildenbrand wrote:
> >>>> Long story short, management application has no way of learning
> >>>> TIDs of allocator threads so it can't make them run NUMA aware.
> >>>
> >>> This feels like the key issue. The preallocation threads are
> >>> invisible to libvirt, regardless of whether we're doing coldplug
> >>> or hotplug of memory-backends. Indeed the threads are invisible
> >>> to all of QEMU, except the memory backend code.
> >>>
> >>> Conceptually we need 1 or more explicit worker threads, that we
> >>> can assign CPU affinity to, and then QEMU can place jobs on them.
> >>> I/O threads serve this role, but limited to blockdev work. We
> >>> need a generalization of I/O threads, for arbitrary jobs that
> >>> QEMU might want to farm out to specific numa nodes.
> >>
> >> At least the "-object iothread" thingy can already be used for actions
> >> outside of blockdev. virtio-balloon uses one for free page hinting.
> > 
> > Ah that's good to know, so my idea probably isn't so much work as
> > I thought it might be.
> 
> I guess we'd have to create a bunch of iothreads on the command line and
> then feed them as an array to the memory backend we want to create. We
> could then forward the threads to a new variant of os_mem_prealloc().
> 
> We could
> 
> a) Allocate new iothreads for each memory backend we create. Hm, that
> might be suboptimal, we could end up with many iothreads.
> 
> b) Reuse iothreads and have separate sets of iothreads per NUMA node.
> Assign them to a node once.
> 
> c) Reuse iothreads and reassign them to NUMA nodes on demand.

If all we needs is NUMA affinity, not CPU affinity, then it would
be sufficient to create 1 I/O thread per host NUMA node that the
VM needs to use. The job running in the I/O can spawn further
threads and inherit the NUMA affinity.  This might be more clever
than it is needed though.

I expect creating/deleting I/O threads is cheap in comparison to
the work done for preallocation. If libvirt is using -preconfig
and object-add to create the memory backend, then we could have
option of creating the I/O threads dynamically in -preconfig mode,
create the memory backend, and then delete the I/O threads again.

> However, I'm not sure what the semantics are when having multiple
> backends referencing the iothreads ...

Yep, we don't especially need an "ownership" relationship for what
we want todo with preallocatino, specially because it is a one
off point-in-time usage, not continuous usage as with block devices

With regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


