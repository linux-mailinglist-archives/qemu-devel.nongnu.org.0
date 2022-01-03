Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 51B4248389D
	for <lists+qemu-devel@lfdr.de>; Mon,  3 Jan 2022 22:44:22 +0100 (CET)
Received: from localhost ([::1]:56958 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n4V7t-0005qY-60
	for lists+qemu-devel@lfdr.de; Mon, 03 Jan 2022 16:44:21 -0500
Received: from eggs.gnu.org ([209.51.188.92]:33106)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1n4V4Y-0004BY-Pv
 for qemu-devel@nongnu.org; Mon, 03 Jan 2022 16:40:57 -0500
Received: from [2607:f8b0:4864:20::42b] (port=39851
 helo=mail-pf1-x42b.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1n4V4X-0003HH-BT
 for qemu-devel@nongnu.org; Mon, 03 Jan 2022 16:40:54 -0500
Received: by mail-pf1-x42b.google.com with SMTP id s15so30478265pfk.6
 for <qemu-devel@nongnu.org>; Mon, 03 Jan 2022 13:40:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=+qXF9vtwT1WE2DCJuLt4tHGUOpfbxxk3aSMBPHhsQmY=;
 b=MCGZx2ZhTJjt3h4A552jbf+rejzZyJKfRNh8w6CYydSJ2VBjeV9IWl3f6HqCr0eC3m
 FQNPGsXK4mVIi9NaUBt5Csm+FLud2wm7iF4WpQRrJNU94A6abTkd9pEjuGXMb0IkdiWK
 LAEzJx+KRFvGLrMan4LMT3DQhPdunUhvDJbkkvL6uFEh+gtcp7PYCISu5Gm+WspsqzZp
 VGl9xZ9F2ePPbgJvM2qPIxwi8h6sOr4pjoQ1AVY6al1Q6IZ1R8SCIackKn/iMMCjGbuH
 EBqIlhUo5RjmjHtKXTD/2ViAIDpOTAg3e784QtL9ti5rR2K0GTyB+9TwsAiTlfr9o4rM
 Ro2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=+qXF9vtwT1WE2DCJuLt4tHGUOpfbxxk3aSMBPHhsQmY=;
 b=XGGdvHv+agS5HEwwHQemiN4ZyRr3M/e4gzUJTH8eZTlMJoLmQmFGul6RYxKUEqbbtz
 w3ponH1lfmk+IL5k662RCCZSkG5zxjf6E4x8SE7q/uby5moH89J7pzRqZFIudbct+jCl
 qvUz/TDk+SFEb9lZAF2WykayptkvLZNAlOgu9ixIGi+E7sfKy3FMRFxY3OOZ9/gmMvlM
 AGZualftOaPhTYneRUG2fF1JhZXm555jCDjY9Zg+ybv6yI+KVPM3MNU8Mfcpy5s4q+yu
 qeeMFYe7Pj/bnGj+WXwC94cFXEF9xIGViB16kiWb7jFVDQvZK/8ngaqqaulbAiWeqySD
 tRhg==
X-Gm-Message-State: AOAM530uERDFtfgCm7DLUGpAy8Y83WX2lyHmYesIG+nZr4dMH4+VUPE6
 vg9Qrze3WipvRSFAN6bivj7j2Q==
X-Google-Smtp-Source: ABdhPJwYOJrNzyEcKNxRMqOMBcjZka1rOKT1iMpHyOkLUkiAMKvwbdStjQLz3LemcRxzLRImfomIVg==
X-Received: by 2002:a63:8341:: with SMTP id h62mr41069157pge.283.1641246052042; 
 Mon, 03 Jan 2022 13:40:52 -0800 (PST)
Received: from [192.168.1.13] (174-21-75-75.tukw.qwest.net. [174.21.75.75])
 by smtp.gmail.com with ESMTPSA id e9sm33072742pgp.39.2022.01.03.13.40.51
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 03 Jan 2022 13:40:51 -0800 (PST)
Subject: Re: [PATCH v2 5/5] target/ppc: do not call hreg_compute_hflags() in
 helper_store_mmcr0()
To: Daniel Henrique Barboza <danielhb413@gmail.com>, qemu-devel@nongnu.org
References: <20220103185332.117878-1-danielhb413@gmail.com>
 <20220103185332.117878-6-danielhb413@gmail.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <7a262c9b-fef2-9295-fce4-abf41f823715@linaro.org>
Date: Mon, 3 Jan 2022 13:40:50 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <20220103185332.117878-6-danielhb413@gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::42b
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::42b;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42b.google.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-3.354,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: qemu-ppc@nongnu.org, clg@kaod.org, david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 1/3/22 10:53 AM, Daniel Henrique Barboza wrote:
> MMCR0 writes will change only MMCR0 bits which are used to calculate
> HFLAGS_PMCC0, HFLAGS_PMCC1 and HFLAGS_INSN_CNT hflags. No other machine
> register will be changed during this operation. This means that
> hreg_compute_hflags() is overkill for what we need to do.
> 
> pmu_update_summaries() is already updating HFLAGS_INSN_CNT without
> calling hreg_compure_hflags(). Let's do the same for the other 2 MMCR0
> hflags.
> 
> Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
> ---
>   target/ppc/power8-pmu.c | 7 ++++++-
>   1 file changed, 6 insertions(+), 1 deletion(-)
> 
> diff --git a/target/ppc/power8-pmu.c b/target/ppc/power8-pmu.c
> index 73713ca2a3..69342413bd 100644
> --- a/target/ppc/power8-pmu.c
> +++ b/target/ppc/power8-pmu.c
> @@ -224,12 +224,17 @@ static void pmu_update_overflow_timers(CPUPPCState *env)
>   
>   void helper_store_mmcr0(CPUPPCState *env, target_ulong value)
>   {
> +    uint32_t hflags_pmcc0 = (value & MMCR0_PMCC0) != 0;
> +    uint32_t hflags_pmcc1 = (value & MMCR0_PMCC1) != 0;

Could use bool here.  Otherwise,

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

