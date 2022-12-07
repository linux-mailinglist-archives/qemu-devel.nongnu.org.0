Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 913D46460F6
	for <lists+qemu-devel@lfdr.de>; Wed,  7 Dec 2022 19:24:39 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p2z5V-0006if-E2; Wed, 07 Dec 2022 13:24:09 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1p2z5E-0006eX-EX
 for qemu-devel@nongnu.org; Wed, 07 Dec 2022 13:23:52 -0500
Received: from mail-ot1-x331.google.com ([2607:f8b0:4864:20::331])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1p2z5B-0000TK-JY
 for qemu-devel@nongnu.org; Wed, 07 Dec 2022 13:23:51 -0500
Received: by mail-ot1-x331.google.com with SMTP id
 z14-20020a9d65ce000000b0067059c25facso3681897oth.6
 for <qemu-devel@nongnu.org>; Wed, 07 Dec 2022 10:23:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=Nxlk/F7v4Ci9OCBb3h+K9mAc5KWrDUyfKaY/zwiWRqk=;
 b=jpUFjZjoEsjA16YhIL7Dt6MGs4fdezS7ZiqHgQ+I3u5GSOHNAVvLTAtNaNovj/oSlc
 duGQ6R1aDbA+r6OrlOI7cEXKY10yLsT2hAtq00hoJiudyroRWvvgFZyYz6m95QJzY1c7
 4HOK/LJU4o0N+OicS+pJ3M0Fw6bD/MVSKMS+gHhKU3z5P/pV6nliCJE/RtNjYUS21z+u
 RRVkWI0us7aomN2UNgUSfXOFOpB18/HjpiRy/KJ3Bdnvyzl8Z06FqRi0ON472LQrWc27
 grazjo1qdLzEmZBwM8Z91fWMouILqO1jlSsXRYrhKpByssbghTBDv5IEXSD5wQJCPmyc
 tPtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Nxlk/F7v4Ci9OCBb3h+K9mAc5KWrDUyfKaY/zwiWRqk=;
 b=Tc3D00+HMjA5lUCvUd0/hnfqK5dudVoyhsBP0Djf3Wejk/Rh2JMldtqSJJYTZk9nKO
 NUbONKewe1CNvVT3j8sr1wErGfBD+aNC62KfTJ6b89gds3FOIImA5yhJuNi0oHzJoQDz
 sgOnTLhJgtIFl23W9JKl60/ZFUxHKW3mF9PyuQqnjYhi13od1tz1ApJRrkSas0021mXs
 Xb8Wt+PVV6RURpKAxUaQzrbdIn9TNBEGiFTtuIHzgB1VebqFgtHgQqxu9W6REkHCcgQY
 CKnp3o6d+Ym5ZWhBvYXw5/DMRg2vo8MTTLXLuX2UxeLilWdrZz+iij2lyjOmSF9xLFBh
 SYtw==
X-Gm-Message-State: ANoB5pk07YQOu7QA8Q89MEbAwumNMB3mKdgr1Y47U7oK/BCivZCz6WmA
 fCRx/WgMpaToxvAu4TN/y6AcoA==
X-Google-Smtp-Source: AA0mqf4atzE57YUoXXObioPupPnevk8e+eh1dKDquu7rAvC9nk+c1B1pzqSSI/53zvA65iGhYV8o6A==
X-Received: by 2002:a05:6830:349f:b0:66e:c096:126c with SMTP id
 c31-20020a056830349f00b0066ec096126cmr316589otu.29.1670437428412; 
 Wed, 07 Dec 2022 10:23:48 -0800 (PST)
Received: from ?IPV6:2806:102e:18:70b5:3c4d:6df:3392:485c?
 ([2806:102e:18:70b5:3c4d:6df:3392:485c])
 by smtp.gmail.com with ESMTPSA id
 g4-20020a9d6c44000000b00661ac688285sm10495724otq.0.2022.12.07.10.23.47
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 07 Dec 2022 10:23:47 -0800 (PST)
Message-ID: <64a40f5d-855e-7f70-ba1f-df464abcfddf@linaro.org>
Date: Wed, 7 Dec 2022 12:23:45 -0600
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH for 7.2?] target/i386: Remove compilation errors when
 -Werror=maybe-uninitialized
Content-Language: en-US
To: eric.auger@redhat.com, Stefan Hajnoczi <stefanha@gmail.com>
Cc: eric.auger.pro@gmail.com, pbonzini@redhat.com, paul@nowt.org,
 qemu-devel@nongnu.org, peter.maydell@linaro.org,
 Stefan Hajnoczi <stefanha@redhat.com>
References: <20221207132439.635402-1-eric.auger@redhat.com>
 <f8a36758-cff2-3df3-3e30-083175e47131@redhat.com>
 <CAJSP0QXo0p5E_G9rqLO0wqC=NDQzMhoJOJDb0ShV+7OetFMMbg@mail.gmail.com>
 <6a39520b-5445-bda4-951f-998675d6e045@redhat.com>
 <CAJSP0QXKf5X0FijR64_0JWUBcnpNm-Jk58bfCk=966dZmj7NOw@mail.gmail.com>
 <660c1fa1-3575-1849-01d0-8411ca4101d8@redhat.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <660c1fa1-3575-1849-01d0-8411ca4101d8@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::331;
 envelope-from=richard.henderson@linaro.org; helo=mail-ot1-x331.google.com
X-Spam_score_int: -23
X-Spam_score: -2.4
X-Spam_bar: --
X-Spam_report: (-2.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.262,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

On 12/7/22 10:08, Eric Auger wrote:
> On 12/7/22 16:55, Stefan Hajnoczi wrote:
>>> I am using this configure cmd line:
>>>
>>> ./configure --prefix=/usr --sysconfdir=/etc --libexecdir=/usr/lib/qemu
>>> --target-list=x86_64-softmmu --docdir=/usr/share/doc/qemu --enable-kvm
>>> --extra-cflags=-O --enable-trace-backends=log --python=/usr/bin/python3
>>> --extra-cflags=-Wall --extra-cflags=-Wundef
>>> --extra-cflags=-Wwrite-strings --extra-cflags=-Wmissing-prototypes
>>> --extra-cflags=-fno-strict-aliasing --extra-cflags=-fno-common
>>> --extra-cflags=-Werror=type-limits
>>>> If you added it manually then let's fix this in 8.0 since it's not
>>>> tested/supported and very few people will see this issue.
>> Did you create the ./configure command-line manually? Do you think
>> other people will hit this?
> no I did not. I just tried to install a fresh qemu repo and just ran the
> above configure command.

Stefan's question is where did you get this configure command?

If it came from an rpm script or suchlike, we might take more notice than if this is just 
you adding --extra-cflags for your own testing.


> I am actually surprised nobody hit that already.

Adding -Wall is not standard, nor all the other -W that you are adding.  I think you 
should not be surprised that you run into problems.

While you can make a case for auditing the code base and adding these to the default set 
of warning flags, that's a job for the next development cycle.


r~

