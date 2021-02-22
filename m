Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A22A321F38
	for <lists+qemu-devel@lfdr.de>; Mon, 22 Feb 2021 19:37:50 +0100 (CET)
Received: from localhost ([::1]:49662 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lEG5d-0007Gq-EI
	for lists+qemu-devel@lfdr.de; Mon, 22 Feb 2021 13:37:49 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:39236)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lEG4f-0006Bp-88
 for qemu-devel@nongnu.org; Mon, 22 Feb 2021 13:36:49 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:50211)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lEG4d-0007Tf-Dr
 for qemu-devel@nongnu.org; Mon, 22 Feb 2021 13:36:48 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1614019006;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=oRUbW6jRgBB7YDBlSFOm8JfnZsfOXqlzFHIRvn55/qg=;
 b=YNPat+vsMVtZYcWp8JuomxOsybbAatEyOF/XPAKmh4ak/BOI0b7dqwMNgkvPcKc0xG3AdY
 vd41hgz1Mb7cNvX6j3eKBjfXc2px3x1TU6XM4m+TBMcWH2wVFX8p+6U9sNyqGqXcoGME61
 rCtegdm2GZLGBicd6Rk1HMRoABBfUgg=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-154-SjyHX0XnNfqf-SUFpaJKIA-1; Mon, 22 Feb 2021 13:36:42 -0500
X-MC-Unique: SjyHX0XnNfqf-SUFpaJKIA-1
Received: by mail-ed1-f71.google.com with SMTP id j10so7488094edv.5
 for <qemu-devel@nongnu.org>; Mon, 22 Feb 2021 10:36:42 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=oRUbW6jRgBB7YDBlSFOm8JfnZsfOXqlzFHIRvn55/qg=;
 b=BXHjzaz0Evqg4icKxfW5HDMZ6lu4FONYE4KII17xeR+dsHQfHfKlZ0sgd6t9UQMB1v
 B1mK8hAJX2voxn0047qUSNAoPhO4ajqqyIn5qlep3BBPvR8GVpkWyd9KoYmIfgNGIDnq
 V/kDneau7Nyz0zxrzn5vmzmRbp6kkprkgxmjalRZ/EXX8oeemGX7nKs2PoTJba+fPOgb
 g/+ANpXLI0IiULFrEMKGMVGXGaUlqgNXPUeJwywPaWWodoK3R6X/64ItUCGOwSkW7eZy
 NzNS0nvN0kOG/1QzjrHcKEOBEWQir5Z8Hq1p+3u0N7OJ2jvvM2eEg1kjQj8n1U413vnv
 vK9A==
X-Gm-Message-State: AOAM531asXsk8A82QgjECPKqxEfTDCeEBJK0j5+2qa/rUCiQYxCQTPs1
 u6Hu/qBC2aD916EhLMu31RFhBxZ5bYuHl5sxEgCbPDVpxJimg5u5+dS9tZBUG9LiQItcfl/gB3V
 MaPVqyPZh98qPW5w=
X-Received: by 2002:a17:906:63c2:: with SMTP id
 u2mr21646159ejk.346.1614019001513; 
 Mon, 22 Feb 2021 10:36:41 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyGmcUrpyBxleKK0s/ZjWULYVU49HMdA/PtlQT0N9+EKjyeK9+jbDsiHWqBECTwO6cdxzxXJw==
X-Received: by 2002:a17:906:63c2:: with SMTP id
 u2mr21646130ejk.346.1614019001287; 
 Mon, 22 Feb 2021 10:36:41 -0800 (PST)
Received: from [192.168.1.36] (68.red-83-57-175.dynamicip.rima-tde.net.
 [83.57.175.68])
 by smtp.gmail.com with ESMTPSA id ck9sm12009559edb.36.2021.02.22.10.36.39
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 22 Feb 2021 10:36:40 -0800 (PST)
Subject: Re: [PATCH v2 0/2] block: Use 'read-zeroes=true' mode by default with
 'null-co' driver
To: =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>
References: <20210211142656.3818078-1-philmd@redhat.com>
 <20210213215448.GA67780@ip-172-44-255-31>
 <3da6a2aa-472e-d9e1-b803-303891513274@redhat.com>
 <38dd38eb-af59-8baf-b908-fb6c4e842cd1@redhat.com>
 <YDP0sZHoT45skArd@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <d7beb791-22f7-d6cc-0a3d-26b590ec5a76@redhat.com>
Date: Mon, 22 Feb 2021 19:36:39 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <YDP0sZHoT45skArd@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Fam Zheng <fam@euphon.net>, Laurent Vivier <lvivier@redhat.com>,
 Thomas Huth <thuth@redhat.com>, qemu-block@nongnu.org,
 Markus Armbruster <armbru@redhat.com>, qemu-devel@nongnu.org,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Max Reitz <mreitz@redhat.com>, Alexander Bulekov <alxndr@bu.edu>,
 Bandan Das <bsd@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Cleber Rosa <crosa@redhat.com>,
 Kevin Wolf <kwolf@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2/22/21 7:15 PM, Daniel P. Berrangé wrote:
> On Fri, Feb 19, 2021 at 03:09:43PM +0100, Philippe Mathieu-Daudé wrote:
>> On 2/19/21 12:07 PM, Max Reitz wrote:
>>> On 13.02.21 22:54, Fam Zheng wrote:
>>>> On 2021-02-11 15:26, Philippe Mathieu-Daudé wrote:
>>>>> The null-co driver doesn't zeroize buffer in its default config,
>>>>> because it is designed for testing and tests want to run fast.
>>>>> However this confuses security researchers (access to uninit
>>>>> buffers).
>>>>
>>>> I'm a little surprised.
>>>>
>>>> Is changing default the only way to fix this? I'm not opposed to
>>>> changing the default but I'm not convinced this is the easiest way.
>>>> block/nvme.c also doesn't touch the memory, but defers to the device
>>>> DMA, why doesn't that confuse the security checker?
>>
>> Generally speaking, there is a balance between security and performance.
>> We try to provide both, but when we can't, my understanding is security
>> is more important.
>>
>> Customers expect a secure product. If they prefer performance and
>> at the price of security, it is also possible by enabling an option
>> that is not the default.
>>
>> I'm not sure why you mention block/nvme here. I have the understanding
>> the null-co driver is only useful for testing. Are there production
>> cases where null-co is used?
> 
> Do we have any real world figures for the performance of null-co
> with & without  zero'ing ?  Before worrying about a tradeoff of
> security vs performance, it'd be good to know if there is actually
> a real world performance problem in the first place. Personally I'd
> go for zero'ing by defualt unless the performance hit was really
> bad.

I simply wanted to help the security team by removing the
amount of reports using the null-co driver. This is probably
easier to resolve with one documentation line.
As I am not understanding where this thread is heading, I am
taking a step back with this topic. Please disregard this series.

Regards,

Phil.


