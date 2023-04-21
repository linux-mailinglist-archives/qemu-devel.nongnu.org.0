Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 11CC56EB475
	for <lists+qemu-devel@lfdr.de>; Sat, 22 Apr 2023 00:12:17 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ppyyP-0007Nr-SY; Fri, 21 Apr 2023 18:11:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1ppyyN-0007Mg-Qe
 for qemu-devel@nongnu.org; Fri, 21 Apr 2023 18:11:19 -0400
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1ppyyL-0001qA-7R
 for qemu-devel@nongnu.org; Fri, 21 Apr 2023 18:11:19 -0400
Received: by mail-wr1-x430.google.com with SMTP id
 ffacd0b85a97d-2febac9cacdso1381673f8f.1
 for <qemu-devel@nongnu.org>; Fri, 21 Apr 2023 15:11:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1682115075; x=1684707075;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=+54Bo7jCCAHW4aZ3qLnEV1hE6b/zaJjg8XM25Mmt6ko=;
 b=hHWlTyvQ1TVtktYCEtpreo8O0z8m+GFndI8VXI3yuJOI5IEjpUpfi+HPSY6d89rG5r
 riH6tl/XCvDsrMgtXyWTm/8maO/CW7O9b37bMENLmGivleXnsEQ/8QQ2Xja7JNPopqve
 aJ8qDW5sAKeKE6qqNf5qwPg0da1A5FgOH8xR8iyLEeUPSxbjcjOY9oDsX1v/BEz1PEFO
 CTYCi+cgvsBVg8LcfRdTqFjmlDEHDUF2N9qOVgUOOxzlG+MCrN6Qy7CvY+NXqzWpgOmf
 dTjbeTNpZ4/1y+QNbXPeMFh/7oHR/dwRZN8hqEJP42wZTj31P0wyNHskZp3DU47n3B0b
 eh1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682115075; x=1684707075;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=+54Bo7jCCAHW4aZ3qLnEV1hE6b/zaJjg8XM25Mmt6ko=;
 b=b5O61boTZ7ZUz6iI+wMfu7PZh+luNHCMen0CZaODsTWWBotV8Lij9lOkC+LG29g7OR
 ZyaknzdllpdcpnnPZs/GZ5qk+D8EnCD5Zipxg8UJz/Kiz16aPh1zaFVkauPd8NHl10hs
 lWfpR4NOtxwBh2L32i4XhvnHmggioBXDSAjP4xjeM9TlFv57SXVNwcspdszYHkeAupUw
 5z4zlXoI4nd95GqVnzS18/Cn88p7P0Kfe9QqyIAFKUt5Ra7yASqCCizGRQbXfSUIe1+c
 6pT9dbOlPhnyuBOitUs+9nnoR0Ernci9Nt1IcGGK4+3/3vFCCi5KPCRu3DUN0JEU/Dy9
 MJ/Q==
X-Gm-Message-State: AAQBX9cxjwgsXr14/6eDHF6PUHdY41AQQ7ktJbnJY4t97ej+6LuqpvzE
 IPFQIGRMb6AiK4r6zcHCIrDxNw==
X-Google-Smtp-Source: AKy350YsseborVKL7EkHcw6T8WoI3tk5aq1yVweVGWW/DRiwnk5zWR0/ycYMASyMIhVgsrf1e1jnOg==
X-Received: by 2002:adf:fe49:0:b0:2fa:631a:9f38 with SMTP id
 m9-20020adffe49000000b002fa631a9f38mr5063058wrs.2.1682115075267; 
 Fri, 21 Apr 2023 15:11:15 -0700 (PDT)
Received: from [192.168.69.115] (uni14-h01-176-184-39-152.dsl.sta.abo.bbox.fr.
 [176.184.39.152]) by smtp.gmail.com with ESMTPSA id
 z14-20020a5d4d0e000000b002efb4f2d240sm5250076wrt.87.2023.04.21.15.11.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 21 Apr 2023 15:11:14 -0700 (PDT)
Message-ID: <a92d2457-34eb-cec0-ac4c-4d0f2e633e7c@linaro.org>
Date: Sat, 22 Apr 2023 00:11:13 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.10.0
Subject: Re: [PATCH v2 01/54] tcg: Replace if + tcg_abort with tcg_debug_assert
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-s390x@nongnu.org, qemu-riscv@nongnu.org,
 qemu-ppc@nongnu.org
References: <20230411010512.5375-1-richard.henderson@linaro.org>
 <20230411010512.5375-2-richard.henderson@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230411010512.5375-2-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::430;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x430.google.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-3.297,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 SUSPICIOUS_RECIPS=2.51,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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

On 11/4/23 03:04, Richard Henderson wrote:
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   tcg/tcg.c                 | 4 +---
>   tcg/i386/tcg-target.c.inc | 8 +++-----
>   2 files changed, 4 insertions(+), 8 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>


