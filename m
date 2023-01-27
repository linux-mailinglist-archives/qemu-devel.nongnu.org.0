Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C1B167F01D
	for <lists+qemu-devel@lfdr.de>; Fri, 27 Jan 2023 22:09:27 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pLVwx-0001nV-2z; Fri, 27 Jan 2023 16:07:55 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pLVwv-0001nD-09
 for qemu-devel@nongnu.org; Fri, 27 Jan 2023 16:07:53 -0500
Received: from mail-pj1-x1035.google.com ([2607:f8b0:4864:20::1035])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pLVwt-0003m5-Ds
 for qemu-devel@nongnu.org; Fri, 27 Jan 2023 16:07:52 -0500
Received: by mail-pj1-x1035.google.com with SMTP id
 b24-20020a17090a551800b0022beefa7a23so9815850pji.5
 for <qemu-devel@nongnu.org>; Fri, 27 Jan 2023 13:07:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=/mhixy3+vpZ+fgS0Tib5mpjEOxFlJkWjwxOcjMH0AIo=;
 b=b8ODi/uJ662uDND6lvpjOO5GMMZ5jN9NmisFFgDOYF64nWgqcnhGVNDzSw6ciaxl/+
 YTNV9dvyZRaQT1sWuihh4ZmwzYVgvzxmStZdcvTR/tg8cZOz7LDmnPOqB/GHVM5nI/jh
 KBloOgY8/9UOJ4jyySoRNSkiu07XBl+LXXGGOX9VELCvI76FLGAmRX2x6zItSVY/gA2c
 RvvJPF7azwonbZmCUyWbokl2Vlxk+sD/ygqJhV9GuM6iJPyTwjZz8GPcbAj7gyFbmZuH
 QuVFh+XCY6jlRbOKfUG5+Bz0fVbZZOmEs1HvoeAYw7w43oGqCjsDiK8hZEGKRWtZGaVI
 HVHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=/mhixy3+vpZ+fgS0Tib5mpjEOxFlJkWjwxOcjMH0AIo=;
 b=Dga65JzKunJjAjFsmqykr122xUa5nK+8pO3jyi4Qtasp6ugzM48cBi3y12ULMm2EXr
 rtObYTHRtaqCAZnOk7xqsVQdoZGdBsffkMeYsl46EvlKgo1kUcwGjv4m4rNCO0NYqM5G
 4ToT1GbMzzcgkR2vdvWKDgca5nhcL7twRNC4581R519wOs1PKrDnILW8sDzSdSCJ5I4y
 eKJf98aH+iX3BTZuP58eAQI8KKj513vC8hPz8YE7hZZyYMBQj2lPBFG1tdaJYM+5JFMN
 ZLnTjz4RkAW3VrK98kD4xVLbaQwtX8/DW8LiJHoH1XI2ewo179PPoWtAj4ICPvaN5YTt
 56NA==
X-Gm-Message-State: AO0yUKUHFfgJsnVxmXkonbdHy4KHbtGHHUTQIebcIOrFfE+NO6EQcZ4Y
 qaB/vCZJP3eLdIl4IEG4W24R4A==
X-Google-Smtp-Source: AK7set8hEE+pQKZ3VH68CDV+G7epZEwF8z9fOQNF21uTQEgeag1wErnNT/Qc5kKalgoNtiry4P52fQ==
X-Received: by 2002:a17:903:210a:b0:196:3e78:70be with SMTP id
 o10-20020a170903210a00b001963e7870bemr5667580ple.40.1674853669095; 
 Fri, 27 Jan 2023 13:07:49 -0800 (PST)
Received: from [192.168.50.174] (rrcs-173-197-98-118.west.biz.rr.com.
 [173.197.98.118]) by smtp.gmail.com with ESMTPSA id
 p18-20020a170902ebd200b00196053474a8sm3289864plg.53.2023.01.27.13.07.40
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 27 Jan 2023 13:07:45 -0800 (PST)
Message-ID: <6b7d1132-9274-c019-440a-8deb84189b21@linaro.org>
Date: Fri, 27 Jan 2023 11:07:35 -1000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [RFC PATCH 04/16] hw/arm/virt: Add support for Arm RME
Content-Language: en-US
To: Jean-Philippe Brucker <jean-philippe@linaro.org>, peter.maydell@linaro.org
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, pbonzini@redhat.com,
 eblake@redhat.com, armbru@redhat.com, berrange@redhat.com,
 eduardo@habkost.net, alex.bennee@linaro.org
References: <20230127150727.612594-1-jean-philippe@linaro.org>
 <20230127150727.612594-5-jean-philippe@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20230127150727.612594-5-jean-philippe@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1035;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1035.google.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.148,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

On 1/27/23 05:07, Jean-Philippe Brucker wrote:
> When confidential-guest-support is enabled for the virt machine, call
> the RME init function, and add the RME flag to the VM type.
> 
> * The Realm differentiates non-secure from realm memory using the upper
>    GPA bit. Reserve that bit when creating the memory map, to make sure
>    that device MMIO located in high memory can still fit.
> 
> * pvtime is disabled for the moment. Since the hypervisor has to write
>    into the shared pvtime page before scheduling a vcpu, it seems
>    incompatible with confidential guests.
> 
> Signed-off-by: Jean-Philippe Brucker <jean-philippe@linaro.org>

This should be 3 patches:

(1) Including the rme type into the kvm type.
(2) Adjusting the pa size,
(3) Checking the steal-time and randomness flags.


> +    /*
> +     * Since the devicetree is included in the initial measurement, it must
> +     * not contain random data.
> +     */
> +    if (virt_machine_is_confidential(vms)) {
> +        vms->dtb_randomness = false;
> +    }

This property is default off, and the only way it can be on is user argument.  This should 
be an error, not a silent disable.

> +    if (virt_machine_is_confidential(vms)) {
> +        /*
> +         * The host cannot write into a confidential guest's memory until the
> +         * guest shares it. Since the host writes the pvtime region before the
> +         * guest gets a chance to set it up, disable pvtime.
> +         */
> +        steal_time = false;
> +    }

This property is default on since 5.2, so falls into a different category.  Since 5.2 it 
is auto-on for 64-bit guests.  Since it's auto-off for 32-bit guests, I don't see a 
problem with it being auto-off for RME guests.

I do wonder if we should change it to an OnOffAuto property, just to catch silly usage.


r~

