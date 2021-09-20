Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 384C8411D70
	for <lists+qemu-devel@lfdr.de>; Mon, 20 Sep 2021 19:19:09 +0200 (CEST)
Received: from localhost ([::1]:42266 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mSMwe-0004OT-0X
	for lists+qemu-devel@lfdr.de; Mon, 20 Sep 2021 13:19:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48574)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mSMtW-0002sQ-44
 for qemu-devel@nongnu.org; Mon, 20 Sep 2021 13:15:55 -0400
Received: from mail-pl1-x62f.google.com ([2607:f8b0:4864:20::62f]:35734)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mSMtD-0004qM-Fx
 for qemu-devel@nongnu.org; Mon, 20 Sep 2021 13:15:50 -0400
Received: by mail-pl1-x62f.google.com with SMTP id bb10so11530817plb.2
 for <qemu-devel@nongnu.org>; Mon, 20 Sep 2021 10:15:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-language:content-transfer-encoding;
 bh=96HPFLgKalZdcosVQCCgwYyK1K42HexoIEqCC0Bnf7M=;
 b=mCr7bafYnKdhUqnHmQSaIo0ZjKwwZdsU19/1cQQuSm2Sni6P63zzeK7YHVxm30JGyg
 UEzZGrLyK+pm1Mx9F1wPnio2hq5mev1QuR3Dw5P7Kdysj7IqVu+qYAc08ZL97JJwlz1f
 0OFIvAquYzeZw6RxtvfaudXrwGf1aTs/GA3NhStdOMuGS+bd71+EyNkZ1JYQwHffL1hY
 aslqNoAKdhYSDoDEo4H4VyjgVlqfxYliv4R/B8IXnY81v+y3InueCf3ZnS4i2SC9+Kgx
 C7vbXvAVCkNvS/GBUobZXVv+WT5b3ZbNTe8VUD1UJmd6vqCzd8xsC5aaw1DUeAXlttVI
 XLog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=96HPFLgKalZdcosVQCCgwYyK1K42HexoIEqCC0Bnf7M=;
 b=qJ6lMaY7CYeb1GKbRfUm5QiWVD9C3a+m5lX41FYkQzK1N3lyw9evslro8moczhCxAP
 aPjWbA8dRtkGPyYni+8q8Vrwf6EqJURe06uovLxj3FWmB/1bJYfp4tQXX04bzZqk0PZB
 /0xtviYlSo9soPt7Dycnj5BywUHWgGiDIEC8wQGIcT8HDV/rFfaPBdrTv1jHj85RPhV6
 Le1QnKi859HmKplABA2GM1ktVCBGVeZD3TAp12qPOiRID8AVa7+99PASwPxrARXlgBkb
 5X9KLv6CXgDyj9c2rwyHoadbpGPnwvOaa5mZX9gDRVVSKXorcsgL9QEGAo3kuZ5drahx
 5YEA==
X-Gm-Message-State: AOAM532a0aCIOm2gd6KIr4Gy+2mXMFJevPpUWLobXI5Zg+HRwujeBv1F
 wp8AmNQc4NrvKkg+XZ8lhtu6GU2cdp3KsQ==
X-Google-Smtp-Source: ABdhPJwtY36Xf6Jj6rBKALRPs3mivjLGvEsrKp5pDMPATNsKB8VIbEVXWpb7w4Txushze50cov2cig==
X-Received: by 2002:a17:902:a982:b0:13a:8c8:8a30 with SMTP id
 bh2-20020a170902a98200b0013a08c88a30mr23595624plb.86.1632158132550; 
 Mon, 20 Sep 2021 10:15:32 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.134.125])
 by smtp.gmail.com with ESMTPSA id s90sm68453pjd.12.2021.09.20.10.15.32
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 20 Sep 2021 10:15:32 -0700 (PDT)
Subject: Re: [PATCH 24/30] tcg/loongarch: Implement tcg_target_qemu_prologue
To: WANG Xuerui <git@xen0n.name>, qemu-devel@nongnu.org
References: <20210920080451.408655-1-git@xen0n.name>
 <20210920080451.408655-25-git@xen0n.name>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <56ae166a-3cdd-3107-bae2-4068920134f9@linaro.org>
Date: Mon, 20 Sep 2021 10:15:30 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20210920080451.408655-25-git@xen0n.name>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62f;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62f.google.com
X-Spam_score_int: -16
X-Spam_score: -1.7
X-Spam_bar: -
X-Spam_report: (-1.7 / 5.0 requ) BAYES_00=-1.9, DKIM_INVALID=0.1,
 DKIM_SIGNED=0.1, NICE_REPLY_A=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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

On 9/20/21 1:04 AM, WANG Xuerui wrote:
> +#if !defined(CONFIG_SOFTMMU)
> +    tcg_out_movi(s, TCG_TYPE_PTR, TCG_GUEST_BASE_REG, guest_base);
> +    tcg_regset_set_reg(s->reserved_regs, TCG_GUEST_BASE_REG);
> +#endif

Should test for guest_base == 0.  This is common for a 64-bit guest.

Otherwise,
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~

