Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B2CD03819CF
	for <lists+qemu-devel@lfdr.de>; Sat, 15 May 2021 18:26:49 +0200 (CEST)
Received: from localhost ([::1]:43712 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lhx7o-0000tu-7g
	for lists+qemu-devel@lfdr.de; Sat, 15 May 2021 12:26:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37024)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lhx6l-0008NF-QF
 for qemu-devel@nongnu.org; Sat, 15 May 2021 12:25:43 -0400
Received: from mail-qk1-x72f.google.com ([2607:f8b0:4864:20::72f]:40942)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lhx6k-0006jv-2I
 for qemu-devel@nongnu.org; Sat, 15 May 2021 12:25:43 -0400
Received: by mail-qk1-x72f.google.com with SMTP id f18so1930760qko.7
 for <qemu-devel@nongnu.org>; Sat, 15 May 2021 09:25:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=5YnQ3YIifzuU0VS0Vo8dZJ9XTMwwcIAepO0Y/B4psgo=;
 b=uLpV4m8QOTAv/aI74U5j7NPNXo4NKMV2KQp8F0sIokmxM7xscb9BynAvo3lD3yIziy
 xiOlOKZw61AlH/g6blQ12RMg+vUr3glCG4VhJxKT2hmMMXs49jqFn7z+cEkUVO6kvnJa
 JxdZ7/qX04MNr6TkpkRGbpvngM0+ipC2DTG08QMkFIdvRYBWFurO8WB7qENenAVANd6s
 WDm1vWlBtH8F0nm5QG4Tp3z5NVyyWyStJbbSGwrFW8bTApdLg8kwtlXQJzzg7NTxi/SI
 F9AGyI+tUzWidI9EBIdAfhIz7ctrYnvw1Wc6miTtXZs4/V3V2PPAdIVyGx/D60tbfYZ/
 albw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=5YnQ3YIifzuU0VS0Vo8dZJ9XTMwwcIAepO0Y/B4psgo=;
 b=DUvFgkOQgbK/G+W4eAWq98XB76HjkhExFWNeSecCzACTDAPSMFfTUYbQ7d9LfNWgZ+
 5pBpM48+TBxUj0FDalHDvWz1UDE5c60i0MCEQlH+YVgPwE7mL54mevWr/sQbOc+4M3X/
 2caSV1AIuupyaZ6A9RBeyLjX/CLo3JE6INH5TE35gDbWItiJNnxGNhTDGx2CJHBpn/tM
 pkR+1JyOWHN3ksnNkC+Zr2b+0uAPkFjSU0cShdJfN/OIa/76Y4crJAZn4lxiTFPoTlWZ
 ZwY+UmCK9R0AkV608XN/vPRkK1yD7KORX8BiBclVpz1Udqm1HaO2z4+h+zNvotV+IHGB
 MpUg==
X-Gm-Message-State: AOAM5330/PIt5sgJUaoNccaJyXyaUe8NR7JIWTK9qF7U+z03rGPgaVCF
 hBCHk6t9RNohgk0sulVHrDzsEQ==
X-Google-Smtp-Source: ABdhPJwX1zOFJyeK3FYUAH+98tZCFCHMv089ItLB/3fPXPGUXabFKUpRLp5lMbO2K0XWQeKoSpWWXA==
X-Received: by 2002:a37:a8c6:: with SMTP id
 r189mr48996251qke.446.1621095940973; 
 Sat, 15 May 2021 09:25:40 -0700 (PDT)
Received: from [192.168.183.51] (163.189-204-200.bestelclientes.com.mx.
 [189.204.200.163])
 by smtp.gmail.com with ESMTPSA id p190sm7286613qke.13.2021.05.15.09.25.40
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 15 May 2021 09:25:40 -0700 (PDT)
Subject: Re: [PATCH v6 69/82] target/arm: Share table of sve load functions
To: Peter Maydell <peter.maydell@linaro.org>
References: <20210430202610.1136687-1-richard.henderson@linaro.org>
 <20210430202610.1136687-70-richard.henderson@linaro.org>
 <CAFEAcA87ZLW1oxFuhY_-uHjvO37Wkd3gUCJqPTttOm8VYqaAHQ@mail.gmail.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <050cb717-1277-0edb-0f49-29a4f488d8c7@linaro.org>
Date: Sat, 15 May 2021 11:25:38 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <CAFEAcA87ZLW1oxFuhY_-uHjvO37Wkd3gUCJqPTttOm8VYqaAHQ@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::72f;
 envelope-from=richard.henderson@linaro.org; helo=mail-qk1-x72f.google.com
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
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 5/13/21 9:25 AM, Peter Maydell wrote:
>> @@ -5551,7 +5547,9 @@ static void do_ldrq(DisasContext *s, int zt, int pg, TCGv_i64 addr, int msz)
>>       t_pg = tcg_temp_new_ptr();
>>       tcg_gen_addi_ptr(t_pg, cpu_env, poff);
>>
>> -    fns[s->be_data == MO_BE][msz](cpu_env, t_pg, addr, t_desc);
>> +    gen_helper_gvec_mem *fn
>> +        = ldr_fns[s->mte_active[0]][s->be_data == MO_BE][dtype][0];
>> +    fn(cpu_env, t_pg, addr, t_desc);
> 
> Previously we didn't take account of MTE state, and now we do.
> Is this an intentional behaviour change?

Amusing that I didn't even notice.

> If it's fixing a bug, the commit message should say so.

Yes, this is fixing a bug in LDRQ.


r~

