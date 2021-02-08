Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 802F7313ECC
	for <lists+qemu-devel@lfdr.de>; Mon,  8 Feb 2021 20:22:35 +0100 (CET)
Received: from localhost ([::1]:60942 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l9C7G-0007Fw-JK
	for lists+qemu-devel@lfdr.de; Mon, 08 Feb 2021 14:22:34 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:40678)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1l96Hm-0007ae-DM; Mon, 08 Feb 2021 08:09:02 -0500
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435]:43366)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1l96Hg-0006mE-41; Mon, 08 Feb 2021 08:09:01 -0500
Received: by mail-wr1-x435.google.com with SMTP id z6so16972558wrq.10;
 Mon, 08 Feb 2021 05:08:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=7QgPjqbGBhcTL6xyqUrAyEhs+cJ8AnMAl8O7isY2n3k=;
 b=rmr+lMglCULukD4jlT+wFDYEoK4WtyJkgjSHziTRpSmtne+g6KsMgexhadnjN+in4K
 VE06CJuLxQBQpCigOLfZ065haf5GLcjdIvrz8DmYD1dwFbFs4hpNwcejUUv35wCXzyCu
 wWTRLELBL+wMFz8TUnZ54LacnamaAfGVmphpIrWIsKpE5dooJPY2IpHfCpwaeseu+IAP
 xRlHwt+NbW7hSSr12KEAxKK1oQ6H0gOKW9+1sUQoG49bqW5pdV13ZXfllVBUPtBiK2SO
 tc80zO0AbvF79ocsPyWwgW5xIFHh4zulEOhP82NSsCko4GsZbmp6qybG/FRS45gfwVYY
 QZuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=7QgPjqbGBhcTL6xyqUrAyEhs+cJ8AnMAl8O7isY2n3k=;
 b=SydkMmaHX1jqIs+qcyr4F1bZZpw4Q6oSWze2NFFCBI1pwhUj3POV2Zrxk+4FDjdcie
 LN0W7/GEdwA76racDftDZNoEZE371/Zl7N553GNKLJLbO4DO55wh8H2rVSH/5AYGhHXN
 xNLoxfFWsk7eQzoRMMzhtl1iQ0kkQ6aAmsqvRfMrhJeC9X8UAkfwYMTe5ziskmJ7/dRx
 f/mCfsT7qu3Qhsp0hEXDyClhVQN9fLsNuewFIC8ihBwv6mDkDimK60JtTDoBTbl4yvcf
 s5+bGlZlHfJnW47mMIgzifgswyvhRan3lcUegaDhd6Uc5gsyY9pxBRe6Jm5MYD9+i0Fp
 yLVA==
X-Gm-Message-State: AOAM533PokkOnMJ2QlJTCR7OqODNTJhrlmur9GfV9hLcJTdFyuOHb4k0
 azRLeISr3/4lLU1AomqfQkuMWx2azxQ=
X-Google-Smtp-Source: ABdhPJy8NLR7HrLV8U55XDDXq0AlcWUCDqjdO/2O9//v7z0PuW/kF+K7Y7UE621vuX/TNKHOlQ7MYg==
X-Received: by 2002:a5d:464f:: with SMTP id j15mr12402728wrs.390.1612789731935; 
 Mon, 08 Feb 2021 05:08:51 -0800 (PST)
Received: from [192.168.1.36] (68.red-83-57-175.dynamicip.rima-tde.net.
 [83.57.175.68])
 by smtp.gmail.com with ESMTPSA id o17sm28732001wrm.52.2021.02.08.05.08.50
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 08 Feb 2021 05:08:50 -0800 (PST)
Subject: Re: [PATCH] hw/sd: sd: Bypass the RCA check for CMD13 in SPI mode
To: Bin Meng <bmeng.cn@gmail.com>
References: <20210129085124.21525-1-bmeng.cn@gmail.com>
 <9336f3ec-b500-052b-a8f8-e1b8ec2905b6@amsat.org>
 <CAEUhbmWE5i_n1gC+UPdJPC9EsyTXkuPjoH78phSyoizwbf1P3w@mail.gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <cb3f68a5-6ed8-26a4-310a-fd8dbc5d8eaa@amsat.org>
Date: Mon, 8 Feb 2021 14:08:49 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <CAEUhbmWE5i_n1gC+UPdJPC9EsyTXkuPjoH78phSyoizwbf1P3w@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::435;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x435.google.com
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.248,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-0.265,
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
Cc: Bin Meng <bin.meng@windriver.com>,
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Qemu-block <qemu-block@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 1/30/21 11:20 AM, Bin Meng wrote:
> Hi Philippe,
> 
> On Fri, Jan 29, 2021 at 10:11 PM Philippe Mathieu-Daudé <f4bug@amsat.org> wrote:
>>
>> Hi Bin,
>>
>> On 1/29/21 9:51 AM, Bin Meng wrote:
>>> From: Bin Meng <bin.meng@windriver.com>
>>>
>>> Unlike SD mode, when SD card is working in SPI mode, the argument
>>> of CMD13 is stuff bits. Hence we should bypass the RCA check.
>>
>> Is this for detecting events by polling? From spec v8:
>>
>>   5.7.5 Event Indication Method
>>   5.7.5.1 FX_EVENT (Bit06 of Card Status)
>>
>>     An event indication method is introduced from Version 4.20.
>>     Card may use Bit06 of R1 (R1b) response of any SD command
>>     to indicate event generation.
>>
>>   F.2 Concept of Event Detection Method
>>   F.2.2 Host Implementation to use Event Detection Method
>>
> 
> I think you looked at the wrong place. See spec v8
> 
> chapter 7.3.1.3 Detailed Command Description
> 
> "The card shall ignore stuff bits and reserved bits in an argument"
> 
> and Table 7-3 Commands and Arguments
> 
> CMD13 Argument [31:0] stuff bits

Indeed. Adding this information in the commit description makes
things obvious ;)

The SPI responses are not well implemented, in this case (CMD13)
it is incorrect, we should return a 2-byte R2. Your patch
correctly skip the RCA check, but we still invalid data.

