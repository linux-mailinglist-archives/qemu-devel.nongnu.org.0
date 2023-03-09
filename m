Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D11FE6B2595
	for <lists+qemu-devel@lfdr.de>; Thu,  9 Mar 2023 14:38:27 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1paGT5-0008RP-Hx; Thu, 09 Mar 2023 08:38:03 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1paGT3-0008JN-8v
 for qemu-devel@nongnu.org; Thu, 09 Mar 2023 08:38:01 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1paGT0-0005SZ-2r
 for qemu-devel@nongnu.org; Thu, 09 Mar 2023 08:38:01 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1678369077;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=JF9joL/dtIG2xZY/vGowghxQykGxiDZKCPHyR0P+GTc=;
 b=SYAl+1ldXbjTiRoRUgo1I90uN8lG0nbAD69MyWycryJM7FoU0E/Lp00LPpA09mxOEssnoA
 6AqHt7S9Wxu05rDZqg6iv3DPBQzJ8F7LuuS91LqCT2qrMcBQpS0RCXjzh9q0J6kghZFbsw
 ODFGmxdS6njH+7i/PFR5DzSgZLiXWrE=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-414-_LXabbA7MIOtqFmcmtCvBw-1; Thu, 09 Mar 2023 08:37:55 -0500
X-MC-Unique: _LXabbA7MIOtqFmcmtCvBw-1
Received: by mail-ed1-f69.google.com with SMTP id
 k12-20020a50c8cc000000b004accf30f6d3so2971742edh.14
 for <qemu-devel@nongnu.org>; Thu, 09 Mar 2023 05:37:55 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678369075;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=JF9joL/dtIG2xZY/vGowghxQykGxiDZKCPHyR0P+GTc=;
 b=6NaU++UVAAYTYkwDjx33AYpHYnkDDh4Vs9w/hAhTf+mY4MPYSuVs94G8Gi/CuUPYxy
 /Bxwrtm786TXzQd/j7xg66togtVAGmRhjMKR6pB/ZTaA0nxdhAH4tiSXgv/4oA3qOlMm
 +rzlaXC3QViYvfphB4B2aPlTdNm7nmYwKf1Gi9UV/RKQ0VR5KD/2L7WLVLZrWYJ6kj2t
 N0NPVvFPaBcukp1XIUJ8hsutaz8LW1J8wPDRkd2PQ8cwoSPifxjj6ZSL7Z/ScHeUnVPf
 B4deJKOPCLcEsMzBHuyQiStRXfry7tbcafPxuZ53fx8KBe2tZ6S+MKHFDbUs+xoD69+F
 9sLA==
X-Gm-Message-State: AO0yUKU80MvW2gQ2LZiQDhjLzhEzfN1MO/MqPw944iDMvf8GhVuDXRdP
 RW0iq2PeeU9/g0Fr8IB1yMSLfwZadzVumKgkSnjANkPQsszJsladpkknc2eLXId+oeNzOiIXg8J
 H78vs5EEmSewH1xM=
X-Received: by 2002:aa7:d6d5:0:b0:4c3:8bde:c250 with SMTP id
 x21-20020aa7d6d5000000b004c38bdec250mr21261724edr.33.1678369074767; 
 Thu, 09 Mar 2023 05:37:54 -0800 (PST)
X-Google-Smtp-Source: AK7set+sCi8dlruVBh/8tbGNsJxdU/CCazoU2jKqux1lNyvIvgiBRgN1nR2WafzOi+ppW5L9Im/fQg==
X-Received: by 2002:aa7:d6d5:0:b0:4c3:8bde:c250 with SMTP id
 x21-20020aa7d6d5000000b004c38bdec250mr21261708edr.33.1678369074479; 
 Thu, 09 Mar 2023 05:37:54 -0800 (PST)
Received: from ?IPV6:2001:b07:6468:f312:63a7:c72e:ea0e:6045?
 ([2001:b07:6468:f312:63a7:c72e:ea0e:6045])
 by smtp.googlemail.com with ESMTPSA id
 m22-20020a1709066d1600b00908ecda035csm9027553ejr.146.2023.03.09.05.37.53
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 09 Mar 2023 05:37:53 -0800 (PST)
Message-ID: <29a4751a-584e-d086-34c5-9c3c978ddf57@redhat.com>
Date: Thu, 9 Mar 2023 14:37:53 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH v2 2/3] block: make BlockBackend->disable_request_queuing
 atomic
