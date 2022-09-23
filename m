Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AD8815E78CD
	for <lists+qemu-devel@lfdr.de>; Fri, 23 Sep 2022 12:53:44 +0200 (CEST)
Received: from localhost ([::1]:42740 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1obgJT-0008M4-Hq
	for lists+qemu-devel@lfdr.de; Fri, 23 Sep 2022 06:53:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48062)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1obgDG-0004GE-3r
 for qemu-devel@nongnu.org; Fri, 23 Sep 2022 06:47:20 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:23985)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1obgDB-0004V3-RF
 for qemu-devel@nongnu.org; Fri, 23 Sep 2022 06:47:16 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1663930032;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=o+CTC0BQhVnSMTvBtg2pJ6gj5J6eW0w4UyCFIo1XCms=;
 b=FKbokIePzLY8n9nlgz9GQ9HUgM0ifSDFxSVEFX0YpcYvff5GsP7JoWsxSjScnUrYmCMBtr
 1yt+UP9amDz/HKy11cXCDjLae2Rums7Xyv7d3nHxDuOuEFP//eFDkQItVv82glaXzblK6u
 7Du8Hw0FtsUmEnNalTBPzDn3UXxeNwQ=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-359-GZT8hKSzNlKU91y9zGokDQ-1; Fri, 23 Sep 2022 06:47:11 -0400
X-MC-Unique: GZT8hKSzNlKU91y9zGokDQ-1
Received: by mail-wm1-f69.google.com with SMTP id
 d5-20020a05600c34c500b003b4fb42ccdeso2527112wmq.8
 for <qemu-devel@nongnu.org>; Fri, 23 Sep 2022 03:47:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:subject:organization:from
 :references:cc:to:content-language:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date;
 bh=o+CTC0BQhVnSMTvBtg2pJ6gj5J6eW0w4UyCFIo1XCms=;
 b=eTiJL9nqfN6d2N0DnwFeEGtmSqBtfYu3Yb8ZHVbWkN8FPTqVSohYYjXPJeO9NE2wVk
 jeTd2K1jhdnx8nsKsHbvY3H8bt7zaK9yLj2FepB7sVwl6lOTQjO9VrZMiAQ9iSALXtgJ
 9k2xTKHOzYSW6U8mP4+iPkOkPb5swKf5LR+zTWPVtYcfUGPUWWPxnLNWwZq7JdrL5ChA
 YVky4Kh0pOr/TFmZG3VvMVUuJG728QMonLFctv/fRZG7v+ErQMmAUzO344Kp+txZ+g2U
 ZwYJZcWdGABVD/9//EcHRN2ZcutAe3tGCbiiL9qQP7L2BjCoFtMmPz4773OQ6r6HLDIn
 URAg==
X-Gm-Message-State: ACrzQf16qI5c8pbfjTMTExORbqe2zarFuaEYX5u4zWZHTwLdSsm0jd2X
 krcEFkDv9a/tIC5ZDX/TPFniAPuD3oXa8qBaGO4P/FiXKfbPuquvZ4/Xxx2TuD0Slf12fEgIV5t
 l451OziTEvnYsR+Y=
X-Received: by 2002:a05:6000:2c8:b0:22a:efdf:ecc0 with SMTP id
 o8-20020a05600002c800b0022aefdfecc0mr4946047wry.57.1663930030494; 
 Fri, 23 Sep 2022 03:47:10 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM6V+btGs3urL0Or/D7ah/HbYWMUowtdE/3lknK/389ILJ52R2bodcvgNWIkXGnF1E2iDOqgHw==
X-Received: by 2002:a05:6000:2c8:b0:22a:efdf:ecc0 with SMTP id
 o8-20020a05600002c800b0022aefdfecc0mr4946029wry.57.1663930030188; 
 Fri, 23 Sep 2022 03:47:10 -0700 (PDT)
