Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 23B86366371
	for <lists+qemu-devel@lfdr.de>; Wed, 21 Apr 2021 03:44:47 +0200 (CEST)
Received: from localhost ([::1]:40652 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lZ1v4-0003mj-5n
	for lists+qemu-devel@lfdr.de; Tue, 20 Apr 2021 21:44:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39302)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lZ1tU-0002u1-QB
 for qemu-devel@nongnu.org; Tue, 20 Apr 2021 21:43:08 -0400
Received: from mail-pf1-x433.google.com ([2607:f8b0:4864:20::433]:40817)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lZ1tR-0002k3-4v
 for qemu-devel@nongnu.org; Tue, 20 Apr 2021 21:43:08 -0400
Received: by mail-pf1-x433.google.com with SMTP id a12so27132902pfc.7
 for <qemu-devel@nongnu.org>; Tue, 20 Apr 2021 18:43:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=U9uz0oNtywir/o731DqcNlBbigDz7qi1lU3jBkStIyE=;
 b=BvDqM6m8YzhbSJPYLtQ62TgWv4tIX8de+ybNlM6nGZe8qowS2EIoxoP7uN5VRA3oTR
 6hdAn06vL09RwySM7/Vj+Dv7QeOwbEGZ+8GH1o1M20RDendtpg/A5vblqdq4AbHw5rnx
 pjjz7R5gXe2v5iT3KrSrwNLgZR1dJ9kSzKMfjtfKXk/lmLllSV5DmDGFfEJfLSqVrV2o
 ZeQPg8iPMmbXQ3YfijkrW4f/wGLz9m81GkcC95lWR3VsJhjh4aDA/+WQbTYkkoLE5hPK
 vAJWOJTdWAapfkEJ53HmpT5OyIFAJjQTiHIX+k1A1CtfWGRnwT6UFNW+iTXpK7Ml3PRo
 x4Ow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=U9uz0oNtywir/o731DqcNlBbigDz7qi1lU3jBkStIyE=;
 b=JmrZeiVchKAWFgryjJHq9bPjtqLLXhLEk2KoVwTLvJX3A9vvE9Gxz9bbdDRagPMe4Z
 ODyGjznC1fT4uHfAGHvbLXevVKC3BwZ5nQ5e4UtP+bMfYbQINJFQovGXmpL54eOA5kJr
 HBRThcBJodtnDh33aC3PvJfSfizJSN3Y/B0nY2VeNFXDfDciN28tXEB1nXHLqMU9rlqp
 ZEBeiAYBTLx8HxVQJHhY2mEBG4JbKfI2Li8tcIDOPIrS3HvSl7CEZqS153f2EKX5YC5b
 n/U7D8twoSKqhRaY/iHP4pS4QIseVBtmXDF9+mvVr2iiwGiY1Vk5R+nsVAVTIdxW3CxP
 wACg==
X-Gm-Message-State: AOAM532d1eK4oH1h8V+mV+jnW70D/LcMFrapX/q3LodBQVCLcxykgr99
 Rd+PQgkfhDEdwr4p8jsFpqpGOw==
X-Google-Smtp-Source: ABdhPJwMYzGx2aHiIemPcXTQ8g4ogUL5JnIq+IrQp34ln1+3aiQO8goMLlaklO1ijhUyjWcrqysYwA==
X-Received: by 2002:a62:3344:0:b029:25e:a0a8:1c51 with SMTP id
 z65-20020a6233440000b029025ea0a81c51mr14325770pfz.58.1618969383753; 
 Tue, 20 Apr 2021 18:43:03 -0700 (PDT)
Received: from [192.168.73.113]
 (50-200-230-211-static.hfc.comcastbusiness.net. [50.200.230.211])
 by smtp.gmail.com with ESMTPSA id e6sm251911pgh.17.2021.04.20.18.43.03
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 20 Apr 2021 18:43:03 -0700 (PDT)
Subject: Re: [PATCH 4/5] target/mips: Use check_cp0_enabled() returned value
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
References: <20210420193453.1913810-1-f4bug@amsat.org>
 <20210420193453.1913810-5-f4bug@amsat.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <18332a7d-752b-c3fc-0bee-3631fbb9df58@linaro.org>
Date: Tue, 20 Apr 2021 18:43:02 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <20210420193453.1913810-5-f4bug@amsat.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::433;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x433.google.com
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
Cc: Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 4/20/21 12:34 PM, Philippe Mathieu-Daudé wrote:
> @@ -14809,14 +14811,15 @@ static void gen_pool32axf(CPUMIPSState *env, DisasContext *ctx, int rt, int rs)
>           }
>           break;
>       case 0x05:
> +        if (!check_cp0_enabled(ctx)) {
> +            break;
> +        }
>           switch (minor) {
>           case RDPGPR:
> -            check_cp0_enabled(ctx);
>               check_insn(ctx, ISA_MIPS_R2);
>               gen_load_srsgpr(rs, rt);
>               break;
>           case WRPGPR:
> -            check_cp0_enabled(ctx);
>               check_insn(ctx, ISA_MIPS_R2);
>               gen_store_srsgpr(rs, rt);
>               break;

cp0 check before decode complete.  at least 2 more instances in this patch.


r~



