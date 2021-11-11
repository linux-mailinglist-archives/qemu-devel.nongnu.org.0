Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 418DC44D5C1
	for <lists+qemu-devel@lfdr.de>; Thu, 11 Nov 2021 12:23:40 +0100 (CET)
Received: from localhost ([::1]:36040 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ml8B9-0005NQ-3L
	for lists+qemu-devel@lfdr.de; Thu, 11 Nov 2021 06:23:39 -0500
Received: from eggs.gnu.org ([209.51.188.92]:56572)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ml89e-0003sA-NX
 for qemu-devel@nongnu.org; Thu, 11 Nov 2021 06:22:06 -0500
Received: from [2a00:1450:4864:20::333] (port=40903
 helo=mail-wm1-x333.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ml89a-0004DU-Jd
 for qemu-devel@nongnu.org; Thu, 11 Nov 2021 06:22:05 -0500
Received: by mail-wm1-x333.google.com with SMTP id
 az33-20020a05600c602100b00333472fef04so6234670wmb.5
 for <qemu-devel@nongnu.org>; Thu, 11 Nov 2021 03:22:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=hvkKwz5PejTRCPwJ8yb5WvmQrjXes9k/z2Zzq4nho2I=;
 b=jQLLV9ku4BDg1Pal9Ws0f0Ilxn0+A/46G3QVEZzG2ZOreGfmsgAds7yCUtLz54Bjfy
 FsfPZ8WM0eYf2JKiRu4oMS3AmBX8aoFHINN7JhMEa63BCuicFH+jvFlL0EQuathXSGsE
 C58d7yZBD9LQH4nIX61FE55WUF86zIxo1ocdM0/4nEgjGf7Fp8S1wy+hPB7Z+ze4Ll6U
 32O2i7Ig1357oT+IU0iOdSmPxvqq4I7t+pm/KAEIH+6dwgkir74SRIV//ZDwgx/P7Gpt
 HEmbdfWpcxtIX3O0lFWRiCg8USxGH+7GSmDKBtIcpZ9JfyQECmVSxPbs0BpneC1TWDCA
 H2Aw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=hvkKwz5PejTRCPwJ8yb5WvmQrjXes9k/z2Zzq4nho2I=;
 b=FcQZ8msxLMTd15sd/GKIqqd+lJWVcb6rsqyP+b6DO+jA/B1/EC/0JYh9XoPCKz/u92
 /OX3sQ7Y3Gp1FYbWUoKzFX/1H4whDakNO0BavunchbsdnxosaRhCHqHPOsExtTqQAbNs
 +rLjqosvzwuiNZmc0jxdY2fPJ7/8sG9+diXozixRlfWSxR7+YELjodf+ZYIiP586fwZA
 lohNeDyi5YXe9cGXqnqRFOV+ahdFnnLSsl4whrxjhWdz8eV3+EI/KpMcHd4qjjGPxG0+
 hLO6rwYJkD/DUcR0xL7mAcaZaqdHawK7uFV9HyAB8v6MWUepfcZvZlWNwWp1RrbxJ8qo
 wbwA==
X-Gm-Message-State: AOAM530CZHqfB7B8ePBiDqb6431vxVqsQvFhix8l1f8L7Pc4BvEpRSoy
 VGuPafELQdqn7hYzZfNwnXOmYA==
X-Google-Smtp-Source: ABdhPJwhK2LujHpDP4qyMJMsITjSs852P52hfjmYXeMME6/2wlHBMny59dvriEW9iV83l1EqrBZ8Kg==
X-Received: by 2002:a05:600c:1e27:: with SMTP id
 ay39mr14245620wmb.84.1636629720861; 
 Thu, 11 Nov 2021 03:22:00 -0800 (PST)
Received: from [192.168.8.106] (10.red-95-125-227.dynamicip.rima-tde.net.
 [95.125.227.10])
 by smtp.gmail.com with ESMTPSA id l2sm8434367wmi.1.2021.11.11.03.21.59
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 11 Nov 2021 03:22:00 -0800 (PST)
Subject: Re: [PATCH v3 07/20] target/riscv: Adjust csr write mask with XLEN
To: LIU Zhiwei <zhiwei_liu@c-sky.com>, qemu-devel@nongnu.org,
 qemu-riscv@nongnu.org
References: <20211111055800.42672-1-zhiwei_liu@c-sky.com>
 <20211111055800.42672-8-zhiwei_liu@c-sky.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <0a901c8e-28b6-1390-f0f1-89b5d4949a33@linaro.org>
Date: Thu, 11 Nov 2021 12:21:57 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20211111055800.42672-8-zhiwei_liu@c-sky.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::333
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::333;
 envelope-from=richard.henderson@linaro.org; helo=mail-wm1-x333.google.com
X-Spam_score_int: -52
X-Spam_score: -5.3
X-Spam_bar: -----
X-Spam_report: (-5.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-3.999,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: palmer@dabbelt.com, bin.meng@windriver.com, Alistair.Francis@wdc.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 11/11/21 6:57 AM, LIU Zhiwei wrote:
> Write mask is representing the bits we care about.
> 
> Signed-off-by: LIU Zhiwei<zhiwei_liu@c-sky.com>
> ---
>   target/riscv/insn_trans/trans_rvi.c.inc | 4 ++--
>   target/riscv/op_helper.c                | 3 ++-
>   2 files changed, 4 insertions(+), 3 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

