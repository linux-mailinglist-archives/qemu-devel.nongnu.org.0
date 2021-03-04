Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E74D632DE19
	for <lists+qemu-devel@lfdr.de>; Fri,  5 Mar 2021 00:54:12 +0100 (CET)
Received: from localhost ([::1]:56836 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lHxnH-0007ds-GD
	for lists+qemu-devel@lfdr.de; Thu, 04 Mar 2021 18:54:11 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:43974)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1lHxmU-00079u-RR
 for qemu-devel@nongnu.org; Thu, 04 Mar 2021 18:53:22 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:54602)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1lHxmS-0000up-8b
 for qemu-devel@nongnu.org; Thu, 04 Mar 2021 18:53:22 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1614901998;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=l/UNSJOJTIJNZW6B/XjZaQrmu8xeb1BidUdLL1CoNek=;
 b=SUW/7BvIqPNqqmn5yg/s0w0l3sLG7ZJRcWA7PyFy7cpMrKfHMWBc+E0FMktRatOuhgzGgF
 PzG1O2G50s4eA3SzHn5i9YOCDM6/8+Wl39ROb6jnRwC/aGFZJukm5JPYB1LGeW3gyHyANk
 dkIiJK2/Bjmh+5pkgTDHhCpp/p8+LlQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-502-WEGDAxBuPLKBJMegi8nmHA-1; Thu, 04 Mar 2021 18:53:16 -0500
X-MC-Unique: WEGDAxBuPLKBJMegi8nmHA-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id EBD8226866;
 Thu,  4 Mar 2021 23:53:14 +0000 (UTC)
Received: from [10.10.118.103] (ovpn-118-103.rdu2.redhat.com [10.10.118.103])
 by smtp.corp.redhat.com (Postfix) with ESMTP id CC38D5B4A9;
 Thu,  4 Mar 2021 23:53:13 +0000 (UTC)
Subject: Re: [RESEND][BUG FIX HELP] QEMU main thread endlessly hangs in
 __ppoll()
To: Like Xu <like.xu@linux.intel.com>,
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 qemu-block@nongnu.org
References: <e1087f41-9bb2-6641-a642-94ffc8b20b38@linux.intel.com>
From: John Snow <jsnow@redhat.com>
Message-ID: <06dec6f0-d720-ce7b-8485-8be1954418bb@redhat.com>
Date: Thu, 4 Mar 2021 18:53:13 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <e1087f41-9bb2-6641-a642-94ffc8b20b38@linux.intel.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jsnow@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
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
Cc: Kevin Wolf <kwolf@redhat.com>,
 "Thomas Huth \(S390-ccw/CHRP/qtest/GitLab\)" <thuth@redhat.com>,
 vsementsov@virtuozzo.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2/28/21 9:39 PM, Like Xu wrote:
> Hi Genius,
> 
> I am a user of QEMU v4.2.0 and stuck in an interesting bug, which may 
> still exist in the mainline.
> Thanks in advance to heroes who can take a look and share understanding.
> 

Do you have a test case that reproduces on 5.2? It'd be nice to know if 
it was still a problem in the latest source tree or not.

--js

