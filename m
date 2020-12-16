Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 538DB2DC31D
	for <lists+qemu-devel@lfdr.de>; Wed, 16 Dec 2020 16:29:19 +0100 (CET)
Received: from localhost ([::1]:53116 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kpYjt-00080T-6X
	for lists+qemu-devel@lfdr.de; Wed, 16 Dec 2020 10:29:17 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:40424)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kpYez-0004pz-JR
 for qemu-devel@nongnu.org; Wed, 16 Dec 2020 10:24:13 -0500
Received: from mail-oo1-xc31.google.com ([2607:f8b0:4864:20::c31]:45315)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kpYex-0006No-Jd
 for qemu-devel@nongnu.org; Wed, 16 Dec 2020 10:24:13 -0500
Received: by mail-oo1-xc31.google.com with SMTP id o5so1978429oop.12
 for <qemu-devel@nongnu.org>; Wed, 16 Dec 2020 07:24:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=8SRN56yJfUQeD5MpqsTXAZPAKET25/vTh1oHQZp/0pk=;
 b=tXlT1cBV99T/ZEnUgz1/Ks5xPtvhUlvAmp2mEo4M1pvkxjGFpjGMpk/ftig2HNS3+M
 CFhq+5poMw9fRQ3F/90XvyDojohCuQ6gt4eUVA9MWCkGu6Sk3vi9HsOsjuBsamhy388/
 TfL90PE9x78rj9W/soCq/9CEmZ2R1kq0wegFiEpOd4ZH7txdbwtLW6DdoKrBkhwOYXcy
 4BIR6+DNSorFQUNLh4rS80FRWiOB0QenOJ9bFB5rwaEdSRnJBREER9o4pRRtijHJpXJc
 VlO//oYcV4mtCMI/O/D67Vs+xLMEfWsFiJiY7IQRWwP2s5Y7XOiriG1pVV/o46UVXl/X
 P3Sw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=8SRN56yJfUQeD5MpqsTXAZPAKET25/vTh1oHQZp/0pk=;
 b=EWY9y9ariBRLZC1AMCXyxqKX6QH020LMaC+xdL4u2ZaUc9RqxR5jiwhyW/vYQHfElg
 FjcPzcIWwcDqBYwCUhGkDlwXKo+SnkTG60W3IX4jy6NpkkZJJnR4UGEeXeFwPGY2Qhpo
 56vNQRDZBCw8sTQhtuoTUWPayn+adsy/51fM8GrUQYfg9ukh5GXU1USUbVojacchItZa
 RHJZHl+OLGEomn5PsZ0Fe0/f+xTagH4l0ay4yGOh4a6Tq2W/G/pScW18c6pBIFFvbvpX
 t2GNtplyiEuRAvM4pPgdQtTJD76LTeHQZNQNAlyIPiyg/JljYlnFtA5BBNm6J2bXY4wt
 kG6A==
X-Gm-Message-State: AOAM531xL4PFxnkWYhqoDKssDxt59VUqxje86eMxYYonTwNVqGoWwfli
 2YoejoUYYNHgTy9yejgIERUXYg==
X-Google-Smtp-Source: ABdhPJycP7jJWscjxldyHdQFPMqcSOjc41xzmC+bdgNutptWRJODNOsbc6CI+IJovCXPATGby9ek+g==
X-Received: by 2002:a4a:5590:: with SMTP id e138mr25668166oob.13.1608132250387; 
 Wed, 16 Dec 2020 07:24:10 -0800 (PST)
Received: from [10.10.121.52] (fixed-187-189-51-144.totalplay.net.
 [187.189.51.144])
 by smtp.gmail.com with ESMTPSA id i25sm484709oto.56.2020.12.16.07.24.08
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 16 Dec 2020 07:24:09 -0800 (PST)
Subject: Re: [RFC v2 03/15] target/riscv: rvb: count bits set
To: frank.chang@sifive.com, qemu-devel@nongnu.org, qemu-riscv@nongnu.org
References: <20201216020150.3157-1-frank.chang@sifive.com>
 <20201216020150.3157-4-frank.chang@sifive.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <dbe761f1-8422-41d2-5e53-89101aec22bd@linaro.org>
Date: Wed, 16 Dec 2020 09:24:07 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20201216020150.3157-4-frank.chang@sifive.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::c31;
 envelope-from=richard.henderson@linaro.org; helo=mail-oo1-xc31.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Kito Cheng <kito.cheng@sifive.com>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 12/15/20 8:01 PM, frank.chang@sifive.com wrote:
> From: Frank Chang <frank.chang@sifive.com>
> 
> Signed-off-by: Kito Cheng <kito.cheng@sifive.com>
> Signed-off-by: Frank Chang <frank.chang@sifive.com>


Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

> +    return gen_unary(ctx, a, &tcg_gen_ctpop_tl);
...
> +    return gen_unary(ctx, a, &gen_pcntw);

You can drop all of the unnecessary &'s.


r~

