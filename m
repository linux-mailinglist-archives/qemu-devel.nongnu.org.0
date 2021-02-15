Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E936D31C363
	for <lists+qemu-devel@lfdr.de>; Mon, 15 Feb 2021 22:05:06 +0100 (CET)
Received: from localhost ([::1]:60300 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lBl3J-0004Dl-RB
	for lists+qemu-devel@lfdr.de; Mon, 15 Feb 2021 16:05:05 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:48236)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lBl1A-0002AY-Am
 for qemu-devel@nongnu.org; Mon, 15 Feb 2021 16:02:53 -0500
Received: from mail-pl1-x636.google.com ([2607:f8b0:4864:20::636]:45940)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lBl14-0006a1-5H
 for qemu-devel@nongnu.org; Mon, 15 Feb 2021 16:02:52 -0500
Received: by mail-pl1-x636.google.com with SMTP id b8so4342902plh.12
 for <qemu-devel@nongnu.org>; Mon, 15 Feb 2021 13:02:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=KEI60WRjq4C/qOpfB860PJkbu/GQeVcyQrFemf42j30=;
 b=aVdxq5nbVycgZWOkDKRZgWtMVuIuj4wJ895OZAj9GEdSkrWlhkkGLDXa86LNvFuRsi
 v7cN4uru8XupIUdgYYeHgiJXDfmIafvmzpwBALY1Rbd8mW3q9S08asUU6BLEVF3T32b6
 Iy74AYjzytVf6ljuZP3saCzsMc7ls03upYrcOU1gHfKFXoadIfPapm01nfnatk52w28w
 CroIZhi/JbkeyTOgH83bCgT3mN+usjQoScvgDChRXwdMky2lq3AHkcwGESAJCOWGJZp7
 KxKp9pj9pp7di3OFk2l7JitWcFkCyukpP/vEgu8GIKBmVRx6W0pzMKqk0BSp2HxKZJdm
 eGkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=KEI60WRjq4C/qOpfB860PJkbu/GQeVcyQrFemf42j30=;
 b=RncWfSij8FyBHXWXw/MGzKJMoSTlvH+lPjRgR3B4uUiMG7r407pAMrBfxVzm8tg38o
 R9wZ5Qb1bHDLqnzBKJXO2swmle8lKKpCxNfqRgc+j5PHNr1ArTNq4EyvIrAkGrHrWmRV
 12lkdPMM+IbFKD+vJQRbwIJpSR4hBXo/WJBvQl2gjXORz63WqotOUZO5FZg03/98Gowf
 tYZFBeFGQ1+HlPGA0M8lydJW859Fp2HIqMytnXVJGK3LCThMZPbGM0TxWkke3HpqMdMc
 RfeZa2SJe3SrxFwC6vEkWbeb6gYXbrvhnO3SzLNA1I676OlWsWaUl1S4MXXjvQtguPaN
 BNmA==
X-Gm-Message-State: AOAM531ODOTq60Q4PZhwUah4dqbmTvjldvtgM5tj0zrtMU38OjwTcnkD
 2PHEHq0RU5q3mElnQ9jcja+SFw==
X-Google-Smtp-Source: ABdhPJw0k+34DcS/tPikzJY+JCbEQnSY1SMIFXHnIZ+eN86cEmP8POGDkhH+lxE70e633/q7XGuRmA==
X-Received: by 2002:a17:90a:4fa1:: with SMTP id
 q30mr688006pjh.230.1613422964484; 
 Mon, 15 Feb 2021 13:02:44 -0800 (PST)
Received: from [192.168.1.11] (174-21-84-25.tukw.qwest.net. [174.21.84.25])
 by smtp.gmail.com with ESMTPSA id l21sm339149pjy.31.2021.02.15.13.02.43
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 15 Feb 2021 13:02:43 -0800 (PST)
Subject: Re: [RFC PATCH 29/42] linux-user/mips64: Support the n32 ABI for the
 R5900
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
References: <20210214175912.732946-1-f4bug@amsat.org>
 <20210214175912.732946-30-f4bug@amsat.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <6166652f-0046-450d-7b35-e95278fa2f5c@linaro.org>
Date: Mon, 15 Feb 2021 13:02:42 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20210214175912.732946-30-f4bug@amsat.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::636;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x636.google.com
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
Cc: Thomas Huth <thuth@redhat.com>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Fredrik Noring <noring@nocrew.org>, Laurent Vivier <laurent@vivier.eu>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Aurelien Jarno <aurelien@aurel32.net>, "Maciej W. Rozycki" <macro@orcam.me.uk>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2/14/21 9:58 AM, Philippe Mathieu-Daudé wrote:
> From: Fredrik Noring <noring@nocrew.org>
> 
> Recognise the R5900, which reports itself as MIPS III, as a 64-bit CPU
> supporting the n32 ABI.
> 
> Signed-off-by: Fredrik Noring <noring@nocrew.org>
> Reviewed-by: Laurent Vivier <laurent@vivier.eu>
> Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
> Tested-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
> Message-Id: <5bea109f0c140da6a821aa7f9705d4b3717e86dc.1541701393.git.noring@nocrew.org>
> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
> ---
>  linux-user/mips64/target_elf.h | 3 +++
>  1 file changed, 3 insertions(+)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~


