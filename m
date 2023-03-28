Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B6076CC9BD
	for <lists+qemu-devel@lfdr.de>; Tue, 28 Mar 2023 19:54:55 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1phDWA-00024M-Gw; Tue, 28 Mar 2023 13:53:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1phDW9-00024D-1v
 for qemu-devel@nongnu.org; Tue, 28 Mar 2023 13:53:57 -0400
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1phDW6-0004Qb-Ug
 for qemu-devel@nongnu.org; Tue, 28 Mar 2023 13:53:56 -0400
Received: by mail-wr1-x435.google.com with SMTP id r11so13084850wrr.12
 for <qemu-devel@nongnu.org>; Tue, 28 Mar 2023 10:53:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1680026033;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=Qt1v3+ykxxe86FWa69KpYuy6yD6EcQ+IDr9r3DNp3tc=;
 b=kCumkb4QfyO4dzj88358PsvMqkbP615qRPAN2zJnoc6+WLa1zp2Z/WvmDdk5dOXihn
 GgaHOSsE9NRvYLrKbazrXhosS1q4iKLQHhmRhbOTwqhex6A6yNUejkMz9mrHQKPGQkgE
 +UQZxc11zc3pWJm5vCuMm8m/FhfUv+kSyHUVky+JUdZhTn2YMCfpOrQSCV/0d+RqBlmD
 Ww4wOTt6XNJtt2yA+5eMsPDBi/VtPTvNr1AYzhzDQvZoTNwFOC0UyUcmQW9VJrjrtJPm
 qki7/gIEx1eFYDwUkJbJBw6Ar33Lqx86Of5yl/0mkFeZrBfwZwzSRsfhD5zsrd1h+Q4q
 aB1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680026033;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Qt1v3+ykxxe86FWa69KpYuy6yD6EcQ+IDr9r3DNp3tc=;
 b=3JomkX5HUGaIwis4zNrbY/xp2SmFCe6bFtQ4k5qNZeru1PDVdqaf1gfG/TJY25TO0p
 Bjdycuuk6opoWkoSw9EZvkTxQQ64eQQsXGoi3VXPwPvJPpcAok81KVv3JxrUO7z+7h3I
 62S9ykyXor6sOYxUwCbJGsHCl3POkdL99VZf8UQiB7Z0lhiwrSHxr5yr04989ufqqFfB
 ncBE3QhfpAK/FGNO3MYxJ6/z+H3Y3keA/Yzx9NUqHdOekhM2DUiCwwt0yQjYaHzXMIRf
 mmpDdvqZ5DxvZIx1XLI5M6b63w8EKVzHexD7gJNY84y3lZeXbped1vbCXKwfv3Q8yzX6
 TteA==
X-Gm-Message-State: AAQBX9fNZ+NOHpMyAcIoC+t7YYz3r+qkEEQRFkZiZWyTgsGuyy+DRvl3
 8Ii+GCsXj5xX0mxU7R6ZEFNyGA==
X-Google-Smtp-Source: AKy350Zu25LLf56Uev1ME3Q2rPEkmXUdMX02CsQnZnohQyVNv0A5QT3xQpqURCC68v2vSWIYPOBPIg==
X-Received: by 2002:a5d:4dcb:0:b0:2ca:8da1:db96 with SMTP id
 f11-20020a5d4dcb000000b002ca8da1db96mr12291858wru.50.1680026033049; 
 Tue, 28 Mar 2023 10:53:53 -0700 (PDT)
Received: from [192.168.69.115] ([176.187.210.212])
 by smtp.gmail.com with ESMTPSA id
 b3-20020a5d4d83000000b002dfca33ba36sm6672720wru.8.2023.03.28.10.53.52
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 28 Mar 2023 10:53:52 -0700 (PDT)
Message-ID: <85bbdb2a-6c3c-1982-3f00-a2217fb8b971@linaro.org>
Date: Tue, 28 Mar 2023 19:53:51 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.9.0
Subject: Re: [PATCH for-8.0 v2 10/12] linux-user: Pass last not end to
 probe_guest_base
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: alex.bennee@linaro.org, Laurent Vivier <laurent@vivier.eu>
References: <20230327211824.1785547-1-richard.henderson@linaro.org>
 <20230327211824.1785547-11-richard.henderson@linaro.org>
 <c6273091-da88-03b9-4137-8ad19f4cf9e3@linaro.org>
 <81ceba14-5003-4215-8f61-54c57fbc3378@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <81ceba14-5003-4215-8f61-54c57fbc3378@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::435;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x435.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
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

On 28/3/23 19:47, Richard Henderson wrote:
> On 3/28/23 06:51, Philippe Mathieu-Daudé wrote:
>> Hi Richard,
>>
>> On 27/3/23 23:18, Richard Henderson wrote:
>>> Pass the address of the last byte of the image, rather than
>>> the first address past the last byte.  This avoids overflow
>>> when the last page of the address space is involved.
>>>
>>> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
>>> ---
>>>   linux-user/elfload.c  | 24 ++++++++++++------------
>>>   linux-user/flatload.c |  2 +-
>>>   2 files changed, 13 insertions(+), 13 deletions(-)


>>> index e99570ca18..5efec2630e 100644
>>> --- a/linux-user/flatload.c
>>> +++ b/linux-user/flatload.c
>>> @@ -448,7 +448,7 @@ static int load_flat_file(struct linux_binprm * 
>>> bprm,
>>>        * Allocate the address space.
>>>        */
>>>       probe_guest_base(bprm->filename, 0,
>>> -                     text_len + data_len + extra + indx_len);
>>> +                     text_len + data_len + extra + indx_len - 1);
>>
>> Per linux-user/user-internals.h:
>>
>> /**
>>   * probe_guest_base:
>>   * @image_name: the executable being loaded
>>   * @loaddr: the lowest fixed address in the executable
>>   * @hiaddr: the highest fixed address in the executable
>>   *
>>   * Creates the initial guest address space in the host memory space.
>>   *
>>   * If @loaddr == 0, then no address in the executable is fixed,
>>   * i.e. it is fully relocatable.  In that case @hiaddr is the size
>>   * of the executable.
>>   *
>>   * This function will not return if a valid value for guest_base
>>   * cannot be chosen.  On return, the executable loader can expect
>>   *
>>   *    target_mmap(loaddr, hiaddr - loaddr, ...)
>>   *
>>   * to succeed.
>>   */
>>
>> Since here @loaddr == 0, "@hiaddr is the size of the executable",
>> not "the first address past the last byte".
>>
>> So we can not "Pass the address of the last byte of the image"
>> to this API. Maybe the API description is incorrect, in that
>> case your patch is right. Otherwise we might need to tune
>> probe_guest_base().
> 
> I'll update the documentation.

Then:

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>


