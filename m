Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 834BC438551
	for <lists+qemu-devel@lfdr.de>; Sat, 23 Oct 2021 22:36:13 +0200 (CEST)
Received: from localhost ([::1]:53032 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1meNkS-0000Dm-5c
	for lists+qemu-devel@lfdr.de; Sat, 23 Oct 2021 16:36:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53378)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1meNiz-0007yG-C9
 for qemu-devel@nongnu.org; Sat, 23 Oct 2021 16:34:41 -0400
Received: from mail-pj1-x1033.google.com ([2607:f8b0:4864:20::1033]:45665)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1meNix-0005XJ-7D
 for qemu-devel@nongnu.org; Sat, 23 Oct 2021 16:34:40 -0400
Received: by mail-pj1-x1033.google.com with SMTP id
 ls14-20020a17090b350e00b001a00e2251c8so5450313pjb.4
 for <qemu-devel@nongnu.org>; Sat, 23 Oct 2021 13:34:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=ne8nkJNvSnY42BIyLFW776YloKrwDKAZcYBg6BkF2OI=;
 b=Jpb5ommRJbpZ0KDI2p1xWZnl//h0eXdP1MMBfkGMuVBzd17Jf4cUEkGR36SMbEOI05
 ba0uNAd9aRaj784PThmkGpSBeq+NS6D1BMZTK6PsVnulCRstmC5WaIOzx/s5ss95ImhM
 zyCcucYAHxKH7w0ONcZAvN41n3Sb0pTnqOC1o3aovikFEI1+Zb2tHh5Mgj/qEMXYuCcu
 O0Y0rBshB2SwdZK+KzC7QpQX85OBncgnKN31PTVJa4TfqdPXoiEafXAo7NpTT/nfArMa
 nOUFkX9EZs09ecOJekcb9HOkc359bkXWUaJPJi51slIJSTOeKIVRjrKlABiqUoa10dJu
 zaXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=ne8nkJNvSnY42BIyLFW776YloKrwDKAZcYBg6BkF2OI=;
 b=QfaocFt8CqATwkWx8+AA11KQRr+mSgGYY5QPk14+1VgUBi78R1V6uP/MWYjPdeGASd
 Z2VF2ECj5cB73GwbSyBUCZrzYGbVHLS4nTOjnKol2zHwr0BuKwHtllCqg+aYC+LAKziZ
 Q+mOpvuwgO/O9mHwIZFsXdtYz4TBhBeg1+BUMhXFT0FV0uJIlAaHbtHXF1/wQFcLl8ip
 ndFSyCUnHxLbZD8dRzqDQkY4Yc37oKn+RWU89qQwHB2NqmJJqBANsS7MC+GAjClxBP/p
 mdXCV0M8OMksu1h5Nr4PxWCjzF7Xf7iP1rm1is49gQVhRlqJqxIu7n0MmXT/g1VwjS1H
 UnnQ==
X-Gm-Message-State: AOAM530qlK1liJUU/Y37rCkMpnuEGb6Uvjb8rwg424sydwHlPtg1Plqo
 5xKYaI5lJNsJ70FFrddK/HW3tw==
X-Google-Smtp-Source: ABdhPJwMjBIjfReSY5LwAdi413Aqff9AAbFKRFRpTa0P8S3fDSVbUMKn59jyxYKu9piNn/IE9s962A==
X-Received: by 2002:a17:90b:33c3:: with SMTP id
 lk3mr9105508pjb.237.1635021277531; 
 Sat, 23 Oct 2021 13:34:37 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.134.125])
 by smtp.gmail.com with ESMTPSA id nv5sm15310629pjb.10.2021.10.23.13.34.36
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 23 Oct 2021 13:34:37 -0700 (PDT)
Subject: Re: [PATCH 21/33] target/ppc: moved stxv and lxv from legacy to
 decodtree
To: matheus.ferst@eldorado.org.br, qemu-devel@nongnu.org, qemu-ppc@nongnu.org
References: <20211021194547.672988-1-matheus.ferst@eldorado.org.br>
 <20211021194547.672988-22-matheus.ferst@eldorado.org.br>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <092b768f-5805-e886-f2ca-66e69a0af9bc@linaro.org>
Date: Sat, 23 Oct 2021 13:34:34 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20211021194547.672988-22-matheus.ferst@eldorado.org.br>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1033;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1033.google.com
X-Spam_score_int: -38
X-Spam_score: -3.9
X-Spam_bar: ---
X-Spam_report: (-3.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.781,
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
Cc: lucas.castro@eldorado.org.br, luis.pires@eldorado.org.br, groug@kaod.org,
 david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 10/21/21 12:45 PM, matheus.ferst@eldorado.org.br wrote:
> +static bool do_lstxv(DisasContext *ctx, int ra, int displ,
> +                     int rt, bool store)

You need an int64_t displ before you add PLXV et al.  What happened to passing in arg_D as 
for the other integer instructions?

> +    do_ea_calc(ctx, ra, tcg_const_tl(displ), ea);
> +
> +    if (ctx->le_mode) {
> +        gen_addr_add(ctx, ea, ea, 8);
> +        offset = -8;
> +    } else {
> +        offset = 8;
> +    }

Adjust displ for le_mode, then you don't have to do the addition twice.


r~

