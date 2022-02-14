Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 426EC4B4915
	for <lists+qemu-devel@lfdr.de>; Mon, 14 Feb 2022 11:31:02 +0100 (CET)
Received: from localhost ([::1]:52480 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nJYdI-0005SY-Sv
	for lists+qemu-devel@lfdr.de; Mon, 14 Feb 2022 05:31:00 -0500
Received: from eggs.gnu.org ([209.51.188.92]:44780)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1nJYZk-0003Cj-Li
 for qemu-devel@nongnu.org; Mon, 14 Feb 2022 05:27:20 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:33777)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1nJYZh-0007Gx-FK
 for qemu-devel@nongnu.org; Mon, 14 Feb 2022 05:27:19 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1644834436;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=m2Uoa+isDVs1CmYJs3CAQylak+j4/Td9jcCBXuPJBN4=;
 b=Cu+If91vjQRJUmIFKfdSuMjtHcEpgN/4AHeuSefDiJK4DeCwLbGkt/FowgkXbkjLcZQjQD
 koDmfi/bfHHfOproMDqRDal58sk0e5XU+VrkeSrHsG8Rn5wekIwsVg/vOyJHGScTiCVWzb
 SmCVjDj2Rojt5n5jRDgY75VnteJHWvc=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-367-5ZkX0TH0NS2BZZgQVCujXA-1; Mon, 14 Feb 2022 05:27:10 -0500
X-MC-Unique: 5ZkX0TH0NS2BZZgQVCujXA-1
Received: by mail-wr1-f69.google.com with SMTP id
 k20-20020adfc714000000b001e305cd1597so6717521wrg.19
 for <qemu-devel@nongnu.org>; Mon, 14 Feb 2022 02:27:10 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=m2Uoa+isDVs1CmYJs3CAQylak+j4/Td9jcCBXuPJBN4=;
 b=KB452CO0+FGrtQIL07uTyXRJnaTddEGyuEcWfYzc16CYaOjAEBab2lfFXRfMfDsKA2
 BOVSEnkiF2YeA7s8OdSeUOZVnk2VxmjalyWSrqPvL9SLNWx3vxK9cKcZlETa0ZkLvjh9
 MoRuZbMucacUctkUz2ohtgwDkLeFDTeGZGteCoqUtgacuT9alfOzDBaR/x1fLe9MF/EP
 +NVO0KX6sFGlXiVk3ju4Qhepm1hmMVHCHZn5bCwn992dGhg/yFslVIKGremQTJZCvKS4
 Ddj7gCFF+Kg0cfiYjuP6SHAgDknB98ZV8gqAQSbDpXT/Rb4Dzb6iM2dRvnNrvWqk/5wE
 JpJw==
X-Gm-Message-State: AOAM531kz7lZSyCoo0cWVYjhq5FSXKWCDn4WKf7EqRdDA9zpjD1ouB69
 R+b22ROnr/GERlAVX72jS9kgnpzm5aBYCPKmm4GGfyHl7CjVjnobvQyCVsL3XlMNJQoW9xeaBS9
 qIneLbU1hp3ikeD0=
X-Received: by 2002:adf:ed8e:: with SMTP id c14mr10304524wro.688.1644834429465; 
 Mon, 14 Feb 2022 02:27:09 -0800 (PST)
X-Google-Smtp-Source: ABdhPJykJ5AcQw/1TkVvUaAhpoVBeUxwnCx0Z7Mem2STDfIR6gfpuIlSVDg/56YhBM7xpfKBCEKanQ==
X-Received: by 2002:adf:ed8e:: with SMTP id c14mr10304508wro.688.1644834429264; 
 Mon, 14 Feb 2022 02:27:09 -0800 (PST)
Received: from ?IPV6:2a04:ee41:4:31cb:e591:1e1e:abde:a8f1?
 ([2a04:ee41:4:31cb:e591:1e1e:abde:a8f1])
 by smtp.gmail.com with ESMTPSA id v18sm25006193wrm.105.2022.02.14.02.27.08
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 14 Feb 2022 02:27:08 -0800 (PST)
Message-ID: <eb868668-e07e-00fb-b550-0ce7394febe6@redhat.com>
Date: Mon, 14 Feb 2022 11:27:07 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH 1/6] block/io.c: fix bdrv_child_cb_drained_begin
 invocations from a coroutine
