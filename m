Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 13FC93BE08A
	for <lists+qemu-devel@lfdr.de>; Wed,  7 Jul 2021 03:21:06 +0200 (CEST)
Received: from localhost ([::1]:57476 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m0wFM-00074Y-KM
	for lists+qemu-devel@lfdr.de; Tue, 06 Jul 2021 21:21:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39818)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m0wDr-0005Vb-QE
 for qemu-devel@nongnu.org; Tue, 06 Jul 2021 21:19:31 -0400
Received: from mail-pl1-x62a.google.com ([2607:f8b0:4864:20::62a]:44956)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m0wDq-0004s1-8c
 for qemu-devel@nongnu.org; Tue, 06 Jul 2021 21:19:31 -0400
Received: by mail-pl1-x62a.google.com with SMTP id a6so139409plh.11
 for <qemu-devel@nongnu.org>; Tue, 06 Jul 2021 18:19:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=opj+ng4w4Yim+hYbb1T85HQ0PUvAfkPdcQBveX+/6Fw=;
 b=tEI6QoJVb06Abd7dXKSuWLfBfM2UCBe5FszpchG6FXuakNExuK5CpPgW3drEUBLxpw
 nglmFvTuaYXhKt4ZVXMOArsTH4Ufz+J8jHiwrPDOFbV/KBll8kBDDMaDGsGBQH48v/N8
 bBoRzWc3inlkghiCJO/DGEhpKyVFeTmHHrdb/PxY09VrUh5SK8lHGP6YFVPmChnIfGIV
 q4I86XTp0C0CwFRzwLX01kBgUXhWNqO15eB0ANxh7oreRUhM2c8X2EM4/4ONVAXzOvhm
 2bFk4kCGJZceK4+2lViMOUMV8ZcLU8KyeHMFHtvUNNpgzOPZqNPVkNqa90JJEtdt0kOs
 CPSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=opj+ng4w4Yim+hYbb1T85HQ0PUvAfkPdcQBveX+/6Fw=;
 b=KQTkMVqGbOTvP60/itBEMghL82d8vrKyHaPUgjCwPHUGBpU+ttdb+s8PtNNP541cRy
 8aKyLP7zu3oii7oI2JgA46vu0AsMCufJmwjkij2YPhHFYdm4+BZawvhFxIpqnD1jDxgC
 4I6nnzS0wLx1OM+YFNJ5VMh4944cfbdeHqqGYD1KTQwURsPryA1gm08vAcqgiKpN+pAK
 i94FUyPo8i3aLlHtP5BHRBaw/LIiY+AR+wIuV8o1JspWjeNLCryMb4+8rZQxkYTydaYW
 wKG8NVeHPkufqVPRtZ8nobcM8FScmp3HOKKBJu0ga2Vwfimc0cUsshph1J3Q/Gmeu0Ab
 dJAw==
X-Gm-Message-State: AOAM532Amu2Q60xpYxII9iByCcUNO3s84hHJcW/EBOhokWCDmDeHzi/M
 LJ3qc2EXwqRChVMX6LeINWn+Zw==
X-Google-Smtp-Source: ABdhPJwIidLYdRezBrNbFCRNA0CP9G34TfdaWFIHUmp6+Lw7mewM6qDFFnvPC5z6UjhSE79fYEAjQA==
X-Received: by 2002:a17:902:9a8c:b029:113:d891:2eaf with SMTP id
 w12-20020a1709029a8cb0290113d8912eafmr19071586plp.61.1625620768521; 
 Tue, 06 Jul 2021 18:19:28 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.149.176])
 by smtp.gmail.com with ESMTPSA id y1sm20501482pgr.70.2021.07.06.18.19.28
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 06 Jul 2021 18:19:28 -0700 (PDT)
Subject: Re: [PATCH 02/11] hw/gpio/pl061: Convert DPRINTF to tracepoints
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20210702104018.19881-1-peter.maydell@linaro.org>
 <20210702104018.19881-3-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <783b1b33-fe92-c35b-897b-937b5ef714bf@linaro.org>
Date: Tue, 6 Jul 2021 18:19:26 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210702104018.19881-3-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62a;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Maxim Uvarov <maxim.uvarov@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 7/2/21 3:40 AM, Peter Maydell wrote:
> Convert the use of the DPRINTF debug macro in the PL061 model to
> use tracepoints.
> 
> Signed-off-by: Peter Maydell<peter.maydell@linaro.org>
> ---
>   hw/gpio/pl061.c      | 27 +++++++++------------------
>   hw/gpio/trace-events |  6 ++++++
>   2 files changed, 15 insertions(+), 18 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

