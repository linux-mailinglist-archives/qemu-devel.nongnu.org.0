Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4EBF5332A4F
	for <lists+qemu-devel@lfdr.de>; Tue,  9 Mar 2021 16:24:33 +0100 (CET)
Received: from localhost ([::1]:52732 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lJeDo-00027K-Ac
	for lists+qemu-devel@lfdr.de; Tue, 09 Mar 2021 10:24:32 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:48586)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lJdg6-0004dk-2J
 for qemu-devel@nongnu.org; Tue, 09 Mar 2021 09:49:42 -0500
Received: from mail-ed1-x530.google.com ([2a00:1450:4864:20::530]:35449)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lJdg3-0007go-8O
 for qemu-devel@nongnu.org; Tue, 09 Mar 2021 09:49:41 -0500
Received: by mail-ed1-x530.google.com with SMTP id p1so20683209edy.2
 for <qemu-devel@nongnu.org>; Tue, 09 Mar 2021 06:49:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=lvgaXnTpC32VAeFI+Ddjvir/jgcWTzYIpP6XaAm03KU=;
 b=LmO5bIXr9y/XFoext3wmtNJsnrBEQVZ9R/tlrzReDM8Sv56UcKM2iobMUy4R/EnYRj
 j6aPWPVgS9dZQ7kuEoZ/ukXLdrmuYnImC5gt8XT4b1HbsOMq8yZTjkj9kTxo+ldE4m6V
 vVICIIuleVe0TKGXbCM+Y6oVVDPo4w7JoMyHmQ9UdDMCee9sCjsTA5A0J317idNOkBCD
 SQi38K9zAafk33Nr5+wDd6Vf4l3nBegZnJqTQBpyfC9kiLzwRFNtmd3LGIvTahmyaCi1
 yhDmnW8xmNK/VxK8XeYkA3HBSsQasfdMmaA95dZbg5Q7Ogp8mC3ZLp8O2eQZOo9NXnZE
 40Fg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=lvgaXnTpC32VAeFI+Ddjvir/jgcWTzYIpP6XaAm03KU=;
 b=nX+2XVD4B/41WJdVhB2+Xf6qas+ONMEYeS1dyr5E8Xl3OlgriRtllOHpRW8C4T6Qxe
 d94gs38CK6VIjZ196L9NdEnf0UaRFtwH6EgCclzfaZF92qlRi2iiFB1vcByrSgQvDFx6
 8LO+LFUNBASWPuFCCUNe63d/cHd4NmWQy8noWQPh3my6AQ8iIcQFOWkUftlO8kKROFym
 MphQ8yNwmUhQy44EO+ZOo3ofdWQ/waBPf3LP6AvNc8T07BDfs+/6HqGAnKBZc5cu1k+X
 nrDNtDJdFc0QXRReCJjmru0DXe0O/p/C4/zSe+SXAhPUXEK5CcrdxXE7MTqHj1Hbxf0A
 BghA==
X-Gm-Message-State: AOAM5332WCGtGIG5APjYYfHv38rPTp2odzQWZDT5RFnJ7sbiEP5Ckhs0
 R6tstQqPyuSHuZ54pGm2JMU=
X-Google-Smtp-Source: ABdhPJz8asr+9nMK9C0u+IAA7CPa1NP+lLc5fZ0cRTd4eUNZ6XQl+8UmefjB0BvjLu/0NmM54L1ABQ==
X-Received: by 2002:aa7:da98:: with SMTP id q24mr4630952eds.84.1615301377804; 
 Tue, 09 Mar 2021 06:49:37 -0800 (PST)
Received: from [192.168.1.36] (68.red-83-57-175.dynamicip.rima-tde.net.
 [83.57.175.68])
 by smtp.gmail.com with ESMTPSA id a22sm8683748ejr.89.2021.03.09.06.49.36
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 09 Mar 2021 06:49:37 -0800 (PST)
Subject: Re: [PATCH] target/mips: Use gen_load_gpr[_hi]() when possible
To: qemu-devel@nongnu.org
References: <20210308131604.460693-1-f4bug@amsat.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <666c6470-af3e-760e-49c5-00507a1e6f89@amsat.org>
Date: Tue, 9 Mar 2021 15:49:36 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <20210308131604.460693-1-f4bug@amsat.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::530;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-ed1-x530.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
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
 Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 3/8/21 2:16 PM, Philippe Mathieu-Daudé wrote:
> Use gen_load_gpr[_hi]() instead of open coding it.
> 
> Patch generated using the following spatch script:
> 
>   @gen_load_gpr@
>   identifier reg_idx;
>   expression tcg_reg;
>   @@
>   -if (reg_idx == 0) {
>   -    tcg_gen_movi_tl(tcg_reg, 0);
>   -} else {
>   -    tcg_gen_mov_tl(tcg_reg, cpu_gpr[reg_idx]);
>   -}
>   +gen_load_gpr(tcg_reg, reg_idx);
> 
>   @gen_load_gpr_hi@
>   identifier reg_idx;
>   expression tcg_reg;
>   @@
>   -if (reg_idx == 0) {
>   -    tcg_gen_movi_i64(tcg_reg, 0);
>   -} else {
>   -    tcg_gen_mov_i64(tcg_reg, cpu_gpr_hi[reg_idx]);
>   -}
>   +gen_load_gpr_hi(tcg_reg, reg_idx);
> 
> Suggested-by: Richard Henderson <richard.henderson@linaro.org>
> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
> ---
>  target/mips/translate.c | 29 ++++++-----------------------
>  1 file changed, 6 insertions(+), 23 deletions(-)

Thanks, applied to mips-next.

