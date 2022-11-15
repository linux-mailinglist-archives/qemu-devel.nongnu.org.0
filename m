Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DB0F3629DFA
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Nov 2022 16:46:56 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ouy47-0002CU-Tc; Tue, 15 Nov 2022 10:41:35 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1ouy45-00029j-9G
 for qemu-devel@nongnu.org; Tue, 15 Nov 2022 10:41:33 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1ouy43-00013H-5l
 for qemu-devel@nongnu.org; Tue, 15 Nov 2022 10:41:32 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1668526889;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=kJeR2khdByDU1V8nZjruIHXRsqmbWWTeIbxi+/xCxB8=;
 b=QFCMML0LNVOg2PqJpJyTSBPDugLu4AbVR3fB5O9CT0lxEQjTbXB2j6UMSgxqFrJwDwwW56
 Ze1LrQ5K6tDXsYpCp5d1uR8mEItCmESwuVEnx/+IMtfqpXdFSqs/0nOKgVQHgWyukYKxSC
 6K/YmyQrEMxns8+Q1PesWLteBM4Yd8c=
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com
 [209.85.219.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-635-El8nkG5zNMuVVc1pYXGYpg-1; Tue, 15 Nov 2022 10:41:28 -0500
X-MC-Unique: El8nkG5zNMuVVc1pYXGYpg-1
Received: by mail-qv1-f72.google.com with SMTP id
 ns11-20020a056214380b00b004c64784249eso3271635qvb.7
 for <qemu-devel@nongnu.org>; Tue, 15 Nov 2022 07:41:28 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=kJeR2khdByDU1V8nZjruIHXRsqmbWWTeIbxi+/xCxB8=;
 b=7C9oc/629UDMxG25ZvHIBmFlIl9aaLXn/TQDnrvmLvlZrhNwaryV1trOeE8X2swHPE
 40cGyOb0GQlJLWzNDKyqJ20pfHrI3fYQrTXFxEeODb7c2kaHT+gLSzd+M1ivezigV+SD
 sF4dCqEeS7eZVbDIuNKB7QCi5eT2pVXRDG3/0C5ZatEvhYeWm3+TP0wbBx33TubIsGgK
 sl25ypt5TAMNfXMPjwQVJnZuLQthS65Oczpbt58zul5CKq6UQ0wp3iVzIpD/oSQwBx1h
 s2aEAEHiZs83ZnxGIvPqWnGmyDIGvXC/RCBnBg31+YApo3SRjK53nI80BqhHw2/pR7Ke
 U3Kg==
X-Gm-Message-State: ANoB5pmQjoaMGXvY5WBtfxK+ajDYoaTFJzMd2tKU/m76i52jqz4u2W9o
 0CiUhgwgNgoLgB6g7d92Sp4sdtC/O9woKZ5usmfW0rrNhG6Ez2L1pvvZto2rlrvpT/o5uL7Cex1
 yyRmJ+Q4Pr/ym1NA=
X-Received: by 2002:ac8:5c02:0:b0:39c:c7a1:9aca with SMTP id
 i2-20020ac85c02000000b0039cc7a19acamr17072181qti.158.1668526887601; 
 Tue, 15 Nov 2022 07:41:27 -0800 (PST)
X-Google-Smtp-Source: AA0mqf5HZQ4n7mpwDEpuw3EOj5EF0uOOKvfbFvoeKt6Y28AFDPjr3FUnKl4RNUbXkXg0c14CwBn3lg==
X-Received: by 2002:ac8:5c02:0:b0:39c:c7a1:9aca with SMTP id
 i2-20020ac85c02000000b0039cc7a19acamr17072157qti.158.1668526887359; 
 Tue, 15 Nov 2022 07:41:27 -0800 (PST)
Received: from [192.168.149.123]
 (58.254.164.109.static.wline.lns.sme.cust.swisscom.ch. [109.164.254.58])
 by smtp.gmail.com with ESMTPSA id
 f9-20020a05620a280900b006eeb3165554sm8232273qkp.19.2022.11.15.07.41.25
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 15 Nov 2022 07:41:26 -0800 (PST)
Message-ID: <15a00149-a6b2-3d03-db56-d05f3906196f@redhat.com>
Date: Tue, 15 Nov 2022 16:41:24 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH v2 2/9] block-copy: add missing coroutine_fn annotations
Content-Language: en-US
To: Paolo Bonzini <pbonzini@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>,
 Kevin Wolf <kwolf@redhat.com>
