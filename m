Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9925743D1E5
	for <lists+qemu-devel@lfdr.de>; Wed, 27 Oct 2021 21:52:03 +0200 (CEST)
Received: from localhost ([::1]:46144 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mfoxu-00016O-5l
	for lists+qemu-devel@lfdr.de; Wed, 27 Oct 2021 15:52:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37544)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mfoQz-0007Vs-Il
 for qemu-devel@nongnu.org; Wed, 27 Oct 2021 15:18:01 -0400
Received: from mail-pj1-x102b.google.com ([2607:f8b0:4864:20::102b]:37674)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mfoQt-0004Rs-5d
 for qemu-devel@nongnu.org; Wed, 27 Oct 2021 15:18:01 -0400
Received: by mail-pj1-x102b.google.com with SMTP id
 t5-20020a17090a4e4500b001a0a284fcc2so5948598pjl.2
 for <qemu-devel@nongnu.org>; Wed, 27 Oct 2021 12:17:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=eTD3+pYlS3sPLLaO0r/Ke3uZaF5f8BrfbGu21xSs1LY=;
 b=X/MrpJVgSFW2eTj3hONsp+HLOSRG/E/LcuWfJKvPYoih9KEhDfE2PzQ7NrXnKBKJmO
 yJMpcFHMjkKXCrIbNKP8CnPLyhmWztZ4K/oJQkHxLkKceRwBmRXSDP6mefRwMFpAxG+j
 WH52BLVoi4FMrXysYJTmhHrNtWYKAQ005xRAnmQbPEyPiYJzJ2N1bTHHSmfPSF83BAdt
 u/hoaYD9l97GoMJ2T23OnuI+r0tiEb/xL2ZBeUBe9UFunFrbVgEiSlgcnu7Kzy2f20LQ
 ChLF1GwEGr3ti55osH9TSR/RMD8M+wfKkuLBcPkEu2zVGv1w0XqpkR7EGlazhWFLSqla
 +3QQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=eTD3+pYlS3sPLLaO0r/Ke3uZaF5f8BrfbGu21xSs1LY=;
 b=lntDhsSOxMqKxnj7WNpOogFroB/x9/N6dw2cU0FZQIrDa3xBFk7UXvYDc6oqhEQuY9
 sgkJG5SpnIDDKMezw9Mql6tWg578HwVc5t+pfXQIqiTs/aVAMjrs/z74ghvBDgiza/2l
 83/M2OM0cvR0ixCKVpXZwVNlBW7TaNm+JbGJeQ1nPAchPqWPY0SxRG/NHC/q4wr8y/H8
 K3C7xUcx9RMNGn2o/4yBNB/5Riw54oBFmoxO8JRryKc0wtUUNLZdgk66PM0TjpLjZvgi
 GpP40TA8JL5NlAa2TtYYXNposDMkRfCxS/UD+AEBe7w+N5O56uB5sRXwY1s4poZ/tREm
 mWtg==
X-Gm-Message-State: AOAM530i71O1cvscqAYDvADzBP26+hkozmsEape5i/n6wknWjH6Mg5Yb
 mwfWtUeV5GJpeWkB6fEI12PK6w==
X-Google-Smtp-Source: ABdhPJwiIup3zcFi8HXiASCtA1J9bjQ28rPqQ72UBJDqOYzA1P7ME7JSRHsO2DOMdYN7pKwOkca40A==
X-Received: by 2002:a17:90b:4b48:: with SMTP id
 mi8mr7827380pjb.57.1635362272474; 
 Wed, 27 Oct 2021 12:17:52 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.134.125])
 by smtp.gmail.com with ESMTPSA id i128sm698887pfc.47.2021.10.27.12.17.51
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 27 Oct 2021 12:17:51 -0700 (PDT)
Subject: Re: [PATCH v2 09/32] target/mips: Convert MSA I5 instruction format
 to decodetree
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
References: <20211027180730.1551932-1-f4bug@amsat.org>
 <20211027180730.1551932-10-f4bug@amsat.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <8769c862-d67a-2d17-4162-0a6df0117d9c@linaro.org>
Date: Wed, 27 Oct 2021 12:17:50 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20211027180730.1551932-10-f4bug@amsat.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102b;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102b.google.com
X-Spam_score_int: -48
X-Spam_score: -4.9
X-Spam_bar: ----
X-Spam_report: (-4.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-2.847,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 T_SPF_TEMPERROR=0.01 autolearn=ham autolearn_force=no
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
 Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 10/27/21 11:07 AM, Philippe Mathieu-Daudé wrote:
> Convert instructions with a 5-bit immediate value to decodetree.
> 
> Since the 'data format' field is a constant value, use
> tcg_constant_i32() instead of a TCG temporary.
> 
> Reviewed-by: Richard Henderson<richard.henderson@linaro.org>
> Reviewed-by: Jiaxun Yang<jiaxun.yang@flygoat.com>
> Signed-off-by: Philippe Mathieu-Daudé<f4bug@amsat.org>
> ---
> v2:
> - add &msa_i5 format
> - TRANS_MSA() calls check_msa_enabled()
> - TCG timm is constant
> ---
>   target/mips/tcg/msa.decode      |  16 +++++
>   target/mips/tcg/msa_translate.c | 114 ++++++++++----------------------
>   2 files changed, 52 insertions(+), 78 deletions(-)

I think you should drop TRANS_MSA and include the check in trans_msa_i5 instead.  Otherwise,

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

