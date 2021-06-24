Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F6BF3B2A20
	for <lists+qemu-devel@lfdr.de>; Thu, 24 Jun 2021 10:13:41 +0200 (CEST)
Received: from localhost ([::1]:38576 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lwKUW-0002yF-Dm
	for lists+qemu-devel@lfdr.de; Thu, 24 Jun 2021 04:13:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39864)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lwKTa-0002AQ-T3; Thu, 24 Jun 2021 04:12:42 -0400
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d]:35794)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lwKTZ-0000e1-5i; Thu, 24 Jun 2021 04:12:42 -0400
Received: by mail-wr1-x42d.google.com with SMTP id m18so5602109wrv.2;
 Thu, 24 Jun 2021 01:12:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=3fNrmenkKLdD2FBMbyEtXwT5t3lpOuMmyAFUJPmUR0w=;
 b=pR1gA3SHBubXlwvaHquL2nASjnmj7UVlk6kvOtFSJAwkzBRmwyrrgl6xyOrLAMr95E
 EWU/hY98KYguQvCTxkD8riDyVqwh+eO6qsWtoFSflaRkks3l1/sbxcMfAt3+oXPQoT4X
 4Pi/YMQumOYrWaM6sLY2DaCf98D2VX1TDvssfxtug+d91mAbk8c1HwIKngKbb7NCo+pI
 uHo77Ze/Vcwpseu2t6Mlqdsn+cn8eC6nGJQpOJx5z4Qsd/Ec1R3CneeDxFTePN8qpdAC
 Z8NN1wmgv8jc/PCPlRC7RTnGx/M2feGqMRM99ssJ5IlhijrQ0kCXdm7xsKg2k9XFWYIO
 nDXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=3fNrmenkKLdD2FBMbyEtXwT5t3lpOuMmyAFUJPmUR0w=;
 b=kAvjISxKq4FxI1hLEAmI9VYVg2GXcLstsGYEGQnmlGjHB+m8t8qvTXRnJx8MxoKm0p
 k2LcrsJqYLpF77X2aOLnVvR5PECgmRK0LxEzAHAqZ67dhqdipcWpcezkU/vZ0oZU7GQ0
 BrBE5IDter+9PTwVgcYE+fLQTFqmwK8lz53QNaha8v9IgZt+mYmcnivYI3NOFS2kBriA
 9BdZ6mrax/CR1kGENe97xrHo3j1QAfZJ5GEVOmWBKukz3a0S4u4nEPdHw4eayHRKY9aS
 ABGLJGyStxQhgFEydFVUt66CVigm6+rBtzEWr3M2cAujzOw0nvXueS+x0HJMRQ2qkFnE
 3yog==
X-Gm-Message-State: AOAM5307AjEJUQ8FkzG3aflrI21Tq5sUTG0PZOX00pL6LWDF8bThQfwf
 zdFFn1NLgQO6tCbzVJEkdAI=
X-Google-Smtp-Source: ABdhPJzgjvmJOK3itVEKLhMtlaqKrTM3kKpa/OAipSDhpoZI4ozCNBirA9/bWnOOIVb3UEUFGdZDhQ==
X-Received: by 2002:a5d:4a81:: with SMTP id o1mr3000309wrq.1.1624522358972;
 Thu, 24 Jun 2021 01:12:38 -0700 (PDT)
Received: from [192.168.1.36] (93.red-83-35-24.dynamicip.rima-tde.net.
 [83.35.24.93])
 by smtp.gmail.com with ESMTPSA id q5sm2418709wmc.0.2021.06.24.01.12.37
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 24 Jun 2021 01:12:38 -0700 (PDT)
Subject: Re: [RFC PATCH 0/9] hw/sd: Allow card size not power of 2 again
To: Alexander Bulekov <alxndr@bu.edu>
References: <20210623180021.898286-1-f4bug@amsat.org>
 <20210624025054.57gf3w5fawybm3me@mozz.bu.edu>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <235bae9f-4c24-0a78-2c53-ed08daa282b1@amsat.org>
Date: Thu, 24 Jun 2021 10:12:37 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210624025054.57gf3w5fawybm3me@mozz.bu.edu>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42d;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x42d.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
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
Cc: =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 qemu-block@nongnu.org, Bin Meng <bin.meng@windriver.com>,
 qemu-devel@nongnu.org, Tom Yan <tom.ty89@gmail.com>,
 Niek Linnenbank <nieklinnenbank@gmail.com>,
 =?UTF-8?Q?Michal_Such=c3=a1nek?= <msuchanek@suse.de>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 Warner Losh <imp@bsdimp.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 6/24/21 4:50 AM, Alexander Bulekov wrote:
> On 210623 2000, Philippe Mathieu-Daudé wrote:
>> Hi Ubi-Wan Kenubi and Tom,
>>
>> In commit a9bcedd (SD card size has to be power of 2) we decided
>> to restrict SD card size to avoid security problems (CVE-2020-13253)
>> but this became not practical to some users.
>>
>> This RFC series tries to remove the limitation, keeping our
>> functional tests working. It is unfinished work because I had to
>> attend other topics, but sending it early as RFC to get feedback.
>> I'll keep working when I get more time, except if one if you can
>> help me.
>>
>> Alexander, could you generate a qtest reproducer with the fuzzer
>> corpus? See: https://bugs.launchpad.net/qemu/+bug/1878054
> 
> I think that bug was already fixed - the reproducer no logner causes a
> timeout on 6.0. Did I misunderstand something?

That bug was fixed but now I'm changing the code and would like to feel
sure I'm not re-introducing the problem, so having the reproducer in the
tree would help.

> I applied this series and ran the OSS-Fuzz corpus for the sdhci-v3
> config. The only problem it found is this assert() (that exists without the
> patch anyways):
> https://bugs.chromium.org/p/oss-fuzz/issues/detail?id=29225 

Sigh.

> Let me know if this is something you think I should report on gitlab..

Yes please :(

> I'll leave the fuzzer running for another 24h or so, but otherwise I'm
> happy to leave a Tested-by, once there is a V1 series 
> -Alex

Thanks!

Phil.

