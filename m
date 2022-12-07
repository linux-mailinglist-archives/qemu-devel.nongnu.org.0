Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A2AE8646232
	for <lists+qemu-devel@lfdr.de>; Wed,  7 Dec 2022 21:13:43 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p30m2-00029F-Qz; Wed, 07 Dec 2022 15:12:10 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1p30lt-000290-V2
 for qemu-devel@nongnu.org; Wed, 07 Dec 2022 15:12:02 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1p30lq-0001US-LL
 for qemu-devel@nongnu.org; Wed, 07 Dec 2022 15:12:00 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1670443917;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=6vOxFRT0MTVSkGSp54VRLpQdJ+lKTmWjpni9Ppfz3K8=;
 b=eC41ED97yJaCg+88KLW6keFGI6CWzmZEHzmd9oSJvI5O26KPbTtm6TG6K67RZTOWMcgw7W
 CW2UYWHlGj4aWBKtsTHrJR+c3f7nq814Qvj3PS6OP1b41SlKJTtUkSkF98h9rLCZoxIoot
 vs8AdOatveELvdBJ4+xtqVpE0U7SVtg=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-141-IuzG2QnCPKmulZnmkKA1lw-1; Wed, 07 Dec 2022 15:11:55 -0500
X-MC-Unique: IuzG2QnCPKmulZnmkKA1lw-1
Received: by mail-wr1-f72.google.com with SMTP id
 k1-20020adfb341000000b0024215e0f486so4610102wrd.21
 for <qemu-devel@nongnu.org>; Wed, 07 Dec 2022 12:11:55 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:reply-to:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=6vOxFRT0MTVSkGSp54VRLpQdJ+lKTmWjpni9Ppfz3K8=;
 b=Itxbk6KGpobYq/KJLQHmnmaTSIccb8nwxJHEio5poHxG0t4OOxZq3vT5SCHYxUwPX3
 YdirdBsS48UAar+ws1LfQvR3vkr2wEPJ/+GglVYqPS/zwldhWhWphEfaPEfFutRJ4Jtm
 J0XYknwgl5rkm3x4xsgDUu8+myXfwpl8BEXAukb2gdvAalOTNoRYVElMgDUt0ut13tB3
 2p1nMR8jIQviD6BmZJwyeFJ/efxsCJ+UNybTbULQHTKUpgGtr6jJXg2DcHM2ZKFMXODs
 ThzEAHei2mFPVzQ33styObCBdz4XtfUYU2c4EUAXAwekpINuIbIEJ3IwELgQh2wMLi44
 XVJw==
X-Gm-Message-State: ANoB5pm7AYYAqfkI9i9ohSfDZlmDuMTQQ9zWJpP213H0EFwp9BuUIT42
 z1kW1QL5+C4/z6668AzBuzocvGsm8vdLCE5rlzQz+OVE/JtSLGsxbSal8jJakBR+N2ghoDSLyAP
 2jMbnxcaW2Ys5K7c=
X-Received: by 2002:adf:dc85:0:b0:242:2ae7:c0cc with SMTP id
 r5-20020adfdc85000000b002422ae7c0ccmr21460634wrj.577.1670443914560; 
 Wed, 07 Dec 2022 12:11:54 -0800 (PST)
X-Google-Smtp-Source: AA0mqf40nUD6Hhx3Ciji5voMD+M+2Iw1YnBUk49Bcf1hmd0J882kntIYnyEG2xwcQJBGK25BVadsVg==
X-Received: by 2002:adf:dc85:0:b0:242:2ae7:c0cc with SMTP id
 r5-20020adfdc85000000b002422ae7c0ccmr21460618wrj.577.1670443914328; 
 Wed, 07 Dec 2022 12:11:54 -0800 (PST)
Received: from ?IPV6:2a01:e0a:59e:9d80:527b:9dff:feef:3874?
 ([2a01:e0a:59e:9d80:527b:9dff:feef:3874])
 by smtp.gmail.com with ESMTPSA id
 d10-20020adffbca000000b002366f9bd717sm24597523wrs.45.2022.12.07.12.11.53
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 07 Dec 2022 12:11:53 -0800 (PST)
Message-ID: <e3c811a4-dccf-0ddf-79cf-e309a56637c0@redhat.com>
Date: Wed, 7 Dec 2022 21:11:52 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.1
Subject: Re: [PATCH for 7.2?] target/i386: Remove compilation errors when
 -Werror=maybe-uninitialized
Content-Language: en-US
To: Stefan Hajnoczi <stefanha@gmail.com>, Stefan Weil <sw@weilnetz.de>
Cc: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 eric.auger.pro@gmail.com, pbonzini@redhat.com, richard.henderson@linaro.org,
 paul@nowt.org, qemu-devel@nongnu.org, peter.maydell@linaro.org,
 Stefan Hajnoczi <stefanha@redhat.com>
