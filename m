Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CD8BC2DC835
	for <lists+qemu-devel@lfdr.de>; Wed, 16 Dec 2020 22:17:29 +0100 (CET)
Received: from localhost ([::1]:42158 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kpeAq-0008B8-Fq
	for lists+qemu-devel@lfdr.de; Wed, 16 Dec 2020 16:17:28 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:48296)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kpe9G-0007FK-OY
 for qemu-devel@nongnu.org; Wed, 16 Dec 2020 16:15:50 -0500
Received: from mail-oi1-x236.google.com ([2607:f8b0:4864:20::236]:42574)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kpe9E-0007kO-4p
 for qemu-devel@nongnu.org; Wed, 16 Dec 2020 16:15:50 -0500
Received: by mail-oi1-x236.google.com with SMTP id l200so29359424oig.9
 for <qemu-devel@nongnu.org>; Wed, 16 Dec 2020 13:15:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-language:content-transfer-encoding;
 bh=dhvcMQvhoRuqlm7Cn0mvhSFDfcmcRXxSs7q3FMiDo3o=;
 b=Q01gijL+CwDh2D8c1p5/gFlFLd4fUszyAp6UsM3HMkU5w5MUH79MnQCt44oB/I5wFd
 6qlT5y0PPB0UjeWV9cD+C6EI+1u008LzbvcQ8B8uux6oDhrZeIlLYxyZKjup3lcV3uHR
 D358NjzlPb55xGuu0rpSbVpa2sN1lDoqHmwAkmzJSSm4cQacfYJ3qtT0FQhiRsPEWXPw
 vMcNf0BkOx/60c5nEZBt9Eqa3BZ7IH/tEGwwQytioqgLRaWEgyU6A3Fz+3r/hODDUaK8
 hoStEUyHXBytWxCqOYGwNUALHf4vtLAxDwrcj63dWTo6oI34S9Trkbzx+n7p8plhMBu+
 qNpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=dhvcMQvhoRuqlm7Cn0mvhSFDfcmcRXxSs7q3FMiDo3o=;
 b=E+5CO5p81I2lPzitHfY3H+zHa5nh2L9a/Znk2dZs9lKZFvfCINaZ4OZWA6FTRQYyEh
 s6WpTmRgkuNTeDEU9h1se8pdbQ7JBUkXgX8UADQlw8CQE+L7hXIELxzb/MFASWwSpzW/
 /N6TeLREU1xvQMVSj1aFqtS6vKuhIBMgDfbGGRQQaIqg1210XTsBYOSvdkz20FdcnYEz
 G3O3JdtcGFXs8Bw4o6UzUL0l5cvWLDzQ2ICSKcgjTjEqYtj7G/chKlrKpX2SoEFtY9FR
 2BFM0wTC8G1XmB1gNj5OqWpp8WGNX0e5etFNk8xPo23bnDf6EFvW7E6qwMA9ybSI4Mol
 BMfg==
X-Gm-Message-State: AOAM531JFGkQhLG4Y12tMR2EIIl2Pw48BWL2WiRg4WfvcZ8LALzPjHr2
 La8nVWIxF3r26o+4IT/l7Zy2uupZ7EVUdmOd
X-Google-Smtp-Source: ABdhPJwOKUospZszQFgKgOJyYt8K/zivp+2sHzYPowstuBlKoC1bXc0ly2hHkB9LWYQeN1cPeuaVYg==
X-Received: by 2002:aca:504e:: with SMTP id e75mr3124333oib.170.1608153346496; 
 Wed, 16 Dec 2020 13:15:46 -0800 (PST)
Received: from [10.10.121.52] (fixed-187-189-51-144.totalplay.net.
 [187.189.51.144])
 by smtp.gmail.com with ESMTPSA id m10sm694189oig.27.2020.12.16.13.15.45
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 16 Dec 2020 13:15:45 -0800 (PST)
Subject: Re: [PATCH v3 1/4] hw/intc/armv7m_nvic: Correct handling of
 CCR.BFHFNMIGN
To: Peter Maydell <peter.maydell@linaro.org>, qemu-devel@nongnu.org
References: <20201210201433.26262-1-peter.maydell@linaro.org>
 <20201210201433.26262-2-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <d37233a8-85ea-fe22-6287-3a255a217ad0@linaro.org>
Date: Wed, 16 Dec 2020 15:15:43 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20201210201433.26262-2-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::236;
 envelope-from=richard.henderson@linaro.org; helo=mail-oi1-x236.google.com
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 12/10/20 2:14 PM, Peter Maydell wrote:
> The CCR is a register most of whose bits are banked between security
> states but where BFHFNMIGN is not, and we keep it in the non-secure
> entry of the v7m.ccr[] array.  The logic which tries to handle this
> bit fails to implement the "RAZ/WI from Nonsecure if AIRCR.BFHFNMINS
> is zero" requirement; correct the omission.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
> Changes since v2: get the "WI" bit right
> ---
>  hw/intc/armv7m_nvic.c | 15 +++++++++++++++
>  1 file changed, 15 insertions(+)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

