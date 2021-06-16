Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C31C13AA44F
	for <lists+qemu-devel@lfdr.de>; Wed, 16 Jun 2021 21:27:13 +0200 (CEST)
Received: from localhost ([::1]:43634 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ltbBw-0003hy-NT
	for lists+qemu-devel@lfdr.de; Wed, 16 Jun 2021 15:27:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56976)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1ltbAK-0001rF-Ph; Wed, 16 Jun 2021 15:25:32 -0400
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336]:33654)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1ltbAJ-0007Bt-AL; Wed, 16 Jun 2021 15:25:32 -0400
Received: by mail-wm1-x336.google.com with SMTP id
 t11-20020a1cc30b0000b02901cec841b6a0so3072420wmf.0; 
 Wed, 16 Jun 2021 12:25:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=favxU3AOiVDhrGg4HQOSzVWjxQJCPBhLqJ2EuVl7dcg=;
 b=JhAN/onrcRnnfwfaCI4wFxT+2gnCcw3w/9X8Cw0Z75i3T7353kzRrerR457dcWomtU
 as7jKNqd7uUFXH1UeRI/6NQLO01D/40z6E4jhNTDbFlCV/PN4yAnjs79q8PvGKWr0uwL
 ugbj3pBo2xtvwBw1gHvIMd8katWcVc4ZFT7IyWw2L6xWC4Czq0lNyvDN16OIP2QkVSCe
 277j8KKHX7GCUkO2dubj/wp36dEaje3XUcqRxGP0o+kiUnPGZfYhPZ+y6lQEpHalexsY
 UqB4ufrma9M5rKZXMBSvv6bo13r3gS4aw2jrmoO1A1QIk0xy3xd4JEOpgTAn/uq1ktgb
 OgQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=favxU3AOiVDhrGg4HQOSzVWjxQJCPBhLqJ2EuVl7dcg=;
 b=QUWDqBhV47t/ZZx3kF2Q660loEIu9MhIhhJYotfWCHgJvedyaxE1/ANVwLeXQAWz0x
 urOah0WgrAZ+Ywmjbp/ezl6IwV6JJFOli3V0RawXpOuBQrrpuNIb7BtWa1OJb97Azwd0
 epv3nR6g6uc+rT7a9ONPw/NYd0UDOoeMX1EH2cTeaagiNuZQLDqdyAs0bbwaX8L/Mcvq
 WiO+cnrvP83r8dWx5fzSKnauT/DKI/vkDn0Ihba0zuuHdJIlvdtlrK0H4tlSZIipH1Aw
 A9r5KA1w8rXDyT6Pc6hEun8O+02GanK4eo1SD8axPUYqOSSOgPxeUjbmIrOfNMt9gg74
 bgoA==
X-Gm-Message-State: AOAM530BMZmXhXruhuZLhnsEBqOZGEkmAuTwqlsu/YnXDNGbqCSEtVpw
 DfFX8tgoU4LOh6stpjVgalg=
X-Google-Smtp-Source: ABdhPJwnsNmgIXSDuqi3YZhLIY67+ItScdFiwAJJARRwXDTxoaVgcgkU+jse8nmx/tZAdkf0YHJ0xg==
X-Received: by 2002:a05:600c:3b11:: with SMTP id
 m17mr653375wms.150.1623871528525; 
 Wed, 16 Jun 2021 12:25:28 -0700 (PDT)
Received: from [192.168.1.36] (93.red-83-35-24.dynamicip.rima-tde.net.
 [83.35.24.93])
 by smtp.gmail.com with ESMTPSA id q19sm5540715wmc.44.2021.06.16.12.25.26
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 16 Jun 2021 12:25:28 -0700 (PDT)
Subject: Re: [PATCH v3 06/13] hw/i2c/ppc4xx_i2c: Replace i2c_send_recv() by
 i2c_recv() & i2c_send()
To: cminyard@mvista.com
References: <20210616161418.2514095-1-f4bug@amsat.org>
 <20210616161418.2514095-7-f4bug@amsat.org>
 <20210616191637.GF11196@minyard.net>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <59fb23da-ddad-0436-6935-89712fbddf0f@amsat.org>
Date: Wed, 16 Jun 2021 21:25:25 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <20210616191637.GF11196@minyard.net>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::336;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x336.google.com
X-Spam_score_int: -16
X-Spam_score: -1.7
X-Spam_bar: -
X-Spam_report: (-1.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.248,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-0.17,
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
Cc: "Signed-off-by : Frederic Konrad" <frederic.konrad@adacore.com>,
 qemu-arm@nongnu.org, qemu-ppc@nongnu.org, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 6/16/21 9:16 PM, Corey Minyard wrote:
> On Wed, Jun 16, 2021 at 06:14:11PM +0200, Philippe Mathieu-Daudé wrote:
>> Instead of using the confuse i2c_send_recv(), rewrite to directly
>> call i2c_recv() & i2c_send(), resulting in code easire to review.
>>
>> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
>> ---
>>  hw/i2c/ppc4xx_i2c.c | 13 ++++++++-----
>>  1 file changed, 8 insertions(+), 5 deletions(-)
>>
>> diff --git a/hw/i2c/ppc4xx_i2c.c b/hw/i2c/ppc4xx_i2c.c
>> index f4c5bc12d36..b3d3da56e38 100644
>> --- a/hw/i2c/ppc4xx_i2c.c
>> +++ b/hw/i2c/ppc4xx_i2c.c
>> @@ -240,11 +240,14 @@ static void ppc4xx_i2c_writeb(void *opaque, hwaddr addr, uint64_t value,
>>                          i2c->sts &= ~IIC_STS_ERR;
>>                      }
>>                  }
>> -                if (!(i2c->sts & IIC_STS_ERR) &&
>> -                    i2c_send_recv(i2c->bus, &i2c->mdata[i], !recv)) {
>> -                    i2c->sts |= IIC_STS_ERR;
>> -                    i2c->extsts |= IIC_EXTSTS_XFRA;
>> -                    break;
>> +                if (!(i2c->sts & IIC_STS_ERR)) {
>> +                    if (recv) {
>> +                        i2c->mdata[i] = i2c_recv(i2c->bus);
>> +                    } else if (i2c_send(i2c->bus, i2c->mdata[i])) {
> 
> In the previous patch you checked < 0, it would be nice to be
> consistent.

I did that first but thought Zoltan wouldn't be happy, then went back :)

I'll fix for the next iteration, thanks.

