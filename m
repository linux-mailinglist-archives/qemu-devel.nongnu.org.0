Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0798B493F60
	for <lists+qemu-devel@lfdr.de>; Wed, 19 Jan 2022 18:51:55 +0100 (CET)
Received: from localhost ([::1]:42090 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nAF7h-0000Xe-QN
	for lists+qemu-devel@lfdr.de; Wed, 19 Jan 2022 12:51:53 -0500
Received: from eggs.gnu.org ([209.51.188.92]:51084)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1nAF12-0004jv-IU
 for qemu-devel@nongnu.org; Wed, 19 Jan 2022 12:45:00 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:40589)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1nAF0z-0000pb-9s
 for qemu-devel@nongnu.org; Wed, 19 Jan 2022 12:44:59 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1642614294;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=19zVZjL0xH0yPlsXhjY/3s1IluMeSPH2uSS+JRW5ZjU=;
 b=cmLCgXTOLEAtCSuS3wg+iClzgB2tTnRQPh6oq6xydxLd29WYH2CwVO9JsXJp7cPqLS3/1N
 APLR+UtV3LQb9W/tbegERt1kUZAdvLx0a7NYDcL3+rfplCmMzguc8f4GNK/krdf0ofUzX3
 R/IroZUT5B3Pj8ZbNo3fRYi1cYlEG0k=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-538-QfJS1nxoOyWYjF5Izhaz1A-1; Wed, 19 Jan 2022 12:44:53 -0500
X-MC-Unique: QfJS1nxoOyWYjF5Izhaz1A-1
Received: by mail-wm1-f71.google.com with SMTP id
 n13-20020a05600c3b8d00b0034979b7e200so1536835wms.4
 for <qemu-devel@nongnu.org>; Wed, 19 Jan 2022 09:44:53 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:from:to:cc:references:in-reply-to
 :content-transfer-encoding;
 bh=19zVZjL0xH0yPlsXhjY/3s1IluMeSPH2uSS+JRW5ZjU=;
 b=sd78S6N+VU1qa3/kyBwTFIYzQnEkgZmgOkbS7W7Y7Dcd/yMUqfkFkprQZxjauAUsw8
 fY1TlUNPZyLgSVZT4TujnGBeHRue2apgKGw7tJT1BNlwpz9RuWkilw+Q4XzcruMj4fvu
 IXzH5gWT1jAdLecukHRly7BNbj4QnSjDdb/dUWs6cb6NdQwd7pvfZSTrZv+7c4cr5sFc
 +Q/JIza9qz5IReVa7LuHCUzhLpqIar0zczTrJRBrkNi/Gb+6IMl6FlW7g9Yyteuntv2W
 wM2cZbav2F5syT/ZUq6RDO7FX/QPAfuklPJItboA+ZZlKq3FOd4YJ+UaGRiRtOMQg5OK
 tllA==
X-Gm-Message-State: AOAM532KlaRWNZwBoOcKdeo4iSRoBCKFqMgchd4nzMXHCpTc5r4/F6lB
 xjPB51noldIkKrEZudaLtYf5BuePspMjYUDCHJgpU2ao+7FeHYJMK0mIWJkTUsVBXOU9FxiRTlQ
 U9kI8sqBxeovCEhg=
X-Received: by 2002:a5d:4889:: with SMTP id g9mr29405430wrq.574.1642614292304; 
 Wed, 19 Jan 2022 09:44:52 -0800 (PST)
X-Google-Smtp-Source: ABdhPJygUo2b+APWnT7jXGlw64X8aI3nT4OjDwgFuMeuolA0uQL+5gvpsrqJ8FJX13qCVxyu+AaBQw==
X-Received: by 2002:a5d:4889:: with SMTP id g9mr29405399wrq.574.1642614292021; 
 Wed, 19 Jan 2022 09:44:52 -0800 (PST)
Received: from ?IPV6:2a02:8071:5055:3f20:7ad9:a400:6d51:83e6?
 ([2a02:8071:5055:3f20:7ad9:a400:6d51:83e6])
 by smtp.gmail.com with ESMTPSA id r8sm477826wrx.2.2022.01.19.09.44.51
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 19 Jan 2022 09:44:51 -0800 (PST)
Message-ID: <de316e34-ed11-5d11-06ee-9b0f524af2d6@redhat.com>
Date: Wed, 19 Jan 2022 18:44:50 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: [PATCH v5 28/31] block.c: assert BQL lock held in
 bdrv_co_invalidate_cache
