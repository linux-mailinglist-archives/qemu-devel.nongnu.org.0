Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DAC16B160B
	for <lists+qemu-devel@lfdr.de>; Thu,  9 Mar 2023 00:01:52 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pa2ls-0004id-KM; Wed, 08 Mar 2023 18:00:32 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pa2lq-0004iJ-RX
 for qemu-devel@nongnu.org; Wed, 08 Mar 2023 18:00:30 -0500
Received: from mail-pj1-x1031.google.com ([2607:f8b0:4864:20::1031])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pa2lp-0002ae-6R
 for qemu-devel@nongnu.org; Wed, 08 Mar 2023 18:00:30 -0500
Received: by mail-pj1-x1031.google.com with SMTP id
 y15-20020a17090aa40f00b00237ad8ee3a0so393035pjp.2
 for <qemu-devel@nongnu.org>; Wed, 08 Mar 2023 15:00:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1678316427;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=1ujvtXNowBoFFKbHbCm8GtB+RZZPpEVW0+1orL1UGP0=;
 b=Mf8b/hFy7oWgxhSgeVvcLur0Y6AMnBX12CCchLHU+zH52V3sYJw/a0ym+0x00THNXq
 Z9vizlBkLL4WPAandAzQduIbAGjRJwAmudKXwrOXjNRC9SA6wEUCaX7MyTx+JvDIZzB5
 9pQPoszbXKee5Usw/q35Dbr1olyskRICTqz1r9uVVjbw8EWrrdYKyegGrkfQDqtm9Z+G
 fSL28Dd7R2t6U6TDNrOCJE4rfTeuhmkgcRY+Mk/oxf3E+/4aaZ9qdvFOK/Xnl8iXs4bg
 8AoA11xJWGWGdoRO2jtO8TD+RKvOmA21QtBbg90zV425gcfKq2ESkLK2XhqDSS+wAUNE
 WAHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678316427;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=1ujvtXNowBoFFKbHbCm8GtB+RZZPpEVW0+1orL1UGP0=;
 b=raWQ96p46l3C+Vs/EBcXS478HLXzq7iHs3P0O7DdMP/skHlKPgKSbEma1LR/r1kSY1
 LLn7iiHkpcHmEzI0vBE0SOceKem48wbKl/Wi9tczZq8iYW9PzhSP+PlV1HPxRZ6sJh4X
 0tQ4XQ/ZvX6+KheSWavPK8GxugoSWVuNlsexn4ugXQq33u/GF/yX52nMu3FygJoCSS4V
 Us0EWQLJ1L0SHJVat7W0m9QU8cbzzvuvQOieJld4v/KBzZw7XXQwu42GMmVIhUhnxLat
 w19AtYniPWTX9PJigxBN1SaUNsRy8Y5c/NrNnu3G3vpHtikz+lPsaB81dyxdcLy3WZ4h
 jZ1w==
X-Gm-Message-State: AO0yUKVolqz0pU+9yZbGA6iZ6tAIMELEOQDZuIBCcqcQFvFRG7PNYIle
 Cpa2vP4KZuzkYV7b89wZnu5lNA==
X-Google-Smtp-Source: AK7set/wKYc4PlkaZDdwEdZZm7TGaYb1OnVT6H1J9JbEv5GYbI7LWM4K9Cbkh1HvK4VI5Pzc89lfbQ==
X-Received: by 2002:a05:6a20:3c88:b0:cd:1c8e:cd44 with SMTP id
 b8-20020a056a203c8800b000cd1c8ecd44mr22585454pzj.47.1678316427339; 
 Wed, 08 Mar 2023 15:00:27 -0800 (PST)
Received: from ?IPV6:2602:ae:154a:9f01:acd:bde4:fbf6:cc41?
 ([2602:ae:154a:9f01:acd:bde4:fbf6:cc41])
 by smtp.gmail.com with ESMTPSA id
 78-20020a630451000000b00502e1c50af3sm9681094pge.45.2023.03.08.15.00.26
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 08 Mar 2023 15:00:26 -0800 (PST)
Message-ID: <551d736a-3219-c90f-1fd2-b7c9074a4f6d@linaro.org>
Date: Wed, 8 Mar 2023 15:00:25 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH for-8.1 04/17] target/riscv: add PRIV_VERSION_LATEST macro
Content-Language: en-US
To: Daniel Henrique Barboza <dbarboza@ventanamicro.com>, qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, bmeng@tinylab.org,
 liweiwei@iscas.ac.cn, zhiwei_liu@linux.alibaba.com, palmer@rivosinc.com
References: <20230308201925.258223-1-dbarboza@ventanamicro.com>
 <20230308201925.258223-5-dbarboza@ventanamicro.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20230308201925.258223-5-dbarboza@ventanamicro.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1031;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1031.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

On 3/8/23 12:19, Daniel Henrique Barboza wrote:
>       PRIV_VERSION_1_11_0,
>       PRIV_VERSION_1_12_0,
>   };
> +#define PRIV_VERSION_LATEST PRIV_VERSION_1_12_0

Any reason not to make this a enumeration value:

   PRIV_VERSION_LATEST = PRIV_VERSION_1_12_0

?

r~

