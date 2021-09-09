Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F63940471F
	for <lists+qemu-devel@lfdr.de>; Thu,  9 Sep 2021 10:38:42 +0200 (CEST)
Received: from localhost ([::1]:41874 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mOFZy-0001fN-FX
	for lists+qemu-devel@lfdr.de; Thu, 09 Sep 2021 04:38:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36518)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1mOFYu-000101-Ib
 for qemu-devel@nongnu.org; Thu, 09 Sep 2021 04:37:36 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:25402)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1mOFYq-00049a-7P
 for qemu-devel@nongnu.org; Thu, 09 Sep 2021 04:37:34 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1631176651;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=TqCH0yoZeve3Hs+97gbfaAWgPwIOPW0C8MlnbMSmwoA=;
 b=Go/mylxXZScZWAXr9/XsmAnzpkWTgoghtGceA7pY94XHOS+FIZII5qpAKIU2hl3yeGyuRl
 sASLkLD+14PMUWBdURCQDtySm+NhRpVylg5rI1Hv96axbn+toOVUgUy7ubq0US/08ljQo5
 EiPdxbulewP1pLvwgIc5633JlGL5Pr0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-58-ePOAS1ALOwyXDpCA9NGQDg-1; Thu, 09 Sep 2021 04:37:29 -0400
X-MC-Unique: ePOAS1ALOwyXDpCA9NGQDg-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 0CE9AA40CE;
 Thu,  9 Sep 2021 08:37:29 +0000 (UTC)
Received: from redhat.com (unknown [10.39.195.19])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 12C6F5C25D;
 Thu,  9 Sep 2021 08:37:23 +0000 (UTC)
Date: Thu, 9 Sep 2021 09:37:20 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Stefan Hajnoczi <stefanha@redhat.com>
Subject: Re: [PATCH] coroutine: resize pool periodically instead of limiting
 size
Message-ID: <YTnHwJ/0O4rk7M7g@redhat.com>
References: <20210901160923.525651-1-stefanha@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210901160923.525651-1-stefanha@redhat.com>
User-Agent: Mutt/2.0.7 (2021-05-04)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.393,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
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
Cc: Kevin Wolf <kwolf@redhat.com>, Tingting Mao <timao@redhat.com>,
 qemu-devel@nongnu.org, Honghao Wang <wanghonghao@bytedance.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Daniele Buono <dbuono@linux.vnet.ibm.com>, Serge Guelton <sguelton@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Sep 01, 2021 at 05:09:23PM +0100, Stefan Hajnoczi wrote:
> It was reported that enabling SafeStack reduces IOPS significantly
> (>25%) with the following fio benchmark on virtio-blk using a NVMe host
> block device:
> 
>   # fio --rw=randrw --bs=4k --iodepth=64 --runtime=1m --direct=1 \
> 	--filename=/dev/vdb --name=job1 --ioengine=libaio --thread \
> 	--group_reporting --numjobs=16 --time_based \
>         --output=/tmp/fio_result
> 
> Serge Guelton and I found that SafeStack is not really at fault, it just
> increases the cost of coroutine creation. This fio workload exhausts the
> coroutine pool and coroutine creation becomes a bottleneck. Previous
> work by Honghao Wang also pointed to excessive coroutine creation.
> 
> Creating new coroutines is expensive due to allocating new stacks with
> mmap(2) and mprotect(2). Currently there are thread-local and global
> pools that recycle old Coroutine objects and their stacks but the
> hardcoded size limit of 64 for thread-local pools and 128 for the global
> pool is insufficient for the fio benchmark shown above.

Rather than keeping around a thread local pool of coroutine
instances, did you ever consider keeping around a pool of
allocated stacks ? Essentially it seems like you're syaing
the stack allocation is the problem due to it using mmap()
instead of malloc() and thus not benefiting from any of the
performance tricks malloc() impls use to avoid repeated
syscalls on every allocation.  If 'qemu_alloc_stack' and
qemu_free_stack could be made more intelligent by caching
stacks, then perhaps the coroutine side can be left "dumb" ?

> 
> This patch changes the coroutine pool algorithm to a simple thread-local
> pool without a size limit. Threads periodically shrink the pool down to
> a size sufficient for the maximum observed number of coroutines.
> 
> This is a very simple algorithm. Fancier things could be done like
> keeping a minimum number of coroutines around to avoid latency when a
> new coroutine is created after a long period of inactivity. Another
> thought is to stop the timer when the pool size is zero for power saving
> on threads that aren't using coroutines. However, I'd rather not add
> bells and whistles unless they are really necessary.
> 
> The global pool is removed by this patch. It can help to hide the fact
> that local pools are easily exhausted, but it's doesn't fix the root
> cause. I don't think there is a need for a global pool because QEMU's
> threads are long-lived, so let's keep things simple.

QEMU's threads may be long-lived,  but are the workloads they service
expected to be consistent over time?

eg can we ever get a situation where Thread A has a peak of activity
causing caching of many coroutines, and then go idle for a long time,
while Thread B then has a peak and is unable to take advantage of the
cache from Thread A that is now unused ?


Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