From: Hanna Reitz <hreitz@redhat.com>
To: Emanuele Giuseppe Esposito <eesposit@redhat.com>, qemu-block@nongnu.org
References: <20211124064418.3120601-1-eesposit@redhat.com>
 <20211124064418.3120601-29-eesposit@redhat.com>
 <56deaef1-6a4e-c544-9916-42a20cc20c7a@redhat.com>
 <9ca5c434-ddf6-2ed3-08ae-92da5fc98013@redhat.com>
 <b1e190b3-7466-0d4e-554b-bd9d4ce5a43e@redhat.com>
 <1cfd3189-215f-6b91-f453-2fc87f64ce2a@redhat.com>
 <9507e092-4e97-1e61-f790-caed8f44148f@redhat.com>
In-Reply-To: <9507e092-4e97-1e61-f790-caed8f44148f@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=hreitz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=hreitz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.7,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Kevin Wolf <kwolf@redhat.com>, Fam Zheng <fam@euphon.net>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, Juan Quintela <quintela@redhat.com>,
 qemu-devel@nongnu.org, John Snow <jsnow@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Markus Armbruster <armbru@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Eric Blake <eblake@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 19.01.22 16:57, Hanna Reitz wrote:
> On 23.12.21 18:11, Hanna Reitz wrote:
>> On 20.12.21 13:20, Emanuele Giuseppe Esposito wrote:
>>>
>>>
>>> On 17/12/2021 17:38, Emanuele Giuseppe Esposito wrote:
>>>>
>>>>
>>>> On 17/12/2021 12:04, Hanna Reitz wrote:
>>>>> On 24.11.21 07:44, Emanuele Giuseppe Esposito wrote:
>>>>>> bdrv_co_invalidate_cache is special: it is an I/O function,
>>>>>
>>>>> I still don’t believe it is, but well.
>>>>>
>>>>> (Yes, it is called by a test in an iothread, but I believe we’ve 
>>>>> seen that the tests simply sometimes test things that shouldn’t be 
>>>>> allowed.)
>>>>>
>>>>>> but uses the block layer permission API, which is GS.
>>>>>>
>>>>>> Because of this, we can assert that either the function is
>>>>>> being called with BQL held, and thus can use the permission API,
>>>>>> or make sure that the permission API is not used, by ensuring that
>>>>>> bs (and parents) .open_flags does not contain BDRV_O_INACTIVE.
>>>>>>
>>>>>> Signed-off-by: Emanuele Giuseppe Esposito <eesposit@redhat.com>
>>>>>> ---
>>>>>>   block.c | 26 ++++++++++++++++++++++++++
>>>>>>   1 file changed, 26 insertions(+)
>>>>>>
>>>>>> diff --git a/block.c b/block.c
>>>>>> index a0309f827d..805974676b 100644
>>>>>> --- a/block.c
>>>>>> +++ b/block.c
>>>>>> @@ -6574,6 +6574,26 @@ void bdrv_init_with_whitelist(void)
>>>>>>       bdrv_init();
>>>>>>   }
>>>>>> +static bool bdrv_is_active(BlockDriverState *bs)
>>>>>> +{
>>>>>> +    BdrvChild *parent;
>>>>>> +
>>>>>> +    if (bs->open_flags & BDRV_O_INACTIVE) {
>>>>>> +        return false;
>>>>>> +    }
>>>>>> +
>>>>>> +    QLIST_FOREACH(parent, &bs->parents, next_parent) {
>>>>>> +        if (parent->klass->parent_is_bds) {
>>>>>> +            BlockDriverState *parent_bs = parent->opaque;
>>>>>
>>>>> This looks like a really bad hack to me.  We purposefully have 
>>>>> made the parent link opaque so that a BDS cannot easily reach its 
>>>>> parents.  All accesses should go through BdrvChildClass methods.
>>>>>
>>>>> I also don’t understand why we need to query parents at all. The 
>>>>> only fact that determines whether the current BDS will have its 
>>>>> permissions changed is whether the BDS itself is active or 
>>>>> inactive.  Sure, we’ll invoke bdrv_co_invalidate_cache() on the 
>>>>> parents, too, but then we could simply let the assertion fail there.
>>>>>
>>>>>> +            if (!bdrv_is_active(parent_bs)) {
>>>>>> +                return false;
>>>>>> +            }
>>>>>> +        }
>>>>>> +    }
>>>>>> +
>>>>>> +   return true;
>>>>>> +}
>>>>>> +
>>>>>>   int coroutine_fn bdrv_co_invalidate_cache(BlockDriverState *bs, 
>>>>>> Error **errp)
>>>>>>   {
>>>>>>       BdrvChild *child, *parent;
>>>>>> @@ -6585,6 +6605,12 @@ int coroutine_fn 
>>>>>> bdrv_co_invalidate_cache(BlockDriverState *bs, Error **errp)
>>>>>>           return -ENOMEDIUM;
>>>>>>       }
>>>>>> +    /*
>>>>>> +     * No need to muck with permissions if bs is active.
>>>>>> +     * TODO: should activation be a separate function?
>>>>>> +     */
>>>>>> +    assert(qemu_in_main_thread() || bdrv_is_active(bs));
>>>>>> +
>>>>>
>>>>> I don’t understand this, really.  It looks to me like “if you 
>>>>> don’t call this in the main thread, this better be a no-op”, i.e., 
>>>>> you must never call this function in an I/O thread if you really 
>>>>> want to use it.  I.e. what I’d classify as a GS function.
>>>>>
>>>>> It sounds like this is just a special case for said test, and 
>>>>> special-casing code for tests sounds like a bad idea.
>>>>
>>>> Ok, but trying to leave just the qemu_in_main_thread() assertion 
>>>> makes test 307 (./check 307) fail.
>>>> I am actually not sure on why it fails, but I am sure it is because 
>>>> of the assertion, since without it it passes.
>>>>
>>>> I tried with gdb (./check -gdb 307 on one terminal and
>>>> gdb -iex "target remote localhost:12345"
>>>> in another) but it points me to this below, which I think is the 
>>>> ndb server getting the socket closed (because on the other side it 
>>>> crashed), and not the actual error.
>>>>
>>>>
>>>> Thread 1 "qemu-system-x86" received signal SIGPIPE, Broken pipe.
>>>> 0x00007ffff68af54d in sendmsg () from target:/lib64/libc.so.6
>>>> (gdb) bt
>>>> #0  0x00007ffff68af54d in sendmsg () from target:/lib64/libc.so.6
>>>> #1  0x0000555555c13cc9 in qio_channel_socket_writev (ioc=<optimized 
>>>> out>, iov=0x5555569a4870, niov=1, fds=0x0, nfds=<optimized out>, 
>>>> errp=0x0)
>>>>      at ../io/channel-socket.c:561
>>>> #2  0x0000555555c19b18 in qio_channel_writev_full_all 
>>>> (ioc=0x55555763b800, iov=iov@entry=0x7fffe8dffd80, 
>>>> niov=niov@entry=1, fds=fds@entry=0x0,
>>>>      nfds=nfds@entry=0, errp=errp@entry=0x0) at ../io/channel.c:240
>>>> #3  0x0000555555c19bd2 in qio_channel_writev_all (errp=0x0, niov=1, 
>>>> iov=0x7fffe8dffd80, ioc=<optimized out>) at ../io/channel.c:220
>>>> #4  qio_channel_write_all (ioc=<optimized out>, 
>>>> buf=buf@entry=0x7fffe8dffdd0 "", buflen=buflen@entry=20, 
>>>> errp=errp@entry=0x0) at ../io/channel.c:330
>>>> #5  0x0000555555c27e75 in nbd_write (errp=0x0, size=20, 
>>>> buffer=0x7fffe8dffdd0, ioc=<optimized out>) at 
>>>> ../nbd/nbd-internal.h:71
>>>> #6  nbd_negotiate_send_rep_len (client=client@entry=0x555556f60930, 
>>>> type=type@entry=1, len=len@entry=0, errp=errp@entry=0x0) at 
>>>> ../nbd/server.c:203
>>>> #7  0x0000555555c29db1 in nbd_negotiate_send_rep (errp=0x0, type=1, 
>>>> client=0x555556f60930) at ../nbd/server.c:211
>>>> --Type <RET> for more, q to quit, c to continue without paging--
>>>> #8  nbd_negotiate_options (errp=0x7fffe8dffe88, client=<optimized 
>>>> out>) at ../nbd/server.c:1224
>>>> #9  nbd_negotiate (errp=0x7fffe8dffe88, client=<optimized out>) at 
>>>> ../nbd/server.c:1340
>>>> #10 nbd_co_client_start (opaque=<optimized out>) at 
>>>> ../nbd/server.c:2715
>>>> #11 0x0000555555d70423 in coroutine_trampoline (i0=<optimized out>, 
>>>> i1=<optimized out>) at ../util/coroutine-ucontext.c:173
>>>> #12 0x00007ffff67f3820 in ?? () from target:/lib64/libc.so.6
>>>> #13 0x00007fffffffca80 in ?? ()
>>>>
>>>
>>> Ok the reason for this is line 89 of tests/qemu-iotests/307:
>>>
>>> # Should ignore the iothread conflict, but then fail because of the
>>> # permission conflict (and not crash)
>>> vm.qmp_log('block-export-add', id='export1', type='nbd', 
>>> node_name='null',
>>>                iothread='iothread1', fixed_iothread=False, 
>>> writable=True)
>>>
>>> This calls qmp_block_export_add() and then blk_exp_add(), that calls 
>>> bdrv_invalidate_cache().
>>> Both functions are running in the main thread, but then 
>>> bdrv_invalidate_cache invokes bdrv_co_invalidate_cache() as a 
>>> coroutine in the AioContext of the given bs, so not the main loop.
>>>
>>> So Hanna, what should we do here? This seems very similar to the 
>>> discussion in patch 22, ie run blockdev-create (in this case 
>>> block-export-add, which seems similar?) involving nodes in I/O threads.
>>
>> Honestly, I’m still thinking about this and haven’t come to a 
>> conclusion.  It doesn’t seem invalid to run 
>> bdrv_co_invalidate_cache() in the context of the BDS here, but then 
>> the assertion that the BDS is already active seems kind of just lucky 
>> to work.
>>
>> I plan to look into whether I can reproduce some case where the 
>> assertion doesn’t hold (thinking of migration with a block device in 
>> an iothread), and then see what I learn from this. :/
>
> OK, so.  I nearly couldn’t reproduce a case where the assertion 
> doesn’t hold, and I was also very close to believing that your 
> condition is entirely correct; on migration, we generally inactivate 
> block nodes (BlockDriverStates) only after they have been detached 
> from their respective block devices, and so they’re in the main 
> context.  On the destination, it’s the other way around: We invalidate 
> their caches before attaching them to the respective block devices, so 
> they are again in the main context.