> The qemu main thread endlessly hangs in the handle of the qmp statement:
> {'execute': 'human-monitor-command', 'arguments':{ 'command-line': 
> 'drive_del replication0' } }
> and we have the call trace looks like:
> 
> #0 0x00007f3c22045bf6 in __ppoll (fds=0x555611328410, nfds=1, 
> timeout=<optimized out>, timeout@entry=0x7ffc56c66db0,
> sigmask=sigmask@entry=0x0) at ../sysdeps/unix/sysv/linux/ppoll.c:44
> #1 0x000055561021f415 in ppoll (__ss=0x0, __timeout=0x7ffc56c66db0, 
> __nfds=<optimized out>, __fds=<optimized out>)
> at /usr/include/x86_64-linux-gnu/bits/poll2.h:77
> #2 qemu_poll_ns (fds=<optimized out>, nfds=<optimized out>, 
> timeout=<optimized out>) at util/qemu-timer.c:348
> #3 0x0000555610221430 in aio_poll (ctx=ctx@entry=0x5556113010f0, 
> blocking=blocking@entry=true) at util/aio-posix.c:669
> #4 0x000055561019268d in bdrv_do_drained_begin (poll=true, 
> ignore_bds_parents=false, parent=0x0, recursive=false,
> bs=0x55561138b0a0) at block/io.c:430
> #5 bdrv_do_drained_begin (bs=0x55561138b0a0, recursive=<optimized out>, 
> parent=0x0, ignore_bds_parents=<optimized out>,
> poll=<optimized out>) at block/io.c:396
> #6 0x000055561017b60b in quorum_del_child (bs=0x55561138b0a0, 
> child=0x7f36dc0ce380, errp=<optimized out>)
> at block/quorum.c:1063
> #7 0x000055560ff5836b in qmp_x_blockdev_change (parent=0x555612373120 
> "colo-disk0", has_child=<optimized out>,
> child=0x5556112df3e0 "children.1", has_node=<optimized out>, node=0x0, 
> errp=0x7ffc56c66f98) at blockdev.c:4494
> #8 0x00005556100f8f57 in qmp_marshal_x_blockdev_change (args=<optimized 
> out>, ret=<optimized out>, errp=0x7ffc56c67018)
> at qapi/qapi-commands-block-core.c:1538
> #9 0x00005556101d8290 in do_qmp_dispatch (errp=0x7ffc56c67010, 
> allow_oob=<optimized out>, request=<optimized out>,
> cmds=0x5556109c69a0 <qmp_commands>) at qapi/qmp-dispatch.c:132
> #10 qmp_dispatch (cmds=0x5556109c69a0 <qmp_commands>, request=<optimized 
> out>, allow_oob=<optimized out>)
> at qapi/qmp-dispatch.c:175
> #11 0x00005556100d4c4d in monitor_qmp_dispatch (mon=0x5556113a6f40, 
> req=<optimized out>) at monitor/qmp.c:145
> #12 0x00005556100d5437 in monitor_qmp_bh_dispatcher (data=<optimized 
> out>) at monitor/qmp.c:234
> #13 0x000055561021dbec in aio_bh_call (bh=0x5556112164bGrateful0) at 
> util/async.c:117
> #14 aio_bh_poll (ctx=ctx@entry=0x5556112151b0) at util/async.c:117
> #15 0x00005556102212c4 in aio_dispatch (ctx=0x5556112151b0) at 
> util/aio-posix.c:459
> #16 0x000055561021dab2 in aio_ctx_dispatch (source=<optimized out>, 
> callback=<optimized out>, user_data=<optimized out>)
> at util/async.c:260
> #17 0x00007f3c22302fbd in g_main_context_dispatch () from 
> /lib/x86_64-linux-gnu/libglib-2.0.so.0
> #18 0x0000555610220358 in glib_pollfds_poll () at util/main-loop.c:219
> #19 os_host_main_loop_wait (timeout=<optimized out>) at 
> util/main-loop.c:242
> #20 main_loop_wait (nonblocking=<optimized out>) at util/main-loop.c:518
> #21 0x000055560ff600fe in main_loop () at vl.c:1814
> #22 0x000055560fddbce9 in main (argc=<optimized out>, argv=<optimized 
> out>, envp=<optimized out>) at vl.c:4503
> 
> We found that we're doing endless check in the line of 
> block/io.c:bdrv_do_drained_begin():
>      BDRV_POLL_WHILE(bs, bdrv_drain_poll_top_level(bs, recursive, parent));
> and it turns out that the bdrv_drain_poll() always get true from:
> - bdrv_parent_drained_poll(bs, ignore_parent, ignore_bds_parents)
> - AND atomic_read(&bs->in_flight)
> 
> I personally think this is a deadlock issue in the a QEMU block layer
> (as we know, we have some #FIXME comments in related codes, such as 
> block permisson update).
> Any comments are welcome and appreciated.
> 
> ---
> thx,likexu
> 


