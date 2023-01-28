Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FA3967FBE1
	for <lists+qemu-devel@lfdr.de>; Sun, 29 Jan 2023 00:50:45 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pLuxc-0000xn-Rt; Sat, 28 Jan 2023 18:50:16 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pLuxb-0000xN-06
 for qemu-devel@nongnu.org; Sat, 28 Jan 2023 18:50:15 -0500
Received: from mail-pl1-x630.google.com ([2607:f8b0:4864:20::630])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pLuxZ-0006sD-Cu
 for qemu-devel@nongnu.org; Sat, 28 Jan 2023 18:50:14 -0500
Received: by mail-pl1-x630.google.com with SMTP id k13so8380735plg.0
 for <qemu-devel@nongnu.org>; Sat, 28 Jan 2023 15:50:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=aa1Dv0jiUu32T3/DHeDJl8vwD1U6nXqk0yICUoGM+WQ=;
 b=QKtQWYy99mmOW0Zm6mjIENc4Dvu64MJ9Ujt4PyW0n+Q955fDF61NT65E7Qx0/uVtC+
 5HNCFlQe457HoGS/7qZPDTGeN42Xv8w+wZL9wTm3Fp01urVXwiodQkZwQim4gLLe/eI3
 KJr+PqEpMcs9gWLo8liLQcC4FYdBA+U7rFpJ9QG/NR24IOsa/KbHsnknk1Epbb6Zpb7y
 a2Gk/sSccH7dO/iGHyUL+5J1Cu3aVrISjuGHCBTisHBi1X3qUhztRR4bV5ynMeT+DhBf
 Sf7MQSUWivXCcb2ALVhHs+kPIgMJDZ9CHPK/AMoU511dW2IvWY7tMu2XW7EtK3KwvooI
 Qjkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=aa1Dv0jiUu32T3/DHeDJl8vwD1U6nXqk0yICUoGM+WQ=;
 b=pG+aOPhBfpy+2MriI5quu0hDzOb9NrKb7DZWJK3xNwLJCgDtMo3mev1PA51g0QUNb+
 gamTKBg6L+hm1q7Bt1SXuYa8RJKr1Tk8bpCaHV5ZXCTbyk6w5TopsgOJcIb7Ni8f+tta
 1+0t2bYdnqT4xcw2EiUpPyZoohq97V89olLH9zuvrahYf0gpvOhHimeVjrr7fwpy3Gzv
 EahyexO9+/xgfDmDQxi9Inu1sPfVpdOnNqTU5LB1vZvBytiQye+5KQm0rL3qW/7y4kH2
 fHmJLZ8ivwn+iTSBfXD5QO4ytIKFh3Gga0AfCtac0XGF0JFtn7r6sCtDAYA9+b9WzCsC
 5qoA==
X-Gm-Message-State: AO0yUKUWd4Bh0Y/pzncJap1MOGXZ4XI8mOsmiobgCY7lbjt815k60F5z
 BDqEIIEGmbnswcC657+JRDxDYg==
X-Google-Smtp-Source: AK7set/ch0QeSd/ozD4Fz/hOVFp/PPe95jkt+i4fzW5NMAKoOTObNMTr+bl+amjSvC/kMmBWWtovcw==
X-Received: by 2002:a17:902:f682:b0:196:3f75:1e9c with SMTP id
 l2-20020a170902f68200b001963f751e9cmr14236738plg.52.1674949812168; 
 Sat, 28 Jan 2023 15:50:12 -0800 (PST)
Received: from [192.168.50.174] (rrcs-173-197-98-118.west.biz.rr.com.
 [173.197.98.118]) by smtp.gmail.com with ESMTPSA id
 x10-20020a170902ec8a00b0019488090884sm1581648plg.273.2023.01.28.15.50.10
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 28 Jan 2023 15:50:11 -0800 (PST)
Message-ID: <c616284c-9694-74e7-edc0-f06fed2e540d@linaro.org>
Date: Sat, 28 Jan 2023 13:50:08 -1000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH 19/23] target/arm: Mark up sysregs for HFGITR bits 48..63
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20230127175507.2895013-1-peter.maydell@linaro.org>
 <20230127175507.2895013-20-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20230127175507.2895013-20-peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::630;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x630.google.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.148,
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

On 1/27/23 07:55, Peter Maydell wrote:
> Mark up the sysreg definitions for the system instructions
> trapped by HFGITR bits 48..63.
> 
> Some of these bits are for trapping instructions which are
> not in the system instruction encoding (i.e. which are
> not handled by the ARMCPRegInfo mechanism):
>   * ERET, ERETAA, ERETAB
>   * SVC
> 
> We will have to handle those separately and manually.
> 
> Signed-off-by: Peter Maydell<peter.maydell@linaro.org>
> ---
>   target/arm/cpregs.h | 4 ++++
>   target/arm/helper.c | 9 +++++++++
>   2 files changed, 13 insertions(+)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

