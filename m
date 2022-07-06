Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F212E569507
	for <lists+qemu-devel@lfdr.de>; Thu,  7 Jul 2022 00:09:30 +0200 (CEST)
Received: from localhost ([::1]:55932 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o9DD8-00063T-23
	for lists+qemu-devel@lfdr.de; Wed, 06 Jul 2022 18:09:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53526)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1o9Cac-0003G4-EI
 for qemu-devel@nongnu.org; Wed, 06 Jul 2022 17:29:43 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:55095)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1o9CaY-0005M2-H6
 for qemu-devel@nongnu.org; Wed, 06 Jul 2022 17:29:40 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1657142977;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=CoPpErZ8fRAPKLU4/Shc970bLX5PIhkrGyYMVKq81Z4=;
 b=EctnR3+k29IZuIu3ZMIkS7DlnxdG/7TkIn9YGfeUwtCSlGxca6EuU33K4kIGE3H/l63Cxd
 8FQ9Gck+x1tQfv464YUUcxfBT4S6ZLyNV3y8VW0oJToXfQutjlWq4LIndqcYMoMFyip4ud
 HSd9hYPrrdm5z2uNZd8+cpmYV6h3MJU=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-462-Sytm_6NSOrykEF0Bmxtp1A-1; Wed, 06 Jul 2022 17:29:36 -0400
X-MC-Unique: Sytm_6NSOrykEF0Bmxtp1A-1
Received: by mail-wm1-f71.google.com with SMTP id
 130-20020a1c0288000000b003a18127d11aso7830221wmc.6
 for <qemu-devel@nongnu.org>; Wed, 06 Jul 2022 14:29:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=CoPpErZ8fRAPKLU4/Shc970bLX5PIhkrGyYMVKq81Z4=;
 b=pZU4OifuS2POnF/Jtamjf914ET8azcO1ItLbFS5vmitCyKgfdZ0cp5ZO/Lg0gnIsam
 SvYfhV07ZYulMArB2LCG9Z0lU5MUOaJdfo5uP4zSVcV7OwK83U7RPls/itIcWnyow9AY
 io0iEDNTMMS1jKmVf9T8YRZygYtmffvUtSy3LD/jrVLwYOSmU/vxR5U4UXiA39EPofjY
 PDNBBVlLJknmED5lDkkvC0+sK9FDQCBzvcr1+kw7M+nU9NIjQGLaDHsCfJH3FLJr+LnZ
 ewL/7U6+d0EIyWhkkbgZQmRq2pFBEh0uM/noxlp0yRGpBvdYDeyTRYgvnFZkb0pgDeSq
 q9gw==
X-Gm-Message-State: AJIora+dFyQcd9EumqXl5qj9N5dpUeOI2IJ24MVsr9kwVd4XwwCVhdF/
 I0LJYNs8V9RqNgjCIfNTOOYR4HNANRYrDDcx0UQTlTiSE0HC1t4+sNg/2IKiNzvAAssq3z5Am5A
 KEZ4M/v9lxhLn1hc=
X-Received: by 2002:adf:ed41:0:b0:210:20a5:26c2 with SMTP id
 u1-20020adfed41000000b0021020a526c2mr37838035wro.603.1657142975099; 
 Wed, 06 Jul 2022 14:29:35 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1sTlRX4bNbDdLnxFrQdYTc7PL1K5xzNorikLfi9W3ZspFUSD5ATlAQD9WHHFgG904DErPC97A==
X-Received: by 2002:adf:ed41:0:b0:210:20a5:26c2 with SMTP id
 u1-20020adfed41000000b0021020a526c2mr37837999wro.603.1657142974647; 
 Wed, 06 Jul 2022 14:29:34 -0700 (PDT)
Received: from ?IPV6:2a04:ee41:4:31cb:e591:1e1e:abde:a8f1?
 ([2a04:ee41:4:31cb:e591:1e1e:abde:a8f1])
 by smtp.gmail.com with ESMTPSA id
 bp25-20020a5d5a99000000b0021bbc0b671esm33407770wrb.20.2022.07.06.14.29.33
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 06 Jul 2022 14:29:34 -0700 (PDT)
Message-ID: <fc9a0846-6ad9-c978-5c46-ad52a8f14002@redhat.com>
Date: Wed, 6 Jul 2022 23:29:33 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH v8 17/20] job.c: enable job lock/unlock and remove
 Aiocontext locks
Content-Language: en-US
To: Stefan Hajnoczi <stefanha@redhat.com>
Cc: qemu-block@nongnu.org, Kevin Wolf <kwolf@redhat.com>,
 Hanna Reitz <hreitz@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 John Snow <jsnow@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 Wen Congyang <wencongyang2@huawei.com>,
 Xie Changlong <xiechanglong.d@gmail.com>,
 Markus Armbruster <armbru@redhat.com>, Fam Zheng <fam@euphon.net>,
 qemu-devel@nongnu.org
