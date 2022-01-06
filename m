Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D57D64869B3
	for <lists+qemu-devel@lfdr.de>; Thu,  6 Jan 2022 19:23:16 +0100 (CET)
Received: from localhost ([::1]:39068 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n5XPv-0005Lh-Du
	for lists+qemu-devel@lfdr.de; Thu, 06 Jan 2022 13:23:15 -0500
Received: from eggs.gnu.org ([209.51.188.92]:60316)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1n5XOr-0004fK-61
 for qemu-devel@nongnu.org; Thu, 06 Jan 2022 13:22:09 -0500
Received: from [2607:f8b0:4864:20::42d] (port=46875
 helo=mail-pf1-x42d.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1n5XOn-0000IR-Pz
 for qemu-devel@nongnu.org; Thu, 06 Jan 2022 13:22:08 -0500
Received: by mail-pf1-x42d.google.com with SMTP id t123so3174353pfc.13
 for <qemu-devel@nongnu.org>; Thu, 06 Jan 2022 10:22:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=7eXX71Ug7zvoEqvEtuNGTgfhVpJHoUu8gN9EEmTJeak=;
 b=nZWj2O8Kr8uzI5iEdxHsdxJP+zoF6M5SPBaGkbcajqIkZj9U+RJDNhmyoN04j2oHbX
 BSQq6XB/lZC4jID2SVKoJpOGYMcvS/NM3un9ILXXeUTtJCPdsGNBE1jHYMeLzZDNz6Pi
 c5N+4Zzw1b2AuTe0U9DeiXk3MmoieghMejh2xkooqbd8W4CNIskPQPXwH8hAN4TlRZLd
 vVJlhRcNRUg4jcviJrzCxBCZ9MDS9g1jenQLJ0UsUfKKQzVX7E6wvL2Aw5vOgI3RG164
 tzSvM8X0CZNNOb92AIsPVK7SifA/56LP/ui1FxsXwT4NpA7rhVswcAGGMoe+ET6AFOas
 PELA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=7eXX71Ug7zvoEqvEtuNGTgfhVpJHoUu8gN9EEmTJeak=;
 b=k2AZwZpnxtEEAuPI+mH4IMYzKjcdv/nfMo9v/Uo9hkz+cJm8pY8xVYOOL7wtS3OOIs
 TEQHNMXybA9Wql6SQCkG0rzN9xvMmEkx+q2PjXBMeqlD9XFVoHi6Wp1ze9lO+1AU+f/G
 X2+gSN9mR+rvYwsd8oFJYY4PnFJ8Op4bi0MHqbB6/juJ4HYjUxaI+kaWWQVpwDaNPArK
 DXyehX4j35/l4C27mm004mk0/MdYLfDtLT0a8Md1ay3voECptRSJ0cY177jHQACSnFAo
 4CN5QubeTOvelo34bHzvk6gLpytsCPdXMf6b2jsLR6I1FuLd0qZchTeeefGC8P1FMpCf
 iiEQ==
X-Gm-Message-State: AOAM530PUb2AD1Yz6z9GlN5pp7lZqT7zrSQHTgY4547K4VEWFb2qu9nR
 3b7z1JuYLbOrVvXbnlDwchuVBA==
X-Google-Smtp-Source: ABdhPJxONJpCGIIXqLn5lD7aAYroMAAgGSbk1nDxzOpyxl3NYtvOHiCXRV2ic8emAcVev8cyfC5mCA==
X-Received: by 2002:a63:b30b:: with SMTP id i11mr18224999pgf.457.1641493324024; 
 Thu, 06 Jan 2022 10:22:04 -0800 (PST)
Received: from [192.168.1.13] (174-21-75-75.tukw.qwest.net. [174.21.75.75])
 by smtp.gmail.com with ESMTPSA id na9sm7343611pjb.0.2022.01.06.10.22.03
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 06 Jan 2022 10:22:03 -0800 (PST)
Subject: Re: [PATCH] i386/tcg: generate an illegal op when translating AVX
 instructions
To: Stevie Lavern <stevie.lavern@gmail.com>, qemu-devel@nongnu.org
References: <CADV2EAuttJSjXMc1CHmyJ9ApjOFLJ8CKxa81LLQp3DAYn2A2ZA@mail.gmail.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <29eeda88-97d1-417f-0287-bdda016ab9a1@linaro.org>
Date: Thu, 6 Jan 2022 10:22:02 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <CADV2EAuttJSjXMc1CHmyJ9ApjOFLJ8CKxa81LLQp3DAYn2A2ZA@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::42d
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::42d;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42d.google.com
X-Spam_score_int: -39
X-Spam_score: -4.0
X-Spam_bar: ----
X-Spam_report: (-4.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-2.691,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
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
Cc: eduardo@habkost.net, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 1/6/22 2:35 AM, Stevie Lavern wrote:
> The AVX instruction set is not supported by Qemu.
> However, some AVX instructions are properly decoded and emulated as their
> legacy SSE version.
> This patch prevent this by generating an illegal_op instead of a bogus SSE
> instruction.
> 
> Signed-off-by: Stevie Lavern <stevie.lavern@gmail.com <mailto:stevie.lavern@gmail.com>>
> ---
>   target/i386/tcg/translate.c | 5 +++++
>   1 file changed, 5 insertions(+)
> 
> diff --git a/target/i386/tcg/translate.c b/target/i386/tcg/translate.c
> index 05f9336c9b..996fce65b2 100644
> --- a/target/i386/tcg/translate.c
> +++ b/target/i386/tcg/translate.c
> @@ -4706,6 +4706,11 @@ static target_ulong disas_insn(DisasContext *s, CPUState *cpu)
>           }
>       }
> 
> +    if (s->vex_l & 1) {

The whole value should be 0, not only bit 0.

> +        /* If set, registers are 256bits.
> +           Fail as AVX extension is not supported. */

checkpatch.pl should have complained about the comment formatting:

     /*
      * multi line
      * comment
      */

Otherwise it looks good.


r~

