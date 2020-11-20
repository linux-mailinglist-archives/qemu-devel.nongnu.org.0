Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 353362BB1D8
	for <lists+qemu-devel@lfdr.de>; Fri, 20 Nov 2020 18:58:56 +0100 (CET)
Received: from localhost ([::1]:35742 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kgAgR-0004Z0-AO
	for lists+qemu-devel@lfdr.de; Fri, 20 Nov 2020 12:58:55 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:56508)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kgAbL-0008VQ-Ge; Fri, 20 Nov 2020 12:53:40 -0500
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433]:44946)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kgAbJ-00061c-QO; Fri, 20 Nov 2020 12:53:39 -0500
Received: by mail-wr1-x433.google.com with SMTP id c17so10845961wrc.11;
 Fri, 20 Nov 2020 09:53:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=bCCsZQBLji9pLj7ci00n0ISuH6a9kfJlaQG1zZIBWzE=;
 b=ToWE9xoHnOX+2H5DUhcX2l0hkX0vva4mNCP63itLrboiO+oss4SBTDVox8cTChpQkd
 zPeTAw2WAFWARP6sh+2fmKokPr6PuVZwhYl5WuqmhjDN4T3l+SLPgXlxmakirDTtUNti
 NCLQGlzaTdAkKOilQ3f/JAz29pL5gTVjyfnzQ0T5AYoWNjJ3C+H87Mcd0wsG0ob8TVPJ
 e6KtI0rmQ8qycPkj4l6vJKGZ+XX+l3CjVJxNQDw9x+WmoXrh7CCMbFJrm5N/ctariN6a
 iiSR1y8cXfDooj/1QH9u0Gt62uiQkmrp3IAP7Mdc55ledI9KkE2UGDkotJnm5ZyOz77u
 DtJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=bCCsZQBLji9pLj7ci00n0ISuH6a9kfJlaQG1zZIBWzE=;
 b=j1MUdzmGLtQL7/AmsEYR8SWn2Egi0wuynWFBu4fIRXHZ6wb/bFIojir0JJn+TeS2n0
 lPycP2K1ySzCHYC/il4C7X4S50zppBklnkoogYi/VipwvpWDLdzmYzEtTDYl9bdv6lAh
 utkWh0nQdKdTi15ROaPPM3MWXZxJD4yJZ9UWWb/WipjBcGdA4jj6o7fd0AFDZTDZxPWR
 Hk/h0iEp/sgCILA2BEEn8vGjS0bjbGqMSHKOwxzQw8/9Fqs91xrPTmQuChPM6me2GR/g
 pi+FHUqthJihL3mf5WibL6CIfkQES4e6P4Kz0KWzbiTS6gJvGhxRwW2Kvuqs3wCu3fbR
 BXaw==
X-Gm-Message-State: AOAM5304N+NSMPnScV71CyltyES1Pk/tp/h9J+mOzostfgxu0uwP+bT5
 N6D7NgEQSJ1x5i5sYnF61fI=
X-Google-Smtp-Source: ABdhPJxnFed7E19PiE3oxqPV7SEjJHghVcnf0dVTgGNA5ZNrcmczZDMr4jWzWOteold2rjgKJ90UNA==
X-Received: by 2002:adf:e5d0:: with SMTP id a16mr18761794wrn.340.1605894815864; 
 Fri, 20 Nov 2020 09:53:35 -0800 (PST)
Received: from [192.168.1.36] (234.red-83-42-66.dynamicip.rima-tde.net.
 [83.42.66.234])
 by smtp.gmail.com with ESMTPSA id a18sm4882728wme.18.2020.11.20.09.53.34
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 20 Nov 2020 09:53:35 -0800 (PST)
Subject: Re: [PATCH-for-5.2 v2] hw/intc: fix heap-buffer-overflow in
 rxicu_realize()
To: Peter Maydell <peter.maydell@linaro.org>,
 Chen Qun <kuhn.chenqun@huawei.com>
References: <20201111141733.2358800-1-kuhn.chenqun@huawei.com>
 <CAFEAcA_BSYrq87it7UXWJUDvUuA8L8U1Y8mxkyZdwzb3n_sSiA@mail.gmail.com>
 <CAFEAcA8Ax3X5EFAgvGR_PVztLx7ShTweX63sd6k4CeqJqXnNRw@mail.gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <f2055d45-e2e8-248d-abad-9f3b75bec062@amsat.org>
Date: Fri, 20 Nov 2020 18:53:34 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <CAFEAcA8Ax3X5EFAgvGR_PVztLx7ShTweX63sd6k4CeqJqXnNRw@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::433;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x433.google.com
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
Cc: zhanghailiang <zhang.zhanghailiang@huawei.com>,
 Yoshinori Sato <ysato@users.sourceforge.jp>,
 QEMU Trivial <qemu-trivial@nongnu.org>,
 QEMU Developers <qemu-devel@nongnu.org>, Gan Qixin <ganqixin@huawei.com>,
 Euler Robot <euler.robot@huawei.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi Peter,

On 11/20/20 5:41 PM, Peter Maydell wrote:
> On Fri, 20 Nov 2020 at 13:44, Peter Maydell <peter.maydell@linaro.org> wrote:
>>
>> On Wed, 11 Nov 2020 at 14:18, Chen Qun <kuhn.chenqun@huawei.com> wrote:
>>>
>>> When 'j = icu->nr_sense – 1', the 'j < icu->nr_sense' condition is true,
>>> then 'j = icu->nr_sense', the'icu->init_sense[j]' has out-of-bounds access.
> 
>>> Suggested-by: Peter Maydell <peter.maydell@linaro.org>
>>> Reported-by: Euler Robot <euler.robot@huawei.com>
>>> Signed-off-by: Chen Qun <kuhn.chenqun@huawei.com>
>>
>>
>> Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
> 
> I'll take this via target-arm.next, I guess.

Sorry I missed this patch while preparing the latest Renesas
pull request. I filter for hw/rx/ and didn't notice this
(also I was not Cc'ed in v1).

BTW to make things clear, I'm not maintaining this subsystem,
I simply try to cover for Yoshinori who is not very active.

As there are no other patch, I appreciate you taking this via
your ARM queue.

Thanks,

Phil.