Cc: qemu-block@nongnu.org, Hanna Reitz <hreitz@redhat.com>,
 John Snow <jsnow@redhat.com>, Eric Blake <eblake@redhat.com>,
 Fam Zheng <fam@euphon.net>, qemu-devel@nongnu.org,
 Stefan Hajnoczi <stefanha@redhat.com>, Alberto Faria <afaria@redhat.com>
References: <20221104095700.4117433-1-eesposit@redhat.com>
 <20221104095700.4117433-3-eesposit@redhat.com>
 <197f2a27-4c3f-a62b-535c-d1db9ba22a32@yandex-team.ru>
 <88f02d19-84d8-d1a7-4250-416fd32f1435@redhat.com>
 <711f6d68-888e-bca0-972e-a05503a039c5@yandex-team.ru>
 <460d096e-c642-166c-a4fd-77f953bfe33a@redhat.com>
 <CABgObfazW2eiiyffz_odFmbQXx8-Yu7fi1RdDwxKOEzocp0Eeg@mail.gmail.com>
From: Emanuele Giuseppe Esposito <eesposit@redhat.com>
In-Reply-To: <CABgObfazW2eiiyffz_odFmbQXx8-Yu7fi1RdDwxKOEzocp0Eeg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=eesposit@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

To sum up on what was discussed in this serie, I don't really see any
strong objection against these patches, so I will soon send v3 which is
pretty much the same except for patch 1, which will be removed.

I think these patches are useful and will be even more meaningful to the
reviewer when in the next few days I send all the rwlock patches.

What has been discussed so far (using QEMU_IN_COROUTINE, using some sort
of tool to automate everything, etc.) has been noted and as I understand
will be researched by Alberto.

Thank you,
Emanuele

Am 10/11/2022 um 11:52 schrieb Paolo Bonzini:
> On Wed, Nov 9, 2022 at 1:24 PM Emanuele Giuseppe Esposito
> <eesposit@redhat.com> wrote:
>>>> What I do know is that it's extremely confusing to understand if a
>>>> function that is *not* marked as coroutine_fn is actually being called
>>>> also from coroutines or not.
> 
> Agreed. This is a huge point in favor of pushing coroutine wrappers as
> far up in the call stack as possible, because it means more
> coroutine_fns and fewer mixed functions.
> 
>>> This is a lot better than our "coroutine_fn" sign, which actually do no
>>> check (and can't do). Don't you plan to swap a "coroutine_fn" noop
>>> marker with more meaningful IN_COROUTINE(); (or something like this,
>>> which just do assert(qemu_in_coroutine())) at start of the function? It
>>> would be a lot safer.
>>
>> CCing also Alberto and Paolo
>>
>> So basically I think what we need is something that scans the whole
>> block layer code and puts the right coroutine_fn annotations (or
>> assertions, if you want) in the right places.
> 
> coroutine_fn markers are done by Alberto's static analyzer, which I
> used to add coroutine_fn pretty much everywhere in the code base where
> they are *needed*. My rules are simple:
> 
> * there MUST be no calls from non-coroutine_fn to coroutine_fn, this is obvious
> 
> * there MUST be no blocking in coroutine_fn
> 
> * there SHOULD be no calls from coroutine_fn to generated_co_wrapper;
> use the wrapped *_co_* function directly instead.
> 
> To catch the last one, or possibly the last two, Alberto added
> no_coroutine_fn. In a perfect world non-marked functions would be
> "valid either in coroutine or non-coroutine function": they would call
> neither coroutine_fns nor no_coroutine_fns.
> 
> This is unfortunately easier said than done, but in order to move
> towards that case, I think we can look again at vrc and extend it with
> new commands. Alberto's work covers *local* tests, looking at one
> caller and one callee at a time. With vrc's knowledge of the global
> call graph, we can find *all* paths from a coroutine_fn to a
> generated_co_wrapper, including those that go through unmarked
> functions. Then there are two cases:
> 
> * if the unmarked function is never called from outside a coroutine,
> call the wrapped function and change it to coroutine_fn
> 
> * if the unmarked function can be called from outside a coroutine,
> change it to a coroutine_fn (renaming it) and add a
> generated_co_wrapper. Rinse and repeat.
> 
>> However, it would be nice to assign this to someone and do this
>> automatically, not doing it by hand. I am not sure if Alberto static
>> analyzer is currently capable of doing that.
> 
> I think the first step has to be done by hand, because it entails
> creating new generated_co_wrappers. Checking for regressions can then
> be done automatically though.
> 
> Paolo
> 


