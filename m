Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 059B74CE052
	for <lists+qemu-devel@lfdr.de>; Fri,  4 Mar 2022 23:43:12 +0100 (CET)
Received: from localhost ([::1]:41094 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nQGdj-0001m3-3V
	for lists+qemu-devel@lfdr.de; Fri, 04 Mar 2022 17:43:11 -0500
Received: from eggs.gnu.org ([209.51.188.92]:37712)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nQGaD-0004Lh-L4
 for qemu-devel@nongnu.org; Fri, 04 Mar 2022 17:39:34 -0500
Received: from [2607:f8b0:4864:20::532] (port=41867
 helo=mail-pg1-x532.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nQGaC-0008EK-4y
 for qemu-devel@nongnu.org; Fri, 04 Mar 2022 17:39:33 -0500
Received: by mail-pg1-x532.google.com with SMTP id o26so8625647pgb.8
 for <qemu-devel@nongnu.org>; Fri, 04 Mar 2022 14:39:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=VmfepupHappTfzMofzWha7MPTIwvdv36rjrsy5g7BgE=;
 b=OuGwLoqCSTUhMSMSfAqFqP7zVO2GuwdBErnqX3zWMPc1SKkLOmVgL75MEZc79r/w5p
 adujHbfl5Or+js5mIDZ0AM9WtDOQeSQcWgzZWAQNoK9mVN6yOPLE+OyRDodU4fVPjKrY
 0n7xUkh9WF7tEVmJQSVi5qwK11tvHRqHvbGjZMOgG+Bm9hidaakuX3xqCkdX1KhCqX7R
 8WUKNhGf2dOHKrdgZS8aR8dbMuerrSUlbs6p1vlDV4iTOVjCVcWUzg5cdGMfe0jFD+PR
 IOqROqCYFljC9CgZDkDdYe869OKQPz3SitEdEBW9IlRXXv6gKHrvYbfx9A90ACDdyK+g
 JkkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=VmfepupHappTfzMofzWha7MPTIwvdv36rjrsy5g7BgE=;
 b=kRtk9vvLzdoOQsdhRd77mN/Tp6W9LMP+aFFJpvLtfOWUvjfvI8eFV11RCKwN8Q2PmF
 iPJZFoeGFiPX46FAsADkx7IAcAxOQgsT2G0ScsDhi9VvNsgJ7WYC8qBT6KUNDe455b/W
 wJsoMtAT9Yey8eQPvo3BkVhHzqhSRGGOKGb/RVJtHhedYLmJ/HsHatJK4MuEiQ3p+X2Y
 a9U5FgSgcJZHnxx1fM6naoLaAuzCMW7H6aokfqxRZgH0s+o/zdjPEI62TI523sVKtytB
 HcXJvTZODzJM386n7nmjR7X5b5DoH9H6lVHgsEDnk6kcJKijFJ1+lR+Pa2NCb2yTuRFN
 xUgQ==
X-Gm-Message-State: AOAM530iKt/E79ce7Dj0Hy4HOSFT50oC3vCxrGrrF5G94RnLFFVVW0pW
 NJZ4E3OqoxVz0NT60RwM3k3xLw==
X-Google-Smtp-Source: ABdhPJzDUmQB2sJQkl+t155JG+eD32uQjm3PLZRV5Z+8h+ud4SJ97aM6hRsMR7sEzT2RLZDE9qy9aQ==
X-Received: by 2002:a05:6a00:1ca2:b0:4f6:4f1d:c911 with SMTP id
 y34-20020a056a001ca200b004f64f1dc911mr660721pfw.76.1646433570908; 
 Fri, 04 Mar 2022 14:39:30 -0800 (PST)
Received: from ?IPV6:2603:800c:1201:c600:f24b:57b2:da7c:e304?
 (2603-800c-1201-c600-f24b-57b2-da7c-e304.res6.spectrum.com.
 [2603:800c:1201:c600:f24b:57b2:da7c:e304])
 by smtp.gmail.com with ESMTPSA id
 u19-20020a056a00099300b004e16e381696sm7123566pfg.195.2022.03.04.14.39.29
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 04 Mar 2022 14:39:30 -0800 (PST)
Message-ID: <4577501b-b470-21c3-ee2b-ecbe28c1e8c7@linaro.org>
Date: Fri, 4 Mar 2022 12:39:27 -1000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH 7/7] target/ppc: Add missing helper_reset_fpstatus to
 helper_XVCVSPBF16
Content-Language: en-US
To: matheus.ferst@eldorado.org.br, qemu-devel@nongnu.org, qemu-ppc@nongnu.org
References: <20220304175156.2012315-1-matheus.ferst@eldorado.org.br>
 <20220304175156.2012315-8-matheus.ferst@eldorado.org.br>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220304175156.2012315-8-matheus.ferst@eldorado.org.br>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::532
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::532;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x532.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: =?UTF-8?Q?V=c3=adctor_Colombo?= <victor.colombo@eldorado.org.br>,
 groug@kaod.org, danielhb413@gmail.com, clg@kaod.org,
 david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 3/4/22 07:51, matheus.ferst@eldorado.org.br wrote:
> From: Víctor Colombo<victor.colombo@eldorado.org.br>
> 
> Fixes: 3909ff1fac ("target/ppc: Implement xvcvbf16spn and xvcvspbf16 instructions")
> Signed-off-by: Víctor Colombo<victor.colombo@eldorado.org.br>
> Signed-off-by: Matheus Ferst<matheus.ferst@eldorado.org.br>
> ---
>   target/ppc/fpu_helper.c | 2 ++
>   1 file changed, 2 insertions(+)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

