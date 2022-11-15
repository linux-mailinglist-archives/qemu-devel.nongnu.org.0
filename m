Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C89D6295B3
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Nov 2022 11:23:37 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1out5S-0003RE-NX; Tue, 15 Nov 2022 05:22:38 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1out5J-0003QO-NS
 for qemu-devel@nongnu.org; Tue, 15 Nov 2022 05:22:33 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1out4a-0008Pn-1Q
 for qemu-devel@nongnu.org; Tue, 15 Nov 2022 05:21:57 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1668507702;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=6adZAsv4vhXClffHpy+O1Z4FvcrdKdURCq8l2nBGieM=;
 b=d7UrtlxUCVjheFayAtJJZC9GRgIrbK6+Enf3cI5jbCcuj0BKbTm5b78OB1Tk68IZgbEuMs
 JqN7wWUbzQdcl78EU9CswFHB9oO3Gb5v9pFAshMVK2MaS4noYRx5w+6hQjFjNWyNW0yDc9
 ZwAd4P4bECIu8fA1ufqMSRTFHfrM6Lw=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-590-QGncJqt8O-Kpul3doLPm9Q-1; Tue, 15 Nov 2022 05:21:41 -0500
X-MC-Unique: QGncJqt8O-Kpul3doLPm9Q-1
Received: by mail-wm1-f71.google.com with SMTP id
 v188-20020a1cacc5000000b003cf76c4ae66so10310820wme.7
 for <qemu-devel@nongnu.org>; Tue, 15 Nov 2022 02:21:41 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=6adZAsv4vhXClffHpy+O1Z4FvcrdKdURCq8l2nBGieM=;
 b=sSkUxkOXTAivYJr1JCdEzlyyhUOwgMednUHHy5lnaVaBaBb2XK8S/lMEn6euAfxxv9
 FyqtRa4ZgkAq+iKjrp4G4XUoZHg9U6BI5dPg1wyuHcsOUPw1d1AkGjfdT8lHfPWz4FXr
 RpnwRKSOz8oFcU01kRfJ1TKWU1qQCfo7B7TVpe4/uYFnAtQJktuGIDH99Kj/jDk5u7vN
 4W0Y/COcHvD17vUQcsW+kOhF29piorf4if3HzY0zjEVVSUFsvmelF1pU6AyuYasYSNRR
 WrdL9zsipXYEfzvEaFmuuj13rPEUnelPkLFewrFHVWQtnF85RQ4F8OiOYW6T99lJaf8p
 /eTw==
X-Gm-Message-State: ANoB5plX/4bEsgBdSsSWDbMUqR4IKhMtstTCm2pF14Gmgovasam9zOhS
 KbpxTxn1/G27q3aFLRaxJKaizTEgFm91tUrga9Rza0lz1VPfIF538i6XIL+jAEMS5oDkr0iehpl
 jaisQEpxoBqbwn4M=
X-Received: by 2002:adf:d212:0:b0:22a:f546:3f68 with SMTP id
 j18-20020adfd212000000b0022af5463f68mr10501674wrh.651.1668507700416; 
 Tue, 15 Nov 2022 02:21:40 -0800 (PST)
X-Google-Smtp-Source: AA0mqf5dImW7XufmWGxybS1Q8eNNNVRJpnoUhlYDhotzVLz2h6J8FxR1z0cxqXxGaO/wCPOIw/2UKA==
X-Received: by 2002:adf:d212:0:b0:22a:f546:3f68 with SMTP id
 j18-20020adfd212000000b0022af5463f68mr10501664wrh.651.1668507700158; 
 Tue, 15 Nov 2022 02:21:40 -0800 (PST)
Received: from ?IPV6:2a02:8071:5050:c500:3cbc:a8ad:61a8:57e3?
 ([2a02:8071:5050:c500:3cbc:a8ad:61a8:57e3])
 by smtp.gmail.com with ESMTPSA id
 j7-20020a05600c1c0700b003cf71b1f66csm16568722wms.0.2022.11.15.02.21.39
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 15 Nov 2022 02:21:39 -0800 (PST)
Message-ID: <74564d3a-2867-891c-07bf-7746abc121de@redhat.com>
Date: Tue, 15 Nov 2022 11:21:38 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PULL 00/11] Block layer patches
Content-Language: en-US
To: Kevin Wolf <kwolf@redhat.com>, John Snow <jsnow@redhat.com>
Cc: Stefan Hajnoczi <stefanha@gmail.com>, qemu-block@nongnu.org,
 stefanha@redhat.com, qemu-devel@nongnu.org
