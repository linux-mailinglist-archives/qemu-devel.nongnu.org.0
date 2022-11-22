Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F65C63436B
	for <lists+qemu-devel@lfdr.de>; Tue, 22 Nov 2022 19:14:45 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1oxXma-00063y-4h; Tue, 22 Nov 2022 13:14:08 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1oxXmX-000632-S9
 for qemu-devel@nongnu.org; Tue, 22 Nov 2022 13:14:05 -0500
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1oxXmW-0001nt-9N
 for qemu-devel@nongnu.org; Tue, 22 Nov 2022 13:14:05 -0500
Received: by mail-wm1-x336.google.com with SMTP id
 a11-20020a05600c2d4b00b003cf6f5fd9f1so11930219wmg.2
 for <qemu-devel@nongnu.org>; Tue, 22 Nov 2022 10:14:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=OcX/kBZcgwXP9xuAQ2woLdUZKaH+/uj+uRSETW87QaQ=;
 b=hi0GnnVLlI/TyhQdPz+HgpGvQYk24SHiDSMFLvN2jdPAeu0UoqkbTpfihJy8x0/ySi
 UHRUMmaeAP3gkcOQr66SmkUwxNvUdJax8gK+yIDt68Lfne88xS9HZ2BJxG8QmbPXclPh
 nUYodQwTMhsrXtRe1cOI9D6IGibK+BL1R8fA3v9EkfgQ+mnZ9Ywri2e6jF5ZaL3rsHb9
 rQukxXldr0rC1kzIqDGa0kTuzZMNALJ35QJ56Sq2U+o9tAMqXzps1Ds4Wn7AHwJLminh
 fErryukmd3zrjdyvet01/KAUbelzUN/t+QST8TSGturOo5YdiwUDJheLmDs9bwUJCaaP
 9etw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=OcX/kBZcgwXP9xuAQ2woLdUZKaH+/uj+uRSETW87QaQ=;
 b=cU9HZEr7UOVNynAVcUAT7OJlPTdUdfV7SP2tTWDWxo81UEK4aDbynTgZO0Rqk1ULpx
 +f3C9AGRN+IsQQRkd7UtLz2Cqjk1I+j1A4DNGs3owzjTGqb7JlGlp1AV38mvSM56qZQ7
 3WBuhGLdNkMY2zgsB6opJXayM0w9mZRKsZiw+bXHV9fEROrZiR9FgOwtY3PKRHVrb8q1
 +El7y9cazO806fUO9zs0X9YjpBgnAiqvWIQeazZ7mmKI5n1SfMCl2lycq/g8HK4J3tj7
 6M5+u1eMDyEiP0z8bLtzZzY+iWTG1NlkAp7oantohmaZgd+s4Oo5sE6k3/XDGAf33a3p
 /l+A==
X-Gm-Message-State: ANoB5pnSeooV+5wSiSI75TvAAlDAnsEOF4Fi1s7pr53sFrKL7+q4nXxm
 Wv40J19TlSoEoR5QEaobkmp6ng==
X-Google-Smtp-Source: AA0mqf5ApEV1AC6W4Oi0lhJ/pgtuAsqAH8Fsc/5felXaWlPQSgJf1zfv4kyGdnKR6u9xj0qDFLTHoA==
X-Received: by 2002:a7b:c008:0:b0:3cf:a85d:2ab2 with SMTP id
 c8-20020a7bc008000000b003cfa85d2ab2mr7206402wmb.43.1669140842592; 
 Tue, 22 Nov 2022 10:14:02 -0800 (PST)
Received: from [192.168.1.115] ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 az14-20020a05600c600e00b003cf78aafdd7sm5208846wmb.39.2022.11.22.10.14.01
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 22 Nov 2022 10:14:01 -0800 (PST)
Message-ID: <d831dea2-92de-68d2-8c21-e66fb95011ae@linaro.org>
Date: Tue, 22 Nov 2022 19:14:00 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.5.0
Subject: Re: [PATCH for-8.0 v3 14/45] tcg: Introduce tcg_type_size
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <20221111074101.2069454-1-richard.henderson@linaro.org>
 <20221111074101.2069454-15-richard.henderson@linaro.org>
 <6e038f52-6736-ec37-5f67-bbc41e83a228@linaro.org>
 <ad677647-423e-0ce9-8cc9-68cb0849c320@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <ad677647-423e-0ce9-8cc9-68cb0849c320@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::336;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x336.google.com
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

On 22/11/22 17:54, Richard Henderson wrote:
> On 11/22/22 03:30, Philippe Mathieu-Daudé wrote:
>> On 11/11/22 08:40, Richard Henderson wrote:
>>> Add a helper function for computing the size of a type.
>>>
>>> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
>>> ---
>>>   include/tcg/tcg.h | 16 ++++++++++++++++
>>>   tcg/tcg.c         | 26 ++++++++++++--------------
>>>   2 files changed, 28 insertions(+), 14 deletions(-)
>>>
>>> diff --git a/include/tcg/tcg.h b/include/tcg/tcg.h
>>> index f2da340bb9..8bcd60d0ed 100644
>>> --- a/include/tcg/tcg.h
>>> +++ b/include/tcg/tcg.h
>>> @@ -319,6 +319,22 @@ typedef enum TCGType {
>>>   #endif
>>>   } TCGType;
>>> +/**
>>> + * tcg_type_size
>>> + * @t: type
>>> + *
>>> + * Return the size of the type in bytes.
>>> + */
>>> +static inline int tcg_type_size(TCGType t)
>>> +{
>>> +    unsigned i = t;
>>> +    if (i >= TCG_TYPE_V64) {
>>> +        tcg_debug_assert(i < TCG_TYPE_COUNT);
>>> +        i -= TCG_TYPE_V64 - 1;
>>> +    }
>>> +    return 4 << i;
>>
>> I'd feel safer if we assign TCG_TYPE_I32 .. TCG_TYPE_V256 in TCGType,
>> just in case.
> 
> What do you mean?

-- >8 --
diff --git a/include/tcg/tcg.h b/include/tcg/tcg.h
@@ -289,8 +289,8 @@ typedef struct TCGPool {
  typedef enum TCGType {
-    TCG_TYPE_I32,
-    TCG_TYPE_I64,
+    TCG_TYPE_I32  = 0,
+    TCG_TYPE_I64  = 1,

-    TCG_TYPE_V64,
-    TCG_TYPE_V128,
-    TCG_TYPE_V256,
+    TCG_TYPE_V64  = 2,
+    TCG_TYPE_V128 = 3,
+    TCG_TYPE_V256 = 4,

---

