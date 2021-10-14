Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 164AB42DEF7
	for <lists+qemu-devel@lfdr.de>; Thu, 14 Oct 2021 18:14:16 +0200 (CEST)
Received: from localhost ([::1]:53166 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mb3N1-0003Rq-6V
	for lists+qemu-devel@lfdr.de; Thu, 14 Oct 2021 12:14:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58216)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mb3La-0001RG-7s
 for qemu-devel@nongnu.org; Thu, 14 Oct 2021 12:12:46 -0400
Received: from mail-pl1-x630.google.com ([2607:f8b0:4864:20::630]:40681)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mb3LX-00026d-Jv
 for qemu-devel@nongnu.org; Thu, 14 Oct 2021 12:12:45 -0400
Received: by mail-pl1-x630.google.com with SMTP id v20so4496121plo.7
 for <qemu-devel@nongnu.org>; Thu, 14 Oct 2021 09:12:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=p3Dj4DjSOZU1SnjcfNpMQSf0C1HjyE25l+QOHio3gdA=;
 b=Dq639fgR82rp7lN1Eq0d/GghXOf5s6zmDiSBCemQi5L5zmsgPlmTTco0HD5PSREjPx
 mNQdVtDb8h9EfNaAhImYarzeq1BLVu7hE3uLhA+e7Q+32sb3mBlQaTuhQLqOPIqGstr5
 w/rKaKalwb24I4DYxyVy3KUBZNexmVrmeWks/zkc2WveVHar6ulM9N2p4k9av+uINdn8
 8chSGTSTsyr+28yXjJ6jE3UtnjoxnRlsw2RQ/4985D3PjUznt6x3VVwpEEe9TUrJrhqH
 KPI5tWYNKZSTLXWGDoGcKlH0SspHLJaKhAEwRt+h7ByM+CN1hntB5fGfi+tDsORQHLxC
 jYkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=p3Dj4DjSOZU1SnjcfNpMQSf0C1HjyE25l+QOHio3gdA=;
 b=bx1Yu7hpYEOrWA4nGoQR5FhjfONw6kzC4QbjniKww286HOK13wWOhzVDIgBW+Gq3QH
 IeK0VOp1F/1LQJdtAB+hPaWvfyhPxX5CNPVnLUl6j2If61sp2yyts9YB6yOSqYiCqBFo
 q4zvb4tE289GbytmgmNpfMfIst6c4p5jU26LB642zyiIUkEnD0477/O/FB0fDYHWU1N4
 9IoU52cs1tY0WXCpTHox0VFQUDa+JIJ8uV77yfEUDPFtz1HogG9G+aYzOiPl3Fa+JlnJ
 /y+OY2phiDizlzabQSxQ0aWUE1hEv23n8xPhsg+mJykEQZDtiKyqe3pivVdfJ229B58c
 fj2w==
X-Gm-Message-State: AOAM530t4alhRL1PS86jzOffA7seTAzllREereGqlpxsmaCPdToGFimO
 dtWCtjmYqCe7b2/FH07fxsiinA==
X-Google-Smtp-Source: ABdhPJxb9y+q4ZbzkxF0IsaKaP9nG/T7S3pwlbntMDIdg7BeVmRgRigV+eMIdOeVlsJ/esSLf4qU7g==
X-Received: by 2002:a17:902:9887:b0:13f:7704:425f with SMTP id
 s7-20020a170902988700b0013f7704425fmr5895466plp.20.1634227961925; 
 Thu, 14 Oct 2021 09:12:41 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.134.125])
 by smtp.gmail.com with ESMTPSA id u66sm3080474pfc.114.2021.10.14.09.12.41
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 14 Oct 2021 09:12:41 -0700 (PDT)
Subject: Re: [PATCH v2 05/13] target/riscv: Add MXL/SXL/UXL to TB_FLAGS
To: LIU Zhiwei <zhiwei_liu@c-sky.com>, qemu-devel@nongnu.org
References: <20211013205104.1031679-1-richard.henderson@linaro.org>
 <20211013205104.1031679-6-richard.henderson@linaro.org>
 <33bfbaa0-45d4-2f58-36dc-9ff7a117489b@c-sky.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <b21879ab-8541-a703-e6f5-b5550adb2e4a@linaro.org>
Date: Thu, 14 Oct 2021 09:12:39 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <33bfbaa0-45d4-2f58-36dc-9ff7a117489b@c-sky.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::630;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x630.google.com
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
Cc: alistair.francis@wdc.com, frederic.petrot@univ-grenoble-alpes.fr,
 qemu-riscv@nongnu.org, fabien.portas@grenoble-inp.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 10/14/21 1:20 AM, LIU Zhiwei wrote:
> 
> On 2021/10/14 上午4:50, Richard Henderson wrote:
>> Begin adding support for switching XLEN at runtime.  Extract the
>> effective XLEN from MISA and MSTATUS and store for use during translation.
>>
>> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
>> ---
>> v2: Force SXL and UXL to valid values.
>> ---
>>   target/riscv/cpu.h        |  2 ++
>>   target/riscv/cpu.c        |  8 ++++++++
>>   target/riscv/cpu_helper.c | 33 +++++++++++++++++++++++++++++++++
>>   target/riscv/csr.c        |  3 +++
>>   target/riscv/translate.c  |  2 +-
>>   5 files changed, 47 insertions(+), 1 deletion(-)
>>
>> diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
>> index 87248b562a..445ba5b395 100644
>> --- a/target/riscv/cpu.h
>> +++ b/target/riscv/cpu.h
>> @@ -395,6 +395,8 @@ FIELD(TB_FLAGS, VILL, 8, 1)
>>   /* Is a Hypervisor instruction load/store allowed? */
>>   FIELD(TB_FLAGS, HLSX, 9, 1)
>>   FIELD(TB_FLAGS, MSTATUS_HS_FS, 10, 2)
>> +/* The combination of MXL/SXL/UXL that applies to the current cpu mode. */
>> +FIELD(TB_FLAGS, XL, 12, 2)
>>   #ifdef CONFIG_RISCV32
>>   #define riscv_cpu_mxl(env)      MXL_RV32
>> diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
>> index 1857670a69..840edd66f8 100644
>> --- a/target/riscv/cpu.c
>> +++ b/target/riscv/cpu.c
>> @@ -355,6 +355,14 @@ static void riscv_cpu_reset(DeviceState *dev)
>>       env->misa_mxl = env->misa_mxl_max;
>>       env->priv = PRV_M;
>>       env->mstatus &= ~(MSTATUS_MIE | MSTATUS_MPRV);
>> +    if (env->misa_mxl > MXL_RV32) {
>> +        /*
>> +         * The reset status of SXL/UXL is officially undefined,
>> +         * but invalid settings would result in a tcg assert.
>> +         */
>> +        env->mstatus = set_field(env->mstatus, MSTATUS64_SXL, env->misa_mxl);
>> +        env->mstatus = set_field(env->mstatus, MSTATUS64_UXL, env->misa_mxl);
>> +    }
> 
> Can you give more explanation about the assert? As the cpu will always reset to M mode, I 
> think we can omit the the setting of UXL or SXL.

The mstatus csr is WARL, which means that we should always be able to read a valid value. 
  On init, these fields will still be 0, which isn't right.

I guess the assert that I was considering can't really happen, because we'd need to write 
to mstatus to exit M-mode, and write_mstatus will force these fields to the correct value 
(as found by Frederic).

r~

