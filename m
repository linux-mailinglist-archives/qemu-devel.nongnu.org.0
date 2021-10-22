Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 272854380C6
	for <lists+qemu-devel@lfdr.de>; Sat, 23 Oct 2021 01:57:24 +0200 (CEST)
Received: from localhost ([::1]:58234 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1me4Pa-0001aE-QT
	for lists+qemu-devel@lfdr.de; Fri, 22 Oct 2021 19:57:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55518)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1me4OJ-0008RL-Dp
 for qemu-devel@nongnu.org; Fri, 22 Oct 2021 19:56:03 -0400
Received: from mail-pg1-x530.google.com ([2607:f8b0:4864:20::530]:46662)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1me4OF-00015l-Vp
 for qemu-devel@nongnu.org; Fri, 22 Oct 2021 19:56:03 -0400
Received: by mail-pg1-x530.google.com with SMTP id m21so4657833pgu.13
 for <qemu-devel@nongnu.org>; Fri, 22 Oct 2021 16:55:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=j/wb0Z9Z7b/q1TIfw1o0ca10cAScTqb05YbT4MCnYac=;
 b=k7UBS9ocCr5SI8FwWlUN7qbY9hNoS8KEGppWeRK0Z5Q6Ij2XwKTnoML9xpkk+V1Xb/
 gHTN7LWDAvL7i6asD00hpGW4KFKBlx+XWJotcDF0NZEk/GEURHEy1bYaU7az9PlbZ01Y
 E5EUMjNL1j43Swy13zHZ5Gf2DRCwqDK3K/bompdHMyAOD3wpRJ17o/qSybmoYmHtapA7
 YbBCOsfybvBYJ5Ov/yAcEjyCg/vSfTNY8lxiXv1b+02R5xorYJ08HDdW1HZo/jGO/ONg
 HTKi0bgyODYXAZxMyatTl+M6QNK03csaZ2dFCFPZ7isww/O4stav6n4QPcgZQJdQ8MfG
 H5ZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=j/wb0Z9Z7b/q1TIfw1o0ca10cAScTqb05YbT4MCnYac=;
 b=0M4kRivjw00R7CvVgk69JWGdOi/xlvR5KeJoe7PpEzR7dU8eMABPfx3kLgDw6VrjK7
 YPtlofh6wYeTE6Z/q3i/s0hRi3cyC62PP3r4KKbLaI0iKXLWKqA2LZPhafkzVVGMa/ai
 XyA5bc9x3jj33S0o+qO3eQD7my1Of0wBYdPtc94T3lT/9P/guYlZSkv32pc6OsqcfOaF
 pK0+7kcwhpxLmfOF2pAXgngR3sJvnArrGNCQDGwuFpDJJHHgoN5TcOLZ3Y+TSTGjTk8Z
 5sA7jZAWjhP8+4hzKBsxVYDWDyaJgK5bKhWaMGl6QAe8lFOZz6ZiJ7w2r46KIr1YV4i4
 c7FQ==
X-Gm-Message-State: AOAM531ck4E6mallBFTpvqhrFmrrrMJLgMGt2tlMBZsMRTpyjg2Ziscc
 kkzyrS8yk9npak+BJR2S66W4nw==
X-Google-Smtp-Source: ABdhPJx4h3uzj8RmeVCzfnia7MkIcfxzgRh+uwHBaLxLbQfjNYz9NxY67KRc0mWCxTwPtsjI+DQQDQ==
X-Received: by 2002:a05:6a00:1a01:b0:47b:ae61:9bd1 with SMTP id
 g1-20020a056a001a0100b0047bae619bd1mr3170984pfv.0.1634946958275; 
 Fri, 22 Oct 2021 16:55:58 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.134.125])
 by smtp.gmail.com with ESMTPSA id t13sm9250840pgn.94.2021.10.22.16.55.57
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 22 Oct 2021 16:55:57 -0700 (PDT)
Subject: Re: [PATCH 08/33] target/ppc: Implement cnttzdm
To: matheus.ferst@eldorado.org.br, qemu-devel@nongnu.org, qemu-ppc@nongnu.org
References: <20211021194547.672988-1-matheus.ferst@eldorado.org.br>
 <20211021194547.672988-9-matheus.ferst@eldorado.org.br>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <d46f1cf0-a40f-c929-1fd3-49640230b159@linaro.org>
Date: Fri, 22 Oct 2021 16:55:56 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20211021194547.672988-9-matheus.ferst@eldorado.org.br>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::530;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x530.google.com
X-Spam_score_int: -37
X-Spam_score: -3.8
X-Spam_bar: ---
X-Spam_report: (-3.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.742,
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
Cc: lucas.castro@eldorado.org.br, luis.pires@eldorado.org.br, groug@kaod.org,
 david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 10/21/21 12:45 PM, matheus.ferst@eldorado.org.br wrote:
> +uint64_t helper_CNTTZDM(uint64_t src, uint64_t mask)
> +{
> +    uint64_t count = 0;
> +
> +    while (mask != 0) {
> +        if ((src >> ctz64(mask)) & 1) {
> +            break;
> +        }
> +
> +        count++;
> +        mask &= mask - 1;
> +    }
> +
> +    return count;
> +}

Similar to cntlzdm, we can use src & mask.

r~

