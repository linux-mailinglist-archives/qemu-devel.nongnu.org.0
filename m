Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C030471D32
	for <lists+qemu-devel@lfdr.de>; Sun, 12 Dec 2021 22:08:24 +0100 (CET)
Received: from localhost ([::1]:49352 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mwW50-0000VY-Ma
	for lists+qemu-devel@lfdr.de; Sun, 12 Dec 2021 16:08:22 -0500
Received: from eggs.gnu.org ([209.51.188.92]:52498)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mwW3W-0007dI-Mc
 for qemu-devel@nongnu.org; Sun, 12 Dec 2021 16:06:50 -0500
Received: from [2607:f8b0:4864:20::1033] (port=43957
 helo=mail-pj1-x1033.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mwW3V-0003Po-0A
 for qemu-devel@nongnu.org; Sun, 12 Dec 2021 16:06:50 -0500
Received: by mail-pj1-x1033.google.com with SMTP id
 nh10-20020a17090b364a00b001a69adad5ebso11786161pjb.2
 for <qemu-devel@nongnu.org>; Sun, 12 Dec 2021 13:06:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=CZSKqQNdwq+uSDpJj/BsSq8gJLEsiAzCUwHYyqdtFUc=;
 b=S+JsUip3sPivBbQNhYd4OoU9/WJRB09qkIb0Sa0rgDcdw+jmV9S6uT5XaG2LyKdTxB
 CGPuJQuTSrbsDlGDbfrpBEGmnX7qCZfv0lMr4uZv4ekCJ6TRGlPGsVNDnPUxcHwVVkSr
 FOA3YEjmj/fD9dZXP4CETC3c4x+ABxVFJxOsezAchGSM3nN6ITumsu3VPS16r93X5DyW
 tLwPxvnmgptfq8REFkfkFkHTqYRCroWYx61sub5Ufhy5hpXBj5WLgK56RVIlRkefhe6R
 EtA8/iChK4FsThmBZfsf7WyEYZCV5sENmQE8AWhZpNSqs61jQSLsf1Bf/Vg6jJKsZVSV
 ScuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=CZSKqQNdwq+uSDpJj/BsSq8gJLEsiAzCUwHYyqdtFUc=;
 b=EOe4VzZ5gIPCPuyPNhwHjsFuQ/2M+06SJ3aVmRFgX+QzNGk6Ix6dyNI69joV72BfM9
 4BVOjtu/k8vwB15UAoKdXpZNM/QYxwrXbu2bO29baDw6H7tBxLKfS1xKzibb2Dncmw2y
 QkP83XLlF3x34n4HQs59ELPm+N7n9IfwCn9nrQiohaDrqsMlR3ebgulS/M2gmYLQdlhi
 dRkXOfDyAxzlJ3TQhQdo+jp9wqPXE+638r/0XJT4ni2vUM60t7v4EUyJK6Zvf63wFukU
 zGJWDBBG7GuVvzdDBIz9sTKrc5PbOs0RuU9I+DbTsHM8CCyoQppxtKTQrWt7blMhxqHF
 om+A==
X-Gm-Message-State: AOAM5319Mn3CxAQRXHSU6OJhAOWNgHjlf7poO/7GYyMPlOqWt5MTFhX8
 LBMTeg02qbyKhpMRmBF3BOFNzQ==
X-Google-Smtp-Source: ABdhPJxephPRrJbUCMmjA7Epu1n7jnWXrCdm5h/5ld6Yyi55V9EgZfxoxTt6++hqvh6yEXi9WCNEYw==
X-Received: by 2002:a17:902:c105:b0:142:2441:aa24 with SMTP id
 5-20020a170902c10500b001422441aa24mr91043380pli.44.1639343207453; 
 Sun, 12 Dec 2021 13:06:47 -0800 (PST)
Received: from [192.168.1.11] (174-21-75-75.tukw.qwest.net. [174.21.75.75])
 by smtp.gmail.com with ESMTPSA id r13sm7426175pga.29.2021.12.12.13.06.46
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 12 Dec 2021 13:06:47 -0800 (PST)
Subject: Re: [PATCH 20/26] hw/intc/arm_gicv3_its: Use enum for return value of
 process_* functions
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20211211191135.1764649-1-peter.maydell@linaro.org>
 <20211211191135.1764649-21-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <f63f8a8e-f88b-c8ac-3fba-6604fc242d56@linaro.org>
Date: Sun, 12 Dec 2021 13:06:45 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <20211211191135.1764649-21-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::1033
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::1033;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1033.google.com
X-Spam_score_int: -33
X-Spam_score: -3.4
X-Spam_bar: ---
X-Spam_report: (-3.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-2.051,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
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
Cc: Shashi Mallela <shashi.mallela@linaro.org>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 12/11/21 11:11 AM, Peter Maydell wrote:
> When an ITS detects an error in a command, it has an
> implementation-defined (CONSTRAINED UNPREDICTABLE) choice of whether
> to ignore the command, proceeding to the next one in the queue, or to
> stall the ITS command queue, processing nothing further.  The
> behaviour required when the read of the command packet from memory
> fails is less clearly documented, but the same set of choices as for
> command errors seem reasonable.
> 
> The intention of the QEMU implementation, as documented in the
> comments, is that if we encounter a memory error reading the command
> packet or one of the various data tables then we should stall, but
> for command parameter errors we should ignore the queue and continue.
> However, we don't actually do this.  To get the desired behaviour,
> the various process_* functions need to return true to cause
> process_cmdq() to advance to the next command and keep processing,
> and false to stall command processing.  What they mostly do is return
> false for any kind of error.
> 
> To make the code clearer, replace the 'bool' return from the process_
> functions with an enum which may be either CMD_STALL or CMD_CONTINUE.
> In this commit no behaviour changes; in subsequent commits we will
> adjust the error-return paths for the process_ functions one by one.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>   hw/intc/arm_gicv3_its.c | 59 ++++++++++++++++++++++++++---------------
>   1 file changed, 38 insertions(+), 21 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

