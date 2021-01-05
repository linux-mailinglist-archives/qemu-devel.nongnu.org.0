Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 851702EABC3
	for <lists+qemu-devel@lfdr.de>; Tue,  5 Jan 2021 14:21:20 +0100 (CET)
Received: from localhost ([::1]:51004 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kwmH1-0006JG-IB
	for lists+qemu-devel@lfdr.de; Tue, 05 Jan 2021 08:21:19 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:35536)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <konrad@adacore.com>)
 id 1kwmDs-00059z-VW
 for qemu-devel@nongnu.org; Tue, 05 Jan 2021 08:18:04 -0500
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435]:45927)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <konrad@adacore.com>)
 id 1kwmDo-0007mG-Fy
 for qemu-devel@nongnu.org; Tue, 05 Jan 2021 08:18:04 -0500
Received: by mail-wr1-x435.google.com with SMTP id d26so36091525wrb.12
 for <qemu-devel@nongnu.org>; Tue, 05 Jan 2021 05:17:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=adacore-com.20150623.gappssmtp.com; s=20150623;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=/y/q1ke1UCW8O50/yWmv8WZM/iQni9XqQWd4gTab26g=;
 b=Jx3lBaD5RE9/h5g3cdAfROLQEGk0wilqgl1unFVOktCCSIB6lFRmZlw4FZtgFmTDXA
 09zuOwr/d3mlCNKhzNXMDUsWTAFqS7ODK0XuzlsrPhNHq/njUS5jY0t3Ld8+0ibXYwCJ
 wHyFTMpRyWEopULz+c09B1pXYdJmFdlgiyICv84L1IPegps3rsqgQD1SlGm2eoTkf6J0
 b6fXIWiq2qFMR6xVq/k3ApTtgTYzWpM8syjmiHo/njSMB4q092GDAu+gSTXKPUOqobTs
 SNz8dI9UIlsiwz6GqFrFSyhYa9Q3oQdlCIh+/F8mW27Uv9tXRGmIxvLFCARoBvaIqma3
 xV5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=/y/q1ke1UCW8O50/yWmv8WZM/iQni9XqQWd4gTab26g=;
 b=fU8ACxSxUW5GA3wvaWO3LDhJhb56Jbt7QPbswbFFtbK0Om3uMI2Tul75QkuYLMXuoj
 wax/+/kPDWOvCYK+XAMhmtR0FLbcl/X6tdx1D/Y1rafNIztsJwn8Pq3mPDZvKrhbIUIr
 UtyLWcgQB22osTliow4FaRNPBEB+C1iJfLaCzGs/ObrY0neq+IVVrvx0wPhsYKxKdt7S
 d3km2FlNAcAddEmpF8f6JIWwJuTorIiHG5AKo6hhRM42BzYnbMLr86k9u+CffkD4JvMv
 R+djJcR4h1vevQlKS7/cY5ZQIrCYLl36sEa4zppvWIcJqr8ixU6mmepAk8UaL+PzrYC1
 ouZg==
X-Gm-Message-State: AOAM532Xxmhnlrz1jwwaWYEINYnqugu39FO8VehfE465JSNhmheGE4OQ
 KButyVXY8U/16/rlEObRe7F2Rg==
X-Google-Smtp-Source: ABdhPJx1unIMhCes/i+bD2QcGfkiEoWrqhJ5SRlEBcYW2nRaE6DHaOvuiGSYN+cewNmd5lhwp31m9A==
X-Received: by 2002:a5d:4ccf:: with SMTP id c15mr85791588wrt.237.1609852678443; 
 Tue, 05 Jan 2021 05:17:58 -0800 (PST)
Received: from localhost.localdomain
 (alille-651-1-136-169.w90-1.abo.wanadoo.fr. [90.1.135.169])
 by smtp.gmail.com with ESMTPSA id e15sm96576559wrx.86.2021.01.05.05.17.57
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 05 Jan 2021 05:17:57 -0800 (PST)
Subject: Re: [PATCH 0/2] sparc/leon3: Make grlib-irqmp handle its own inbound
 IRQ lines
To: Peter Maydell <peter.maydell@linaro.org>, qemu-devel@nongnu.org
References: <20201212144134.29594-1-peter.maydell@linaro.org>
From: Fred Konrad <konrad@adacore.com>
Message-ID: <d3e97a15-2794-8864-4d63-07be8015ec29@adacore.com>
Date: Tue, 5 Jan 2021 14:17:57 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <20201212144134.29594-1-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: fr
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::435;
 envelope-from=konrad@adacore.com; helo=mail-wr1-x435.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, NICE_REPLY_A=-0.249, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Artyom Tarasenko <atar4qemu@gmail.com>, Fabien Chouteau <chouteau@adacore.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



Le 12/12/20 à 3:41 PM, Peter Maydell a écrit :
> Currently the GRLIB_IRQMP device is used in one place (the leon3
> board), but instead of the device providing inbound gpio lines for
> the board to wire up, the board code itself calls
> qemu_allocate_irqs() with the handler function being a set_irq
> function defined in the code for the device.
> 
> Patch one in this series refactors this into the standard setup of a
> device having input gpio lines.  The main motivation here is that it
> squashes a trivial Coverity memory leak warning.  Patch two just
> removes a stray unused typedef that I noticed in passing.
> 
> Incidentally I suspect the irqmp_ack logic could also be done more
> neatly, but I didn't feel like getting into that at this point.

Indeed, and I've some cleanup patches for that, but never had time to submit
them.  Hopefully sometime in 2021 :).

Cheers,
Fred

> 
> Tested by booting the 'buildroot' image downloadable from
> https://www.gaisler.com/anonftp/linux/linux-2.6/images/leon-linux-4.9/leon-linux-4.9-1.0/up/
> and runnable with
>   ./build/sparc-all/qemu-system-sparc -M leon3_generic -display none -serial stdio -kernel image.ram
> 
> 
> thanks
> -- PMM
> 
> Peter Maydell (2):
>    hw/sparc: Make grlib-irqmp device handle its own inbound IRQ lines
>    include/hw/sparc/grlib.h: Remove unused set_pil_in_fn typedef
> 
>   include/hw/sparc/grlib.h |  4 ----
>   hw/intc/grlib_irqmp.c    |  5 ++++-
>   hw/sparc/leon3.c         | 21 +++++++++------------
>   3 files changed, 13 insertions(+), 17 deletions(-)
> 

