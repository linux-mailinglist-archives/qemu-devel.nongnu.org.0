Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BAA1C308931
	for <lists+qemu-devel@lfdr.de>; Fri, 29 Jan 2021 13:54:48 +0100 (CET)
Received: from localhost ([::1]:35212 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l5TIV-0003LR-8k
	for lists+qemu-devel@lfdr.de; Fri, 29 Jan 2021 07:54:47 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:52128)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1l5THL-0002uZ-Pk
 for qemu-devel@nongnu.org; Fri, 29 Jan 2021 07:53:35 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:39010)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1l5THH-00049Z-Tk
 for qemu-devel@nongnu.org; Fri, 29 Jan 2021 07:53:35 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1611924809;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=QfykKEqPIKxjqsUQi6JOoYW0Ziabtp1FNZUYY10+t/0=;
 b=Y92Y8tuYEOMGDdK2TGJ7so0JNDSc3O9ml3+vqmdTBG/wlgK73/XGDp0nQg448Ru6xdOg8/
 3jRuqgPqF7vidrnZhZcUtrDh9qTigZSlVjgnS7nG4lPOkQ9lY+kukZ6dPQ9DpVK+5iH/xi
 7vs+3lBusOi4xMwkUlACywo3HODwjuY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-288-UrxLQYqjPYuFvUhWjrHm0Q-1; Fri, 29 Jan 2021 07:53:27 -0500
X-MC-Unique: UrxLQYqjPYuFvUhWjrHm0Q-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B7E4D63CCB;
 Fri, 29 Jan 2021 12:53:26 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-115-51.ams2.redhat.com
 [10.36.115.51])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 472D662688;
 Fri, 29 Jan 2021 12:53:26 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id A12FC113865F; Fri, 29 Jan 2021 13:53:24 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: Kevin Wolf <kwolf@redhat.com>
Subject: Re: [PATCH] monitor: Fix order in monitor_cleanup()
References: <20201013125027.41003-1-kwolf@redhat.com>
 <878sc8yba7.fsf@linaro.org> <20201015074613.GA4610@merkur.fritz.box>
 <87lfg2zi72.fsf@dusky.pond.sub.org>
Date: Fri, 29 Jan 2021 13:53:24 +0100
In-Reply-To: <87lfg2zi72.fsf@dusky.pond.sub.org> (Markus Armbruster's message
 of "Mon, 19 Oct 2020 11:19:29 +0200")
Message-ID: <87bld7ucor.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
Received-SPF: pass client-ip=63.128.21.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.249,
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
Cc: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>, f4bug@amsat.org,
 qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

I ran into odd behavior the other day, and bisected it to this commit.

    $ qemu-system-x86_64 -display none -chardev socket,id=qmp,path=test-qmp,server=on,wait=off -mon mode=control,chardev=qmp

In another terminal, create a bunch of FIFOs, then use them to have some
in-band commands block, with out-of-band commands interleaved just
because:

    $ for ((i=0; i<20; i++)); do mkfifo fifo$i; done
    $ cat oob-test2
    {"execute": "qmp_capabilities", "arguments": {"enable": ["oob"]}}
    {"exec-oob": "migrate-pause", "id": 0}
    {"execute": "memsave", "id": 1, "arguments": {"val": 0, "size": 4096, "filename": "fifo1"}}
    {"exec-oob": "migrate-pause", "id": 2}
    {"execute": "memsave", "id": 3, "arguments": {"val": 0, "size": 4096, "filename": "fifo3"}}
    {"exec-oob": "migrate-pause", "id": 4}
    {"execute": "memsave", "id": 5, "arguments": {"val": 0, "size": 4096, "filename": "fifo5"}}
    {"exec-oob": "migrate-pause", "id": 6}
    {"execute": "memsave", "id": 7, "arguments": {"val": 0, "size": 4096, "filename": "fifo7"}}
    {"exec-oob": "migrate-pause", "id": 8}
    {"execute": "memsave", "id": 9, "arguments": {"val": 0, "size": 4096, "filename": "fifo9"}}
    {"exec-oob": "migrate-pause", "id": 10}
    {"execute": "memsave", "id": 11, "arguments": {"val": 0, "size": 4096, "filename": "fifo11"}}
    {"exec-oob": "migrate-pause", "id": 12}
    {"execute": "memsave", "id": 13, "arguments": {"val": 0, "size": 4096, "filename": "fifo13"}}
    {"exec-oob": "migrate-pause", "id": 14}
    {"execute": "memsave", "id": 15, "arguments": {"val": 0, "size": 4096, "filename": "fifo15"}}
    {"exec-oob": "migrate-pause", "id": 16}
    {"execute": "memsave", "id": 17, "arguments": {"val": 0, "size": 4096, "filename": "fifo17"}}
    {"exec-oob": "migrate-pause", "id": 18}
    {"execute": "memsave", "id": 19, "arguments": {"val": 0, "size": 4096, "filename": "fifo19"}}
    {"exec-oob": "migrate-pause", "id": 20}
    $ socat -t99999 STDIO UNIX-CONNECT:$HOME/work/images/test-qmp <oob-test2
    {"QMP": {"version": {"qemu": {"micro": 50, "minor": 1, "major": 5}, "package": "v5.1.0-2224-g8db1efd3f3"}, "capabilities": ["oob"]}}
    {"return": {}}
    {"id": 0, "error": {"class": "GenericError", "desc": "migrate-pause is currently only supported during postcopy-active state"}}
    {"id": 2, "error": {"class": "GenericError", "desc": "migrate-pause is currently only supported during postcopy-active state"}}
    {"id": 4, "error": {"class": "GenericError", "desc": "migrate-pause is currently only supported during postcopy-active state"}}
    {"id": 6, "error": {"class": "GenericError", "desc": "migrate-pause is currently only supported during postcopy-active state"}}
    {"id": 8, "error": {"class": "GenericError", "desc": "migrate-pause is currently only supported during postcopy-active state"}}
    {"id": 10, "error": {"class": "GenericError", "desc": "migrate-pause is currently only supported during postcopy-active state"}}
    {"id": 12, "error": {"class": "GenericError", "desc": "migrate-pause is currently only supported during postcopy-active state"}}
    {"id": 14, "error": {"class": "GenericError", "desc": "migrate-pause is currently only supported during postcopy-active state"}}
    {"id": 16, "error": {"class": "GenericError", "desc": "migrate-pause is currently only supported during postcopy-active state"}}