References: <20221207132439.635402-1-eric.auger@redhat.com>
 <f8a36758-cff2-3df3-3e30-083175e47131@redhat.com>
 <CAJSP0QXo0p5E_G9rqLO0wqC=NDQzMhoJOJDb0ShV+7OetFMMbg@mail.gmail.com>
 <6a39520b-5445-bda4-951f-998675d6e045@redhat.com>
 <0828040a-c297-46b0-68b7-4761583f1ceb@linaro.org>
 <3aab489e-9d90-c1ad-0b6b-b2b5d80db723@redhat.com>
 <b0afb1f7-1156-9b4a-a87b-f56c72f753c0@weilnetz.de>
 <CAJSP0QXZrpN_2+0nO=4RB9FCi=nd=uhgUFDiQ3V5CDhAQNPOXA@mail.gmail.com>
From: Eric Auger <eric.auger@redhat.com>
In-Reply-To: <CAJSP0QXZrpN_2+0nO=4RB9FCi=nd=uhgUFDiQ3V5CDhAQNPOXA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124;
 envelope-from=eric.auger@redhat.com; helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -23
X-Spam_score: -2.4
X-Spam_bar: --
X-Spam_report: (-2.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.262, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
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

Hi Stefan,

On 12/7/22 20:59, Stefan Hajnoczi wrote:
> On Wed, 7 Dec 2022 at 14:11, Stefan Weil <sw@weilnetz.de> wrote:
>> Am 07.12.22 um 19:22 schrieb Eric Auger:
>>> On 12/7/22 17:55, Philippe Mathieu-Daudé wrote:
>>>> On 7/12/22 15:33, Eric Auger wrote:
>>>>> On 12/7/22 15:09, Stefan Hajnoczi wrote:
>>>>>> On Wed, 7 Dec 2022 at 08:31, Eric Auger <eric.auger@redhat.com> wrote:
>>>>>>> On 12/7/22 14:24, Eric Auger wrote:
>>>>>>>> Initialize r0-3 to avoid compilation errors when
>>>>>>>> -Werror=maybe-uninitialized is used
>>>>>>>>
>>>>>>>> ../target/i386/ops_sse.h: In function ‘helper_vpermdq_ymm’:
>>>>>>>> ../target/i386/ops_sse.h:2495:13: error: ‘r3’ may be used
>>>>>>>> uninitialized in this function [-Werror=maybe-uninitialized]
>>>>>>>>    2495 |     d->Q(3) = r3;
>>>>>>>>         |     ~~~~~~~~^~~~
>>>>>>>> ../target/i386/ops_sse.h:2494:13: error: ‘r2’ may be used
>>>>>>>> uninitialized in this function [-Werror=maybe-uninitialized]
>>>>>>>>    2494 |     d->Q(2) = r2;
>>>>>>>>         |     ~~~~~~~~^~~~
>>>>>>>> ../target/i386/ops_sse.h:2493:13: error: ‘r1’ may be used
>>>>>>>> uninitialized in this function [-Werror=maybe-uninitialized]
>>>>>>>>    2493 |     d->Q(1) = r1;
>>>>>>>>         |     ~~~~~~~~^~~~
>>>>>>>> ../target/i386/ops_sse.h:2492:13: error: ‘r0’ may be used
>>>>>>>> uninitialized in this function [-Werror=maybe-uninitialized]
>>>>>>>>    2492 |     d->Q(0) = r0;
>>>>>>>>         |     ~~~~~~~~^~~~
>>>>>>>>
>>>>>>>> Signed-off-by: Eric Auger <eric.auger@redhat.com>
>>>>>>>> Fixes: 790684776861 ("target/i386: reimplement 0x0f 0x3a, add AVX")
>>>>>>>>
>>>>>>>> ---
>>>>>>>>
>>>>>>>> Am I the only one getting this? Or anything wrong in my setup.
>> Hi Eric,
>>
>> no, you are not the only one. I regularly build with higher warning
>> levels, for example with -Weverything on macOS, and get a much longer
>> list which includes the mentioned warnings (see below).
>>
>> The warnings for ops_sse.h are false positives, so I think no fix is
>> needed for 7.2. The compiler is not clever enough to see that the switch
>> statements handle all possible cases. It should be sufficient to replace
>> `case 3` by `default` to help the compiler and fix the warning. Your fix
>> might produce new compiler warnings because setting the variables to 0
>> has no effect.
> Eric: do you want to try the switch "default" approach for 8.0?

Yes sure!

Eric
>
> Thanks,
> Stefan
>


