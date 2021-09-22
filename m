Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 93239415041
	for <lists+qemu-devel@lfdr.de>; Wed, 22 Sep 2021 20:56:55 +0200 (CEST)
Received: from localhost ([::1]:59412 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mT7QM-0003yA-DS
	for lists+qemu-devel@lfdr.de; Wed, 22 Sep 2021 14:56:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46970)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mT6tv-0000Wc-1h
 for qemu-devel@nongnu.org; Wed, 22 Sep 2021 14:23:24 -0400
Received: from mail-pg1-x52f.google.com ([2607:f8b0:4864:20::52f]:39508)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mT6ts-0001Ui-0i
 for qemu-devel@nongnu.org; Wed, 22 Sep 2021 14:23:22 -0400
Received: by mail-pg1-x52f.google.com with SMTP id g184so3612971pgc.6
 for <qemu-devel@nongnu.org>; Wed, 22 Sep 2021 11:23:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=tj1hQSwEOY5uZH/EXtGUEvOHfGrCyiLLqMg/YBdgdMk=;
 b=aI3NHrOirz9JgpZ65dAyOeGNWD9Z6ZJ9yUvnmzqgPJoRsGkWvB2+1mgzVyTEkyRUM0
 CFqeMti2O8Qw+4RRWUa2dHwDQgWw4NCAM2f8EBWD1Xhpk2ZaxKuZQG78XXJerlVcFPMO
 oBNLgrgHFZmLaDH9ST31PLa/2djyuRf7Z83tZAG7qz87MdqdiRr98b3KDSrB1Mmeaz0v
 tetBkmIb8iWYB/SQ3KfkNaNsW1L7IxpIiwwBpPnNBfxW+Z4lixCVUGBm3JhA+uLSYFe9
 Kg7YMJoUPmMnST02b/LlsuwUjpg28dycGlcuBfI0Iaw3wWpuNi2qqUlPYJFy2JHg5CnS
 aCOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=tj1hQSwEOY5uZH/EXtGUEvOHfGrCyiLLqMg/YBdgdMk=;
 b=ttHHfXbrVpSBvV3SyTwc4Rntp9orhJudpLX04hFTrs6P1yL3QUybqqysjjkCqTUlq/
 LtEaXLIFgGl7TICRIWvB9MTaO6FIPC/xPec4RviHWsGFac5IQ93xh+NhmuFju5KbfTXL
 6/9cXcI+DPscS/ASK5LGwj5/PGPJX+6tn697n9pY1v2uQLI77gzzyTPY59SwjDZIswPb
 EblH3CL60Z5bE6X2hjRDMWqtMUWG9zbDGy9deKwA1TueG4S68tBCVwaQifmJFp0IuEfF
 DDybIEOF/+/aEwn/ILlGvTMm6PF/W/JsKj/vwSc8zvTyyTfBl4T4vPhRxt/zeAojwVzB
 qBtg==
X-Gm-Message-State: AOAM530G/3xeotWX2NYX4MuJFSUKVQV3V7rW7v6V8iWE2VFH11xjIAQH
 2zieyP8Y+FxYMtBpRY9LjhPxcg==
X-Google-Smtp-Source: ABdhPJxvsiCO1z94A+uF9Bt5+BAmTQNiLol0avxVlBEW4vJQQtL1zrgK65HX8Y1PVn+KBgWySMdMqw==
X-Received: by 2002:a63:914a:: with SMTP id l71mr227512pge.463.1632334998395; 
 Wed, 22 Sep 2021 11:23:18 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.134.125])
 by smtp.gmail.com with ESMTPSA id h10sm6262772pjs.51.2021.09.22.11.23.17
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 22 Sep 2021 11:23:18 -0700 (PDT)
Subject: Re: [PATCH v3 14/30] tcg/loongarch64: Implement bswap{16,32,64} ops
To: WANG Xuerui <git@xen0n.name>, qemu-devel@nongnu.org
References: <20210922180927.666273-1-git@xen0n.name>
 <20210922180927.666273-15-git@xen0n.name>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <36a171bc-6061-faa4-fdf7-1548d931dc89@linaro.org>
Date: Wed, 22 Sep 2021 11:23:16 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20210922180927.666273-15-git@xen0n.name>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52f;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x52f.google.com
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 Laurent Vivier <laurent@vivier.eu>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 9/22/21 11:09 AM, WANG Xuerui wrote:
> Signed-off-by: WANG Xuerui<git@xen0n.name>
> ---
>   tcg/loongarch64/tcg-target.c.inc | 32 ++++++++++++++++++++++++++++++++
>   tcg/loongarch64/tcg-target.h     | 10 +++++-----
>   2 files changed, 37 insertions(+), 5 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

