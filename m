Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DB0C6F210B
	for <lists+qemu-devel@lfdr.de>; Sat, 29 Apr 2023 00:50:10 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1psWuH-0005cT-08; Fri, 28 Apr 2023 18:49:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1psWuF-0005c5-7f
 for qemu-devel@nongnu.org; Fri, 28 Apr 2023 18:49:35 -0400
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1psWuD-0000gd-JZ
 for qemu-devel@nongnu.org; Fri, 28 Apr 2023 18:49:34 -0400
Received: by mail-wr1-x429.google.com with SMTP id
 ffacd0b85a97d-2f86ee42669so255720f8f.2
 for <qemu-devel@nongnu.org>; Fri, 28 Apr 2023 15:49:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1682722172; x=1685314172;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=5y4hiFQT4Z+EpiHpgNeUbiNxFTBOY+nRx4Ksy7QSVIg=;
 b=F5eD8FIrkxA24Ea9Sk4iZBvd6r5QkIndUNARbTVmQBa/l0aG7eanY20R1JsXkVTvGl
 KhVnmUBGkIqVDaxclo5s09nwCLA04S4NzxGobDiVCYnECFv4moQC2tPwz3Rz8rUxu3lS
 RsKRVvjDej2xkw5Kk5N6VO3soVltVo0weyfVpWbuwTEJ39/3Df0iMrXrqn+jcG4MndOj
 MqbwceBDjaC8d9/Z+xWBAmgjLgNxY5860+oDTBCKqmu9bfTUhUtUcddYZkkQ8Cwjil2y
 5hyE7egc4aWBLyQXHS1Ccf3W5MQUlYDJm3+eMzWY0fHWs3cxOzb4VTOaXUqd70sR3MtC
 q6Kg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682722172; x=1685314172;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=5y4hiFQT4Z+EpiHpgNeUbiNxFTBOY+nRx4Ksy7QSVIg=;
 b=WVkjMXoXXpG9AxE4kSdLGgyM2nCawLrXzBMYy5yXW4DVICZhm18zXblr9DHo/yH7mU
 gDeynFtrctrZR1vB4kSC8Bz+EfkKkFLWDW9kuLQ4TtsNR50GyPrQhaWwTp2N8CX3WYY/
 AhpA/WtPlVw8yClOr+KYzxYjcFN05pZ3p1fXFy05KHpB94bB+3ZF98kmWNTJ72qqw5BV
 HFAYSx1AU5Kt41E8kFrlFtmaC5zOfTiTBDU+LgBcfDlzeztpih9Zc++ca/MHY674juL9
 X6MR7nmf7AnSeogoZ/w6ywF4R39h7xcHUKGDIKjX9l+CiNwRB9H2c25ITydlHoonlwyy
 DTPQ==
X-Gm-Message-State: AC+VfDwuzFRarqLJwW1PHnI9e8jDo7e45L2cjauPa6ZMFt1jvZ0HRpPD
 YVbm0k9Qsksmn3/BSlH6vqutYQ==
X-Google-Smtp-Source: ACHHUZ4SvITuM7R7y9sMdyQaNep38ZA2podES4R/x9LpqPOXNhmJVjcUnvKC2vaCHwnu64zglfkBHg==
X-Received: by 2002:a5d:4d10:0:b0:2ce:a6be:2bd with SMTP id
 z16-20020a5d4d10000000b002cea6be02bdmr4369780wrt.1.1682722172023; 
 Fri, 28 Apr 2023 15:49:32 -0700 (PDT)
Received: from [192.168.192.175] (47.red-88-28-19.dynamicip.rima-tde.net.
 [88.28.19.47]) by smtp.gmail.com with ESMTPSA id
 r6-20020a05600c458600b003f195d540d9sm21392718wmo.14.2023.04.28.15.49.30
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 28 Apr 2023 15:49:31 -0700 (PDT)
Message-ID: <4d59b4d1-7a36-1fc6-801d-b6348b186739@linaro.org>
Date: Fri, 28 Apr 2023 23:49:28 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.10.0
Subject: Re: [PATCH] softmmu: Tidy dirtylimit_dirty_ring_full_time
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: thuth@redhat.com
References: <20230428103448.3811208-1-richard.henderson@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230428103448.3811208-1-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::429;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x429.google.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.422,
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

On 28/4/23 12:34, Richard Henderson wrote:
> Drop inline marker: let compiler decide.
> 
> Change return type to uint64_t: this matches the computation in the
> return statement and the local variable assignment in the caller.
> 
> Rename local to dirty_ring_size_MB to fix typo.
> Simplify conversion to MiB via qemu_target_page_bits and right shift.
> 
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   softmmu/dirtylimit.c | 15 ++++++++++-----
>   1 file changed, 10 insertions(+), 5 deletions(-)


> -static inline int64_t dirtylimit_dirty_ring_full_time(uint64_t dirtyrate)
> +static uint64_t dirtylimit_dirty_ring_full_time(uint64_t dirtyrate)
>   {
>       static uint64_t max_dirtyrate;
> -    uint32_t dirty_ring_size = kvm_dirty_ring_size();
> -    uint64_t dirty_ring_size_meory_MB =
> -        dirty_ring_size * qemu_target_page_size() >> 20;
> +    unsigned target_page_bits = qemu_target_page_bits();
> +    uint64_t dirty_ring_size_MB;
> +
> +    /* So far, the largest (non-huge) page size is 64k, i.e. 16 bits. */
> +    assert(target_page_bits < 20);
> +
> +    /* Convert ring size (pages) to MiB (2**20). */
> +    dirty_ring_size_MB = kvm_dirty_ring_size() >> (20 - target_page_bits);
>   
>       if (max_dirtyrate < dirtyrate) {
>           max_dirtyrate = dirtyrate;
>       }
>   
> -    return dirty_ring_size_meory_MB * 1000000 / max_dirtyrate;
> +    return dirty_ring_size_MB * 1000000 / max_dirtyrate;

I wondered what was this 1000000 magic number. IIUC this is
converted to microseconds. We don't have such definition.
We could use (NANOSECONDS_PER_SECOND / 1000).
Somehow simpler is to rename dirtylimit_dirty_ring_full_time()
-> dirtylimit_dirty_ring_full_time_us(). Anyway,

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>

>   }
>   
>   static inline bool dirtylimit_done(uint64_t quota,


