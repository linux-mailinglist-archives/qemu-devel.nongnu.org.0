Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 23E9A3BF9EE
	for <lists+qemu-devel@lfdr.de>; Thu,  8 Jul 2021 14:17:20 +0200 (CEST)
Received: from localhost ([::1]:44544 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m1Sxy-0008Js-T8
	for lists+qemu-devel@lfdr.de; Thu, 08 Jul 2021 08:17:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58228)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1m1Svk-0006UF-NS
 for qemu-devel@nongnu.org; Thu, 08 Jul 2021 08:15:01 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:33124)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1m1Svf-0006GX-48
 for qemu-devel@nongnu.org; Thu, 08 Jul 2021 08:14:58 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1625746493;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Z49ocCcH0+1HlAA0yq5fLV/+qDTx5sOIkkjndiZSP1E=;
 b=gCNozx+Ar9G/1Mxa02ys8fU6HHKbNb4EKMKid+tUQ3VE9D+2gtMo/NQtgnvgz2KGoFfDux
 9leP87G76C3/51Veei+zwWp4M0FRWAKVaxnGNjZ1qQo4WYgKReFTAzZ8kGLnPzR+EMGmin
 Kf7MgfRKfcyYM+0Kirp7v7TYJEqjpSA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-435-304-R7XUMU2rySqNLLd9Rw-1; Thu, 08 Jul 2021 08:14:51 -0400
X-MC-Unique: 304-R7XUMU2rySqNLLd9Rw-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D9CAB81C877;
 Thu,  8 Jul 2021 12:14:47 +0000 (UTC)
Received: from redhat.com (ovpn-114-143.ams2.redhat.com [10.36.114.143])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 97DAA189C7;
 Thu,  8 Jul 2021 12:14:45 +0000 (UTC)
Date: Thu, 8 Jul 2021 14:14:44 +0200
From: Kevin Wolf <kwolf@redhat.com>
To: Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [RFC PATCH 0/6] job: replace AioContext lock with job_mutex
Message-ID: <YObsNCPx3/S/i72O@redhat.com>
References: <20210707165813.55361-1-eesposit@redhat.com>
 <YObVSuBjCEwSMvu7@stefanha-x1.localdomain>
 <6dadca95-632a-61fa-4a91-c2df25e19b52@redhat.com>
MIME-Version: 1.0
In-Reply-To: <6dadca95-632a-61fa-4a91-c2df25e19b52@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kwolf@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.45,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Emanuele Giuseppe Esposito <eesposit@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>, qemu-block@nongnu.org,
 Wen Congyang <wencongyang2@huawei.com>,
 Xie Changlong <xiechanglong.d@gmail.com>, qemu-devel@nongnu.org,
 Markus Armbruster <armbru@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 Max Reitz <mreitz@redhat.com>, John Snow <jsnow@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Am 08.07.2021 um 13:32 hat Paolo Bonzini geschrieben:
> On 08/07/21 12:36, Stefan Hajnoczi wrote:
> > > What is very clear from this patch is that it
> > > is strictly related to the brdv_* and lower level calls, because
> > > they also internally check or even use the aiocontext lock.
> > > Therefore, in order to make it work, I temporarly added some
> > > aiocontext_acquire/release pair around the function that
> > > still assert for them or assume they are hold and temporarly
> > > unlock (unlock() - lock()).
> > 
> > Sounds like the issue is that this patch series assumes AioContext locks
> > are no longer required for calling the blk_*()/bdrv_*() APIs? That is
> > not the case yet, so you had to then add those aio_context_lock() calls
> > back in elsewhere. This approach introduces unnecessary risk. I think we
> > should wait until blk_*()/bdrv_*() no longer requires the caller to hold
> > the AioContext lock before applying this series.
> 
> In general I'm in favor of pushing the lock further down into smaller and
> smaller critical sections; it's a good approach to make further audits
> easier until it's "obvious" that the lock is unnecessary.  I haven't yet
> reviewed Emanuele's patches to see if this is what he's doing where he's
> adding the acquire/release calls, but that's my understanding of both his
> cover letter and your reply.
> 
> The I/O blk_*()/bdrv_*() *should* not require the caller to hold the
> AioContext lock; all drivers use their own CoMutex or QemuMutex when needed,
> and generic code should also be ready (caveat emptor).  Others, such as
> reopen, are a mess that requires a separate audit.  Restricting
> acquire/release to be only around those seems like a good starting point.

Reopen isn't just a mess, but in fact buggy. After the following patch
goes in, the rule is simple: Don't hold any AioContext locks when
calling bdrv_reopen_multiple().

    'block: Acquire AioContexts during bdrv_reopen_multiple()'
    https://lists.gnu.org/archive/html/qemu-block/2021-07/msg00238.html

It still takes AioContext locks when it calls into other functions that
currently expect it, but that should be the same as usual then.

And once callers don't even hold the lock in the first place, we'll also
get rid of the ugly temporary lock release across reopen.

Kevin


