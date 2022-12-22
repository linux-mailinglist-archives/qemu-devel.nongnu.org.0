Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 806FF653EF1
	for <lists+qemu-devel@lfdr.de>; Thu, 22 Dec 2022 12:19:22 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p8Jb8-0000pM-DG; Thu, 22 Dec 2022 06:18:50 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1p8Jav-0000mC-MV
 for qemu-devel@nongnu.org; Thu, 22 Dec 2022 06:18:39 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1p8Jat-0003hk-U8
 for qemu-devel@nongnu.org; Thu, 22 Dec 2022 06:18:37 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1671707915;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=BWXW1/Wr68c9z1N5reAwcX/AFG8PQv3KlzvGPtAlhHI=;
 b=bIwWzRXPDn4Yu7DyxP2XSk54+rt1AFpxmWukLedXvNtcZx4Juymh51fnUJ4S8EJZ5AF5pG
 LntqDZoNOnLlvlVKoX8C9KdalsYUAbamR4z95i5WIAEkh3VjrfzUOY1NpK7qtNFXRtVFy+
 2kRmFUQo1kBy9iaA3V3xXAj6MgmZ3zs=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-651-cF56eUYBPmW_svM3j5Djew-1; Thu, 22 Dec 2022 06:18:32 -0500
X-MC-Unique: cF56eUYBPmW_svM3j5Djew-1
Received: by mail-wm1-f71.google.com with SMTP id
 r67-20020a1c4446000000b003d09b0fbf54so2221270wma.3
 for <qemu-devel@nongnu.org>; Thu, 22 Dec 2022 03:18:31 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:reply-to:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=BWXW1/Wr68c9z1N5reAwcX/AFG8PQv3KlzvGPtAlhHI=;
 b=u/pfHIhkzGzLffFQNQm7OSom7q0f46XnJNle+owsbfO0dFO1ca96mvzdQG+IoReFEv
 3lCZ0Go5mGE75vu9gP4pJZzZ0mLyFk8kZIP+1ZF3owIlMzBFwwjiRjZ3TrvWvKW0jNXW
 JnigHUJ9kzAeXWYz3/jesR/JLx9dRn5cRhaZiKFvxhnKzTMgePXhLvpqKDqEkqatHt6K
 VhKNQoSINr0elNd4E6rAxvYyl6HXw0HCyyYhwNrdIcuUMGMaWMgktOk3vKXdIgtawSGg
 W6JPEcL7dGwxvQp4Dd3HgpzLWHQMXycTCXUZPvGDcq+Ayb07Dgj4jiOSEgsdeaAyTog2
 vYIg==
X-Gm-Message-State: AFqh2kp+PeRqnyVeVO91sVa+7Ze8q3pjz/zDEBe3q0jNAmCtQ9tVyj6C
 HBn0Yeb1fiHUZxW9whKhqKv9ARV+6+a5NI7NfS0s3E8GpJkbFGoZvsmDLK+KJIKOlGJ+n8mcddL
 SyWGoNieAr/dIb8k=
X-Received: by 2002:a5d:67c7:0:b0:242:57bb:ee0f with SMTP id
 n7-20020a5d67c7000000b0024257bbee0fmr2859222wrw.25.1671707910917; 
 Thu, 22 Dec 2022 03:18:30 -0800 (PST)
X-Google-Smtp-Source: AMrXdXsNUJaj+GFffUegvFE2ii6loaNZgGno9TxJZibKZrlRbW2kN9HQdG0aMaI0l6DOOCAyBAGYxg==
X-Received: by 2002:a5d:67c7:0:b0:242:57bb:ee0f with SMTP id
 n7-20020a5d67c7000000b0024257bbee0fmr2859210wrw.25.1671707910700; 
 Thu, 22 Dec 2022 03:18:30 -0800 (PST)
Received: from ?IPV6:2a01:e0a:59e:9d80:527b:9dff:feef:3874?
 ([2a01:e0a:59e:9d80:527b:9dff:feef:3874])
 by smtp.gmail.com with ESMTPSA id
 j13-20020adfff8d000000b002423a5d7cb1sm214868wrr.113.2022.12.22.03.18.29
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 22 Dec 2022 03:18:30 -0800 (PST)
Message-ID: <a8f5caa6-e0b4-25fb-4eab-ff33dc45fbef@redhat.com>
Date: Thu, 22 Dec 2022 12:18:28 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.1
Subject: Re: [PATCH v2] target/i386: Remove compilation errors when
 -Werror=maybe-uninitialized
Content-Language: en-US
To: =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>
Cc: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, eric.auger.pro@gmail.com,
 richard.henderson@linaro.org, paul@nowt.org, qemu-devel@nongnu.org,
 peter.maydell@linaro.org, sw@weilnetz.de,
 Stefan Hajnoczi <stefanha@redhat.com>
References: <20221221163652.1239362-1-eric.auger@redhat.com>
 <ed6d68f4-81aa-d9a1-3a71-628855e8a376@redhat.com>
 <bafaad8e-f4f7-ddeb-4fbd-cebc7b8c360e@linaro.org>
 <5045cc9a-b383-b1d3-b3fd-a9f84dd74f36@redhat.com>
 <Y6Q636fbFWDnF0w7@redhat.com>
From: Eric Auger <eric.auger@redhat.com>
In-Reply-To: <Y6Q636fbFWDnF0w7@redhat.com>
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

Hi All,

