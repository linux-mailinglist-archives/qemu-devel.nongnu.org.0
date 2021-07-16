Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B0623CBAFC
	for <lists+qemu-devel@lfdr.de>; Fri, 16 Jul 2021 19:16:07 +0200 (CEST)
Received: from localhost ([::1]:46642 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m4RRW-0001UY-17
	for lists+qemu-devel@lfdr.de; Fri, 16 Jul 2021 13:16:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54738)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m4RQD-0000dY-9Z
 for qemu-devel@nongnu.org; Fri, 16 Jul 2021 13:14:45 -0400
Received: from mail-pl1-x634.google.com ([2607:f8b0:4864:20::634]:45877)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m4RQB-0001Ta-Qo
 for qemu-devel@nongnu.org; Fri, 16 Jul 2021 13:14:44 -0400
Received: by mail-pl1-x634.google.com with SMTP id p17so5610289plf.12
 for <qemu-devel@nongnu.org>; Fri, 16 Jul 2021 10:14:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-language:content-transfer-encoding;
 bh=R6J2a96iBCrBCZ7L2u6WV78KqOA1yJ63V1u5u7JjtPA=;
 b=hKjgJ3igzN47yVr1kN0ZKYZs7tX01+WEPg5mBMPhEQmGlQeSFCyPPyX6Opq031Rn2Y
 BF7YK3Awv786ZTVV6xC2JssTD98H+l5lAbJlb+4d8OLqZD0WtuO73s1Q3nE3AcmTOUKm
 eIXSnNlu4DJN6NgczVLBa4wyM6DUb6+dEIp/batKIoUEG4XL1dJPn76dDfJrCd/Pzne2
 jLfnfIiXknfhxnZF8z7MbgEChAy+YDww0egIcQkABCdMZAO39nNHk9AKs+/neI4lQPqr
 zm0pCQikQiV6O871P1lwI0+U3N6ihedOwfM3DXwO4/Epx/PxzP+N/I15pdHpTkgGS8C7
 W0dw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=R6J2a96iBCrBCZ7L2u6WV78KqOA1yJ63V1u5u7JjtPA=;
 b=nyr/9heYtd+PhNsZMItYeXgMCzUTx5YWpy/R68saOslJOrVmCNegawblfvlnp/vGub
 PZAyaOlQz4hiBsJsoq7mB0GJ9Fj7BC7KODBC6wyFJug4CJSf6e321YUps3WTQelNDGfq
 mnZlEndl5i8++JjP28Czh7Og1sQY2l7tLRtlqpjmw8PXNcWUmC6hZN3XW8ogZc4MZi1R
 B4bLgyjwERy/h++8NL9/2tuVeENKpnh26E71kxZcA/r1hbs/A+vinaoDYNktwtemH4lW
 UV/ZcYASC1ZWXMuuPu9A3sd2K5PnOnjJXkNcA7AnrgBjflbhOj+cJ++2Dold4MB0e1dd
 ijAw==
X-Gm-Message-State: AOAM530QSdgqNbqSzNwu7vxn3+FIOXyPy5qYx/Fz++5d1kimO5bCRyZ/
 Rt1kheXTI9DFznOHqy47zJWa3MpSZV2DHw==
X-Google-Smtp-Source: ABdhPJxV3T4a5nZA9/1fOdqpyM7lOm5a1N9eioXxnmNbmCvKYOwx5gTciDQ+aiYr5iDjWzD4QDx98g==
X-Received: by 2002:a17:90a:5896:: with SMTP id
 j22mr10314208pji.125.1626455682047; 
 Fri, 16 Jul 2021 10:14:42 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.149.176])
 by smtp.gmail.com with ESMTPSA id w123sm10783394pfb.109.2021.07.16.10.14.41
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 16 Jul 2021 10:14:41 -0700 (PDT)
Subject: Re: [PATCH for-6.2 11/34] target/arm: Implement MVE VMULL (polynomial)
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20210713133726.26842-1-peter.maydell@linaro.org>
 <20210713133726.26842-12-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <04056c2e-04eb-bb9f-584f-ef188c2b6e03@linaro.org>
Date: Fri, 16 Jul 2021 10:14:40 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210713133726.26842-12-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::634;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x634.google.com
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 7/13/21 6:37 AM, Peter Maydell wrote:
> Implement the MVE VMULL (polynomial) insn.  Unlike Neon, this comes
> in two flavours: 8x8->16 and a 16x16->32.  Also unlike Neon, the
> inputs are in either the low or the high half of each double-width
> element.
> 
> The assembler for this insn indicates the size with "P8" or "P16",
> encoded into bit 28 as size = 0 or 1. We choose to follow the
> same encoding as VQDMULL and decode this into a->size as MO_16
> or MO_32 indicating the size of the result elements. This then
> carries through to the helper function names where it then
> matches up with the existing pmull_h() which does an 8x8->16
> operation and a new pmull_w() which does the 16x16->32.
> 
> Signed-off-by: Peter Maydell<peter.maydell@linaro.org>
> ---
>   target/arm/helper-mve.h    |  5 +++++
>   target/arm/vec_internal.h  | 11 +++++++++++
>   target/arm/mve.decode      | 14 ++++++++++----
>   target/arm/mve_helper.c    | 16 ++++++++++++++++
>   target/arm/translate-mve.c | 28 ++++++++++++++++++++++++++++
>   target/arm/vec_helper.c    | 14 +++++++++++++-
>   6 files changed, 83 insertions(+), 5 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

