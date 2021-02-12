Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DE2AF31A091
	for <lists+qemu-devel@lfdr.de>; Fri, 12 Feb 2021 15:24:44 +0100 (CET)
Received: from localhost ([::1]:44494 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lAZNE-00022x-0C
	for lists+qemu-devel@lfdr.de; Fri, 12 Feb 2021 09:24:44 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:58334)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1lAZLM-0001JD-Iq
 for qemu-devel@nongnu.org; Fri, 12 Feb 2021 09:22:48 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:29042)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1lAZLK-0002cu-Ou
 for qemu-devel@nongnu.org; Fri, 12 Feb 2021 09:22:48 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1613139766;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=xwJNsIr/uSIwW2WB9MUqBcYvfhMpQ7ByBvCYDUmHjY8=;
 b=NzJDvvxKI6FMKj1sK9SdkL+M7WjzDvIwMZ+HZdvhYyCwq3iiVX3lCB+PPpiEqbsrepafyr
 kd/hRIp3nfGrN3JnvNuFeoxcitjYSHBA192ufeccRhGLPnSHZICiqcIatwXLVXH/uGv2oK
 H8NKL73mTHAkEKYqoiTujLsaVvellW4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-4-_0-CNUXVPjuM4XBrURqDVw-1; Fri, 12 Feb 2021 09:22:44 -0500
X-MC-Unique: _0-CNUXVPjuM4XBrURqDVw-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 2E6E56D4F0;
 Fri, 12 Feb 2021 14:22:43 +0000 (UTC)
Received: from merkur.fritz.box (ovpn-112-163.ams2.redhat.com [10.36.112.163])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 0B352772E0;
 Fri, 12 Feb 2021 14:22:41 +0000 (UTC)
Date: Fri, 12 Feb 2021 15:22:40 +0100
From: Kevin Wolf <kwolf@redhat.com>
To: Markus Armbruster <armbru@redhat.com>
Subject: Re: [PATCH] monitor: Fix order in monitor_cleanup()
Message-ID: <20210212142240.GI6221@merkur.fritz.box>
References: <20201013125027.41003-1-kwolf@redhat.com>
 <878sc8yba7.fsf@linaro.org>
 <20201015074613.GA4610@merkur.fritz.box>
 <87lfg2zi72.fsf@dusky.pond.sub.org>
 <87bld7ucor.fsf@dusky.pond.sub.org>
