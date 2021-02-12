Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BD3A031A432
	for <lists+qemu-devel@lfdr.de>; Fri, 12 Feb 2021 19:06:20 +0100 (CET)
Received: from localhost ([::1]:43018 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lAcpf-0002c8-8y
	for lists+qemu-devel@lfdr.de; Fri, 12 Feb 2021 13:06:19 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:56590)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lAcnB-0001TV-HX
 for qemu-devel@nongnu.org; Fri, 12 Feb 2021 13:03:45 -0500
Received: from mail-pj1-x1036.google.com ([2607:f8b0:4864:20::1036]:52100)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lAcn7-0005oW-PM
 for qemu-devel@nongnu.org; Fri, 12 Feb 2021 13:03:45 -0500
Received: by mail-pj1-x1036.google.com with SMTP id fa16so78312pjb.1
 for <qemu-devel@nongnu.org>; Fri, 12 Feb 2021 10:03:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=ClksEy2NdhComARvpvLs+gMW47tI2snYx/I6xaMsFuU=;
 b=DBaDb4CJZJwQMUXKBw48Nv6ttm7tPIzErFYfrZAIGvvjUDrGBj2llzyH8Flu+MF8sM
 MLQ7LzRdBAOBE94x2V/koK7QqDqzxZQtU+oPauwEm2ONThDuzm6m1e7NPOaDdgoxkyHK
 rDXh4qCOUYv4Wt4AcgxZHRSj1BySvTXHiQFR13GZ5VllfIfzNx3iON4DKxpfdz6JC1wG
 8MCFpngWISoS3f806+WykdXMQ9hDqEKS7yqnK0fAuQXeas7A9sjDNlYI++ijYxVe7MgI
 Tnkuc/DYRw/V8c1q8f8LaYGGQitoFSOMUF9ND0hIWlRo5YoblJLAAuj9LONWP7kO3zgU
 oHSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=ClksEy2NdhComARvpvLs+gMW47tI2snYx/I6xaMsFuU=;
 b=OlwndCNhr3DUgjzOIt3BKTKY0WDV4fW4OZ0JDQQciZhM5DY0I5toko8LpJ2E3o8coO
 sJ5ca8rauh+3XIL7yEzeVD17Hp6YoxsfpIoAVFbgxC/ZHm/JFLQR26Yq4FZwsTciQCHG
 tLOop4swRIrl2ciVlcGtAb8ueDeqlg8GrQ+T9DrAOiASB5xmGYJQ9NUyqQNw2AYoV0kP
 N04B94B4EP8VCni2VVTBnIlrjlRCnE4oLbVLv4F5eolN77QIOK2jbX8k6NMHLdeWxEWK
 JzUIqMuFW360GSZyIIdD46/3zlKO0OXiwqV+HkcrsbX68yoeKnkbGA5eulTDxgnQV33Q
 Jd1w==
X-Gm-Message-State: AOAM5313dacWRzZoPiGAkd+forgIJ1DFgX5JLUwVrDtBUuB5Eob8Pz1V
 tGgt+5lNkyCkBTTXeK6dApqa8g==
X-Google-Smtp-Source: ABdhPJz0BR/c9ndQKAKbjXVGw71I1Rjl1LJS1kkIRblNWMdGeI9ym9+mvI7NIFYImT4K8riD7L1Icw==
X-Received: by 2002:a17:90a:e7cd:: with SMTP id
 kb13mr3759819pjb.10.1613153020239; 
 Fri, 12 Feb 2021 10:03:40 -0800 (PST)
Received: from [192.168.1.11] (174-21-150-71.tukw.qwest.net. [174.21.150.71])
 by smtp.gmail.com with ESMTPSA id
 o14sm10887367pgr.44.2021.02.12.10.03.38
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 12 Feb 2021 10:03:39 -0800 (PST)
Subject: Re: [PATCH 04/38] target/riscv: 16-bit Addition & Subtraction
 Instructions
To: LIU Zhiwei <zhiwei_liu@c-sky.com>, qemu-devel@nongnu.org
References: <20210212150256.885-1-zhiwei_liu@c-sky.com>
 <20210212150256.885-5-zhiwei_liu@c-sky.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <d9715335-51a3-eb08-c04f-7a7ce6858ac7@linaro.org>
Date: Fri, 12 Feb 2021 10:03:37 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20210212150256.885-5-zhiwei_liu@c-sky.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1036;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1036.google.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.119,
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
Cc: alistair23@gmail.com, qemu-riscv@nongnu.org, palmer@dabbelt.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2/12/21 7:02 AM, LIU Zhiwei wrote:
> +    if (a->rd && a->rs1 && a->rs2) {
> +#ifdef TARGET_RISCV64
> +        f64(vece, offsetof(CPURISCVState, gpr[a->rd]),
> +            offsetof(CPURISCVState, gpr[a->rs1]),
> +            offsetof(CPURISCVState, gpr[a->rs2]),
> +            8, 8);
> +#else

This is not legal tcg.

You cannot reference as memory anything which has an associated tcg_global_mem.
 Which is true for all of the gprs -- see riscv_translate_init.


r~

