Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E8CBC2DB035
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Dec 2020 16:39:15 +0100 (CET)
Received: from localhost ([::1]:34514 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kpCPy-0008WJ-W3
	for lists+qemu-devel@lfdr.de; Tue, 15 Dec 2020 10:39:15 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:53734)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kpCGf-0003W3-Pu
 for qemu-devel@nongnu.org; Tue, 15 Dec 2020 10:29:37 -0500
Received: from mail-wr1-x441.google.com ([2a00:1450:4864:20::441]:39552)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kpCGe-0003Rb-2Z
 for qemu-devel@nongnu.org; Tue, 15 Dec 2020 10:29:37 -0500
Received: by mail-wr1-x441.google.com with SMTP id c5so16614411wrp.6
 for <qemu-devel@nongnu.org>; Tue, 15 Dec 2020 07:29:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=1yPS4qw5GHnoSN7k4zxur4gtgoHtOUfUEci4/fSVrOw=;
 b=lIAYJkAHHvzEbj7ChYLdLCjEHrZxji/QZNcZ2tj2k/EnRrDhGWsgLI6Q++LhvmzWLO
 3f2Nun53De0zcS8tx4YQ8QO2pLkA7jfjxOdKBsOrft/9OAEUF9MPwah9w1Fz5Hs70ROG
 7qhHe3C3981A7Wv+7ZPPcONRQk5DMkDVo3vq6i+EFachsezaq8sA0p6ERv/YnfyB+G5i
 +KXJRus+YnbMuHcLBWTwJ88QPsR8Yn5skp+UJvT2muMLUQcnHY5Meg+gqj7bGHGvp8Na
 XMiGf6LhD9WDjqTYKinIvIgeKeZRwDxAHmA0Y4bp16/vxlBo5iOzjf1vLmDfXorSIRXe
 Z51w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=1yPS4qw5GHnoSN7k4zxur4gtgoHtOUfUEci4/fSVrOw=;
 b=sNxMbIAcy7Sv1DT9icaS5nXLNFOovKFgqgGQyYskVQkZkowRArM3bRd/LR+z/fPavw
 pMY+hrakkG4Vk89FVTlh5WqiyXLQZpMHrWEFB4Yk2V1NVj6FabAox/FAO8PDsjP2VzMY
 jBXAt1VK41523U/eN/D4cJ+RDH2tEjLh4i+xGb82KepxwVJO5P9zRWOWiUkWH5Pddr8T
 tcIurhi2c13pK7k6mbbSARJtO69X+YbNWYGRuLfjcWX6rI5R4qyu0zKz17xF4YuyShTM
 rCN4fvgLX2We+UWBasyrbnlpnLIq/OiXukThfvCF7x8yop0JrMdYIr5KWcKMqynkdOta
 0gYQ==
X-Gm-Message-State: AOAM530rE+gsI5PM9dCSnuiesHTg0ClMdgkrzKrua9dq0O2KxM/azNdY
 BWjbKD4mA41qn9KCd90eHIU=
X-Google-Smtp-Source: ABdhPJwSqeGnQNR8kX4O9uLoIqQE/o5dVyzX88kHm4A9oyJMZP+zZE/n0dxUBovcj/2C/4UTwKrliw==
X-Received: by 2002:adf:e710:: with SMTP id c16mr35002572wrm.295.1608046174522; 
 Tue, 15 Dec 2020 07:29:34 -0800 (PST)
Received: from [192.168.43.238] (65.red-95-127-157.staticip.rima-tde.net.
 [95.127.157.65])
 by smtp.gmail.com with ESMTPSA id t13sm3582931wrs.26.2020.12.15.07.29.32
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 15 Dec 2020 07:29:33 -0800 (PST)
Subject: Re: [PATCH v2 0/4] clock: Get rid of clock_get_ns()
To: Peter Maydell <peter.maydell@linaro.org>, qemu-devel@nongnu.org,
 Huacai Chen <chenhuacai@kernel.org>
References: <20201215150929.30311-1-peter.maydell@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <bad8872c-4e8a-e4f5-12d3-b70c206e5abf@amsat.org>
Date: Tue, 15 Dec 2020 16:29:31 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.0
MIME-Version: 1.0
In-Reply-To: <20201215150929.30311-1-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::441;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x441.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-0.001,
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
Cc: Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>, Luc Michel <luc.michel@greensocs.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 12/15/20 4:09 PM, Peter Maydell wrote:
> This patchseries makes some changes to the clock API:
>  * Remove clock_get_ns()
>  * Add clock_ticks_to_ns() to return number of nanoseconds
>    it will take the clock to tick N times
>  * clock_display_freq() to return prettily-formatted string
>    for showing humans the approximate clock frequency
> 
> This is based on discussions we had about these APIs a little while
> back.  The core driver here is that the clock objects internally
> store the period in units of 2^-32 ns, so both clock_get_ns() and
> clock_get_hz() are inherently returning a rounded-off result, which
> can be badly inaccurate for fast clocks or if you want to multiply it
> by a large tick count.
> 
> Ideally I'd like to get rid of clock_get_hz() as well, but
> that looks trickier than handling clock_get_ns().
> 
> Patch 4 borrows a lot of the concept from one of Philippe's that he
> sent out previously.
> 
> NB: tested with 'make check' and 'make check-acceptance' only.

Tested using loongson3-virt @2GHz
https://lists.gnu.org/archive/html/qemu-devel/2020-12/msg04036.html

Without your series:
qemu-system-mips64el: target/mips/cpu.c:385: mips_cp0_period_set:
Assertion `env->cp0_count_ns' failed.
Aborted (core dumped)

With: OK (cpu are not displayed in 'info qtree).

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

Thanks!

Phil.

