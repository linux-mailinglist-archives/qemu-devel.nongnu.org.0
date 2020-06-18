Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BE20D1FFBB0
	for <lists+qemu-devel@lfdr.de>; Thu, 18 Jun 2020 21:20:59 +0200 (CEST)
Received: from localhost ([::1]:36572 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jm05q-0001BI-Qo
	for lists+qemu-devel@lfdr.de; Thu, 18 Jun 2020 15:20:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39450)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1jm04y-0000bq-Jn
 for qemu-devel@nongnu.org; Thu, 18 Jun 2020 15:20:04 -0400
Received: from mail-pl1-x643.google.com ([2607:f8b0:4864:20::643]:44346)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1jm04w-0000sQ-2s
 for qemu-devel@nongnu.org; Thu, 18 Jun 2020 15:20:04 -0400
Received: by mail-pl1-x643.google.com with SMTP id bh7so2839112plb.11
 for <qemu-devel@nongnu.org>; Thu, 18 Jun 2020 12:20:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=zTEpJStbwpec8+oM3y3EvE/o3v/vYYV2Kl76GPb4ZZ4=;
 b=LGbKy+eFx3IeATyVhS/8yOZKfbNAFHpdjefWOpQibbQmeDO8j+tpRTDCSxekqT6aPh
 TeIz31pE2gmn1EXKG6/yl/ts6P+BPoaVOd2Qw5XeGNXg+ElifByq5P3G7W4xF3MiOly4
 KmOX1GPHNAv8y6+CFWR2gD0twuiy8FK+TA8hSkG3QNm4tX2F6gYVRN6ciE4lXMT4FDgV
 gGTxR2LOcPyPn2KpM+AbXFJJuE03YLKPv0wLNMBns4hw7uJ9cB58HrTnbITk6X5pDIkD
 Duv1ZXc1RmAdH+h151clogxzb9seS4/MsFsluh0/lYOTGoZ9cICXE78iku3GCCI3V4hS
 Po1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=zTEpJStbwpec8+oM3y3EvE/o3v/vYYV2Kl76GPb4ZZ4=;
 b=Q2N6HL/JOfrLJcWr89PZ5zAvbg06pNBKCNSUCdF2OM3gyvejtJk2NbHxiZL1A6Es/j
 ZGRch6olEuRbW92CHuS+1QUaqq3/ONaAc9jJPnUXj65ZN+8FzqCQO/cLFshMeVVkqO3z
 CZUM04Cby6jT8JFrSsf7bMovM08emDSeGa+Nl3hyKCtEhrzQoXzaKXtfL0DQhGtzgvbD
 jn5r6/vZqZL1bYn02KB+9N11TtVtLi+ypp17f1qX2PJbP+3d8v1mpyOlm3bt3LIU03jK
 pOuKZx5rQsOxbFW6/jOjgc4AQjnOZjnLHIYHL8Tg+qgkNuELoRSHbBN7whf3W0Y3sD4Q
 KeYw==
X-Gm-Message-State: AOAM531Rw9QevxF+IkEBIvJSk6UZZrzB2ONR3BAwn9ytFrfCdcQHgqfk
 +fI59bUmXz3qZ9cGi2MjYNekCw==
X-Google-Smtp-Source: ABdhPJwinLUereq+WnMDXKoQT8n7ZYBMUeprAqRAo09qdLhd4TNXALQ0Gx/vGhejI7v6F5lt3y/MkQ==
X-Received: by 2002:a17:90a:d3c2:: with SMTP id
 d2mr5404142pjw.202.1592508000427; 
 Thu, 18 Jun 2020 12:20:00 -0700 (PDT)
Received: from [192.168.1.11] (174-21-143-238.tukw.qwest.net. [174.21.143.238])
 by smtp.gmail.com with ESMTPSA id k14sm3207368pgn.94.2020.06.18.12.19.59
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 18 Jun 2020 12:19:59 -0700 (PDT)
Subject: Re: [PATCH v7 14/42] target/arm: Add helper_probe_access
To: Peter Maydell <peter.maydell@linaro.org>
References: <20200603011317.473934-1-richard.henderson@linaro.org>
 <20200603011317.473934-15-richard.henderson@linaro.org>
 <CAFEAcA9EJB8Oa5c7emh-cKMmZRUPa8rRvvvXsHUJWO51gUaDvA@mail.gmail.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <998a01bf-fb40-f075-fc08-747669c52b70@linaro.org>
Date: Thu, 18 Jun 2020 12:19:57 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <CAFEAcA9EJB8Oa5c7emh-cKMmZRUPa8rRvvvXsHUJWO51gUaDvA@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::643;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x643.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=_AUTOLEARN
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
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>,
 Stephen Long <steplong@quicinc.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 6/18/20 6:33 AM, Peter Maydell wrote:
> On Wed, 3 Jun 2020 at 02:13, Richard Henderson
> <richard.henderson@linaro.org> wrote:
>>
>> Raise an exception if the given virtual memory is not accessible.
>>
>> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
>> ---
> 
>> diff --git a/target/arm/translate-a64.c b/target/arm/translate-a64.c
>> index 0ee2ef403e..b032829194 100644
>> --- a/target/arm/translate-a64.c
>> +++ b/target/arm/translate-a64.c
>> @@ -232,6 +232,19 @@ static void gen_address_with_allocation_tag0(TCGv_i64 dst, TCGv_i64 src)
>>      tcg_gen_andi_i64(dst, src, ~MAKE_64BIT_MASK(56, 4));
>>  }
>>
>> +static void gen_probe_access(DisasContext *s, TCGv_i64 ptr,
>> +                             MMUAccessType acc, int log2_size)
>> +{
>> +    TCGv_i32 t_acc = tcg_const_i32(acc);
>> +    TCGv_i32 t_idx = tcg_const_i32(get_mem_index(s));
>> +    TCGv_i32 t_size = tcg_const_i32(1 << log2_size);
>> +
>> +    gen_helper_probe_access(cpu_env, ptr, t_acc, t_idx, t_size);
>> +    tcg_temp_free_i32(t_acc);
>> +    tcg_temp_free_i32(t_idx);
>> +    tcg_temp_free_i32(t_size);
>> +}
> 
> This isn't called from anywhere -- clang is probably going to
> complain about that.

Ah, yes.  I thought it would be helpful to split this patch, but I guess not.
I'll merge with the next patch where it's used.

r~

