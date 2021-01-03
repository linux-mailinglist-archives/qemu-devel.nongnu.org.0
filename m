Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A7B332E8E22
	for <lists+qemu-devel@lfdr.de>; Sun,  3 Jan 2021 21:42:58 +0100 (CET)
Received: from localhost ([::1]:54876 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kwADJ-00066K-6n
	for lists+qemu-devel@lfdr.de; Sun, 03 Jan 2021 15:42:57 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:36100)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kwAC7-0005YL-BA
 for qemu-devel@nongnu.org; Sun, 03 Jan 2021 15:41:43 -0500
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433]:40054)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kwAC5-0002Xw-VQ
 for qemu-devel@nongnu.org; Sun, 03 Jan 2021 15:41:43 -0500
Received: by mail-wr1-x433.google.com with SMTP id 91so29399578wrj.7
 for <qemu-devel@nongnu.org>; Sun, 03 Jan 2021 12:41:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:from:to:cc:references:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=yXTafer0TMhsWzQMk1Mc/gl2BDYaaDGOr3JhKwQHfoE=;
 b=fFqOH1V8yyMohMQBMLrebAUy8Z9d/tpB2oH8ti979EcOItgTHG33hPmjN5O/nm1cRR
 0vBdPDEKto1BilbJNBjPE8YHJ3AN3DN7IeEXADJ6Wm73aaFrDvBifRpT7Di62oORGBYd
 TzBLaDlSb93yKmOVkUiEQhnPmICk/U1zceGLoEenNM8pc5E6xSjdA7IJosJJ6kDaLN0w
 9Sv9rrIuhElK+wO+ll4dQHry4KxyT5m8tphb8BcL+GCki6WVb+y+HkTsMpfwtIVKL4QL
 lR7UYnIZhjrlFf72IizsA9W0KFkDIG0UsUskJPi+NLdjXhtUdUxld3+3Hw5o6Y2A/1ro
 +org==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:from:to:cc:references:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=yXTafer0TMhsWzQMk1Mc/gl2BDYaaDGOr3JhKwQHfoE=;
 b=ppXPPS/2qPz6qLygGBv8Q0ZF4gpKNHrDNn8fRrSou9P9i0R4RXtKiXrETdoNmuad+6
 uYCYWlUYkvOkGBloDZILP/NnUd9rsjyapG21FtEDS0YkkJI5QTDaHZ+kTATFGLf5U8w4
 6Qft8y5l5ap+r5EFKoVBbdGpdYWi1GLs1uSDHmPYZkjVs/++AKSjn5g87GFgvqQYqfET
 c32/dPlzwmYDOmNnzZYY9KhkKfCAN/EBFGH5X1UWqcYzG8Zh9e7JJF/Y/QZQeWfEEqBA
 7bo088YOV+3WVrnKbHDRCEZXSH7QBJK1QmOgDcJqJasidVa9meLtvslAbR/MRU5bvfH2
 4IrQ==
X-Gm-Message-State: AOAM5332rjZhXvfEU3Rt8oCPKx+8m0zqE2sa8ETFi5EHwCeaJ/6qd+D6
 rNsJGvWiMvJmc0YSq4a5yuo=
X-Google-Smtp-Source: ABdhPJxehwJEAK257P7+HmAwdtKY9Yd13Sur+b1n/62ExAb+mZcGrqm054YQTy5wkqRN8zF053q3BA==
X-Received: by 2002:a5d:67c3:: with SMTP id n3mr76851964wrw.297.1609706500604; 
 Sun, 03 Jan 2021 12:41:40 -0800 (PST)
Received: from [192.168.1.34] (194.red-83-57-172.dynamicip.rima-tde.net.
 [83.57.172.194])
 by smtp.gmail.com with ESMTPSA id n8sm85130003wrs.34.2021.01.03.12.41.39
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 03 Jan 2021 12:41:39 -0800 (PST)
Subject: Re: [PATCH v2 1/8] hw/mips: Make bootloader addresses unsgined
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
To: Jiaxun Yang <jiaxun.yang@flygoat.com>, qemu-devel@nongnu.org
References: <20201215064200.28751-1-jiaxun.yang@flygoat.com>
 <20201215064200.28751-2-jiaxun.yang@flygoat.com>
 <53e9a3a5-7581-7f52-ea75-88d230d8aa1b@amsat.org>
 <4bd1150d-02eb-21e4-b56e-43b21c53e40d@amsat.org>
Message-ID: <f2d03d33-43a1-5c22-c1f2-d3a2f395cefd@amsat.org>
Date: Sun, 3 Jan 2021 21:41:38 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <4bd1150d-02eb-21e4-b56e-43b21c53e40d@amsat.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::433;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x433.google.com
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

On 1/3/21 4:57 PM, Philippe Mathieu-Daudé wrote:
> On 1/2/21 12:15 AM, Philippe Mathieu-Daudé wrote:
>> On 12/15/20 7:41 AM, Jiaxun Yang wrote:
>>> Address should be unsigned anyway, otherwise it may carry
>>> calculations wrongly.
>>>
>>> Signed-off-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
>>> ---
>>>  hw/mips/fuloong2e.c | 12 ++++++------
>>>  hw/mips/malta.c     | 22 +++++++++++-----------
>>>  2 files changed, 17 insertions(+), 17 deletions(-)
>>
>> Tested-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
> 
> Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
> 
> Can you send a follow-up patch for hw/mips/mipssim.c?

Bah as it is trivial, I will squash in your patch.