To: Kevin Wolf <kwolf@redhat.com>
References: <20220208153655.1251658-1-eesposit@redhat.com>
 <20220208153655.1251658-2-eesposit@redhat.com> <YgZOdni4B7/mIQQ6@redhat.com>
From: Emanuele Giuseppe Esposito <eesposit@redhat.com>
In-Reply-To: <YgZOdni4B7/mIQQ6@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eesposit@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
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
 SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
Cc: Fam Zheng <fam@euphon.net>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>, qemu-block@nongnu.org,
 qemu-devel@nongnu.org, Hanna Reitz <hreitz@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 John Snow <jsnow@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



On 11/02/2022 12:54, Kevin Wolf wrote:
> Am 08.02.2022 um 16:36 hat Emanuele Giuseppe Esposito geschrieben:
>> Using bdrv_do_drained_begin_quiesce() in bdrv_child_cb_drained_begin()
>> is not a good idea: the callback might be called when running
>> a drain in a coroutine, and bdrv_drained_begin_poll() does not
>> handle that case, resulting in assertion failure.
> 
> I remembered that we talked about this only recently on IRC, but it
> didn't make any sense to me again when I read this commit message. So I
> think we need --verbose.
> 
> The .drained_begin callback was always meant to run outside of coroutine
> context, so the unexpected part isn't that it calls a function that
> can't run in coroutine context, but that it is already called itself in
> coroutine context.
> 
> The problematic path is bdrv_replace_child_noperm() which then calls
> bdrv_parent_drained_begin_single(poll=true). Polling in coroutine
> context is dangerous, it can cause deadlocks because the caller of the
> coroutine can't make progress. So I believe this call is already wrong
> in coroutine context.

Ok, you added this assertion in dcf94a23, but at that time there was no
bdrv_parent_drained_begin_single, and the polling was only done in
bdrv_do_drained_begin. So I think that to keep the same logic, the
assertion should be moved in bdrv_parent_drained_begin_single()? And
even more specifically, only if the poll flag is true.

I triggered this by adding additional drains in the callers of
bdrv_replace_child_noperm(), and I think some test (probably unit test)
was failing because of either the drained_begin callback itself called
by the drain, or as you suggested the callbacks called by
bdrv_parent_drained_begin_single from bdrv_replace_child_noperm.

Anyways, I think that in addition to the fix in this patch, we should
also fix bdrv_parent_drained_begin_single(poll=true) in
bdrv_replace_child_noperm, with something similar to what is done in
bdrv_co_yield_to_drain? ie if we are in coroutine, schedule a BH that
runs the same logic but in the main loop, but then somehow wait that it
finishes before continuing?
Even though at that point we would have a coroutine waiting for the main
loop, which I don't think it's something we want.

Alternatively, we would forbid polling in coroutines at all. And the
only place I can see that is using the drain in coroutine is mirror (see
below).


Additional question: I also noticed that there is a bdrv_drained_begin()
call in mirror.c in the JobDriver run() callback. How can this even
work? If a parent uses bdrv_child_cb_drained_begin (which should not be
so rare) it will crash because of the assertion.

Further additional question: actually I don't understand also the
polling logic of mirror (mirror_drained_poll), as if we are draining in
the coroutine with in_drain = true I think we can have a deadlock if
in_flight>0?

Emanuele

> 
> Now I don't know the call path up to bdrv_replace_child_noperm(), but as
> far as I remember, that was another function that was originally never
> run in coroutine context. Maybe we have good reason to change this, I
> can't point to anything that would be inherently wrong with it, but I
> would still be curious in which context it does run in a coroutine now.
> 
> Anyway, whatever the specific place is, I believe we must drop out of
> coroutine context _before_ calling bdrv_parent_drained_begin_single(),
> not only in callbacks called by it.
> 
>> Instead, bdrv_do_drained_begin with no recursion and poll
>> will accomplish the same thing (invoking bdrv_do_drained_begin_quiesce)
>> but will firstly check if we are already in a coroutine, and exit
>> from that via bdrv_co_yield_to_drain().
>>
>> Signed-off-by: Emanuele Giuseppe Esposito <eesposit@redhat.com>
> 
> Kevin
> 


