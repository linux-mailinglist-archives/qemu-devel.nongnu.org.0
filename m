Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E580A2FD6DE
	for <lists+qemu-devel@lfdr.de>; Wed, 20 Jan 2021 18:28:03 +0100 (CET)
Received: from localhost ([::1]:35398 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l2HGz-00032m-R7
	for lists+qemu-devel@lfdr.de; Wed, 20 Jan 2021 12:28:01 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:48052)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lersek@redhat.com>) id 1l2HEM-0001db-QR
 for qemu-devel@nongnu.org; Wed, 20 Jan 2021 12:25:19 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:31221)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <lersek@redhat.com>) id 1l2HEI-0000oM-ED
 for qemu-devel@nongnu.org; Wed, 20 Jan 2021 12:25:17 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1611163512;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=rgZwahxCe7Xmt9M7MBV7PUGRP9PVN0JUr0fp7qMvhqo=;
 b=AaFfXf3CExjFZkzWsYX3tj3LdP/MtZ4XsDIx9AsEWaFu+C+nC2eBDEPsVPi0pBbsz9vS0B
 cmXTpOGDD4G40UkYAk2Sam1alM7jvBBiJfSMQMuPo31vSRCRSwr1re5RALeOiCiX6a0lD5
 bJpAUO6af6KVKlkaMgN8IAhYlnz+iwc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-460-mK9c42owMvGFw8udKCfK-w-1; Wed, 20 Jan 2021 12:25:08 -0500
X-MC-Unique: mK9c42owMvGFw8udKCfK-w-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id EA939806677
 for <qemu-devel@nongnu.org>; Wed, 20 Jan 2021 17:25:07 +0000 (UTC)
Received: from lacos-laptop-7.usersys.redhat.com (ovpn-112-230.ams2.redhat.com
 [10.36.112.230])
 by smtp.corp.redhat.com (Postfix) with ESMTP id CA6841002EE6;
 Wed, 20 Jan 2021 17:25:03 +0000 (UTC)
Subject: Re: Thread safety of coroutine-sigaltstack
To: Max Reitz <mreitz@redhat.com>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
References: <7b8155ad-0942-dc1c-f43c-bb5eb518a278@redhat.com>
From: Laszlo Ersek <lersek@redhat.com>
Message-ID: <445268c9-d91f-af5a-3d7e-f4c6f014ca52@redhat.com>
Date: Wed, 20 Jan 2021 18:25:02 +0100
MIME-Version: 1.0
In-Reply-To: <7b8155ad-0942-dc1c-f43c-bb5eb518a278@redhat.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=lersek@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=lersek@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.167,
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
Cc: Kevin Wolf <kwolf@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 01/20/21 17:26, Max Reitz wrote:
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

Signal action (disposition) is process-wide.

Signal mask and signal stack are thread-specific.

A signal may be pending for the whole process, or for a specific thread.
In the former case, the signal is delivered to one of the threads that
are not blocking the signal.

> What usually happens is that one thread sets up everything,
> while the other is already in the process of reverting its changes: So
> the second thread reverts the SIGUSR2 handler to the default, and then
> the first thread raises SIGUSR2, thus making qemu exit.

I agree. The way SIGUSR2 is blocked (for the thread), made pending (for
the thread), and then allowed to be delivered (consequently, to the
thread), looks OK. But by the time it is delivered, the action has been
changed.

> 
> (Could be worse though.  Both threads could set up the sigaltstack, then
> both raise SIGUSR2, and then we get one coroutine_trampoline()
> invocation in each thread, but both would use the same stack.  But I
> don’t think I’ve ever seen that happen, presumably because the race time
> window is much shorter.)

No, the "alternate stack for signal handlers" that sigaltstack()
configures is thread-specific. (I mean one could theoretically mess it
up if the stack were located in the same place between different
threads, but we call qemu_alloc_stack(), so that doesn't happen.)

https://pubs.opengroup.org/onlinepubs/9699919799/functions/sigaltstack.html

> 
> Now, this all seems obvious to me, but I’m wondering...  If
> coroutine-sigaltstack really couldn’t create coroutines concurrently,
> why wouldn’t we have noticed before?  I mean, this new backup case is
> kind of a stress test, yes, but surely we would have seen the problem
> already, right?  That’s why I’m not sure whether my analysis is correct.
> 
> Anyway, I’ve attached a patch that wraps the whole SIGUSR2 handling
> section in a mutex, and that makes 256 pass reliably with Vladimir’s
> async backup series.  Besides being unsure whether the problem is really
> in coroutine-sigaltstack, I also don’t know whether getting out the big
> guns and wrapping everything in the mutex is the best solution.  So,
> it’s an RFC, I guess.

A simple grep for SIGUSR2 seems to indicate that SIGUSR2 is not used by
system emulation for anything else, in practice. Is it possible to
dedicate SIGUSR2 explicitly to coroutine-sigaltstack, and set up the
action beforehand, from some init function that executes on a "central"
thread, before qemu_coroutine_new() is ever called?

... I've tried to see if POSIX says anything on signals being delivered
with mutexen held. I can't find anything specific (the spec seems to
talk about delivery of a signal while the thread waits in
pthread_mutex_lock(), but that's not what we care about, here). I'm just
somewhat uncomfortable with bracketing this whole hackery into a mutex
even... Keeping sigaction() out of the picture could be a small
performance benefit, too.

The logic in the patch doesn't look broken, but the comments should be
updated minimally -- the signal stack is thread-specific (similarly to
how a thread has its own stack anyway, regardless of signals).

Only my two cents of course, feel free to ignore.

Thanks
Laszlo


