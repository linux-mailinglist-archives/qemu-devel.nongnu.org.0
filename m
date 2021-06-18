Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A48AC3AD038
	for <lists+qemu-devel@lfdr.de>; Fri, 18 Jun 2021 18:17:51 +0200 (CEST)
Received: from localhost ([::1]:55698 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1luHBm-0004ZG-NC
	for lists+qemu-devel@lfdr.de; Fri, 18 Jun 2021 12:17:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52958)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1luH9F-0008QZ-DL
 for qemu-devel@nongnu.org; Fri, 18 Jun 2021 12:15:13 -0400
Received: from mail-pj1-x1030.google.com ([2607:f8b0:4864:20::1030]:43664)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1luH9C-0004oZ-KZ
 for qemu-devel@nongnu.org; Fri, 18 Jun 2021 12:15:13 -0400
Received: by mail-pj1-x1030.google.com with SMTP id
 x21-20020a17090aa395b029016e25313bfcso6148782pjp.2
 for <qemu-devel@nongnu.org>; Fri, 18 Jun 2021 09:15:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-language:content-transfer-encoding;
 bh=FMGiC4HD493TGEmrvHR+GCf6XCEiDO9FK/MBWEWEWCs=;
 b=n8ayfb+2DPrWe09SefcoJ5uxPYp1Y8MQAySLqMrHSVV1uaqwMEUDNAYVQhfMZlEjlX
 5QHV/UlcZh6rFh0pQ60k1J2l+dHHoWGplrnEBQjYEOIC57vEQ9uQihFXK9lEA7dkOZXu
 FZjO4qVrhxOoV7SlSbl7/fdCLI6nRTsVOjwEP8uo/YQn1KLPiqZ1msSFsDx29TfbY0ZR
 92Nv/8Pu/H1iflBeQ4JQ20/JVCgzm+8ONM9nm6ukRNQFJR18f+yW4PESEYmvmv2j8mo5
 YFrxdD2ZfwgFwtuS0Ypu4Ii+uE29yfmxFJN1L3lv/XHfQMyyyYDXZBh2a+jk/Q0+crvM
 26jQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=FMGiC4HD493TGEmrvHR+GCf6XCEiDO9FK/MBWEWEWCs=;
 b=dGOHzvD6XMv7/2dP+g0Wb1iY3Wt63S7WJndSZYspS3+3JSnUsQ2ZBixIvXvH9IsG/6
 hUjxIRDV/hQhkTIax7Sm9a+x6u6gPfmgYu104ql/kPh4pB81b+d9SXYpzOhSMMlfu6SN
 s+BEsTnpHboOvMNMlMDSwfWtG2Al0TW5D9GEGI4GPnJ5AViB0i5c+ij39RcycYnKAi4V
 VmMWzA7SIS2FYL/Z20v70DEQ06Xkr3433xwE6f7/w3pyZUY8kHZbX/ujqSrYbwL0M6Od
 VrTIJHAXk1csOFGyBVjn8h1PQcdNLvmtK8D+HfWO2gUFUNzvubnIcQ+PZb+2R9N1Oz7J
 DoQg==
X-Gm-Message-State: AOAM5302EJmK/b4L7/hQJoWTz4wJWC2NihG3BGt9OQ9W152dXx56T81P
 ms/T54Q24KAzyAbFdK939pBJh5fSUnzZ9g==
X-Google-Smtp-Source: ABdhPJwXhy7vq55WRPdtTuTURqVwd8QxU0biBWs2XGDyAA23tTeLUkYAN2YJr2rQFMLRo6B0YsnzPA==
X-Received: by 2002:a17:90b:3144:: with SMTP id
 ip4mr22803238pjb.2.1624032906459; 
 Fri, 18 Jun 2021 09:15:06 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.149.176])
 by smtp.gmail.com with ESMTPSA id t39sm8313439pfg.147.2021.06.18.09.15.05
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 18 Jun 2021 09:15:06 -0700 (PDT)
Subject: Re: [PATCH 4/7] target/arm: Handle writeback in VLDR/VSTR sysreg with
 no memory access
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20210618141019.10671-1-peter.maydell@linaro.org>
 <20210618141019.10671-5-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <73b67dcb-6d84-03d8-cc37-f8b8b3f94905@linaro.org>
Date: Fri, 18 Jun 2021 09:15:04 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210618141019.10671-5-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1030;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1030.google.com
X-Spam_score_int: -22
X-Spam_score: -2.3
X-Spam_bar: --
X-Spam_report: (-2.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.202,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 6/18/21 7:10 AM, Peter Maydell wrote:
> @@ -633,9 +665,11 @@ static void fp_sysreg_to_memory(DisasContext *s, void *opaque, TCGv_i32 value)
>           gen_helper_v8m_stackcheck(cpu_env, addr);
>       }
>   
> -    gen_aa32_st_i32(s, value, addr, get_mem_index(s),
> -                    MO_UL | MO_ALIGN | s->be_data);
> -    tcg_temp_free_i32(value);
> +    if (do_access) {
> +        gen_aa32_st_i32(s, value, addr, get_mem_index(s),
> +                        MO_UL | MO_ALIGN | s->be_data);
> +        tcg_temp_free_i32(value);
> +    }

So, this bit looked funny at first glance -- are we missing the free of value?  But of 
course value == NULL when !do_access.  Which made me wonder if it wouldn't be better to 
just use value == NULL and not add the extra argument?

Either way,
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~

