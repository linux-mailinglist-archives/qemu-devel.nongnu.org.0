Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B2593278D5
	for <lists+qemu-devel@lfdr.de>; Mon,  1 Mar 2021 09:04:10 +0100 (CET)
Received: from localhost ([::1]:36902 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lGdXF-0002dr-8S
	for lists+qemu-devel@lfdr.de; Mon, 01 Mar 2021 03:04:09 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:38186)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lGdTO-0007hn-01; Mon, 01 Mar 2021 03:00:10 -0500
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a]:44583)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lGdTM-0000C0-Dr; Mon, 01 Mar 2021 03:00:09 -0500
Received: by mail-wr1-x42a.google.com with SMTP id h98so15013397wrh.11;
 Mon, 01 Mar 2021 00:00:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=6IAUTYmBUhNDoXikDH5pivcoExP41na67y4A6puUaoI=;
 b=XgZegYFMEjQipazHThSSvTQo7+sPGRvJereqH1wqfrOUJ4bRIDbn59SPPmPO+ldmN2
 HavsnuRPSMhZ5ByqqiOuffk/kxgjfDL1bjicYJko0WdXut0paG5ipnSzHbz9Pickc/T5
 GjGXjvt05extpfHQ6bxve0qQWew4zgr7KvsV77APNC4qHuG9uVRBr63/pGFzGpPgIgPb
 6fMCeefJi+rOlj4bkObbpNVOz5jmR5aDaDqBqiNcFADW8tWV9ByTNQtaBZZtJ/SQHowm
 sdbQLSXFa33aiHbEzFR8z+UVumX1FjhhhdbQI/MZIjPXnFvj/GWkHUB1dfn6Lu4bhG6m
 QSPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=6IAUTYmBUhNDoXikDH5pivcoExP41na67y4A6puUaoI=;
 b=Pu1Sv61SHtWo/m2nBRx6SvLTNjENlDgOku2T6LcD136wWPQXc85xAWPdLE5vRUJkjU
 uSeG1JGohKdfCsb/bUydAgd1XJK3Bm0J58rPWxo4/C8apGnP1p0/JRPG6SJiGb7hcNGF
 qZoeA5w6AVTKx3UL77lKrpnilayOguuyE6fKRUiZydViDjzai2Z21GHb7jH1dPe3yjHJ
 lb1hbdxwiWwK+1zKrbcbKIBzLiOul+g8UHxpSWanD9725ql5YEP0LeOQm7MBtdP1V5uh
 tSvNnKT8rxURP8HUbPXXtPdEF7YtbRRi1JTle4e9ikHZcb9Xx8axUCTnjkCtSHoPjfhQ
 aUdQ==
X-Gm-Message-State: AOAM5326XyrUpEhaJATxPCJSKcvUnJdjzeaHZ757hUbQjD7KEEHfF9Sh
 ZMQjdsWfy55b7gqm9b6Irlw=
X-Google-Smtp-Source: ABdhPJyrqpah7w/50BR9/FhPXuDxE5ZlMR4u3nYT1FehcNxfz7OhPfa7S6DFG9w7LC2Z4fMi/0YCwQ==
X-Received: by 2002:adf:a59a:: with SMTP id g26mr15492389wrc.271.1614585606652; 
 Mon, 01 Mar 2021 00:00:06 -0800 (PST)
Received: from [192.168.1.36] (68.red-83-57-175.dynamicip.rima-tde.net.
 [83.57.175.68])
 by smtp.gmail.com with ESMTPSA id d13sm16399343wro.23.2021.03.01.00.00.05
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 01 Mar 2021 00:00:06 -0800 (PST)
Subject: Re: [PATCH v2 3/5] hw/arm: ast2600: Correct the iBT interrupt ID
To: Andrew Jeffery <andrew@aj.id.au>, qemu-arm@nongnu.org
References: <20210301010610.355702-1-andrew@aj.id.au>
 <20210301010610.355702-4-andrew@aj.id.au>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <08798e9a-405c-1316-9b4e-2ab7547508a2@amsat.org>
Date: Mon, 1 Mar 2021 09:00:05 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <20210301010610.355702-4-andrew@aj.id.au>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42a;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x42a.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
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
Cc: peter.maydell@linaro.org, ryan_chen@aspeedtech.com, minyard@acm.org,
 qemu-devel@nongnu.org, joel@jms.id.au, clg@kaod.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 3/1/21 2:06 AM, Andrew Jeffery wrote:
> The AST2600 allocates distinct GIC IRQs for the LPC subdevices such as
> the iBT device. Previously on the AST2400 and AST2500 the LPC subdevices
> shared a single LPC IRQ.
> 
> Signed-off-by: Andrew Jeffery <andrew@aj.id.au>
> ---
>  hw/arm/aspeed_ast2600.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>