Correcting myself: It doesn’t have to do anything with 
attaching/detaching, it’s that the guest puts the BDS into the non-main 
context only if the vmstate is “running”.

(virtio_pci_vmstate_change() is invoked on vmstate changes, and 
virtio_blk_class_init() registers virtio_blk_data_plane_{start,stop}() 
as the {start,stop}_ioeventfd callbacks.)

So it’s even better, the devices actually take care to put the BDS nodes 
into the main context while migration is ongoing.

> There are exceptions where we call bdrv_invalidate_cache() on error 
> paths and so on, basically just to be sure, while the guest devices 
> are connected to block nodes.  But in that case, we have never 
> inactivated them (or have already re-activated them), and that’s where 
> the `bdrv_is_active()` condition comes in.
>
> But then I wanted to find out what happens when you don’t have a guest 
> device, but an NBD export on top of the block node, and this happens:
>
> $ ./qemu-system-x86_64 \
>     -incoming defer \
>     -qmp stdio \
>     -object iothread,id=iothr0 \
>     -blockdev null-co,node-name=node0 \
>     <<EOF
> {"execute": "qmp_capabilities"}
> {"execute":"nbd-server-start","arguments":{"addr":{"type":"unix","data":{"path":"/tmp/nbd.sock"}}}} 
>
> {"execute":"block-export-add","arguments":{"type":"nbd","id":"exp0","iothread":"iothr0","node-name":"node0","name":"exp0"}} 
>
> EOF
> {"QMP": {"version": {"qemu": {"micro": 91, "minor": 2, "major": 6}, 
> "package": "v6.2.0-rc1-47-g043ab68869"}, "capabilities": ["oob"]}}
> {"return": {}}
> {"return": {}}
> qemu-system-x86_64: ../block.c:6612: bdrv_co_invalidate_cache: 
> Assertion `qemu_in_main_thread() || bdrv_is_active(bs)' failed.
> [1]    155729 abort (core dumped)  ./qemu-system-x86_64 -incoming 
> defer -qmp stdio -object iothread,id=iothr0
>
> The problem here is that blk_exp_add() invalidates the cache after 
> moving the node to the target context.  I think we can solve this 
> particular problem by simply moving its bdrv_invalidate_cache() call 
> before the `if (export->has_iothread)` block above it.

And that means that this makes even more sense, because if the virtio 
devices take care to keep their block device in the main context while 
migration is ongoing, blk_exp_add() should do the same when it calls a 
“migration function” (bdrv_invalidate_cache()).

> But it does mean the search isn’t over and I’ll need to look a bit 
> further still...

Did look further, couldn’t find anything else interesting.

So I think(TM) that this blk_exp_add() is the only thing that needs fixing.

Hanna


