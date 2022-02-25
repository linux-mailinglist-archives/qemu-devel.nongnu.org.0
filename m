Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D2844C519B
	for <lists+qemu-devel@lfdr.de>; Fri, 25 Feb 2022 23:36:04 +0100 (CET)
Received: from localhost ([::1]:50602 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nNjBy-0002r6-Sc
	for lists+qemu-devel@lfdr.de; Fri, 25 Feb 2022 17:36:02 -0500
Received: from eggs.gnu.org ([209.51.188.92]:37490)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nNi7H-0004dG-OJ
 for qemu-devel@nongnu.org; Fri, 25 Feb 2022 16:27:09 -0500
Received: from [2607:f8b0:4864:20::52c] (port=34730
 helo=mail-pg1-x52c.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nNi7G-0006S9-1h
 for qemu-devel@nongnu.org; Fri, 25 Feb 2022 16:27:07 -0500
Received: by mail-pg1-x52c.google.com with SMTP id 139so5757714pge.1
 for <qemu-devel@nongnu.org>; Fri, 25 Feb 2022 13:26:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=/CPkmJd+ISXESOoQqUXtjUCAGMpdcAiWSzb7Y2crYx0=;
 b=IVb0WuTlVgkC2ltPefW9d7ZxWuGMGHlcct0at+qFSMKPUOHWQ7fj6qyLrTt/Fr7Z1b
 1fNox5snci2BTAiPhwuvaUpO3K2vKv4qykvvdTb5DHdZ+u/8MmitZOwgzEEXk9L5M11o
 IxhNXblMG9b5kKAzqgbe3+94f3kkRClF+9FKGtKVHOfb5bPVbMTDZ5pDzLEjxX5wEkBk
 +vhJ1VmCwv6QEeW8Ga+2FC0cHSz3JYe7i7ga2MkEmXtCayyVskmHOhcHxpJkDw9cg6sb
 q+tHJ1AnKQm+21ORqJSV5Nh4xc0x5oePHnqUnPfMap2yhBkg1c2Y5bQ5hATiijJDaeO1
 DBMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=/CPkmJd+ISXESOoQqUXtjUCAGMpdcAiWSzb7Y2crYx0=;
 b=eZDgWoyNYV3RAe9/VQJcE7ADB2oksJMN2E2/nfg/XQeRv2WLK5ciiLmocS3yI9rTA9
 u4rng+7Z1QyfpLy9JW4mKqz/U/6xMq69XKkAgItk3AtWt8DLS2Bi1YazLpTnU4vh9kbQ
 h8fYCITb67OziAPfYT23O3uMvlKC9ML9DXZarZ3w/qtlbKwgMpBMI2dF4yfwdzXQTK3I
 kEROGJBQZwgZ6aQCae/y7+ogDDUGXZwiZQT6P43vtHm9RJFOK0yr6MsshtzS9eJiBx8Y
 /aXzqycg785EacW0sCwoxEyfxcsYdw+nkDCu5Tu00dP53rv4gv3GDELORGU+oYCXb0z0
 5myw==
X-Gm-Message-State: AOAM532oqqXnuj3ebzRitgxaPmGu+8mdTio9HUT6fhUjgJzxGacPU/2U
 mWeI1keJnFOoScZZFvvIJcWEBg==
X-Google-Smtp-Source: ABdhPJyW3sDbabzs3f69MsWzy0yNFtYWmD6S+Xbx4AZCqaj8I/m+KGkOX0CXfc43G+JUbeewMZ2NGA==
X-Received: by 2002:a63:3111:0:b0:373:a1fa:8998 with SMTP id
 x17-20020a633111000000b00373a1fa8998mr7486162pgx.415.1645824415034; 
 Fri, 25 Feb 2022 13:26:55 -0800 (PST)
Received: from [192.168.4.112] (cpe-50-113-46-110.hawaii.res.rr.com.
 [50.113.46.110]) by smtp.gmail.com with ESMTPSA id
 t11-20020a056a0021cb00b004ce1a7d5ce8sm4354959pfj.113.2022.02.25.13.26.53
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 25 Feb 2022 13:26:54 -0800 (PST)
Message-ID: <33964bf1-4f54-dadf-c519-4abab158ae20@linaro.org>
Date: Fri, 25 Feb 2022 11:16:23 -1000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v5 04/49] target/ppc: vmulh* instructions without helpers
Content-Language: en-US
To: matheus.ferst@eldorado.org.br, qemu-devel@nongnu.org, qemu-ppc@nongnu.org
References: <20220225210936.1749575-1-matheus.ferst@eldorado.org.br>
 <20220225210936.1749575-5-matheus.ferst@eldorado.org.br>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220225210936.1749575-5-matheus.ferst@eldorado.org.br>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::52c
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::52c;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x52c.google.com
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
Cc: "Lucas Mateus Castro \(alqotel\)" <lucas.castro@eldorado.org.br>,
 danielhb413@gmail.com, groug@kaod.org,
 Lucas Mateus Castro <lucas.araujo@eldorado.org.br>, clg@kaod.org,
 david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2/25/22 11:08, matheus.ferst@eldorado.org.br wrote:
> +static void do_vx_vmulhw_i64(TCGv_i64 t, TCGv_i64 a, TCGv_i64 b, bool sign)
> +{
> +    TCGv_i64 hh, lh, temp;
> +
> +    uint64_t c;
> +    hh = tcg_temp_new_i64();
> +    lh = tcg_temp_new_i64();
> +    temp = tcg_temp_new_i64();
> +
> +    c = 0xFFFFFFFF;
> +
> +    if (sign) {
> +        tcg_gen_ext32s_i64(lh, a);
> +        tcg_gen_ext32s_i64(temp, b);
> +    } else {
> +        tcg_gen_andi_i64(lh, a, c);
> +        tcg_gen_andi_i64(temp, b, c);

Nit: tcg_gen_ext32u_i64.

> +    tcg_gen_andi_i64(hh, hh, c << 32);
> +    tcg_gen_or_i64(t, hh, lh);

Nit: tcg_gen_deposit_i64(t, hh, lh, 0, 32);

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~

