Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C163443D4E3
	for <lists+qemu-devel@lfdr.de>; Wed, 27 Oct 2021 23:22:14 +0200 (CEST)
Received: from localhost ([::1]:50704 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mfqNB-0005xH-Bg
	for lists+qemu-devel@lfdr.de; Wed, 27 Oct 2021 17:22:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34520)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mfqLb-000598-4Z
 for qemu-devel@nongnu.org; Wed, 27 Oct 2021 17:20:35 -0400
Received: from mail-pj1-x1031.google.com ([2607:f8b0:4864:20::1031]:34461)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mfqLZ-00047P-4H
 for qemu-devel@nongnu.org; Wed, 27 Oct 2021 17:20:34 -0400
Received: by mail-pj1-x1031.google.com with SMTP id
 q2-20020a17090a2e0200b001a0fd4efd49so4057655pjd.1
 for <qemu-devel@nongnu.org>; Wed, 27 Oct 2021 14:20:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=cjQm84a81zjxY5rIeSZRLTFolPITuHAErB+CvfTLl8A=;
 b=NVtKcNcDRs5bkJB9nQyXF7a6IQZ+uhrmsQ5Yx2Me2T9UEwQ42D4mhXQOYeIDRehTzf
 /yxs2Q1kP3yxlKH41qLr7v06BVAUraj6xDe4roNbHcJ9fH42RUGQIQTkLVLSUTQ3yD1w
 ndPot7vdXkIkhDDLMUpGJrkIqOZq/zg4tDnaKQHwlQRmAstr2yjic/KMFQKzgaTnOeai
 S8NnxHwmQKO2hy1G9xiF4cyc2Q9KmOuN5pIcYpYbSdrXXFQ5ZldWXnspRk9sNItz4B+6
 G2PNLcKoqLOQ4TUy4hAhnk8Nv4ATYsMhL75Hjn9SJ13aIuepGTWc+ytZjtQ2q4jJ5cXW
 uZJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=cjQm84a81zjxY5rIeSZRLTFolPITuHAErB+CvfTLl8A=;
 b=j19YcIU0zAyOHW4mSN7gyVFGl55xTpZjuOiachcmAoA4KYVfegQdur/3diCWoDMBWh
 avUT2pp8/CSmEx0D08KVr6AtneDadCd0F8+x9OlL4XVrqEroOUogQHdveK9gJ8MErri/
 rUYTfpijPVdW7UyNrhIx02nyMXwMi8tH8jb/cdV/j68HqXdSUkmUlQuHe6KqBvOHgKMW
 4xzjXi4o6TRTdqB8Sbolhwwn6QhjGhgiMGSBjJ00yHwecfJAbCAqVBlXFWs7KINKkbsd
 WLktkXP3P301/woyVL+h5mZpZWXvcE73vNZbCDkJ8SISXbUllA+MT3P0tS2pCGIAEhOR
 mCWA==
X-Gm-Message-State: AOAM533O8yCW45+9JtnCGLiVHlfjRLw9QvbVt6QWk6Df9pdWGB7h91Pc
 qA+Mnken2W84Vxa5zPPor22HTw==
X-Google-Smtp-Source: ABdhPJwK1FpElP0+1c8biGHhlm58s67JXuVJgk8nYX8XJ19z1CDpi8RZrwo0HlYwa/ergwpxPfPr+g==
X-Received: by 2002:a17:90a:1101:: with SMTP id
 d1mr8529944pja.205.1635369630683; 
 Wed, 27 Oct 2021 14:20:30 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.134.125])
 by smtp.gmail.com with ESMTPSA id oa4sm634160pjb.13.2021.10.27.14.20.30
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 27 Oct 2021 14:20:30 -0700 (PDT)
Subject: Re: [PATCH v2 10/32] target/mips: Convert MSA BIT instruction format
 to decodetree
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
References: <20211027180730.1551932-1-f4bug@amsat.org>
 <20211027180730.1551932-11-f4bug@amsat.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <8a26bb59-dc0e-f56f-2d8b-dd0cc9dcaf6a@linaro.org>
Date: Wed, 27 Oct 2021 14:20:28 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20211027180730.1551932-11-f4bug@amsat.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1031;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1031.google.com
X-Spam_score_int: -48
X-Spam_score: -4.9
X-Spam_bar: ----
X-Spam_report: (-4.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-2.847,
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
Cc: Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 10/27/21 11:07 AM, Philippe Mathieu-Daudé wrote:
> +static bool trans_msa_bit(DisasContext *ctx, arg_msa_bit *a,
> +                          gen_helper_piiii *gen_msa_bit)
>  {
> +    if (a->df < 0) {
> +        return false;
>      }

This test should happen before the msa check...
>   
> +    gen_msa_bit(cpu_env,
> +                tcg_constant_i32(a->df),
> +                tcg_constant_i32(a->wd),
> +                tcg_constant_i32(a->ws),
> +                tcg_constant_i32(a->m));
>   
> +    return true;
>   }
>   
> +TRANS_MSA(SLLI,     trans_msa_bit, gen_helper_msa_slli_df);

... currently being hidden in here.

This is the reason why I suggest TRANS_MSA be dispensed with.  You won't have over-many 
explicit trans_* functions in which you need to place the msa check, I think.


r~

