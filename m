Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 25A3F3448E4
	for <lists+qemu-devel@lfdr.de>; Mon, 22 Mar 2021 16:11:57 +0100 (CET)
Received: from localhost ([::1]:59956 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lOMDk-0006m2-7c
	for lists+qemu-devel@lfdr.de; Mon, 22 Mar 2021 11:11:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52446)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lOM3M-0002Ki-Fs
 for qemu-devel@nongnu.org; Mon, 22 Mar 2021 11:01:13 -0400
Received: from mail-qk1-x72a.google.com ([2607:f8b0:4864:20::72a]:46834)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lOM3E-00068f-8j
 for qemu-devel@nongnu.org; Mon, 22 Mar 2021 11:01:12 -0400
Received: by mail-qk1-x72a.google.com with SMTP id z10so10812985qkz.13
 for <qemu-devel@nongnu.org>; Mon, 22 Mar 2021 08:01:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=k6yYVgdHMbls86lruY2GltksH7U/k3QNgSOe/qSwH2M=;
 b=Az9+kwCoMQwOCnT5r/n4Xob+hC7rrAtLu8vpvA5TneTo55u+lY8gFTCAqzNYtwOJYC
 6tdaHshI1Wy9fV4KDkRQKQ2VPS5SjMVmZwzI4YNKcH78IcyjFhrXTPT803/NuqcPN99y
 +/a0CDqldZR3tjKYzsqoxjYNPk0h5fdS6Gfi1e7YQAMp4nU8Rd4HZVltYVzguDfQRO+D
 uwfCnM4B/E0+EVUPRWnsCnqAKbvNxIyiot8JjB4aq1UhNm4DZTz1lXBMA0YnI8rOS7JB
 Rzfc0hD+QTJMEAOdPlfg90asd9piLS88WxvdL0yRZntWUFXvStfx6WwtSlWj5L6hC8z3
 uhZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=k6yYVgdHMbls86lruY2GltksH7U/k3QNgSOe/qSwH2M=;
 b=Vt9hbWdX9rPunufkYXKr74jJSdcBArveLZmh9AkeXWJb9DPrtODOR3NeJmjGxMS8Vu
 O52c26tZTBaH+ZIeLUOpP5wC1xDktyNnZZlg/5UFMrT9jc4y3cWiVbjoSXizp9r2NBHW
 noVP0jC9bzUUjoN7kdLJMHeH3yhWIFeaYavOzwa0kFH2ea+JF4+2rgEsPwFd5H9jFsVL
 sF1yrdcrSzmGRT5FISrnYN++xCCVcdTzTdA3jlmON2cikI0BD4gcHP/IHYslYLAHU5LN
 fwSKQWR4JIdnsb1l89Vmkl9egpW4+dSfINCGVZc/CoLzENdzWG9H/AO08GrLcha1Bxtj
 DmfA==
X-Gm-Message-State: AOAM531KNG6co4+V8FIWUjMgIRU/R+AoNnpa3pP/S5p+mRtn5J1pOLfT
 fvm20L9FADi2tShjndZl5ue58Q==
X-Google-Smtp-Source: ABdhPJyHATn6Vn87Sm3YWwo4aWwzK25h8HGlGUE/h9TBjeXc5HGVRBHHnOhQLqc+IaYvDB6mOf9YXg==
X-Received: by 2002:a37:755:: with SMTP id 82mr481967qkh.52.1616425260466;
 Mon, 22 Mar 2021 08:01:00 -0700 (PDT)
Received: from [10.10.121.52] (fixed-187-189-51-144.totalplay.net.
 [187.189.51.144])
 by smtp.gmail.com with ESMTPSA id k126sm11230432qkb.4.2021.03.22.08.00.59
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 22 Mar 2021 08:01:00 -0700 (PDT)
Subject: Re: [PATCH v3 for-6.0 2/2] tcg: Workaround macOS 11.2 mprotect bug
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
References: <20210320165720.1813545-1-richard.henderson@linaro.org>
 <20210320165720.1813545-3-richard.henderson@linaro.org>
 <6155888a-e1af-0a47-a669-1bc12c4478fa@amsat.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <7b4307e4-d7ea-f0fa-9d40-8324d37aca5c@linaro.org>
Date: Mon, 22 Mar 2021 09:00:57 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <6155888a-e1af-0a47-a669-1bc12c4478fa@amsat.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::72a;
 envelope-from=richard.henderson@linaro.org; helo=mail-qk1-x72a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Cc: r.bolshakov@yadro.com, j@getutm.app
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 3/22/21 4:03 AM, Philippe Mathieu-Daudé wrote:
>> -        rc = qemu_mprotect_none(end, page_size);
> 
> What about:
> 
> #ifdef CONFIG_DARWIN
> 
>             /* ... */
>             (void)rc;
> #else
> 
>> -        g_assert(!rc);
> 
> #endif

What does that buy us, really?  It seems like it just clutters the code with 
ifdefs.


r~

