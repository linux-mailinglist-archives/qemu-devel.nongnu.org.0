Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 038B132DEC8
	for <lists+qemu-devel@lfdr.de>; Fri,  5 Mar 2021 02:06:50 +0100 (CET)
Received: from localhost ([::1]:34024 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lHyvZ-00031C-39
	for lists+qemu-devel@lfdr.de; Thu, 04 Mar 2021 20:06:49 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:33984)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lHyuA-0002QN-Bq
 for qemu-devel@nongnu.org; Thu, 04 Mar 2021 20:05:22 -0500
Received: from mail-pf1-x42b.google.com ([2607:f8b0:4864:20::42b]:45353)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lHyu6-0000J3-6R
 for qemu-devel@nongnu.org; Thu, 04 Mar 2021 20:05:22 -0500
Received: by mail-pf1-x42b.google.com with SMTP id j12so751739pfj.12
 for <qemu-devel@nongnu.org>; Thu, 04 Mar 2021 17:05:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-language:content-transfer-encoding;
 bh=4OkRY0T7vmghve69EI/fLlSmC6Nxsk5UvcZOHcGPscM=;
 b=bLGJy8rcrheUAL21B4OfhNvQ86S20OGlBbNtT/+d07lcbOyjxNr5nq2NyWx45knY4O
 fdx75VdYFuAqqfWea9VbpKoWUjz1Ljg9+r7W2gEdMmjRJ0wbWGMp9mqsFvNz6FZutt8Z
 Hp9qzFf8dlT93B8nKxhGCSzh76TUt4fZL9rrtGDogFkOizdjTgA1ojESBrY6GO+Ctkp1
 JZrJhcga24K3SR/DolLakxkGDnKSUaEOEpZUxqkFSJ8QLFVm5DjY1wX+9ZhOxf00zN8n
 7rcjAWKY5ZAZMbicR3sWOq0RCwAWuidq3LYHYGw06T4uXC7iOP4B903KSrNLOf+ZAklk
 gN9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=4OkRY0T7vmghve69EI/fLlSmC6Nxsk5UvcZOHcGPscM=;
 b=omDswwpOuk9rBcHLZ+SztJpL0s2A/5cdbpZ5h5jU6noejpnxFPwhkSL13At0FhvJiU
 DFCfav+wbz1syrqZVibRK56H5TUK2ssfO4VmwIz2BZbmMS1INiwSg8hFYS8dug4Ij8Lj
 OPKMJsvogRkLlhDR4pHZ2UOuslNa0Qb0xEb3PoHSMtAdXSPqydrtbghdR3PAdZeeM/iw
 QQmoUiyTjmGD2XlgHNpc/IJL8lhORKyHaNYZAZyqEXkMD5wCRM3VL3N42cXnp62xWXK2
 B6BUgIzz8R2bW/n4XohyOkMbY7KEfLS9++hErt6wVZeRjEPrUYCpIAq9PnxdcDRtn7Ff
 xX+w==
X-Gm-Message-State: AOAM530CNNIUN5WHXAFSnz1txavP9e/CX5jwF6oWbaAyxMT7VscUI0L1
 fW/W6pg2sGAN06V4jX5CpewYT8TG7epLhw==
X-Google-Smtp-Source: ABdhPJzRkJSzpI0koCqHnntQuIN7hRcr8kW+gk4/K/C22wz4We6I1gSapYfNXSasCyId89+5scNYhA==
X-Received: by 2002:a63:cc05:: with SMTP id x5mr5816773pgf.254.1614906316439; 
 Thu, 04 Mar 2021 17:05:16 -0800 (PST)
Received: from [192.168.1.11] ([71.212.131.83])
 by smtp.gmail.com with ESMTPSA id mp1sm386466pjb.48.2021.03.04.17.05.15
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 04 Mar 2021 17:05:16 -0800 (PST)
Subject: Re: [PATCH 41/44] hw/arm/mps2-tz: Make initsvtor0 setting
 board-specific
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20210219144617.4782-1-peter.maydell@linaro.org>
 <20210219144617.4782-42-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <87b32098-0a6d-fad5-bc09-b73b185b44f0@linaro.org>
Date: Thu, 4 Mar 2021 17:05:14 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <20210219144617.4782-42-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42b;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2/19/21 6:46 AM, Peter Maydell wrote:
> The AN547 configures the SSE-300 with a different initsvtor0
> setting from its default; make this a board-specific setting.
> 
> Signed-off-by: Peter Maydell<peter.maydell@linaro.org>
> ---

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

