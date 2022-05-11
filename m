Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 08C3B522F87
	for <lists+qemu-devel@lfdr.de>; Wed, 11 May 2022 11:36:49 +0200 (CEST)
Received: from localhost ([::1]:36932 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1noilz-0003kl-UD
	for lists+qemu-devel@lfdr.de; Wed, 11 May 2022 05:36:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41732)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1noiWj-00044x-7R
 for qemu-devel@nongnu.org; Wed, 11 May 2022 05:21:01 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:41116)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1noiWf-0007sb-UF
 for qemu-devel@nongnu.org; Wed, 11 May 2022 05:20:59 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1652260857;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=SMZBZsnaTTnuusV6zyNj3NnrmD72AbJKxdlRoCduI/4=;
 b=d4+y5ZNWSHeuuKl0F3JXIxNV8muEa4d/ZqBdYabbu1scIFkf1PMxC7iyF3xufgCHLwF+1w
 +cE5JYH+XU7DDxb+GzI7HCon0JTG6NktE0OZACRzvw/3KYssxlNiyKOCbZ3VVBhZw9s7Hx
 eYEfwASH5S1T6lQAOLIVlTPNGbdfk+E=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-81-OzNranFTMEiL5aI6w-A25Q-1; Wed, 11 May 2022 05:20:55 -0400
X-MC-Unique: OzNranFTMEiL5aI6w-A25Q-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id ACD321C01B24
 for <qemu-devel@nongnu.org>; Wed, 11 May 2022 09:20:55 +0000 (UTC)
Received: from redhat.com (unknown [10.33.36.142])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id A75A8C2810A;
 Wed, 11 May 2022 09:20:54 +0000 (UTC)
Date: Wed, 11 May 2022 10:20:52 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
Cc: Michal Privoznik <mprivozn@redhat.com>, jmario@redhat.com,
 qemu-devel@nongnu.org, david@redhat.com
Subject: Re: [PATCH] util: NUMA aware memory preallocation
Message-ID: <Ynt/9K/FUFBtLinm@redhat.com>
References: <ffdcd118d59b379ede2b64745144165a40f6a813.1652165704.git.mprivozn@redhat.com>
 <Ynt0/9jfeUPg4JxN@work-vm>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <Ynt0/9jfeUPg4JxN@work-vm>
User-Agent: Mutt/2.1.5 (2021-12-30)
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.8
Received-SPF: pass client-ip=170.10.129.124; envelope-from=berrange@redhat.com;
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

On Wed, May 11, 2022 at 09:34:07AM +0100, Dr. David Alan Gilbert wrote:
> * Michal Privoznik (mprivozn@redhat.com) wrote:
> > When allocating large amounts of memory the task is offloaded
> > onto threads. These threads then use various techniques to
> > allocate the memory fully (madvise(), writing into the memory).
> > However, these threads are free to run on any CPU, which becomes
> > problematic on NUMA machines because it may happen that a thread
> > is running on a distant node.
> > 
> > Ideally, this is something that a management application would
> > resolve, but we are not anywhere close to that, Firstly, memory
> > allocation happens before monitor socket is even available. But
> > okay, that's what -preconfig is for. But then the problem is that
> > 'object-add' would not return until all memory is preallocated.
> > 
> > Long story short, management application has no way of learning
> > TIDs of allocator threads so it can't make them run NUMA aware.
> > 
> > But what we can do is to propagate the 'host-nodes' attribute of
> > MemoryBackend object down to where preallocation threads are
> > created and set their affinity according to the attribute.
> 
> Joe (cc'd) sent me some numbers for this which emphasise how useful it
> is:
>  | On systems with 4 physical numa nodes and 2-6 Tb of memory, this numa-aware
>  |preallocation provided about a 25% speedup in touching the pages.
>  |The speedup gets larger as the numa node count and memory sizes grow.
> ....
>  | In a simple parallel 1Gb page-zeroing test on a very large system (32-numa
>  | nodes and 47Tb of memory), the numa-aware preallocation was 2.3X faster
>  | than letting the threads float wherever.
>  | We're working with someone whose large guest normally takes 4.5 hours to
>  | boot.  With Michal P's initial patch to parallelize the preallocation, that
>  | time dropped to about 1 hour.  Including this numa-aware preallocation
>  | would reduce the guest boot time to less than 1/2 hour.
> 
> so chopping *half an hour* off the startup time seems a worthy
> optimisation (even if most of us aren't fortunate enough to have 47T of
> ram).

I presume this test was done with bare QEMU though, not libvirt managed
QEMU, as IIUC, the latter would not be able to set its affinity and so
never see this benefit.


With regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


