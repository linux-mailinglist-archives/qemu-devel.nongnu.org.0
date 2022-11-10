Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3EDE6623B6B
	for <lists+qemu-devel@lfdr.de>; Thu, 10 Nov 2022 06:43:14 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ot0L5-0002bN-12; Thu, 10 Nov 2022 00:42:59 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ot0L3-0002YR-B3
 for qemu-devel@nongnu.org; Thu, 10 Nov 2022 00:42:57 -0500
Received: from mail-pl1-x632.google.com ([2607:f8b0:4864:20::632])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ot0L0-0004UR-V5
 for qemu-devel@nongnu.org; Thu, 10 Nov 2022 00:42:57 -0500
Received: by mail-pl1-x632.google.com with SMTP id c2so614748plz.11
 for <qemu-devel@nongnu.org>; Wed, 09 Nov 2022 21:42:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=WU/OVvNm8oee50IZZfJK+G9QlH4NsN0t/SATCJK44MM=;
 b=W5s0YA4j04Ven6An/GvxxNM3oHDahE5MLJo1snTWBNfdbxwyo0c91Nt801eJotjPZ1
 uUc1JbUp3PTLkNUgAe2x/rNeD+OlmbHJWGrCl1fvtqtGP4UxoOdzGk3FnVDHH88324rS
 GsIRDCjmMpQEJMUm6ZrDRSJC+gwu01V59Mh++FLK1pduFeYZ1WKBJhrDTT8ye5gtqlVf
 enm/KMKhR0xgqQNDw4JtPwr9RsSY6panvTRCYUExvmFF+gQ7lznhfU42Mt4Xrzsy0NjQ
 BYX3x5rdn9TMny0HDLrkVOvjMBJ2q8SDXBqG+KpxaV4dC3ssTI1hw1hWAAal2XBd/uro
 FD7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=WU/OVvNm8oee50IZZfJK+G9QlH4NsN0t/SATCJK44MM=;
 b=ZXx9mr/FdtzHkccmFtslR4iZnGIajPOZSOtnfI8P0DYBryhSEDWADLJnZG/0+8pyDW
 LFOD1hF+OFAYgi3ro4XIIIbNIBGq18lD0EXMmy8eLb/Wa33eEhXuL+peAutxw5v3RjXL
 5xBgeEKZa/yfBOZ6UlS/CM6z80Li3m3snWYpVC2v602yzY7cBZ45b4rYmZKlJIJqIvno
 ykF/YEZ46pHneTKem8wppubNKMM3PXtfAK+6LWRrb+/rg3el72HhjW+nctquuQLDHSQR
 YPL4F7ujou/rNz8LNHingOlltQXCtT4kiItqOowMf7bFtWRImbuwSZ9vH44V/KRKN+0p
 8Dkw==
X-Gm-Message-State: ACrzQf1lLlZl8cfCiGkVIQXh2jqC7NZkwxOBHOcXgr1DpKSZSlkCjCi5
 xslYx1GS54zHKDFRpSankSGygA==
X-Google-Smtp-Source: AMsMyM6/yKOSUZybyuWgM1v3rh6O3CIZF2IhdVWoBQuhMFH/h8abs3J1+n9Qb+CPj4VZ47iIFzi6vw==
X-Received: by 2002:a17:902:e54a:b0:186:a3ba:232a with SMTP id
 n10-20020a170902e54a00b00186a3ba232amr63336064plf.77.1668058973551; 
 Wed, 09 Nov 2022 21:42:53 -0800 (PST)
Received: from ?IPV6:2001:44b8:2176:c800:cc47:10aa:3fa4:e6ca?
 (2001-44b8-2176-c800-cc47-10aa-3fa4-e6ca.static.ipv6.internode.on.net.
 [2001:44b8:2176:c800:cc47:10aa:3fa4:e6ca])
 by smtp.gmail.com with ESMTPSA id
 t13-20020a170902e84d00b0017849a2b56asm10251168plg.46.2022.11.09.21.42.51
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 09 Nov 2022 21:42:52 -0800 (PST)
Message-ID: <6ba6d08c-2538-a32d-cc12-23b456f70514@linaro.org>
Date: Thu, 10 Nov 2022 16:42:48 +1100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.2
Subject: Re: [PATCH for-8.0 5/9] hw/intc: Convert TYPE_ARM_GICV3_COMMON to
 3-phase reset
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20221109161444.3397405-1-peter.maydell@linaro.org>
 <20221109161444.3397405-6-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20221109161444.3397405-6-peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::632;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x632.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
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

On 11/10/22 03:14, Peter Maydell wrote:
> Convert the TYPE_ARM_GICV3_COMMON parent class to 3-phase reset.
> 
> Signed-off-by: Peter Maydell<peter.maydell@linaro.org>
> ---
>   hw/intc/arm_gicv3_common.c | 7 ++++---
>   1 file changed, 4 insertions(+), 3 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

