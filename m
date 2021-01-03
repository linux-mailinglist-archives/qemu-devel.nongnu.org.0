Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DB1492E8CFC
	for <lists+qemu-devel@lfdr.de>; Sun,  3 Jan 2021 16:58:36 +0100 (CET)
Received: from localhost ([::1]:40042 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kw5m7-00070W-FV
	for lists+qemu-devel@lfdr.de; Sun, 03 Jan 2021 10:58:35 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:60664)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kw5km-0006Zj-Ev
 for qemu-devel@nongnu.org; Sun, 03 Jan 2021 10:57:12 -0500
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334]:52989)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kw5kk-0001D9-Ui
 for qemu-devel@nongnu.org; Sun, 03 Jan 2021 10:57:12 -0500
Received: by mail-wm1-x334.google.com with SMTP id a6so14952581wmc.2
 for <qemu-devel@nongnu.org>; Sun, 03 Jan 2021 07:57:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:from:to:cc:references:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=nqCzMCVDcp8Ii8C1J3YeZ+6ciInMw4GhfnSubisHn1o=;
 b=klc020qthG+S0D5RI9ZmNcFTWdreJNnn2E79sbUqv1ZKKF11St4aWwVtN+xFpg3iyI
 tn2SPR4/tH6Ry5v31ZJXLZL3p2TDTAx9qCQhJQyfqVGckuVtdx+QYtm2JvbhoWTxgxJX
 92Op/MG4gX9+r0IZFYIgYxwKlVa1GW1jyM6urCsZ+VJQQxGU6UKT/ZCW137W9rM2wxwM
 8gwK93dHWKJdAUPGkvxNhcYEocyxPXInAhnhqWEKRkm35WP9+SwJPFZtWS0Zv/DZzGzv
 sL1ltHSraxHezXkFQVtUU3XjVQhcg4kGWEC+i96O23hydIHmSRopSlFIM1hNm3Q9cX8K
 zPrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:from:to:cc:references:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=nqCzMCVDcp8Ii8C1J3YeZ+6ciInMw4GhfnSubisHn1o=;
 b=C5mcu/1VeJtSF2CtqPnSMKPbcBRu7IWUwNIBjtoVkKcYQDn5SG94fpEfLGO2RCwyFP
 aqY1s7Cd75KW9IfxQLhTkaBf1IWZ0R5TG+K+Bm7DLlMMrjQgFe+tAf8UBi2Xt7MTUPiP
 u0zi59UVMxZKysHzxSbfEyA9eQyLM7j+Qpbj6wVGJJPdq/Y0MB7TzDkBGPv6nUBBClxc
 55kGsFVYhynNqjIXH6nnNHYd0H2SlZpXrmKUlnhT8hGauK2moTTCL0IgyNstNlaZ6OVC
 f7BQ3NI1syrcoS+Y+Y5Mxy8ezcBVJT6XHHAoGMh4BvbfnGj9NXTizdBlykoQ1mQqCGWQ
 5tAQ==
X-Gm-Message-State: AOAM531gF548wXff63kBn8I5yvDRKRRduDSF5c35EZxNtOqnUaQiu+vz
 pfSSjGMGzKCfoa9uvLXzRH4=
X-Google-Smtp-Source: ABdhPJwylKNgORX70dsraJ+9nunM++QOpmvyRdTVprkYpz/EiwtV0dXOnfsBmDhXOvj0x3OPkMEEeA==
X-Received: by 2002:a1c:a785:: with SMTP id q127mr22930049wme.25.1609689429494; 
 Sun, 03 Jan 2021 07:57:09 -0800 (PST)
Received: from [192.168.1.34] (194.red-83-57-172.dynamicip.rima-tde.net.
 [83.57.172.194])
 by smtp.gmail.com with ESMTPSA id v20sm29443540wml.34.2021.01.03.07.57.08
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 03 Jan 2021 07:57:08 -0800 (PST)
Subject: Re: [PATCH v2 1/8] hw/mips: Make bootloader addresses unsgined
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
To: Jiaxun Yang <jiaxun.yang@flygoat.com>, qemu-devel@nongnu.org
References: <20201215064200.28751-1-jiaxun.yang@flygoat.com>
 <20201215064200.28751-2-jiaxun.yang@flygoat.com>
 <53e9a3a5-7581-7f52-ea75-88d230d8aa1b@amsat.org>
Message-ID: <4bd1150d-02eb-21e4-b56e-43b21c53e40d@amsat.org>
Date: Sun, 3 Jan 2021 16:57:07 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <53e9a3a5-7581-7f52-ea75-88d230d8aa1b@amsat.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::334;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x334.google.com
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.248, NICE_REPLY_A=-0.262,
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
Cc: chenhuacai@kernel.org, paulburton@kernel.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 1/2/21 12:15 AM, Philippe Mathieu-Daudé wrote:
> On 12/15/20 7:41 AM, Jiaxun Yang wrote:
>> Address should be unsigned anyway, otherwise it may carry
>> calculations wrongly.
>>
>> Signed-off-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
>> ---
>>  hw/mips/fuloong2e.c | 12 ++++++------
>>  hw/mips/malta.c     | 22 +++++++++++-----------
>>  2 files changed, 17 insertions(+), 17 deletions(-)
> 
> Tested-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

Can you send a follow-up patch for hw/mips/mipssim.c?

