Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 008ED20A185
	for <lists+qemu-devel@lfdr.de>; Thu, 25 Jun 2020 17:05:31 +0200 (CEST)
Received: from localhost ([::1]:43684 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1joTRS-0003xN-1M
	for lists+qemu-devel@lfdr.de; Thu, 25 Jun 2020 11:05:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59754)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1joTPX-0002Jw-Bj
 for qemu-devel@nongnu.org; Thu, 25 Jun 2020 11:03:31 -0400
Received: from mail-ot1-x341.google.com ([2607:f8b0:4864:20::341]:36910)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1joTPV-0000GE-C2
 for qemu-devel@nongnu.org; Thu, 25 Jun 2020 11:03:30 -0400
Received: by mail-ot1-x341.google.com with SMTP id v13so5549470otp.4
 for <qemu-devel@nongnu.org>; Thu, 25 Jun 2020 08:03:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=HTb+xpKiag52nCtXX03TGGS5qGkDtFzSLzjCAHkQg6k=;
 b=xvIew33VqOP1FxolMSvdkdM2Chf0vi7WcrF9CuxJOJrXw5aNWLhvqetgkv3gPS7R67
 8nqhp6sHda7CCY4qYRT0etgcus1Qo8Nu1fg9ohVpsAiZO7E9uJkcSPo6mpq01OClFRTn
 Xex0nGkUCwkouDmZE89V/HoUbEsMOLk1bzGDGS1BXRU/wflRKaF4TB4za8AXQk5GNxrF
 qctBSj6icN87B/ZEp8+9z/hKzTouI/s0wepmXsdvRfYmtvj0AaSnr3FSB3+0i2oZvHOM
 C75aaWrEc5CcpHMLaSP35Ay5wfQmBg3LXd2QVpOEd/AEisdcw42A4DuePHAxJ87HzFfO
 L1dg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=HTb+xpKiag52nCtXX03TGGS5qGkDtFzSLzjCAHkQg6k=;
 b=BkFN8Tn6zwRRdnCmDEGnE+qCxrr0rcdeDlokNfp72Kw1N/VrsvynU8DSPekFXkP3X/
 VMOnkVb9EMlbTsIL2t3g+j84fbQm96ERpMzVQkSvqgNWr62KcDqprO+mkxsSOi2AOHbP
 tjvDfACKv3WmQ7kgkwB21032Fva2CXS5xRxYXj/OZfALammXGTiTWQLOVHB7RsGCeUNw
 7PaLem2KVMXofhX1iM17s25yeI9Z+R3blCadaHtcVHOkIYIGLZXbTCtkMBhtpj3o/+qh
 Seaiaordu4F93Oh7zFbv3P8OJf66jDCp107n4fe3e/WBWwwrq5pOz9JCIAUvcUZEGETQ
 CRqw==
X-Gm-Message-State: AOAM533FDWQsUL3D8JV6OHQgVY8rHMXeT4LWbLo5F9GUS8/NKqLhQLMR
 s3vUvXBBiDh23symPWvPoGloNOnYxGu+CQv8kpS8hA==
X-Google-Smtp-Source: ABdhPJwtk5bLyw/xFaVuYwC2QMeHMbPS+FKCvUjug6WOVXVnffuij4/sIq+dSB71qsv2X4c7RSHAWhFr2Sy0vrQpetY=
X-Received: by 2002:a9d:5786:: with SMTP id q6mr13299082oth.135.1593097408039; 
 Thu, 25 Jun 2020 08:03:28 -0700 (PDT)
MIME-Version: 1.0
References: <20200611161500.23580-1-eric.auger@redhat.com>
 <20200611161500.23580-4-eric.auger@redhat.com>
In-Reply-To: <20200611161500.23580-4-eric.auger@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 25 Jun 2020 16:03:17 +0100
Message-ID: <CAFEAcA-+eFh7q5-gQwTWxMCSV38ErwB-GZoigW+_sP-=Pmp1kw@mail.gmail.com>
Subject: Re: [PATCH RESEND 3/9] hw/arm/smmu: Simplify the IOTLB key format
To: Eric Auger <eric.auger@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::341;
 envelope-from=peter.maydell@linaro.org; helo=mail-ot1-x341.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=_AUTOLEARN
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
 "Michael S. Tsirkin" <mst@redhat.com>, Robin Murphy <robin.murphy@arm.com>,
 zhangfei.gao@foxmail.com, QEMU Developers <qemu-devel@nongnu.org>,
 Peter Xu <peterx@redhat.com>, qemu-arm <qemu-arm@nongnu.org>,
 Shameerali Kolothum Thodi <shameerali.kolothum.thodi@huawei.com>,
 Will Deacon <will@kernel.org>, Rob Herring <robh@kernel.org>,
 Eric Auger <eric.auger.pro@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, 11 Jun 2020 at 17:15, Eric Auger <eric.auger@redhat.com> wrote:
>
> Instead of using a Jenkins hash function to generate
> the key let's just use a 64 bit unsigned integer that
> contains the asid and the 40 upper bits of the iova.
> A maximum of 52-bit IOVA is supported. This change in the
> key format also prepares for the addition of new fields
> in subsequent patches (granule and level).
>
> Signed-off-by: Eric Auger <eric.auger@redhat.com>

> diff --git a/include/hw/arm/smmu-common.h b/include/hw/arm/smmu-common.h
> index 1dceec5cb1..7b9d2f0eb7 100644
> --- a/include/hw/arm/smmu-common.h
> +++ b/include/hw/arm/smmu-common.h
> @@ -88,11 +88,6 @@ typedef struct SMMUPciBus {
>      SMMUDevice   *pbdev[]; /* Parent array is sparse, so dynamically alloc */
>  } SMMUPciBus;
>
> -typedef struct SMMUIOTLBKey {
> -    uint64_t iova;
> -    uint16_t asid;
> -} SMMUIOTLBKey;

I think we should keep the SMMUIOTLBKey type to abstract out what
the key type is under the hood, so it would now be
 typedef uint64_t SMMUIOTLBKey;

(and then the code that works with SMMUIOTLBKeys should never
directly look at it as a uint64_t. If you wanted you could
put the abstraction layer into place with the existing
SMMUIOTLBKey type and then change the type in a second patch.)

> +uint64_t smmu_get_iotlb_key(uint16_t asid, uint64_t iova);

This should return SMMUIOTLBKey rather than uint64_t,
or pass in the pointer, like:
   smmu_get_iotlb_key(SMMUIOTLBKey *key, uint16_t asid, uint64_t iova);

thanks
-- PMM