Content-Language: en-US
To: Stefan Hajnoczi <stefanha@redhat.com>
Cc: qemu-devel@nongnu.org, Hanna Reitz <hreitz@redhat.com>,
 Kevin Wolf <kwolf@redhat.com>, qemu-block@nongnu.org,
 Emanuele Giuseppe Esposito <eesposit@redhat.com>
References: <20230307210427.269214-1-stefanha@redhat.com>
 <20230307210427.269214-3-stefanha@redhat.com>
 <d9ec7184-460d-f5f6-e45b-79c9979bafa0@redhat.com>
 <20230309123118.GB370169@fedora>
From: Paolo Bonzini <pbonzini@redhat.com>
In-Reply-To: <20230309123118.GB370169@fedora>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

On 3/9/23 13:31, Stefan Hajnoczi wrote:
> On Thu, Mar 09, 2023 at 10:07:40AM +0100, Paolo Bonzini wrote:
>> On 3/7/23 22:04, Stefan Hajnoczi wrote:
>>> This field is accessed by multiple threads without a lock. Use explicit
>>> qatomic_read()/qatomic_set() calls. There is no need for acquire/release
>>> because blk_set_disable_request_queuing() doesn't provide any
>>> guarantees (it helps that it's used at BlockBackend creation time and
>>> not when there is I/O in flight).
>>
>> This in turn means itdoes not need to be atomic - atomics are only needed if
>> there are concurrent writes.  No big deal; I am now resurrecting the series
>> from the time I had noticed the queued_requests thread-safety problem, so
>> this will be simplified in 8.1.  For now your version is okay, thanks for
>> fixing it!
> 
> I was under the impression that variables accessed by multiple threads
> outside a lock or similar primitive need memory_order_relaxed both as
> documentation and to tell the compiler that they should indeed be atomic
> (but without ordering guarantees).

Atomic accesses are needed to avoid data races.  Data races are 
concurrent accesses, of which at least one is a non-atomic write.  (A is 
concurrent with B is you can't be sure that A happens before B or vice 
versa; this intuitively is the "lock or similar primitive" that you 
mentioned.  Happens-before changes from one execution to the other, but 
it is enough to somehow prove there _is_ an ordering; for example, given 
two accesses that are done while a mutex is taken, one will always 
happen before the other).

In this case all writes to disable_request_queuing happen not just 
outside I/O, but even *before* the first I/O.  No writes that are 
concurrent with reads => no need to use atomic for reads.

For example the stdin global variable is accessed from multiple threads 
and you would never use atomics to read the pointer.  Just don't write 
to it and there won't be data races.

> I think memory_order_relaxed also tells the compiler to do a bit more,
> like to generate just a single store to the variable for each occurrence
> in the code ("speculative" and "out-of-thin air" stores).

The correspondence is not necessarily 1:1, some optimizations are 
possible; for example this:

   qatomic_set(&x, 0);
   a = qatomic_read(&x);
   qatomic_set(&x, a + 1);

can be changed to

   a = 0;
   qatomic_set(&x, 1);

(because it is safe to assume that no other thread sees the state where 
x==0).  Or the first read here:

   a = qatomic_read(&x);
   a = qatomic_read(&x);

can be optimized out, unlike Linux's READ_ONCE().

I have no idea if compilers actually perform these optimizations, but if 
they do they are neither frequent (maybe in languages that inline a lot 
more, but not in QEMU) nor problematic.  Even though there's some 
freedom in removing/consolidating code, it's true as you said that 
speculation is a no-no!

> It's the documentation part that's most interesting in this case. Do we
> not want to identify variables that are accessed outside a lock and
> therefore require some thought?

I think it depends, see the stdin example before.  As the API is now, I 
agree that using qatomic_read() is the right thing to do.  In principle 
the flag could bounce back and forth many times. :/

With a better API, the balance may tilt on the side of not using 
atomics.  We'll see when I post the patch. :)

Paolo


