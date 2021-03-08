Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CC627331389
	for <lists+qemu-devel@lfdr.de>; Mon,  8 Mar 2021 17:36:44 +0100 (CET)
Received: from localhost ([::1]:42708 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lJIs7-0003If-ED
	for lists+qemu-devel@lfdr.de; Mon, 08 Mar 2021 11:36:43 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:40008)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lJIq5-0002ik-5r
 for qemu-devel@nongnu.org; Mon, 08 Mar 2021 11:34:37 -0500
Received: from mail-ed1-x52f.google.com ([2a00:1450:4864:20::52f]:47034)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lJIq1-0007f9-60
 for qemu-devel@nongnu.org; Mon, 08 Mar 2021 11:34:35 -0500
Received: by mail-ed1-x52f.google.com with SMTP id w9so15580622edt.13
 for <qemu-devel@nongnu.org>; Mon, 08 Mar 2021 08:34:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=IIr3RAE/2BvT/PHAdnb5qTM7sWGGmSdWUSjARFmD1hM=;
 b=FTqsbXQ8DaB1B8amUc4lzbMK5fQlWmjJrmEg1RI9bvo9r5RMgoaRu3c6AfVFYdzDSN
 6LbnkB3UV/YXA5bAGtvkZAyvLCw3YSvu6HhPjVsWtRTxTseftfufigzIvWEWE1pf72DQ
 xULIr0OBuLBWgv1EfsVpd8ScbsEr7GLIPlfTKQRdObnhPL/CRmY9Fn6C02gYpkzQPFAo
 3YaFf2SaUnHNwxQJcgk8KiAGUP6C7e+86GUr0mR4qBb7N+mAk5iLfa9XzonWkU9GA+ZC
 VFqH+yB8lQeg0UFCObmzpaDGbwiA1WMDYX+lYRZ4w4qPYrKLJjOXyMewooU99N22oECg
 U0Iw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=IIr3RAE/2BvT/PHAdnb5qTM7sWGGmSdWUSjARFmD1hM=;
 b=pS8kVAg6j4bF1DqAz+2vbbnUNU/EUABMSunvxNAIMjjATmgXpYyWflTxUuirjVOErK
 sUTzxUgI+UCry8Cn6NGZPh1U7Jg8vkgp21z1wbPoXWcQpUDjNvxQqNDSCosn2CW7M81v
 g4B8gTycEk3gVovpfWZYPKEvZDUXASG37dFB8+70PRngh/B0iiFoQUNKP3HZV1GqDpNl
 uFelEwDa7hg88d0qK5JzMhUwJh9Cik1ArYufjDQmT+aBvqvfZz+bbbTXLeKa/vhQYOmy
 0QrsJgPPdDZeuTEdzK9w4rX7CoqfiWCuEJnqzZQV/FVzide+sGLU16uLCwvUZPz4FEjz
 eZFA==
X-Gm-Message-State: AOAM531ffBr6JOBGYxkYjJ/NLTETnaxIP2zhQY+QnGHOMqmzz1pcV2Vz
 i4j++WrrRX+FPrSGqGItLFe7aEB3ZPtejDgIPng9mA==
X-Google-Smtp-Source: ABdhPJzP2QDkxpL1uerhNOOVoYv3wy/qJEpn3CIsyzbDQAQ4/xHdr9Ry1YQgvp6nGW8GWiuN3+cFo4U8UppeQWg9AMU=
X-Received: by 2002:a05:6402:19a:: with SMTP id
 r26mr9735123edv.44.1615221271714; 
 Mon, 08 Mar 2021 08:34:31 -0800 (PST)
MIME-Version: 1.0
References: <20210225091435.644762-1-eric.auger@redhat.com>
 <20210225091435.644762-3-eric.auger@redhat.com>
In-Reply-To: <20210225091435.644762-3-eric.auger@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 8 Mar 2021 16:34:15 +0000
Message-ID: <CAFEAcA_0YjoSF9BxLxhe_YrZWSQPMxXRtnYL_w1SRc7_iuyS1Q@mail.gmail.com>
Subject: Re: [PATCH v2 2/7] dma: Introduce dma_aligned_pow2_mask()
To: Eric Auger <eric.auger@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::52f;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x52f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
Cc: Jean-Philippe Brucker <jean-philippe@linaro.org>,
 Jason Wang <jasowang@redhat.com>, QEMU Developers <qemu-devel@nongnu.org>,
 Peter Xu <peterx@redhat.com>, vivek.gautam@arm.com,
 qemu-arm <qemu-arm@nongnu.org>,
 Shameerali Kolothum Thodi <shameerali.kolothum.thodi@huawei.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Eric Auger <eric.auger.pro@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, 25 Feb 2021 at 09:15, Eric Auger <eric.auger@redhat.com> wrote:
>
> Currently get_naturally_aligned_size() is used by the intel iommu
> to compute the maximum invalidation range based on @size which is
> a power of 2 while being aligned with the @start address and less
> than the maximum range defined by @gaw.
>
> This helper is also useful for other iommu devices (virtio-iommu,
> SMMUv3) to make sure IOMMU UNMAP notifiers only are called with
> power of 2 range sizes.
>
> Let's move this latter into dma-helpers.c and rename it into
> dma_aligned_pow2_mask(). Also rewrite the helper so that it
> accomodates UINT64_MAX values for the size mask and max mask.
> It now returns a mask instead of a size. Change the caller.
>
> Signed-off-by: Eric Auger <eric.auger@redhat.com>
> diff --git a/include/sysemu/dma.h b/include/sysemu/dma.h
> index a052f7bca3..2acb303be2 100644
> --- a/include/sysemu/dma.h
> +++ b/include/sysemu/dma.h
> @@ -296,4 +296,7 @@ uint64_t dma_buf_write(uint8_t *ptr, int32_t len, QEMUSGList *sg);
>  void dma_acct_start(BlockBackend *blk, BlockAcctCookie *cookie,
>                      QEMUSGList *sg, enum BlockAcctType type);
>
> +uint64_t dma_aligned_pow2_mask(uint64_t start, uint64_t end,
> +                               int max_addr_bits);

All new globally-visible functions in header files should have
a doc-comment describing what they do, please.

thanks
-- PMM

