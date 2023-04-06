Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C3B86D9D7B
	for <lists+qemu-devel@lfdr.de>; Thu,  6 Apr 2023 18:24:14 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pkSO1-00034M-Ds; Thu, 06 Apr 2023 12:22:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pkSNy-00033v-WA
 for qemu-devel@nongnu.org; Thu, 06 Apr 2023 12:22:55 -0400
Received: from mail-ej1-x635.google.com ([2a00:1450:4864:20::635])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pkSNx-0001k9-CQ
 for qemu-devel@nongnu.org; Thu, 06 Apr 2023 12:22:54 -0400
Received: by mail-ej1-x635.google.com with SMTP id
 a640c23a62f3a-93df929479cso152002266b.3
 for <qemu-devel@nongnu.org>; Thu, 06 Apr 2023 09:22:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1680798171; x=1683390171;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=nFi19MjAm6lWHl4XWvanxq5l7mLIck/V3pTDAJaTYfQ=;
 b=XT/155ttWoJu1MBXxKy9L/y9ijB3582/fVZKhx4/47WR+bKW46u5b9BrSGVG4lK/hi
 B6F3Qa0T2EbnnQi03xNlJ1DL7v6O/ORvMlpjJUV8tB4Zb8slgofI08zVolqaagGuneKy
 z2WRO4GqGA+rUUyH9wRgyiaE8LWAM0JXJJyNNC138ntdi/3f1BPfw0bv2gANBtkbJ0AG
 /9ah7MJVQgTxdX9AyZr0LSP9CpK92kAbvYeZexCNuKCdcHyNp27ALw59Ejpr2XNmQ5eu
 S7vNtgddL9mW7M5cfeMCDdxJvjpcCJlvaV0orsAbL5pFKkLjcTdCuN8fSJR3YM8YZCzE
 Aq8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680798171; x=1683390171;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=nFi19MjAm6lWHl4XWvanxq5l7mLIck/V3pTDAJaTYfQ=;
 b=RIM0kSUmymEzs188UmzTejoo/N2WueZ7vHpMMJO4fzFhv4V8InaLbWMrgFiJxrgjdt
 P4kW3TtBkOgEVDmf34po/tBrGdsCT6e+c8rMEE4kZVgBStFdgHip0oaKwOsX2SmcPXrA
 LzaYrmKEdJrBtCjLCSEQ2SbPkWj1Zlz+/p3oMhzCRj2E9c/iPs9KJAX9guaZjxd8Wi0L
 ZRrPPoa4tY0DWHvFLLnvWaXaoeoQbqY/+UsEculwtHng6zuiDnEH/Y8tv9SkqeRWbQ9r
 EKIs8gAyNpDwCp0FHA6b7/+luYog4Opd+LfWKn8LtJbMH6RDDe+HFOwjlgqtNumhbZBM
 nYhg==
X-Gm-Message-State: AAQBX9e7QTjrelT+aPB11362W6aiDoVMfaueY5B52JuA/qgrt2E0O9/G
 fEB0K3se5vrMai6JheTFh4nKxoKSGf+N+iOqCN7VVQ==
X-Google-Smtp-Source: AKy350bKTweNcggXz7oH2Eg1gL33YHKwY5K8wmJAiWX9v4wZW2wBhB2aHQ6YEhG02F2jhu7BoY5bzgwqDSsoUV/YI5U=
X-Received: by 2002:a50:9ece:0:b0:504:645c:6ca5 with SMTP id
 a72-20020a509ece000000b00504645c6ca5mr59386edf.6.1680798171567; Thu, 06 Apr
 2023 09:22:51 -0700 (PDT)
MIME-Version: 1.0
References: <20221107224600.934080-1-mst@redhat.com>
 <20221107224600.934080-75-mst@redhat.com>
In-Reply-To: <20221107224600.934080-75-mst@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 6 Apr 2023 17:22:40 +0100
Message-ID: <CAFEAcA9-wRruE7Qf9d_AcD+yQiwmf1yQMnUJgOeEiC1FvOa+gg@mail.gmail.com>
Subject: Re: [PULL v4 74/83] intel-iommu: PASID support
To: "Michael S. Tsirkin" <mst@redhat.com>
Cc: qemu-devel@nongnu.org, Jason Wang <jasowang@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::635;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x635.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

On Mon, 7 Nov 2022 at 22:53, Michael S. Tsirkin <mst@redhat.com> wrote:
>
> From: Jason Wang <jasowang@redhat.com>
>
> This patch introduce ECAP_PASID via "x-pasid-mode".

Hi; Coverity points out an issue with this code (CID 1508100):

> -static guint vtd_uint64_hash(gconstpointer v)
> +static guint vtd_iotlb_hash(gconstpointer v)
>  {
> -    return (guint)*(const uint64_t *)v;
> +    const struct vtd_iotlb_key *key = v;
> +
> +    return key->gfn | ((key->sid) << VTD_IOTLB_SID_SHIFT) |

key->sid is a uint16_t, and VTD_IOTLB_SID_SHIFT is 20. That
means that the shift will be done as a signed 32 bit operation,
losing the top 4 bits of key->sid; then it will get sign
extended to 64 bits, so if bit 11 of key->sid is 1 then
we will end up with 1 bits in 63..32 of the output hash value.
This seems unlikely to be what was intended.

> +           (key->level) << VTD_IOTLB_LVL_SHIFT |
> +           (key->pasid) << VTD_IOTLB_PASID_SHIFT;
>  }

Also, VTD_IOTLB_LVL_SHIFT is only 28, so either the
shift values are wrong or the type of key->sid is wrong:
can there be 8 bits here, or 16 ?

Since PASID_SHIFT is 30, if key->pasid can be more than
2 bits wide we'll lose most of it.

If key->level will fit into 2 bits as the SHIFT values
suggest, vtd_iotlb_key could probably use a uint8_t for it,
which would let that struct fit into 16 bytes rather than 18.

> @@ -302,13 +321,6 @@ static void vtd_reset_caches(IntelIOMMUState *s)
>      vtd_iommu_unlock(s);
>  }
>
> -static uint64_t vtd_get_iotlb_key(uint64_t gfn, uint16_t source_id,
> -                                  uint32_t level)
> -{
> -    return gfn | ((uint64_t)(source_id) << VTD_IOTLB_SID_SHIFT) |
> -           ((uint64_t)(level) << VTD_IOTLB_LVL_SHIFT);
> -}

In the old code you can see that we did casts to uint64_t in order
to ensure that all the arithmetic was done as unsigned 64 bits.

thanks
-- PMM

