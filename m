Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4EA0A2FC4C7
	for <lists+qemu-devel@lfdr.de>; Wed, 20 Jan 2021 00:34:22 +0100 (CET)
Received: from localhost ([::1]:55108 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l20Vx-0002tA-C1
	for lists+qemu-devel@lfdr.de; Tue, 19 Jan 2021 18:34:21 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:37688)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1l20V2-0002S9-Bs
 for qemu-devel@nongnu.org; Tue, 19 Jan 2021 18:33:24 -0500
Received: from mail-ed1-x534.google.com ([2a00:1450:4864:20::534]:39594)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1l20V0-0006Se-So
 for qemu-devel@nongnu.org; Tue, 19 Jan 2021 18:33:24 -0500
Received: by mail-ed1-x534.google.com with SMTP id b21so14782964edy.6
 for <qemu-devel@nongnu.org>; Tue, 19 Jan 2021 15:33:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=Lff83h5dFdpxksWcGw/cPff8YXxA4Gw/5cvnAo+ZIfg=;
 b=J+P5RsXUaVJ56kEDlDL6N8qCz1HMfbCVSIeg36kCcZFADV/qZEsjH0H+KxxSEC4big
 6qmGJ0C3PCtBsmgx0RYxcISUQUKIKLnhJC96i+CShXsGYBIYxcJNAjLCZaaw2PzGDMxD
 BP2QKIGr+sCYplDxpuxHT95gNP+yzpTT/ijPSHFVEYjzqn9gw59ntXt9vGBaGHwDcq0p
 ts9BxukFjwzzoXEZqhms6kRQd5vrFPyw/D8qbnM6+xbPVLflfMxzZQLbc4g/y95auivA
 JXYNuE8d3+QW8I8EBbxyUChbx9VyEy+4QJuPYb/gNzCaM0a0txp2sb6bOOG4GuF4orLB
 2JGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=Lff83h5dFdpxksWcGw/cPff8YXxA4Gw/5cvnAo+ZIfg=;
 b=qXqzDauyq54U5NiBkx/nu/HYeJaJlTzylv0ZIB8Rs0aQJdCp+om+yiMJ2zxmNNXUb2
 H7ieU8np6ltTrZuzYlFMM91kZZ8mtxffYamGb2bBcVnsaWLkHaUqSrjjTBn7i++GVSyY
 cziGFkXReuu/OEy5VjERDUthj349Xou4CuV1lnrQ53+jr3FQWXfxbg3U49nMV4d3FpL/
 OlqjlpOauEoliLxcu84AOvgyQQEoN5NDMZl1YCXNPcsAp7fp+3DVPGOoXJQJouoX9zla
 o4ChXy+1lWk6mP9FKtCfZu5nyyHL/VEqkATpqxYN9ht5TPyvy7J0lY9LnRBfPdv45XCj
 PQEQ==
X-Gm-Message-State: AOAM530AmTFioPbvRcMC9vhZCZKStyVpMZL8w67UIQqRVaDyw+82PZWh
 2LFpV7GqFxS0gNwHWlXjUuisoZlFgKY=
X-Google-Smtp-Source: ABdhPJxcXmO4DKNSvl99n0pLcMJ1qaTj2KyTcsuaDuBRqylEW4b3VdHSNdKYfe3bjXSY3Z4X/PIVOA==
X-Received: by 2002:aa7:c0cd:: with SMTP id j13mr5154223edp.217.1611099200112; 
 Tue, 19 Jan 2021 15:33:20 -0800 (PST)
Received: from [192.168.1.36] (13.red-83-57-169.dynamicip.rima-tde.net.
 [83.57.169.13])
 by smtp.gmail.com with ESMTPSA id k22sm160926edv.33.2021.01.19.15.33.18
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 19 Jan 2021 15:33:19 -0800 (PST)
Subject: Re: [PATCH 0/5] tcg: Dynamically allocate temporaries
To: BALATON Zoltan <balaton@eik.bme.hu>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?B?THVrw6HFoSBEb2t0b3I=?= <ldoktor@redhat.com>
References: <20210119183428.556706-1-richard.henderson@linaro.org>
 <7595e6e-bc3d-d626-656b-e7ba3bfd8b90@eik.bme.hu>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <b0b5b969-9f67-b9b2-cac2-319b672b9913@amsat.org>
Date: Wed, 20 Jan 2021 00:33:18 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <7595e6e-bc3d-d626-656b-e7ba3bfd8b90@eik.bme.hu>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::534;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-ed1-x534.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
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
Cc: lvivier@redhat.com, alistair23@gmail.com, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 1/20/21 12:06 AM, BALATON Zoltan wrote:
> On Tue, 19 Jan 2021, Richard Henderson wrote:
>> My recent change for caching tcg constants has, in a number of cases,
>> overflowed the statically allocated array of temporaries.  Change to
>> dynamic allocation.
> 
> This seems to work for me so
> 
> Tested-by: BALATON Zoltan <balaton@eik.bme.hu>
> 
> but have you done any performance tests to check that this actually
> improves emulation speed? To mee it seems slower. Booting AmigaOS on
> sam460ex with c0dd6654f207 (just before your TCG series) takes:
> 
> real    0m33.829s
> user    0m34.432s
> sys    0m0.296s
> 
> but on HEAD with this series:
> 
> real    0m44.381s
> user    0m46.058s
> sys    0m0.532s
> 
> This is noticable decrease in speed also without measuring it. With just
> increasing the TCG_MAX_TEMPS to 2048 on 7c79721606be without this series
> I get:
> 
> real    0m42.681s
> user    0m44.208s
> sys    0m0.435s
> 
> So the performance regression is somewhere in the original series not in
> this fix up series.

Cc'ing Lukas for the performance part, as he is investigating
how to catch such regressions.

>> I'll note that nothing in check-acceptance triggers this overflow.
>> Anyone care to add some more test cases there?
> 
> The proposed test for the upcoming pegasos2 machine may also catch this
> (when that will be merged, its dependencies are still under review)

What are your running on pegasos2?

> or
> the sam460ex test that currently only checks the firmware could be
> enhanced to try to boot AROS if somebody wants to do that. The drawback
> is that it needs an external iso whereas the current test doesn't need
> any additional images but it did not catch problems with IRQ and neither
> this problem with TCG temps.

So this other option is not very useful, right?

