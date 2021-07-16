Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D257F3CBEC6
	for <lists+qemu-devel@lfdr.de>; Fri, 16 Jul 2021 23:57:00 +0200 (CEST)
Received: from localhost ([::1]:44990 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m4VpL-0005W0-F5
	for lists+qemu-devel@lfdr.de; Fri, 16 Jul 2021 17:56:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48138)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m4Vnl-00048O-Gc
 for qemu-devel@nongnu.org; Fri, 16 Jul 2021 17:55:22 -0400
Received: from mail-pj1-x102c.google.com ([2607:f8b0:4864:20::102c]:50983)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m4Vnj-0000Cd-NW
 for qemu-devel@nongnu.org; Fri, 16 Jul 2021 17:55:21 -0400
Received: by mail-pj1-x102c.google.com with SMTP id cu14so7231153pjb.0
 for <qemu-devel@nongnu.org>; Fri, 16 Jul 2021 14:55:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-language:content-transfer-encoding;
 bh=1BqdBsGjBtoWHQj1TYhqxlS7caDlCKdx2OmyK6SJONs=;
 b=wNfoSi3QrWS05oYK25ON9weZWKdXbAqNOb8t0raoDyFD9kuBA32/hp8RNfNTO0KBBA
 GMmYLoZoCiVS5z7TXbWnCPctrcGal3pBBv2Tq6XSPZTJudTDseceEQtAmmMkb/kEORa5
 uAay5irLOAzcoD4Fi6FX1wC9uFzSFRveioz2p15Xda2spvRJgxsDVxOScGlsToAxv1j4
 9wII+jIfOo7fOj3xfUuWUHpMckK2bGCIMEainWqJuJIXLX+RIEg/3tj93RlT7lDcfXLY
 LkrM7Jb5zk/qpQmtU8CwnkMABXp5JAzSIonfK8Pb+PO0uSQplUmIjngWhOCOvJLJ9SEb
 3XRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=1BqdBsGjBtoWHQj1TYhqxlS7caDlCKdx2OmyK6SJONs=;
 b=TVJHB7c61qiTllDjeUJVzczuoVJFpQfi3Ywa+VLz4SNEBs07z7Afw2R1RwKpwQgEfw
 KYv8hgVh1yRFwjeiRluJFLggoZXAQ9m0+zBcwTuf4LmoZTwJWON/wFC/ms4enzcQm7/7
 MKnCebW2sC+9+wyv+PRTGThb1fEfiH87vqsMjfXAKI1Quog2FbNB3zhwDG9Qw8sxjQpv
 TS4X0W7nxYrBypShwIxMSHz2oo+zGjTRFMLS5DbtvXVi5hNNCuyxv/O5JockXBxteXlq
 GDwWIA3IILmgikHxNXABec9mI3sjRk8dGTsC7gzzpRkPMjG08W6Jcg0JuweooabDhQ42
 GsNQ==
X-Gm-Message-State: AOAM533UeEW9Zy4CxGmP7DeRmpd/upQY6xM28u7W6EiKc4xvtJwa6BMi
 MypvBmwO/JNjSjGx/2+mykj8ZJgfMl5pmA==
X-Google-Smtp-Source: ABdhPJwrqNxabsWKRChDzvBu2/c96J9A9IiqkCW+x5U9bEN3QDs7D5AgRnXvPJjW2EOxsgQljYu6vw==
X-Received: by 2002:a17:902:b193:b029:11a:a179:453a with SMTP id
 s19-20020a170902b193b029011aa179453amr9275353plr.69.1626472517250; 
 Fri, 16 Jul 2021 14:55:17 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.149.176])
 by smtp.gmail.com with ESMTPSA id 20sm11417386pfi.170.2021.07.16.14.55.15
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 16 Jul 2021 14:55:15 -0700 (PDT)
Subject: Re: [PATCH for-6.2 14/34] target/arm: Implement MVE integer vector
 comparisons
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20210713133726.26842-1-peter.maydell@linaro.org>
 <20210713133726.26842-15-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <10c0604e-968b-e89c-ba0c-4ceac9e6418e@linaro.org>
Date: Fri, 16 Jul 2021 14:55:13 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210713133726.26842-15-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102c;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102c.google.com
X-Spam_score_int: -1
X-Spam_score: -0.2
X-Spam_bar: /
X-Spam_report: (-0.2 / 5.0 requ) DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 7/13/21 6:37 AM, Peter Maydell wrote:
> Implement the MVE integer vector comparison instructions.  These are
> "VCMP (vector)" encodings T1, T2 and T3, and "VPT (vector)" encodings
> T1, T2 and T3.
> 
> These insns compare corresponding elements in each vector, and update
> the VPR.P0 predicate bits with the results of the comparison.  VPT
> also sets the VPR.MASK01 and VPR.MASK23 fields -- it is effectively
> "VCMP then VPST".
> 
> Signed-off-by: Peter Maydell<peter.maydell@linaro.org>
> ---
>   target/arm/helper-mve.h    | 32 ++++++++++++++++++++++
>   target/arm/mve.decode      | 18 +++++++++++-
>   target/arm/mve_helper.c    | 56 ++++++++++++++++++++++++++++++++++++++
>   target/arm/translate-mve.c | 47 ++++++++++++++++++++++++++++++++
>   4 files changed, 152 insertions(+), 1 deletion(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