MIME-Version: 1.0
In-Reply-To: <87bld7ucor.fsf@dusky.pond.sub.org>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kwolf@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -33
X-Spam_score: -3.4
X-Spam_bar: ---
X-Spam_report: (-3.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.569,
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
Cc: Alex =?iso-8859-1?Q?Benn=E9e?= <alex.bennee@linaro.org>, f4bug@amsat.org,
 qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Am 29.01.2021 um 13:53 hat Markus Armbruster geschrieben:
> I ran into odd behavior the other day, and bisected it to this commit.
> 
>     $ qemu-system-x86_64 -display none -chardev socket,id=qmp,path=test-qmp,server=on,wait=off -mon mode=control,chardev=qmp
> 
> In another terminal, create a bunch of FIFOs, then use them to have some
> in-band commands block, with out-of-band commands interleaved just
> because:
> 
>     $ for ((i=0; i<20; i++)); do mkfifo fifo$i; done
>     $ cat oob-test2
>     {"execute": "qmp_capabilities", "arguments": {"enable": ["oob"]}}
>     {"exec-oob": "migrate-pause", "id": 0}
>     {"execute": "memsave", "id": 1, "arguments": {"val": 0, "size": 4096, "filename": "fifo1"}}
>     {"exec-oob": "migrate-pause", "id": 2}
>     {"execute": "memsave", "id": 3, "arguments": {"val": 0, "size": 4096, "filename": "fifo3"}}
>     {"exec-oob": "migrate-pause", "id": 4}
>     {"execute": "memsave", "id": 5, "arguments": {"val": 0, "size": 4096, "filename": "fifo5"}}
>     {"exec-oob": "migrate-pause", "id": 6}
>     {"execute": "memsave", "id": 7, "arguments": {"val": 0, "size": 4096, "filename": "fifo7"}}
>     {"exec-oob": "migrate-pause", "id": 8}
>     {"execute": "memsave", "id": 9, "arguments": {"val": 0, "size": 4096, "filename": "fifo9"}}
>     {"exec-oob": "migrate-pause", "id": 10}
>     {"execute": "memsave", "id": 11, "arguments": {"val": 0, "size": 4096, "filename": "fifo11"}}
>     {"exec-oob": "migrate-pause", "id": 12}
>     {"execute": "memsave", "id": 13, "arguments": {"val": 0, "size": 4096, "filename": "fifo13"}}
>     {"exec-oob": "migrate-pause", "id": 14}
>     {"execute": "memsave", "id": 15, "arguments": {"val": 0, "size": 4096, "filename": "fifo15"}}
>     {"exec-oob": "migrate-pause", "id": 16}
>     {"execute": "memsave", "id": 17, "arguments": {"val": 0, "size": 4096, "filename": "fifo17"}}
>     {"exec-oob": "migrate-pause", "id": 18}
>     {"execute": "memsave", "id": 19, "arguments": {"val": 0, "size": 4096, "filename": "fifo19"}}
>     {"exec-oob": "migrate-pause", "id": 20}
>     $ socat -t99999 STDIO UNIX-CONNECT:$HOME/work/images/test-qmp <oob-test2
>     {"QMP": {"version": {"qemu": {"micro": 50, "minor": 1, "major": 5}, "package": "v5.1.0-2224-g8db1efd3f3"}, "capabilities": ["oob"]}}
>     {"return": {}}
>     {"id": 0, "error": {"class": "GenericError", "desc": "migrate-pause is currently only supported during postcopy-active state"}}
>     {"id": 2, "error": {"class": "GenericError", "desc": "migrate-pause is currently only supported during postcopy-active state"}}
>     {"id": 4, "error": {"class": "GenericError", "desc": "migrate-pause is currently only supported during postcopy-active state"}}
>     {"id": 6, "error": {"class": "GenericError", "desc": "migrate-pause is currently only supported during postcopy-active state"}}
>     {"id": 8, "error": {"class": "GenericError", "desc": "migrate-pause is currently only supported during postcopy-active state"}}
>     {"id": 10, "error": {"class": "GenericError", "desc": "migrate-pause is currently only supported during postcopy-active state"}}
>     {"id": 12, "error": {"class": "GenericError", "desc": "migrate-pause is currently only supported during postcopy-active state"}}
>     {"id": 14, "error": {"class": "GenericError", "desc": "migrate-pause is currently only supported during postcopy-active state"}}
>     {"id": 16, "error": {"class": "GenericError", "desc": "migrate-pause is currently only supported during postcopy-active state"}}
> 
> Looking good: the out-of-band commands jump the queue until the queue is
> too full for jumping.
> 
> Now go back to the first terminal, and hit C-c.
> 
> Before this commit, the second terminal shows the shutdown event
> 
>     {"timestamp": {"seconds": 1611923623, "microseconds": 528169}, "event": "SHUTDOWN", "data": {"guest": false, "reason": "host-signal"}}
> 
> and the first terminal shows
> 
>     ^Cqemu-system-x86_64: terminating on signal 2
> 
> QEMU terminates with exit status 0.  Good (except for the exit status,
> but let's ignore that).
> 
> After the commit, the second terminal additionally shows the error reply
> for (in-band) command 1
> 
>     {"id": 1, "error": {"class": "GenericError", "desc": "Could not open 'fifo1': Interrupted system call"}}
>     {"timestamp": {"seconds": 1611923812, "microseconds": 520891}, "event": "SHUTDOWN", "data": {"guest": false, "reason": "host-signal"}}
> 
> and the first terminal still shows
> 
>     ^Cqemu-system-x86_64: terminating on signal 2
> 
> However, QEMU does *not* terminate.  When I hit C-c again, the second
> terminal gives me the next in-band reply
> 
>     {"id": 3, "error": {"class": "GenericError", "desc": "Could not open 'fifo3': Interrupted system call"}}
> 
> and the first one another
> 
>     ^C
> 
> Hitting C-c some more gives me more in-band replies and more ^C.

The problem is that monitor_qmp_dispatcher_co() doesn't check whether it
should shut down unless it would have to wait for a new request.

So 'memsave' tries to open the FIFO, this blocks and ^C results in EINTR
for the open(), which makes the 'memsave' command fail. Then
monitor_qmp_dispatcher_co() tries to execute the rest of the queued
commands, i.e. the next 'memsave' that will hang in the same way.

Fixing this is easy enough:

diff --git a/monitor/qmp.c b/monitor/qmp.c
index 43880fa623..46939537b4 100644
--- a/monitor/qmp.c
+++ b/monitor/qmp.c
@@ -227,6 +227,10 @@ void coroutine_fn monitor_qmp_dispatcher_co(void *data)
          */
         qatomic_mb_set(&qmp_dispatcher_co_busy, false);

+        if (qmp_dispatcher_co_shutdown) {
+            return;
+        }
+
         while (!(req_obj = monitor_qmp_requests_pop_any_with_lock())) {
             /*
              * No more requests to process.  Wait to be reentered from

> The ninth C-c gives me the error reply for (in-band) command 17, and a crash:
> 
> Terminal 1 now shows
> 
>     ^Cqemu-system-x86_64-qemu: terminating on signal 2
>     ^C^C^C^C^C^C^C^Cqemu-system-x86_64-qemu: ../util/async.c:343: aio_ctx_finalize: Assertion `flags & BH_DELETED' failed.
>     Aborted (core dumped)

So all of this happens inside of monitor_cleanup(), while waiting for
monitor_qmp_dispatcher_co() to shut down:

    AIO_WAIT_WHILE(qemu_get_aio_context(),
                   (aio_poll(iohandler_get_aio_context(), false),
                    qatomic_mb_read(&qmp_dispatcher_co_busy)));

Importantly, this is _after_ calling iothread_stop(), which made sure
that all pending BHs in the monitor iothread are executed.

What now happens is that monitor_qmp_dispatcher_co() wants to resume
the monitor. This schedules a new BH on the iothread, which was already
supposed to be inactive.

When finally all requests are handled and monitor_cleanup() continues
after the polling loop and calls iothread_destroy(), we notice that
there is a pending BH where there shouldn't be any and abort.

I think this means that the commit should have moved even the
iothread_stop() call to below the polling loop. I can't reproduce the
problem any more with the fix above, but I think the current order in
monitor_cleanup() is still a (possibly latent) bug.

So why did all of that work before 357bda95?

If the old code didn't crash as described in the commit message, it
would just free all kinds of monitor resources while the coroutine was
still running. This includes removing all pending requests from the
queue. I guess this is what accidentally made it "work" previously.

Kevin


