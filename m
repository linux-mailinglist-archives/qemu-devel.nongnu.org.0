Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FB7C37A67C
	for <lists+qemu-devel@lfdr.de>; Tue, 11 May 2021 14:23:24 +0200 (CEST)
Received: from localhost ([::1]:33714 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lgRQ2-00078f-Lf
	for lists+qemu-devel@lfdr.de; Tue, 11 May 2021 08:23:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39050)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lgRMn-0004aD-51; Tue, 11 May 2021 08:20:02 -0400
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432]:37650)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lgRMj-0000j5-HO; Tue, 11 May 2021 08:20:00 -0400
Received: by mail-wr1-x432.google.com with SMTP id q5so457731wrs.4;
 Tue, 11 May 2021 05:19:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=B7LEJrXMsmlpcQmqc5fEf2WLMb9EpZ1q/nPOHJ7EoLo=;
 b=e1RlsFSrN2EelXFjiKOIlF/zctcoS8oo33gnSzI/8XVX1gBN/pRC+vPAR3Ivjz5XLB
 3h//y3Gua5ZHXGNcMqnfZ0kH6XG5nBkLh2eEh+DnGkATRef7q3vY+EoGA4OYxmevFSQI
 yYosDo6/JVPuCsDoO9EKJqj2JN20HHeSuEM8m3Cr/QWWHOP2iy57UzrFKoQtiIOz16rE
 Jf58dIooRejcdH5xzoOqkUj5v/hu5dSRE5Zj9739E16g2tkrKcLN4/AMCPQ1ERjUMAaG
 qZYmgqhSU9Z27H1WdOu+3vZePxAoQN7IzxUxLG04mQUO2YGaD5IX5Ehy1tB7AKw8nfBc
 jqfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=B7LEJrXMsmlpcQmqc5fEf2WLMb9EpZ1q/nPOHJ7EoLo=;
 b=Zo5oG0El8WWZ1fEZap4oV6DjicKmHO3Hd6mKuIKOTtuk5seUem2kkl9T5JUvt3ZBuU
 pfhe2DuEtK4eOm3AiUkwqDKSiRSNtTzoaHyeJOWykQmdWqy3pk1bRq+8Q6k8JJMdw2Oy
 ayFu221AP+FsxgqXmpBpF7B3gefHVA3mTw+g44YfjcE4RltjCKIyaa00LNe5O8OPDAKO
 8nhxCIyR0iFNbtUeD/8BaX3ejpYexeOwS0FiTDnctXGOX/hXKm7guGO6PwjkgaP//BWp
 FMypMKRpWhwtYPpLS+pvv7EuRVkAVlc4uDrRfvGqtV7Q3eGkFQQTKJdrlHR57RiU1r9L
 aPXw==
X-Gm-Message-State: AOAM5316BYKVD6YQwd5TAuyZvGstQTp4VVDkSmFFB6qCbB/TtEuYm/wj
 im0+mgxCck3sZuwF/AKbyk4=
X-Google-Smtp-Source: ABdhPJz2kNkzj3BrN/jAqQznejKe+J0CypOlOXRcfuJ/cSQcGgDqw+EdwmLtlvErz/p5pB7IX87NhQ==
X-Received: by 2002:a5d:54c9:: with SMTP id x9mr36722658wrv.91.1620735594577; 
 Tue, 11 May 2021 05:19:54 -0700 (PDT)
Received: from [192.168.1.36] (39.red-81-40-121.staticip.rima-tde.net.
 [81.40.121.39])
 by smtp.gmail.com with ESMTPSA id a15sm26485985wrr.53.2021.05.11.05.19.53
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 11 May 2021 05:19:53 -0700 (PDT)
Subject: Re: [PATCH v2 0/6] hw/southbridge: QOM'ify vt82c686 as
 VT82C686B_SOUTHBRIDGE
To: BALATON Zoltan <balaton@eik.bme.hu>
References: <20210511041848.2743312-1-f4bug@amsat.org>
 <ecdd9299-ec2-5049-fe1e-d3c7d261d@eik.bme.hu>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <6e9cad77-bb24-6c0a-f841-1f8a1f3515e6@amsat.org>
Date: Tue, 11 May 2021 14:19:52 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <ecdd9299-ec2-5049-fe1e-d3c7d261d@eik.bme.hu>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::432;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x432.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.248,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.248, NICE_REPLY_A=-0.001,
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
Cc: Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>, qemu-block@nongnu.org,
 Huacai Chen <chenhuacai@kernel.org>, qemu-devel@nongnu.org,
 John Snow <jsnow@redhat.com>, Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi Zoltan,

On 5/11/21 1:28 PM, BALATON Zoltan wrote:
> On Tue, 11 May 2021, Philippe Mathieu-Daudé wrote:
>> The motivation behind this series is to remove the
>> isa_get_irq(NULL) call to simplify the ISA generic model.
>>
>> Since v1:
>> - rebased on top of remotes/dg-gitlab/tags/ppc-for-6.1-20210504
> 
> I'll try to have a look at these later but some notes: The pegasos2
> changes are now in master so if this was before that maybe rebasing on
> master is now enough.

This is what this series does, simply rebase on top of your merged
patches.

> However I wonder if any changes to pegasos2.c is
> needed due to changed init of the chip model or is that only affecting
> 82c686b?

There is no change in 'init' in this series, it is only QOM boilerplate
code churn, no logical change intended.

> Please also note that pegasos2 is not enabled by default due to
> needing undistributable firmware ROM so to test it you need to enable it
> in default-configs/devices/ppc-softmmu.mak

I remember you said you were mostly interested in the VT8231, not
the VT82C686. This series only QOM'ify the latter.

What is your idea? Send the firmware off-list and explain how
the OS works and how (what) to test?

Regards,

Phil.

>> Philippe Mathieu-Daudé (6):
>>  hw/isa/vt82c686: Name output IRQ as 'intr'
>>  hw/isa/vt82c686: Simplify removing unuseful qemu_allocate_irqs() call
>>  hw/isa/vt82c686: Let ISA function expose ISA IRQs
>>  hw/ide/via: Replace magic 2 value by ARRAY_SIZE / MAX_IDE_DEVS
>>  hw/ide/via: Connect IDE function output IRQs to the ISA function input
>>  hw/southbridge/vt82c686: Introduce VT82C686B_SOUTHBRIDGE