Received: from ?IPV6:2003:cb:c704:cc00:4585:a83b:64f2:ad21?
 (p200300cbc704cc004585a83b64f2ad21.dip0.t-ipconnect.de.
 [2003:cb:c704:cc00:4585:a83b:64f2:ad21])
 by smtp.gmail.com with ESMTPSA id
 fc9-20020a05600c524900b003b435c41103sm3248508wmb.0.2022.09.23.03.47.09
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 23 Sep 2022 03:47:09 -0700 (PDT)
Message-ID: <e6fad3bc-66e9-faea-194c-30277c0aa90f@redhat.com>
Date: Fri, 23 Sep 2022 12:47:08 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.0
Content-Language: en-US
To: "Jason A. Donenfeld" <Jason@zx2c4.com>
Cc: Thomas Huth <thuth@redhat.com>, qemu-devel@nongnu.org,
 qemu-s390x@nongnu.org, Christian Borntraeger <borntraeger@linux.ibm.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Cornelia Huck <cohuck@redhat.com>,
 Harald Freudenberger <freude@linux.ibm.com>,
 Holger Dengler <dengler@linux.ibm.com>
References: <20220921100729.2942008-1-Jason@zx2c4.com>
 <20220922153820.221811-1-david@redhat.com>
 <abf6fbb6-14f4-8c65-f5ac-a75b9c8931dd@redhat.com>
 <98dcb657-8862-5868-3979-55fc49864904@redhat.com>
 <e8041184-cfdd-d429-0377-db6b46d4d0ef@redhat.com>
 <6bf799d5-18a1-f01c-b227-a7dc98c2c8cf@redhat.com>
 <Yy16Mz7+yLCV5jH8@zx2c4.com>
From: David Hildenbrand <david@redhat.com>
Organization: Red Hat
Subject: Re: [PATCH v8.1 1/2] target/s390x: support SHA-512 extensions
In-Reply-To: <Yy16Mz7+yLCV5jH8@zx2c4.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=david@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

>> 3) I won't follow up with additional cleanup patches because I already
>> spent more time on this than I originally planned.
> 
> What is this B.S.?
> I spent months on this code and had to poke you a
> bunch to review it. You spend one afternoon with it and you're already
> burnt out, apparently. Sorry to hear that. But also, something is amiss

There is a big difference between "burnt out" and "having to 
prioritize". No need to feel sorry.

You must be fortunate if "one afternoon" is not a significant time 
investment. For me it is a significant investment.

> when the volunteer completely outside his realm of expertise has a
> greater commitment than the professional maintainer. Regardless, seeing > that kind of thing here doesn't make me enthusiastic about contributing
> to s390 stuff in the future, in the sense that hearing "I won't work
> more on this" from a maintainer is a contagious sentiment; leaders are
> emulated.

Let's recap:

1. This is very complicated code and a complicated instruction to
    emulate. It's not easy to review. It's not easy code to write for
    someone new to s390x / TCG -- especially to get memory
    accesses right and work around the lack of memory transactions.

2. We provided early feedback fast, but I expressed that there are
    certain things that need improvements and that might be coded in a
    way that make it easier to understand/review. I had to play myself
    with that code to figure out what it even does and how we can improve
    it. As I was overloaded lately (including vacation, conferences),
    that time was not hard to find because other projects were of higher
    priority on my end.

3. You really pushed me hard offline to look into it. I did it
    ASAP because it fell through the cracks and I expressed that I am
    sorry. I proposed to get it ready for upstream and you agreed. Thomas
    was aware of that communication.


I sent out something ASAP to get your stuff finally merged. I really 
tried my best yesterday. Apparently I failed.

In an ideal world I would have *never* sent out that code. I would have 
provided review feedback and guidance to make that code easier to grasp 
and sort out the remaining issues. I thought we (Thomas included) had an 
agreement that that's the way we are going to do it. Apparently I was wrong.


Most probably I lived in the kernel space too long such that we don't 
rush something upstream. For that reason *I* sent out a patch with 
fixups included instead of requesting more changes after you clearly 
expressed that you don't want to wait any longer.


Here I am, getting told by Thomas that we now do it differently now. 
What I really tried to express here is: if Thomas wants to commit things 
differently now, maybe he can just separate the cleanup parts. I really 
*don't want* to send out a multi-patch series to cleanup individual 
parts -- that takes significantly more time. Especially not if something 
is not committed yet.


Yes, such upstream experiences are discouraging to new contributors. But 
such upstream experiences discourage maintainer like me as well. This 
morning I honestly asked myself if I should still be listed as a 
maintainer under s390x/tcg.

Not sure if s390x/tcg would be better without me, but then I get to 
disappoint less people.

> 
> The 2/2 patch doesn't even apply on top of your "v8.1 1/2", so your
> submission isn't even easily apply-able.

Sorry, but that's a piece of cake for Thomas. And he could always 
request a complete resend from me anytime.

-- 
Thanks,

David / dhildenb


