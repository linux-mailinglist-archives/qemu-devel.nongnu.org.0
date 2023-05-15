Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5AB997025B5
	for <lists+qemu-devel@lfdr.de>; Mon, 15 May 2023 09:11:11 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pySKm-00027f-O7; Mon, 15 May 2023 03:09:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pySKe-00026m-Kt
 for qemu-devel@nongnu.org; Mon, 15 May 2023 03:09:23 -0400
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pySKd-0000aL-5C
 for qemu-devel@nongnu.org; Mon, 15 May 2023 03:09:20 -0400
Received: by mail-wm1-x329.google.com with SMTP id
 5b1f17b1804b1-3f42b984405so44388045e9.3
 for <qemu-devel@nongnu.org>; Mon, 15 May 2023 00:09:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1684134554; x=1686726554;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=3TiKq1J8IY0O1HXOuweIKO2GcSqXLJr9CSOV6xyifKU=;
 b=p4zHuoNQdtjg/Ro515Txj0E5Az8hhdRAQQf68trgMijhenQGsx6o4RvtcKdZUBIDj9
 NbzrkV0YwM2UgdA5ouSPT+b4AtciI+AWVfQ0y1CgOmqJQw9amNqxtccGGbVnvaa+N6Pu
 zRq+ZmOYMr7cja4HIRxKUwMGSLYfni/MJYyEjAo9ihtcYym0Tg/QZ1PjioALmiCQSzPQ
 on9gX/FoR1XTpwCsC66bXwT4X+Dyd49N8jfpeG2Js1JlyniQJ8GaSMAissFqzBf3Qu80
 RJhyj+uql3I3kFeRtQpPuOIS5esgunw4tYSBSyzwIa4ebosxdSScWFCOFc2D7szu4g5v
 tbSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1684134554; x=1686726554;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=3TiKq1J8IY0O1HXOuweIKO2GcSqXLJr9CSOV6xyifKU=;
 b=V0vWW+XQJBr37OfKoJtC6NHvgVYpoZWHnhYQM+F/TNWe0dFcEJcHQ4se/bY7OjGx8R
 dpS1ccoTJujg5nONwHq8ZmCw/sTRO9SpNnB2ULwwjPSdD7P7Y2D3uC/LCdBQ3tpKqMjQ
 TIWafA322Fie52SbhoBI0jvBz2EzH3U3iy41cWv9zsG8HLa7HKWih1znDcytCea2nLr5
 o/bOEudvKma8tPzX3ZANF1eOgWXcj7iGXvmgmK/+KB0ef2rXYXt+oW9y/gkngyqzai83
 4pGfwC1qAVFyhWmwi9P5ye4lDjJTwu0sFZCkvIHDSXL467c6u5FECMgo3esNf/71Lvoh
 EglA==
X-Gm-Message-State: AC+VfDxfy3RP31MsqJ8DBYCql5l5r0yp8vtxoZZXXG0cw0sxmtPFB4Oq
 W82uSVPEqAisO4ohcitq55Zk7A==
X-Google-Smtp-Source: ACHHUZ5o7G5eMstT9Jw7w71rf7cUG5pB8tGEGnA8AFPoXEBwAINV0t4yyAMUq4f1JE/olqW1cYcdkQ==
X-Received: by 2002:a05:600c:2905:b0:3f4:e7c6:989a with SMTP id
 i5-20020a05600c290500b003f4e7c6989amr8599785wmd.32.1684134554025; 
 Mon, 15 May 2023 00:09:14 -0700 (PDT)
Received: from [192.168.30.216] ([81.0.6.76]) by smtp.gmail.com with ESMTPSA id
 l19-20020a1c7913000000b003f42ceb3bf4sm17443413wme.32.2023.05.15.00.09.13
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 15 May 2023 00:09:13 -0700 (PDT)
Message-ID: <75a51254-55fa-4030-baf5-234bad51d97c@linaro.org>
Date: Mon, 15 May 2023 09:09:12 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.10.1
Subject: Re: [PATCH 2/2] hw/arm/vexpress: Avoid trivial memory leak of
 'flashalias'
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20230512170223.3801643-1-peter.maydell@linaro.org>
 <20230512170223.3801643-3-peter.maydell@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230512170223.3801643-3-peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::329;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x329.google.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.93,
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

On 12/5/23 19:02, Peter Maydell wrote:
> In the vexpress board code, we allocate a new MemoryRegion at the top
> of vexpress_common_init() but only set it up and use it inside the
> "if (map[VE_NORFLASHALIAS] != -1)" conditional, so we leak it if not.
> This isn't a very interesting leak as it's a tiny amount of memory
> once at startup, but it's easy to fix.
> 
> We could silence Coverity simply by moving the g_new() into the
> if() block, but this use of g_new(MemoryRegion, 1) is a legacy from
> when this board model was originally written; we wouldn't do that
> if we wrote it today. The MemoryRegions are conceptually a part of
> the board and must not go away until the whole board is done with
> (at the end of the simulation), so they belong in its state struct.
> 
> This machine already has a VexpressMachineState struct that extends
> MachineState, so statically put the MemoryRegions in there instead of
> dynamically allocating them separately at runtime.
> 
> Spotted by Coverity (CID 1509083).
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>   hw/arm/vexpress.c | 40 ++++++++++++++++++++--------------------
>   1 file changed, 20 insertions(+), 20 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>


