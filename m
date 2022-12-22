Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AA757653E23
	for <lists+qemu-devel@lfdr.de>; Thu, 22 Dec 2022 11:17:56 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p8IUJ-0006Hz-I3; Thu, 22 Dec 2022 05:07:43 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1p8IUH-0006H9-Rx
 for qemu-devel@nongnu.org; Thu, 22 Dec 2022 05:07:42 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1p8IUD-0008Fq-7Z
 for qemu-devel@nongnu.org; Thu, 22 Dec 2022 05:07:41 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1671703656;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=a7vMgdOPbvvJbw5NPDT3cSsc3lKu7v2FKQI+I+KZjY0=;
 b=WGLmy9egCnmMA8YQQtTZTk1NtmMj4K3kSAs4dPm82+XIpkyoDeiWP4Y1UIYtzZKgk4UdLj
 XWeG564MnTJUZAAfx+htOdKuISOz8OtN9ObhCO7/JEwjbA+5mp9Ws5toR071t0AAzoLbQI
 LO8NRHipaTzemfdxkTEo28Jmintj+RY=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-417-cGg-3N5aM_CVRxWMPsTjdQ-1; Thu, 22 Dec 2022 05:07:34 -0500
X-MC-Unique: cGg-3N5aM_CVRxWMPsTjdQ-1
Received: by mail-wm1-f71.google.com with SMTP id
 n8-20020a05600c294800b003d1cc68889dso350837wmd.7
 for <qemu-devel@nongnu.org>; Thu, 22 Dec 2022 02:07:34 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:reply-to:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=a7vMgdOPbvvJbw5NPDT3cSsc3lKu7v2FKQI+I+KZjY0=;
 b=vgd5ELVow6ZxGL7PWiQgpz4NmcxpJzCg3VaCew3IGp7Gv8pkklO0shJteK0mRAzRcd
 2jEAKqI8bXLIzud7NYL4FHzkxmB4rNGHmbCzDHUpRlZ+zsDcpbsd6nEkyaC07g5ga0OX
 eG6H8frr1iF1ZS3cCgn8Dh9TOd0nrmUQxvxzkcDjjw7fb09PfynbaTpMtzbdhZVgD0d9
 G4DhtGE7s+qXfPP4aLMuV4ouKwjkB9pGI6so5kqmzPcmzaGq3GId69D1s3ptAr5P5cPK
 BEILfkArmuHD++NGvYHanBI2odRn9U71E3rJUX6iJu8fXJ59vgaIRAUanHgXn1w/Q6r0
 tzKA==
X-Gm-Message-State: AFqh2koDaMWSoafwmsroQrReQxLc5jbbtj4tOTQPuQCpdp5hECHm6G7I
 fDoJtsBMNMOTUh2HUt33Jpv0gZLF4ZZF6KNJjkeLkPVCZC6tNxyO4q/OA/AtcmJZtIXzQWkeFdy
 DSxHEOR2uaIrWrZI=
X-Received: by 2002:a05:600c:688f:b0:3d9:69a5:949e with SMTP id
 fn15-20020a05600c688f00b003d969a5949emr551183wmb.8.1671703653460; 
 Thu, 22 Dec 2022 02:07:33 -0800 (PST)
X-Google-Smtp-Source: AMrXdXsy61T+OM+VpxbrazylrRFX8/bM4nV+CWQDddGuJ6926C7IfkDqCWv75D0FKpjM+QpVthQrqw==
X-Received: by 2002:a05:600c:688f:b0:3d9:69a5:949e with SMTP id
 fn15-20020a05600c688f00b003d969a5949emr551169wmb.8.1671703653248; 
 Thu, 22 Dec 2022 02:07:33 -0800 (PST)
Received: from ?IPV6:2a01:e0a:59e:9d80:527b:9dff:feef:3874?
 ([2a01:e0a:59e:9d80:527b:9dff:feef:3874])
 by smtp.gmail.com with ESMTPSA id
 n9-20020a05600c4f8900b003d1b4d957aasm541656wmq.36.2022.12.22.02.07.31
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 22 Dec 2022 02:07:32 -0800 (PST)
Message-ID: <5045cc9a-b383-b1d3-b3fd-a9f84dd74f36@redhat.com>
Date: Thu, 22 Dec 2022 11:07:31 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.1
Subject: Re: [PATCH v2] target/i386: Remove compilation errors when
 -Werror=maybe-uninitialized
Content-Language: en-US
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, eric.auger.pro@gmail.com,
 richard.henderson@linaro.org, paul@nowt.org, qemu-devel@nongnu.org,
 stefanha@fmail.com, peter.maydell@linaro.org, sw@weilnetz.de
