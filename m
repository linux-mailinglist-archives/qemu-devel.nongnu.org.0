Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1963A4A80A5
	for <lists+qemu-devel@lfdr.de>; Thu,  3 Feb 2022 09:53:47 +0100 (CET)
Received: from localhost ([::1]:41956 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nFXs9-0005Me-LT
	for lists+qemu-devel@lfdr.de; Thu, 03 Feb 2022 03:53:45 -0500
Received: from eggs.gnu.org ([209.51.188.92]:59276)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <f.ebner@proxmox.com>)
 id 1nFXoP-0003aN-Az; Thu, 03 Feb 2022 03:49:55 -0500
Received: from proxmox-new.maurer-it.com ([94.136.29.106]:25601)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <f.ebner@proxmox.com>)
 id 1nFXoK-0003cv-OF; Thu, 03 Feb 2022 03:49:52 -0500
Received: from proxmox-new.maurer-it.com (localhost.localdomain [127.0.0.1])
 by proxmox-new.maurer-it.com (Proxmox) with ESMTP id 2971B441C0;
 Thu,  3 Feb 2022 09:49:25 +0100 (CET)
Message-ID: <24e9c8ff-09ff-480a-d17c-e9301f229d48@proxmox.com>
Date: Thu, 3 Feb 2022 09:49:16 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PULL 18/20] block/nbd: drop connection_co
Content-Language: en-US
To: Hanna Reitz <hreitz@redhat.com>, Eric Blake <eblake@redhat.com>
References: <20210927215545.3930309-1-eblake@redhat.com>
 <20210927215545.3930309-19-eblake@redhat.com>
 <8e8b69e4-a178-aff1-4de3-e697b942f3b3@proxmox.com>
 <20220202135353.dau24mip4zwib47z@redhat.com>
 <f041ee3b-e910-9fa1-a5ff-45ed38b6967f@redhat.com>
From: Fabian Ebner <f.ebner@proxmox.com>
In-Reply-To: <f041ee3b-e910-9fa1-a5ff-45ed38b6967f@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
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
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>, qemu-devel@nongnu.org,
 "open list:Network Block Dev..." <qemu-block@nongnu.org>,
 Thomas Lamprecht <t.lamprecht@proxmox.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Am 02.02.22 um 15:21 schrieb Hanna Reitz:
> On 02.02.22 14:53, Eric Blake wrote:
>> On Wed, Feb 02, 2022 at 12:49:36PM +0100, Fabian Ebner wrote:
>>> Am 27.09.21 um 23:55 schrieb Eric Blake:
>>>> From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
>>>>
>>>> OK, that's a big rewrite of the logic.
>>>>
>>>> Pre-patch we have an always running coroutine - connection_co. It does
>>>> reply receiving and reconnecting. And it leads to a lot of difficult
>>>> and unobvious code around drained sections and context switch. We also
>>>> abuse bs->in_flight counter which is increased for connection_co and
>>>> temporary decreased in points where we want to allow drained section to
>>>> begin. One of these place is in another file: in nbd_read_eof() in
>>>> nbd/client.c.
>>>>
>>>> We also cancel reconnect and requests waiting for reconnect on drained
>>>> begin which is not correct. And this patch fixes that.
>>>>
>>>> Let's finally drop this always running coroutine and go another way:
>>>> do both reconnect and receiving in request coroutines.
>>>>
>>> Hi,
>>>
>>> while updating our stack to 6.2, one of our live-migration tests stopped
>>> working (backtrace is below) and bisecting led me to this patch.
>>>
>>> The VM has a single qcow2 disk (converting to raw doesn't make a
>>> difference) and the issue only appears when using iothread (for both
>>> virtio-scsi-pci and virtio-block-pci).
>>>
>>> Reverting 1af7737871fb3b66036f5e520acb0a98fc2605f7 (which lives on top)
>>> and 4ddb5d2fde6f22b2cf65f314107e890a7ca14fcf (the commit corresponding
>>> to this patch) in v6.2.0 makes the migration work again.
>>>
>>> Backtrace:
>>>
>>> Thread 1 (Thread 0x7f9d93458fc0 (LWP 56711) "kvm"):
>>> #0  __GI_raise (sig=sig@entry=6) at
>>> ../sysdeps/unix/sysv/linux/raise.c:50
>>> #1  0x00007f9d9d6bc537 in __GI_abort () at abort.c:79
>>> #2  0x00007f9d9d6bc40f in __assert_fail_base (fmt=0x7f9d9d825128
>>> "%s%s%s:%u: %s%sAssertion `%s' failed.\n%n", assertion=0x5579153763f8
>>> "qemu_get_current_aio_context() == qemu_coroutine_get_aio_context(co)",
>>> file=0x5579153764f9 "../io/channel.c", line=483, function=<optimized
>>> out>) at assert.c:92
>> Given that this assertion is about which aio context is set, I wonder
>> if the conversation at
>> https://lists.gnu.org/archive/html/qemu-devel/2022-02/msg00096.html is
>> relevant; if so, Vladimir may already be working on the patch.
> 
> It should be exactly that patch:
> 
> https://lists.gnu.org/archive/html/qemu-devel/2022-01/msg06222.html
> 
> (From the discussion it appears that for v1 I need to ensure the
> reconnection timer is deleted immediately once reconnecting succeeds,
> and then that should be good to move out of the RFC state.)

Thanks for the quick responses and happy to hear you're already working
on it! With the RFC, the issue is gone for me.

> 
> Basically, I expect qemu to crash every time that you try to use an NBD
> block device in an I/O thread (unless you don’t do any I/O), for example
> this is the simplest reproducer I know of:
> 
> $ qemu-nbd --fork -k /tmp/nbd.sock -f raw null-co://
> 
> $ qemu-system-x86_64 \
>     -object iothread,id=iothr0 \
>     -device virtio-scsi,id=vscsi,iothread=iothr0 \
>     -blockdev '{
>         "driver": "nbd",
>         "node-name": "nbd",
>         "server": {
>             "type": "unix",
>             "path": "/tmp/nbd.sock"
>         } }' \
>     -device scsi-hd,bus=vscsi.0,drive=nbd
> qemu-system-x86_64: ../qemu-6.2.0/io/channel.c:483:
> qio_channel_restart_read: Assertion `qemu_get_current_aio_context() ==
> qemu_coroutine_get_aio_context(co)' failed.
> qemu-nbd: Disconnect client, due to: Unable to read from socket:
> Connection reset by peer
> [1]    108747 abort (core dumped)  qemu-system-x86_64 -object
> iothread,id=iothr0 -device  -blockdev  -device
> 
> 

Interestingly, the reproducer didn't crash the very first time I tried
it. I did get the same error after ^C-ing though, and on subsequent
tries it mostly crashed immediately, but very occasionally it didn't.


