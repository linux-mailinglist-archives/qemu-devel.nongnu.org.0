Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 56B90626725
	for <lists+qemu-devel@lfdr.de>; Sat, 12 Nov 2022 06:29:50 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1otj4q-0006az-9k; Sat, 12 Nov 2022 00:29:12 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1otj4n-0006aL-Ph
 for qemu-devel@nongnu.org; Sat, 12 Nov 2022 00:29:09 -0500
Received: from mail-pf1-x430.google.com ([2607:f8b0:4864:20::430])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1otj4m-0001dp-AU
 for qemu-devel@nongnu.org; Sat, 12 Nov 2022 00:29:09 -0500
Received: by mail-pf1-x430.google.com with SMTP id y203so6568813pfb.4
 for <qemu-devel@nongnu.org>; Fri, 11 Nov 2022 21:29:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=q5gU8ipiRrz8dtkFTDLWFTjOXTZAEzfd68uklGNyxIQ=;
 b=EsTcS/5gFSUpcGEYuuw2MGupOY8zjopRu0ktKqja7Dj6kFaFr5ZxZTsgNGVL3TDH3O
 T0D8Y5J/QHqver1RNfGmBRzlhyh0xOFhQk750LXsWEdMMIPXC70dvKJQqX31E0/UyTzR
 AXdS6eSb5jXwkpUwNrbjQUKFlXmN6y9vLRrF8dVI1cSmyHiYvrSCoCTMeDd70zZ1Tft6
 jHQAIqIgfZv0TkafOOVqQqlbaKviSfFh3eMjElAWFmKOqIFfdE7IY0HqqmQ/WMS4SGG3
 cOstR0jkru4i8Csf/UNpYQBFT9FpSElmEAMXG3mmJVaevLcJKiS6wG1VV+2kkinQOQzj
 RG4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=q5gU8ipiRrz8dtkFTDLWFTjOXTZAEzfd68uklGNyxIQ=;
 b=YlFBivuRwpSttko0NuhWnat0MovFVViEBgZiWRBOTUlNsEgMLCXaw9tGnllsfed+Kg
 1kKu+OtK5uCBOqIrh87J18Az0nXEqvcCD2DNg5vNWQS2To1ysSvpQ0LW95BO1EYmVooA
 uwb2pLnbqtPpfckd3dfkgkTrFtmGc5B/BE+rN7+xTtZT5WTaIrVAQyHZWbJuucK0Sr34
 V0U+I4WWI9DSFTUXTw+3D1oGom4ign+BbZVhM17cZdLLsl9adzKj9x3kC1LPDQR378kn
 9uzcn9q7A+jLPRlGS+TNueEoyND2x698DMmFgtM2ZXER+JOGTTE3U1EzrUBg5bY0EJiD
 ChLQ==
X-Gm-Message-State: ANoB5pmlWz6W3rXE12J5R3SF08JWRsIiMRl0hDt4D/jwDIh/yMQy6FB8
 o6rwIXvfjsY2BlGnV+9RQwZ/07R2hk/esHxN
X-Google-Smtp-Source: AA0mqf5nYyjlASOS9piFe90wdi4YeHxP3ydP5US24xV2Sg8mf4qxnEKSccJW83HBVHf8OxSdOh9xkw==
X-Received: by 2002:a63:e00d:0:b0:464:45b5:745c with SMTP id
 e13-20020a63e00d000000b0046445b5745cmr4430453pgh.118.1668230946854; 
 Fri, 11 Nov 2022 21:29:06 -0800 (PST)
Received: from ?IPV6:2001:44b8:2176:c800:8228:b676:fb42:ee07?
 (2001-44b8-2176-c800-8228-b676-fb42-ee07.static.ipv6.internode.on.net.
 [2001:44b8:2176:c800:8228:b676:fb42:ee07])
 by smtp.gmail.com with ESMTPSA id
 a4-20020aa795a4000000b0056d7cc80ea4sm2476240pfk.110.2022.11.11.21.29.03
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 11 Nov 2022 21:29:06 -0800 (PST)
Message-ID: <97d50924-66c3-80d7-30cf-f157da6477aa@linaro.org>
Date: Sat, 12 Nov 2022 15:29:00 +1000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH v5 04/20] target/arm: ensure KVM traps set appropriate
 MemTxAttrs
Content-Language: en-US
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
Cc: f4bug@amsat.org, Peter Maydell <peter.maydell@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>,
 "open list:ARM KVM CPUs" <qemu-arm@nongnu.org>,
 "open list:Overall KVM CPUs" <kvm@vger.kernel.org>
References: <20221111182535.64844-1-alex.bennee@linaro.org>
 <20221111182535.64844-5-alex.bennee@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20221111182535.64844-5-alex.bennee@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::430;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x430.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 11/12/22 04:25, Alex Bennée wrote:
> Although most KVM users will use the in-kernel GIC emulation it is
> perfectly possible not to. In this case we need to ensure the
> MemTxAttrs are correctly populated so the GIC can divine the source
> CPU of the operation.
> 
> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> 
> ---
> v3
>    - new for v3
> v5
>    - tags
>    - use MEMTXATTRS_PCI
> ---

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~

