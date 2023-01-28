Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DD3C67F402
	for <lists+qemu-devel@lfdr.de>; Sat, 28 Jan 2023 03:33:17 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pLb0E-000110-8x; Fri, 27 Jan 2023 21:31:38 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pLb0B-00010o-Nx
 for qemu-devel@nongnu.org; Fri, 27 Jan 2023 21:31:35 -0500
Received: from mail-pl1-x62d.google.com ([2607:f8b0:4864:20::62d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pLb0A-00068c-3b
 for qemu-devel@nongnu.org; Fri, 27 Jan 2023 21:31:35 -0500
Received: by mail-pl1-x62d.google.com with SMTP id jl3so6733100plb.8
 for <qemu-devel@nongnu.org>; Fri, 27 Jan 2023 18:31:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=ujRLBQ/Gh7StapCYcLtuR4E4cgExFutBisuWFKM2zOk=;
 b=jBCP8OqqySuSdgSvhVgstdZKOl4SoGcLOUy8SY9QJWdIZLjXdvQcKo7H+HFp/KNNU2
 PalEcFsoNZtQY52GF2ai775TOqNBhvA4k4zKnRqvCMa0W+qBGvzKN6bo793kfNrIMMhE
 Ae77XxIjgjyWLpzd4B3hHbFB+7d3xxRxW5LSjoiAONV1S/IFe+SD0SB+WX4aNOX6hd2F
 Hd/nMSxVQOryasZamYnuUsFfU1jtEkvY8ByWYMfa98BBGZ5Z7eOgCNkvs1a3OoQlaJXh
 YwkjYyTidahuOSwoo01JEqDg0jVaACdw7Yq1h46ZP2b9SjJg0EpVSvH3Sssk9oG1cD35
 uCTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=ujRLBQ/Gh7StapCYcLtuR4E4cgExFutBisuWFKM2zOk=;
 b=ZWy/uDF+KuQMwjN57G98ysNTAl2yxi03/sm7Zpws4My6GHuziFiZr3uC2YpauR05EC
 2+9obbRwnv/rK4Yax8fgeghXuembbaPwBXeWllzcTlIRkI3wTO48OJlKaBI76RuXJFpm
 G4JrYp4MdbizRwn9U/lkwsHskX4mR/3ifEW7gaOUs01pSlHBKdpWaAeFNRVR40mv0VS/
 7INWoPBBja6Z4dlCJ1w6gloHdpYUOxHqqktLhxaO/rgkKqURv3roQQfuSxAynVpIoYr8
 THOMGo7CBfBQ1NHILw+HOC2xKa1om3VZlfjVzCmbB1iLENkSDuJeZALc075gtnVJaXwo
 tdMg==
X-Gm-Message-State: AFqh2kriii41Y4YvVccpIN4ZEOXAzRvPpTtMmZaNwqz8ufLxSL69kz8v
 NDnw2A6FjGcASka/CSav2rLz/g==
X-Google-Smtp-Source: AMrXdXs1x1AP3tcDlBlWw5qAJpfwu4vJ5aN+nSawddxwevTfN7VrjPnfpAkXE71h84Y8kkFVLf6ZUw==
X-Received: by 2002:a17:90a:f606:b0:228:f6cc:dc4f with SMTP id
 bw6-20020a17090af60600b00228f6ccdc4fmr44680270pjb.10.1674873091393; 
 Fri, 27 Jan 2023 18:31:31 -0800 (PST)
Received: from [192.168.50.174] (rrcs-173-197-98-118.west.biz.rr.com.
 [173.197.98.118]) by smtp.gmail.com with ESMTPSA id
 ep22-20020a17090ae65600b0022c08445e97sm3312820pjb.38.2023.01.27.18.31.30
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 27 Jan 2023 18:31:30 -0800 (PST)
Message-ID: <1fcd0c0f-f079-69ef-9455-1501ce725a07@linaro.org>
Date: Fri, 27 Jan 2023 16:31:27 -1000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH 08/23] target/arm: Define the FEAT_FGT registers
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20230127175507.2895013-1-peter.maydell@linaro.org>
 <20230127175507.2895013-9-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20230127175507.2895013-9-peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62d;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62d.google.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.148,
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

On 1/27/23 07:54, Peter Maydell wrote:
> Define the system registers which are provided by the
> FEAT_FGT fine-grained trap architectural feature:
>   HFGRTR_EL2, HFGWTR_EL2, HDFGRTR_EL2, HDFGWTR_EL2, HFGITR_EL2
> 
> All these registers are a set of bit fields, where each bit is set
> for a trap and clear to not trap on a particular system register
> access.  The R and W register pairs are for system registers,
> allowing trapping to be done separately for reads and writes; the I
> register is for system instructions where trapping is on instruction
> execution.
> 
> The data storage in the CPU state struct is arranged as a set of
> arrays rather than separate fields so that when we're looking up the
> bits for a system register access we can just index into the array
> rather than having to use a switch to select a named struct member.
> The later FEAT_FGT2 will add extra elements to these arrays.
> 
> The field definitions for the new registers are in cpregs.h because
> in practice the code that needs them is code that also needs
> the cpregs information; cpu.h is included in a lot more files.
> We're also going to add some FGT-specific definitions to cpregs.h
> in the next commit.
> 
> We do not implement HAFGRTR_EL2, because we don't implement
> FEAT_AMUv1.
> 
> Signed-off-by: Peter Maydell<peter.maydell@linaro.org>
> ---
>   target/arm/cpregs.h | 285 ++++++++++++++++++++++++++++++++++++++++++++
>   target/arm/cpu.h    |  15 +++
>   target/arm/helper.c |  40 +++++++
>   3 files changed, 340 insertions(+)

I spot-checked the field definitions before my eyes crossed.

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~

