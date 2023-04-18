Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 608C96E5BED
	for <lists+qemu-devel@lfdr.de>; Tue, 18 Apr 2023 10:20:48 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pogZg-0001OT-MB; Tue, 18 Apr 2023 04:20:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pogZY-0001N2-Bo
 for qemu-devel@nongnu.org; Tue, 18 Apr 2023 04:20:20 -0400
Received: from mail-yw1-x1134.google.com ([2607:f8b0:4864:20::1134])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pogZW-0005jh-Uh
 for qemu-devel@nongnu.org; Tue, 18 Apr 2023 04:20:20 -0400
Received: by mail-yw1-x1134.google.com with SMTP id
 00721157ae682-54fb615ac3dso234572987b3.2
 for <qemu-devel@nongnu.org>; Tue, 18 Apr 2023 01:20:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1681806016; x=1684398016;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=IPKQOh+/dc/hqRghNq7RfRFkDmvZYeq2w5cXPUBWFTo=;
 b=ZfcShlT9AekOmUL1LevSlUE+TwXLo1JVs2x6RN6ZPY9Q5a+BLDWzyrQk5sXk3/gU5a
 WtNRuSqJqwZNFxLAXm7aXKSsoUrK/2xsW6US+x9Ji0bfDHdI4NSbgRwvp+T5KhOwf1Ug
 IaXSfsjr+6tsUSCgyuuQ/CJ07973g9VbDBM3iYvnH7rfS42JEIaK6UXQCX+B5k3kYwXo
 NUKGyDFm0xxAokxApdHD+Yk1J23hylNHIc8cMo7F6fv/0Osy/rbWhauxbdSMBzPrFdBo
 7diJeDKbLJBY+QBJYpdW375lYODmmm23KpVXjyHOQ/dXGKrV0uXQDio4bBT/1Hc0Tc11
 Ib2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1681806016; x=1684398016;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=IPKQOh+/dc/hqRghNq7RfRFkDmvZYeq2w5cXPUBWFTo=;
 b=hEJz5pGqyKWDvBoduO65PTs/bW4GVNpIlE5Sy/aEoVauI1B9nWcFYo3Pp42A01H8yA
 oFOoeJZyPqLkjvoTfD7mY3HbgX4rz4+JAp/dTiv9RRtYdAc0RQIkcl/WFKyqbmB5bzus
 Fei1joxoPwBOzComtucwQ52UMRNHqHB6hZB5AyRaz3A4cjJFazEDUG7qBs1s53czeYgb
 GSyerw6i3rFM9BfwGwVizth1pLJW5WE1ShluibX7jWf8GVoNQ2jsFayotTtJyJ6guvsx
 HpvRn6jJo0RdTu1Qo7wZHDQJiacazzcx/+vbx4A/LmoBwfnQ+cpleHbgFNt9VdGEucV8
 yKLw==
X-Gm-Message-State: AAQBX9fLwivaADwWxXDfbEBMJv24WaHztu3ctk4bN9X3d+QYRaNG6ZfX
 0t69PE/T2AtE0a1wQli5hoMx8A==
X-Google-Smtp-Source: AKy350YkhhQX1OQUgKxOQW0rPFh93SNXmWM4X4l9brWPj2Wqe/umyUTWQQOHGvpV7rgM+CulaIb9Hw==
X-Received: by 2002:a0d:c387:0:b0:54c:1405:2ce with SMTP id
 f129-20020a0dc387000000b0054c140502cemr20029718ywd.49.1681806016252; 
 Tue, 18 Apr 2023 01:20:16 -0700 (PDT)
Received: from ?IPV6:2605:ef80:8079:8dd6:3f0f:2ab3:5c15:47fa?
 ([2605:ef80:8079:8dd6:3f0f:2ab3:5c15:47fa])
 by smtp.gmail.com with ESMTPSA id
 cd9-20020a05690c088900b0054c02f97d8dsm2902713ywb.91.2023.04.18.01.19.47
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 18 Apr 2023 01:20:15 -0700 (PDT)
Message-ID: <a96de4ca-366b-82ae-bf80-2b183d936ba2@linaro.org>
Date: Tue, 18 Apr 2023 10:19:37 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH v2 07/17] qemu/bitops.h: Limit rotate amounts
Content-Language: en-US
To: Lawrence Hunter <lawrence.hunter@codethink.co.uk>, qemu-devel@nongnu.org
Cc: dickon.hood@codethink.co.uk, nazar.kazakov@codethink.co.uk,
 kiran.ostrolenk@codethink.co.uk, frank.chang@sifive.com, palmer@dabbelt.com,
 alistair.francis@wdc.com, bin.meng@windriver.com, pbonzini@redhat.com,
 philipp.tomsich@vrull.eu, kvm@vger.kernel.org, qemu-riscv@nongnu.org
References: <20230417135821.609964-1-lawrence.hunter@codethink.co.uk>
 <20230417135821.609964-8-lawrence.hunter@codethink.co.uk>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20230417135821.609964-8-lawrence.hunter@codethink.co.uk>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1134;
 envelope-from=richard.henderson@linaro.org; helo=mail-yw1-x1134.google.com
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-2.284,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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

On 4/17/23 15:58, Lawrence Hunter wrote:
> From: Dickon Hood<dickon.hood@codethink.co.uk>
> 
> Rotates have been fixed up to only allow for reasonable rotate amounts
> (ie, no rotates >7 on an 8b value etc.)  This fixes a problem with riscv
> vector rotate instructions.
> 
> Signed-off-by: Dickon Hood<dickon.hood@codethink.co.uk>
> ---
>   include/qemu/bitops.h | 24 ++++++++++++++++--------
>   1 file changed, 16 insertions(+), 8 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

