Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CEC269DE39
	for <lists+qemu-devel@lfdr.de>; Tue, 21 Feb 2023 11:52:03 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pUQE7-0004ON-G1; Tue, 21 Feb 2023 05:50:27 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pUQE3-0004Ns-BH
 for qemu-devel@nongnu.org; Tue, 21 Feb 2023 05:50:23 -0500
Received: from mail-pl1-x62c.google.com ([2607:f8b0:4864:20::62c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pUQE1-0002Zo-Lg
 for qemu-devel@nongnu.org; Tue, 21 Feb 2023 05:50:22 -0500
Received: by mail-pl1-x62c.google.com with SMTP id z10so1423445ple.6
 for <qemu-devel@nongnu.org>; Tue, 21 Feb 2023 02:50:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=fqT6Bdu+GaVBwMBVVOf3EnB3ZNrPZ8Lt4F67E3VKzxQ=;
 b=NF7dAwkS9TyGIMzMAS3FlziVO0JFLoUvBoP5wBlFV/OXB0D9Htglw8PWxx+IWHiLLx
 1GnvGwAjYnL9fYPo4xYDymkDX7Uxl6XFqEnMQw3v8+LTlKvvbNdB8gMoxsn0ye8+YgVg
 uFAxjyob85Xl+B1pYOIqIv1FUvnCH9rVNtZ9vRVLd8c19CxBsabr/KL6o0KARqkJBizS
 zwgcW4UJR6LBHcBzNwAz92H69CdYIhW/pimmwxfRi/v3e7AUPSNJEeR0mwLyQc/ANy5p
 CHknYjd/BWxrj1rJjVuXtIYEBLSmdcMLxw9Ix7FR+7583HEdZfC7Y7CqrOMTBJcdW078
 etlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=fqT6Bdu+GaVBwMBVVOf3EnB3ZNrPZ8Lt4F67E3VKzxQ=;
 b=O6KG65B6tMoujvnkCV6oc5Yb6FgdLDb5STJawmmx1uJlDAIKth7p7j/B/qtcDTzd+V
 qiA/ozLgS5YC6tJEWKy/0X54TB9MqzY2J/csq/Rew8OC8DXWkHzeqPZWB64tnqS5/cAj
 nTtYDu/6VQ86iEH0xsKRmCw4nAPqmVkjfPnLY48WGm4cfU6L55dUyAxcEfdIoG2fDz5+
 N5se9/PQTb4dcHsi0Cvk8mrMpQ353yZmeiERGWwdL9x07zbj3rTqtzrwnZI9LdO2yhuY
 46WitmH5ZPnVp4os3KDnyoXvBbWaLVcJl4lPmz5pJqF8+82hqkUf6Am5ZTM2LxoWWebe
 Qgag==
X-Gm-Message-State: AO0yUKVMlmAQUq8bKVG5ajUBOnUZYZQYu1+or0p8rYVPGKNef7nbXilX
 x1rUcsBYZx/bBGYtC/swBiL4bw==
X-Google-Smtp-Source: AK7set8pS1YCTHuGeoIzeWnueq83hJhEAyIzawmpEcB+NAiH5NU/pIm2hl94UL6dnPnI/fX5ULoB8Q==
X-Received: by 2002:a17:903:27c4:b0:19a:af11:a0c7 with SMTP id
 km4-20020a17090327c400b0019aaf11a0c7mr4838840plb.3.1676976619966; 
 Tue, 21 Feb 2023 02:50:19 -0800 (PST)
Received: from [192.168.6.128] (rrcs-173-198-77-218.west.biz.rr.com.
 [173.198.77.218]) by smtp.gmail.com with ESMTPSA id
 v20-20020a170902e8d400b0019a87ede846sm3141353plg.285.2023.02.21.02.50.18
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 21 Feb 2023 02:50:19 -0800 (PST)
Message-ID: <14c3e3e0-1b1c-5b32-1bb9-8269e9facb7a@linaro.org>
Date: Tue, 21 Feb 2023 00:50:16 -1000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH v2 07/21] include/exec/memattrs: Add two bits of space to
 MemTxAttrs
Content-Language: en-US
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, Peter Maydell <peter.maydell@linaro.org>
References: <20230220232626.429947-1-richard.henderson@linaro.org>
 <20230220232626.429947-8-richard.henderson@linaro.org>
 <b1a5b38a-73ae-9610-676b-b27dd4c7195a@linaro.org>
 <bf06cdce-aa5f-98f3-4544-31d08d6bd55e@linaro.org>
 <ac13c9ce-89e2-cd83-235d-be7bc0544284@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <ac13c9ce-89e2-cd83-235d-be7bc0544284@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62c;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62c.google.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.09,
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

On 2/21/23 00:42, Philippe Mathieu-Daudé wrote:
> On 21/2/23 11:01, Richard Henderson wrote:
>> On 2/20/23 21:56, Philippe Mathieu-Daudé wrote:
>>> 'secure' & 'user' seem mutually exclusive. If we get short in bits,
>>> they could be shared.
>>
>> They are not.  ARM has Secure EL0, or secure user mode.
> 
> Oh, I misunderstood this field with user-emulation then (I tried
> commenting it and my TCG/HVF build succeeded).
> 

target/arm/ptw.c:2853:    result->f.attrs.user = regime_is_user(env, mmu_idx);

So... it shouldn't have built?

r~

