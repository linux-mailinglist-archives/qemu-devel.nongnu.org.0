Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B55635ADF6
	for <lists+qemu-devel@lfdr.de>; Sat, 10 Apr 2021 16:07:25 +0200 (CEST)
Received: from localhost ([::1]:38024 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lVEGh-0007YU-T6
	for lists+qemu-devel@lfdr.de; Sat, 10 Apr 2021 10:07:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35100)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lVEFJ-0006xS-Ji
 for qemu-devel@nongnu.org; Sat, 10 Apr 2021 10:05:57 -0400
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332]:38860)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lVEFI-00010X-0r
 for qemu-devel@nongnu.org; Sat, 10 Apr 2021 10:05:57 -0400
Received: by mail-wm1-x332.google.com with SMTP id
 y20-20020a1c4b140000b029011f294095d3so6186657wma.3
 for <qemu-devel@nongnu.org>; Sat, 10 Apr 2021 07:05:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=dLeZ86zxH2cnqFYA1YFnHpSgKa+15Hf/oq/gY2EndKk=;
 b=uyRrBCZyM0tQi9Ie0C6K5j9j+fUlSfKoD+d5bOeTbyWJn5Dqw3EnphShFMezQA9A2G
 L0naWf6LPaVlDAHBkUtlry/Pkow12og7bYiiMxfbBlm9Ig4z8YLPxDZ8CD2EplzOLwGd
 QvlkOfPrirpN+e+cJmS9qwdii7pgo/nb23f1z6zhv9U/DUAAfgSA24DPsi+SBUT6+udo
 0PZL2EyLxBvN3uKMJLfsX+3Fb3IxplSEBVgjYKufjQkfZh3UZBr+nzYpvllFFfnRQEo0
 lsoAEJEbgIY3Lw0PjsMdB8ePm9Tjb8xTylWydR4cCpydQZJx7C1m4egWuJGmWtZn/8me
 kBFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=dLeZ86zxH2cnqFYA1YFnHpSgKa+15Hf/oq/gY2EndKk=;
 b=klA38QyqrqU6wmTTbJ5JwcgvyjfbVpG1RvwQ7ZSzntwvBt2+U+3P9gEcxEmy9Bb0gg
 eFd8wsDXM08J/UQ5gvE1zBthF4C898LSd/cTPHm9dWHMn5a8wi0HBGS2GjZ8O9W12ZEi
 w0pwsFmBH+zOxixqUcuCEWTY5V2Gpdo9owFbxae6rqPsH62VEg6ZZaIQleewZB/d4f9p
 JWa3L6QDnYZk9LDCAYAPlo12s5VdrreqVSjgltR0xON6PgguuzNvtlfEgZ+j88/86owE
 3EAvbBugqnGOw7Z1LzoOe7VRgSAbJWLwZCeOj5HFIhWNM3Dw95nZ5lKW7vyaoY2n1sFN
 WxmA==
X-Gm-Message-State: AOAM533aLX38tVzRPHgjB2HllVkbcDmqx6mQ4T+0FaMWgFb3aBheusVx
 I8sTApWizBYsybXGkQlocSs=
X-Google-Smtp-Source: ABdhPJz3X5xLn1W/42GYiTE92E7ryYQj7iIJut7bi6nLXA7xUwb9JwbCpnGfAX7yqSns2YSrIiMhyA==
X-Received: by 2002:a7b:cbc4:: with SMTP id n4mr18824890wmi.153.1618063553839; 
 Sat, 10 Apr 2021 07:05:53 -0700 (PDT)
Received: from [192.168.1.36] (17.red-88-21-201.staticip.rima-tde.net.
 [88.21.201.17])
 by smtp.gmail.com with ESMTPSA id s64sm1977226wmf.2.2021.04.10.07.05.52
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 10 Apr 2021 07:05:53 -0700 (PDT)
Subject: Re: [RFC PATCH-for-6.1 v2 6/6] hw/mips/loongson3_virt: Raise CPU
 clock to 2 GHz
To: Huacai Chen <chenhuacai@kernel.org>
References: <20210409093623.2402750-1-f4bug@amsat.org>
 <20210409093623.2402750-7-f4bug@amsat.org>
 <CAAhV-H76XQZxvp9b2fE-R-Eq26GViaPR-iC2tG6PYhWtxNasxA@mail.gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <9f07acda-8949-de4e-a00a-192a4b3c6179@amsat.org>
Date: Sat, 10 Apr 2021 16:05:51 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <CAAhV-H76XQZxvp9b2fE-R-Eq26GViaPR-iC2tG6PYhWtxNasxA@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::332;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x332.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>, Luc Michel <luc@lmichel.fr>,
 QEMU Developers <qemu-devel@nongnu.org>, Hao Wu <wuhaotsh@google.com>,
 Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi Huacai,

On 4/10/21 4:43 AM, Huacai Chen wrote:
> Hi, Philippe,
> 
> On Fri, Apr 9, 2021 at 5:36 PM Philippe Mathieu-Daudé <f4bug@amsat.org> wrote:
>>
>> Commit cd3a53b727d ("clock: Add clock_ns_to_ticks() function")
>> removed the limitation of using clock with a frequency of 1 GHz
>> or more.
>>
>> The previous commit converted the MIPS CP0 timer to use this
>> new clock_ns_to_ticks() function. We can now use a clock of
>> 2 GHz with the Loongson3 virt board.
> Yes, we can do this, but why should we do this? I don't think this can
> bring any advantages.

IIRC this was how you sent the earlier series, then we had to reduce
the frequency to <1GHz due to the DIV#0 bug. Now it is fixed I thought
you'd get this back.

I spent time with the R4K timer because it is often used by embedded
firmwares, and a mismatch with the CPU clock makes firmware not work
well. I suppose when using Linux guests it is not a real issue, because
1/ if there is another timer (different peripheral on a system-on-soc)
Linux will use it first, 2/ Linux does some early check to adapt with
the tick rate IIRC (it doesn't assume a precise rate).

I'm fine with the current Loongson3 virt board behavior with TCG,
so let's disregard this patch.

Thanks,

Phil.

