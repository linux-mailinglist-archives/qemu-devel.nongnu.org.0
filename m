Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6ED136780C2
	for <lists+qemu-devel@lfdr.de>; Mon, 23 Jan 2023 17:03:12 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pJzGv-00039F-Ez; Mon, 23 Jan 2023 11:02:13 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1pJzGn-000382-JM
 for qemu-devel@nongnu.org; Mon, 23 Jan 2023 11:02:05 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1pJzGl-00087P-C1
 for qemu-devel@nongnu.org; Mon, 23 Jan 2023 11:02:05 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1674489722;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=yZUOKTqV8NDJL0hx92mGIgxNT/vSNb041Uz5EqVpFK8=;
 b=CKPpS++qJpk/2aRHY+FfQ8w8xCzN/ZASSpA7I1PPlvrDyHcYquZk+fDqE/8Q2dxCIJ0qJR
 2IJzcOEg+SCBA1m2WPe8F5dvIvcQIHGfTzPavUIRunCEOh5BE7QVAby5rlJoGIhYNlbvsS
 1Q+FOWKXNpe/GWwdPBmdCwQCjsSkWUY=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-626--8tUyun_PBOsx3EgM63p-w-1; Mon, 23 Jan 2023 11:02:00 -0500
X-MC-Unique: -8tUyun_PBOsx3EgM63p-w-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 9631B1805660;
 Mon, 23 Jan 2023 16:01:59 +0000 (UTC)
Received: from redhat.com (unknown [10.33.36.197])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 3668A492C3C;
 Mon, 23 Jan 2023 16:01:58 +0000 (UTC)
Date: Mon, 23 Jan 2023 16:01:55 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: David Hildenbrand <david@redhat.com>
Cc: Daniil Tatianin <d-tatianin@yandex-team.ru>,
 Paolo Bonzini <pbonzini@redhat.com>, qemu-devel@nongnu.org,
 Stefan Weil <sw@weilnetz.de>, Igor Mammedov <imammedo@redhat.com>,
 yc-core@yandex-team.ru
Subject: Re: [PATCH v0 0/4] backends/hostmem: add an ability to specify
 prealloc timeout
Message-ID: <Y86vc1zY7UZGwLD8@redhat.com>
References: <20230120134749.550639-1-d-tatianin@yandex-team.ru>
 <338cbc9a-4eea-a76c-8042-98372fb70854@redhat.com>
 <ace54833-f254-1b30-b720-c530e60c8266@yandex-team.ru>
 <Y86QBGquzIOb96MU@redhat.com>
 <aacfa4a8-21bc-6401-10e0-25b84155c9cf@yandex-team.ru>
 <e5423461-489f-b4c8-542b-113d8816a65a@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <e5423461-489f-b4c8-542b-113d8816a65a@redhat.com>
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

On Mon, Jan 23, 2023 at 03:16:03PM +0100, David Hildenbrand wrote:
> On 23.01.23 15:14, Daniil Tatianin wrote:
> > On 1/23/23 4:47 PM, Daniel P. Berrangé wrote:
> > > On Mon, Jan 23, 2023 at 04:30:03PM +0300, Daniil Tatianin wrote:
> > > > On 1/23/23 11:57 AM, David Hildenbrand wrote:
> > > > > On 20.01.23 14:47, Daniil Tatianin wrote:
> > > > > > This series introduces new qemu_prealloc_mem_with_timeout() api,
> > > > > > which allows limiting the maximum amount of time to be spent on memory
> > > > > > preallocation. It also adds prealloc statistics collection that is
> > > > > > exposed via an optional timeout handler.
> > > > > > 
> > > > > > This new api is then utilized by hostmem for guest RAM preallocation
> > > > > > controlled via new object properties called 'prealloc-timeout' and
> > > > > > 'prealloc-timeout-fatal'.
> > > > > > 
> > > > > > This is useful for limiting VM startup time on systems with
> > > > > > unpredictable page allocation delays due to memory fragmentation or the
> > > > > > backing storage. The timeout can be configured to either simply emit a
> > > > > > warning and continue VM startup without having preallocated the entire
> > > > > > guest RAM or just abort startup entirely if that is not acceptable for
> > > > > > a specific use case.
> > > > > 
> > > > > The major use case for preallocation is memory resources that cannot be
> > > > > overcommitted (hugetlb, file blocks, ...), to avoid running out of such
> > > > > resources later, while the guest is already running, and crashing it.
> > > > 
> > > > Wouldn't you say that preallocating memory for the sake of speeding up guest
> > > > kernel startup & runtime is a valid use case of prealloc? This way we can
> > > > avoid expensive (for a multitude of reasons) page faults that will otherwise
> > > > slow down the guest significantly at runtime and affect the user experience.
> > > > 
> > > > > Allocating only a fraction "because it takes too long" looks quite
> > > > > useless in that (main use-case) context. We shouldn't encourage QEMU
> > > > > users to play with fire in such a way. IOW, there should be no way
> > > > > around "prealloc-timeout-fatal". Either preallocation succeeded and the
> > > > > guest can run, or it failed, and the guest can't run.
> > > > 
> > > > Here we basically accept the fact that e.g with fragmented memory the kernel
> > > > might take a while in a page fault handler especially for hugetlb because of
> > > > page compaction that has to run for every fault.
> > > > 
> > > > This way we can prefault at least some number of pages and let the guest
> > > > fault the rest on demand later on during runtime even if it's slow and would
> > > > cause a noticeable lag.
> > > 
> > > Rather than treat this as a problem that needs a timeout, can we
> > > restate it as situations need synchronous vs asynchronous
> > > preallocation ?
> > > 
> > > For the case where we need synchronous prealloc, current QEMU deals
> > > with that. If it doesn't work quickly enough, mgmt can just kill
> > > QEMU already today.
> > > 
> > > For the case where you would like some prealloc, but don't mind
> > > if it runs without full prealloc, then why not just treat it as an
> > > entirely asynchronous task ? Instead of calling qemu_prealloc_mem
> > > and waiting for it to complete, just spawn a thread to run
> > > qemu_prealloc_mem, so it doesn't block QEMU startup. This will
> > > have minimal maint burden on the existing code, and will avoid
> > > need for mgmt apps to think about what timeout value to give,
> > > which is good because timeouts are hard to get right.
> > > 
> > > Most of the time that async background prealloc will still finish
> > > before the guest even gets out of the firmware phase, but if it
> > > takes longer it is no big deal. You don't need to quit the prealloc
> > > job early, you just need it to not delay the guest OS boot IIUC.
> > > 
> > > This impl could be done with the 'prealloc' property turning from
> > > a boolean on/off, to a enum  on/async/off, where 'on' == sync
> > > prealloc. Or add a separate 'prealloc-async' bool property
> > 
> > I like this idea, but I'm not sure how we would go about writing to live
> > guest memory. Is that something that can be done safely without racing
> > with the guest?
> 
> You can use MADV_POPULATE_WRITE safely, as it doesn't actually perform a
> write. We'd have to fail async=true if MADV_POPULATE_WRITE cannot be used.

Right, in the short term that means this feature would have limited
availability on our targetted OS platforms, but such issues tend to
fade into irrelevance quicker than we anticipate, as platforms move
forwards at such a fast pace.

With regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


