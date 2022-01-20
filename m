Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B7D6549563C
	for <lists+qemu-devel@lfdr.de>; Thu, 20 Jan 2022 23:07:05 +0100 (CET)
Received: from localhost ([::1]:47546 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nAfaC-0005yI-0a
	for lists+qemu-devel@lfdr.de; Thu, 20 Jan 2022 17:07:04 -0500
Received: from eggs.gnu.org ([209.51.188.92]:42622)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1nAaLa-0003nm-TM
 for qemu-devel@nongnu.org; Thu, 20 Jan 2022 11:31:39 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:30959)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1nAaLR-0007Zv-AE
 for qemu-devel@nongnu.org; Thu, 20 Jan 2022 11:31:32 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1642696288;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=PUDA68E9yFnuWqokHj2oWWUueC0ADum0TZ5TBX7WvYY=;
 b=KToAtDwa13ofSEqwrQ2tDi5bl0qF/0vXO1E/LhHm9b8YqiifMIiSFvcTS7d71urBqNFhUg
 ixjHCRDVdNAtrDfms+V+klW2hk22b9bq6q7pGCbj2VkH8IAQ4US89Yb3EFm6RzkbAwejRT
 eNX54502RfXMa+Wa4czCRVGtutfR3Qk=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-332-QmueABkKN_2S1Z_ioPu5NQ-1; Thu, 20 Jan 2022 11:31:26 -0500
X-MC-Unique: QmueABkKN_2S1Z_ioPu5NQ-1
Received: by mail-wm1-f69.google.com with SMTP id
 f187-20020a1c38c4000000b0034d5c66d8f5so4899234wma.5
 for <qemu-devel@nongnu.org>; Thu, 20 Jan 2022 08:31:25 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=PUDA68E9yFnuWqokHj2oWWUueC0ADum0TZ5TBX7WvYY=;
 b=knItbzA4S2Gkpjh/eqPP13uPzxbfesWXXMbwOaCp2fVn0sb+HOzS0+5HBlnicjjmxX
 JE2M2Ub2ZgkdYn4ZNA4xWioclSLrBa9iePIzbcY5dSPx2ICVN+fUvKMEGJe4rnDkDgXM
 ePf7C37iaHBScINdDCQWIUdipUwdwWhUztvhqznUBuiipYToVPCkT0GNmP2gz7pGz8hO
 eYpQoXNciDBuywA9n6Qewc8OENhgVRMNd7YYqNak0ZZQaSwZJ8mxVtqhC0LSE8XREpAA
 tBhUB+fmCP5CTBNtrZTvskHaPZKo3GmreCRQg/Mvta4YbayTCRigo0EmL3YKnZwlJBSV
 8A4w==
X-Gm-Message-State: AOAM5304uzExPRp1hKy5ynnzBsnRipC3gbyOm44mmMXAZGjSoWYA9Coy
 OhJMoHVM5LxHWxq8/0VQS4UOXVZaKANjVvt99rMafras7O9ncXRXL66gxklCwwYCVNTURN2UNBb
 NESLyq6bzzud2i58=
X-Received: by 2002:a05:600c:a45:: with SMTP id
 c5mr9490632wmq.127.1642696284864; 
 Thu, 20 Jan 2022 08:31:24 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzdF948b6UWA+4drXVX0RAbSFVU+BFPuw6hSxvrPOG5NeYGM14BF/m+vFXDBoMIrjH+dJp4EQ==
X-Received: by 2002:a05:600c:a45:: with SMTP id
 c5mr9490603wmq.127.1642696284515; 
 Thu, 20 Jan 2022 08:31:24 -0800 (PST)
Received: from ?IPV6:2a02:8071:5055:3f20:7ad9:a400:6d51:83e6?
 ([2a02:8071:5055:3f20:7ad9:a400:6d51:83e6])
 by smtp.gmail.com with ESMTPSA id a3sm4090090wri.89.2022.01.20.08.31.23
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 20 Jan 2022 08:31:23 -0800 (PST)
Message-ID: <ffaf9aee-56e9-c332-09ad-158a3e28758b@redhat.com>
Date: Thu, 20 Jan 2022 17:31:22 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: [PATCH 1/3] qsd: Add pre-init argument parsing pass
To: Markus Armbruster <armbru@redhat.com>, Kevin Wolf <kwolf@redhat.com>
References: <20211222114153.67721-1-hreitz@redhat.com>
 <20211222114153.67721-2-hreitz@redhat.com>
 <87zgnrubkf.fsf@dusky.pond.sub.org>
 <4a15fbad-b177-f35c-1468-ef14f7ab1887@redhat.com>
 <YehIosxuXCqsGBSW@redhat.com> <87ee5275ya.fsf@dusky.pond.sub.org>
