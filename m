Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id ADC5D2E7CEC
	for <lists+qemu-devel@lfdr.de>; Wed, 30 Dec 2020 23:12:28 +0100 (CET)
Received: from localhost ([::1]:35502 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kujhj-0004GD-9Z
	for lists+qemu-devel@lfdr.de; Wed, 30 Dec 2020 17:12:27 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:48798)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kujfg-0003cn-Jd
 for qemu-devel@nongnu.org; Wed, 30 Dec 2020 17:10:21 -0500
Received: from mail-pf1-x42d.google.com ([2607:f8b0:4864:20::42d]:41285)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kujfb-0007pM-BE
 for qemu-devel@nongnu.org; Wed, 30 Dec 2020 17:10:18 -0500
Received: by mail-pf1-x42d.google.com with SMTP id t8so10337008pfg.8
 for <qemu-devel@nongnu.org>; Wed, 30 Dec 2020 14:10:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=8Xa9D8hkDiPC8lrxl3e57tQR2jaDhyJNrSs+US9y60M=;
 b=mVQal34pNKTzK5/gW8txkkaYGwOrbfkeZfouy8JJNnL88QosyILpYxZ8V44gZIHiia
 BjJ1ndIqmZWIk/SAoMUkzobkaLwkRa3b3fb41dYrgOsZfTAA8TEjphaGvToTxFzrn2Xr
 02Qle0s5+oxmeV8aoT9SPZ9a/JssPrp0qV7HvIEc257kDqzHgxoHIVsKkeslhJ1ocYK0
 Hz1Q/rPnF0rHDQCrzatj6JL8tcXYWZtZJbkrVSnz17c6cJCOosI0lrfxF9IYXa9HkyyA
 7MbVNYAhIMj7dZrvBBxac5BJJqMeez39ryi8ANTP7s702P9MUUfXolh7uHfzexjNhv+W
 6ohQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=8Xa9D8hkDiPC8lrxl3e57tQR2jaDhyJNrSs+US9y60M=;
 b=NaX1Qa8QU1VmBF2TPkAuTr1GUjYGaaLyqEBBiESuJRrfYvpLNIyUZj7bJPLXFethkh
 Q3xZ9XrXHl0t1XycaezM1R2QgbWpgcZs2J2nXLRZcFG0SOK/lhl/CALn9PfJ4+rLK1I0
 HxAPK781UEEjU5+oF4xuBbimXpJ1eG8704FWVlF1sT/DB3Rcqt61rzFNchsvAVIsAorR
 qcpqvNTkQwdPAK24IDelFMg4a4rtBFr2mr6rGSKOUAtB84KQjPEEzDFolrePOPnwqnjH
 PiS3c2HoAK4sJrrOuHRc1HyDfS6CGUyRIsFoYIP0n8Nrp5dR1WxdSPb5/dZi6KqmxiE4
 QKwQ==
X-Gm-Message-State: AOAM533IKxHboufPrJOsUPmwkelWeJ3t07IMPHwd6NMafUqHbIjWZHJK
 mY3bDGgGtjHJNKVulhy/bEtPCxuyKPjxuQ==
X-Google-Smtp-Source: ABdhPJwxCqNYdMjsMspqTgUKZVWSQMGjhT0vsAfCFYZaaxS2OR2GGrPV1OIFYy8nqLpthRiJ7FdRbA==
X-Received: by 2002:a65:494f:: with SMTP id q15mr53804870pgs.367.1609366212239; 
 Wed, 30 Dec 2020 14:10:12 -0800 (PST)
Received: from [192.168.1.11] (174-21-150-71.tukw.qwest.net. [174.21.150.71])
 by smtp.gmail.com with ESMTPSA id
 d203sm44349129pfd.148.2020.12.30.14.10.10
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 30 Dec 2020 14:10:11 -0800 (PST)
Subject: Re: [PATCH 1/3] target/arm: keep translation start level unsigned
To: remi.denis.courmont@huawei.com, qemu-arm@nongnu.org
References: <7884934.NyiUUSuA9g@basile.remlab.net>
 <20201218143321.102872-1-remi.denis.courmont@huawei.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <c2af03a8-9f56-fb43-485c-91ec0fbdef31@linaro.org>
Date: Wed, 30 Dec 2020 14:10:09 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20201218143321.102872-1-remi.denis.courmont@huawei.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42d;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42d.google.com
X-Spam_score_int: -54
X-Spam_score: -5.5
X-Spam_bar: -----
X-Spam_report: (-5.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-3.399,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 12/18/20 6:33 AM, remi.denis.courmont@huawei.com wrote:
> From: Rémi Denis-Courmont <remi.denis.courmont@huawei.com>
> 
> Signed-off-by: Rémi Denis-Courmont <remi.denis.courmont@huawei.com>
> ---
>  target/arm/helper.c | 14 ++++++--------
>  1 file changed, 6 insertions(+), 8 deletions(-)

The patch does more than what is described above.

> 
> diff --git a/target/arm/helper.c b/target/arm/helper.c
> index df195c314c..b927e53ab0 100644
> --- a/target/arm/helper.c
> +++ b/target/arm/helper.c
> @@ -10821,17 +10821,12 @@ do_fault:
>   * Returns true if the suggested S2 translation parameters are OK and
>   * false otherwise.
>   */
> -static bool check_s2_mmu_setup(ARMCPU *cpu, bool is_aa64, int level,
> +static bool check_s2_mmu_setup(ARMCPU *cpu, bool is_aa64, uint32_t level,
>                                 int inputsize, int stride)
>  {
>      const int grainsize = stride + 3;
>      int startsizecheck;
>  
> -    /* Negative levels are never allowed.  */
> -    if (level < 0) {
> -        return false;
> -    }
> -

I would expect this to be the only hunk from the patch description.  Probably
changing this negative check to a >= 3 check.


r~

>      startsizecheck = inputsize - ((3 - level) * stride + grainsize);
>      if (startsizecheck < 1 || startsizecheck > stride + 4) {
>          return false;
> @@ -10856,6 +10851,9 @@ static bool check_s2_mmu_setup(ARMCPU *cpu, bool is_aa64, int level,
>              if (level == 0 && pamax <= 42) {
>                  return false;
>              }
> +            if (level == 3) {
> +                return false;
> +            }
>              break;
>          default:
>              g_assert_not_reached();
> @@ -10871,7 +10869,7 @@ static bool check_s2_mmu_setup(ARMCPU *cpu, bool is_aa64, int level,
>          /* AArch32 only supports 4KB pages. Assert on that.  */
>          assert(stride == 9);
>  
> -        if (level == 0) {
> +        if (level == 0 || level >= 3) {
>              return false;
>          }
>      }
> @@ -11203,7 +11201,7 @@ static bool get_phys_addr_lpae(CPUARMState *env, uint64_t address,
>  
>          if (!aarch64 || stride == 9) {
>              /* AArch32 or 4KB pages */
> -            startlevel = 2 - sl0;
> +            startlevel = (2 - sl0) & 3;
>          } else {
>              /* 16KB or 64KB pages */
>              startlevel = 3 - sl0;
> 


