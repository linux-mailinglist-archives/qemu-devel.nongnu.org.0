Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9444567F417
	for <lists+qemu-devel@lfdr.de>; Sat, 28 Jan 2023 03:41:40 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pLb9R-0005fi-Ql; Fri, 27 Jan 2023 21:41:09 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pLb9Q-0005ey-2f
 for qemu-devel@nongnu.org; Fri, 27 Jan 2023 21:41:08 -0500
Received: from mail-pj1-x102a.google.com ([2607:f8b0:4864:20::102a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pLb9O-0007id-Gs
 for qemu-devel@nongnu.org; Fri, 27 Jan 2023 21:41:07 -0500
Received: by mail-pj1-x102a.google.com with SMTP id j5so6328007pjn.5
 for <qemu-devel@nongnu.org>; Fri, 27 Jan 2023 18:41:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=veoTvVsGAJVgCocOO1kisFzJirrmTC42wL1GvxYEfS0=;
 b=eDOwrhyVBTUGIsvyNbPcndCkaELPa2rLosyTfVeDLOfnP7wMeBQbjhXD3lxiFHx75V
 NuvbRiNga89TtsXb1CU4QLdE0aN9U5D3T60RTGuFnXF1m/A1nnCUVeDP6hM3mvJIneEj
 8WZvgreRsKvC7OiLZ/INyyQvtAadxlxRaqJxQCOrpmPdpXNhvRSQcbuQm3i5JZXcwd21
 CJlVP2k4kfm+WkYXApufveyoYfLNfXTLaxEZciE41NmGS7wSO8XAxFBeppMn6MNtnuuY
 6e82XkAus2RboYplBg4hlZ8LAmJBX+SIgEHevxoNhmGSGb14kd6X3/nOW68E32dOugxM
 IWRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=veoTvVsGAJVgCocOO1kisFzJirrmTC42wL1GvxYEfS0=;
 b=Af/FFwKeZXW2FBQkGzxlDW9H7WlOARpaKcqFOQNZINiMtWdpORmQHwe0VQxLPambPE
 5ZsEU/umgqyKYG/QrBOA9TvAkB86r6a58OlPUJRjJJov8SsJhe0ymCAGnGh8zY+oeVaV
 wir2Vnk7GfZtLRvUN+rTCLdrCTVkb72QisxZcDhGtD8eyCdXhGOSlWrWpMHNX6xAx8QQ
 7U82xojvzZZKwiNnT9x+RX0qR5hQUc0ox9xk8dybOJx+BpnDbRMV9W1/mdM4LYpREb2D
 uH/CeGzWh5GjdEcCrY+7gSVI5LVj83m6bGe006kTYVDMaCk12D3C/VBUB+SAh73FEaUc
 IBbw==
X-Gm-Message-State: AO0yUKVqMXc21WiHc1jUKhGR/HxdDgpWdI6hXgaWxFO+Df/NVixUiYtj
 6dynRETlLrpoq8lrKwpE51O6/QEkzPyjKyHX
X-Google-Smtp-Source: AK7set9AgJ3LdvxgfkPghVgWmSbGE3KSVcmotzJBVXUqxpzW7Nwx/nMrn+o+9pzPA9y/2fU4RO2wZw==
X-Received: by 2002:a17:903:2093:b0:192:ef8e:4258 with SMTP id
 d19-20020a170903209300b00192ef8e4258mr397384plc.14.1674873664954; 
 Fri, 27 Jan 2023 18:41:04 -0800 (PST)
Received: from [192.168.50.174] (rrcs-173-197-98-118.west.biz.rr.com.
 [173.197.98.118]) by smtp.gmail.com with ESMTPSA id
 l4-20020a170902ec0400b001928c204428sm3519399pld.142.2023.01.27.18.41.03
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 27 Jan 2023 18:41:04 -0800 (PST)
Message-ID: <c46fa0fb-4117-568d-30ec-c0276c348a56@linaro.org>
Date: Fri, 27 Jan 2023 16:41:00 -1000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH 11/23] target/arm: Mark up sysregs for HFGRTR bits 12..23
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20230127175507.2895013-1-peter.maydell@linaro.org>
 <20230127175507.2895013-12-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20230127175507.2895013-12-peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102a;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102a.google.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.148,
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

On 1/27/23 07:54, Peter Maydell wrote:
> Mark up the sysreg definitions for the registers trapped
> by HFGRTR/HFGWTR bits 12..23.
> 
> Signed-off-by: Peter Maydell<peter.maydell@linaro.org>
> ---
>   target/arm/cpregs.h | 12 ++++++++++++
>   target/arm/helper.c | 12 ++++++++++++
>   2 files changed, 24 insertions(+)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~

