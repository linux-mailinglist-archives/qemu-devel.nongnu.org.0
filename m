Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D3A3D4C05E4
	for <lists+qemu-devel@lfdr.de>; Wed, 23 Feb 2022 01:24:06 +0100 (CET)
Received: from localhost ([::1]:59184 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nMfRt-0004mM-Mh
	for lists+qemu-devel@lfdr.de; Tue, 22 Feb 2022 19:24:05 -0500
Received: from eggs.gnu.org ([209.51.188.92]:53942)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nMfQn-0003N7-Rg
 for qemu-devel@nongnu.org; Tue, 22 Feb 2022 19:22:57 -0500
Received: from [2607:f8b0:4864:20::529] (port=34499
 helo=mail-pg1-x529.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nMfQZ-00030R-It
 for qemu-devel@nongnu.org; Tue, 22 Feb 2022 19:22:57 -0500
Received: by mail-pg1-x529.google.com with SMTP id 139so18411152pge.1
 for <qemu-devel@nongnu.org>; Tue, 22 Feb 2022 16:22:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=OoiOgVxsEnYgwauUR9GIqkHCl/sBpfmSC2kNRvBKdQU=;
 b=tNQBF13EtH4uv7MqMooctYyZG0H6b+X9iycggNciZhTLzaKMKdcYtQ37M2vzwClNxL
 NQzI3bJ7SDULubbE7yH7uk/wcn7iisxGYC8uc/kVI0fVwmPgz9UIKmzN/Q2OD0+oPD4q
 A4w/6S6UW4OzHzNPMmlUFZ3ZdZVkPP+ZXR/hiN0FAfusKB96HzDZg9VWc2ZubdN9j7+y
 CCXwd53RezLHWfjA9yj7huohYV+tUbSsDpUxkQr+3YHZtmUXYx33bUKX0GH7Q+xR/7HW
 cIZOzyJhAHBa9taet270qLuYxxzERc1iLpJ9R6WoaNtYXWI71qDJ/GpX7Mwnov/Dt2wS
 /srg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=OoiOgVxsEnYgwauUR9GIqkHCl/sBpfmSC2kNRvBKdQU=;
 b=QD5GnsaPyjvXm9Hq5MYFa9koHKd5lZcKvNoL43Pvwo3UymdoldMqyHzJwe/RxUeORH
 5CIt4l2kWgRzoBpMQ/7sRkesTTPxbraO3br8Z0rtURQSuyVpRb3hChAf+C49HQF1V3iE
 q7yF+GlSxS8TwdnM3SDFCd1IZ5vN0whMCSilIRf8GSwF/PZNOl+FFUH6qPowiEWliUTy
 1hl8Cm+b1f0VkX47p2HmTGSsKuLx0vHCzxOE5aJtKQFJBrF05n0XOVBO+uQKUJ3CYwYX
 j/2nRPGzw9lZ7PrVGfsGn4NGkRrU6RuW/Eqfqe9U/UKs0c2mwgLtcrqf2eSmeoyWci34
 gC9g==
X-Gm-Message-State: AOAM533Bd07XNZk+R1YBarrpZtfQOFa+G9r6HrVrxL4pCqO+pZpnTXCR
 oMpeEBuT4Pn2TGvGhF2PkiFXvg==
X-Google-Smtp-Source: ABdhPJzHFFnzOcUd4dgDhRdhPO++b4IjBFBQUd22EpWj1oRAToMNwEZYXlIt2gbu21NNsCNxFNgodw==
X-Received: by 2002:a05:6a00:16cd:b0:4e1:366:7ee8 with SMTP id
 l13-20020a056a0016cd00b004e103667ee8mr27331898pfc.9.1645575761198; 
 Tue, 22 Feb 2022 16:22:41 -0800 (PST)
Received: from [192.168.4.112] (cpe-50-113-46-110.hawaii.res.rr.com.
 [50.113.46.110])
 by smtp.gmail.com with ESMTPSA id c1sm10712371pfl.130.2022.02.22.16.22.39
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 22 Feb 2022 16:22:40 -0800 (PST)
Message-ID: <1fc15c42-72d3-160e-17d5-02bac2f707f7@linaro.org>
Date: Tue, 22 Feb 2022 14:22:37 -1000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v4 40/47] target/ppc: Move xscmp{eq, ge,
 gt}dp to decodetree
Content-Language: en-US
To: matheus.ferst@eldorado.org.br, qemu-devel@nongnu.org, qemu-ppc@nongnu.org
References: <20220222143646.1268606-1-matheus.ferst@eldorado.org.br>
 <20220222143646.1268606-41-matheus.ferst@eldorado.org.br>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220222143646.1268606-41-matheus.ferst@eldorado.org.br>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::529
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::529;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x529.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 PDS_HP_HELO_NORDNS=0.659, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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

On 2/22/22 04:36, matheus.ferst@eldorado.org.br wrote:
> From: Víctor Colombo<victor.colombo@eldorado.org.br>
> 
> Signed-off-by: Víctor Colombo<victor.colombo@eldorado.org.br>
> Signed-off-by: Matheus Ferst<matheus.ferst@eldorado.org.br>
> ---
>   target/ppc/fpu_helper.c             |  7 +++----
>   target/ppc/helper.h                 |  6 +++---
>   target/ppc/insn32.decode            |  3 +++
>   target/ppc/translate/vsx-impl.c.inc | 28 +++++++++++++++++++++++++---
>   target/ppc/translate/vsx-ops.c.inc  |  3 ---
>   5 files changed, 34 insertions(+), 13 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

