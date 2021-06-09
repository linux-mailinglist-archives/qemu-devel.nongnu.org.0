Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DDEE3A1513
	for <lists+qemu-devel@lfdr.de>; Wed,  9 Jun 2021 15:03:23 +0200 (CEST)
Received: from localhost ([::1]:34890 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lqxre-0007ni-Ki
	for lists+qemu-devel@lfdr.de; Wed, 09 Jun 2021 09:03:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51316)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1lqxqi-0006lr-2B
 for qemu-devel@nongnu.org; Wed, 09 Jun 2021 09:02:24 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:35305)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1lqxqb-0004Qr-8l
 for qemu-devel@nongnu.org; Wed, 09 Jun 2021 09:02:23 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1623243736;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=JtZNgozJ6EBTBHxfjzp+NA47tr95/ImwKIjV5mpHh6s=;
 b=IsMucLSXLo/P654pY4pk8cJP2jNpL46kRmCi+ZcRCneQCT48uqb8OopaiabTIEqK0HmBu5
 WeXaFjB/G0DtYjqKXFHPKY9xRU8RhfNDHDf+gZ2LC7gT+HDb50bQx7rPUgxRxV/rNSLAQA
 Q2pMR2WqTRSPyIVTwSez+ixGzcSIILg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-496-96UgFqchNuOcYSXfml6olQ-1; Wed, 09 Jun 2021 09:02:12 -0400
X-MC-Unique: 96UgFqchNuOcYSXfml6olQ-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A6937801B1F;
 Wed,  9 Jun 2021 13:02:11 +0000 (UTC)
Received: from redhat.com (ovpn-114-230.ams2.redhat.com [10.36.114.230])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 0FDEC18A9E;
 Wed,  9 Jun 2021 13:02:08 +0000 (UTC)
Date: Wed, 9 Jun 2021 15:02:07 +0200
From: Kevin Wolf <kwolf@redhat.com>
To: Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [PATCH v2] async: the main AioContext is only "current" if under
 the BQL
Message-ID: <YMC7z/86LurXvAQ6@redhat.com>
References: <20210609122234.544153-1-pbonzini@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210609122234.544153-1-pbonzini@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kwolf@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.199,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: eesposit@redhat.com, vsementsov@virtuozzo.com, stefanha@redhat.com,
 qemu-devel@nongnu.org, qemu-block@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Am 09.06.2021 um 14:22 hat Paolo Bonzini geschrieben:
> If we want to wake up a coroutine from a worker thread, aio_co_wake()
> currently does not work.  In that scenario, aio_co_wake() calls
> aio_co_enter(), but there is no current AioContext and therefore
> qemu_get_current_aio_context() returns the main thread.  aio_co_wake()
> then attempts to call aio_context_acquire() instead of going through
> aio_co_schedule().
> 
> The default case of qemu_get_current_aio_context() was added to cover
> synchronous I/O started from the vCPU thread, but the main and vCPU
> threads are quite different.  The main thread is an I/O thread itself,
> only running a more complicated event loop; the vCPU thread instead
> is essentially a worker thread that occasionally calls
> qemu_mutex_lock_iothread().  It is only in those critical sections
> that it acts as if it were the home thread of the main AioContext.
> 
> Therefore, this patch detaches qemu_get_current_aio_context() from
> iothreads, which is a useless complication.  The AioContext pointer
> is stored directly in the thread-local variable, including for the
> main loop.  Worker threads (including vCPU threads) optionally behave
> as temporary home threads if they have taken the big QEMU lock,
> but if that is not the case they will always schedule coroutines
> on remote threads via aio_co_schedule().
> 
> With this change, qemu_mutex_iothread_locked() must be changed from
> true to false.  The previous value of true was needed because the
> main thread did not have an AioContext in the thread-local variable,
> but now it does have one.
> 
> Reported-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>

The commit message doesn't specify, but in the buggy case, are we
talking about calling aio_co_wake() for a coroutine in the main context
specifically, right? Could we have a unit test for this scenario?

But the change looks reasonable to me.

Kevin


