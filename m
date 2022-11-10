Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EEBEF623B58
	for <lists+qemu-devel@lfdr.de>; Thu, 10 Nov 2022 06:37:28 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ot0FK-0005ed-Dw; Thu, 10 Nov 2022 00:37:02 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ot0FH-0005eP-SD
 for qemu-devel@nongnu.org; Thu, 10 Nov 2022 00:36:59 -0500
Received: from mail-pf1-x436.google.com ([2607:f8b0:4864:20::436])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ot0FG-0006I3-B7
 for qemu-devel@nongnu.org; Thu, 10 Nov 2022 00:36:59 -0500
Received: by mail-pf1-x436.google.com with SMTP id k22so929624pfd.3
 for <qemu-devel@nongnu.org>; Wed, 09 Nov 2022 21:36:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=0CNUmz7DXSjPTEoAjbg3LOvu78GVWEtCMlj1bAhW/Oc=;
 b=mLEfifdgvo3bDmsnhgnuDBJI7wTTSo7ZxAjltBq9Ov9+DesSNinYJhc1yZn7Z5uwAW
 ykab+smt6/bDvz6VK/zFiE48m/lDAR4H0JW+nnLnMR7xGjjH6xTYaMgEJkcBxlk9XMvc
 +v4YDV4UivwCWKbkMDzEdCDoA1du2osO0G6SI/ZJU4oSiXvX5wo3wBlN6zEXWb7nCu0R
 IpHieDfKjp/VC5bDd5SJUyqqc3MCRAKN14Mm/NNmUaI10JObRbmaBr59K+R7ZReaNs/7
 aDdkCLRn2F3GL4V8DnDeCh1CNDN+SyZQWE/rr9Au+vxaoC9kbOADxecmOM+Snu997Fla
 mtDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=0CNUmz7DXSjPTEoAjbg3LOvu78GVWEtCMlj1bAhW/Oc=;
 b=1+/Ym6YO7Ev5KqdR9w0yVuPRuejxmJ7uySG1mH17mGUZudWkq4iU7hYtvILapE2BsC
 DaaN5wmq3m4RvtFlZy0xZuF2er3Y70/giJcxju3CVdoXGbPVMPDSkkKcNSnZefdEIEQb
 RqaJxdo7/Ouk58QHjQi+y9n4wel3ssaRR9KVREtn+8rx/o8Gv8izEYjDns/P1S+wotVh
 WWgow6FKDS/DLAF+g+ymDhDjPkyTfnjf4e0GA56XD0LNCy+Zviy78c179cI0Xm+/WDcz
 MDIqTSWTiFihEFIzxTCLkkgRzPeRz+YJ2x5vADDEQVfHph352UknGivbR9/uu6dSbkAl
 D8Ww==
X-Gm-Message-State: ACrzQf3WaelK6KmUHz7kgvcD7ylX24z+dFjzTOkIwrJLL5dk+aEvZFaI
 SUXBJ90gYihcQb5ybFnkuiq46w==
X-Google-Smtp-Source: AMsMyM4vCuc2yaa1paCaxsWr+zEwdq/K9KQeqiM+FR9iZlNn3JC3OOXJlge0hCxKJyOHQOWUjjF/nw==
X-Received: by 2002:a05:6a00:2446:b0:528:5da9:cc7 with SMTP id
 d6-20020a056a00244600b005285da90cc7mr64519984pfj.51.1668058616887; 
 Wed, 09 Nov 2022 21:36:56 -0800 (PST)
Received: from ?IPV6:2001:44b8:2176:c800:cc47:10aa:3fa4:e6ca?
 (2001-44b8-2176-c800-cc47-10aa-3fa4-e6ca.static.ipv6.internode.on.net.
 [2001:44b8:2176:c800:cc47:10aa:3fa4:e6ca])
 by smtp.gmail.com with ESMTPSA id
 qa6-20020a17090b4fc600b00200b12f2bf3sm2141643pjb.51.2022.11.09.21.36.54
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 09 Nov 2022 21:36:56 -0800 (PST)
Message-ID: <6803fcf8-470e-88e2-25c9-874c1e021718@linaro.org>
Date: Thu, 10 Nov 2022 16:36:51 +1100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.2
Subject: Re: [PATCH for-8.0 1/2] hw/input/ps2: Convert TYPE_PS2_DEVICE to
 3-phase reset
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>, qemu-devel@nongnu.org
Cc: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
References: <20221109170009.3498451-1-peter.maydell@linaro.org>
 <20221109170009.3498451-2-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20221109170009.3498451-2-peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::436;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x436.google.com
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

On 11/10/22 04:00, Peter Maydell wrote:
> Convert the parent class TYPE_PS2_DEVICE to 3-phase reset.  Note that
> we need an 'exit' phase function as well as the usual 'hold' phase
> function, because changing outbound IRQ line state is only permitted
> in 'exit'.  (Strictly speaking it's not supposed to be done in a
> legacy reset handler either, but you can often get away with it.)
> 
> Signed-off-by: Peter Maydell<peter.maydell@linaro.org>
> ---
>   hw/input/ps2.c | 14 +++++++++++---
>   1 file changed, 11 insertions(+), 3 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

