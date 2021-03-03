Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B90B532BDA4
	for <lists+qemu-devel@lfdr.de>; Wed,  3 Mar 2021 23:26:20 +0100 (CET)
Received: from localhost ([::1]:48508 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lHZwh-0000Up-DA
	for lists+qemu-devel@lfdr.de; Wed, 03 Mar 2021 17:26:19 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:51412)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lHZvG-00088M-7l
 for qemu-devel@nongnu.org; Wed, 03 Mar 2021 17:24:50 -0500
Received: from mail-pf1-x434.google.com ([2607:f8b0:4864:20::434]:33253)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lHZvE-0004K0-M6
 for qemu-devel@nongnu.org; Wed, 03 Mar 2021 17:24:50 -0500
Received: by mail-pf1-x434.google.com with SMTP id 192so10320797pfv.0
 for <qemu-devel@nongnu.org>; Wed, 03 Mar 2021 14:24:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:from:to:cc:references:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=I6X6JX+zoLYqkMO4mIBzK9KHuuUucguX2pj4i17mdYQ=;
 b=RBeqpBiOI4Fxtfv7hAy7WOg4ev07LksEeXuxGVGHfFsVfvtVFH63KDfmpB217n4I2k
 VXLGwALXK93JfjvdOk3e6klsiPsNjjw+6oINc8HzMIKS6K+HtCN1or4vXfBZphRa/3Fr
 o1cGRih3Vc/b1SPMXujleRUAGDMnUGruGRP05PriQx7YTX/LFN98P9fmu/OFxLYM+L5r
 UMM2gxCOgDhx6eCn7q9ZYTnwS8g9R3u64cP4dHTP9SpGlIunAXrrLKOfYZue80VWft9S
 uVdmDIMexPnRjnFwCvY2oXXiae2qYGDdiD2V81hv/SDTI59zaJcnW0j53AwUo8MKD0i0
 eEjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:from:to:cc:references:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=I6X6JX+zoLYqkMO4mIBzK9KHuuUucguX2pj4i17mdYQ=;
 b=uPp7da5bo/8Hrisft+mYOloHugIqjNXq31lJtr9g9HnH0GZN8beyAdCHh4pPSJdRHZ
 yT+lVKJJ5zE+kY5YeM4sri0KSQ/oD1hGBPdFsx859NYNwc6Ga0BT3QpKWtDFoi5oVAvf
 +N7jkkXvuMtZQWTYPShQXzbRuGWWSgXGXlaRxUFd8x8lSevYDu3Hhstza8cwxhLHg3KE
 uRMnXtJOZQ2zpKzYMj+FpoYJagTACTtMRxMYhKi1epv39XHAbHhQkhDScJtq2E959fhm
 HMoABkmucaI9NoSTP++HoEmaZX7WHhs9uV8bwSwlzPBa/Z+xIsjSu8at/Z/gvcF8qIA2
 aMOw==
X-Gm-Message-State: AOAM5336+1+SzRsE/eWa7agYoYyETjUX3UO6eMB1PjONWNF1z7c+Xgnv
 04ZX9p7jlbyjXsNRaLDWs4LAtQ==
X-Google-Smtp-Source: ABdhPJw0wkkqf0aIoW8TgkVxQ4EOSd/TgJP1G21fo3WDe1/E3ReuWDy5G4gPHVn0lNu4sTCu/aO1LA==
X-Received: by 2002:aa7:8e51:0:b029:1ed:2928:18ff with SMTP id
 d17-20020aa78e510000b02901ed292818ffmr888648pfr.76.1614810287142; 
 Wed, 03 Mar 2021 14:24:47 -0800 (PST)
Received: from [192.168.1.11] (174-21-84-25.tukw.qwest.net. [174.21.84.25])
 by smtp.gmail.com with ESMTPSA id b3sm7358587pjh.22.2021.03.03.14.24.45
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 03 Mar 2021 14:24:46 -0800 (PST)
Subject: Re: [PATCH v4 03/28] cpu: Introduce cpu_virtio_is_big_endian()
From: Richard Henderson <richard.henderson@linaro.org>
To: "Michael S. Tsirkin" <mst@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
References: <20210303214708.1727801-1-f4bug@amsat.org>
 <20210303214708.1727801-4-f4bug@amsat.org>
 <20210303170743-mutt-send-email-mst@kernel.org>
 <20210303171059-mutt-send-email-mst@kernel.org>
 <d17a5ae7-2b71-6b53-f7c3-df2406a001f2@linaro.org>
Message-ID: <656728c2-180b-a412-b802-0bd545647b1d@linaro.org>
Date: Wed, 3 Mar 2021 14:24:44 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <d17a5ae7-2b71-6b53-f7c3-df2406a001f2@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::434;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x434.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, Cornelia Huck <cohuck@redhat.com>,
 qemu-devel@nongnu.org, Laurent Vivier <laurent@vivier.eu>,
 qemu-s390x@nongnu.org, qemu-arm@nongnu.org, qemu-ppc@nongnu.org,
 Claudio Fontana <cfontana@suse.de>, Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 3/3/21 2:18 PM, Richard Henderson wrote:
> On 3/3/21 2:15 PM, Michael S. Tsirkin wrote:
>> On Wed, Mar 03, 2021 at 05:08:36PM -0500, Michael S. Tsirkin wrote:
>>> On Wed, Mar 03, 2021 at 10:46:43PM +0100, Philippe Mathieu-Daudé wrote:
>>>> Introduce the cpu_virtio_is_big_endian() generic helper to avoid
>>>> calling CPUClass internal virtio_is_big_endian() one.
>>>>
>>>> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
>>>
>>> Using virtio in the name here probably because virtio wants this?
>>> That doesn't sound like a good naming strategy, name should
>>> tell us what function does not how it's used.
>>
>> On a more concrete proposal, how about using this change
>> to rename the virtio_is_big_endian field to guest_is_big_endian(),
>> and put the wrapper somewhere in a virtio header instead?
> 
> We already one for normal guest endianness.  This one is for when virtio 
> specifically differs from that.

Hmph.  I remembered incorrectly.  I thought we had a bit of ppc weirdness in 
which endianness was reversed for virtio, but no.

I'm ok with the renaming.


r~


