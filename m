Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 38B604D6476
	for <lists+qemu-devel@lfdr.de>; Fri, 11 Mar 2022 16:22:29 +0100 (CET)
Received: from localhost ([::1]:58058 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nSh63-00026l-QZ
	for lists+qemu-devel@lfdr.de; Fri, 11 Mar 2022 10:22:27 -0500
Received: from eggs.gnu.org ([209.51.188.92]:57538)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1nSh4D-0000gi-ED
 for qemu-devel@nongnu.org; Fri, 11 Mar 2022 10:20:33 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:39825)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1nSh49-0002sP-I5
 for qemu-devel@nongnu.org; Fri, 11 Mar 2022 10:20:31 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1647012028;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=UMHGI5jabFQ6x5EkD5fm14VD67ayavK7Sxx1E4+9xeg=;
 b=JjCWp5bIHBy+qEyVHVfPGSmt9IxaiYcA824yRuqmUwpmhZK62QbXd5nN8ZV6FSaDhO0avm
 bN4LpXe4fAdIrjZTO70sJ6+jIcOB0yrcmCOpn9FvJXFWPikiBdvYXbJyuo5Z8KAoUcREXP
 GCC4cWyq5qlaTiolvcaxEMu2EfTeSc8=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-443-mh0ZZ9c7Pz6-qG1oAJwRng-1; Fri, 11 Mar 2022 10:20:26 -0500
X-MC-Unique: mh0ZZ9c7Pz6-qG1oAJwRng-1
Received: by mail-ej1-f72.google.com with SMTP id
 ga31-20020a1709070c1f00b006cec400422fso5080982ejc.22
 for <qemu-devel@nongnu.org>; Fri, 11 Mar 2022 07:20:26 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=UMHGI5jabFQ6x5EkD5fm14VD67ayavK7Sxx1E4+9xeg=;
 b=Q80CbbyKWiiUF2s3dJ4fwcbg7xI5jv0TkZyf2JABieNesK31qAzILA4BXEcluglRcZ
 ZfR/fXyZmcK3b5+B0cJVDSUxpd7h0SQCr7Ogg+TTYaZ0x6EC8GEnOMUQXwE5ANZIvlb0
 RdLNSiSZVmtn8uPnhC9gJSce4TIpstNm7BKKQOls7ja5eQKLevaDnY6IsK5uTsEE+Wxd
 VMhgq92wdooY+hWhWZKygz+MPZIOaQ1XYzD7eeukDEhP0Xi0WLPCnhxElwm58x4bAQQR
 nlmjK43JprZVHK+8mQFnav6wmsr5l0/1VXA73Pv9o+rbBepMcIDC1ptsoQo4FsBceNJs
 5Smw==
X-Gm-Message-State: AOAM533uYb3emt+BFf2Uf8XK3eTd1euV5CVf559GyDAsb9LbUGyU/eAI
 8wTWcIXfFkYWZ1IH/lKNUE0SaHAyBTVyixtM3Aj1QW4hjglYC76KRJcDT9ta1Wx4RvAZhlSDBie
 7jhb7T2AwvwXfPw4=
X-Received: by 2002:a17:906:848f:b0:6cf:7234:8ae with SMTP id
 m15-20020a170906848f00b006cf723408aemr9251299ejx.620.1647012018862; 
 Fri, 11 Mar 2022 07:20:18 -0800 (PST)
X-Google-Smtp-Source: ABdhPJx9hWx4V4DXsxz21pUnhgz5O0hlRAJI0Ay912wDgSnvTz6Yuetc6LFyEgftqVNn2Cm5gwKUFg==
X-Received: by 2002:a17:906:848f:b0:6cf:7234:8ae with SMTP id
 m15-20020a170906848f00b006cf723408aemr9251006ejx.620.1647012012163; 
 Fri, 11 Mar 2022 07:20:12 -0800 (PST)
