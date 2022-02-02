Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DACF64A7058
	for <lists+qemu-devel@lfdr.de>; Wed,  2 Feb 2022 12:54:08 +0100 (CET)
Received: from localhost ([::1]:57830 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nFED7-0002Ka-MX
	for lists+qemu-devel@lfdr.de; Wed, 02 Feb 2022 06:54:06 -0500
Received: from eggs.gnu.org ([209.51.188.92]:42740)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <f.ebner@proxmox.com>)
 id 1nFE9J-0001Lv-P6; Wed, 02 Feb 2022 06:50:09 -0500
Received: from proxmox-new.maurer-it.com ([94.136.29.106]:5114)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <f.ebner@proxmox.com>)
 id 1nFE9D-0001a0-Kn; Wed, 02 Feb 2022 06:50:05 -0500
Received: from proxmox-new.maurer-it.com (localhost.localdomain [127.0.0.1])
 by proxmox-new.maurer-it.com (Proxmox) with ESMTP id 6B1D540AB8;
 Wed,  2 Feb 2022 12:49:50 +0100 (CET)
Message-ID: <8e8b69e4-a178-aff1-4de3-e697b942f3b3@proxmox.com>
Date: Wed, 2 Feb 2022 12:49:36 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PULL 18/20] block/nbd: drop connection_co
Content-Language: en-US
To: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
References: <20210927215545.3930309-1-eblake@redhat.com>
 <20210927215545.3930309-19-eblake@redhat.com>
From: Fabian Ebner <f.ebner@proxmox.com>
In-Reply-To: <20210927215545.3930309-19-eblake@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=94.136.29.106; envelope-from=f.ebner@proxmox.com;
 helo=proxmox-new.maurer-it.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: Kevin Wolf <kwolf@redhat.com>,
 "open list:Network Block Dev..." <qemu-block@nongnu.org>,
 qemu-devel@nongnu.org, Hanna Reitz <hreitz@redhat.com>,
 Eric Blake <eblake@redhat.com>, Thomas Lamprecht <t.lamprecht@proxmox.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Am 27.09.21 um 23:55 schrieb Eric Blake:
> From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
> 
> OK, that's a big rewrite of the logic.
> 
> Pre-patch we have an always running coroutine - connection_co. It does
> reply receiving and reconnecting. And it leads to a lot of difficult
> and unobvious code around drained sections and context switch. We also
> abuse bs->in_flight counter which is increased for connection_co and
> temporary decreased in points where we want to allow drained section to
> begin. One of these place is in another file: in nbd_read_eof() in
> nbd/client.c.
> 
> We also cancel reconnect and requests waiting for reconnect on drained
> begin which is not correct. And this patch fixes that.
> 
> Let's finally drop this always running coroutine and go another way:
> do both reconnect and receiving in request coroutines.
>

Hi,

while updating our stack to 6.2, one of our live-migration tests stopped
working (backtrace is below) and bisecting led me to this patch.

The VM has a single qcow2 disk (converting to raw doesn't make a
difference) and the issue only appears when using iothread (for both
virtio-scsi-pci and virtio-block-pci).

Reverting 1af7737871fb3b66036f5e520acb0a98fc2605f7 (which lives on top)
and 4ddb5d2fde6f22b2cf65f314107e890a7ca14fcf (the commit corresponding
to this patch) in v6.2.0 makes the migration work again.

Backtrace:

Thread 1 (Thread 0x7f9d93458fc0 (LWP 56711) "kvm"):
#0  __GI_raise (sig=sig@entry=6) at ../sysdeps/unix/sysv/linux/raise.c:50
#1  0x00007f9d9d6bc537 in __GI_abort () at abort.c:79
#2  0x00007f9d9d6bc40f in __assert_fail_base (fmt=0x7f9d9d825128
"%s%s%s:%u: %s%sAssertion `%s' failed.\n%n", assertion=0x5579153763f8
"qemu_get_current_aio_context() == qemu_coroutine_get_aio_context(co)",
file=0x5579153764f9 "../io/channel.c", line=483, function=<optimized
out>) at assert.c:92
#3  0x00007f9d9d6cb662 in __GI___assert_fail
(assertion=assertion@entry=0x5579153763f8
"qemu_get_current_aio_context() == qemu_coroutine_get_aio_context(co)",
file=file@entry=0x5579153764f9 "../io/channel.c", line=line@entry=483,
function=function@entry=0x557915376570 <__PRETTY_FUNCTION__.2>
"qio_channel_restart_read") at assert.c:101
#4  0x00005579150c351c in qio_channel_restart_read (opaque=<optimized
out>) at ../io/channel.c:483
#5  qio_channel_restart_read (opaque=<optimized out>) at ../io/channel.c:477
#6  0x000055791520182a in aio_dispatch_handler
(ctx=ctx@entry=0x557916908c60, node=0x7f9d8400f800) at
../util/aio-posix.c:329
#7  0x0000557915201f62 in aio_dispatch_handlers (ctx=0x557916908c60) at
../util/aio-posix.c:372
#8  aio_dispatch (ctx=0x557916908c60) at ../util/aio-posix.c:382
#9  0x00005579151ea74e in aio_ctx_dispatch (source=<optimized out>,
callback=<optimized out>, user_data=<optimized out>) at ../util/async.c:311
#10 0x00007f9d9e647e6b in g_main_context_dispatch () from
/lib/x86_64-linux-gnu/libglib-2.0.so.0
#11 0x0000557915203030 in glib_pollfds_poll () at ../util/main-loop.c:232
#12 os_host_main_loop_wait (timeout=992816) at ../util/main-loop.c:255
#13 main_loop_wait (nonblocking=nonblocking@entry=0) at
../util/main-loop.c:531
#14 0x00005579150539c1 in qemu_main_loop () at ../softmmu/runstate.c:726
#15 0x0000557914ce8ebe in main (argc=<optimized out>, argv=<optimized
out>, envp=<optimized out>) at ../softmmu/main.c:50