From: Hanna Reitz <hreitz@redhat.com>
In-Reply-To: <87ee5275ya.fsf@dusky.pond.sub.org>
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
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.698,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: qemu-devel@nongnu.org, qemu-block@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 20.01.22 17:00, Markus Armbruster wrote:
> Kevin Wolf <kwolf@redhat.com> writes:
>
>> Am 19.01.2022 um 14:44 hat Hanna Reitz geschrieben:
>>> On 19.01.22 13:58, Markus Armbruster wrote:
>>>> Hanna Reitz <hreitz@redhat.com> writes:
>>>>
>>>>> We want to add a --daemonize argument to QSD's command line.
>>>> Why?
>>> OK, s/we/I/.  I find it useful, because without such an option, I need to
>>> have whoever invokes QSD loop until the PID file exists, before I can be
>>> sure that all exports are set up.  I make use of it in the test cases added
>>> in patch 3.
>>>
>>> I suppose this could be worked around with a special character device, like
>>> so:
>>>
>>> ```
>>> ncat --listen -U /tmp/qsd-done.sock </dev/null &
>>> ncat_pid=$!
>>>
>>> qemu-storage-daemon \
>>>      ... \
>>>      --chardev socket,id=signal_done,path=/tmp/qsd-done.sock \
>>>      --monitor signal_done \
>>>      --pidfile /tmp/qsd.pid &
>>>
>>> wait $ncat_pid
>>> ```
>>>
>>> But having to use an extra tool for this is unergonomic.  I mean, if there’s
>>> no other way...
> I know duplicating this into every program that could server as a daemon
> is the Unix tradition.  Doesn't make it good.  Systemd[*] has tried to
> make it superfluous.

Well.  I have absolutely nothing against systemd.  Still, I will not use 
it in an iotest, that’s for sure.

>> The other point is that the system emulator has it, qemu-nbd has it,
>> so certainly qsd should have it as well. Not the least because it should
>> be able to replace qemu-nbd (at least for the purpose of exporting NBD.
>> not necessarily for attaching it to the host).
> Point taken, but I think it's a somewhat weak one.  qsd could certainly
> replace qemu-nbd even without --daemonize; we could use other means to
> run it in the background.
>
>>>>>                                                                 This will
>>>>> require forking the process before we do any complex initialization
>>>>> steps, like setting up the block layer or QMP.  Therefore, we must scan
>>>>> the command line for it long before our current process_options() call.
>>>> Can you explain in a bit more detail why early forking is required?
>>>>
>>>> I have a strong dislike for parsing more than once...
>>> Because I don’t want to set up QMP and block devices, and then fork the
>>> process into two.  That sounds like there’d be a lot of stuff to think
>>> about, which just isn’t necessary, because we don’t need to set up any
>>> of this in the parent.
> We must fork() before we create threads.  Other resources are easy
> enough to hand over to the child.  Still, having to think about less is
> good, I readily grant you that.
>
> The trouble is that forking early creates a new problem: any
> configuration errors detected in the child must be propagated to the
> parent somehow (output and exit status).  I peeked at your PATCH 2, and
> I'm not convinced, but that's detail here.
>
>> Here we can compare again: Both the system emulator and qemu-nbd behave
>> the same, they fork before they do anything interesting.
>>
>> The difference is that they still parse the command line only once
>> because they don't immediately create things, but just store the options
>> and later process them in their own magic order. I'd much rather parse
>> the command line twice than copy that behaviour.
> The part I hate is "own magic order".  Without that, multiple passes are
> just fine with me.
>
> Parsing twice is a bit like having a two pass compiler run the first
> pass left to right, and then both passes intertwined left to right.  The
> pedestrian way to do it is running the first pass left to right, then
> the second pass left to right.
>
> We're clearly talking taste here.
>
>> Kevin
>>
>>> For example, if I set up a monitor on a Unix socket (server=true),
>>> processing is delayed until the client connects.  Say I put --daemonize
>>> afterwards.  I connect to the waiting server socket, the child is forked
>>> off, and then... I’m not sure what happens, actually.  Do I have a
>>> connection with both the parent and the child listening?  I know that in
>>> practice, what happens is that once the parent exits, the connection is
>>> closed, and I get a “qemu: qemu_thread_join: Invalid argument” warning/error
>>> on the QSD side.
>>>
>>> There’s a lot of stuff to think about if you allow forking after other
>>> options, so it should be done first.  We could just require the user to put
>>> --daemonize before all other options, and so have a single pass; but still,
>>> before options are even parsed, we have already for example called
>>> bdrv_init(), init_qmp_commands(), qemu_init_main_loop().  These are all
>>> things that the parent of a daemonizing process doesn’t need to do, and
>>> where I’d simply rather not think about what impact it has if we fork
>>> afterwards.
>>>
>>> Hanna
> Care to put a brief version of the rationale for --daemonize and for
> forking early in the commit message?

Well, my rationale for adding the feature doesn’t really extend beyond 
“I want it, I find it useful, and so I assume others will, too”.

I don’t really like putting “qemu-nbd has it” there, because... it was 
again me who implemented it for qemu-nbd.  Because I found it useful.  
But I can of course do that, if it counts as a reason.

I can certainly (and understand the need to, and will) elaborate on the 
“This will require forking the process before we do any complex 
initialization steps” part.

Hanna


