Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 01CE665FBC3
	for <lists+qemu-devel@lfdr.de>; Fri,  6 Jan 2023 08:16:10 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pDgw6-00036S-7N; Fri, 06 Jan 2023 02:14:42 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pDgw2-00034v-Ov
 for qemu-devel@nongnu.org; Fri, 06 Jan 2023 02:14:39 -0500
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pDgw0-0000nr-Qz
 for qemu-devel@nongnu.org; Fri, 06 Jan 2023 02:14:38 -0500
Received: by mail-wm1-x32f.google.com with SMTP id
 k26-20020a05600c1c9a00b003d972646a7dso2931132wms.5
 for <qemu-devel@nongnu.org>; Thu, 05 Jan 2023 23:14:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=Zh5WUpz8Sm37IxHRVDgR9r2mO8lPhQDWik06D9cTtE0=;
 b=am7vnZQnkqOo7hjfeZ6oiOvqo88p4ECOBD3GDPRZVs3SOBcWQYuImMZiffiK25KQLO
 2uMeR8jcb2TTIHDUEsw+T1QREsRtVni9NKJHonabEiT/JxEBwo+SBoZ4H9en6iMrDaYC
 0Pm9QKBPqTTGCxW+cY1yz5VAhVr6UInLp2xhjV/uO28WhceW4pku721hpJMaiEkyYmMX
 Rx5xSsxxEWP/mSWHDS0SwWUKpnP8S9Jnsjn6a4NBA6HiZZRfL7qd1RjOCXtV36jpDeO/
 pUsGlehKuTgGFUZmpzrppd/xNq08OAUmOoJHzmvNHl+wX2jai5Y9EFN57LbWUquobPcT
 T31A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Zh5WUpz8Sm37IxHRVDgR9r2mO8lPhQDWik06D9cTtE0=;
 b=OLDJWe7/N5Nhh/OeljoDt74LNQhMyhGvpC5iPUZzLINQNP6u2VS6fD7GXv7lhQFlxk
 3WyAqC2HRThxQcatdj4pOxeubu212Wog+S/W342lXG2LCI+GP6aT/7S2MFd0YCcdu40B
 6t5YqBgHiQxJllwlpfaMMdpY7u9bwcn66g//DU1mW/v9TxnfGm2QwiJ9xcL7t3RTq3E4
 6zNvlGMuGM5ktvKlVM5cIXbne3CILfJbRwvwc+PLCAlzWkszyPNHmyJ43dlWXx5TWcSx
 Ex4VHZnNBNw7XZpwiw68cckr3wvSOupXNEGfZvyn1iuWCzyF0PSjsOMhN9VPCLf8t9RG
 0x9A==
X-Gm-Message-State: AFqh2koJ2QPQA4EPe1zc2OfMh5CCsvHwQ+m4NHF6/q4wg2oy/7Muhdke
 JjaVppmflq+DVSdQ4bqcpRN18A==
X-Google-Smtp-Source: AMrXdXsJKlDEMyb8FgAY+81IpLuNVbS4VT8XaSg3Vtv3tGpaTPxcQOTeLBvm6ko2y2uZTDAonhQs7w==
X-Received: by 2002:a05:600c:35cc:b0:3d3:3c93:af34 with SMTP id
 r12-20020a05600c35cc00b003d33c93af34mr47357724wmq.2.1672989274450; 
 Thu, 05 Jan 2023 23:14:34 -0800 (PST)
Received: from [192.168.30.216] ([81.0.6.76]) by smtp.gmail.com with ESMTPSA id
 g14-20020a05600c310e00b003cf5ec79bf9sm639892wmo.40.2023.01.05.23.14.33
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 05 Jan 2023 23:14:33 -0800 (PST)
Message-ID: <174b23f7-9a01-8937-6d1c-bf61846c3ca2@linaro.org>
Date: Fri, 6 Jan 2023 08:14:32 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.6.1
Subject: Re: [RFC PATCH 11/40] target/arm: Copy features from ARMCPUClass
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: pbonzini@redhat.com, berrange@redhat.com, eduardo@habkost.net,
 armbru@redhat.com, ajones@ventanamicro.com, alex.bennee@linaro.org
References: <20230103181646.55711-1-richard.henderson@linaro.org>
 <20230103181646.55711-12-richard.henderson@linaro.org>
 <c154778b-ed95-5d73-4533-2301820b05a1@linaro.org>
 <d588a819-b4ed-0fc2-480d-6e9b3b064564@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <d588a819-b4ed-0fc2-480d-6e9b3b064564@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32f;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32f.google.com
X-Spam_score_int: -49
X-Spam_score: -5.0
X-Spam_bar: -----
X-Spam_report: (-5.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-2.939,
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

On 6/1/23 03:19, Richard Henderson wrote:
> On 1/5/23 14:04, Philippe Mathieu-Daudé wrote:
>> On 3/1/23 19:16, Richard Henderson wrote:
>>> Create a features member in ARMCPUClass and copy to the instance in
>>> arm_cpu_init.  Settings of this value will come in a future patch.
>>>
>>> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
>>> ---
>>>   target/arm/cpu-qom.h | 18 ++++++++++++++++++
>>>   target/arm/cpu.c     |  1 +
>>>   2 files changed, 19 insertions(+)


>>> +static inline void unset_class_feature(ARMCPUClass *acc, int feature)
>>> +{
>>> +    acc->features &= ~(1ULL << feature);
>>> +}
>>
>> These helpers are not used until patch #19 "target/arm: Move most cpu
>> initialization to the class".
> 
> I know, but I thought it clearer to introduce them with the field.

Fine.

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>