References: <20221221163652.1239362-1-eric.auger@redhat.com>
 <ed6d68f4-81aa-d9a1-3a71-628855e8a376@redhat.com>
 <bafaad8e-f4f7-ddeb-4fbd-cebc7b8c360e@linaro.org>
From: Eric Auger <eric.auger@redhat.com>
In-Reply-To: <bafaad8e-f4f7-ddeb-4fbd-cebc7b8c360e@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124;
 envelope-from=eric.auger@redhat.com; helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-1.148, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
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
Reply-To: eric.auger@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Hi Philippe,

On 12/22/22 10:01, Philippe Mathieu-Daudé wrote:
> On 22/12/22 09:18, Paolo Bonzini wrote:
>> On 12/21/22 17:36, Eric Auger wrote:
>>> To avoid compilation errors when -Werror=maybe-uninitialized is used,
>>> replace 'case 3' by 'default'.
>>>
>>> Otherwise we get:
>>>
>>> ../target/i386/ops_sse.h: In function ‘helper_vpermdq_ymm’:
>>> ../target/i386/ops_sse.h:2495:13: error: ‘r3’ may be used
>>> uninitialized in this function [-Werror=maybe-uninitialized]
>>>     2495 |     d->Q(3) = r3;
>>>          |     ~~~~~~~~^~~~
>>> ../target/i386/ops_sse.h:2494:13: error: ‘r2’ may be used
>>> uninitialized in this function [-Werror=maybe-uninitialized]
>>>     2494 |     d->Q(2) = r2;
>>>          |     ~~~~~~~~^~~~
>>> ../target/i386/ops_sse.h:2493:13: error: ‘r1’ may be used
>>> uninitialized in this function [-Werror=maybe-uninitialized]
>>>     2493 |     d->Q(1) = r1;
>>>          |     ~~~~~~~~^~~~
>>> ../target/i386/ops_sse.h:2492:13: error: ‘r0’ may be used
>>> uninitialized in this function [-Werror=maybe-uninitialized]
>>>     2492 |     d->Q(0) = r0;
>>>          |     ~~~~~~~~^~~~
>
> With what compiler? Is that a supported one?
https://lore.kernel.org/qemu-devel/3aab489e-9d90-c1ad-0b6b-b2b5d80db723@redhat.com/
>
>>> Signed-off-by: Eric Auger <eric.auger@redhat.com>
>>> Suggested-by: Stefan Weil <sw@weilnetz.de>
>>> Fixes: 790684776861 ("target/i386: reimplement 0x0f 0x3a, add AVX")
>>> ---
>>>   target/i386/ops_sse.h | 4 ++--
>>>   1 file changed, 2 insertions(+), 2 deletions(-)
>>>
>>> diff --git a/target/i386/ops_sse.h b/target/i386/ops_sse.h
>>> index 3cbc36a59d..c442c8c10c 100644
>>> --- a/target/i386/ops_sse.h
>>> +++ b/target/i386/ops_sse.h
>>> @@ -2466,7 +2466,7 @@ void helper_vpermdq_ymm(Reg *d, Reg *v, Reg
>>> *s, uint32_t order)
>>>           r0 = s->Q(0);
>>>           r1 = s->Q(1);
>>>           break;
>>> -    case 3:
>>> +    default:
>>>           r0 = s->Q(2);
>>>           r1 = s->Q(3);
>>>           break;
>>> @@ -2484,7 +2484,7 @@ void helper_vpermdq_ymm(Reg *d, Reg *v, Reg
>>> *s, uint32_t order)
>>>           r2 = s->Q(0);
>>>           r3 = s->Q(1);
>>>           break;
>>> -    case 3:
>>> +    default:
>>>           r2 = s->Q(2);
>>>           r3 = s->Q(3);
>>>           break;
>>
>> Queued, but this compiler sucks. :)
>
> Can't we simply add a dumb 'default' case? So when reviewing we don't
> have to evaluate 'default' means 3 here.
>
> -- >8 --
> --- a/target/i386/ops_sse.h
> +++ b/target/i386/ops_sse.h
> @@ -2470,6 +2470,8 @@ void helper_vpermdq_ymm(Reg *d, Reg *v, Reg *s,
> uint32_t order)
>          r0 = s->Q(2);
>          r1 = s->Q(3);
>          break;
> +    default:
> +        qemu_build_not_reached();
>      }
>      switch ((order >> 4) & 3) {
>      case 0:
> @@ -2488,6 +2490,8 @@ void helper_vpermdq_ymm(Reg *d, Reg *v, Reg *s,
> uint32_t order)
>          r2 = s->Q(2);
>          r3 = s->Q(3);
>          break;
> +    default:
> +        qemu_build_not_reached();
>      }
I guess this won't fix the fact r0, r1, r2, r3 are not initialized, will it?

Thanks

Eric
>      d->Q(0) = r0;
>      d->Q(1) = r1;
> ---
>


