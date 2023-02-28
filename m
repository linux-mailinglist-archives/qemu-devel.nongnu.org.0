Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D6DD36A6235
	for <lists+qemu-devel@lfdr.de>; Tue, 28 Feb 2023 23:13:49 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pX8Dm-0007xA-Ge; Tue, 28 Feb 2023 17:13:18 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pX8Dk-0007wY-30
 for qemu-devel@nongnu.org; Tue, 28 Feb 2023 17:13:16 -0500
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pX8Di-0007md-9j
 for qemu-devel@nongnu.org; Tue, 28 Feb 2023 17:13:15 -0500
Received: by mail-wr1-x433.google.com with SMTP id v16so8522403wrn.0
 for <qemu-devel@nongnu.org>; Tue, 28 Feb 2023 14:13:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1677622390;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=3dz8mEHmAIBOu77syJH/lKLY262ZlY0Zp+tar+t1AuU=;
 b=w3KguZmXRw4hvPflWWmXjEbvEWfwwhFLx3MXKxlv40c3ehMlXPudLVfclOyIseo9fU
 +UeDr94nuVE+IjBdGFpv4aF01hCZM8fl/g77rb7PI0UkKDSaz0NRbzzvDOohMVYwnFOR
 qVX9CTEr9QLmthMwhnj7cLVwqUPL3E5dyl5Pj6Uy5W/uNCHLD0sbURP7sOdEmKoxGbCK
 kIrsIGfHeVfmlanEwmFwk+irrUo1JjO3L/mMoqK7vvxLyht++dVUqT7wd/R/LEaGptbH
 djttx/flCeYBcQozrZFRciIfBDi3WNfcucMiplpAW2roz28MxAVneer7odTEJkNFmIq1
 6xBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1677622390;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=3dz8mEHmAIBOu77syJH/lKLY262ZlY0Zp+tar+t1AuU=;
 b=jSAPmuoQwXUAyZD2jH/jwOV0zrrhW5dLIRVu9jM/axxxI2CViX7Fu3ZlFIc/+kxdYD
 TzgzAhxLuqXbxAPHlbHZr/CTpr+h/uT6O3Ao5EzO+1GScu6sQ6mZBQWrsjbLegvv2Av0
 u2zzK01Bw6/VdaE3OgKuStAcRrnboANObQtVNn+phUZdJojb/hFuR/tT7fk6BvMbe/bU
 SL+XS78r6IsBUi7QPHbMAYPZ23FnFOIdnfJzH1inmxDSVCBKF7vlmHWiMStjpWMLDu2b
 COfKyrXQrdHQxo2EhEpkvgOjIiBJAp8r8BRdkFqlGokj6FhoDAlFhMG61uTvpYd8zPsy
 W5bQ==
X-Gm-Message-State: AO0yUKWUc+OS1yQFL9MYzoRM7NXU3POdEyt94do8jdKv70Vu69/kXBro
 zqaoFW13c4tqpRjDymc7dPM+Tu/dFXhDjpw6
X-Google-Smtp-Source: AK7set8zKmHBsiEj/BFZpEvcNclxkLwXHXYpKV6VGF9WI1VSSSa2Cq4KQ++VyQl87cX0OpzqZO2KuA==
X-Received: by 2002:a5d:6dc6:0:b0:2c8:14ba:4589 with SMTP id
 d6-20020a5d6dc6000000b002c814ba4589mr3092429wrz.42.1677622389904; 
 Tue, 28 Feb 2023 14:13:09 -0800 (PST)
Received: from [192.168.68.175] (166.red-88-28-30.dynamicip.rima-tde.net.
 [88.28.30.166]) by smtp.gmail.com with ESMTPSA id
 b6-20020a5d4d86000000b002ca864b807csm8471538wru.0.2023.02.28.14.13.08
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 28 Feb 2023 14:13:09 -0800 (PST)
Message-ID: <7212f541-ded3-dbb3-fb0c-7ed3832546c3@linaro.org>
Date: Tue, 28 Feb 2023 23:13:06 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.8.0
Subject: Re: [PATCH 3/3] hw/acpi/cpu_hotplug: Convert 'Object *device' ->
 'DeviceState *parent'
Content-Language: en-US
To: "Michael S. Tsirkin" <mst@redhat.com>
Cc: qemu-devel@nongnu.org, Ani Sinha <ani@anisinha.ca>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Markus Armbruster <armbru@redhat.com>, Igor Mammedov <imammedo@redhat.com>,
 Aurelien Jarno <aurelien@aurel32.net>
References: <20230203163021.35754-1-philmd@linaro.org>
 <20230203163021.35754-4-philmd@linaro.org>
 <20230228163949-mutt-send-email-mst@kernel.org>
 <708fa08e-d9f8-7d08-848b-2adafb3fac70@linaro.org>
 <20230228170637-mutt-send-email-mst@kernel.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230228170637-mutt-send-email-mst@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::433;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x433.google.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.092,
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

On 28/2/23 23:09, Michael S. Tsirkin wrote:
> On Tue, Feb 28, 2023 at 11:05:24PM +0100, Philippe Mathieu-Daudé wrote:
>> On 28/2/23 22:41, Michael S. Tsirkin wrote:
>>> On Fri, Feb 03, 2023 at 05:30:21PM +0100, Philippe Mathieu-Daudé wrote:
>>>> ACPI CPU hotplug parent can't be any QOM object, it must be a QDev.
>>>> Convert AcpiCpuHotplug::device field as QDev to enforce this.
>>>> Rename 'owner' and 'device' variables as 'parent'.
>>>>
>>>> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
>>>
>>>
>>> So instead of plain gpe->device we now have OBJECT all over
>>> the place. Why is this an improvement?
>>
>>  From QOM PoV, in this prototype change:
>>
>>    void legacy_acpi_cpu_hotplug_init(MemoryRegion *container,
>> - Object *owner,
>> + DeviceState *parent,
>>
>> we promote the parent/owner argument from generic Object to
>> Device, which is more restrictive.
>>
>> Thus now you can not pass any QOM object, it has to be a QDev.
> 
> None of the functions really seem to care what kind of object
> they get. Anything that results in less casting is a win
> in my book. More casting - a loss.

OK we are discussing QOM design then. I'll go back to this
in a future RFC. Sorry for having wasted your time meanwhile.

