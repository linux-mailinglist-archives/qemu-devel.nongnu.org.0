Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A86816FC9A1
	for <lists+qemu-devel@lfdr.de>; Tue,  9 May 2023 16:54:52 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pwOja-0005cw-MR; Tue, 09 May 2023 10:54:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pwOjY-0005cj-TG
 for qemu-devel@nongnu.org; Tue, 09 May 2023 10:54:32 -0400
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pwOjU-00038j-HZ
 for qemu-devel@nongnu.org; Tue, 09 May 2023 10:54:31 -0400
Received: by mail-wr1-x42b.google.com with SMTP id
 ffacd0b85a97d-30639daee76so3889632f8f.1
 for <qemu-devel@nongnu.org>; Tue, 09 May 2023 07:54:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1683644066; x=1686236066;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=l01PzqK6Yg+ex5qQvjE2vUEBY3ZMERozalix5kHaMls=;
 b=uLLcSgVFUwJBLwiogDfvruRd7Lq+16ltiND/jG3d1IJt49zhvSdaoyCMkbi5Ucg6xb
 Yk+V5hsoVrTQQYXrqTHif2FN+Ci4JxNVk5Q6RWq7jJYn9gpEMzOZ3fD9fxHG+5HP5om3
 dxwBvMvFyIOpciToaICCVl73CGbWIZWiqywdwK+li6QmCa9msj5BnGBgpMZZjuqQLct0
 OEwvzMEyqJT3P4pVJ4W9cz1BX4Z21ofaYTCorZ1A6udCsGO1A7fRI3FQKWpL/A006vQ0
 XM5xXyYkFWDQURaqPWiuFbAeFnJmzUm+vQ33EF8o9j9p7V7ZobgmWctXduRxzc4XSsGU
 H0Mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683644066; x=1686236066;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=l01PzqK6Yg+ex5qQvjE2vUEBY3ZMERozalix5kHaMls=;
 b=I6YiC9qlDpOhFdT2Tke3boPaeJhknaCvnY4o1+/iAFduP9bnqz3JIFmn5NbsVuIWHC
 SjfR0JimbE2cM/1KlUJ+o2W5nv+Jb5+gn1F5df2gDtJiwriVD3/A1ZhKgoH+g59mbzPT
 TJjIrwULWe7FEEo7DEAwxHfJRWT6pTn38Tl7HMJDWOyXMYj+EsKF4vr54k8jmDV1C8vs
 lTsRnlmaXoyN7n66U7pxqAAUhL/LeXVoHQGM+N2kArC31DpZeQaULa/idZ8Qwjz9wBNY
 Mzxh4QHJaOUe3NhEAN4X3PBOW0928JdzBx5iLoXxe+LLBt+M8dUMozPE2kT6onsF62fC
 mttA==
X-Gm-Message-State: AC+VfDxtnZs0CX5fxC1I+tv7ppX/fVoMQvk0QFPESqnNcy1ouwX90/MF
 qLyKqMmc0+3/NioON71UcTA4yaHWzvLnN7QVNEOfVQ==
X-Google-Smtp-Source: ACHHUZ7JXbZ5/+of0rjrSB4XEfxxVxYAEgz8UCQMuSuJb7MOq+AyhHya2NfzXWKZINbtF0I6kBkaTw==
X-Received: by 2002:adf:dbc8:0:b0:307:8b3e:2858 with SMTP id
 e8-20020adfdbc8000000b003078b3e2858mr7107895wrj.45.1683644066323; 
 Tue, 09 May 2023 07:54:26 -0700 (PDT)
Received: from [192.168.11.23] ([85.9.250.243])
 by smtp.gmail.com with ESMTPSA id
 z22-20020a7bc7d6000000b003f42813b315sm4726785wmk.32.2023.05.09.07.54.25
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 09 May 2023 07:54:25 -0700 (PDT)
Message-ID: <441121dd-9a8a-38b3-ac88-f040aab1b385@linaro.org>
Date: Tue, 9 May 2023 15:54:24 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH] target/m68k: Fix gen_load_fp for OS_LONG
Content-Language: en-US
To: Laurent Vivier <laurent@vivier.eu>, qemu-devel@nongnu.org
References: <20230508140857.137405-1-richard.henderson@linaro.org>
 <2586a5d3-d944-59e9-07c6-0e638f5a679f@vivier.eu>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <2586a5d3-d944-59e9-07c6-0e638f5a679f@vivier.eu>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42b;
 envelope-from=richard.henderson@linaro.org; helo=mail-wr1-x42b.google.com
X-Spam_score_int: -24
X-Spam_score: -2.5
X-Spam_bar: --
X-Spam_report: (-2.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.421,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

On 5/8/23 17:06, Laurent Vivier wrote:
> Le 08/05/2023 à 16:08, Richard Henderson a écrit :
>> Case was accidentally dropped in b7a94da9550b.
>>
>> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
>> ---
>>   target/m68k/translate.c | 1 +
>>   1 file changed, 1 insertion(+)
>>
>> diff --git a/target/m68k/translate.c b/target/m68k/translate.c
>> index 744eb3748b..44d852b106 100644
>> --- a/target/m68k/translate.c
>> +++ b/target/m68k/translate.c
>> @@ -959,6 +959,7 @@ static void gen_load_fp(DisasContext *s, int opsize, TCGv addr, 
>> TCGv_ptr fp,
>>       switch (opsize) {
>>       case OS_BYTE:
>>       case OS_WORD:
>> +    case OS_LONG:
>>           tcg_gen_qemu_ld_tl(tmp, addr, index, opsize | MO_SIGN | MO_TE);
>>           gen_helper_exts32(cpu_env, fp, tmp);
>>           break;
> 
> Tested-by: Laurent Vivier <laurent@vivier.eu>
> Reviewed-by: Laurent Vivier <laurent@vivier.eu>

Queued to tcg-next.


r~

