Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5AC836EE504
	for <lists+qemu-devel@lfdr.de>; Tue, 25 Apr 2023 17:52:07 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1prKwf-00006n-CU; Tue, 25 Apr 2023 11:51:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1prKwc-00005d-MI
 for qemu-devel@nongnu.org; Tue, 25 Apr 2023 11:51:06 -0400
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1prKwa-0007Q1-Tc
 for qemu-devel@nongnu.org; Tue, 25 Apr 2023 11:51:06 -0400
Received: by mail-wr1-x435.google.com with SMTP id
 ffacd0b85a97d-2fbb99cb297so5375175f8f.1
 for <qemu-devel@nongnu.org>; Tue, 25 Apr 2023 08:51:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1682437863; x=1685029863;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=XZl2ktAfRWxTsAkRl0sJZCqPB69xmaDYjO6YukhtMvM=;
 b=hVb2Ifnv//nW+LJeHFrOCHKWUSapwUkwK6n45vxaFB493UEc068gtiGYNQ0JukP5Fm
 7FgphThmKnHxfZ28Pco8bXNKiUB/wNkFaNxAoP+eHQoPNLj+APKbiYdo+76gUFOwqVXu
 33IWCdI+JgewfsbQCjAnoVloqf74XDuvxXu6Ba6mEGJzhoxHs9OPVBB7hqugx7noItBw
 E3foeEXJ0kc+xtQXSUEQwyu3QZg9ph0QDfWXGN+FYjvJ+1h9HpYQEhFzY1hOKk6a9XIn
 EfMdXoXtz4iqo+zy26xWxaXyPNIupSD1W/YOtokHML0eIk/xcy0T5/oNFbjCOqFy8t01
 tUKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682437863; x=1685029863;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=XZl2ktAfRWxTsAkRl0sJZCqPB69xmaDYjO6YukhtMvM=;
 b=d836HXSBoiwtHsv7mUupuiUXY9SwmLSgayXcQOisIvO3hGNUFkDYFukNWOHiUPR3Y6
 ib9fDKfVspF8DY6Z4iQ6GicyUH/wwnXUU3qKdcCoKLoSWGNC3YJ2kWHGzWpeE/dmuNi9
 /zPGC315PmXxEUbaTWqRKFZYqntCm1f6KSIGwuhD+qcyxSMbjwt9R2LqIqA6XvoIWibM
 mgcNUm1vbb12CTP9AC/2tJINYPfAvcT0SlivggAAEMUU9PavNl7BxQcrKXkQdE/WMHYA
 OMK37kd19XT3kZErVfbmzXOU94M8CeZO01lOMyaShOs99rCVHLvcMKnihOXHj/R8PFIh
 kh6g==
X-Gm-Message-State: AAQBX9du5f3F/Qv6mWVrtKyOvG9xlZPWnZ7u3L4sFURnfysWjjam6nRE
 7dqNOUYjgh8+MQE5DXQxDqTAyg==
X-Google-Smtp-Source: AKy350bN7NoMqe7RqTe6nbl+XnR9Zv812W//8aPlHBASbg6Zhn7FtazEoZxENcmc/cf4fncFNa40tg==
X-Received: by 2002:adf:d4c6:0:b0:2fa:d079:2eca with SMTP id
 w6-20020adfd4c6000000b002fad0792ecamr12527410wrk.43.1682437863306; 
 Tue, 25 Apr 2023 08:51:03 -0700 (PDT)
Received: from [172.27.248.56] ([212.187.182.164])
 by smtp.gmail.com with ESMTPSA id
 u6-20020adff886000000b002f7780eee10sm13406207wrp.59.2023.04.25.08.51.02
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 25 Apr 2023 08:51:02 -0700 (PDT)
Message-ID: <4a9fd41f-c4d8-6675-95ee-2015d08325e8@linaro.org>
Date: Tue, 25 Apr 2023 16:51:02 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.10.0
Subject: Re: [PATCH 0/3] hw/arm: Fix raspi, aspeed bootloaders on big-endian
 hosts
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
Cc: qemu-stable@nongnu.org, Andrew Jeffery <andrew@aj.id.au>,
 Joel Stanley <joel@jms.id.au>, =?UTF-8?Q?C=c3=a9dric_Le_Goater?=
 <clg@kaod.org>
References: <20230424152717.1333930-1-peter.maydell@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230424152717.1333930-1-peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::435;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x435.google.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.422,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

> Cédric Le Goater (2):
>    hw/arm/boot: Make write_bootloader() public as arm_write_bootloader()
>    hw/arm/aspeed: Use arm_write_bootloader() to write the bootloader
> 
> Peter Maydell (1):
>    hw/arm/raspi: Use arm_write_bootloader() to write boot code
> 
>   include/hw/arm/boot.h | 49 +++++++++++++++++++++++++++++++++
>   hw/arm/aspeed.c       | 38 +++++++++++++------------
>   hw/arm/boot.c         | 35 ++++++-----------------
>   hw/arm/raspi.c        | 64 +++++++++++++++++++++++--------------------
>   4 files changed, 111 insertions(+), 75 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>


