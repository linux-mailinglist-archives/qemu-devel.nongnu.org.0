Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 96F2A3BA258
	for <lists+qemu-devel@lfdr.de>; Fri,  2 Jul 2021 16:47:55 +0200 (CEST)
Received: from localhost ([::1]:60654 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lzKSQ-00043k-N0
	for lists+qemu-devel@lfdr.de; Fri, 02 Jul 2021 10:47:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60416)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lzKR8-0002ci-VT
 for qemu-devel@nongnu.org; Fri, 02 Jul 2021 10:46:34 -0400
Received: from mail-pg1-x52b.google.com ([2607:f8b0:4864:20::52b]:46960)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lzKR7-0003T6-A6
 for qemu-devel@nongnu.org; Fri, 02 Jul 2021 10:46:34 -0400
Received: by mail-pg1-x52b.google.com with SMTP id w15so9719684pgk.13
 for <qemu-devel@nongnu.org>; Fri, 02 Jul 2021 07:46:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=zAObTV18AoLkcaNGAwzMoQEDefdhXSbHJUuK6K2lWsk=;
 b=bOhzzaiCPvEGkoseZWohuCuFpCLyzm9YvHRhaUVjShqC0U0QM95BRX2fq5XAoqCdBi
 5cTMYWD9fWLNs0aWbW9ekfYZ0NhUCw6d70FHiZAEmmKC2ayoSD+8nYl45YETLKewWbCF
 noxz9gMgzKdu0loUPqNPGgEqllddCPvmOj4HeLQ3tPLNee+cwRGrkbHwCGqlO4piFQoR
 +7kBUt8u1fd91ZVEgFIt2i5zziXo1qVgARIUCOZ/WA7vvvdTaI6453YcQC1qHHv90Qxo
 m10y9wCoFDRWv82LvqpoF3r6Yfk+eiGAKj6Q5cmEF7jw4/h2UJFm4yTRA/GzU/a2YK6X
 K7PQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=zAObTV18AoLkcaNGAwzMoQEDefdhXSbHJUuK6K2lWsk=;
 b=k57LhqnJQqJxWiJ8B0Pnz0eJAHXaBxraYCDdMY8oXtQRn68Y9ijm/3cOq5LeAtB1Rr
 ZgUGa0Vp4bxE924n5eueTdJUinFbvH1TX1nrybbhwQOo+npf0O6SbSiM0KV93N7j7vv2
 jBN+MvW4FV7cBuMMnjcekhTi654oiIKa5y0kufR4c7oNFutBV4GhH+QMYSB458iMGq8Y
 cOMNQ2r5/siuIe0s+IIJNbxF/00Nj40jdc43a2StHAa1k4ebNyCKguFN2P5zNv6TeZ2c
 tWgfmD+/qQ8/nIE8CJwauMeg2q3Ivub6xiUmt/7EPaWOEwC9FcZq7+pE/1/+z4NkCoqq
 aSvw==
X-Gm-Message-State: AOAM532ix9AVdxfPhQRkA3couad9T+2bCY7FYxCl1UAG8xI5YuMOnY7Y
 x4VqZNvQmovL6otK5J8LoC+MVQ==
X-Google-Smtp-Source: ABdhPJwMql3lwkZZdVy5g2jtvFiAA9YRMBvSYIDoa/giw5xEHiIrs+gnXiiD9C4mqxbLS3xKkGcJWw==
X-Received: by 2002:a63:2446:: with SMTP id k67mr382699pgk.360.1625237191706; 
 Fri, 02 Jul 2021 07:46:31 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.149.176])
 by smtp.gmail.com with ESMTPSA id m14sm4122586pgu.84.2021.07.02.07.46.30
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 02 Jul 2021 07:46:31 -0700 (PDT)
Subject: Re: [PATCH 07/20] target/loongarch: Add fixed point arithmetic
 instruction translation
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 Song Gao <gaosong@loongson.cn>
References: <1624881885-31692-1-git-send-email-gaosong@loongson.cn>
 <1624881885-31692-8-git-send-email-gaosong@loongson.cn>
 <248d54fc-ebdd-09e9-22c2-e66307b22705@amsat.org>
 <fcc6a9cd-2fa9-d976-3326-bda0efedea5f@loongson.cn>
 <2912e517-dba0-04f8-80e2-edc0a9b1a27d@amsat.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <6079cde9-f274-40e2-77ac-3a942455d58a@linaro.org>
Date: Fri, 2 Jul 2021 07:46:29 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <2912e517-dba0-04f8-80e2-edc0a9b1a27d@amsat.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52b;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x52b.google.com
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
Cc: peter.maydell@linaro.org, thuth@redhat.com, qemu-devel@nongnu.org,
 maobibo@loongson.cn, laurent@vivier.eu, alistair.francis@wdc.com,
 pbonzini@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 7/2/21 1:51 AM, Philippe Mathieu-Daudé wrote:
> static bool trans_mul_d(DisasContext *ctx, int rd, int rj, int rk)
> {
>      TCGv t0, t1;
> 
>      check_loongarch_64(ctx);
> 
>      if (a->rd == 0) {
>          /* Treat as NOP. */
>          return true;
>      }
> 
>      t0 = tcg_temp_new();
>      t1 = tcg_temp_new();
> 
>      gen_load_gpr(t0, a->rj);
>      gen_load_gpr(t1, a->rk);

Another improvement over mips is possible, while we're at it:

TCGv get_gpr(int regno)
{
     if (regno == 0) {
         return tcg_constant_tl(0);
     } else {
         return cpu_gpr[regno];
     }
}

     t0 = get_gpr(a->rj);
     t1 = get_gpr(a->rk);

> 
>      tcg_gen_mul_i64(cpu_gpr[a->rd], t0, t1);
> 
>      tcg_temp_free(t0);
>      tcg_temp_free(t1);

and now the frees are not necessary.

You do have to be careful that you consume the input before you write back to 
cpu_gpr[a->rd].  Previously you had a copy, but now t0 and t1 reference the live register. 
  And of course you cannot write to either t0 or t1, because one of them might be the 
constant 0.


r~

