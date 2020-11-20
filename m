Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B0A6A2BA77F
	for <lists+qemu-devel@lfdr.de>; Fri, 20 Nov 2020 11:36:00 +0100 (CET)
Received: from localhost ([::1]:32816 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kg3ln-0008Tv-QG
	for lists+qemu-devel@lfdr.de; Fri, 20 Nov 2020 05:35:59 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:54356)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1kg3kK-0007XV-MQ
 for qemu-devel@nongnu.org; Fri, 20 Nov 2020 05:34:29 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:54303)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1kg3kG-0004yy-HG
 for qemu-devel@nongnu.org; Fri, 20 Nov 2020 05:34:28 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1605868463;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=PifOWlD6SiLuiOGXrdyvMWQNMh3KS5D1ZFXBsOXcCBQ=;
 b=He4w6QEvrh9uBhvF0zqzdoE8WBGdbWf+U6ap6OXq/GNHn24zc6wQtgZqlxws9czRp4SIqW
 Y3FM8afAmrGBJ1u/0JnXXffc8i8RkPhu30/49qN9Zd7mnkQpxGe68ZogsDSdJeKi5lKf86
 sL6penbyICAf5ObsG8Tg8G1IKO9aJsA=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-69-5ExkiKUpOl6r-n8MyBp6Ng-1; Fri, 20 Nov 2020 05:34:21 -0500
X-MC-Unique: 5ExkiKUpOl6r-n8MyBp6Ng-1
Received: by mail-wm1-f71.google.com with SMTP id z62so5116844wmb.1
 for <qemu-devel@nongnu.org>; Fri, 20 Nov 2020 02:34:20 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=PifOWlD6SiLuiOGXrdyvMWQNMh3KS5D1ZFXBsOXcCBQ=;
 b=h9c4qtSBts4uE3RONJ3H2pvCBD2+B6u14+B7n8uzwPSiGhB3iq+6qvtUZMjXagi7iI
 Tjm4E3912pRwvCEafu9brgAbLn36kBbjS+2NH5MMv71tFxmt8Dkk6ZSTnJHWgnSIU94U
 /BAB6+0MZYxDDPV9w0zEdWKbN2q7+UeXRK1p8le7ztOXDMM1m1mWiGaDdy0I4XXljUJi
 CTZbZHknped5akIIAXwaHJb4wRXJS527ArM6JfnxbCbCxbfV3hzgaPcVpvQhbyjv+Qvk
 /kbRMEAyc+m30y4ZopTdJskIiZMImuathg8+1Eq6wqE/qyX+gIeG59kR9LUFx5y5LeQH
 ojSA==
X-Gm-Message-State: AOAM5311YdmlP73lWFnMao8As/7poquAdl+GQ1dZPFilPFZPZAUnXra3
 INS0xsuXJysdlOAvt6JewJRc5t86tqgwrrQB7FPTWiIpCj34py1BTE983yp4Lf6xsAEuB/Or1i1
 ftfikX3tkxDmaFSE=
X-Received: by 2002:adf:9b98:: with SMTP id d24mr14872775wrc.17.1605868458645; 
 Fri, 20 Nov 2020 02:34:18 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzzj1i4uKjenw/3R5juB5Z3oEmRaENbgu31K3h21TIfg1FDc9bPMB7oYD3oxjK89hTGqgZ5oA==
X-Received: by 2002:adf:9b98:: with SMTP id d24mr14872762wrc.17.1605868458445; 
 Fri, 20 Nov 2020 02:34:18 -0800 (PST)
Received: from [192.168.1.36] (234.red-83-42-66.dynamicip.rima-tde.net.
 [83.42.66.234])
 by smtp.gmail.com with ESMTPSA id u16sm4268131wrn.55.2020.11.20.02.34.16
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 20 Nov 2020 02:34:17 -0800 (PST)
Subject: Re: iotest 030 still occasionally intermittently failing
To: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 Peter Maydell <peter.maydell@linaro.org>, Alberto Garcia <berto@igalia.com>
References: <CAFEAcA8OqZe9MYmp=B023bTqatP-KcoGsh_vQ4OZ=a=jh09wcQ@mail.gmail.com>
 <w51tutpp5nr.fsf@maestria.local.igalia.com>
 <CAFEAcA-Me4jw5TPYCHkJSX=9bAw0kzTMadyMM3YabGFNu+swkg@mail.gmail.com>
 <a058f32e-402b-d269-a6a2-5c30e28abc4f@virtuozzo.com>
 <1f53f805-9367-d7c6-94ca-8d91e88f362f@virtuozzo.com>
 <33bb2781-2811-0bf7-cdbf-cb3544165276@virtuozzo.com>
 <32cd520b-0463-945c-9222-ec20baf8be8a@virtuozzo.com>
 <3cfcbb68-2f62-d7f2-65e1-6ba7dd879ac5@virtuozzo.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <7c7d4a76-6224-2d9a-16c2-bee09e1f83e8@redhat.com>
