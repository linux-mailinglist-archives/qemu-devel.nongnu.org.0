Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C31DC31A49B
	for <lists+qemu-devel@lfdr.de>; Fri, 12 Feb 2021 19:33:25 +0100 (CET)
Received: from localhost ([::1]:36426 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lAdFs-0002hi-RA
	for lists+qemu-devel@lfdr.de; Fri, 12 Feb 2021 13:33:24 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:34488)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lAd9G-0007C5-2p; Fri, 12 Feb 2021 13:26:34 -0500
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e]:52637)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lAd9E-0006gL-NJ; Fri, 12 Feb 2021 13:26:33 -0500
Received: by mail-wm1-x32e.google.com with SMTP id l17so493821wmq.2;
 Fri, 12 Feb 2021 10:26:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=kmBvggFFFYDH98AcKDzKNpFRr21lyOf4CfsCLmm1uKw=;
 b=eU3TXKagqx6ro66ElVW8vi0I1v3pyfrRWnzBF0rpb9rcy9JJi2ZLP0Sle7nuE/t/iU
 qSj3DhWBUDqLlR9gzHsyh4GSccoF/V9QBa26YaqXYbnMcZwElE65kjU7Sq6nKuIUFTF/
 ff502hTAbWyKS+b1j2FD30lRHXA9ktZfd5OjWNr2cQBQOw8vgTk7Xjgg4EhdCViaxgdc
 Cn3/ERg6yMFXCG1uqRLL23KFHTnhmJgkFL5WupnBpFNwivf3HYs8O0vwK54T+624hCKc
 zaRe4H6THC3Je0X16Wln1V2vSYNUqGjrA57nAA9y5JRneTyokbvyy6IfxOhqLTHiDOlk
 eEhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=kmBvggFFFYDH98AcKDzKNpFRr21lyOf4CfsCLmm1uKw=;
 b=QmgQlHDjIAbEv25hIVQhdoUQahZiiZUb/FXg5mkypHoMEBiv+eTiuvH6ptclVYL58U
 dzp6wCTt+tFZYWy6CX47p8YFiUlrxHmEKBwxWW12eEJBxaGQdK/17ObfjZbCmw8EAkcK
 6aOvJg2GGTQYGjsgeIxNTxbWGPgm0XCP6n4vQhow+hHvsGk1ERjB1JNIIOKJ5Vs8s5UH
 wl5Wz2dQAGI2m0gEg6o1iEFoEGMsUaSrSCmVcH8ym7H+JevCOQQ+/76hZzNQhpYLhAOr
 tPM+08FvYsoJ/TrGHCB71RWtLt7R/1wOSFxI1cvJQiplj9+nv51PK9wD2Ti9RyVSr/Cy
 Hq7Q==
X-Gm-Message-State: AOAM531IplirVte6IvZM+ZzqJ/RF3ODLjsGauC2qVPWqOX8wWHCwESyB
 xS5sfaz3MYQ2qi209FZERDmS+3qp99Q=
X-Google-Smtp-Source: ABdhPJxqWcGKNTo7CJgzms1+kY7iE2PmjZWguJ9669GXNASv8UUsSbssRI8mGjDfFCjc4mREZ1wNYQ==
X-Received: by 2002:a7b:ce8c:: with SMTP id q12mr3757175wmj.127.1613154390581; 
 Fri, 12 Feb 2021 10:26:30 -0800 (PST)
Received: from [192.168.1.36] (68.red-83-57-175.dynamicip.rima-tde.net.
 [83.57.175.68])
 by smtp.gmail.com with ESMTPSA id s11sm7329436wra.82.2021.02.12.10.26.29
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 12 Feb 2021 10:26:30 -0800 (PST)
Subject: Re: [PATCH 09/24] hw/arm/mps2-tz: Make number of IRQs board-specific
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20210205170019.25319-1-peter.maydell@linaro.org>
 <20210205170019.25319-10-peter.maydell@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <7594a961-f607-d4c2-8c05-61976d1ef6df@amsat.org>
Date: Fri, 12 Feb 2021 19:26:29 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <20210205170019.25319-10-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32e;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x32e.google.com
X-Spam_score_int: -15
X-Spam_score: -1.6
X-Spam_bar: -
X-Spam_report: (-1.6 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25, NICE_REPLY_A=-0.119,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2/5/21 6:00 PM, Peter Maydell wrote:
> The AN524 has more interrupt lines than the AN505 and AN521; make
> numirq board-specific rather than a compile-time constant.
> 
> Since the difference is small (92 on the current boards and 95 on the
> new one) we don't dynamically allocate the cpu_irq_splitter[] array
> but leave it as a fixed length array whose size is the maximum needed
> for any of the boards.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>  hw/arm/mps2-tz.c | 15 ++++++++++-----
>  1 file changed, 10 insertions(+), 5 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

