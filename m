Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 09CD159805C
	for <lists+qemu-devel@lfdr.de>; Thu, 18 Aug 2022 10:54:44 +0200 (CEST)
Received: from localhost ([::1]:57618 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oObIX-0005Dr-Bg
	for lists+qemu-devel@lfdr.de; Thu, 18 Aug 2022 04:54:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33510)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1oObCP-0002XA-2T
 for qemu-devel@nongnu.org; Thu, 18 Aug 2022 04:48:21 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:39329)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1oObCM-0007Wc-19
 for qemu-devel@nongnu.org; Thu, 18 Aug 2022 04:48:19 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1660812496;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Fy//HE2f0orwbC+Sf+mZIfEBvAJQpDp7YWzXDMhI6M0=;
 b=i2sP3qpLUWMVfNpUrPZQ7SjOqOp/V79bISxEWUlgyHpNn8w7gPzOTWZiqriNyTtCAz9N1n
 x0txywCOJtRNhm5ooDArGHXwW0WFLYHthURE8+kXzo8ylL86cq/SIJEsdsSfXyRNsgqCIQ
 ohARWmSjBWyQYFnh/EMAP5Zg9pUrbRA=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-18-bMVVG0RYP4edGZfKUELzOg-1; Thu, 18 Aug 2022 04:48:15 -0400
X-MC-Unique: bMVVG0RYP4edGZfKUELzOg-1
Received: by mail-wr1-f69.google.com with SMTP id
 g11-20020adfa48b000000b002250d091f76so98098wrb.3
 for <qemu-devel@nongnu.org>; Thu, 18 Aug 2022 01:48:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:references:cc:to:from
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc;
 bh=Fy//HE2f0orwbC+Sf+mZIfEBvAJQpDp7YWzXDMhI6M0=;
 b=XzEfw+ZSI59HcD1dTabfIxHEEuTWf6Vb5ot80EEcarLFglZeg7NiDOamelWvqFpNW5
 st9MMNkffsbPQ2D3y5s+H58uDIDzS6ak3wOFmVw+opU0x/JGAZOdHPQqy2lB95UCZHMs
 pD/Q/iEnR2Z5KAR6+rs5I/8j8readAmsjNcEjr8PRk9heFJkvP8ChQUJVheQJH8IUxEz
 vDzobu6iK+KE0qbW7F1Axqk9Sb7ubZrdL9DhcGLrFWVqNdy9TsWX++/mBVED8UUiknOA
 tJHsmEaU9WfInE0rryrnN/mddKh9SLLPl1YQ2hCMpMPwEMMaPS27IMERfAFY4QiPr6lC
 vehQ==
X-Gm-Message-State: ACgBeo1NM5SXXJdUilQTMdfnHP0DZd0NVqJP2Ia84Oghdcuxos7chryt
 aKdJzmmvGvlAk1M8IxZyZ2msYa5yWgX2xpZBLjfVRuzXyr+QcV7+9WHMK8Jrss1+RglK9u2w9/b
 C3peNTyow0ga/EOc=
X-Received: by 2002:a05:6000:186f:b0:222:c091:9c59 with SMTP id
 d15-20020a056000186f00b00222c0919c59mr1056603wri.78.1660812494580; 
 Thu, 18 Aug 2022 01:48:14 -0700 (PDT)
X-Google-Smtp-Source: AA6agR4Kl42i/OUvt0a5YuDKbqgCgw3TMFxTbI0oQ1+2HOKHPTvdApuK94pGWbdXur65AQKAHKCvhA==
X-Received: by 2002:a05:6000:186f:b0:222:c091:9c59 with SMTP id
 d15-20020a056000186f00b00222c0919c59mr1056578wri.78.1660812494240; 
 Thu, 18 Aug 2022 01:48:14 -0700 (PDT)
Received: from [192.168.149.123]
 (58.254.164.109.static.wline.lns.sme.cust.swisscom.ch. [109.164.254.58])
 by smtp.gmail.com with ESMTPSA id
 r9-20020a056000014900b00222d512d96asm781510wrx.75.2022.08.18.01.48.13
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 18 Aug 2022 01:48:13 -0700 (PDT)
Message-ID: <56d1b572-1fa1-9bdf-9a79-4099d80b294b@redhat.com>
Date: Thu, 18 Aug 2022 10:48:13 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH v10 14/21] jobs: protect job.aio_context with BQL and
 job_mutex
Content-Language: en-US
From: Emanuele Giuseppe Esposito <eesposit@redhat.com>
To: Kevin Wolf <kwolf@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>
Cc: qemu-block@nongnu.org, Hanna Reitz <hreitz@redhat.com>,
 John Snow <jsnow@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 Wen Congyang <wencongyang2@huawei.com>,
 Xie Changlong <xiechanglong.d@gmail.com>,
 Markus Armbruster <armbru@redhat.com>, Stefan Hajnoczi
 <stefanha@redhat.com>, Fam Zheng <fam@euphon.net>, qemu-devel@nongnu.org
References: <20220725073855.76049-1-eesposit@redhat.com>
 <20220725073855.76049-15-eesposit@redhat.com> <Yuze6ldui3LtEcZm@redhat.com>
 <bbb32ac1-0212-a0b6-9fae-a5907fbc9668@redhat.com>
 <16f6c85b-ef82-943f-fba3-6c9ba13b4601@redhat.com>
In-Reply-To: <16f6c85b-ef82-943f-fba3-6c9ba13b4601@redhat.com>
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



Am 17/08/2022 um 15:10 schrieb Emanuele Giuseppe Esposito:
> 
> 
> Am 17/08/2022 um 10:04 schrieb Emanuele Giuseppe Esposito:
>>>> +    /* protect against read in job_do_yield_locked */
>>>> +    JOB_LOCK_GUARD();
>>>> +    /* ensure the coroutine is quiescent while the AioContext is changed */
>>>> +    assert(job->pause_count > 0);
>>> job->pause_count only shows that pausing was requested. The coroutine is
>>> only really quiescent if job->busy == false, too.
>>>
>>> Or maybe job->paused is actually the one you want here.
>> I think job->paused works too.
>>
> 
> Actually it doesn't. At least test-block-iothread
> test_propagate_mirror() fails, for both job->paused and !job->busy. I
> think the reason is that if we wait for the flag to be set, we need to
> actually wait that the job gets to the next pause point, because
> job_pause() doesn't really pause the job, it just kind of "schedules"
> the pause on next pause point.
> 
> So, either we leave pause_count > 0, or somehow wait (I was thinking
> AIO_WAIT_WHILE(job->paused) but that's probably a very bad idea).
> 
> Do you have any suggestion for that?
> Maybe Paolo has a better idea on how to do it?
> 

Additional update: after debugging it a little bit, I figured that there
are places where busy=false and paused=false too. This is clear in
job_do_dismiss and not-so-clear in job_exit (at least for me).

I don't know if this is expected or a bug, because it just means that if
we are draining and the job is completing, there is no way to stop it.

Is it a bug? Or am I missing something?

Emanuele


