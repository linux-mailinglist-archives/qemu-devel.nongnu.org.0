Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F35CF2FD648
	for <lists+qemu-devel@lfdr.de>; Wed, 20 Jan 2021 18:02:27 +0100 (CET)
Received: from localhost ([::1]:45886 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l2GsE-0006ac-Gv
	for lists+qemu-devel@lfdr.de; Wed, 20 Jan 2021 12:02:26 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:41766)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1l2Gob-00052W-9p
 for qemu-devel@nongnu.org; Wed, 20 Jan 2021 11:58:41 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:30648)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1l2GoZ-0001Gn-9M
 for qemu-devel@nongnu.org; Wed, 20 Jan 2021 11:58:41 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1611161918;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=TLsrm1jtcoz/igpQMemUINau9y1VGRGmpZQdTaUip0c=;
 b=GYkUGzyb/cKVKJjJeo+9OIiioHdLD6TM2rajAIqWSVXxYJ1FVNdwabPn+s+l/GvYUKzMcG
 gjPGGelYrK6QD5m1A/6vIa1DRf0hm/8MFDBQsKnLAIc8w8R3AinHE5Zi40I/OJRy08T7BN
 IHVCLMh4DPoex1846W/l3NFEvMJguOY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-493-gmsG-FGWOnyYiogp7snzTw-1; Wed, 20 Jan 2021 11:58:35 -0500
X-MC-Unique: gmsG-FGWOnyYiogp7snzTw-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 73B6C8030A3
 for <qemu-devel@nongnu.org>; Wed, 20 Jan 2021 16:58:34 +0000 (UTC)
Received: from [10.3.113.116] (ovpn-113-116.phx2.redhat.com [10.3.113.116])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id E70A71042A40;
 Wed, 20 Jan 2021 16:58:31 +0000 (UTC)
To: Max Reitz <mreitz@redhat.com>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
References: <7b8155ad-0942-dc1c-f43c-bb5eb518a278@redhat.com>
From: Eric Blake <eblake@redhat.com>
Organization: Red Hat, Inc.
Subject: Re: Thread safety of coroutine-sigaltstack
Message-ID: <c6f597a0-0233-04c8-aeb3-85bf0153e294@redhat.com>
Date: Wed, 20 Jan 2021 10:58:30 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <7b8155ad-0942-dc1c-f43c-bb5eb518a278@redhat.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eblake@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=eblake@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.167,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.094, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
Cc: Kevin Wolf <kwolf@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 1/20/21 10:26 AM, Max Reitz wrote:
> Hi,
> 
> I’ve run into trouble with Vladimir’s async backup series on MacOS,
> namely that iotest 256 fails with qemu exiting because of a SIGUSR2.
> 
> Turns out this is because MacOS (-xcode) uses coroutine-sigaltstack,
> when I use this on Linux, I get the same error.
> 
> (You can find the series applied on my block branch e.g. here:
> 
> https://github.com/XanClic/qemu.git block
> )
> 
> Some debugging later I found that the problem seems to be two threads
> simultaneously creating a coroutine.  It makes sense that this case
> would appear with Vladimir’s series and iotest 256, because 256 runs two
> backup jobs in two different threads in a transaction, i.e. they’re
> launched simultaneously.  The async backup series makes backup use many
> concurrent coroutines and so by default launches 64+x coroutines when
> the backup is started.  Thus, the case of two coroutines created
> concurrently in two threads is very likely to occur.
> 
> I think the problem is in coroutine-sigaltstack’s qemu_coroutine_new().
> It sets up a SIGUSR2 handler, then changes the signal handling stack,
> then raises SIGUSR2, then reverts the signal handling stack and the
> SIGUSR2 handler.  As far as I’m aware, setting up signal handlers and
> changing the signal handling stack are both process-global operations,
> and so if two threads do so concurrently, they will interfere with each
> other.

Yes, that is absolutely correct - messing with the signal handlers is
process-wide.  I guess we've been lucky that we haven't been trying to
create coroutines in separate threads in the past.

>  What usually happens is that one thread sets up everything,
> while the other is already in the process of reverting its changes: So
> the second thread reverts the SIGUSR2 handler to the default, and then
> the first thread raises SIGUSR2, thus making qemu exit.
> 
> (Could be worse though.  Both threads could set up the sigaltstack, then
> both raise SIGUSR2, and then we get one coroutine_trampoline()
> invocation in each thread, but both would use the same stack.  But I
> don’t think I’ve ever seen that happen, presumably because the race time
> window is much shorter.)
> 
> Now, this all seems obvious to me, but I’m wondering...  If
> coroutine-sigaltstack really couldn’t create coroutines concurrently,
> why wouldn’t we have noticed before?  I mean, this new backup case is
> kind of a stress test, yes, but surely we would have seen the problem
> already, right?  That’s why I’m not sure whether my analysis is correct.

I'm not sure if there is anything else going wrong, but you have
definitely uncovered a latent problem, and I agree that a mutex is the
right way to fix it.

> 
> Anyway, I’ve attached a patch that wraps the whole SIGUSR2 handling
> section in a mutex, and that makes 256 pass reliably with Vladimir’s
> async backup series.  Besides being unsure whether the problem is really
> in coroutine-sigaltstack, I also don’t know whether getting out the big
> guns and wrapping everything in the mutex is the best solution.  So,
> it’s an RFC, I guess.
> 
> Max


>>From 08d4bb6a98fa731025683f20afe1381291d26031 Mon Sep 17 00:00:00 2001
> From: Max Reitz <mreitz@redhat.com>
> Date: Wed, 20 Jan 2021 16:59:40 +0100
> Subject: [RFC] coroutine-sigaltstack: Add SIGUSR2 mutex
> 
> Modifying signal handlers or the signal handling stack is a
> process-global operation.  When two threads run coroutine-sigaltstack's
> qemu_coroutine_new() concurrently, thay may interfere with each other,

they

> e.g.:
> 
> - One of the threads may revert the SIGUSR2 handler back to the default
>   between the other thread setting up coroutine_trampoline() as the
>   handler and raising SIGUSR2.  That SIGUSR2 will then lead to the
>   process exiting.
> 
> - Both threads may set up their coroutine stack with sigaltstack()
>   simultaneously, so that only one of them sticks.  Both then raise
>   SIGUSR2, which goes to each of the threads separately, but both signal
>   handler invocations will then use the same stack, which cannot work.
> 
> We have to ensure that only one thread at a time can modify the
> process-global SIGUSR2 handler and the signal handling stack.  To do so,
> wrap the whole section where that is done in a mutex.
> 
> Signed-off-by: Max Reitz <mreitz@redhat.com>
> ---
>  util/coroutine-sigaltstack.c | 10 ++++++++++
>  1 file changed, 10 insertions(+)

Reviewed-by: Eric Blake <eblake@redhat.com>

-- 
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3226
Virtualization:  qemu.org | libvirt.org


