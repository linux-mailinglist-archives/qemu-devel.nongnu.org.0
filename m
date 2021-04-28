Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D74D936CFEA
	for <lists+qemu-devel@lfdr.de>; Wed, 28 Apr 2021 02:12:48 +0200 (CEST)
Received: from localhost ([::1]:49850 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lbXou-0002XT-0e
	for lists+qemu-devel@lfdr.de; Tue, 27 Apr 2021 20:12:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50038)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lbXni-00028C-CK
 for qemu-devel@nongnu.org; Tue, 27 Apr 2021 20:11:34 -0400
Received: from mail-pj1-x1035.google.com ([2607:f8b0:4864:20::1035]:35525)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lbXne-0003s8-1o
 for qemu-devel@nongnu.org; Tue, 27 Apr 2021 20:11:33 -0400
Received: by mail-pj1-x1035.google.com with SMTP id
 h14-20020a17090aea8eb02901553e1cc649so5922758pjz.0
 for <qemu-devel@nongnu.org>; Tue, 27 Apr 2021 17:11:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=IosGfwcOELdKVm4cEfXwwDAjBPsk0+u59vuzrWdmjXg=;
 b=fV9yqQ0+kJu9J4sFKD1diWrV0P1AfmhhHTGQgcEaCgBGExuPxbgxrzL1P3dtLEP9BZ
 aYp/VmytMrcdlQw34lH5p449QKqLCSh0NNuKKdfYJn5zGXDDF+RpvA5IeidsoBJu/jgX
 ePdP0YTrxEbvqkRUDnFCHcfYaLU+mQIKWCWj9ShPy5jLMJozXo/XodksN0Nu3CcexbMm
 MlaV6Bkoyg4JYW7Z6bCQoSYmlO1/qRlLG2Wxm+qf5KYDrrPKEwctyifErizSwd6jcrcR
 w77iaGwwrXlx7sVwj92VuUGvLxeSZUYtKOze1vxvGt7PO8PBCJ7icrsebt9ZXxbY0/E9
 9dmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=IosGfwcOELdKVm4cEfXwwDAjBPsk0+u59vuzrWdmjXg=;
 b=dd7U1OtRxH+RJ/jCtinDgxZyNuRWH7qROGr1izDYPyidKbPfRmazENbSy9AyxmCGAP
 uTppfbqAECP1JcnT+Y/ZS14d9YsFnVvFwmtGalMx/LYTiZEuoZZ0mYUZk+iLOojmiHVr
 C2wFvXdFPNVHmOIlHilN/hQwKxmItY/QAMM1PVaY7OSvOHGMJiC65J28fE5iUZLxkfNV
 YGV9axvvP6fC1cto/t2893a9Y/6ZeNa6/oBUJyKKnZ9yeX1FYTXlAnXTj7hRzrJB/IvY
 XK+dVh0U31uLfk71ZciI+TllwM+1ZjLtgx1ZuFItVoAgygpLsrft3XKzI/DjBuM5an0I
 emlg==
X-Gm-Message-State: AOAM532w8K6R3m2swcw3jPsTIKxfN3ibtwjA69m3jHGoBbD7k9vhjSSw
 majoFKlHmZfFyEx3nV38RoSbow==
X-Google-Smtp-Source: ABdhPJy3C1FAJ75fzNKvAdvvwdFiIGeWIE8dk+tWx5AT4t8BX/UaKyOJyqEYiApZQZNZV7E+Glu0Sg==
X-Received: by 2002:a17:902:b70f:b029:ed:36ed:299d with SMTP id
 d15-20020a170902b70fb02900ed36ed299dmr12451380pls.48.1619568688506; 
 Tue, 27 Apr 2021 17:11:28 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.144.24])
 by smtp.gmail.com with ESMTPSA id mp3sm2823664pjb.15.2021.04.27.17.11.27
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 27 Apr 2021 17:11:28 -0700 (PDT)
Subject: Re: [PATCH 1/2] hw/sparc: Allow building the leon3 machine stand-alone
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
References: <20210427192658.266933-1-f4bug@amsat.org>
 <20210427192658.266933-2-f4bug@amsat.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <1e92cd61-5a55-94f5-42a3-d3c4021f3701@linaro.org>
Date: Tue, 27 Apr 2021 17:11:26 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <20210427192658.266933-2-f4bug@amsat.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
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
Cc: Fabien Chouteau <chouteau@adacore.com>, Thomas Huth <thuth@redhat.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 KONRAD Frederic <frederic.konrad@adacore.com>,
 Artyom Tarasenko <atar4qemu@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 4/27/21 12:26 PM, Philippe Mathieu-Daudé wrote:
> When building only the leon3 machine, we get this link failure:
> 
>    /usr/bin/ld: target_sparc_win_helper.c.o: in function `cpu_put_psr':
>    target/sparc/win_helper.c:91: undefined reference to `cpu_check_irqs'
> 
> This is because cpu_check_irqs() is defined in hw/sparc/sun4m.c,
> which is only built if the base sun4m machines are built (with
> the CONFIG_SUN4M selector).
> 
> Fix by moving cpu_check_irqs() out of hw/sparc/sun4m.c and build
> it unconditionally.
> 
> Signed-off-by: Philippe Mathieu-Daudé<f4bug@amsat.org>
> ---
>   hw/sparc/irq.c       | 61 ++++++++++++++++++++++++++++++++++++++++++++
>   hw/sparc/sun4m.c     | 32 -----------------------
>   hw/sparc/meson.build |  1 +
>   3 files changed, 62 insertions(+), 32 deletions(-)
>   create mode 100644 hw/sparc/irq.c

I think this code should be in target/sparc/.  There doesn't seem to be any 
reference to anything outside CPUSPARCState.


r~

