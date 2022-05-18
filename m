Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DCA6852BB7D
	for <lists+qemu-devel@lfdr.de>; Wed, 18 May 2022 15:32:47 +0200 (CEST)
Received: from localhost ([::1]:48280 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nrJnB-0000vk-Sq
	for lists+qemu-devel@lfdr.de; Wed, 18 May 2022 09:32:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36724)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1nrJmH-0000Bm-Mt
 for qemu-devel@nongnu.org; Wed, 18 May 2022 09:31:49 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:39556)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1nrJmF-0002eR-64
 for qemu-devel@nongnu.org; Wed, 18 May 2022 09:31:49 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1652880706;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=G7cj6Tr3nK5dynOlEPUvsFFFiUYRdwyRrkbTik0eP/8=;
 b=YoiWeP8WRnv4mIHkUmVpZ03lNVxQ1eXmSD3X+5Bcpla4B/yIZk4IokhVi/jusuw7knX8BZ
 0letcniBierO+7f1Jed2Ztc6hxkb/AQz0bMjNtsmVG6rv3HOWuQjtFy6gehfZJkpQzm8+h
 abjzRgr08EC44PdgpzAvGy4fTMawQsw=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-214-HpVACHpRNISLmhjNnxE8dA-1; Wed, 18 May 2022 09:31:42 -0400
X-MC-Unique: HpVACHpRNISLmhjNnxE8dA-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com
 [10.11.54.7])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 856B180A0AD;
 Wed, 18 May 2022 13:31:42 +0000 (UTC)
Received: from redhat.com (unknown [10.33.36.166])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 52B361415100;
 Wed, 18 May 2022 13:31:41 +0000 (UTC)
Date: Wed, 18 May 2022 14:31:38 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Dario Faggioli <dfaggioli@suse.com>
Cc: Igor Mammedov <imammedo@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, dzejrou@gmail.com,
 qemu-devel@nongnu.org, david@redhat.com
Subject: Re: [PATCH] hostmem: default the amount of prealloc-threads to
 smp-cpus
Message-ID: <YoT1OolqFQ9+5t/q@redhat.com>
References: <20220517123858.7933-1-dzejrou@gmail.com>
 <3994597b-c559-f62f-504d-3cde3493b713@redhat.com>
 <20220518121716.658ec569@redhat.com>
 <843da9ebf73d89a5084d4e29d972fdaa8b79bfae.camel@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <843da9ebf73d89a5084d4e29d972fdaa8b79bfae.camel@suse.com>
User-Agent: Mutt/2.2.1 (2022-02-19)
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

On Wed, May 18, 2022 at 03:02:48PM +0200, Dario Faggioli wrote:
> On Wed, 2022-05-18 at 12:17 +0200, Igor Mammedov wrote:
> > On Tue, 17 May 2022 20:46:50 +0200
> > Paolo Bonzini <pbonzini@redhat.com> wrote:
> > > > diff --git a/backends/hostmem.c b/backends/hostmem.c
> > > > index a7bae3d713..624bb7ecd3 100644
> > > > --- a/backends/hostmem.c
> > > > +++ b/backends/hostmem.c
> > > > @@ -274,7 +274,7 @@ static void host_memory_backend_init(Object
> > > > *obj)
> > > >       backend->merge = machine_mem_merge(machine);
> > > >       backend->dump = machine_dump_guest_core(machine);
> > > >       backend->reserve = true;
> > > > -    backend->prealloc_threads = 1;
> > > > +    backend->prealloc_threads = machine->smp.cpus;
> > > >   }
> > > >   
> > > >   static void host_memory_backend_post_init(Object *obj)  
> > > 
> > > Queued, thanks.
> > 
> > PS:
> > There is no good default in this case (whatever number is picked
> > it could be good or bad depending on usecase).
> > 
> That is fair enough. What we observed, however, is that, with QEMU 5.2,
> starting a 1024G VM takes ~34s.
> 
> Then you just update QEMU to > 5.2 (and don't do/changing anything
> else) and the same VM now takes ~4m30s to start.
> 
> If users are managing QEMU via Libvirt *and* have _at_least_ Libvirt
> 8.2, they can indeed set, e.g., <allocation mode='immediate'
> threads='NNN'/> (provided they can understand where the problem is, and
> figure out that this is the solution).

I think you get the QEMU version numbers a bit mixed up based on
what i see in git history

Originally mem prellocation was single threaded and slow.

In v2.8.1 it switched to multi threaded with nthreads==vcpus

  commit 1e356fc14beaa3ece6c0e961bd479af58be3198b
  Author: Jitendra Kolhe <jitendra.kolhe@hpe.com>
  Date:   Fri Feb 24 09:01:43 2017 +0530

    mem-prealloc: reduce large guest start-up and migration time.

This applied to --mem-prealloc and --object memory-backend*,prealloc=on


In v5.0.0 the prealloc-threads property was introduced with

  commit ffac16fab33bb42f17e47624985220c1fd864e9d
  Author: Igor Mammedov <imammedo@redhat.com>
  Date:   Wed Feb 19 11:09:50 2020 -0500

    hostmem: introduce "prealloc-threads" property

This changed it so that --mem-prealloc stil uses nthreads=vcpus
but --object memory-backend,prealloc=on regressed to nthreads=1

When picking defaults there is never a perfect answer, it
is more a matter of the least-worst option.

It is pretty clear that nthreads=1 is terrible for any
large VMs. Defaulting it to nvcpus made conceptual sense
as the user has implicit said that they expect the VM to
be able to consume nvcpus worth of CPU time on the host,
so we might as well consume that allotted resource.

I struggle to come up with a compelling reason why it is
better to only use 1 single thread for preallocation. There
might be some niches where its useful but I can't see it
being the common case desirable behaviour.

Having different defaults based on how you configure it
is also especially unplesant experience.

With regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


