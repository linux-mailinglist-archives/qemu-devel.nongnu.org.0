Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D8EB32D3708
	for <lists+qemu-devel@lfdr.de>; Wed,  9 Dec 2020 00:42:50 +0100 (CET)
Received: from localhost ([::1]:56864 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kmmd7-0003E9-VN
	for lists+qemu-devel@lfdr.de; Tue, 08 Dec 2020 18:42:49 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:52720)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kmmbs-0002h2-M7
 for qemu-devel@nongnu.org; Tue, 08 Dec 2020 18:41:32 -0500
Received: from mail-ot1-x344.google.com ([2607:f8b0:4864:20::344]:46099)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kmmbr-0002z7-40
 for qemu-devel@nongnu.org; Tue, 08 Dec 2020 18:41:32 -0500
Received: by mail-ot1-x344.google.com with SMTP id w3so431312otp.13
 for <qemu-devel@nongnu.org>; Tue, 08 Dec 2020 15:41:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=Awgv4YwNfy4EbGDM22LiLUFsX4bK0j3zfxf+y6KHOmQ=;
 b=e3EjRS8BByo9LVGj6tNAQCEnBLbooRo9LdKaUne2HyR1mt1B0JTSD92A1lAaYASgcW
 m1C/hP7HS/25hQJpjlZzj2QPyVEd0vlXpfMTxgIpt5xhs4fRN8Re9bGyVU6EJyMT+wPW
 C6hXVLpKHnIzhSgR28eDEJrLYkOI1Cuq9Y7tr9MTa9rYt7j2UuK3iauWrhe5OtvisL/A
 nDLooVg7aZq0L/1TKD4k7zZORDuK2wwl1IPzUddvfZbiuMuC/PID6vtwzlOnRlA14Ief
 oh6LZP6T9TgSCATzV6jSFsNoVttgw2ao+Me/8nHtaNH3NhlgCBjBSjAmhzzMl2irYd/r
 TZnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=Awgv4YwNfy4EbGDM22LiLUFsX4bK0j3zfxf+y6KHOmQ=;
 b=iX/9ezQN0ZrKxczged/Ijnwvm5blb+ylkGkWEPcza12hikeLZZ6PIvIq8mUS57wYtR
 IKRlSlp619JZgvQJmXbvlUmjCrqmjxs5lb+aFk0P2rJ4th6f4me057nY20M/h3z0CVy+
 mdzhxEl0vxDEcDE0yAsEr1jM5Y37aekDcFJCbUAQ2Wyl+Sho6Wpo1IRFQ6rghJgpOD69
 CtVTRUrGlnLbcud6n+t6o0NqQwS3j74q5gjzpWFEMJVR9GXHpa7HwY+ee6HeN77+l5tY
 SKmvhZBa40qLGmlcZHurvmyMLGX9fFtznXLHHjryx4+3bHLcGF/ZVIcu3oKVZlCTGAon
 NNng==
X-Gm-Message-State: AOAM532evyOBTyzrA8fXyJIAR3U2Dds7cacffxKW/z+HUC+/+xpLvzjZ
 DDVQVzzczTOO7c5/+BJlx5tnHg==
X-Google-Smtp-Source: ABdhPJzLpxom4eBWR26ifD/IN7iCtKwSCrzlN/Pqn/PfMk7RrajimKw9j4/yPWTjorzBY3LRxmIi3Q==
X-Received: by 2002:a05:6830:1bd9:: with SMTP id
 v25mr442604ota.81.1607470889877; 
 Tue, 08 Dec 2020 15:41:29 -0800 (PST)
Received: from [10.10.121.52] (fixed-187-189-51-144.totalplay.net.
 [187.189.51.144])
 by smtp.gmail.com with ESMTPSA id q77sm120955ooq.15.2020.12.08.15.41.28
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 08 Dec 2020 15:41:29 -0800 (PST)
Subject: Re: [PATCH 2/4] target/mips: Don't use clock_get_ns() in clock period
 calculation
To: Peter Maydell <peter.maydell@linaro.org>, qemu-devel@nongnu.org
References: <20201208181554.435-1-peter.maydell@linaro.org>
 <20201208181554.435-3-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <58e9d3ff-17ff-b3b6-33ea-20229a23a9c3@linaro.org>
Date: Tue, 8 Dec 2020 17:41:27 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20201208181554.435-3-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::344;
 envelope-from=richard.henderson@linaro.org; helo=mail-ot1-x344.google.com
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
Cc: Damien Hedde <damien.hedde@greensocs.com>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 Luc Michel <luc.michel@greensocs.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 12/8/20 12:15 PM, Peter Maydell wrote:
> Currently the MIPS code uses the old clock_get_ns() API to
> calculate a time length in nanoseconds:
>  cpu->cp0_count_rate * clock_get_ns(MIPS_CPU(cpu)->clock)
> 
> This relies on the clock having a period which is an exact number
> of nanoseconds.
> 
> Switch to the new clock_ticks_to_ns() function, which does the
> multiplication internally at a higher precision.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>  target/mips/cpu.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~


