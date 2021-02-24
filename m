Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1ACA632437A
	for <lists+qemu-devel@lfdr.de>; Wed, 24 Feb 2021 19:04:46 +0100 (CET)
Received: from localhost ([::1]:60806 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lEyWj-00050a-4t
	for lists+qemu-devel@lfdr.de; Wed, 24 Feb 2021 13:04:45 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:59988)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lEyV6-0003vU-T9
 for qemu-devel@nongnu.org; Wed, 24 Feb 2021 13:03:04 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:31442)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lEyV3-00037W-Se
 for qemu-devel@nongnu.org; Wed, 24 Feb 2021 13:03:04 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1614189779;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=NW1Hfey9S5rPsTYaOaxmDa4i/W2vMcAQBQx46eZKpy0=;
 b=MQnl+MMi5quQKt27n1cnUEFXitHtnZhk3+RXTmXqVGpMcjf91ULz22mzJ5XhqUreNs0iSI
 uQgxG3796cgDxQXOkwBGiMAzc+RXHNF8uZojhZ4YTEa3A3rQl5ZCZ7cabA9WRbAFq3y11h
 gyoWJpZeFrIBMNP+RMaOBd0cLffK7Wg=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-128-Ce9FXXQdP8ytZ9U3pXBEEg-1; Wed, 24 Feb 2021 13:02:49 -0500
X-MC-Unique: Ce9FXXQdP8ytZ9U3pXBEEg-1
Received: by mail-wr1-f72.google.com with SMTP id i2so1406725wru.1
 for <qemu-devel@nongnu.org>; Wed, 24 Feb 2021 10:02:48 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:from:to:cc:references:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=NW1Hfey9S5rPsTYaOaxmDa4i/W2vMcAQBQx46eZKpy0=;
 b=poja0655yGqU0G/9ErfFg4YsSIHiT0iD/KE7YVgguDZPcCIaTA2rSX3AfpjzJ3XbvI
 AGE663mgYuso52QUQFb1v8jU5rUoKwPP1IhGDdEviB/wCpEMs3cNo1O92S77I31Ox58X
 hQLq2ReO9vZqQPXRZ68+NMwU2ASM01ufEO7hRlWpQRWchjM/QCRVzQ2SuQg+Up5SMI/H
 hHmOMFbhl6YRSxj55bXn8HdM3d0Wmdp1XpdhnecYzgrnPLLJDi9T4tjJINeyR1PyB3C5
 fDoYgLFYyZHPIyyqECiuaPf1GkYDwDk+de17U1YFlwqipNF4gLq/lXxItyRneIUYRcDA
 XH+A==
X-Gm-Message-State: AOAM530fRyMaLBDk7ku4pZXp9iz81aQy9wnV0u5HFKALDRQ9BNghn+iC
 HlfyFsc+Wm3lh12ElSFutJGm/mIDpvQ7QcpWeDNAradZ86Ki9HRQULgEJLlJHBhvEYWR4ND3inF
 CnAfSH/P6qh6C0CA=
X-Received: by 2002:a05:600c:4f86:: with SMTP id
 n6mr4838879wmq.22.1614189767725; 
 Wed, 24 Feb 2021 10:02:47 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzErC6k4ktpDRw/2PPdSvVxIz2TDEdTuJkqCrPNAM1i80yz2tzfJkzJd8iLDKixLqhDXgaqgw==
X-Received: by 2002:a05:600c:4f86:: with SMTP id
 n6mr4838802wmq.22.1614189766915; 
 Wed, 24 Feb 2021 10:02:46 -0800 (PST)
Received: from [192.168.1.36] (68.red-83-57-175.dynamicip.rima-tde.net.
 [83.57.175.68])
 by smtp.gmail.com with ESMTPSA id m9sm10017878wml.3.2021.02.24.10.02.45
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 24 Feb 2021 10:02:46 -0800 (PST)
Subject: Re: [PATCH] meson: Only generate trace files for selected targets
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
To: Paolo Bonzini <pbonzini@redhat.com>, qemu-devel@nongnu.org
References: <20210224120923.3154325-1-philmd@redhat.com>
 <39cc99dd-54d5-9dd1-d66a-7947686dbada@redhat.com>
 <11b6e7ad-9ac9-45fe-ebcf-1db7e396d33a@redhat.com>
Message-ID: <0efebdee-6ff9-b242-54b2-3341a05bcaa6@redhat.com>
Date: Wed, 24 Feb 2021 19:02:45 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <11b6e7ad-9ac9-45fe-ebcf-1db7e396d33a@redhat.com>
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
Cc: qemu-trivial@nongnu.org, Stefan Hajnoczi <stefanha@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2/24/21 1:51 PM, Philippe Mathieu-Daudé wrote:
> On 2/24/21 1:26 PM, Paolo Bonzini wrote:
>> On 24/02/21 13:09, Philippe Mathieu-Daudé wrote:
>>> We don't need to generate trace files for targets we
>>> are not building. Restrict the the ones selected.
>>>
>>> Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
>>> ---
>>>   meson.build | 10 +---------
>>>   1 file changed, 1 insertion(+), 9 deletions(-)
>>>
>>> diff --git a/meson.build b/meson.build
>>> index 05a67c20d93..c9b0433667d 100644
>>> --- a/meson.build
>>> +++ b/meson.build
>>> @@ -1826,15 +1826,6 @@
>>>     trace_events_subdirs += [
>>>       'accel/tcg',
>>>       'hw/core',
>>> -    'target/arm',
>>> -    'target/hppa',
>>> -    'target/i386',
>>> -    'target/i386/kvm',
>>> -    'target/mips',
>>> -    'target/ppc',
>>> -    'target/riscv',
>>> -    'target/s390x',
>>> -    'target/sparc',
>>>     ]
>>>   endif
>>>   @@ -2166,6 +2157,7 @@
>>>     t = target_arch[arch].apply(config_target, strict: false)
>>>     arch_srcs += t.sources()
>>>     arch_deps += t.dependencies()
>>> +  trace_events_subdirs += ['target' / arch]
>>>       target_common = common_ss.apply(config_target, strict: false)
>>>     objects = common_all.extract_objects(target_common.sources())
>>>
>>
>> Is this still okay if there is no trace-events file for a given arch?

No, it is *not* Okay :>

> 
> No problem in my usual build configs, but I kicked a CI build to check
> the all of them and be sure.


