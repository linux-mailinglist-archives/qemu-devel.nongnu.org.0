Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1910E522F6E
	for <lists+qemu-devel@lfdr.de>; Wed, 11 May 2022 11:32:03 +0200 (CEST)
Received: from localhost ([::1]:56608 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1noihK-0006Cr-H6
	for lists+qemu-devel@lfdr.de; Wed, 11 May 2022 05:31:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41578)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1noiWO-0003Nq-S1
 for qemu-devel@nongnu.org; Wed, 11 May 2022 05:20:40 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:46192)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1noiWI-0007d7-E3
 for qemu-devel@nongnu.org; Wed, 11 May 2022 05:20:38 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1652260803;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=gBRLTV55WS6TpwRwXrmfM9eMa7VczvJBKOulGQBH9bI=;
 b=H2H0h6gr0c2i3jqCfoseF6q31Q3Pr54pKGjs1+9akFdBvwVXWaPg4q7mpNJBmpo/2N+dOt
 FIdH+DcY11R3It6myPWKtaZQD4wpT41OPvYRhCxKXI0mG0q7stUjcb2SXjDX9jqkGzu1Z5
 0t5jo07hAF63JbgWDwVXOIiE6O3uZPI=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-290-JKWGadIWPg--VktHNLMQGg-1; Wed, 11 May 2022 05:20:02 -0400
X-MC-Unique: JKWGadIWPg--VktHNLMQGg-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 482DD2999B3D
 for <qemu-devel@nongnu.org>; Wed, 11 May 2022 09:20:02 +0000 (UTC)
Received: from redhat.com (unknown [10.33.36.142])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 74F95C2810A;
 Wed, 11 May 2022 09:20:01 +0000 (UTC)
Date: Wed, 11 May 2022 10:19:59 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Michal Privoznik <mprivozn@redhat.com>
Cc: qemu-devel@nongnu.org, david@redhat.com
Subject: Re: [PATCH] util: NUMA aware memory preallocation
Message-ID: <Ynt/v2SHmnO2afg4@redhat.com>
References: <ffdcd118d59b379ede2b64745144165a40f6a813.1652165704.git.mprivozn@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <ffdcd118d59b379ede2b64745144165a40f6a813.1652165704.git.mprivozn@redhat.com>
User-Agent: Mutt/2.1.5 (2021-12-30)
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.8
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

On Tue, May 10, 2022 at 08:55:33AM +0200, Michal Privoznik wrote:
> When allocating large amounts of memory the task is offloaded
> onto threads. These threads then use various techniques to
> allocate the memory fully (madvise(), writing into the memory).
> However, these threads are free to run on any CPU, which becomes
> problematic on NUMA machines because it may happen that a thread
> is running on a distant node.
> 
> Ideally, this is something that a management application would
> resolve, but we are not anywhere close to that, Firstly, memory
> allocation happens before monitor socket is even available. But
> okay, that's what -preconfig is for. But then the problem is that
> 'object-add' would not return until all memory is preallocated.

Is the delay to 'object-add' actually a problem ?

Currently we're cold plugging the memory backends, so prealloc
happens before QMP is available. So we have a delay immediately
at startup. Switching to -preconfig plus 'object-add'  would
not be making the delay worse, merely moving it ever so slightly
later.

With the POV of an application using libvirt, this is the same.
virDomainCreate takes 1 hour, regardless of whether the 1 hour
allocatinon delay is before QMP or in -preconfig object-add
execution.

> Long story short, management application has no way of learning
> TIDs of allocator threads so it can't make them run NUMA aware.

This feels like the key issue. The preallocation threads are
invisible to libvirt, regardless of whether we're doing coldplug
or hotplug of memory-backends. Indeed the threads are invisible
to all of QEMU, except the memory backend code.

Conceptually we need 1 or more explicit worker threads, that we
can assign CPU affinity to, and then QEMU can place jobs on them.
I/O threads serve this role, but limited to blockdev work. We
need a generalization of I/O threads, for arbitrary jobs that
QEMU might want to farm out to specific numa nodes.

In a guest spanning multiple host NUMA nodes, libvirt would
have to configure 1 or more worker threads for QEMU, learn
their TIDs,then add the memory backends in -preconfig, which
would farm our preallocation to the worker threads, with
job placement matching the worker's affinity.


With regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


