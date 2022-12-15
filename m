Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E79964DE24
	for <lists+qemu-devel@lfdr.de>; Thu, 15 Dec 2022 16:59:34 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p5qd5-0003Eq-68; Thu, 15 Dec 2022 10:58:39 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1p5qd2-0003Db-VT
 for qemu-devel@nongnu.org; Thu, 15 Dec 2022 10:58:37 -0500
Received: from mail-pl1-x62e.google.com ([2607:f8b0:4864:20::62e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1p5qd1-0004zw-FZ
 for qemu-devel@nongnu.org; Thu, 15 Dec 2022 10:58:36 -0500
Received: by mail-pl1-x62e.google.com with SMTP id g10so7281565plo.11
 for <qemu-devel@nongnu.org>; Thu, 15 Dec 2022 07:58:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=/ews8yuOuPumLN5qv4CO260Xz9uE4h+3xaCa7VaIXxY=;
 b=tAism9RAX7MX9fVlkFLN/PIezrV1jNt0ngU/sXIV2VzeFGH9VbU9yJBDxF0J5ICrf8
 cUMx1Jqeyx70aj4ByjfV5/ci9a5bF3H7c4CMZtEadfZ28NsSSfMqT2MR8BjEQew+nWSQ
 3wg4qM+BTx2rr/LqTtZAoWuM2Buzuk2CgafdrYX6yVkBhaJRRef44wR25LEUoj0ep31h
 Yanq5rIMtwbLJuD1+H4u1Ozphm3S+gqFk/VO2EEmobeZ685TMEVqwr0uXCnpcsS9XvS4
 LF2tZULtM6MhGmGqjC7TWglVoHX6uMNtz2jXNHy/5IPtmjPFepdemhp3OcBK2/i9FC8n
 F9sQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=/ews8yuOuPumLN5qv4CO260Xz9uE4h+3xaCa7VaIXxY=;
 b=DDUkOtBhPYuZ2RLh2r/Rxg/7qxBHvOJwuOuYq30q6abHdVkMEOOhrm7UOoZUt8MjWt
 B2Xq18hyrlmNw/JFVVjHi99+u/NgAhJ45BhpvPFbMd1DoFqAiCA8kMDlrLPWaHUcTzPL
 RmbKwv42CA/FfYLlphIkFI3jPnQOyfZsUMDEH25byv1fOW6s8Kp0HOE9QfD79s8KWeha
 r+Ul8mTolHrRykHE6KFuo7pYWlAkGvNYNpF0MEeWKuB9cn2IpcpWtnY7/19k7U9DyUjc
 LaHWJa9ULvMBURUfa+KAGz01oZKcqs8Fusvh8Pj7163gnTlu1YqlSmLd7FKgvXG8eiBl
 cRcw==
X-Gm-Message-State: ANoB5pluNyklegFH5k3Ik5CBdbeJlMHkvy6Dwh3qtHanEFp7ExSdDcZV
 i8yRk0wx7zE/oZv4VVg71hC0jA==
X-Google-Smtp-Source: AA0mqf5/JT1a3e+lCjKzf7hMEopjCmQfUy1rcvY6bzoWmdb/AZYSRK2uvXrj7ftlx5WYEePqcGWesA==
X-Received: by 2002:a17:902:aa97:b0:186:cbf0:24c7 with SMTP id
 d23-20020a170902aa9700b00186cbf024c7mr27527933plr.12.1671119912270; 
 Thu, 15 Dec 2022 07:58:32 -0800 (PST)
Received: from ?IPV6:2602:47:d48c:8101:a80f:54a1:edc3:6cb4?
 ([2602:47:d48c:8101:a80f:54a1:edc3:6cb4])
 by smtp.gmail.com with ESMTPSA id
 q10-20020a170902daca00b00190c6518e30sm3988638plx.243.2022.12.15.07.58.31
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 15 Dec 2022 07:58:31 -0800 (PST)
Message-ID: <b2432b6a-ceef-647d-3e0f-ff7a7bdc0beb@linaro.org>
Date: Thu, 15 Dec 2022 07:58:29 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH] linux-user: Add translation for argument of msync()
Content-Language: en-US
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 Helge Deller <deller@gmx.de>, Laurent Vivier <laurent@vivier.eu>,
 qemu-devel@nongnu.org, Ilya Leoshkevich <iii@linux.ibm.com>
References: <Y5rMcts4qe15RaVN@p100>
 <165fbdfe-8e72-0ab7-727e-0f54df9957b3@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <165fbdfe-8e72-0ab7-727e-0f54df9957b3@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62e;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62e.google.com
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

On 12/14/22 23:58, Philippe Mathieu-Daudé wrote:
>> --- a/linux-user/alpha/target_mman.h
>> +++ b/linux-user/alpha/target_mman.h
>> @@ -3,6 +3,10 @@
>>
>>   #define TARGET_MADV_DONTNEED 6
>>
>> +#define TARGET_MS_ASYNC 1
>> +#define TARGET_MS_SYNC 2
>> +#define TARGET_MS_INVALIDATE 4
>> +
>>   #include "../generic/target_mman.h"
>>
>>   #endif
>> diff --git a/linux-user/generic/target_mman.h b/linux-user/generic/target_mman.h
>> index 1436a3c543..32bf1a52d0 100644
>> --- a/linux-user/generic/target_mman.h
>> +++ b/linux-user/generic/target_mman.h
>> @@ -89,4 +89,17 @@
>>   #define TARGET_MADV_DONTNEED_LOCKED 24
>>   #endif
>>
>> +
>> +#ifndef TARGET_MS_ASYNC
>> +#define TARGET_MS_ASYNC 1
> 
> Hmm don't we want to keep the host flag instead?
> 
>     #define TARGET_MS_ASYNC MS_ASYNC

No.  What if the host has an odd value, like Alpha.


r~

