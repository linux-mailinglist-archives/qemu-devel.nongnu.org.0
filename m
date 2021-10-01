Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E6EA741F21F
	for <lists+qemu-devel@lfdr.de>; Fri,  1 Oct 2021 18:26:56 +0200 (CEST)
Received: from localhost ([::1]:35674 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mWLN9-0007mS-Fr
	for lists+qemu-devel@lfdr.de; Fri, 01 Oct 2021 12:26:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43994)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mWLKT-0006OA-9R
 for qemu-devel@nongnu.org; Fri, 01 Oct 2021 12:24:09 -0400
Received: from mail-qk1-x72a.google.com ([2607:f8b0:4864:20::72a]:36542)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mWLKR-0006cC-Iy
 for qemu-devel@nongnu.org; Fri, 01 Oct 2021 12:24:08 -0400
Received: by mail-qk1-x72a.google.com with SMTP id p4so9675640qki.3
 for <qemu-devel@nongnu.org>; Fri, 01 Oct 2021 09:24:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-language:content-transfer-encoding;
 bh=QKgJtsydda9Ani2XKZGqnJtka7WauNhBSfmvwZf3MNs=;
 b=GzKhG+SAL5Fjf7IsgQXvOql+EpqhFCfBHQmnMJLYXlmeiXB0LQ76n51BfduVEmobCm
 JV4IkdKqaxTveSufjgkmhl/En8dTGVMUQqey7Au7x0sw73f7DPVlDcRss23aadr59dpF
 VkewvhS+za4A1jMA4VNDu0ULw2uGYgbVjmP/BdM+n8sHr+G9fBj0k4N0/j6JgSfASUDF
 +LvcppddycV23wvrWBAWvZlL+CcC/yJUTTO0lQVrTICACcQwj0Iy/LexvAiY70liZ2BD
 glDkcx877I8h0axCBwQYDGDL6Ryr3gucbe4wOFVnBCvHUNNBnXJkjtvBxufFbJ+YgWAc
 k5Vw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=QKgJtsydda9Ani2XKZGqnJtka7WauNhBSfmvwZf3MNs=;
 b=GMim68bTa7VO6iRGN1O4A9rvdim1Bnzn+HtxdWa/rhJI1gZK6VqDfZmeYpixc0x5v4
 JtscC/VBOTfK7D6+gD1GBZJal/ajUn7rz2lAKOBsslDnu1fiveLVSyo1gasS3sQahGxq
 3Z9xO6skkYlSb6pGunq2Hx66KUNkrSLCqOvgKLh523K0kUHgJT44I+TL4OFg/Tf+UWzZ
 22mKT1M9IeZWJgUhqf7kw1ZvbyfDALynX3VXv5c1QKuWv1K4TnLUlROjmGJMT98CTr4q
 d5MOvsVL239mlWKUQocPK7wt4yy/M5bWz44JLpCj1f/T/Z2Xo29qdZw3f9dz2+HF2kNE
 V3UQ==
X-Gm-Message-State: AOAM532NTV3tXuchzrBx2GzyuZAXQGMkHcOK2bSYuOCd0wzwcsibeSBB
 YRu1Tg1Sp6cgC/UIS3A2LcWqqtcGyB660Q==
X-Google-Smtp-Source: ABdhPJx7iaA+4emXItdjxm0bTBhRk1Dl0B5AhW1NaNxvxXdFizP1YzM/lJNzre+7r2uQpcdXu2u9bw==
X-Received: by 2002:a05:620a:41a:: with SMTP id
 26mr10329225qkp.380.1633105446448; 
 Fri, 01 Oct 2021 09:24:06 -0700 (PDT)
Received: from [192.168.3.43] (c-67-174-166-185.hsd1.ga.comcast.net.
 [67.174.166.185])
 by smtp.gmail.com with ESMTPSA id f5sm3494574qtp.44.2021.10.01.09.24.05
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 01 Oct 2021 09:24:05 -0700 (PDT)
Subject: Re: [PATCH 1/3] hw/intc/arm_gicv3: Move checking of
 redist-region-count to arm_gicv3_common_realize
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20210930150842.3810-1-peter.maydell@linaro.org>
 <20210930150842.3810-2-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <3e7cdccf-4a14-0147-db18-381bf888d431@linaro.org>
Date: Fri, 1 Oct 2021 12:24:03 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20210930150842.3810-2-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::72a;
 envelope-from=richard.henderson@linaro.org; helo=mail-qk1-x72a.google.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.127,
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

On 9/30/21 11:08 AM, Peter Maydell wrote:
> The GICv3 devices have an array property redist-region-count.
> Currently we check this for errors (bad values) in
> gicv3_init_irqs_and_mmio(), just before we use it.  Move this error
> checking to the arm_gicv3_common_realize() function, where we
> sanity-check all of the other base-class properties. (This will
> always be before gicv3_init_irqs_and_mmio() is called, because
> that function is called in the subclass realize methods, after
> they have called the parent-class realize.)
> 
> The motivation for this refactor is:
>   * we would like to use the redist_region_count[] values in
>     arm_gicv3_common_realize() in a subsequent patch, so we need
>     to have already done the sanity-checking first
>   * this removes the only use of the Error** argument to
>     gicv3_init_irqs_and_mmio(), so we can remove some error-handling
>     boilerplate
> 
> Signed-off-by: Peter Maydell<peter.maydell@linaro.org>
> ---

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

