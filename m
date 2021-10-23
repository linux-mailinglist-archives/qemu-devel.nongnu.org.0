Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0AB974381E0
	for <lists+qemu-devel@lfdr.de>; Sat, 23 Oct 2021 06:41:29 +0200 (CEST)
Received: from localhost ([::1]:43598 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1me8qW-0005uB-6J
	for lists+qemu-devel@lfdr.de; Sat, 23 Oct 2021 00:41:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55702)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1me8pP-0004zN-5h
 for qemu-devel@nongnu.org; Sat, 23 Oct 2021 00:40:19 -0400
Received: from mail-pj1-x102c.google.com ([2607:f8b0:4864:20::102c]:52197)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1me8pM-0000Qd-Jt
 for qemu-devel@nongnu.org; Sat, 23 Oct 2021 00:40:18 -0400
Received: by mail-pj1-x102c.google.com with SMTP id u12so239121pjy.1
 for <qemu-devel@nongnu.org>; Fri, 22 Oct 2021 21:40:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=hdPBvaosZo4iMbwhHvFFpqta/H3s/cWZ+MMrxX2uTso=;
 b=r5zyiN074vBxSXAuRpM/zJgidgyfXeUskzEAj5ntFcp5xqNnGsGFcOXtuSA6/eLCKy
 9DJWuJ3yaGKiEZ4UJlGcL7UOmq2G40LunKeBEg9DsNe5TX9nm1s/x+IcWsvVEYQcmq53
 V+NBxTh/F7xZcoSu1e3cbA+lbNRTeQvo5atySwFvB5yEzTJRZTAtRssfNh8xIAYAFRkS
 A4smTYCnjEW1xb/JOpnUeV+BL9/LSAuY6v0uzvSP4Sh9J/gqWB1RBQU5wAx30/jp3n70
 4uhP86GLRIxA7P1Js1JOV4KzjFRLiizLdUiZaEn9GljuDm431fBSmhg9XEyFVJeHy8li
 vwhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=hdPBvaosZo4iMbwhHvFFpqta/H3s/cWZ+MMrxX2uTso=;
 b=Dg2BcPw5wJh2ff6nFrGGjpUQNU5sr5mGF5tw8/KPUECthOqaDVW7xfL/mhiXkPytZG
 1PhtwwDqEJ3yjaL5NOthlMjKyVFTsdH+VnV2+YfQIPAEl2e/fRwEGYSl54lx3qbaWvzk
 VYgj5g07ydeSJNhhlJX1Gh4eXi8gisRUhkq9qut0XSSXltIMybq7B2TYLVntxBHItdPC
 ymqfRtoAYP9yhKB6tlNLhhB0syAkiP8TwSoh27jPCdieeSI9zqclo9Tpk/h3KPuYpBq7
 RpnUbzBUT3aIszzb6YGgjuPd/r97z3O3RxKNpu0LoSQj4qXT87GQ6TZEQPu/Ps66oqX/
 fxnQ==
X-Gm-Message-State: AOAM532aGt/COOnVb3EzMMHn/1GOlKHuEnRHcqxbLACguLonN8Qz4+W2
 XhOgv1x4wb7aCCq/pKt+XxsCrA==
X-Google-Smtp-Source: ABdhPJy6gHJkHOz07wVAwgsRaKX2cTw5iYOkhWEfq9LuA0YgcBG33KS1+AT80OyYg9AT51rHMrKRmA==
X-Received: by 2002:a17:90b:4c0e:: with SMTP id
 na14mr19342357pjb.195.1634964015083; 
 Fri, 22 Oct 2021 21:40:15 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.134.125])
 by smtp.gmail.com with ESMTPSA id g21sm4680378pfv.127.2021.10.22.21.40.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 22 Oct 2021 21:40:14 -0700 (PDT)
Subject: Re: [PATCH 15/33] target/ppc: Implement Vector Insert from GPR using
 GPR index insns
To: matheus.ferst@eldorado.org.br, qemu-devel@nongnu.org, qemu-ppc@nongnu.org
References: <20211021194547.672988-1-matheus.ferst@eldorado.org.br>
 <20211021194547.672988-16-matheus.ferst@eldorado.org.br>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <0581a10f-1411-a174-5869-4fe0999132f3@linaro.org>
Date: Fri, 22 Oct 2021 21:40:13 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20211021194547.672988-16-matheus.ferst@eldorado.org.br>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102c;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102c.google.com
X-Spam_score_int: -37
X-Spam_score: -3.8
X-Spam_bar: ---
X-Spam_report: (-3.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.742,
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
> +#if defined(TARGET_PPC64)
> +    return do_vinsx(ctx, a->vrt, size, right, cpu_gpr[a->vra], cpu_gpr[a->vrb],
> +                    gen_helper);
> +#else
> +    bool ok;
> +    TCGv_i64 val;
> +
> +    val = tcg_temp_new_i64();
> +    tcg_gen_extu_tl_i64(val, cpu_gpr[a->vrb]);
> +
> +    ok = do_vinsx(ctx, a->vrt, size, right, cpu_gpr[a->vra], val, gen_helper);
> +
> +    tcg_temp_free_i64(val);
> +    return ok;
> +#endif

Oh, and what's all this?

Either this isn't defined for !PPC64 at all, or you should just use target_ulong and not 
do any ifdeffing at all.

r~