Looking good: the out-of-band commands jump the queue until the queue is
too full for jumping.

Now go back to the first terminal, and hit C-c.

Before this commit, the second terminal shows the shutdown event

    {"timestamp": {"seconds": 1611923623, "microseconds": 528169}, "event": "SHUTDOWN", "data": {"guest": false, "reason": "host-signal"}}

and the first terminal shows

    ^Cqemu-system-x86_64: terminating on signal 2

QEMU terminates with exit status 0.  Good (except for the exit status,
but let's ignore that).

After the commit, the second terminal additionally shows the error reply
for (in-band) command 1

    {"id": 1, "error": {"class": "GenericError", "desc": "Could not open 'fifo1': Interrupted system call"}}
    {"timestamp": {"seconds": 1611923812, "microseconds": 520891}, "event": "SHUTDOWN", "data": {"guest": false, "reason": "host-signal"}}

and the first terminal still shows

    ^Cqemu-system-x86_64: terminating on signal 2

However, QEMU does *not* terminate.  When I hit C-c again, the second
terminal gives me the next in-band reply

    {"id": 3, "error": {"class": "GenericError", "desc": "Could not open 'fifo3': Interrupted system call"}}

and the first one another

    ^C

Hitting C-c some more gives me more in-band replies and more ^C.  The
ninth C-c gives me the error reply for (in-band) command 17, and a crash:

Terminal 1 now shows

    ^Cqemu-system-x86_64-qemu: terminating on signal 2
    ^C^C^C^C^C^C^C^Cqemu-system-x86_64-qemu: ../util/async.c:343: aio_ctx_finalize: Assertion `flags & BH_DELETED' failed.
    Aborted (core dumped)

Backtrace:

    #0  0x00007f14931929e5 in raise () at /lib64/libc.so.6
    #1  0x00007f149317b895 in abort () at /lib64/libc.so.6
    #2  0x00007f149317b769 in _nl_load_domain.cold () at /lib64/libc.so.6
    #3  0x00007f149318ae76 in annobin_assert.c_end () at /lib64/libc.so.6
    #4  0x000055b3de710846 in aio_ctx_finalize (source=0x55b3e02d86c0)
        at ../util/async.c:343
    #5  0x00007f1494604d46 in g_source_unref_internal () at /lib64/libglib-2.0.so.0
    #6  0x00007f1494606b92 in g_main_context_unref () at /lib64/libglib-2.0.so.0
    #7  0x00007f1494608d59 in g_main_loop_unref () at /lib64/libglib-2.0.so.0
    #8  0x000055b3de321d14 in iothread_instance_finalize (obj=0x55b3e003f170)
        at ../iothread.c:145
    #9  0x000055b3de57bc65 in object_deinit
        (obj=0x55b3e003f170, type=0x55b3e0081220) at ../qom/object.c:671
    #10 0x000055b3de57bcd7 in object_finalize (data=0x55b3e003f170)
        at ../qom/object.c:685
    #11 0x000055b3de57cc92 in object_unref (objptr=0x55b3e003f170)
        at ../qom/object.c:1183
    #12 0x000055b3de57e277 in object_finalize_child_property
        (obj=0x55b3e02cdad0, name=0x55b3e02d36b0 "mon_iothread", opaque=0x55b3e003f170) at ../qom/object.c:1723
    #13 0x000055b3de57bb59 in object_property_del_child
        (obj=0x55b3e02cdad0, child=0x55b3e003f170) at ../qom/object.c:645
    #14 0x000055b3de57bc34 in object_unparent (obj=0x55b3e003f170)
    --Type <RET> for more, q to quit, c to continue without paging--
        at ../qom/object.c:664
    #15 0x000055b3de32240f in iothread_destroy (iothread=0x55b3e003f170)
        at ../iothread.c:369
    #16 0x000055b3de564db5 in monitor_cleanup () at ../monitor/monitor.c:670
    #17 0x000055b3de5285cc in qemu_cleanup () at ../softmmu/vl.c:4554
    #18 0x000055b3de03b28b in main
        (argc=7, argv=0x7ffc4088d4a8, envp=0x7ffc4088d4e8) at ../softmmu/main.c:51

Any ideas?


