Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F27C652B9E6
	for <lists+qemu-devel@lfdr.de>; Wed, 18 May 2022 14:35:03 +0200 (CEST)
Received: from localhost ([::1]:34588 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nrItL-0007aB-0j
	for lists+qemu-devel@lfdr.de; Wed, 18 May 2022 08:35:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49412)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1nrIoX-0005Nh-Pf
 for qemu-devel@nongnu.org; Wed, 18 May 2022 08:30:05 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:23803)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1nrIoU-0007HJ-6g
 for qemu-devel@nongnu.org; Wed, 18 May 2022 08:30:04 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1652877001;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=4EMiSD1ENzTyZG0N5a0zuNTy1YmuwkgkLYVx+LfnprA=;
 b=VutthVqOQmVB8Lb6LwPlPGQjWrHUXjKPY27T0HnFI+gikBHMH82ChY9CT61WS5fTitKGcm
 inX79x/MUEmvtCQPPgSlv09X+LcyrrxQ2oHxUvaOaS3uVd1d1NiydsemjKeaf8K+3UNKK/
 Wx5uiiyEL7+KOj0caAGQv8nmKirvUX4=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-15-Sp6c2EMfPdu_MXbSeMuR6A-1; Wed, 18 May 2022 08:28:44 -0400
X-MC-Unique: Sp6c2EMfPdu_MXbSeMuR6A-1
Received: by mail-wm1-f69.google.com with SMTP id
 m26-20020a05600c3b1a00b00397220d6329so398744wms.5
 for <qemu-devel@nongnu.org>; Wed, 18 May 2022 05:28:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=4EMiSD1ENzTyZG0N5a0zuNTy1YmuwkgkLYVx+LfnprA=;
 b=TTAF3OpNqZhSF0HnMGRbXMZUHzSXU4jNB83fOor1bhuBwoItvquFPXkqr+y5buUkWt
 qQpKr2bRopbNSeyjTD6gpfwe6zJDNCYPQAl3NmJrMyyxsD8R97oWOOgVltLvRwORXcii
 gH7n4Syh/HTPnSSClgH19+4oZpziS1xvNvX/GE4IklS09tb3JZwbpdq/CG60pr36yujv
 uC9tmV8Kdv8+rnHLc6IDcpthIXyMiLleLVTah03Th8n74ATUuO06TlG+loU/yFa4q6y4
 XEmK5p8C4IUcatSTxKgI3eYb/u+gFWaSU0va2g4zlIXuG1TiTZcGR2Q+qsRWGMDFomdc
 722w==
X-Gm-Message-State: AOAM5326u2GqewTM20EEs310r8qXFrcpw40rptzf6nq6cLfpqIA7uk6N
 qtHr/6B30jicPeSF4Qtm7aHx68tj8FfMb9iPW2IqU4XzXfqRqwNSw+w5qxU4/z9R8iOPKe/Gnld
 CqlDlYIS8Q68wC+I=
X-Received: by 2002:adf:e38c:0:b0:20d:1181:6dde with SMTP id
 e12-20020adfe38c000000b0020d11816ddemr9663359wrm.225.1652876923617; 
 Wed, 18 May 2022 05:28:43 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwoRO6a6HhnEpzdJpLjEh8C6O6gcJFPd92ICr13z92TlZCooDMTKw4GGmzH3G9gLhCn/z+zrw==
X-Received: by 2002:adf:e38c:0:b0:20d:1181:6dde with SMTP id
 e12-20020adfe38c000000b0020d11816ddemr9663326wrm.225.1652876923195; 
 Wed, 18 May 2022 05:28:43 -0700 (PDT)
Received: from [192.168.149.183]
 (58.254.164.109.static.wline.lns.sme.cust.swisscom.ch. [109.164.254.58])
 by smtp.gmail.com with ESMTPSA id
 r64-20020a1c4443000000b003942a244ed6sm1666499wma.27.2022.05.18.05.28.41
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 18 May 2022 05:28:42 -0700 (PDT)
Message-ID: <cc5e12d1-d25f-d338-bff2-0d3f5cc0def7@redhat.com>
Date: Wed, 18 May 2022 14:28:41 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [RFC PATCH v2 0/8] Removal of AioContext lock, bs->parents and
 ->children: new rwlock
Content-Language: en-US
To: Stefan Hajnoczi <stefanha@redhat.com>
Cc: qemu-block@nongnu.org, Kevin Wolf <kwolf@redhat.com>,
 Hanna Reitz <hreitz@redhat.com>, John Snow <jsnow@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 Fam Zheng <fam@euphon.net>, qemu-devel@nongnu.org
References: <20220426085114.199647-1-eesposit@redhat.com>
 <YnKB+SP678gNrAb1@stefanha-x1.localdomain>
 <YoN/935E4MfinZFQ@stefanha-x1.localdomain>
From: Emanuele Giuseppe Esposito <eesposit@redhat.com>
In-Reply-To: <YoN/935E4MfinZFQ@stefanha-x1.localdomain>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=eesposit@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



