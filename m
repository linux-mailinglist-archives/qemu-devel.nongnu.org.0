Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AFA6241A4E9
	for <lists+qemu-devel@lfdr.de>; Tue, 28 Sep 2021 03:43:48 +0200 (CEST)
Received: from localhost ([::1]:37880 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mV29q-0007fB-Sl
	for lists+qemu-devel@lfdr.de; Mon, 27 Sep 2021 21:43:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54744)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mV28U-0006KM-6k
 for qemu-devel@nongnu.org; Mon, 27 Sep 2021 21:42:22 -0400
Received: from mail-qv1-xf2c.google.com ([2607:f8b0:4864:20::f2c]:36742)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mV28S-0001kf-Mz
 for qemu-devel@nongnu.org; Mon, 27 Sep 2021 21:42:21 -0400
Received: by mail-qv1-xf2c.google.com with SMTP id jo30so12462446qvb.3
 for <qemu-devel@nongnu.org>; Mon, 27 Sep 2021 18:42:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=I1qAeMfVOB2KfHyRp/8hXqiLwS7BNtxH+5iC1Q+NrtY=;
 b=pFroOCYmBzANriAggRNCVhzaiZBn72msFFtEJu/IVof1FNRy2g9EAFC3Dauw1fkJ3e
 8/KEGd4wojNIWzYgGpE9rzdF6+rV3TA85+T0gDtTdUryH28N4uYBknuixpALVqgR5hUR
 srQBKo5oSilDwFp807AKyubQKymq2n7PWRdYmuu/ao0nNuZTDjiomKstTwYUCQnP/4rj
 JbsSQ8+/my9jWS0HgvhtkFfd4ySZeHKRE30dzd03GH4eUeXrEbpKM8lTz+bvxIb02hF1
 FmEjypJ90aBH3BBbvjAlFLD9gUOUXO7ULmyEb+V3/1Uo6k5PP/9baSkvqpP41SdtkfLf
 BXWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=I1qAeMfVOB2KfHyRp/8hXqiLwS7BNtxH+5iC1Q+NrtY=;
 b=BT3o88VvhIQPNUY/Ek/LpyDnIACKu55eHOnQCfkpVN45YmNH6aGUb+SZDl47HTOPG2
 jn1CXYkSL1MQ820+6GgQJaFdlLzV+YLiEns7r7e5jgPPS5284bHf9wlMNMfisx3uoBCF
 jFEnQmOaI5FW4AoOlWjXMiYCO/jNanxs/W4anGCRDSWtcxmbCdTmFw3tOEZv5sCnCuUF
 jwMBaUlcAGSShxhOjMdJ+IZNP5QNbAUEPzWMSmpbjb+EFoIQEmsGgC/QmrHBkc5JzRqV
 AudXqX15DPEEDUoxfrUrAkdOkjIyJTF69eLGJ6h6WIVeSYIVIPw293YVzZHpGBEYwhXN
 pO2g==
X-Gm-Message-State: AOAM533nNpRGrv0R7VcacgdXqPQ1lSDHuAffwINJcoQH+D5pUIly5Pa+
 jKlYJ2y+mn9chQEO2TMqNufK85d28hLRjw==
X-Google-Smtp-Source: ABdhPJy95LzkNXJJmH8YJOx6GAVwb9kK9/1fa6vVLrgOV8jRBMJmEIZvX2LC+zHQgkEe4M0RGPlrCg==
X-Received: by 2002:a0c:c189:: with SMTP id n9mr3074698qvh.5.1632793337146;
 Mon, 27 Sep 2021 18:42:17 -0700 (PDT)
Received: from [192.168.3.43] (cpe-24-31-215-130.sc.res.rr.com.
 [24.31.215.130])
 by smtp.gmail.com with ESMTPSA id z6sm1138245qkl.31.2021.09.27.18.42.16
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 27 Sep 2021 18:42:16 -0700 (PDT)
Subject: Re: [PATCH v3 10/27] linux-user/i386: Implement setup_sigtramp
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
References: <20210924165926.752809-1-richard.henderson@linaro.org>
 <20210924165926.752809-11-richard.henderson@linaro.org>
 <9f360405-3897-fd03-4da2-e943defb2d86@amsat.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <c01b0ba8-ea47-eb5d-1d3f-4ba746fb7ad2@linaro.org>
Date: Mon, 27 Sep 2021 21:42:14 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <9f360405-3897-fd03-4da2-e943defb2d86@amsat.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::f2c;
 envelope-from=richard.henderson@linaro.org; helo=mail-qv1-xf2c.google.com
X-Spam_score_int: -51
X-Spam_score: -5.2
X-Spam_bar: -----
X-Spam_report: (-5.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-3.136,
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
Cc: peter.maydell@linaro.org, laurent@vivier.eu
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 9/24/21 2:01 PM, Philippe Mathieu-Daudé wrote:
>> +static void install_sigtramp(void *tramp)
>> +{
>> +    /* This is popl %eax ; movl $syscall,%eax ; int $0x80 */
>> +    __put_user(0xb858, (uint16_t *)(tramp + 0));
>> +    __put_user(TARGET_NR_sigreturn, (int *)(tramp + 2));
> 
> I know this is mostly code movement, but using uint32_t would
> make it easier to read.

I'll give you int32_t here, since the value is signed.

>> +    __put_user(TARGET_NR_rt_sigreturn, (int *)(tramp + 1));
> 
> and uint32_t.

Likewise.

>> +    uint16_t *tramp = lock_user(VERIFY_WRITE, sigtramp_page, 2 * 8, 0);
> 
> Shouldn't this be 8 + 7?

Does it really matter if we write 15 or 16 bytes of this page?


r~

