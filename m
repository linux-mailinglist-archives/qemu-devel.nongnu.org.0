Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CC5695B6942
	for <lists+qemu-devel@lfdr.de>; Tue, 13 Sep 2022 10:13:21 +0200 (CEST)
Received: from localhost ([::1]:50832 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oY12m-0007vM-PJ
	for lists+qemu-devel@lfdr.de; Tue, 13 Sep 2022 04:13:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57124)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oY0vA-0003Kb-MH
 for qemu-devel@nongnu.org; Tue, 13 Sep 2022 04:05:36 -0400
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f]:53891)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oY0v8-0000GY-1T
 for qemu-devel@nongnu.org; Tue, 13 Sep 2022 04:05:27 -0400
Received: by mail-wm1-x32f.google.com with SMTP id e18so2715407wmq.3
 for <qemu-devel@nongnu.org>; Tue, 13 Sep 2022 01:05:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date;
 bh=BLW+P3vLpbPzmJgxVpMiF/Iyl6sDujOSockIGi5HjyY=;
 b=aQR0zEiTwDCCkudW2yMoD3AvQwR1S/WrHWnAhZXQaDv+CoJxa8obur2ucmmjLQuQw9
 JLU1RWbGPAIlZFvOM1t8V1HeJjPSkcoKr8OhDmbw66+9RsSsuPRrxwNAxzCuFgDtV++H
 tmA7X7Tt7aL9OjyfgVznPlXAbIfYiPiKonmborXjyzQb+ZKSrguRghP5mG+7sG/BoCPx
 iiptNuhawvScvBfA7rjLNXXFVZDmEFAW/jZQsivyuPoUlPdxrWcqkqVxgcbdb3HkU1oG
 SuvaYLgCWyMOmWNOzBGjAi8p4TiWDvdal+MV4PTQBcqc/U4KCJ96F/CIKGvXnMHkVNiV
 pLdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date;
 bh=BLW+P3vLpbPzmJgxVpMiF/Iyl6sDujOSockIGi5HjyY=;
 b=1xePKuykVqMaqiVofUxv1Uq+EAUXOAo1qQYbcKd+w9ms9KSrrdHfPMyhaGJgSI4V0n
 G7xliBTIgFfVpJLYp42q92eV5UtkT3qbC+4rdCe8x2W5PVMeG1ulogKFmD5/jZhjqGgw
 7CncAp7+CfpTv9/ZIrDAQRq7kerQuD0NjZM4F20FXzRnF+/5TbtK5n8FQrLdD2niWf8S
 BBCvZ9UM3adsVWYXU5XV8ShYaK3mSwErnYLLh1vcDJn4+8MqZvSQopPKCxN5A6lvcH01
 h7LhjjefZTM9QbBzBFkXWUrTJeDR+XDeGONWvq2kE2aBxXqcdDFxSylvV8UFP8GnAMCM
 q5Jw==
X-Gm-Message-State: ACgBeo3x8Dm9ya2o2MUBdNhTat1bK4w9E5h+BrPbqevSgzoJf5//06V+
 PS3A3SLS9039zleTA7Wor//ZzA==
X-Google-Smtp-Source: AA6agR5kIaJdhmQyUv4brP23bkMlOunlbnSg+345sUi1KfT2rPhz/Pi+W+Pg+Nvywm2gHgwt2XzwIQ==
X-Received: by 2002:a05:600c:1c84:b0:3b3:ef37:afd3 with SMTP id
 k4-20020a05600c1c8400b003b3ef37afd3mr1371324wms.155.1663056321624; 
 Tue, 13 Sep 2022 01:05:21 -0700 (PDT)
Received: from [10.119.17.153] ([89.101.193.67])
 by smtp.gmail.com with ESMTPSA id
 u2-20020a056000038200b0022a2ca8b284sm11310096wrf.99.2022.09.13.01.05.20
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 13 Sep 2022 01:05:21 -0700 (PDT)
Message-ID: <0f79885a-a5f3-313b-16c4-3c4f38edbaca@linaro.org>
Date: Tue, 13 Sep 2022 09:05:19 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v3 17/24] disas/nanomips: Remove CPR function
Content-Language: en-US
To: Milica Lazarevic <milica.lazarevic@syrmia.com>, thuth@redhat.com
Cc: qemu-devel@nongnu.org, cfontana@suse.de, berrange@redhat.com,
 pbonzini@redhat.com, vince.delvecchio@mediatek.com,
 peter.maydell@linaro.org, djordje.todorovic@syrmia.com, mips32r2@gmail.com,
 dragan.mladjenovic@syrmia.com
References: <20220912122635.74032-1-milica.lazarevic@syrmia.com>
 <20220912122635.74032-18-milica.lazarevic@syrmia.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220912122635.74032-18-milica.lazarevic@syrmia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32f;
 envelope-from=richard.henderson@linaro.org; helo=mail-wm1-x32f.google.com
X-Spam_score_int: -42
X-Spam_score: -4.3
X-Spam_bar: ----
X-Spam_report: (-4.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-2.153,
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

On 9/12/22 13:26, Milica Lazarevic wrote:
> CPR functions has been removed.
> 
> Before this patch, we'd been calling img_format twice, the first time
> through the CPR function to get an appropriate string and the second
> time to print that formatted string. There's no more need for that.
> Therefore, calls to CPR are removed, and now we're directly printing
> "CP" and integer value instead.
> 
> Signed-off-by: Milica Lazarevic<milica.lazarevic@syrmia.com>
> ---
>   disas/nanomips.cpp | 110 +++++++++++++++++++--------------------------
>   1 file changed, 45 insertions(+), 65 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

