Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F26A68999F
	for <lists+qemu-devel@lfdr.de>; Fri,  3 Feb 2023 14:22:34 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pNw1G-0006FJ-El; Fri, 03 Feb 2023 08:22:24 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pNw0R-0005WE-7p
 for qemu-devel@nongnu.org; Fri, 03 Feb 2023 08:21:35 -0500
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pNw0O-0006ie-Ht
 for qemu-devel@nongnu.org; Fri, 03 Feb 2023 08:21:30 -0500
Received: by mail-wm1-x329.google.com with SMTP id
 n28-20020a05600c3b9c00b003ddca7a2bcbso3830481wms.3
 for <qemu-devel@nongnu.org>; Fri, 03 Feb 2023 05:21:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=CpZS5HDgmyID7QFWK/03F9lO4wDky8dioQ8x5b7gaT0=;
 b=LNHlewlW94yP04LvoStVzSv64q1KyfyUGzq/wlCjbq9pt51erBffu2V3ml+pbnJxIR
 kCHeXLDGczqIUbnJl7bCghEtgwQdu+8S4wKTpBW6tYtYCK7P4HbuFt0O7UQZXejLuq7G
 StRaZg4nwAPepMcZm+pnXvm7C7nQG+sV0xEvVTY87ylDXqcJr1WGxD80+M2m/cSqVCkg
 1Ivy4ZY6FC8QMBHzqy6OazN1F/T2sWGl6LrcVOE8q9OigvL50gudyS2vPEysO8z0cZ0O
 u2ndjngIIIEqCuZOL31Ukvfdephpt70RJEFI2UP7VVVWWsDL/CTHkt3V8ISQxsq7vzLU
 ip5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=CpZS5HDgmyID7QFWK/03F9lO4wDky8dioQ8x5b7gaT0=;
 b=LKEbzyJO/j3QWiEwGi0ku6yghJNRJfBOqYnhspFEVlBSlsl3fOHvzvgtrqbc+8fmLD
 9vvukC7SiKKNJnWLDdT5JjXMgrbskc1zFizv3Nty5SmXaQIYxo4Ni5V7S7HqL5y1A9WN
 TtYdoN/XjnHL/hf/50tL64/NsbzwIZmfSOEY5Z7lTxElFenUw3y/6u6fX7T12TYvLL5X
 2IEr8/2L4nq46ZWFoAHQ8XoOd4f+c7jqmE+1dFTBk0N5i8BuAT7dXxvJctk8Niq9mDkx
 yoh8kjNTtwMmzCT3387vVZpTc6XM69ubcxfYDDqn5PtgsTY9pTba9SFje/Dp8KigQw86
 vtwg==
X-Gm-Message-State: AO0yUKVVWQs7JjeQcgm+8E5xDvFgBKy0vaesP7pK0pdw5R5++SA5+uZz
 dCn3HRYrqQDOuL+4J2nqaJ3E5g==
X-Google-Smtp-Source: AK7set9Eavyjw+PwdYcmVVgdx/NQEQHuKAjco0QADk055FKmizieuT6rmxvgS2+WChdN4ybIZIhcYQ==
X-Received: by 2002:a05:600c:44c8:b0:3dc:45a7:2b8a with SMTP id
 f8-20020a05600c44c800b003dc45a72b8amr9487287wmo.10.1675430485209; 
 Fri, 03 Feb 2023 05:21:25 -0800 (PST)
Received: from [192.168.30.216] ([81.0.6.76]) by smtp.gmail.com with ESMTPSA id
 s24-20020a05600c319800b003dfe5190376sm2263075wmp.35.2023.02.03.05.21.23
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 03 Feb 2023 05:21:24 -0800 (PST)
Message-ID: <075577d7-d5c4-393b-9d0d-2aab32abe957@linaro.org>
Date: Fri, 3 Feb 2023 14:21:23 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.6.1
Subject: Re: [PATCH 6/9] hw/display/sm501: QOM-alias 'dma-offset' property in
 chipset object
Content-Language: en-US
To: BALATON Zoltan <balaton@eik.bme.hu>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, qemu-ppc@nongnu.org,
 Markus Armbruster <armbru@redhat.com>, Eduardo Habkost
 <eduardo@habkost.net>, Yoshinori Sato <ysato@users.sourceforge.jp>,
 Magnus Damm <magnus.damm@gmail.com>
References: <20230203113650.78146-1-philmd@linaro.org>
 <20230203113650.78146-7-philmd@linaro.org>
 <136f25e8-686a-1529-b114-08dd54e6b819@eik.bme.hu>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <136f25e8-686a-1529-b114-08dd54e6b819@eik.bme.hu>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::329;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x329.google.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.09,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

On 3/2/23 14:05, BALATON Zoltan wrote:
> On Fri, 3 Feb 2023, Philippe Mathieu-Daudé wrote:
>> No need to use an intermediate 'dma-offset' property in the
>> chipset object. Alias the property, so when the machine (here
>> r2d-plus) sets the value on the chipset, it is propagated to
>> the OHCI object.
>>
>> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
>> ---
>> hw/display/sm501.c | 22 +++++++++++-----------
>> hw/sh4/r2d.c       |  2 +-
>> 2 files changed, 12 insertions(+), 12 deletions(-)
> 
> It does not seem to be any simpler by the number of lines but maybe a 
> bit cleaner.

Well it also moves to the "Embed QOM objects" pattern which Peter prefers.
Note this device doesn't implement unrealize().

> I wonder if it would worth renaming the property to 
> dma-offset to match that of ohci so it's less confusing what it refers 
> to. It's only used by r2d and this patch already changing that so would 
> be an easy change.

We can't because TYPE_PCI_SM501 is user-creatable, so we need to
go thru the whole deprecation process and we don't have any API to
deprecate QOM properties yet.

I'll add these comments to the description.