References: <20220629141538.3400679-1-eesposit@redhat.com>
 <20220629141538.3400679-18-eesposit@redhat.com>
 <YsQ3r398HXi9B92H@stefanha-x1.localdomain>
From: Emanuele Giuseppe Esposito <eesposit@redhat.com>
In-Reply-To: <YsQ3r398HXi9B92H@stefanha-x1.localdomain>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=eesposit@redhat.com;
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



Am 05/07/2022 um 15:07 schrieb Stefan Hajnoczi:
> On Wed, Jun 29, 2022 at 10:15:35AM -0400, Emanuele Giuseppe Esposito wrote:
>> Change the job_{lock/unlock} and macros to use job_mutex.
>>
>> Now that they are not nop anymore, remove the aiocontext
>> to avoid deadlocks.
>>
>> Therefore:
>> - when possible, remove completely the aiocontext lock/unlock pair
>> - if it is used by some other function too, reduce the locking
>> section as much as possible, leaving the job API outside.
>>
>> There is only one JobDriver callback, ->free() that assumes that
>> the aiocontext lock is held (because it calls bdrv_unref), so for
>> now keep that under aiocontext lock.
> 
> This discussion shouldn't hold up the patch series, it's a separate
> issue:
> 
> Why does bdrv_unref() need the AioContext lock? The reference count
> itself is protected by the BQL (bdrv_ref() is GS too). I/O requests
> should be using fine-grained locks now, so I'm not sure if we still need
> to hold the AioContext lock to drain them?

If I remove the AioContex lock/unlock in job_unref_locked, I see that
test 200 and test-bdrv-drain are failing.

The reason is that job->free() is calling block_job_free and then we
eventually get to bdrv_detach_child claling bdrv_try_set_aio_context
from the main loop, on a node that is in another AioContext lock.

So it isn't really about bdrv_unref, but more bdrv_try_set_aio_context.
Until we don't find a solution to that, we can't get rid of this
aiocontext lock.

That's the shared call stack from both tests:

#0  __pthread_kill_implementation (threadid=<optimized out>,
    signo=signo@entry=6, no_tid=no_tid@entry=0) at pthread_kill.c:44
#1  0x00007ffff66a64a3 in __pthread_kill_internal (signo=6,
    threadid=<optimized out>) at pthread_kill.c:78
#2  0x00007ffff6659d06 in __GI_raise (sig=sig@entry=6)
    at ../sysdeps/posix/raise.c:26
#3  0x00007ffff662c7d3 in __GI_abort () at abort.c:79
#4  0x0000555555d6411f in error_exit (err=<optimized out>,
    msg=msg@entry=0x555555f49b30 <__func__.20> "qemu_mutex_unlock_impl")
    at ../util/qemu-thread-posix.c:38
--Type <RET> for more, q to quit, c to continue without paging--
#5  0x0000555555d64965 in qemu_mutex_unlock_impl (mutex=0x5555568d0620,
    file=<optimized out>, line=<optimized out>)
    at ../util/qemu-thread-posix.c:118
#6  0x0000555555c39c06 in bdrv_set_aio_context_ignore (bs=0x5555575133e0,
    new_context=0x5555566a2ad0, ignore=0x7fffffffd110) at ../block.c:7399
#7  0x0000555555c3a100 in bdrv_child_try_set_aio_context (
    bs=bs@entry=0x5555575133e0, ctx=ctx@entry=0x5555566a2ad0,
    ignore_child=ignore_child@entry=0x0, errp=errp@entry=0x0)
    at ../block.c:7493
#8  0x0000555555c3a1f6 in bdrv_try_set_aio_context (errp=0x0,
--Type <RET> for more, q to quit, c to continue without paging--
    ctx=0x5555566a2ad0, bs=0x5555575133e0) at ../block.c:7503
#9  bdrv_detach_child (childp=0x7fffffffd168) at ../block.c:3130
#10 bdrv_root_unref_child (child=<optimized out>,
child@entry=0x55555732dc00)
    at ../block.c:3228
#11 0x0000555555c4265f in block_job_remove_all_bdrv (job=0x5555575b6a30)
    at ../blockjob.c:195
#12 0x0000555555c426b5 in block_job_free (job=0x5555575b6a30)
    at ../blockjob.c:76
#13 0x0000555555c4472e in job_unref_locked (job=0x5555575b6a30)
    at ../job.c:464
--Type <RET> for more, q to quit, c to continue without paging--
#14 job_unref_locked (job=0x5555575b6a30) at ../job.c:450

> 
> Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>
> 


