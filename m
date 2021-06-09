Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 669933A1CB0
	for <lists+qemu-devel@lfdr.de>; Wed,  9 Jun 2021 20:24:40 +0200 (CEST)
Received: from localhost ([::1]:52256 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lr2sZ-0004tr-6M
	for lists+qemu-devel@lfdr.de; Wed, 09 Jun 2021 14:24:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58864)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lr2rD-0003VQ-99
 for qemu-devel@nongnu.org; Wed, 09 Jun 2021 14:23:15 -0400
Received: from mail-pf1-x430.google.com ([2607:f8b0:4864:20::430]:44983)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lr2rA-0002rW-3M
 for qemu-devel@nongnu.org; Wed, 09 Jun 2021 14:23:14 -0400
Received: by mail-pf1-x430.google.com with SMTP id u18so19076438pfk.11
 for <qemu-devel@nongnu.org>; Wed, 09 Jun 2021 11:23:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-language:content-transfer-encoding;
 bh=tIWD5ztVcSaFh+5BfDTOAKm+CIAvssuKs66kAYOsZJQ=;
 b=KHkzF97Y2zTyx1HdO3Gp4bxIrmzYB65vNj9+j1o4nWY5uEFg/biRhIUc2cgiBK0/VZ
 7UKgv+y0Cs8ytPKPWn8f6TVmvLTPDxTwVasd7biZ+EEsCmiubLaR5rZ9Xx03Szc00kUl
 iUZnC3gvwsOTSHAFmgOKF6FtCEX39Odiblf3+zT8t8vx/EEl1G89k4PAukCG4iAM+zgL
 uwfgOqOSYzcJeH77adV1wXvSLDzg0475QOLTdxtIed5NT5TPaGWRzWkoWB+zvHIXX/JJ
 F6kiHVCLtAP2lQSvAs98PUqGLtMWD1FhnQVIzq2icaGWJ8AqCx2A0YecleBFfFC0wodB
 bgDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=tIWD5ztVcSaFh+5BfDTOAKm+CIAvssuKs66kAYOsZJQ=;
 b=SPNJlgAEIrRzbAzzUzmt3iQYsqyCXZXZ1KWZit4yMoZjbRLsjzr+WHGkytyLqOsu64
 dsZdoe/UQ4/mFvu1VWxcOhwj0Ab2T5BcyiOQAueIIAYAXiCYuKPCEn0tyApCVhdn92nK
 ukZXpHmwj0YZryA2WvO2Qb5d+UyFPdaMYeAppgThoZu7BDXHXldFFkM1kBi+HCImSBBL
 S5QKNabpV81N3+jf+c50BQF8HpkrXx7ZAWYtDiKT9E26GY5NPpyMQSaciC94ZqbciCzw
 QdfIE52s5iBVjuaX7CaDbWtxgTSHRYPONe50c3gGvrEilMPKrV4UeYTZUKnYP46/Ux7R
 pQQg==
X-Gm-Message-State: AOAM531JVefG4c3bt+CWRHPYEPT4AjDnnRDgp75LSLoh0/hggnFOu4yK
 XcG00dCQaAti9msciHPcCwf/Ouk5J2xMvQ==
X-Google-Smtp-Source: ABdhPJztFm6ttvujJWPQGf6/dnPZ8ynu3g17Vm8K3F5gg+Mj+dThpr3cN/Len+71nlumjfkB+p9C5g==
X-Received: by 2002:a65:5181:: with SMTP id h1mr988590pgq.330.1623262990559;
 Wed, 09 Jun 2021 11:23:10 -0700 (PDT)
Received: from [192.168.1.11] (174-21-70-228.tukw.qwest.net. [174.21.70.228])
 by smtp.gmail.com with ESMTPSA id
 gw21sm329330pjb.41.2021.06.09.11.23.10
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 09 Jun 2021 11:23:10 -0700 (PDT)
Subject: Re: [PATCH 37/55] target/arm: Implement MVE VPST
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20210607165821.9892-1-peter.maydell@linaro.org>
 <20210607165821.9892-38-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <748fcdb3-eaa1-6350-d386-d8176c029d29@linaro.org>
Date: Wed, 9 Jun 2021 11:23:08 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210607165821.9892-38-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::430;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x430.google.com
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

On 6/7/21 9:58 AM, Peter Maydell wrote:
> Implement the MVE VPST insn, which sets the predicate mask
> fields in the VPR to the immediate value encoded in the insn.
> 
> Signed-off-by: Peter Maydell<peter.maydell@linaro.org>
> ---
>   target/arm/mve.decode      |  4 +++
>   target/arm/translate-mve.c | 59 ++++++++++++++++++++++++++++++++++++++
>   2 files changed, 63 insertions(+)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

