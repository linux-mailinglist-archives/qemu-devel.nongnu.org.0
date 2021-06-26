Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DF2093B4BF7
	for <lists+qemu-devel@lfdr.de>; Sat, 26 Jun 2021 04:19:25 +0200 (CEST)
Received: from localhost ([::1]:42932 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lwxum-0000Lf-IB
	for lists+qemu-devel@lfdr.de; Fri, 25 Jun 2021 22:19:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33684)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lwxtx-0007uN-63
 for qemu-devel@nongnu.org; Fri, 25 Jun 2021 22:18:33 -0400
Received: from mail-pl1-x631.google.com ([2607:f8b0:4864:20::631]:36685)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lwxtu-0001yw-Ra
 for qemu-devel@nongnu.org; Fri, 25 Jun 2021 22:18:32 -0400
Received: by mail-pl1-x631.google.com with SMTP id u2so5659569plf.3
 for <qemu-devel@nongnu.org>; Fri, 25 Jun 2021 19:18:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=adTq5jNGvDtdlxJZ0jo/X2Y0G9eh94VT3vNbiTzlDqQ=;
 b=ml2crYcFngrPmqZAajCUjXEnakbeAd37mweOz0RP0ooJ9Lkr9G/jE/JkU3Z7HN+Gpo
 dR6F/bwWl0AEjC/vtLa2aRTq3mqxAUeEBcq1xEhUJn9Cku+O0Jp3xwLH7C+d8ONw76Dh
 5T3cumZbG8VXOXBSb029wXL+BZkncyMdLXMiimHtwtOhhm/n5HQ1DzvFtgEWOm+xdWih
 UzDe5mXs+0ithYDPZLq7ygv1MYmQtFIVGzbY78VNWtyf5tkYZuSB2HkTl6zGrQlRgdxs
 7JXkHLeSU9thtHtLBrqEMcdplNgLYOhmYpyYKDx0bmEB69FqRobPfl7fiXYq0nFLUVHl
 u0iQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=adTq5jNGvDtdlxJZ0jo/X2Y0G9eh94VT3vNbiTzlDqQ=;
 b=QwS2SVM+oeYY9x9TVF745V5Wi07HWeY8Oyv6Nk4WTEiUH7zEITVQZe5wJRNghwrPau
 XM71kP/JxImzOrDcuyp7xlOUUbHGGzeFBuo7P/0MPTkrbAmWbKf2o6Gn+gz6su+nMWNu
 +kaK2B9BfsT4z8i+gJYAz7f13T/73cVLXPlqU2znvWIiN6I541MmOSHtpsEZNCQ/wTGa
 zi9ln8y56LNkvzRdmHiv1I3ajoCia+k3afAPnY7j1Ru9MFCKWUyWhLkA2/zn4DDtK+1W
 5pCID889sBXA/bpYhJwX48CH4jKWI+WJfg9PBsnpMBajRdXm34qUKDmxMsnypi/x029u
 c8og==
X-Gm-Message-State: AOAM5333ZF9HE0OGW6KDrw5CbX23MyYqCGgKepmsqZwpFznId2F6NhQf
 tGl+Q5tMCsnEG3qXXrHA9fSCBA==
X-Google-Smtp-Source: ABdhPJwI9Zy2jfj0U5Iz6O+Et1yavnaSNFrsCgcoYn4t9fY8PAt0gD80JQKmoTpzA75gdetaY83rLg==
X-Received: by 2002:a17:90a:9411:: with SMTP id
 r17mr14271032pjo.49.1624673909182; 
 Fri, 25 Jun 2021 19:18:29 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.149.176])
 by smtp.gmail.com with ESMTPSA id y4sm6508498pfc.15.2021.06.25.19.18.28
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 25 Jun 2021 19:18:28 -0700 (PDT)
Subject: Re: [PATCH 1/1] target/arm: Check NaN mode before silencing NaN
To: Joe Komlodi <joe.komlodi@xilinx.com>, qemu-devel@nongnu.org
References: <1624662174-175828-1-git-send-email-joe.komlodi@xilinx.com>
 <1624662174-175828-2-git-send-email-joe.komlodi@xilinx.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <99a806cf-8c54-a504-c51b-bd094a2773b3@linaro.org>
Date: Fri, 25 Jun 2021 19:18:27 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <1624662174-175828-2-git-send-email-joe.komlodi@xilinx.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::631;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x631.google.com
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
Cc: qemu-arm@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 6/25/21 4:02 PM, Joe Komlodi wrote:
> If the CPU is running in default NaN mode (FPCR.DN == 1) and we execute
> FRSQRTE, FRECPE, or FRECPX with a signaling NaN, parts_silence_nan_frac() will
> assert due to fpst->default_nan_mode being set.
> 
> To avoid this, we check to see what NaN mode we're running in before we call
> floatxx_silence_nan().
> 
> Signed-off-by: Joe Komlodi<joe.komlodi@xilinx.com>
> ---
>   target/arm/helper-a64.c | 12 +++++++++---
>   target/arm/vfp_helper.c | 24 ++++++++++++++++++------
>   2 files changed, 27 insertions(+), 9 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