References: <20221111152744.261358-1-kwolf@redhat.com>
 <CAJSP0QVgzEAEdzrBd2Q3KsPBmCPTwzdO1dOb6KrY729esKLkZA@mail.gmail.com>
 <Y3Ie4aH6Da4qgWbU@redhat.com>
 <CAFn=p-YnmrM4X0sbYsVq=GY-7y8kwevqW=jxWV79twTx+sxmGw@mail.gmail.com>
 <Y3NmoCvJ+PJoLeLK@redhat.com>
From: Hanna Reitz <hreitz@redhat.com>
In-Reply-To: <Y3NmoCvJ+PJoLeLK@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=hreitz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, SPF_HELO_NONE=0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 15.11.22 11:14, Kevin Wolf wrote:
> Am 15.11.2022 um 00:58 hat John Snow geschrieben:
>> On Mon, Nov 14, 2022 at 5:56 AM Kevin Wolf <kwolf@redhat.com> wrote:
>>> Am 11.11.2022 um 20:20 hat Stefan Hajnoczi geschrieben:
>>>>> Hanna Reitz (9):
>>>>>        block/mirror: Do not wait for active writes
>>>>>        block/mirror: Drop mirror_wait_for_any_operation()
>>>>>        block/mirror: Fix NULL s->job in active writes
>>>>>        iotests/151: Test that active mirror progresses
>>>>>        iotests/151: Test active requests on mirror start
>>>>>        block: Make bdrv_child_get_parent_aio_context I/O
>>>>>        block-backend: Update ctx immediately after root
>>>>>        block: Start/end drain on correct AioContext
>>>>>        tests/stream-under-throttle: New test
>>>> Hi Hanna,
>>>> This test is broken, probably due to the minimum Python version:
>>>> https://gitlab.com/qemu-project/qemu/-/jobs/3311521303
>>> This is exactly the problem I saw with running linters in a gating CI,
>>> but not during 'make check'. And of course, we're hitting it during the
>>> -rc phase now. :-(
>> I mean. I'd love to have it run in make check too. The alternative was
>> never seeing this *anywhere* ...
> What is the problem with running it in 'make check'? The additional
> dependencies? If so, can we run it automatically if the dependencies
> happen to be fulfilled and just skip it otherwise?
>
> If I have to run 'make -C python check-pipenv' manually, I can guarantee
> you that I'll forget it more often than I'll run it.
>
>> ...but I'm sorry it's taken me so long to figure out how to get this
>> stuff to work in "make check" and also from manual iotests runs
>> without adding any kind of setup that you have to manage. It's just
>> fiddly, sorry :(
>>
>>> But yes, it seems that asyncio.TimeoutError should be used instead of
>>> asyncio.exceptions.TimeoutError, and Python 3.6 has only the former.
>>> I'll fix this up and send a v2 if it fixes check-python-pipenv.
>> Hopefully this goes away when we drop 3.6. I want to, but I recall
>> there was some question about some platforms that don't support 3.7+
>> "by default" and how annoying that was or wasn't. We're almost a year
>> out from 3.6 being EOL, so maybe after this release it's worth a crack
>> to see how painful it is to move on.
> If I understand the documentation right, asyncio.TimeoutError is what
> you should be using either way. That it happens to be a re-export from
> the internal module asyncio.exceptions seems to be more of an
> implementation detail, not the official interface.

Oh, so I understood 
https://docs.python.org/3/library/asyncio-exceptions.html wrong.  I took 
that to mean that as of 3.11, `asyncio.TimeoutError` is a deprecated 
alias for `asyncio.exceptions.TimeoutError`, but it’s actually become an 
alias for the now-built-in `TimeoutError` exception.  I think.

Hanna


