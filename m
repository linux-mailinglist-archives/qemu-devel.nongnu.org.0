Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E745E6DCF24
	for <lists+qemu-devel@lfdr.de>; Tue, 11 Apr 2023 03:19:07 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pm2X4-00071z-On; Mon, 10 Apr 2023 21:10:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pm2X2-0006zZ-Q3
 for qemu-devel@nongnu.org; Mon, 10 Apr 2023 21:10:48 -0400
Received: from mail-pj1-x102d.google.com ([2607:f8b0:4864:20::102d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pm2X1-0001tk-9X
 for qemu-devel@nongnu.org; Mon, 10 Apr 2023 21:10:48 -0400
Received: by mail-pj1-x102d.google.com with SMTP id
 nh20-20020a17090b365400b0024496d637e1so11661276pjb.5
 for <qemu-devel@nongnu.org>; Mon, 10 Apr 2023 18:10:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1681175446;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=7TOLPu/wKjGC/+u479uRo1kct2BVpillc1jnVkVSEjU=;
 b=ZEisOnM8kiIKjpwK+UFYygi7Z/KlALG/MqfbpK2bP5hXgrhzmGUadwWsKf2TmjrSgU
 hLuihSXBb47fZi6GGrF4vN2i6Al0CWfboBUl8F00DEEg5rFEYp4e5ATg72kfEXA6me7y
 RMBt3R9f0VI6ChQ9lTTsiDLGyyJaRiehfu+m1+1jrdUXtrU5vrYHctD4OJbVIVXZoMBP
 5kIgEuGkxQLGMphz357xtQgarPFfe37LvwBcH4IVBcw+pcI76Lg+LMOYnEVObBG6/n/X
 tvT6dzSASvYf4Ka9ckZgi65h5zbtnxqk5Ti2UmMbRYeD7p2SCFvvHUi4NgiecNTsz9aQ
 UT/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1681175446;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=7TOLPu/wKjGC/+u479uRo1kct2BVpillc1jnVkVSEjU=;
 b=WMAd+Mt/1SpeCLtIXz2sD0eXN7aF/I2aLrde8PWb/c9afjwcuBUy7Mdx6TUn8BCWoP
 QQuuexM+pB5u+pKRgRvID6MDvoUdmwYNBpqHZ0zjqcWaJgimGoTzZCwHm9CYqtKOhq3h
 qrm+urh8FVZqJ8x2FEKPrrPe5qPHK5KgDm9NukbaxzEdvU7/4qcC49Pwhm32TWoSXPZl
 FtLnbQvrOI0TYuGDauaHb0NfymPEMPXFJInLQIhY4pelIhp9HtxC8S1LkHukix3ZFLVo
 08F4tjjo1j75R0Ox77d2nRCqNj99rdQzzLmRfZUDC7kTqGBZQlgZwfXS6w1IQsDIsR/+
 y1/A==
X-Gm-Message-State: AAQBX9cKHg+yH6n6tTuAvTN4A/rstXIXe9Y6K/vK5jx/VWgdMPGtwJkk
 W1Q/RsZb6aMwkgM4WGHaybDv0A==
X-Google-Smtp-Source: AKy350athOMrNa8FuB+pAhgq5Mm0nldD9YIuGQAIlOE803x0x305xhvCA5FGAxHW4u60D3uwE7/HbQ==
X-Received: by 2002:a17:902:ea03:b0:1a6:492c:df23 with SMTP id
 s3-20020a170902ea0300b001a6492cdf23mr1128314plg.57.1681175446571; 
 Mon, 10 Apr 2023 18:10:46 -0700 (PDT)
Received: from [10.1.0.142] (h146.238.133.40.static.ip.windstream.net.
 [40.133.238.146]) by smtp.gmail.com with ESMTPSA id
 be3-20020a170902aa0300b00183c6784704sm6488961plb.291.2023.04.10.18.10.42
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 10 Apr 2023 18:10:46 -0700 (PDT)
Message-ID: <9b7e0049-fb4a-092a-12a5-be1e79aad534@linaro.org>
Date: Mon, 10 Apr 2023 18:10:38 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH for-8.0] docs/cxl: Fix sentence
Content-Language: en-US
To: Stefan Weil <sw@weilnetz.de>,
 Jonathan Cameron <Jonathan.Cameron@huawei.com>
Cc: qemu-devel@nongnu.org, qemu-trivial@nongnu.org,
 "Michael S . Tsirkin" <mst@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>
References: <20230409201828.1159568-1-sw@weilnetz.de>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20230409201828.1159568-1-sw@weilnetz.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102d;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102d.google.com
X-Spam_score_int: -52
X-Spam_score: -5.3
X-Spam_bar: -----
X-Spam_report: (-5.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-3.246,
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

On 4/9/23 13:18, Stefan Weil via wrote:
> Signed-off-by: Stefan Weil <sw@weilnetz.de>
> ---
> 
> If my change is okay I suggest to apply the patch for 8.0
> because it fixes documentation.
> 
> Regards,
> Stefan W.
> 
>   docs/system/devices/cxl.rst | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/docs/system/devices/cxl.rst b/docs/system/devices/cxl.rst
> index f25783a4ec..4c38223069 100644
> --- a/docs/system/devices/cxl.rst
> +++ b/docs/system/devices/cxl.rst
> @@ -111,7 +111,7 @@ Interfaces provided include:
>   
>   CXL Root Ports (CXL RP)
>   ~~~~~~~~~~~~~~~~~~~~~~~
> -A CXL Root Port servers te same purpose as a PCIe Root Port.
> +A CXL Root Port serves the same purpose as a PCIe Root Port.
>   There are a number of CXL specific Designated Vendor Specific
>   Extended Capabilities (DVSEC) in PCIe Configuration Space
>   and associated component register access via PCI bars.

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

