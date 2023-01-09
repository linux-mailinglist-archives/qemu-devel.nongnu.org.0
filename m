Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 56835662C4D
	for <lists+qemu-devel@lfdr.de>; Mon,  9 Jan 2023 18:11:02 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pEvfd-0003lR-1D; Mon, 09 Jan 2023 12:10:49 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pEvfV-0003fJ-Pp
 for qemu-devel@nongnu.org; Mon, 09 Jan 2023 12:10:42 -0500
Received: from mail-pj1-x1035.google.com ([2607:f8b0:4864:20::1035])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pEvfU-00026r-90
 for qemu-devel@nongnu.org; Mon, 09 Jan 2023 12:10:41 -0500
Received: by mail-pj1-x1035.google.com with SMTP id
 fz16-20020a17090b025000b002269d6c2d83so11736221pjb.0
 for <qemu-devel@nongnu.org>; Mon, 09 Jan 2023 09:10:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=AIOT4fQm88bY3nukiIoBLVundet+q8eP5txDbQng3o0=;
 b=PlBkNFG6T+NyblSKwcXi+hrcEwtD+4Er6Mhc1V9qmezvA+VCXAYdg/zsQrjzksHc+a
 FPqEYO0gDuh6VFRSc4HbjecHvROVtN4Y2nEuv1883e89erZd1WuykifCeKqTnVg60d3D
 AzwW5rA/nnj3IlTIuR3dRI7LdCbp3MO/PL2cGaB4673wwmdU6sOn7+Re473dpEkazWv1
 8SfomeHjr3ww5LJ5mVnXKGSppu2Z1XXGn75UW+U2qqWuIG5YQlt465iFj7tQldP887A/
 hhD/c9RuFyUCocqezKtTu2LjpDqngzMkmQtpXc5SvGbhyemGTJPnFF70FbJuGRfkfVfG
 nYZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=AIOT4fQm88bY3nukiIoBLVundet+q8eP5txDbQng3o0=;
 b=ixDtu51ai47Zzr7G/uQ01GOuEkDr/EFkMd9Y1yiy2yAqFSOKBRz6tNvwzuTOq/WBrB
 x4k7dpR+KmAqU4VjfheMILlXYE/juMfkVGBwM/LPVU5NZm3RWf78VxsVKRTGrTo4VJGt
 1sicJtAcltc+LkFOXUAKYer1PDFTXLmMaxu+zYD1JHUq6gl1s5pWgXBWXfgw8/zRxmrU
 F9EM4QwDfPT6KJyOG0S4N71YRwqPrwGnxcogDdUK3siuSYKxroM6KdpMeD8G51iuFGff
 dNInhB6F3NmjESAdurhICm7xHBt2d25zT2wiPGn5U3ia447MsKOjxoEzoRIiyef3T4L5
 5sGA==
X-Gm-Message-State: AFqh2krQ/HpSxxAIrIBsEAS+V7ARYR3dfF9DvleJtwC40mPnDQg701RV
 YpZ6Hw3dh+K3VBhhITjfqEXd5A==
X-Google-Smtp-Source: AMrXdXvly6A3pBO+w/JY0U5MdxyNY7Wdhw/AeHwnxDndkQj/CiIL/2WeN5NbOGLfmAIP1SfDapdu5Q==
X-Received: by 2002:a17:90a:db8a:b0:226:632c:abbd with SMTP id
 h10-20020a17090adb8a00b00226632cabbdmr29168813pjv.47.1673284239016; 
 Mon, 09 Jan 2023 09:10:39 -0800 (PST)
Received: from ?IPV6:2602:47:d48c:8101:a909:891c:953d:a6b0?
 ([2602:47:d48c:8101:a909:891c:953d:a6b0])
 by smtp.gmail.com with ESMTPSA id
 s88-20020a17090a69e100b002262ab43327sm4391918pjj.26.2023.01.09.09.10.38
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 09 Jan 2023 09:10:38 -0800 (PST)
Message-ID: <2014fe15-2dba-5afc-4c06-5436caf53ca6@linaro.org>
Date: Mon, 9 Jan 2023 09:10:36 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH 3/5] hw/i2c/versatile_i2c: Replace TYPE_VERSATILE_I2C ->
 TYPE_ARM_SBCON_I2C
Content-Language: en-US
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org
References: <20230109091754.79499-1-philmd@linaro.org>
 <20230109091754.79499-4-philmd@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20230109091754.79499-4-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1035;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1035.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
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

On 1/9/23 01:17, Philippe Mathieu-Daudé wrote:
> Signed-off-by: Philippe Mathieu-Daudé<philmd@linaro.org>
> ---
>   hw/arm/realview.c              | 2 +-
>   hw/arm/versatilepb.c           | 2 +-
>   hw/arm/vexpress.c              | 2 +-
>   hw/i2c/versatile_i2c.c         | 4 ++--
>   include/hw/i2c/arm_sbcon_i2c.h | 3 +--
>   5 files changed, 6 insertions(+), 7 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

