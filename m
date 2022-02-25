Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 71A6B4C51C1
	for <lists+qemu-devel@lfdr.de>; Fri, 25 Feb 2022 23:53:23 +0100 (CET)
Received: from localhost ([::1]:52272 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nNjSk-0007ID-Ho
	for lists+qemu-devel@lfdr.de; Fri, 25 Feb 2022 17:53:22 -0500
Received: from eggs.gnu.org ([209.51.188.92]:40378)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nNiLq-0004OD-7E
 for qemu-devel@nongnu.org; Fri, 25 Feb 2022 16:42:10 -0500
Received: from [2607:f8b0:4864:20::1031] (port=47028
 helo=mail-pj1-x1031.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nNiLm-0000xB-05
 for qemu-devel@nongnu.org; Fri, 25 Feb 2022 16:42:09 -0500
Received: by mail-pj1-x1031.google.com with SMTP id
 j10-20020a17090a94ca00b001bc2a9596f6so5974349pjw.5
 for <qemu-devel@nongnu.org>; Fri, 25 Feb 2022 13:42:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=t3GVpPGnuV6g3mbsMTDWkzoEEnlWHdoWHdmi5qOTZ3g=;
 b=fWy4FUL5kpgK9PC03kq5gHC+fVJULj1r/SWS4GSMneur4sJlb5lPcv6+G61K8aqGOt
 bFzyPKtNXQBjKBNPVwgLXytuYeQNW/deme9PleZYm3VYhBiFswz3XmAsSPPuPmgJsind
 Zc41UZS6mriUYpZTdpOTYSQ+0Pg6T/yAQ12Z9Papp0TKgYi0IWXnvDEf1UQxUpv8gVSQ
 aMyCcVxIYbsVX1f6aYu58GLZAdYHj7dC3+SdTlQIu0hlBZ8XV5VqaDG5TxiXm2xCfV28
 2K6Q1dAFDaJ4XrwkbzO6wg0zk6Ju1/m+8IL4xh5SYWh6IRe8uZxh9a+yE90NVD2hLs1D
 u93w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=t3GVpPGnuV6g3mbsMTDWkzoEEnlWHdoWHdmi5qOTZ3g=;
 b=IisJFp07JvTqnoIxRCUO8+WOicsj0DbriWgY9SpzDS1OFPK/56xrLSEXgg5tmCIBWh
 6Zv7emuMcS9jsmU/pEg5xL9T72CViO2R5H7AARwGF+gFXeyZCAuMs8m1VnE3vLSMFLPw
 +s7ADWV2j/vPJFqR53R/AVcL5FTAKlrO9mTwKxhGA3qizNWwp74I2xRaONBi3q7seuTn
 5YsTpmwDvJMnsxyRDvoaTKVJiscIlP5JYCEIIosM7WOjqSGUFiFlA8dtftG5F9Q71f4q
 7wIN9uJy0RyF6wFGImP234VxVPtqnKeaBSWtBjpeva9uENVUKdF2KXyEOqD0I715riNc
 Rl4w==
X-Gm-Message-State: AOAM531aP2B8tCJ+7VJvxno9a0Cqi8nj+lnD08XzaFZvWuG8KzIts/eU
 GjAgVvyc9vNgHCe8J5jpuBO0Jw==
X-Google-Smtp-Source: ABdhPJwmrLqVtAp1CiVHj/vLLwDamUxMr3vCEM41CXup+l/k04cPAdFO4Hz2VHOn6hH/9rL93oBHYA==
X-Received: by 2002:a17:902:7201:b0:151:476b:a58 with SMTP id
 ba1-20020a170902720100b00151476b0a58mr546631plb.42.1645825324481; 
 Fri, 25 Feb 2022 13:42:04 -0800 (PST)
Received: from [192.168.4.112] (cpe-50-113-46-110.hawaii.res.rr.com.
 [50.113.46.110]) by smtp.gmail.com with ESMTPSA id
 gz13-20020a17090b0ecd00b001bc5defa657sm10149141pjb.11.2022.02.25.13.42.02
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 25 Feb 2022 13:42:03 -0800 (PST)
Message-ID: <2d7c7c35-e0f6-e423-ab94-27ce14c737a0@linaro.org>
Date: Fri, 25 Feb 2022 11:42:00 -1000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v5 26/49] target/ppc: implement vrlqnm
Content-Language: en-US
To: matheus.ferst@eldorado.org.br, qemu-devel@nongnu.org, qemu-ppc@nongnu.org
References: <20220225210936.1749575-1-matheus.ferst@eldorado.org.br>
 <20220225210936.1749575-27-matheus.ferst@eldorado.org.br>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220225210936.1749575-27-matheus.ferst@eldorado.org.br>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::1031
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::1031;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1031.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: groug@kaod.org, danielhb413@gmail.com, clg@kaod.org,
 david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2/25/22 11:09, matheus.ferst@eldorado.org.br wrote:
> +    /* t = t >> 1 */
> +    tcg_gen_shli_i64(t0, th, 63);
> +    tcg_gen_shri_i64(tl, tl, 1);
> +    tcg_gen_shri_i64(th, th, 1);
> +    tcg_gen_or_i64(tl, t0, tl);

tcg_gen_extract2_i64(tl, tl, th, 1);
tcg_gen_shri_i64(th, th, 1);

> +    if (mask) {
> +        tcg_gen_shri_i64(n, vrb, 8);
> +        tcg_gen_shri_i64(vrb, vrb, 16);
> +        tcg_gen_andi_i64(n, n, 0x7f);
> +        tcg_gen_andi_i64(vrb, vrb, 0x7f);

Two tcg_gen_extract_i64.

Otherwise,
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~

