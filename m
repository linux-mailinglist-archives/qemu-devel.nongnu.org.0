Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C29604A3A9B
	for <lists+qemu-devel@lfdr.de>; Sun, 30 Jan 2022 22:49:28 +0100 (CET)
Received: from localhost ([::1]:58714 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nEI4d-0005PJ-Bl
	for lists+qemu-devel@lfdr.de; Sun, 30 Jan 2022 16:49:27 -0500
Received: from eggs.gnu.org ([209.51.188.92]:37850)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nEI2Q-0004Je-92
 for qemu-devel@nongnu.org; Sun, 30 Jan 2022 16:47:10 -0500
Received: from [2607:f8b0:4864:20::629] (port=34376
 helo=mail-pl1-x629.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nEI2M-0003og-PQ
 for qemu-devel@nongnu.org; Sun, 30 Jan 2022 16:47:08 -0500
Received: by mail-pl1-x629.google.com with SMTP id h14so10903568plf.1
 for <qemu-devel@nongnu.org>; Sun, 30 Jan 2022 13:47:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=cFIfH2SebrFQpNfxAFA0OSGr3eM+KF5EZu0Z5a4Lnv0=;
 b=dYQKqS5rD9TW9JpogT6w+dUCYazYurh3pp3/JHczxlr+UnBDbYgH+DpRhFbEKrExS1
 cN9Yc9D3fLKO5p62C8TgxvHpYyuRHwRF5iqHL477lfsk3FUnsAxmNM/XH1rqOgkWDIOe
 GetErCQGP/BR2HbNDhdEMBKqqBd8nk+sAWsZsyk5vY1J+Q5x3FxmBaSNOPGfarlAhhbE
 oVvDQ//zKQirJuxThu+2FtytrQRVfvNUVLf3bOK5OX8erTF2p0JwgKOcGhbhQSp5dvou
 GGfYyhSB3gpK2hr451mlkNlJQf7sT9QpIsIMHrIV+zwYF1iqq2+SvCt6wjgG9LSWUGew
 2E5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=cFIfH2SebrFQpNfxAFA0OSGr3eM+KF5EZu0Z5a4Lnv0=;
 b=a1OMzSXdPn3mionm7/G+lKl8iVEn2dbZNS77DSHNsxw5dCMdzLqFg9gP7O6UgG1rQ7
 XkJqu2vfqxbm/WIGZ4DDrahl3dAp370xok9XG7Gz/OqaZpr601+ZjpHgKcxfIs4lXh2y
 Rm/cYgJykdvaZx4h5fXJstAl1ONMA1DC4Fe6asLbUlzguA0lLeua/jTZ3HATpOfP2Ak+
 aPymCixdFO9TCUSw8hNNrSE9MwzCnWCIChYGgjMY0Eyl5kYF8eMCtvhrbFPL3y3fgXJr
 liewJq3EedBeeBsl3kEPZjtPhiNiQrnaDYZwPW6q33XPrZj8teYlVuabITyMvcRh3iOM
 vF7A==
X-Gm-Message-State: AOAM533HzJZkjm3kqxeVHaWxl9LIehcvc1lKRZyisJTxvG8Q3uHw9Uw4
 +2oxgpYflHXShpIsaIWAVhPweg==
X-Google-Smtp-Source: ABdhPJyUFlIY5jEwdH9Q6yt6RS7+iA2Xol31nfUcc8jJv9MNJfnVnqil/RafKQAhmlG97cTb7UFSWw==
X-Received: by 2002:a17:902:bf02:: with SMTP id
 bi2mr18228621plb.139.1643579224629; 
 Sun, 30 Jan 2022 13:47:04 -0800 (PST)
Received: from [192.168.2.37] (240.194.168.125.sta.wbroadband.net.au.
 [125.168.194.240])
 by smtp.gmail.com with ESMTPSA id f5sm3301831pfc.0.2022.01.30.13.46.56
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 30 Jan 2022 13:47:03 -0800 (PST)
Message-ID: <06d70a45-9aeb-9815-5613-6dd67404860b@linaro.org>
Date: Mon, 31 Jan 2022 08:46:52 +1100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH 02/16] cpu.c: Make start-powered-off settable after realize
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20220127154639.2090164-1-peter.maydell@linaro.org>
 <20220127154639.2090164-3-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220127154639.2090164-3-peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::629
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::629;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x629.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: Eduardo Habkost <eduardo@habkost.net>, Rob Herring <robh@kernel.org>,
 Andrew Jeffery <andrew@aj.id.au>, Andre Przywara <andre.przywara@arm.com>,
 Alistair Francis <alistair@alistair23.me>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 Jean-Christophe Dubois <jcd@tribudubois.net>,
 Beniamino Galvani <b.galvani@gmail.com>, Tyrone Ting <kfting@nuvoton.com>,
 Niek Linnenbank <nieklinnenbank@gmail.com>, Alexander Graf <agraf@csgraf.de>,
 Igor Mitsyanko <i.mitsyanko@gmail.com>,
 =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>,
 Havard Skinnemoen <hskinnemoen@google.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Yanan Wang <wangyanan55@huawei.com>, Andrey Smirnov <andrew.smirnov@gmail.com>,
 Joel Stanley <joel@jms.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 1/28/22 02:46, Peter Maydell wrote:
> The CPU object's start-powered-off property is currently only
> settable before the CPU object is realized.  For arm machines this is
> awkward, because we would like to decide whether the CPU should be
> powered-off based on how we are booting the guest code, which is
> something done in the machine model code and in common code called by
> the machine model, which runs much later and in completely different
> parts of the codebase from the SoC object code that is responsible
> for creating and realizing the CPU objects.
> 
> Allow start-powered-off to be set after realize.  Since this isn't
> something that's supported by the DEFINE_PROP_* macros, we have to
> switch the property definition to use the
> object_class_property_add_bool() function.
> 
> Note that it doesn't conceptually make sense to change the setting of
> the property after the machine has been completely initialized,
> beacuse this would mean that the behaviour of the machine when first
> started would differ from its behaviour when the system is
> subsequently reset.  (It would also require the underlying state to
> be migrated, which we don't do.)
> 
> Signed-off-by: Peter Maydell<peter.maydell@linaro.org>
> ---
>   cpu.c | 22 +++++++++++++++++++++-
>   1 file changed, 21 insertions(+), 1 deletion(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

