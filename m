Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A9B2C30DD8A
	for <lists+qemu-devel@lfdr.de>; Wed,  3 Feb 2021 16:04:43 +0100 (CET)
Received: from localhost ([::1]:56038 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l7Jhx-0003zC-3S
	for lists+qemu-devel@lfdr.de; Wed, 03 Feb 2021 10:04:41 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:33038)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1l7Jfn-0002fy-8T
 for qemu-devel@nongnu.org; Wed, 03 Feb 2021 10:02:27 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:51465)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1l7Jfl-0001K8-Ch
 for qemu-devel@nongnu.org; Wed, 03 Feb 2021 10:02:26 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1612364544;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=6JMMRJI5+xvslKllJTsTL6nQ/JLc/gQX1Z2pX/05S2c=;
 b=a8NYht6rbbXA0O63jrJC0fw1OqaRnYjYFxTfvS9nK99PNZ7Fvb1+ODftmWjWQvs9DcUNT5
 PhB2SDHumqLBl+B4FTe3AvS/Z6POaLTX2zm68YERca+gVmzOUNmiBM4iAmNEQ/ucHczh/p
 y1SeGAejBjDNVdeZuzY3x61atLwrv/0=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-379-zTeMx7pHPgemhTCZW-9yuQ-1; Wed, 03 Feb 2021 10:02:23 -0500
X-MC-Unique: zTeMx7pHPgemhTCZW-9yuQ-1
Received: by mail-ej1-f70.google.com with SMTP id dc21so12183908ejb.19
 for <qemu-devel@nongnu.org>; Wed, 03 Feb 2021 07:02:23 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=6JMMRJI5+xvslKllJTsTL6nQ/JLc/gQX1Z2pX/05S2c=;
 b=b3HKMerOgt5VomhzktlNbuDR1140bxMpViA8CMLwJeJ6hc8UkVdZrdlpVxDceDyTOS
 5aLdMViPOFt/AZonwQWqNLrEa1JY1l7w/pdkx4hJqiZWoK7jBKL6a0n6F4jSs6/csQ+x
 drzu34UtuuiudDYM+Fo0WM5hzX8UKKapQi5Ogt1F2N5Z/GUCliB8MNJwUQey9v57h0h0
 /oHSwKr1Rkq4nNS9/7CdN4mwQZ5rVsHphnK/xL6pP+YBIzQLmMJlzkD9bt2f4a1GzVmS
 VTfN9Y2hGsbY5wyyiaX6uS5P+cTP0pWM7Qr/dg/NLde2exswVhUB71NGajXXC8axz0Bf
 HNpQ==
X-Gm-Message-State: AOAM531wV+iI2jcrxERvaJ6XU3GTV+dajd6Ybg8ijFNiKvVJabEPIYmQ
 INpWk83slzU41mh2AhRF15CVSwLyR0SBzCr5isrZ579uqtP2ztIFQN0LiwZFxbiE7eAyXylpb9P
 ZVFcGDgZjLGITPiI=
X-Received: by 2002:a17:906:8519:: with SMTP id
 i25mr3750640ejx.106.1612364542313; 
 Wed, 03 Feb 2021 07:02:22 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyADEE+6YgsPDVsiwKUyTlYBP0X0ofpQt/B3WBp3DeFqHAoEp7ZZx3AZQKav+qj/+Kf1XC/zw==
X-Received: by 2002:a17:906:8519:: with SMTP id
 i25mr3750607ejx.106.1612364541989; 
 Wed, 03 Feb 2021 07:02:21 -0800 (PST)
Received: from [192.168.1.36] (107.red-83-59-163.dynamicip.rima-tde.net.
 [83.59.163.107])
 by smtp.gmail.com with ESMTPSA id lo26sm1099833ejb.106.2021.02.03.07.02.20
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 03 Feb 2021 07:02:21 -0800 (PST)
Subject: Re: ARM Snapshots Not Backwards-Compatible
To: Aaron Lindsay <aaron@os.amperecomputing.com>,
 Peter Maydell <peter.maydell@linaro.org>
References: <YBogDGJRU5pcDKmi@strawberry.localdomain>
 <CAFEAcA-_N2CiNtjPi3hnk285Xdy3RuL8dY8QFhF0TnCydng6yA@mail.gmail.com>
 <YBq6Ct8M6AfMr0Bx@strawberry.localdomain>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <2572efa4-8aa3-32e4-7559-f93e6522d284@redhat.com>
Date: Wed, 3 Feb 2021 16:02:19 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <YBq6Ct8M6AfMr0Bx@strawberry.localdomain>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.539,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.178, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001,
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
Cc: Andrew Jones <drjones@redhat.com>, qemu-arm <qemu-arm@nongnu.org>,
 qemu-devel@nongnu.org, "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Juan Quintela <quintela@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2/3/21 3:58 PM, Aaron Lindsay wrote:
> On Feb 03 10:01, Peter Maydell wrote:
>>> The third is that meanings of the bits in env->features (as defined by
>>> `enum arm_features` in target/arm/cpu.h) has shifted. For example,
>>> ARM_FEATURE_PXN, ARM_FEATURE_CRC, ARM_FEATURE_VFP, ARM_FEATURE_VFP3,
>>> ARM_FEATURE_VFP4 have all been removed and ARM_FEATURE_V8_1M has been
>>> added since 4.1.0. Heck, even I have added a field there in the past.
>>> Unfortunately, these additions/removals mean that when env->features is
>>> saved on one version and restored on another the bits can mean different
>>> things. Notably, the removal of the *VFP features means that a snapshot
>>> of a CPU reporting it supports ARM_FEATURE_VFP3 on 4.1.0 thinks it's now
>>> ARM_FEATURE_M on 5.2.0!
>>
>> Ow. I didn't realize the env->features was in the migration state :-(
>> There is no reason for it to be, because it's a constant property
>> of the CPU. The easy fix is to replace
>>        VMSTATE_UINT64(env.features, ARMCPU),
>> in target/arm/machine.c with whatever the syntax is for "ignore
>> 64 bits of data here". Then we'll ignore whatever is coming in
>> from the source, which we don't need, and we'll stop sending it
>> out if we're the destination.
> 
> I'll look into this.

I think this is:

  VMSTATE_UNUSED(sizeof(uint64_t))

> 
> -Aaron
> 


