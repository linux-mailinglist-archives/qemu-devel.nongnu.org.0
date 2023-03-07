Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A2A9F6AF736
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Mar 2023 22:08:08 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pZeXA-0002zK-Gi; Tue, 07 Mar 2023 16:07:44 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pZeX3-0002qQ-4R
 for qemu-devel@nongnu.org; Tue, 07 Mar 2023 16:07:40 -0500
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pZeX0-0003mK-Qk
 for qemu-devel@nongnu.org; Tue, 07 Mar 2023 16:07:36 -0500
Received: by mail-wm1-x330.google.com with SMTP id
 d41-20020a05600c4c2900b003e9e066550fso8032235wmp.4
 for <qemu-devel@nongnu.org>; Tue, 07 Mar 2023 13:07:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1678223253;
 h=content-transfer-encoding:in-reply-to:references:cc:to:from
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=jZIDEo39PYzK8bPycMI1137MZudFw3Ehs5J6N2J3HxY=;
 b=KbUAT7p9clq4oiL8eOTsbmLGzc6Zd8TFiQV1cF5B7EQPE7wsaKeYv8ceY/A2aHpurG
 O+bcJfRGXH5uPIw0l7VgwMFeaIvzBrfGQtYMR38/GeTpWWN1gCKnqiSm3WCgoZ3Twjji
 o9HJbDPtbeo33oJERMP7GyyUMTPAyOwCcSnO5sgPaeIMOaP9L6qlczsveCzJ8RuQD1Ls
 aHMIEqM63FRViq/7BQcoXAzxiZ2wCptALLJ0OZIG4MpP/U4L9Olbs2Sg+fvbTTKiGTWR
 65Pcy3NolW9iwRrPucng1yzrRayuWhNa7RnYK4DAfA6NADCcLoZWACBg4Hxf1pvQDH60
 YtnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678223253;
 h=content-transfer-encoding:in-reply-to:references:cc:to:from
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=jZIDEo39PYzK8bPycMI1137MZudFw3Ehs5J6N2J3HxY=;
 b=s8K4eebMkC/HmZMk90P0IVDb3CiDjamAFBXbRitbFWezi2PWwmi5iqR+dhxqwGK1V9
 PfiPQ8LZcjrab8gWPJphsNek5ZvWpQ98BZEmzziNeKANsSMeDcbPfrLjNwldFy72S+wi
 B2TyG3K4knvQ1z13p5NhdqYDX1E/ONrHlu95nQ93fg9ukK0XR6fOmfg6JwOHwAi/FDhT
 GwyXmdKQbLOx9ItWbayJKaHjc1fI4lmKzWqeLjtGkfrQ7YZ+PndoXNABHajPjqJWGKqR
 lhGsr/0Vbs+Lf+HxfA+FEszW94RAhe9d0G7QA5Uo3ES/BKSz85/b96JBS65+MnjwlBGo
 Klew==
X-Gm-Message-State: AO0yUKVyfzzT2BYlCb0VCWYfgOb+28KaXOdBK5jLaJw9gsEJ7qbAInXq
 9KkKPyWQOlHMSTE+LcDncfnNsA==
X-Google-Smtp-Source: AK7set+uF4V/FKf98+jRYCaRo3f0VfFePFf8m7yqP1eSFy3gcOsFJ8Pt6LFxMwPH5bx8tx5s/GBGNw==
X-Received: by 2002:a05:600c:a03:b0:3e2:20c7:6544 with SMTP id
 z3-20020a05600c0a0300b003e220c76544mr13985333wmp.19.1678223252986; 
 Tue, 07 Mar 2023 13:07:32 -0800 (PST)
Received: from [192.168.1.115] (126.red-88-28-13.dynamicip.rima-tde.net.
 [88.28.13.126]) by smtp.gmail.com with ESMTPSA id
 o14-20020a05600c510e00b003dc522dd25esm2364718wms.30.2023.03.07.13.07.31
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 07 Mar 2023 13:07:32 -0800 (PST)
Message-ID: <db670377-a390-4ff6-14d1-30ab531141bd@linaro.org>
Date: Tue, 7 Mar 2023 22:07:30 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.8.0
Subject: Re: [PATCH v2 0/2] MIPS Virt machine
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
To: Jiaxun Yang <jiaxun.yang@flygoat.com>
Cc: QEMU devel <qemu-devel@nongnu.org>, Thomas Huth <thuth@redhat.com>
References: <20230304223803.55764-1-jiaxun.yang@flygoat.com>
 <67f67c63-3706-cb3f-94a8-beea99f62c05@linaro.org>
 <F2FD4D49-9513-4147-B8A2-07048C055A75@flygoat.com>
 <d300dc97-557c-a0ca-0206-02068655135c@linaro.org>
In-Reply-To: <d300dc97-557c-a0ca-0206-02068655135c@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::330;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x330.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

On 7/3/23 21:14, Philippe Mathieu-Daudé wrote:
> On 7/3/23 21:07, Jiaxun Yang wrote:
>>
>>
>>> 2023年3月7日 15:01，Philippe Mathieu-Daudé <philmd@linaro.org> 写道：
>>>
>>> On 4/3/23 23:38, Jiaxun Yang wrote:
>>>> Hi there,
>>>> This patchset is to add a new machine type for MIPS architecture, which
>>>> is purely a VirtIO machine.
>>>
>>>> Jiaxun Yang (2):
>>>>   hw/misc: Add MIPS Trickbox device
>>>>   hw/mips: Add MIPS virt board
>>> Thanks, applied with following changes:
>>
>> Thanks for those clean-ups!

Unfortunately I have to drop this due to the libfdt
dependency, which fails the --disable-fdt job:
https://gitlab.com/philmd/qemu/-/jobs/3890587748

