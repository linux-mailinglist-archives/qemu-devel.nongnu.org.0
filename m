Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 978E065E606
	for <lists+qemu-devel@lfdr.de>; Thu,  5 Jan 2023 08:25:14 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pDKbR-0006AT-59; Thu, 05 Jan 2023 02:23:53 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pDKbO-00069u-Pf
 for qemu-devel@nongnu.org; Thu, 05 Jan 2023 02:23:50 -0500
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pDKbN-0007Rx-Bn
 for qemu-devel@nongnu.org; Thu, 05 Jan 2023 02:23:50 -0500
Received: by mail-wm1-x332.google.com with SMTP id
 z8-20020a05600c220800b003d33b0bda11so1958753wml.0
 for <qemu-devel@nongnu.org>; Wed, 04 Jan 2023 23:23:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=xUmH5HTkDt0ViSsLQl07iMRo0gXyzdxaykvd2Rd1Tkg=;
 b=sLbtQnLUUFVEFkHbuAnHAYxgm1Z9OITK5RjlkLAEKSXx/i9B5cwRnCrI8M6KxbVre3
 +lWqtX5z7SLt3qqLOYI4D0p/JDamHhon4u/7fy3DPPqZsA5OkA8RhffmuWEp41HNw6fL
 dWjYy3hS/fDGXnny6Kus2u2KXalgrvaWuzUDDf/ibnd4LArdcDNYOuec8j45YVSGZJPM
 RIYSblrH7YPpPulSPorpQ1P7+POeVngv+Ekya8Z/Knjv2b//7SUNQc40Kvgi2ulD+9Re
 ft5ZTsV76WC8+MstHi/5vr9xKdtWEFbTfOK/HKo8SuxdH5KSGU62IA33xjhdKjeDufG8
 8DuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=xUmH5HTkDt0ViSsLQl07iMRo0gXyzdxaykvd2Rd1Tkg=;
 b=Lkx05KC8B/imy/fIVAZT4JkioOb8uXSXhHVlaMn5G2AW+5CkUzJRhOfJ5mRuMCYqWN
 4hMQKe5pX6pQCK+HhI9Rd3EvsmQeBeBcXHSZ7NsFsXvksaJ3ulZguXv7VshXNjCsggo0
 PGe6WaYWq1whEXLi1MUcm+Y93RSFYaU7jq7LY/krRB9q3x5mQeMm56dtjEi2iS5veCFs
 zegVVruSVzOpM/4D3Ze5oDajVqZ7hAmijg6kWwAYPoGg/iuzD6G6fWekI8ClMXSPB8oN
 fqg8Lag2gUv/1e2f1ET0gAuKOtsseP3a8XBTwM5VKgoDO0IoDyw+TH1XFGBQN+kzd7UA
 7OCw==
X-Gm-Message-State: AFqh2kobAoTB6uP0basMYx0TwJey2Z2t0k1K0d7OzV01x2wyG0ARymZY
 12ih/WHLlF2mSX0HHbb4b2ZJeA==
X-Google-Smtp-Source: AMrXdXvMzDGgtdYKd8wL5yGPA+TxdY+UNHQoVSVkODTKDWGKx3GjMChZf9QRTF1ai6AAaRupeB9pow==
X-Received: by 2002:a05:600c:1d89:b0:3d3:5cd6:781 with SMTP id
 p9-20020a05600c1d8900b003d35cd60781mr34743635wms.37.1672903427849; 
 Wed, 04 Jan 2023 23:23:47 -0800 (PST)
Received: from [192.168.30.216] ([81.0.6.76]) by smtp.gmail.com with ESMTPSA id
 fc14-20020a05600c524e00b003a3442f1229sm1468189wmb.29.2023.01.04.23.23.47
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 04 Jan 2023 23:23:47 -0800 (PST)
Message-ID: <8d628e8c-2531-c580-b0d7-a67a0fd029b0@linaro.org>
Date: Thu, 5 Jan 2023 08:23:46 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.6.1
Subject: Re: [PATCH v7 2/7] mac_{old, new}world: Use local variable instead of
 qdev_get_machine()
Content-Language: en-US
To: BALATON Zoltan <balaton@eik.bme.hu>, qemu-devel@nongnu.org,
 qemu-ppc@nongnu.org
Cc: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
References: <cover.1672868854.git.balaton@eik.bme.hu>
 <719299533b89aa4516966065eae05c75744f50d3.1672868854.git.balaton@eik.bme.hu>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <719299533b89aa4516966065eae05c75744f50d3.1672868854.git.balaton@eik.bme.hu>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::332;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x332.google.com
X-Spam_score_int: -37
X-Spam_score: -3.8
X-Spam_bar: ---
X-Spam_report: (-3.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.708,
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

On 4/1/23 22:59, BALATON Zoltan wrote:
> We already have machine in a local variable so no need to use
> qdev_get_machine(), also remove now unneded line break.

Typo "unneeded".

> Signed-off-by: BALATON Zoltan <balaton@eik.bme.hu>
> ---
>   hw/ppc/mac_newworld.c | 3 +--
>   hw/ppc/mac_oldworld.c | 3 +--
>   2 files changed, 2 insertions(+), 4 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>


