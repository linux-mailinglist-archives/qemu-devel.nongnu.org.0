Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D95A352BD7
	for <lists+qemu-devel@lfdr.de>; Fri,  2 Apr 2021 17:46:12 +0200 (CEST)
Received: from localhost ([::1]:54452 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lSLzu-0004Tk-Sc
	for lists+qemu-devel@lfdr.de; Fri, 02 Apr 2021 11:46:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34044)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lSLxt-0003ch-4M
 for qemu-devel@nongnu.org; Fri, 02 Apr 2021 11:44:05 -0400
Received: from mail-pl1-x634.google.com ([2607:f8b0:4864:20::634]:36433)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lSLxr-0006bd-FZ
 for qemu-devel@nongnu.org; Fri, 02 Apr 2021 11:44:04 -0400
Received: by mail-pl1-x634.google.com with SMTP id ay2so2687732plb.3
 for <qemu-devel@nongnu.org>; Fri, 02 Apr 2021 08:44:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:from:to:cc:references:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=m4Nyo3cgWJ+EvWnab7e+xuz5UrCzk1vnRp9FBEsyv5g=;
 b=d1Gq7XcAN/T4OBV99dSGTKRwMPwChjGyTtY1/eLMAb0SmbJFyZfk+16DQjr3j3TNyH
 GC0yau0aWAwY9yLueCWIcU/j79Js8uivLomC2cy/WNGzUFNVVn0r6MBs/oFAX4cVQelq
 HKIosq5hPCm5i7NtLo5A3ahzo5EWvE+DrGem1OixcDl2b62mD9U1oY3SfKp1SJh7VIN3
 +SVuP2F6J3ezKd1ffRcOiKpSPhzaqkVTO+gzL+qmdM9C15fqOroS46Rb7FDGlVbNZUqH
 L41/keAl5eeSHtWzR88Eaxnkee4HRz7UdhbL3jgtGMofhz5vB3z3D3LERh7+HD9BbsMb
 ppdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:from:to:cc:references:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=m4Nyo3cgWJ+EvWnab7e+xuz5UrCzk1vnRp9FBEsyv5g=;
 b=IUSJh1q8s8rAGeFPHlDbrFPWj29b8g5+gfNLA4pcZoV/wHh6F+zWOntr4k+TQmEy5J
 tp+hVv90iOhDdvFTicoQC7ijIA04aAjIM5bw1NKiCFXjUucKSsNXEtH64MxVI+pw1K+F
 i9XefFY942zga38LPhMzQePIhMFFrea5kSIVPdI8usKs5TgYP9YzKyNentWrLfpGm9xz
 DVgtZo33BDI8uUM3nl5Cn55jD6JbnYMhG5LGdne97C7X6PG/Sr9Oj2U0SMn8dz15Aiv4
 Hbjrkr7z/oRTtw+GsxAQAxAqqEi5uf9Unk3uxz1qEPWDYHG8aphhvXXE9Usj7hmN3ze6
 G+xA==
X-Gm-Message-State: AOAM530n1fTRYqPnXDXTNgd6oDjDq/kPnZw74qY6MSYqssfDt4zK5idM
 rpz6GuB3O20Em1zNOSvkv6k1xw==
X-Google-Smtp-Source: ABdhPJyLnJoBvLgpDQMx6RpmhOW2ieCKDJT6B9pouvcY5uQFdNod7rPiUV/tj4jjurU0r1SnZ2hXOA==
X-Received: by 2002:a17:90b:d85:: with SMTP id
 bg5mr14366095pjb.230.1617378241681; 
 Fri, 02 Apr 2021 08:44:01 -0700 (PDT)
Received: from [192.168.44.35]
 (h216-228-167-147.bendor.dedicated.static.tds.net. [216.228.167.147])
 by smtp.gmail.com with ESMTPSA id a191sm8755036pfa.115.2021.04.02.08.44.00
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 02 Apr 2021 08:44:01 -0700 (PDT)
Subject: Re: [PATCH 2/2] target/arm: Fix unaligned mte checks
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
References: <20210402053728.265173-1-richard.henderson@linaro.org>
 <20210402053728.265173-3-richard.henderson@linaro.org>
Message-ID: <a1b871d0-8190-5c27-b35d-55da78094ad1@linaro.org>
Date: Fri, 2 Apr 2021 08:43:56 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <20210402053728.265173-3-richard.henderson@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::634;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x634.google.com
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
Cc: qemu-arm@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 4/1/21 10:37 PM, Richard Henderson wrote:
>   TCGv_i64 gen_mte_checkN(DisasContext *s, TCGv_i64 addr, bool is_write,
> -                        bool tag_checked, int log2_esize, int total_size)
> +                        bool tag_checked, int total_size)
>   {
> -    if (tag_checked && s->mte_active[0] && total_size != (1 << log2_esize)) {

Doh, lost part of this check.


r~