On 12/22/22 12:09, Daniel P. Berrangé wrote:
> On Thu, Dec 22, 2022 at 11:07:31AM +0100, Eric Auger wrote:
>> Hi Philippe,
>>
>> On 12/22/22 10:01, Philippe Mathieu-Daudé wrote:
>>> On 22/12/22 09:18, Paolo Bonzini wrote:
>>>> On 12/21/22 17:36, Eric Auger wrote:
>>>>> To avoid compilation errors when -Werror=maybe-uninitialized is used,
>>>>> replace 'case 3' by 'default'.
>>>>>
>>>>> Otherwise we get:
>>>>>
>>>>> ../target/i386/ops_sse.h: In function ‘helper_vpermdq_ymm’:
>>>>> ../target/i386/ops_sse.h:2495:13: error: ‘r3’ may be used
>>>>> uninitialized in this function [-Werror=maybe-uninitialized]
>>>>>     2495 |     d->Q(3) = r3;
>>>>>          |     ~~~~~~~~^~~~
>>>>> ../target/i386/ops_sse.h:2494:13: error: ‘r2’ may be used
>>>>> uninitialized in this function [-Werror=maybe-uninitialized]
>>>>>     2494 |     d->Q(2) = r2;
>>>>>          |     ~~~~~~~~^~~~
>>>>> ../target/i386/ops_sse.h:2493:13: error: ‘r1’ may be used
>>>>> uninitialized in this function [-Werror=maybe-uninitialized]
>>>>>     2493 |     d->Q(1) = r1;
>>>>>          |     ~~~~~~~~^~~~
>>>>> ../target/i386/ops_sse.h:2492:13: error: ‘r0’ may be used
>>>>> uninitialized in this function [-Werror=maybe-uninitialized]
>>>>>     2492 |     d->Q(0) = r0;
>>>>>          |     ~~~~~~~~^~~~
>>> With what compiler? Is that a supported one?
>> https://lore.kernel.org/qemu-devel/3aab489e-9d90-c1ad-0b6b-b2b5d80db723@redhat.com/
>>>>> Signed-off-by: Eric Auger <eric.auger@redhat.com>
>>>>> Suggested-by: Stefan Weil <sw@weilnetz.de>
>>>>> Fixes: 790684776861 ("target/i386: reimplement 0x0f 0x3a, add AVX")
>>>>> ---
>>>>>   target/i386/ops_sse.h | 4 ++--
>>>>>   1 file changed, 2 insertions(+), 2 deletions(-)
>>>>>
>>>>> diff --git a/target/i386/ops_sse.h b/target/i386/ops_sse.h
>>>>> index 3cbc36a59d..c442c8c10c 100644
>>>>> --- a/target/i386/ops_sse.h
>>>>> +++ b/target/i386/ops_sse.h
>>>>> @@ -2466,7 +2466,7 @@ void helper_vpermdq_ymm(Reg *d, Reg *v, Reg
>>>>> *s, uint32_t order)
>>>>>           r0 = s->Q(0);
>>>>>           r1 = s->Q(1);
>>>>>           break;
>>>>> -    case 3:
>>>>> +    default:
>>>>>           r0 = s->Q(2);
>>>>>           r1 = s->Q(3);
>>>>>           break;
>>>>> @@ -2484,7 +2484,7 @@ void helper_vpermdq_ymm(Reg *d, Reg *v, Reg
>>>>> *s, uint32_t order)
>>>>>           r2 = s->Q(0);
>>>>>           r3 = s->Q(1);
>>>>>           break;
>>>>> -    case 3:
>>>>> +    default:
>>>>>           r2 = s->Q(2);
>>>>>           r3 = s->Q(3);
>>>>>           break;
>>>> Queued, but this compiler sucks. :)
>>> Can't we simply add a dumb 'default' case? So when reviewing we don't
>>> have to evaluate 'default' means 3 here.
>>>
>>> -- >8 --
>>> --- a/target/i386/ops_sse.h
>>> +++ b/target/i386/ops_sse.h
>>> @@ -2470,6 +2470,8 @@ void helper_vpermdq_ymm(Reg *d, Reg *v, Reg *s,
>>> uint32_t order)
>>>          r0 = s->Q(2);
>>>          r1 = s->Q(3);
>>>          break;
>>> +    default:
>>> +        qemu_build_not_reached();
>>>      }
>>>      switch ((order >> 4) & 3) {
>>>      case 0:
>>> @@ -2488,6 +2490,8 @@ void helper_vpermdq_ymm(Reg *d, Reg *v, Reg *s,
>>> uint32_t order)
>>>          r2 = s->Q(2);
>>>          r3 = s->Q(3);
>>>          break;
>>> +    default:
>>> +        qemu_build_not_reached();
>>>      }
>> I guess this won't fix the fact r0, r1, r2, r3 are not initialized, will it?
> This ultimately expands to assert() and the compiler should see that it
> terminates the control flow at this point, so shouldn't have a reason
> to warn.

OK so with qemu_build_not_reached(); I get

/home/augere/UPSTREAM/qemu/include/qemu/osdep.h:184:35: error: call to
‘qemu_build_not_reached_always’ declared with attribute error: code path
is reachable
  184 | #define qemu_build_not_reached()  qemu_build_not_reached_always()
      |                                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


However with g_assert_not_reached(), it does not complain and errors are
removed. So I will respin with g_assert_not_reached() if nobody advises
me against that.

Thanks

Eric

>
>
> With regards,
> Daniel


