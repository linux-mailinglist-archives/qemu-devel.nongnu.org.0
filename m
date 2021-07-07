Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C37E3BE098
	for <lists+qemu-devel@lfdr.de>; Wed,  7 Jul 2021 03:33:22 +0200 (CEST)
Received: from localhost ([::1]:50828 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m0wRF-000554-L1
	for lists+qemu-devel@lfdr.de; Tue, 06 Jul 2021 21:33:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42112)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m0wQ3-00030W-Kh
 for qemu-devel@nongnu.org; Tue, 06 Jul 2021 21:32:10 -0400
Received: from mail-pg1-x529.google.com ([2607:f8b0:4864:20::529]:42574)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m0wQ2-00068J-2R
 for qemu-devel@nongnu.org; Tue, 06 Jul 2021 21:32:07 -0400
Received: by mail-pg1-x529.google.com with SMTP id d12so572605pgd.9
 for <qemu-devel@nongnu.org>; Tue, 06 Jul 2021 18:32:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=5xe0rW2DfzVZcL35mReT6fuZ9hjF3alH87O+aqyNIac=;
 b=iMt06ui9DcEjW7w5zxzjBP8KKqcIMX+X+h24oykxw6xhyGH7Bvb4SXMqYaj3nIR9Tv
 gl/yBrJF9A1WTlInQOjxEGXC0iMJahrH7xfjW56Y47frz2Xri3b3Lv2hQikPUjUwIKgC
 kj+xgePqzBA31z6En5E4x42/6av++7ymGhCUryupBYjVsxoH6xRl+KdY2t0yrHMPspg+
 SH1nOfS54ObicTUi4NatcnWUfxlPeCxkr6G3enT3iD9jBo2C4vUAREmQfv05KG+nx+kA
 ucI2LOL3MOlBJmoN9X3ytZVR8hHM6Y5jHjVLsjLENlHB4hE8WfsdX8UPdA6GjK8+qfP0
 qz+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=5xe0rW2DfzVZcL35mReT6fuZ9hjF3alH87O+aqyNIac=;
 b=OdtJaUBXg1joMR/gAARD9ch0UL/C6QkaOdj/XCvPgV7/X+q0un+nshen0bqoXRJYDm
 SAfV8YL1hCvpXoVf2R+7x6W8GmpOyXkGjR0ce1cJLeKRF6+A0LEoYinu6A00Zb0AeoNz
 6lVhl9YRlcR23+zcUycZyLx9Km/fhTuSQepdezgCaAbVE3mDtna0eKtU5+uFe4epSjXQ
 6JPdFhYhNCpiXL4sh5LalJbvmEyp27qD68uuVU2ED09VwvyVh1WdgrQCjOFspSbd3D5T
 GHisaYpexgmFBva1q9o1/3mgG39dQgSpsejDUbbCaxjyuocvAt+Za6fuiwhZR3pfHMkB
 1lww==
X-Gm-Message-State: AOAM531aftgcJCQjTtBRuFyl31pA88tmJB90H7nOeKJWijw2A6DlHgDc
 U9ZgXv/rpD088p/9Bq4jtG4QYh8pI4mfxQ==
X-Google-Smtp-Source: ABdhPJzlDLe/9kHIT8PAsI/FwLIeR0BeVK0iJBh/BFliykPR9CGJ6HNlPom4AUYU3wsfWkywgyUySA==
X-Received: by 2002:a63:ef4c:: with SMTP id c12mr23890728pgk.441.1625621524645; 
 Tue, 06 Jul 2021 18:32:04 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.149.176])
 by smtp.gmail.com with ESMTPSA id q18sm20014397pgj.8.2021.07.06.18.32.04
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 06 Jul 2021 18:32:04 -0700 (PDT)
Subject: Re: [PATCH 08/11] hw/arm/virt: Make PL061 GPIO lines pulled low, not
 high
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20210702104018.19881-1-peter.maydell@linaro.org>
 <20210702104018.19881-9-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <30151204-d365-7c23-071f-b740b09d8b2f@linaro.org>
Date: Tue, 6 Jul 2021 18:32:02 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210702104018.19881-9-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::529;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x529.google.com
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
Cc: Maxim Uvarov <maxim.uvarov@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 7/2/21 3:40 AM, Peter Maydell wrote:
> For the virt board we have two PL061 devices -- one for NonSecure which
> is inputs only, and one for Secure which is outputs only. For the former,
> we don't care whether its outputs are pulled low or high when the line is
> configured as an input, because we don't connect them. For the latter,
> we do care, because we wire the lines up to the gpio-pwr device, which
> assumes that level 1 means "do the action" and 1 means "do nothing".
> For consistency in case we add more outputs in future, configure both
> PL061s to pull GPIO lines down to 0.
> 
> Reported-by: Maxim Uvarov<maxim.uvarov@linaro.org>
> Signed-off-by: Peter Maydell<peter.maydell@linaro.org>
> ---
>   hw/arm/virt.c | 3 +++
>   1 file changed, 3 insertions(+)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

