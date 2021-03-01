Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B15CD327680
	for <lists+qemu-devel@lfdr.de>; Mon,  1 Mar 2021 04:54:04 +0100 (CET)
Received: from localhost ([::1]:32896 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lGZdD-0005Kf-M2
	for lists+qemu-devel@lfdr.de; Sun, 28 Feb 2021 22:54:03 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:52762)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lGZaX-0004e9-4A
 for qemu-devel@nongnu.org; Sun, 28 Feb 2021 22:51:17 -0500
Received: from mail-pj1-x1035.google.com ([2607:f8b0:4864:20::1035]:36103)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lGZaV-000154-Ab
 for qemu-devel@nongnu.org; Sun, 28 Feb 2021 22:51:16 -0500
Received: by mail-pj1-x1035.google.com with SMTP id s23so10819740pji.1
 for <qemu-devel@nongnu.org>; Sun, 28 Feb 2021 19:51:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=CMgho6Lx0VG0Xe2KWf/8U1e85degQBAppXy34xmLOpM=;
 b=e6TZNuiFLw+y6jM8ji8JBmt2fgmGBPAWBpfrINz5CpsmxO056EEte5UzdfZbLtSNcV
 Vvpw4l4q025bZBhuq0UGCAexv17vg+N3qsV0Kg6oPs95biiHNCNanj6KbdHmMlumDpUY
 VCMWjRp+XHwDazxQ7yljKERuqVuprPdqQ6olaPUK1w9KHDmG+KSF+b3smeoQBoV3zsIg
 T8Ffk6rSfntOzI0GuWQa2mZzfB92i3eI7Sgn7+gV1BeCsC55lbipziga7fQQQiCHCQWf
 iO88v51EWTXghHlT0Im4XkjVbcl9iso9As9Kj/8nv/PgPqgL2/Ye0QlMv3r3TWnjnMSX
 J/8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=CMgho6Lx0VG0Xe2KWf/8U1e85degQBAppXy34xmLOpM=;
 b=TGMwKbd2o/IztxUw7vAzMaCL3hq3KKwviCA/l7b/a+ppQj5Nzqvgg2hdiKFyvEanfT
 Om4R6DL/FzWapaaJR0Qmsrogoxa8Otogesl4F/xld72Qp6IKXvSuIOc4hhiKeX4SoToR
 RdwOmzo4AIvRxTHzXzZZGWtOx+rht7CR/LBYXnHXWPBCcO0SsQ+VC2X/jz+Pm74ZxGgB
 XGv6vwdBKOlLIF4f6B23MEo33WBW9FvNyxAKENNgOhsFt7ZVySZiPGzoPJThG9d8+HwR
 39cycLxx+xE1y48/sYwTw+DPvzjG08v5Sr0bcd3u4qtO4qbJlpMAD4wJW7PZURe7nlX+
 WYGg==
X-Gm-Message-State: AOAM53020+FBfgnEMeN4iSGGNIoigiGMVEJW39Ma8pVkZmqGYZ8o0WuN
 BhrWTOWV0U+LIuLpmLbo66ER9g==
X-Google-Smtp-Source: ABdhPJx4d62kpM9nxQS5JSsGrgrlNaWSmajFMs2CJNJ7w85rw5PpPCX1C95WW0vjuG6TAT0E8xxUXQ==
X-Received: by 2002:a17:903:30cd:b029:e4:93b5:3547 with SMTP id
 s13-20020a17090330cdb02900e493b53547mr7073414plc.53.1614570673787; 
 Sun, 28 Feb 2021 19:51:13 -0800 (PST)
Received: from [192.168.1.11] (174-21-84-25.tukw.qwest.net. [174.21.84.25])
 by smtp.gmail.com with ESMTPSA id k16sm8611557pfp.161.2021.02.28.19.51.13
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 28 Feb 2021 19:51:13 -0800 (PST)
Subject: Re: [PATCH v2 12/24] hw/arm/mps2-tz: Allow PPCPortInfo structures to
 specify device interrupts
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20210215115138.20465-1-peter.maydell@linaro.org>
 <20210215115138.20465-13-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <601fc757-eee9-723b-bad9-d8c28213faca@linaro.org>
Date: Sun, 28 Feb 2021 19:51:11 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <20210215115138.20465-13-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1035;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1035.google.com
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
Cc: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2/15/21 3:51 AM, Peter Maydell wrote:
> The mps2-tz code uses PPCPortInfo data structures to define what
> devices are present and how they are wired up.  Currently we use
> these to specify device types and addresses, but hard-code the
> interrupt line wiring in each make_* helper function.  This works for
> the two boards we have at the moment, but the AN524 has some devices
> with different interrupt assignments.
> 
> This commit adds the framework to allow PPCPortInfo structures to
> specify interrupt numbers.  We add an array of interrupt numbers to
> the PPCPortInfo struct, and pass it through to the make_* helpers.
> The following commit will change the make_* helpers over to using the
> framework.
> 
> Signed-off-by: Peter Maydell<peter.maydell@linaro.org>
> ---
>   hw/arm/mps2-tz.c | 36 ++++++++++++++++++++++++------------
>   1 file changed, 24 insertions(+), 12 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~


