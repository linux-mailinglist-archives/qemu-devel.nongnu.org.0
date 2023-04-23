Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 119356EC166
	for <lists+qemu-devel@lfdr.de>; Sun, 23 Apr 2023 19:37:30 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pqddg-0005EF-6K; Sun, 23 Apr 2023 13:36:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pqdda-0005DZ-7K
 for qemu-devel@nongnu.org; Sun, 23 Apr 2023 13:36:36 -0400
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pqddY-0007sf-R2
 for qemu-devel@nongnu.org; Sun, 23 Apr 2023 13:36:33 -0400
Received: by mail-wm1-x32d.google.com with SMTP id
 5b1f17b1804b1-3f1957e80a2so54147515e9.1
 for <qemu-devel@nongnu.org>; Sun, 23 Apr 2023 10:36:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1682271391; x=1684863391;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=wYR3wRaLVzHwh9BLurkt6RHNEP24mhPO7+UmQQPL93s=;
 b=vXsRbKM5plab5lAdB8jINfdDtNBwwjCU5FrAfmMPdlrCL8k0371I/prxFjRvB/FSHf
 GtTpjuAOgWojrVAldh6Ar8zx0xf3Lb/konZZhIXAf3bFuyN6j5Rm3p0DGEg1V99S3PW4
 QfXLwcHUH8yCHQKfpkfMWoebM2Z2wdlLbKBwAfR8YeJLsKFCZ4Dnor+E6Kde6TEMNIuk
 8rHBFiQpnFrOo3nZ9nqlVKeqyzUIw5ItRpwZPZXDDrWkVZICbR1QCPBk10o7F6Q8cLwa
 f8dcJoED0S3RWQOxDCcOlBR4NAXvsClznTNFr2UrmcncDDZ9JOGNVqY0TGelQDLAa+ra
 N4fg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682271391; x=1684863391;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=wYR3wRaLVzHwh9BLurkt6RHNEP24mhPO7+UmQQPL93s=;
 b=WhoOPRbDSXP4/LMtPqAAFnDVZSs96OFNPX4BZnqZ8Iy4Fw2Ox1W+OZbzVKdmaAh+CM
 zH9XEz6aXQmvKuom3jea66TqHWiWTGUhTjYjbqVWWWyyvVRF4bZXz9SIInjxSyiDifZq
 RI6ufT0eoEKgFBVRdmS9XETwYmP1IgixJcQrJLhw+oC69wFifHD/DtMbr1eHSUNK82tj
 tALSN17FYNjKME/trVZuWzFO9JaaspDVWHck+KK1P24In3TnShKSV9qL7b6B1QVQbM7s
 7xNVwSxHJkerK5i4ISubnXBkxtmbQiqi/iUV6pB5DUT4jt6ju9qnLdSCWCqgkI9j7y7l
 h4Xw==
X-Gm-Message-State: AAQBX9dkjqutwKJN+2udPCurZEAILJW1IK1L/X0UMH2Xv+i/j5cweMXg
 1OQ7rBacBFtC2C9P6vuvONTuJA==
X-Google-Smtp-Source: AKy350Y6ut9ASzV/DJzjxnMk8tmq4Tdmhiw5zLHzlPFj1F0TXqxwX7Di6F8YOqjbsKbqsf+Ddhu5Jw==
X-Received: by 2002:a05:600c:35c8:b0:3f1:96a8:3560 with SMTP id
 r8-20020a05600c35c800b003f196a83560mr4400207wmq.10.1682271391008; 
 Sun, 23 Apr 2023 10:36:31 -0700 (PDT)
Received: from [192.168.252.175] (8.red-88-29-167.dynamicip.rima-tde.net.
 [88.29.167.8]) by smtp.gmail.com with ESMTPSA id
 y32-20020a05600c342000b003f173956a82sm13407544wmp.21.2023.04.23.10.36.29
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 23 Apr 2023 10:36:30 -0700 (PDT)
Message-ID: <e457ede1-f6a6-f04b-eacd-cbb96e5695cb@linaro.org>
Date: Sun, 23 Apr 2023 19:36:20 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.10.0
Subject: Re: [PATCH 04/13] hw/ide: Extract IDEBus assignment into bmdma_init()
Content-Language: en-US
To: Bernhard Beschow <shentey@gmail.com>, qemu-devel@nongnu.org
Cc: qemu-block@nongnu.org, Jiaxun Yang <jiaxun.yang@flygoat.com>,
 BALATON Zoltan <balaton@eik.bme.hu>, John Snow <jsnow@redhat.com>,
 Huacai Chen <chenhuacai@kernel.org>, qemu-ppc@nongnu.org
References: <20230422150728.176512-1-shentey@gmail.com>
 <20230422150728.176512-5-shentey@gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230422150728.176512-5-shentey@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32d;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32d.google.com
X-Spam_score_int: -42
X-Spam_score: -4.3
X-Spam_bar: ----
X-Spam_report: (-4.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-2.143,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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

On 22/4/23 17:07, Bernhard Beschow wrote:
> Every invocation of bmdma_init() is followed by `d->bmdma[i].bus = &d->bus[i]`.
> Resolve this redundancy by extracting it into bmdma_init().
> 
> Signed-off-by: Bernhard Beschow <shentey@gmail.com>
> ---
>   hw/ide/cmd646.c  | 1 -
>   hw/ide/pci.c     | 1 +
>   hw/ide/piix.c    | 1 -
>   hw/ide/sii3112.c | 1 -
>   hw/ide/via.c     | 1 -
>   5 files changed, 1 insertion(+), 4 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>


