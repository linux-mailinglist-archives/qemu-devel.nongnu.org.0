Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 809A864F66D
	for <lists+qemu-devel@lfdr.de>; Sat, 17 Dec 2022 01:42:46 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p6LHZ-00029H-Vq; Fri, 16 Dec 2022 19:42:30 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1p6LHY-00025G-Ga
 for qemu-devel@nongnu.org; Fri, 16 Dec 2022 19:42:28 -0500
Received: from mail-pg1-x530.google.com ([2607:f8b0:4864:20::530])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1p6LHW-0006QO-Kq
 for qemu-devel@nongnu.org; Fri, 16 Dec 2022 19:42:28 -0500
Received: by mail-pg1-x530.google.com with SMTP id r18so2825844pgr.12
 for <qemu-devel@nongnu.org>; Fri, 16 Dec 2022 16:42:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=WGds/3jlXLDMv34+tHdaOw7irGF016IXgh0RYegJ3qE=;
 b=WiCh47CElQL2Wsvax6Z7+2/bePWctNJopoHhAu/MDfF1li95Q8cupF6CpeCTfUjwLE
 bD5U1xtExlI9mZ/AaQRMGUVxPhdfszVKj12DzmQPzK7h01T4ubTapU28WNrH+Uy1tGlQ
 3CRH6m+KquG/SgwxUw4IlLJ/qd4FkZQggCPqXey8/9ar/V50IA3dcKf6eOjWLe8fnYm2
 z6r23UNuozViJ5trhiYpCGhPxizvHXxybsSM3Mul2nq6+n6xKhV/xQe3e0lh2ICAXVQX
 LT82W/Tpll3c6LIC6/UaBUjUb5d9IcPfLFS10ojy7+nb1eDHbNVMWsnLYvt/9qK5xBhe
 CrYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=WGds/3jlXLDMv34+tHdaOw7irGF016IXgh0RYegJ3qE=;
 b=g2HmM9HC1FhItmJ88g96IKZf5vv+UQevclp7o6Oo00rPf29MmG8NdctmXfO5eb9TC8
 pwuXoyVNkYNxu13vRfWjbQWBWCNA2gdHhK/VudOBpvoBuEgHac0stNuM1D3C7INLN5s2
 s4Btd27P5JfB3PGQeKwJ/8AYWaMthBBbtj7gqKNHabxZYRY/DgYYyd1w/exknvpysQSu
 7PN9r/qb0F6hWwbEcV0crOYw3YkHDz3YZR8REZ1EVdNhkDe3UrUjQWEwGi5T7//X83PM
 SmYfqh05out5g0MUUS05HfrJeLEZfyKdPiyXMLP1+AMABsEyxLni17ETMHjoxJAbRYWh
 QJgg==
X-Gm-Message-State: ANoB5pk6xnekRBc4n2LOXS3IY9yNiZDhA971yyBtP75zu2xz3uReNOEU
 Zqj89Cv/shIr7ym0iJx8leyxLA==
X-Google-Smtp-Source: AA0mqf6GDKH4v+7eNywiNt/JtY07VFgl2oigedwElaco311UAa/pIOajnbSowEw+YR39yGWgCNNP9A==
X-Received: by 2002:aa7:9ecd:0:b0:576:9455:4c5e with SMTP id
 r13-20020aa79ecd000000b0057694554c5emr31619776pfq.24.1671237745265; 
 Fri, 16 Dec 2022 16:42:25 -0800 (PST)
Received: from ?IPV6:2602:47:d48c:8101:c606:9489:98df:6a3b?
 ([2602:47:d48c:8101:c606:9489:98df:6a3b])
 by smtp.gmail.com with ESMTPSA id
 b4-20020a62cf04000000b005764c8f8f15sm2050790pfg.73.2022.12.16.16.42.24
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 16 Dec 2022 16:42:24 -0800 (PST)
Message-ID: <0e1ba680-19d6-2840-200f-2798d393e2d9@linaro.org>
Date: Fri, 16 Dec 2022 16:42:23 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH 1/5] exec/memory: Expose memory_region_access_valid()
Content-Language: en-US
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: David Hildenbrand <david@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Halil Pasic <pasic@linux.ibm.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 Eric Farman <farman@linux.ibm.com>, Ilya Leoshkevich <iii@linux.ibm.com>,
 qemu-s390x@nongnu.org, Peter Xu <peterx@redhat.com>,
 Matthew Rosato <mjrosato@linux.ibm.com>
References: <20221216220411.6779-1-philmd@linaro.org>
 <20221216220411.6779-2-philmd@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20221216220411.6779-2-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::530;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x530.google.com
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

On 12/16/22 14:04, Philippe Mathieu-Daudé wrote:
> Instead of having hardware device poking into memory
> internal API, expose memory_region_access_valid().
> 
> Signed-off-by: Philippe Mathieu-Daudé<philmd@linaro.org>
> ---
>   hw/s390x/s390-pci-inst.c       | 2 +-
>   include/exec/memory-internal.h | 4 ----
>   include/exec/memory.h          | 4 ++++
>   3 files changed, 5 insertions(+), 5 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

