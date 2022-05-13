Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CB270526658
	for <lists+qemu-devel@lfdr.de>; Fri, 13 May 2022 17:40:49 +0200 (CEST)
Received: from localhost ([::1]:40788 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1npXPM-0001hn-Pw
	for lists+qemu-devel@lfdr.de; Fri, 13 May 2022 11:40:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44494)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1npXKL-0006GK-4m
 for qemu-devel@nongnu.org; Fri, 13 May 2022 11:35:37 -0400
Received: from mail-pf1-x431.google.com ([2607:f8b0:4864:20::431]:45995)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1npXKG-0007At-0E
 for qemu-devel@nongnu.org; Fri, 13 May 2022 11:35:34 -0400
Received: by mail-pf1-x431.google.com with SMTP id y41so7966595pfw.12
 for <qemu-devel@nongnu.org>; Fri, 13 May 2022 08:35:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :references:from:in-reply-to:content-transfer-encoding;
 bh=XyxiKCqLHGXcQNa0HHS0cmiMniH0YZFsdT8KZlKs/Jk=;
 b=FSuW/9bw/1zdjGK6nNv8jKAN2g9LJubXz9cDlgMZaGbEjI82v37LNqfBDI4iZw+XgK
 /7PkOl5NXB23MTPP56FzaqcbLQs56nxcdPgctbqtivQrPkKDnh5opjO/niIzvqfH0fRz
 vJmeLGJmSJv7UjDGiJgXKG+cu/ndQcaaFeP/lQY0s02SkFVVHdV5yOBGHp6eUAGMK+g1
 gF1U0YgHMQ/WJ6GxDmU7yPbs9mVStiLHMCDUAHl1h5qzNgDnyC5P1I+PSQd/gXb3acz3
 tN5du0GJcmlV/O5Al8zTgu+uoV5Gn40TR8CRDhqh2TTKlZd2qWzKWEyQov525O29H7Jx
 6ZKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:in-reply-to
 :content-transfer-encoding;
 bh=XyxiKCqLHGXcQNa0HHS0cmiMniH0YZFsdT8KZlKs/Jk=;
 b=n1HHYJ9AyHgXwX1aaHwZurlX1F9Jqo2B5f35KBq2H3q8pefZES7c84dwnmSanXfJXj
 XYFZ3PkOuorBG/ZJa2ajRq8QKKIAILJnkBuNIbTikEx8xsJwzFjh4VRnaRSU99VkfdHR
 DVUAMgcOL8FR/6tOFBm5mLphyz8/OFTiNcFcFzmBj/jgOab+ZO+/LCux10P1Oqp2MAyO
 Mdj5Bb5Wd6Ypl+/wqkRYHbja5iWG3w+8KCdqCfFNy2n2ilCEIOGKYJ4AbOIepu/JwDuW
 Xd500pT1tPEjijoA3Dpw3uAKbiL03/WiTJHzYpjnWlCUbjq159cn7GBMgmcDlRgW66yF
 i+7w==
X-Gm-Message-State: AOAM533LMi0b3xIwTr8jAnn6EJJjp5luikyovGaqyW0aKptBWQ0BSplI
 Ohnf+bI0lCNzPRutpQQV2vv3+6nUz7Nkhg==
X-Google-Smtp-Source: ABdhPJz5mQkq987zRUkkTaKjptSkkGerpBdUyB9z+9q0C4Avl/ZnJ2U/0+NrkfYQmQsj5X5kVBTLYw==
X-Received: by 2002:a63:df10:0:b0:3db:8bb8:bf01 with SMTP id
 u16-20020a63df10000000b003db8bb8bf01mr4383146pgg.163.1652456130611; 
 Fri, 13 May 2022 08:35:30 -0700 (PDT)
Received: from ?IPV6:2607:fb90:46a:1099:e682:8d73:3200:dae5?
 ([2607:fb90:46a:1099:e682:8d73:3200:dae5])
 by smtp.gmail.com with ESMTPSA id
 n3-20020a63f803000000b003c62fa02f08sm1793091pgh.43.2022.05.13.08.35.29
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 13 May 2022 08:35:30 -0700 (PDT)
Message-ID: <174ce227-73e5-da2e-f448-37a12ef7147a@linaro.org>
Date: Fri, 13 May 2022 08:35:27 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH 1/2] hw/arm/virt: Fix incorrect non-secure flash dtb node
 name
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20220513131316.4081539-1-peter.maydell@linaro.org>
 <20220513131316.4081539-2-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220513131316.4081539-2-peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::431;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x431.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 5/13/22 06:13, Peter Maydell wrote:
> In the virt board with secure=on we put two nodes in the dtb
> for flash devices: one for the secure-only flash, and one
> for the non-secure flash. We get the reg properties for these
> correct, but in the DT node name, which by convention includes
> the base address of devices, we used the wrong address. Fix it.
> 
> Spotted by dtc, which will complain
> Warning (unique_unit_address): /flash@0: duplicate unit-address (also used in node /secflash@0)
> if you dump the dtb from QEMU with -machine dumpdtb=file.dtb
> and then decompile it with dtc.
> 
> Signed-off-by: Peter Maydell<peter.maydell@linaro.org>
> ---
>   hw/arm/virt.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

