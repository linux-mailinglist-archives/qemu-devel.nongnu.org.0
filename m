Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 15B13668ED9
	for <lists+qemu-devel@lfdr.de>; Fri, 13 Jan 2023 08:07:44 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pGE9K-0007kS-VS; Fri, 13 Jan 2023 02:06:51 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pGE8v-0007hA-3k
 for qemu-devel@nongnu.org; Fri, 13 Jan 2023 02:06:30 -0500
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pGE8s-0006m6-3Y
 for qemu-devel@nongnu.org; Fri, 13 Jan 2023 02:06:23 -0500
Received: by mail-wm1-x335.google.com with SMTP id
 p1-20020a05600c1d8100b003d8c9b191e0so16712716wms.4
 for <qemu-devel@nongnu.org>; Thu, 12 Jan 2023 23:06:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=LH3sepORDY2KgUiDZBnb6Xmc86OrGj5PwY8+nhfLbpM=;
 b=dPWBT5WO/AKE5sqm4K3+cekyBn6wTpk2cPWHOV9j2fivP5sU9M5wwhS/fMgYsR42J5
 8C2b6IaK0yYnRCVI0j2S4BsLJPmnc3CSDcRiarebI7uVfPUb2iNTGY/z4COO6va+/ZMX
 2ycT16vI0mGeGb3qjFZJrmwFWc+DgFpzvaMssHTZNZ14GkSPVv1S5bQpWs/usRnhahBR
 vkQhh7SCjeWyNQ+41fEypyPyPZYq5qgFrW6hnmXkwlGjNyXtTJlyVRyRv9S+brSm1n/r
 U7i0SKsTst05cn/jg1V/POgCzCzk/Tfm//uFodJqRke1tpFdFw7ikMe+XsFSCzXFlRSM
 jfGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=LH3sepORDY2KgUiDZBnb6Xmc86OrGj5PwY8+nhfLbpM=;
 b=31GrxZX8nt8e1bufiV62nxPi/0StCQAS8VSLxRw1cJQQg6Lt0RIcSSBYkMRC6E68x2
 qKqMtKQGpa+0Pf04hxUwOcrMcUxclyYGncHBEcgS8VavxEgCqWy6A5WhwAg/zirh66HZ
 kcJw9N4YhRzWJrKGuFgmjCA6F8Q9LKccT9uGizN7Xnx9jUuUZICQmJrPBWeP4agtHGoF
 pQ43jY9e25YErBLyiT+IL071x1S4wha00IvIEOYZCFUTYly2cVtPgvMfUpvrC6drr3+7
 JMvvO8Gu6q2Jjun3kogIsmytmfxvPGK2zErN5dgteKIvWvz7Nvm3hX9yOpYO/gcD4W9w
 Du5Q==
X-Gm-Message-State: AFqh2koNr8rlGA7RdCOzGhjjPmW2nAr0gnVnsDZCstmkp91D0Qpyzhvy
 FVqCNWI8oPmps9FezS0P8mjhkA==
X-Google-Smtp-Source: AMrXdXtxEkVA/2KaU7WVotgsVHPfd75ojrh0Dd4qKP9yKfnw/7kXdai72a+WpQt+iBpKINUK3KhRCw==
X-Received: by 2002:a05:600c:47d1:b0:3d3:496b:de9d with SMTP id
 l17-20020a05600c47d100b003d3496bde9dmr57356663wmo.34.1673593579864; 
 Thu, 12 Jan 2023 23:06:19 -0800 (PST)
Received: from [192.168.30.216] ([81.0.6.76]) by smtp.gmail.com with ESMTPSA id
 l27-20020a05600c2cdb00b003a84375d0d1sm31469383wmc.44.2023.01.12.23.06.19
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 12 Jan 2023 23:06:19 -0800 (PST)
Message-ID: <bd9c76f2-fe5b-8e61-8cd2-f0aeec5a44a7@linaro.org>
Date: Fri, 13 Jan 2023 08:06:18 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.6.1
Subject: Re: [PATCH] hw/mips/boston.c: rename MachineState 'mc' pointer to 'ms'
Content-Language: en-US
To: Daniel Henrique Barboza <dbarboza@ventanamicro.com>, qemu-devel@nongnu.org
Cc: Paul Burton <paulburton@kernel.org>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>
References: <20230111172133.334735-1-dbarboza@ventanamicro.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230111172133.334735-1-dbarboza@ventanamicro.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::335;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x335.google.com
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

On 11/1/23 18:21, Daniel Henrique Barboza wrote:
> Follow the QEMU convention of naming MachineState pointers as 'ms' by
> renaming the instance in create_fdt() where we're calling it 'mc'.
> 
> Cc: Paul Burton <paulburton@kernel.org>
> Cc: Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>
> Suggested-by: Philippe Mathieu-Daudé <philmd@linaro.org>
> Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
> ---
>   hw/mips/boston.c | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)

Queued on mips-next, thanks!


