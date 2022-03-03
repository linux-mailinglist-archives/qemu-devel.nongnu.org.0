Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 12F9E4CC609
	for <lists+qemu-devel@lfdr.de>; Thu,  3 Mar 2022 20:31:39 +0100 (CET)
Received: from localhost ([::1]:55824 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nPrAn-00039p-Rx
	for lists+qemu-devel@lfdr.de; Thu, 03 Mar 2022 14:31:37 -0500
Received: from eggs.gnu.org ([209.51.188.92]:33720)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nPqzH-0006au-Fy
 for qemu-devel@nongnu.org; Thu, 03 Mar 2022 14:19:43 -0500
Received: from [2607:f8b0:4864:20::635] (port=39922
 helo=mail-pl1-x635.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nPqzF-0003ED-GO
 for qemu-devel@nongnu.org; Thu, 03 Mar 2022 14:19:43 -0500
Received: by mail-pl1-x635.google.com with SMTP id 9so5586724pll.6
 for <qemu-devel@nongnu.org>; Thu, 03 Mar 2022 11:19:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=3TOfhBWLSCDRDOsMHpPCunvvvEo7/nEoJ4NzeVKX1jY=;
 b=E+1FEw9sa7h0cBKGOzssF1MvAJ0XgtTmCPofPkFE9hKalAi9p9scPZ0CmX/43nNUbi
 mPcVw1/z9nPktqF6WaUKzzoUO84gj5F71GrAHIeMthhiAB6ydG3eFsewVLBJkvCKsEuE
 Ylz+eVzPBT1Pt20NhBBO/gJgOhkaXXDiWAO+/vgVGgC4eqxPedjN0AZcurh/bZnbr77Q
 +qzmPES/AnPC7f9eH1HI024w7XGC6y5UVAedYF8KQ1opBjWEzEDVM6cOYCIzr6u/SvKz
 anXDB9U2LsZzcXO8pPZyJ6+W00MEP1sQRXsDgh661bTfpd44B3/Wn9Qa3nRb2ySvbU49
 emEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=3TOfhBWLSCDRDOsMHpPCunvvvEo7/nEoJ4NzeVKX1jY=;
 b=VGACI2jdFsUPA8ibiZ7QKWX0wQzOQ62QfEdrjn5ktkxqvYPeyMxpmBBeWLk02ezzEu
 GAnAo4+jZq+hNwmUwEGgoxMw0J10VRS/M7OoN3zPs1ejB/yfcnuEMKSdflytpUsDVY8f
 1aO4aKHkMUj19dOjj+mCBZPy79twkdOHH6uoJkMEktjxmjfxjuXDKgcuBus8bprfrFbV
 9VexcLAfv5MK46lB2nUGHOuV7phc+NAiUmg3uFyJKg+Nj2pZRZk6OOli1fCrmzN+NS9a
 F/OdhPWZw/Gcy0HKtM8rxUwVooDeGGToUSoE4Kns9EfyV792LVuXLGXHA9VuDA2R8C/q
 Lzkg==
X-Gm-Message-State: AOAM5334iVGP2wh2vkP8T/XHNyeCVYhNN+6jJwVLMH0hbeCFXl9cQYl9
 rViJyhm1M6P+IfUsN+QayCvyAQ==
X-Google-Smtp-Source: ABdhPJx+PPEdA1b6oXE1aOlaZJQYvxEZp2SNkFgmgie++yIpbpYTkCx2dqMmNDbQ2+4ZrD/xlrbYIg==
X-Received: by 2002:a17:90b:1d09:b0:1be:f949:4103 with SMTP id
 on9-20020a17090b1d0900b001bef9494103mr6888549pjb.150.1646335179197; 
 Thu, 03 Mar 2022 11:19:39 -0800 (PST)
Received: from ?IPV6:2603:800c:1201:c600:119c:490c:a4ee:8e8?
 (2603-800c-1201-c600-119c-490c-a4ee-08e8.res6.spectrum.com.
 [2603:800c:1201:c600:119c:490c:a4ee:8e8])
 by smtp.gmail.com with ESMTPSA id
 m6-20020a056a00080600b004e1bb196743sm3455321pfk.5.2022.03.03.11.19.37
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 03 Mar 2022 11:19:38 -0800 (PST)
Message-ID: <9e7132f7-0bc7-24c9-09f3-abc32e0871de@linaro.org>
Date: Thu, 3 Mar 2022 09:19:35 -1000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [RFC PATCH v2 4/5] tests/tcg/ppc64le: emit bcdsub with .long when
 needed
Content-Language: en-US
To: matheus.ferst@eldorado.org.br, qemu-devel@nongnu.org, qemu-ppc@nongnu.org
References: <20220303172041.1915037-1-matheus.ferst@eldorado.org.br>
 <20220303172041.1915037-5-matheus.ferst@eldorado.org.br>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220303172041.1915037-5-matheus.ferst@eldorado.org.br>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::635
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::635;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x635.google.com
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
Cc: thuth@redhat.com, danielhb413@gmail.com, groug@kaod.org,
 philippe.mathieu.daude@gmail.com, clg@kaod.org, mrezanin@redhat.com,
 alex.bennee@linaro.org, david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 3/3/22 07:20, matheus.ferst@eldorado.org.br wrote:
> From: Matheus Ferst<matheus.ferst@eldorado.org.br>
> 
> Based on GCC docs[1], we use the '-mpower8-vector' flag at config-time
> to detect the toolchain support to the bcdsub instruction. LLVM/Clang
> supports this flag since version 3.6[2], but the instruction and related
> builtins were only added in LLVM 14[3]. In the absence of other means to
> detect this support at config-time, we resort to __has_builtin to
> identify the presence of __builtin_bcdsub at compile-time. If the
> builtin is not available, the instruction is emitted with a ".long".
> 
> [1]https://gcc.gnu.org/onlinedocs/gcc-8.3.0/gcc/PowerPC-AltiVec_002fVSX-Built-in-Functions.html
> [2]https://github.com/llvm/llvm-project/commit/59eb767e11d4ffefb5f55409524e5c8416b2b0db
> [3]https://github.com/llvm/llvm-project/commit/c933c2eb334660c131f4afc9d194fafb0cec0423
> 
> Signed-off-by: Matheus Ferst<matheus.ferst@eldorado.org.br>
> ---
>   tests/tcg/ppc64le/bcdsub.c | 55 +++++++++++++++++++++-----------------
>   1 file changed, 30 insertions(+), 25 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

