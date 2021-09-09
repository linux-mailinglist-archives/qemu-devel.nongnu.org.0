Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BCBF3405A87
	for <lists+qemu-devel@lfdr.de>; Thu,  9 Sep 2021 18:12:10 +0200 (CEST)
Received: from localhost ([::1]:49188 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mOMem-0001zC-QP
	for lists+qemu-devel@lfdr.de; Thu, 09 Sep 2021 12:12:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52696)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1mOMdd-0000Xd-IN
 for qemu-devel@nongnu.org; Thu, 09 Sep 2021 12:10:57 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:44263)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1mOMdb-0002FV-F2
 for qemu-devel@nongnu.org; Thu, 09 Sep 2021 12:10:57 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1631203853;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=5oE0YJt76t+Jdxm+0KYNqIJ6lfw57FFM8kg0xYa4d9o=;
 b=DEwYyCBz1RysZl64llwJQJyJn4dca+mgrW5S7Taulw+3y0qRCpMW855mXS5ialCqbovIv8
 H0kuBMG1hWj4xtQnDyh5HH8Gf5PGv911WjDJdRE+TOPYBmN+30JcrdZD9fflI26ziU5w7/
 f1SdrN8Xa0Vl02+fVIFjvJzDqnhDT8c=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-215-1cdlraMRPmmg_6H6Nvxptw-1; Thu, 09 Sep 2021 12:10:52 -0400
X-MC-Unique: 1cdlraMRPmmg_6H6Nvxptw-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 2A5B71097909;
 Thu,  9 Sep 2021 16:08:13 +0000 (UTC)
Received: from redhat.com (unknown [10.39.195.19])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 0724769FAE;
 Thu,  9 Sep 2021 16:08:10 +0000 (UTC)
Date: Thu, 9 Sep 2021 17:08:08 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Stefan Hajnoczi <stefanha@redhat.com>
Subject: Re: [PATCH] coroutine: resize pool periodically instead of limiting
 size
Message-ID: <YToxaOCMsLTLp4+M@redhat.com>
References: <20210901160923.525651-1-stefanha@redhat.com>
 <YTnHwJ/0O4rk7M7g@redhat.com>
 <YTotkCiuqTeDgJJ0@stefanha-x1.localdomain>
MIME-Version: 1.0
In-Reply-To: <YTotkCiuqTeDgJJ0@stefanha-x1.localdomain>
User-Agent: Mutt/2.0.7 (2021-05-04)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=berrange@redhat.com;
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

On Thu, Sep 09, 2021 at 04:51:44PM +0100, Stefan Hajnoczi wrote:
> On Thu, Sep 09, 2021 at 09:37:20AM +0100, Daniel P. Berrangé wrote:
> > On Wed, Sep 01, 2021 at 05:09:23PM +0100, Stefan Hajnoczi wrote:
> > > It was reported that enabling SafeStack reduces IOPS significantly
> > > (>25%) with the following fio benchmark on virtio-blk using a NVMe host
> > > block device:
> > > 
> > >   # fio --rw=randrw --bs=4k --iodepth=64 --runtime=1m --direct=1 \
> > > 	--filename=/dev/vdb --name=job1 --ioengine=libaio --thread \
> > > 	--group_reporting --numjobs=16 --time_based \
> > >         --output=/tmp/fio_result
> > > 
> > > Serge Guelton and I found that SafeStack is not really at fault, it just
> > > increases the cost of coroutine creation. This fio workload exhausts the
> > > coroutine pool and coroutine creation becomes a bottleneck. Previous
> > > work by Honghao Wang also pointed to excessive coroutine creation.
> > > 
> > > Creating new coroutines is expensive due to allocating new stacks with
> > > mmap(2) and mprotect(2). Currently there are thread-local and global
> > > pools that recycle old Coroutine objects and their stacks but the
> > > hardcoded size limit of 64 for thread-local pools and 128 for the global
> > > pool is insufficient for the fio benchmark shown above.
> > 
> > Rather than keeping around a thread local pool of coroutine
> > instances, did you ever consider keeping around a pool of
> > allocated stacks ? Essentially it seems like you're syaing
> > the stack allocation is the problem due to it using mmap()
> > instead of malloc() and thus not benefiting from any of the
> > performance tricks malloc() impls use to avoid repeated
> > syscalls on every allocation.  If 'qemu_alloc_stack' and
> > qemu_free_stack could be made more intelligent by caching
> > stacks, then perhaps the coroutine side can be left "dumb" ?
> 
> What is the advantage of doing that? Then the Coroutine struct needs to
> be malloced each time. Coroutines are the only users of
> qemu_alloc_stack(), so I think pooling the Coroutines is optimal.

I mostly thought it might lead itself to cleaner implementation if the
pooling logic is separate from the main coroutine logic. It could be
easier to experiment with different allocation strategies if the code
related to pooling is well isolated.

Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


