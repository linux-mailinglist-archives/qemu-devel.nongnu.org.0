Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FE1A3339DB
	for <lists+qemu-devel@lfdr.de>; Wed, 10 Mar 2021 11:22:46 +0100 (CET)
Received: from localhost ([::1]:38592 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lJvzJ-0001n9-C6
	for lists+qemu-devel@lfdr.de; Wed, 10 Mar 2021 05:22:45 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:35564)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1lJvxn-0000al-Rn
 for qemu-devel@nongnu.org; Wed, 10 Mar 2021 05:21:11 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:56180)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1lJvxm-0003lu-5l
 for qemu-devel@nongnu.org; Wed, 10 Mar 2021 05:21:11 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1615371669;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=/Xpe7qakittms7UL+EY2gGPp09JpRCNOg7WxwJ5RY9o=;
 b=B0lPOuyfTfE5yX+flQcgdHTY4SaaSlIedIKO3iRhtA3UDxfIV+hvVS4s8JclMvXp/+uzAz
 WBxeBQPWOzvB7iDBdGCo4kVG2pZAoNtCsVF/ANSXkweRVm6hMVevyF8MrM6oxDQx2g4A1Z
 Ahv6RiufwqsL75a+HdINUr9SshWVlTs=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-199-Hk18PvQfOqe3KC7tbpRGkg-1; Wed, 10 Mar 2021 05:21:07 -0500
X-MC-Unique: Hk18PvQfOqe3KC7tbpRGkg-1
Received: by mail-wm1-f71.google.com with SMTP id a3so954121wmm.0
 for <qemu-devel@nongnu.org>; Wed, 10 Mar 2021 02:21:07 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=/Xpe7qakittms7UL+EY2gGPp09JpRCNOg7WxwJ5RY9o=;
 b=PC+5ZB1o3oR7jYPtKM+AIwnfgxSJaAJ66il7ygdBwQNsjti53yyW7Unps5N+y8AYE2
 q0ZSTyBWeoQksgVzd7Vx1mbmFGF6CCGaghkvITbwLh/CdxuKYFs8pUhzo/1n9knsiFpJ
 etBLXFf+H3XHsRv/Rq1/1+RTsE8t9VuARxhvvAmv3qo5OfQkSci1TsmWTwrn0JSYFM0F
 AonBGYJBti+F4LL8sBIUsBtvE6bSX9fXzv+k+7SPV8z5IVysehdxMD0ISNAiXdIZcKLr
 hCZNd4TcAPpe5ofg6ACA2p+J73wZ9n6j7B19P2Y423UUSiSixncy7LCuCJJE5ZkMICYK
 rx2A==
X-Gm-Message-State: AOAM53102gP90dvCScqbFhoB1fPiazUnLPDM30QYvm54qotihBHnm/eE
 /MWVtSt87hiF5rkW19GV1sRu5psH9qpltuUergt9SBTbVlKH3NmaANvkefScfhZB801IPtoBnAM
 d/jUYIh5JvU7gcXU=
X-Received: by 2002:a5d:6342:: with SMTP id b2mr2689170wrw.421.1615371666655; 
 Wed, 10 Mar 2021 02:21:06 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzCGBRb5W6hPib9cGgg/hZixVwVFK4qX43F7kopzqdzjEiDJkx3Fp3fERv77iOCgUjfWEfDYw==
X-Received: by 2002:a5d:6342:: with SMTP id b2mr2689149wrw.421.1615371666488; 
 Wed, 10 Mar 2021 02:21:06 -0800 (PST)
Received: from ?IPv6:2001:b07:6468:f312:c8dd:75d4:99ab:290a?
 ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id s18sm24827079wrr.27.2021.03.10.02.21.05
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 10 Mar 2021 02:21:05 -0800 (PST)
Subject: Re: [PATCH] tests: Move unit tests into a separate directory
To: Thomas Huth <thuth@redhat.com>, qemu-devel@nongnu.org
References: <20210310063314.1049838-1-thuth@redhat.com>
 <d684cc63-d60d-b346-3a78-edc94a0dade9@redhat.com>
 <e1c41053-9809-7c6e-6ebd-a0b6f6db9486@redhat.com>
 <942499e4-0a67-ff9a-08e8-ac7d3cbc3c21@redhat.com>
 <04db468c-825a-941c-038a-f7d7c7e00c01@redhat.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <1da66103-8efb-0651-81ed-1bbb50acefed@redhat.com>
Date: Wed, 10 Mar 2021 11:21:04 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <04db468c-825a-941c-038a-f7d7c7e00c01@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.251,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>,
 =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, Michael Roth <michael.roth@amd.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 10/03/21 10:22, Thomas Huth wrote:
> On 10/03/2021 10.11, Paolo Bonzini wrote:
>> On 10/03/21 10:08, Thomas Huth wrote:
>>>>
>>>> Looks good, I would have moved benchmarks as well but anyway it can 
>>>> be done separately.
>>>
>>> My plan is to move them into a separate directory (tests/bench/) 
>>> since this is a separate test suite.
>>
>> That makes sense indeed.
>>
>>> By the way, "make check-speed" is not working for me anymore (but 
>>> "make bench" is working fine) ... and I haven't found out yet what's 
>>> wrong ... is it working for you?
>>
>> No; "make bench" and "make bench-speed" work though.
> 
> It's because this filter logic in the generated Makefile.mtest:
> 
> bench-speed: run-tests
> ifneq ($(filter bench-speed bench, $(MAKECMDGOALS)),)
> .tests += $(.test.$(SPEED).bench-speed)
> endif
> all-bench-targets += bench-speed
> 
> ... so a quick fix is:
> 
> diff a/tests/Makefile.include b/tests/Makefile.include
> --- a/tests/Makefile.include
> +++ b/tests/Makefile.include
> @@ -156,6 +156,7 @@ clean: check-clean
> 
>   # For backwards compatibility
> 
> -check-speed: bench-speed
> +check-speed:
> +       $(MAKE) bench-speed
> 

Yep.  Another quick fix is "-check-speed: bench-speed" and just use 
"make bench". :)

Paolo


