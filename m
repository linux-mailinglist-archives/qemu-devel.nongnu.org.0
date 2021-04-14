Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6917635FBDC
	for <lists+qemu-devel@lfdr.de>; Wed, 14 Apr 2021 21:50:12 +0200 (CEST)
Received: from localhost ([::1]:48126 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lWlWd-0004Qu-II
	for lists+qemu-devel@lfdr.de; Wed, 14 Apr 2021 15:50:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60674)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lWlUa-0003lE-Al
 for qemu-devel@nongnu.org; Wed, 14 Apr 2021 15:48:04 -0400
Received: from mail-pg1-x536.google.com ([2607:f8b0:4864:20::536]:36398)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lWlUU-0003vd-Gw
 for qemu-devel@nongnu.org; Wed, 14 Apr 2021 15:48:02 -0400
Received: by mail-pg1-x536.google.com with SMTP id j7so5771217pgi.3
 for <qemu-devel@nongnu.org>; Wed, 14 Apr 2021 12:47:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=m/Z2dnExEjeM/q0Pm5kbbPtblBD6hUliE3eVZC6Dt2Y=;
 b=o9ySFilLcI5BdOre3AO371cXH/Vr7WTwzmoIOppCzCW0MdInvdUlLvhJBJbfAqScoU
 KIk4sT2OkpYImzqLdfd0ELin5zVYy+SbxitCmuC41gw8z/diwfRGLrcoiZsDH8m/PKxD
 C//EZJsXG3t0Tums44uQp7RRbdtp9huqJh5dWMfGoqTqKdB0wUuj61/3bD5WF0Fj4rZq
 TmTzTFvfPzHm+IxLoRkizWrQus1xfABud3yC2MvmEtY5kYeHLL1QH10jLKvsy9R0ULcg
 ipBlc6OZVnSo7h3XyrQqJIj/7siZQ5zg2TB8Cgm//7nAOvsutttHnR07N5c8Vp6o7Baa
 tpiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=m/Z2dnExEjeM/q0Pm5kbbPtblBD6hUliE3eVZC6Dt2Y=;
 b=Y1up0vcDrA/oe4hrl5nIFYlO7/9UEwaJv6lPI4V9CtgFFGa5MkPNKAL4agKpSbQN8J
 d5szLSwsa2CHD8U+NGyiX9tFEB8Yr/HiZgzBvcckIJNxc4DSfkpmr7QnZ/+0RdlrOOdK
 TT1oHDn4/FMAwhhWOlsohGi/Fy0QspWxtT35H9VnF4YPl98IyhmIeYdaMp/o4Keul2I1
 MXc+HLCEs5GGTwpbmkgJ7yO1zlzNIAd4So4OBgtt3RckZKMjtnOVZ40okxJDBJqE9pQr
 cT1GK/rlQnrFtydwo0cj4iEiBrSXmg4kKiKifvKExch1yizlSN1JnizriteFTqSNWSIR
 ZgEg==
X-Gm-Message-State: AOAM5317BhuhQIirdXm5/bGJ0jE+eGFsiEBA6EFS1nPrg5LDwnQoutAv
 3YafK7FrS4LdleSvExjhSEyV4A==
X-Google-Smtp-Source: ABdhPJwshPSCHsc2+IyDelBLE8Q6teHLbEVyKoJZyoR0BAAllWxlGUTm9OOwoOD1CmjZPv2vb3R6FQ==
X-Received: by 2002:a63:f95a:: with SMTP id q26mr39327651pgk.25.1618429676758; 
 Wed, 14 Apr 2021 12:47:56 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.131.83])
 by smtp.gmail.com with ESMTPSA id h6sm202490pfb.157.2021.04.14.12.47.55
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 14 Apr 2021 12:47:56 -0700 (PDT)
Subject: Re: [PATCH 2/5] decodetree: Fix empty input files for varinsnwidth
To: Luis Pires <luis.pires@eldorado.org.br>, qemu-devel@nongnu.org,
 qemu-ppc@nongnu.org
References: <20210413211129.457272-1-luis.pires@eldorado.org.br>
 <20210413211129.457272-3-luis.pires@eldorado.org.br>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <57bb161d-6e28-c0d5-d0c5-12fff2efdb74@linaro.org>
Date: Wed, 14 Apr 2021 12:47:54 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <20210413211129.457272-3-luis.pires@eldorado.org.br>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::536;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x536.google.com
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
Cc: lagarcia@br.ibm.com, bruno.larsen@eldorado.org.br,
 matheus.ferst@eldorado.org.br, f4bug@amsat.org, david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 4/13/21 2:11 PM, Luis Pires wrote:
> Decodetree would throw an error when the input file was empty
> and --varinsnwidth was specified.
> 
> Signed-off-by: Luis Pires<luis.pires@eldorado.org.br>
> ---
>   scripts/decodetree.py | 11 ++++++-----
>   1 file changed, 6 insertions(+), 5 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


> +        if self.width is not None:
> +            if extracted < self.width:

Is it too ugly to use AND here?


r~