Date: Fri, 20 Nov 2020 11:34:16 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <3cfcbb68-2f62-d7f2-65e1-6ba7dd879ac5@virtuozzo.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 QEMU Developers <qemu-devel@nongnu.org>, Qemu-block <qemu-block@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Cc'ing Stefan/Paolo

On 11/20/20 10:51 AM, Vladimir Sementsov-Ogievskiy wrote:
> 19.11.2020 23:31, Vladimir Sementsov-Ogievskiy wrote:
>> 19.11.2020 22:31, Vladimir Sementsov-Ogievskiy wrote:
>>> 19.11.2020 22:30, Vladimir Sementsov-Ogievskiy wrote:
>>>> 19.11.2020 19:11, Vladimir Sementsov-Ogievskiy wrote:
>>>>> 16.11.2020 20:59, Peter Maydell wrote:
>>>>>> On Mon, 16 Nov 2020 at 17:34, Alberto Garcia <berto@igalia.com>
>>>>>> wrote:
>>>>>>> Do you know if there is a core dump or stack trace available ?
>>>>>>
>>>>>> Nope, sorry. What you get is what the 'vm-build-netbsd' etc targets
>>>>>> produce, so if you want more diagnostics on failures you have to
>>>>>> arrange for the test harness to produce them...
>>>>>>
>>>>>> thanks
>>>>>> -- PMM
>>>>>>
>>>>>
>>>>> Hi!
>>>>>
>>>>> After some iterations I've reproduced on SIGABRT:
>>>>>
>>>>> #0  0x00007feb701bae35 in raise () at /lib64/libc.so.6
>>>>> #1  0x00007feb701a5895 in abort () at /lib64/libc.so.6
>>>>> #2  0x00007feb701a5769 in _nl_load_domain.cold () at /lib64/libc.so.6
>>>>> #3  0x00007feb701b3566 in annobin_assert.c_end () at /lib64/libc.so.6
>>>>> #4  0x000055a93374f7d3 in bdrv_replace_child (child=0x55a9363a3a00,
>>>>> new_bs=0x0) at ../block.c:2648
>>>>> #5  0x000055a93374fd5a in bdrv_detach_child (child=0x55a9363a3a00)
>>>>> at ../block.c:2777
>>>>> #6  0x000055a93374fd9c in bdrv_root_unref_child
>>>>> (child=0x55a9363a3a00) at ../block.c:2789
>>>>> #7  0x000055a933722e8b in block_job_remove_all_bdrv
>>>>> (job=0x55a935f4f4b0) at ../blockjob.c:191
>>>>> #8  0x000055a933722bb2 in block_job_free (job=0x55a935f4f4b0) at
>>>>> ../blockjob.c:88
>>>>> #9  0x000055a9337755fa in job_unref (job=0x55a935f4f4b0) at
>>>>> ../job.c:380
>>>>> #10 0x000055a9337767a6 in job_exit (opaque=0x55a935f4f4b0) at
>>>>> ../job.c:894
>>>>> #11 0x000055a93386037e in aio_bh_call (bh=0x55a9352e16b0) at
>>>>> ../util/async.c:136
>>>>> #12 0x000055a933860488 in aio_bh_poll (ctx=0x55a9351366f0) at
>>>>> ../util/async.c:164
>>>>> #13 0x000055a93383151e in aio_dispatch (ctx=0x55a9351366f0) at
>>>>> ../util/aio-posix.c:381
>>>>> #14 0x000055a9338608b9 in aio_ctx_dispatch (source=0x55a9351366f0,
>>>>> callback=0x0, user_data=0x0)
>>>>>      at ../util/async.c:306
>>>>> #15 0x00007feb71349ecd in g_main_context_dispatch () at
>>>>> /lib64/libglib-2.0.so.0
>>>>> #16 0x000055a933840300 in glib_pollfds_poll () at
>>>>> ../util/main-loop.c:221
>>>>> #17 0x000055a93384037a in os_host_main_loop_wait (timeout=0) at
>>>>> ../util/main-loop.c:244
>>>>> #18 0x000055a933840482 in main_loop_wait (nonblocking=0) at
>>>>> ../util/main-loop.c:520
>>>>> #19 0x000055a933603979 in qemu_main_loop () at ../softmmu/vl.c:1678
>>>>> #20 0x000055a933190046 in main (argc=20, argv=0x7ffd48c31138,
>>>>> envp=0x7ffd48c311e0)
>>>>>
>>>>> (gdb) fr 4
>>>>> #4  0x000055a93374f7d3 in bdrv_replace_child (child=0x55a9363a3a00,
>>>>> new_bs=0x0) at ../block.c:2648
>>>>> 2648            assert(tighten_restrictions == false);
>>>>> (gdb) list
>>>>> 2643            int ret;
>>>>> 2644
>>>>> 2645            bdrv_get_cumulative_perm(old_bs, &perm, &shared_perm);
>>>>> 2646            ret = bdrv_check_perm(old_bs, NULL, perm,
>>>>> shared_perm, NULL,
>>>>> 2647                                  &tighten_restrictions, NULL);
>>>>> 2648            assert(tighten_restrictions == false);
>>>>> 2649            if (ret < 0) {
>>>>> 2650                /* We only tried to loosen restrictions, so
>>>>> errors are not fatal */
>>>>> 2651                bdrv_abort_perm_update(old_bs);
>>>>> 2652            } else {
>>>>> (gdb) p tighten_restrictions
>>>>> $1 = true
>>>>>
>>>>>
>>>>
>>>> I've modified code a bit, to crash when we actually want to set
>>>> tighten_restrictions to true, and get the following bt:
>>>> #0  0x00007f6dbb49ee35 in raise () at /lib64/libc.so.6
>>>> #1  0x00007f6dbb489895 in abort () at /lib64/libc.so.6
>>>> #2  0x000055b9174104d7 in bdrv_check_perm
>>>>      (bs=0x55b918f09720, q=0x0, cumulative_perms=1,
>>>> cumulative_shared_perms=21, ignore_children=0x55b918a57b20 = {...},
>>>> tighten_restrictions=0x55b917b044f8 <abort_on_set_to_true>,
>>>> errp=0x0) at ../block.c:2009
>>>> #3  0x000055b917410ec0 in bdrv_check_update_perm
>>>>      (bs=0x55b918f09720, q=0x0, new_used_perm=1, new_shared_perm=21,
>>>> ignore_children=0x55b918a57b20 = {...},
>>>> tighten_restrictions=0x55b917b044f8 <abort_on_set_to_true>,
>>>> errp=0x0) at ../block.c:2280
>>>> #4  0x000055b917410f38 in bdrv_child_check_perm
>>>>      (c=0x55b91921fcf0, q=0x0, perm=1, shared=21,
>>>> ignore_children=0x55b918a57b20 = {...},
>>>> tighten_restrictions=0x55b917b044f8 <abort_on_set_to_true>,
>>>> errp=0x0) at ../block.c:2294
>>>> #5  0x000055b91741078c in bdrv_check_perm
>>>>      (bs=0x55b918defd90, q=0x0, cumulative_perms=1,
>>>> cumulative_shared_perms=21, ignore_children=0x0,
>>>> tighten_restrictions=0x55b917b044f8 <abort_on_set_to_true>,
>>>> errp=0x0) at ../block.c:2076
>>>> #6  0x000055b91741194e in bdrv_replace_child (child=0x55b919cf6200,
>>>> new_bs=0x0) at ../block.c:2666
>>>> #7  0x000055b917411f1d in bdrv_detach_child (child=0x55b919cf6200)
>>>> at ../block.c:2798
>>>> #8  0x000055b917411f5f in bdrv_root_unref_child
>>>> (child=0x55b919cf6200) at ../block.c:2810
>>>> #9  0x000055b9173e4d88 in block_job_remove_all_bdrv
>>>> (job=0x55b918f06a60) at ../blockjob.c:191
>>>> #10 0x000055b9173e4aaf in block_job_free (job=0x55b918f06a60) at
>>>> ../blockjob.c:88
>>>> #11 0x000055b917437aca in job_unref (job=0x55b918f06a60) at
>>>> ../job.c:380
>>>> #12 0x000055b917438c76 in job_exit (opaque=0x55b918f06a60) at
>>>> ../job.c:894
>>>> #13 0x000055b917522a57 in aio_bh_call (bh=0x55b919a2b3b0) at
>>>> ../util/async.c:136
>>>> #14 0x000055b917522b61 in aio_bh_poll (ctx=0x55b918a866f0) at
>>>> ../util/async.c:164
>>>> #15 0x000055b9174f3bf7 in aio_dispatch (ctx=0x55b918a866f0) at
>>>> ../util/aio-posix.c:381
>>>> #16 0x000055b917522f92 in aio_ctx_dispatch (source=0x55b918a866f0,
>>>> callback=0x0, user_data=0x0)
>>>>      at ../util/async.c:306
>>>> #17 0x00007f6dbc62decd in g_main_context_dispatch () at
>>>> /lib64/libglib-2.0.so.0
>>>> #18 0x000055b9175029d9 in glib_pollfds_poll () at
>>>> ../util/main-loop.c:221
>>>> #19 0x000055b917502a53 in os_host_main_loop_wait (timeout=0) at
>>>> ../util/main-loop.c:244
>>>> #20 0x000055b917502b5b in main_loop_wait (nonblocking=0) at
>>>> ../util/main-loop.c:520
>>>> #21 0x000055b9172c5979 in qemu_main_loop () at ../softmmu/vl.c:1678
>>>> #22 0x000055b916e52046 in main (argc=20, argv=0x7fff7f81f208,
>>>> envp=0x7fff7f81f2b0)
>>>>
>>>>
>>>> and the picture taken at the moment of abort (and it is the same as
>>>> at the moment before bdrv_replace_child call) is attached. So, it
>>>> looks like graph is already corrupted (you see that backing
>>>> permissions are not propagated to node2-node0 child).
>>>>
>>>> How graph was corrupted it's still the question..
>>>>
>>>
>>> additional info: it's all during test_stream_commit_1 in 30 iiotest
>>>
>>
>> OK, after some debugging and looking at block-graph dumps I tend to
>> think that this a race between finish (.prepare) of mirror and
>> block-stream. They do graph updates. Nothing prevents interleaving of
>> graph-updating operations (note that bdrv_replace_child_noperm may do
>> aio_poll). And nothing protects two processes of graph-update from
>> intersection.
>>
>> Any ideas?
>>
> 
> Wow, I get the following:
> 
> #0  0x00007fa84bcf97b6 in ppoll () at /lib64/libc.so.6
> #1  0x000055b33e46321b in qemu_poll_ns (fds=0x55b340d28b60, nfds=1,
> timeout=600000000000) at ../util/qemu-timer.c:349
> #2  0x000055b33e495c33 in fdmon_poll_wait (ctx=0x55b340d026f0,
> ready_list=0x7ffcc0af5f30, timeout=600000000000) at ../util/fdmon-poll.c:80
> #3  0x000055b33e4575b0 in aio_poll (ctx=0x55b340d026f0, blocking=true)
> at ../util/aio-posix.c:607
> #4  0x000055b33e302c41 in mirror_exit_common (job=0x55b341e94d20) at
> ../block/mirror.c:648
> #5  0x000055b33e3031e3 in mirror_prepare (job=0x55b341e94d20) at
> ../block/mirror.c:776
> #6  0x000055b33e39ba6b in job_prepare (job=0x55b341e94d20) at ../job.c:781
> #7  0x000055b33e39a31f in job_txn_apply (job=0x55b341e94d20,
> fn=0x55b33e39ba2e <job_prepare>) at ../job.c:158
> #8  0x000055b33e39baf4 in job_do_finalize (job=0x55b341e94d20) at
> ../job.c:798
> #9  0x000055b33e39bcbb in job_completed_txn_success (job=0x55b341e94d20)
> at ../job.c:852
> #10 0x000055b33e39bd5b in job_completed (job=0x55b341e94d20) at
> ../job.c:865
> #11 0x000055b33e39bdae in job_exit (opaque=0x55b341e94d20) at ../job.c:885
> #12 0x000055b33e485cfc in aio_bh_call (bh=0x7fa830004100) at
> ../util/async.c:136
> #13 0x000055b33e485e06 in aio_bh_poll (ctx=0x55b340d026f0) at
> ../util/async.c:164
> #14 0x000055b33e4577a3 in aio_poll (ctx=0x55b340d026f0, blocking=true)
> at ../util/aio-posix.c:659
> #15 0x000055b33e2fa4d9 in bdrv_poll_co (s=0x7ffcc0af62e0) at
> /work/src/qemu/master/block/block-gen.h:44
> #16 0x000055b33e2faff4 in bdrv_pwritev (child=0x55b340ed0f60, offset=0,
> bytes=65536, qiov=0x7ffcc0af6370, flags=0) at block/block-gen.c:408
> #17 0x000055b33e34be9b in bdrv_pwrite (child=0x55b340ed0f60, offset=0,
> buf=0x55b341d10000, bytes=65536) at ../block/io.c:984
> #18 0x000055b33e386c6f in qcow2_update_header (bs=0x55b341023020) at
> ../block/qcow2.c:3037
> #19 0x000055b33e386e53 in qcow2_change_backing_file (bs=0x55b341023020,
> backing_file=0x55b341bf3c80 "/ramdisk/xx/img-0.img",
> backing_fmt=0x55b33e613afc "raw") at ../block/qcow2.c:3074
> #20 0x000055b33e379908 in bdrv_change_backing_file (bs=0x55b341023020,
> backing_file=0x55b341bf3c80 "/ramdisk/xx/img-0.img",
> backing_fmt=0x55b33e613afc "raw", warn=false) at ../block.c:4768
> #21 0x000055b33e3b2377 in stream_prepare (job=0x55b341030620) at
> ../block/stream.c:88
> #22 0x000055b33e39ba6b in job_prepare (job=0x55b341030620) at ../job.c:781
> #23 0x000055b33e39a31f in job_txn_apply (job=0x55b341030620,
> fn=0x55b33e39ba2e <job_prepare>) at ../job.c:158
> #24 0x000055b33e39baf4 in job_do_finalize (job=0x55b341030620) at
> ../job.c:798
> #25 0x000055b33e39bcbb in job_completed_txn_success (job=0x55b341030620)
> at ../job.c:852
> #26 0x000055b33e39bd5b in job_completed (job=0x55b341030620) at
> ../job.c:865
> #27 0x000055b33e39bdae in job_exit (opaque=0x55b341030620) at ../job.c:885
> #28 0x000055b33e485cfc in aio_bh_call (bh=0x55b340ead840) at
> ../util/async.c:136
> #29 0x000055b33e485e06 in aio_bh_poll (ctx=0x55b340d026f0) at
> ../util/async.c:164
> #30 0x000055b33e456e9c in aio_dispatch (ctx=0x55b340d026f0) at
> ../util/aio-posix.c:381
> #31 0x000055b33e486237 in aio_ctx_dispatch (source=0x55b340d026f0,
> callback=0x0, user_data=0x0) at ../util/async.c:306
> #32 0x00007fa84cdceecd in g_main_context_dispatch () at
> /lib64/libglib-2.0.so.0
> #33 0x000055b33e465c7e in glib_pollfds_poll () at ../util/main-loop.c:221
> #34 0x000055b33e465cf8 in os_host_main_loop_wait (timeout=0) at
> ../util/main-loop.c:244
> #35 0x000055b33e465e00 in main_loop_wait (nonblocking=0) at
> ../util/main-loop.c:520
> #36 0x000055b33e228979 in qemu_main_loop () at ../softmmu/vl.c:1678
> #37 0x000055b33ddb5046 in main (argc=20, argv=0x7ffcc0af6a88,
> envp=0x7ffcc0af6b30) at ../softmmu/main.c:50
> 
> 
> aio_poll at start of mirror_exit_common is my addition. But anyway the
> problem is here: we do call mirror_prepare inside of stream_prepare!
> 
> ----
> 
> Ok, moving further, I moved stream_clean, stream_prepare,
> mirror_exit_common and mirror_complete into coroutine context and
> protect them all by new global coroutine mutex. This helps, now the bug
> doesn't reproduce.
> 
> Still, I'll try to finally understand, what's going on. But I think now
> that:
> 
> - graph modification code (permissions, drains, child-replacements, etc)
> are not safe to call in parallel, for example in different coroutines or
> through nested aio_poll.
> 
> - but they all do different kinds of drains, io operations, etc, which
> lead to nested aio polls and everything is broken
> 
> 


