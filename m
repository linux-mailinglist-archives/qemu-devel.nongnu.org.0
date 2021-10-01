Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BC68741F22B
	for <lists+qemu-devel@lfdr.de>; Fri,  1 Oct 2021 18:33:42 +0200 (CEST)
Received: from localhost ([::1]:40072 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mWLTh-0002iR-Jh
	for lists+qemu-devel@lfdr.de; Fri, 01 Oct 2021 12:33:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45454)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mWLSE-0001kK-CP
 for qemu-devel@nongnu.org; Fri, 01 Oct 2021 12:32:12 -0400
Received: from mail-qk1-x72c.google.com ([2607:f8b0:4864:20::72c]:43792)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mWLSC-0004pL-LA
 for qemu-devel@nongnu.org; Fri, 01 Oct 2021 12:32:10 -0400
Received: by mail-qk1-x72c.google.com with SMTP id 138so9677180qko.10
 for <qemu-devel@nongnu.org>; Fri, 01 Oct 2021 09:32:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-language:content-transfer-encoding;
 bh=TWGQJk5aChMo6jAn48gWAN6C5M7YY9vwaN9CPCi+OVY=;
 b=orf/xjmWKa1JnCPiMWOaJiMAfYGqywxfcNRei9Jm3DdQVhYiQatF+q/WtOjw84HcRu
 0Kznpu9yQejLUWhy6+m7Ezjp4758xkCX1aLFljZXGO9tSG6PmJhnWRpnXbu0DHMpaSdB
 NmOzZlzTMzMOre/16gLohi9l8DASGbbSpSTeL9dwf1PJ5L279MaRLZFDGLZvKJGndpmb
 n2vTMnQ72yv3Uqi0rPY/c0qJyKbIqjOSvhqmc8qqES3a++9LdfEfzVq970+i5leJ4y9j
 xRa6xFyefSqLueIg9FXaDgUQ2/5sM2s8fZRRc776xeOAgoxdW28pGNr+pEwnrHA3UuzM
 46aA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=TWGQJk5aChMo6jAn48gWAN6C5M7YY9vwaN9CPCi+OVY=;
 b=rf7KHSLkyBIFlrnuwmDnDxJcrppDWkFeCYlquvpCrw6YOcD39TxqI9fP/xrulzg8xs
 AMdpFN88VNrhkZVYW/7jyt8uz0m5fFuN/Auy5Q8EDa5Dg20g9yGcvQ6pDxAX4GRhuZMg
 6jo4+X4PTC01t92HEko2CTHO3r2XtQQdJsiOH4QPsT8iW6lnec3g6hwdWw+YmLH88Tqv
 0vHyTjiNP6LYtiiq4W3pS6QYixRT4zt+Ab3H2LhoIdqCx36neDYcOH6hHDpn42W0lquh
 mEUT1kHdlAOtyzd+ZZ2nOZyLwqjCDgCoaUzmlC/7UzZE1+f7TADleuaXMCVqsi6CmqK5
 NMWA==
X-Gm-Message-State: AOAM530gT68u1/QoFoq3CaWaMGacrMdULQVOo4lZ+HWRB5yW2AxUq++y
 /0by09eCh2Ia1cjT57hGSIwsf63PjUjTUA==
X-Google-Smtp-Source: ABdhPJwzKaFWt/DN73NhDmlH0ydAD/vxy+pfwyAbbxppf/AepzkBmiREoM46gxnfhDGLNZ31d8tlEw==
X-Received: by 2002:a05:620a:430f:: with SMTP id
 u15mr10430336qko.32.1633105927384; 
 Fri, 01 Oct 2021 09:32:07 -0700 (PDT)
Received: from [192.168.3.43] (c-67-174-166-185.hsd1.ga.comcast.net.
 [67.174.166.185])
 by smtp.gmail.com with ESMTPSA id u12sm4018870qtw.73.2021.10.01.09.32.06
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 01 Oct 2021 09:32:07 -0700 (PDT)
Subject: Re: [PATCH 2/3] hw/intc/arm_gicv3: Set GICR_TYPER.Last correctly when
 nb_redist_regions > 1
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20210930150842.3810-1-peter.maydell@linaro.org>
 <20210930150842.3810-3-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <9f9d138b-dc0f-0c47-6728-1d781d8f03ec@linaro.org>
Date: Fri, 1 Oct 2021 12:32:05 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20210930150842.3810-3-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::72c;
 envelope-from=richard.henderson@linaro.org; helo=mail-qk1-x72c.google.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.127,
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

On 9/30/21 11:08 AM, Peter Maydell wrote:
> The 'Last' bit in the GICR_TYPER GICv3 redistributor register is
> supposed to be set to 1 if this is the last redistributor in a series
> of contiguous redistributor pages.  Currently we set Last only for
> the redistributor for CPU (num_cpu - 1).  This only works if there is
> a single redistributor region; if there are multiple redistributor
> regions then we need to set the Last bit for the last redistributor
> in each region.
> 
> This doesn't cause any problems currently because only the KVM GICv3
> supports multiple redistributor regions, and it ignores the value in
> GICv3State::gicr_typer.  But we need to fix this before we can enable
> support for multiple regions in the emulated GICv3.
> 
> Signed-off-by: Peter Maydell<peter.maydell@linaro.org>
> ---

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

