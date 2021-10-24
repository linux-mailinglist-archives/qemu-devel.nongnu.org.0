Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 16473438B1A
	for <lists+qemu-devel@lfdr.de>; Sun, 24 Oct 2021 19:51:47 +0200 (CEST)
Received: from localhost ([::1]:54900 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1meher-0002EV-W8
	for lists+qemu-devel@lfdr.de; Sun, 24 Oct 2021 13:51:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58522)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mehWF-00046v-N6
 for qemu-devel@nongnu.org; Sun, 24 Oct 2021 13:42:53 -0400
Received: from mail-pj1-x1030.google.com ([2607:f8b0:4864:20::1030]:56109)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mehWD-0004UL-Lr
 for qemu-devel@nongnu.org; Sun, 24 Oct 2021 13:42:51 -0400
Received: by mail-pj1-x1030.google.com with SMTP id om14so6520785pjb.5
 for <qemu-devel@nongnu.org>; Sun, 24 Oct 2021 10:42:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=K3fdHQm20dG5vSORWf9UqcLamhM1usP2JM8G8qWjMK4=;
 b=cCIFthMb/PQixzoov7xysX+8gvzgbdKmm8ByzC2DTY2HUr5Ac+2eW6BcfAQFmlQw25
 aRFGMl/TP4BjqdGj7VETlii/Lz+PLGSZ+21ka6v9AwOOFPt4JzQPz93V03xk1bAQXm8i
 ZWObgQGU+rSgmWnRTbkt7a1Ivq3v3mx2dfo5lVTQUQOD3gC0yJE6RjvjueANggbutm3j
 LpUS+98Y4F682HwT6BD7aIjZDajlJiGhVJB7ekwCDbZJSKhle2T95UuBuDN41SvFkac3
 oBPHDTNJmGUuNH6BCLqMz6+Uf1Kgx5Y0PwR+kT51FxXJw3SiqE51zBKgatLOwfXIh0aV
 yO8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=K3fdHQm20dG5vSORWf9UqcLamhM1usP2JM8G8qWjMK4=;
 b=NRc1bPqfgwdOU1PyvsYkFBTFsl1+7FyMUTG8yNG3dyFa9j6My661H68AJGdWgF+cpZ
 HqlzX3B315nBwV1Hc6bliGMdNlmEPwvVSlo31/xWk/H+CcgxiF98b1fzdubBgJ1oqsIA
 UP1Y7dlzZfXwkIerktWZDczKXCHQR9S1IM3KhLGTV0X1s/9er8GoEXmw6GVXiCCO//H3
 CF871GtJmVlXzpaw0Z1boqIhY1sL9pRPdnEVjTltFJt+v5ENSRrCDFhzgJW/NTq7ET3q
 grGgqTCLiH9dIBBf9WoB6K2lVameHxZsIaKHDfzwYLKdp8dtOyYYdjdSY6eEoYH5XTBJ
 RcwQ==
X-Gm-Message-State: AOAM533iIqk6h8k3Wpzl0tCoD7mKhGaqTFauJNebdrm6lgN7tVLY1OwH
 +440pH8GqGuSxiON5pzgEOlhfjMO0Hh9PA==
X-Google-Smtp-Source: ABdhPJw/F2fh4zsW67MJndOnTEU1elCEf4BBT/VpOtChH2yJHEew19rKd2Sp+KwJyEiQk3xrq3nH3A==
X-Received: by 2002:a17:903:41c1:b0:13e:fe56:e42a with SMTP id
 u1-20020a17090341c100b0013efe56e42amr11451759ple.52.1635097368070; 
 Sun, 24 Oct 2021 10:42:48 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.134.125])
 by smtp.gmail.com with ESMTPSA id 141sm3082253pge.23.2021.10.24.10.42.47
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 24 Oct 2021 10:42:47 -0700 (PDT)
Subject: Re: [PATCH 21/33] target/mips: Convert MSA 3RF instruction format to
 decodetree (DF_WORD)
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
References: <20211023214803.522078-1-f4bug@amsat.org>
 <20211023214803.522078-22-f4bug@amsat.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <200d4ff8-e904-530c-592a-18fb24f1d357@linaro.org>
Date: Sun, 24 Oct 2021 10:42:46 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20211023214803.522078-22-f4bug@amsat.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1030;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1030.google.com
X-Spam_score_int: -53
X-Spam_score: -5.4
X-Spam_bar: -----
X-Spam_report: (-5.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-3.33,
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
Cc: Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Luis Pires <luis.pires@eldorado.org.br>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 10/23/21 2:47 PM, Philippe Mathieu-Daudé wrote:
> Convert 3-register floating-point or fixed-point operations
> to decodetree.
> 
> Signed-off-by: Philippe Mathieu-Daudé<f4bug@amsat.org>
> ---
>   target/mips/tcg/msa.decode      |  37 ++++++
>   target/mips/tcg/msa_translate.c | 213 ++++++--------------------------
>   2 files changed, 74 insertions(+), 176 deletions(-)

With the decode fixed as per the previous,
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