Received: from ?IPV6:2a02:8071:5055:3f20:7ad9:a400:6d51:83e6?
 ([2a02:8071:5055:3f20:7ad9:a400:6d51:83e6])
 by smtp.gmail.com with ESMTPSA id
 lj2-20020a170906f9c200b006da6f29bc01sm3006837ejb.158.2022.03.11.07.20.10
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 11 Mar 2022 07:20:10 -0800 (PST)
Message-ID: <37a0d9e9-c72c-3524-1a68-d47967d33dcf@redhat.com>
Date: Fri, 11 Mar 2022 16:20:09 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH] block: Fix BB.root changing across bdrv_next()
To: qemu-block@nongnu.org
References: <20220301173914.12279-1-hreitz@redhat.com>
From: Hanna Reitz <hreitz@redhat.com>
In-Reply-To: <20220301173914.12279-1-hreitz@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=hreitz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=hreitz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: Kevin Wolf <kwolf@redhat.com>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 01.03.22 18:39, Hanna Reitz wrote:
> bdrv_next() has no guarantee that its caller has stopped all block graph
> operations; for example, bdrv_flush_all() does not.
>
> The latter can actually provoke such operations, because its
> bdrv_flush() call, which runs a coroutine (bdrv_co_flush()), may run
> this coroutine in a different AioContext than the main one, and then
> when this coroutine is done and invokes aio_wait_kick(), the monitor may
> get a chance to run and start executing some graph-modifying QMP
> command.
>
> One example for this is when the VM encounters an I/O error on a block
> device and stops, triggering a bdrv_flush_all(), and a blockdev-mirror
> is started simultaneously on a block node in an I/O thread.  When
> bdrv_flush_all() comes to that node[1] and flushes it, the
> aio_wait_kick() at the end of bdrv_co_flush_entry() may cause the
> monitor to process the mirror request, and mirror_start_job() will then
> replace the node by a mirror filter node, before bdrv_flush_all()
> resumes and can invoke bdrv_next() again to continue iterating.
>
> [1] Say there is a BlockBackend on top of the node in question, and so
> bdrv_next() finds that BB and returns the node as the BB's blk_bs().
> bdrv_next() will bdrv_ref() the node such that it remains valid through
> bdrv_flush_all()'s iteration, and drop the reference when it is called
> the next time.
>
> The problem is that bdrv_next() does not store to which BDS it retains a
> strong reference when the BDS is a BB's child, so on the subsequent
> call, it will just invoke blk_bs() again and bdrv_unref() the returned
> node -- but as the example above shows, this node might be a different
> one than the one that was bdrv_ref()-ed before.  This can lead to a
> use-after-free (for the mirror filter node in our example), because this
> negligent bdrv_unref() would steal a strong reference from someone else.
>
> We can solve this problem by always storing the returned (and strongly
> referenced) BDS in BdrvNextIterator.bs.  When we want to drop the strong
> reference of a BDS previously returned, always drop BdrvNextIterator.bs
> instead of using other ways of trying to figure out what that BDS was
> that we returned last time.

So a week ago, Kevin and me talked about this on IRC, and he was rather 
apprehensive of this approach, because (1) it fixes a probably 
high-level problem in one specific low-level place, and (2) it’s not 
even quite clear whether even this specific problem is really fixed.

(For (2): If bdrv_next() can cope with graph changes, then if such a 
change occurs during bdrv_flush_all(), it isn’t entirely clear whether 
we’ve truly iterated over all nodes and flushed them all.)

I’ve put a more detailed description of what I think is happening step 
by step here: https://bugzilla.redhat.com/show_bug.cgi?id=2058457#c7

So, the question came up whether we shouldn’t put bdrv_flush_all() into 
a drained section (there is a bdrv_drain_all() before, it’s just not a 
section), and ensure that no QMP commands can be executed in drained 
sections.  I fiddled around a bit, just wanting to send an extremely 
rough RFC to see whether the direction I’d be going in made any sense at 
all, but I’m not really making progress:

I wanted to basically introduce an Rwlock for QMP request processing, 
and take a read lock while we’re in a drained section. That doesn’t work 
so well, though, because when a QMP command (i.e. Rwlock is taken for a 
writer) uses drain (trying to take it as a reader), there’s a deadlock.  
I don’t really have a good idea to consolidate this, because if running 
QMP commands during drains is forbidden, then, well, a QMP command 
cannot use drain.  We’d need some way to identify that the drain is 
based in the currently running QMP command, and allow that, but I really 
don’t know how.


While looking into the STOP behavior further, something else came up.  
Summarizing part of my comment linked above, part of the problem is that 
vm_stop() runs, and concurrently the guest device requests another STOP; 
therefore, the next main loop iteration will try to STOP again.  That 
seems to be why the monitor makes some progress during one main loop 
iteration, and then the next unfortunate sequence of polling can lead to 
the monitor processing a QMP command.

So other things to consider could be whether we should ensure that the 
monitor is not in danger of processing QMP requests when 
main_loop_should_exit() runs, e.g. by polling until it’s back at the top 
of its main loop (in monitor_qmp_dispatcher_co()).

Or whether we could make qemu_system_vmstop_request() prevent double 
stop requests, by forbidding STOP requests while a previous STOP request 
has not yet been completely processed (i.e. accepting another one only 
once the VM has been stopped one time).

The simplest way to fix this very issue I’m seeing at least would be 
just to pull do_vm_stop()’s bdrv_drain_all()+bdrv_flush_all() into its 
conditional path; i.e. to only do this if the VM hadn’t been already 
stopped.  (I don’t think we need to flush here if the VM was already 
stopped before.  Might be wrong, though.)  I doubt that’s a great 
solution, but it’d be simple at least.

Hanna