Am 17/05/2022 um 12:59 schrieb Stefan Hajnoczi:
> On Wed, May 04, 2022 at 02:39:05PM +0100, Stefan Hajnoczi wrote:
>> On Tue, Apr 26, 2022 at 04:51:06AM -0400, Emanuele Giuseppe Esposito wrote:
>>> This is a new attempt to replace the need to take the AioContext lock to
>>> protect graph modifications. In particular, we aim to remove
>>> (or better, substitute) the AioContext around bdrv_replace_child_noperm,
>>> since this function changes BlockDriverState's ->parents and ->children
>>> lists.
>>>
>>> In the previous version, we decided to discard using subtree_drains to
>>> protect the nodes, for different reasons: for those unfamiliar with it,
>>> please see https://patchew.org/QEMU/20220301142113.163174-1-eesposit@redhat.com/
>>
>> I reread the thread and it's unclear to me why drain is the wrong
>> mechanism for protecting graph modifications. We theorized a lot but
>> ultimately is this new mechanism sufficiently different from
>> bdrv_drained_begin()/end() to make it worth implementing?
>>
>> Instead of invoking .drained_begin() callbacks to stop further I/O,
>> we're now queuing coroutines (without backpressure information that
>> whoever is spawning I/O needs so they can stop). The writer still waits
>> for in-flight I/O to finish, including I/O not associated with the bdrv
>> graph we wish to modify (because rdlock is per-AioContext and unrelated
>> to a specific graph). Is this really more lightweight than drain?
>>
>> If I understand correctly, the original goal was to avoid the need to
>> hold the AioContext lock across bdrv_replace_child_noperm(). I would
>> focus on that and use drain for now.
>>
>> Maybe I've missed an important point about why the new mechanism is
>> needed?
> 
> Ping?

label: // read till the end to see why I wrote this here

I was hoping someone from the "No" party would answer to your question,
because as you know we reached this same conclusion together.

We thought about dropping the drain for various reasons, the main one
(at least as far as I understood) is that we are not sure if something
can still happen in between drain_begin/end, and it is a little bit
confusing to use the same mechanism to block I/O and protect the graph.

We then thought about implementing a rwlock. A rdlock would clarify what
we are protecting and who is using the lock. I had a rwlock draft
implementation sent in this thread, but this also lead to additional
problems.
Main problem was that this new lock would introduce nested event loops,
that together with such locking would just create deadlocks.
If readers are in coroutines and writers are not (because graph
operations are not running in coroutines), we have a lot of deadlocks.
If a writer has to take the lock, it must wait all other readers to
finish. And it does it by internally calling AIO_WAIT_WHILE, creating
nested event loop. We don't know what could execute when polling for
events, and for example another writer could be resumed.
Ideally, we want writers in coroutines too.

Additionally, many readers are running in what we call "mixed"
functions: usually implemented automatically with generated_co_wrapper
tag, they let a function (usually bdrv callback) run always in a
coroutine, creating one if necessary. For example, bdrv_flush() makes
sure hat bs->bdrv_co_flush() is always run in a coroutine.
Such mixed functions are used in other callbacks too, making it really
difficult to understand if we are in a coroutine or not, and mostly
important make rwlock usage very difficult.

Which lead us to stepping back once more and try to convert all
BlockDriverState callbacks in coroutines. This would greatly simplify
rwlock usage, because we could make the rwlock coroutine-frendly
(without any AIO_WAIT_WHILE, allowing a writer to wait for readers by
just yielding and queuing itself in coroutine queues).

First step was then to convert all callbacks in coroutines, using
generated_coroutine_wrapper (g_c_w).
A typical g_c_w is implemented in this way:
	if (qemu_in_coroutine()) {
		callback();
	} else { // much simplified
		co = qemu_coroutine_create(callback);
		bdrv_coroutine_enter(bs, co);
		BDRV_POLL_WHILE(bs, coroutine_in_progress);
	}
Once all callbacks are implemented using g_c_w, we can start splitting
the two sides of the if function to only create a coroutine when we are
outside from a bdrv callback.

However, we immediately found a problem while starting to convert the
first callbacks: the AioContext lock is taken around some non coroutine
callbacks! For example, bs->bdrv_open() is always called with the
AioContext lock taken. In addition, callbacks like bdrv_open are
graph-modifying functions, which is probably why we are taking the
Aiocontext lock, and they do not like to run in coroutines.
Anyways, the real problem comes when we create a coroutine in such
places where the AioContext lock is taken and we have a graph-modifying
function.

bdrv_coroutine_enter() calls aio_co_enter(), which in turns first checks
 if the coroutine is entering another context from the current (which is
not the case for open) and if we are already in coroutine (for sure
not). Therefore it resorts to the following calls;
	aio_context_acquire(ctx);
        qemu_aio_coroutine_enter(ctx, co);
        aio_context_release(ctx);
Which is clearly a problem, because we are taking the lock twice: once
from the original caller of the callback, and once here due to the
coroutine. This creates a lot of deadlock situations.

For example, all callers of bdrv_open() always take the AioContext lock.
Often it is taken very high in the call stack, but it's always taken.

Getting rid of the lock around qemu_aio_coroutine_enter() is difficult
too, because coroutines expect to have the lock taken. For example, if
we want to drain from a coroutine, bdrv_co_yield_to_drain releases the
lock for us.

The solution is to get rid of the aio_context lock that was originally
taken in the caller, but the problem is: can we get rid of the
AioContext lock? What is that lock protecting, being so high in the call
stack?
What is the alternative for its usage? We are getting rid of it and
replacing it with nothing.
We are going to drop the AioContext lock to allow coroutines callback,
but leave graph operations unprotected.

We might suppose that many callbacks are called under drain and in
GLOBAL_STATE, which should be enough, but from our experimentation in
the previous series we saw that currently not everything is under drain,
leaving some operations unprotected (remember assert_graph_writable
temporarily disabled, since drain coverage for bdrv_replace_child_noperm
was not 100%?).
Therefore we need to add more drains. But isn't drain what we decided to
drop at the beginning? Why isn't drain good?
goto label;

Thank you,
Emanuele
> 
> Stefan
> 


