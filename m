Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 98D2421584B
	for <lists+qemu-devel@lfdr.de>; Mon,  6 Jul 2020 15:27:56 +0200 (CEST)
Received: from localhost ([::1]:39690 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jsRA3-0006g8-L6
	for lists+qemu-devel@lfdr.de; Mon, 06 Jul 2020 09:27:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40336)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1jsR8e-0004wy-9n
 for qemu-devel@nongnu.org; Mon, 06 Jul 2020 09:26:28 -0400
Received: from mail-oi1-x241.google.com ([2607:f8b0:4864:20::241]:44697)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1jsR8c-0001x8-Fm
 for qemu-devel@nongnu.org; Mon, 06 Jul 2020 09:26:27 -0400
Received: by mail-oi1-x241.google.com with SMTP id k6so28085149oij.11
 for <qemu-devel@nongnu.org>; Mon, 06 Jul 2020 06:26:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=dI7iGR8j79nXF1fHLhXYnMInOXr6Fnu4TxBy1OXRtH8=;
 b=g24oCQyyhfZv+eMNysyXj6HXkQ8TPHyubtg6jPjgDhYM6gMelPEfysawk1GwQi/qzZ
 zj6Jmb7QJPWz7CjC01/wWQNQN5IgKMncm4J3lDXlPj3oNAUwmKbtspopKgd+6DgWuNqC
 fNzKDeV8Amwoq3s5FZRYf9UB1OjY/ur3KLadRkLIBDuC1HGJIT5A46+rBb2C6rA3LiUL
 b1qyGbNac3bAcptqNuhVIU6ExRJuDFCj2aRp8ao247z6tkbcu7vE67CS39bGDHsXQCaz
 t5fLbZgGQqwNtc1JhB26ouiuu5dKRDzfd2li/ucCNQ4HjRK4neSdIADshUTlYiA18J16
 elNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=dI7iGR8j79nXF1fHLhXYnMInOXr6Fnu4TxBy1OXRtH8=;
 b=AYYj2PGo9iSSYMdVGWVLG48vteA2yKq7BfpE8ZYqHdwLZ1/uhnGQ7RojPRo/tdvTjT
 UKIbKLrcVIkFOE7CyHXw5EVDBYKrOyOYAPd2zr6vjRGSal1c3Zgmvq2QrjJ4O6yPJaEv
 lmEoPHQ6JePGqazITT2gPbbiECUd5TfmFPtqC8+VPMGToczk42nL/XMnwCYO3mOON/es
 g+edhCDMppxdK11WkxdG554lkAQ5sPrH/ZWiiDMx3dRYTRf5wLR57LqKuiVpVgNDMm/q
 Cwj/6pJ91w9iFDzwmkjoVCvQXsBrSMvyrDK9PNTP8tF1XSBem20je7+JV4f3jgb2yGLP
 YKsQ==
X-Gm-Message-State: AOAM531tjiFAjEDcWQa4dNBjNnu79rqo4cuLOoDzGPEs/R1YYx80ZYkq
 hpbYREP8F0G1tobUAAORvZa6sCoZ4b5v7kJufhQwNw==
X-Google-Smtp-Source: ABdhPJwUKJazEHPd3JJofcqGAEp4Fn5hzq+XXk/Zupz1rX4A3RtzzBLuLNTiNXbbzw3oUsnfYBUdUYs/x4lDRaOPJy4=
X-Received: by 2002:aca:54c9:: with SMTP id
 i192mr30035070oib.163.1594041984987; 
 Mon, 06 Jul 2020 06:26:24 -0700 (PDT)
MIME-Version: 1.0
References: <20200702152659.8522-1-eric.auger@redhat.com>
 <20200702152659.8522-5-eric.auger@redhat.com>
In-Reply-To: <20200702152659.8522-5-eric.auger@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 6 Jul 2020 14:26:13 +0100
Message-ID: <CAFEAcA9ipO0x1-7Zu2cm_q+LoKx17D02vsW1=Aks3nHyQzCpaw@mail.gmail.com>
Subject: Re: [PATCH v2 4/9] hw/arm/smmu: Simplify the IOTLB key format
To: Eric Auger <eric.auger@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::241;
 envelope-from=peter.maydell@linaro.org; helo=mail-oi1-x241.google.com
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

On Thu, 2 Jul 2020 at 16:27, Eric Auger <eric.auger@redhat.com> wrote:
>
> Instead of using a Jenkins hash function to generate
> the key let's just use a 64 bit unsigned integer that
> contains the asid and the 40 upper bits of the iova.
> A maximum of 52-bit IOVA is supported. This change in the
> key format also prepares for the addition of new fields
> in subsequent patches (granule and level).
>
> Signed-off-by: Eric Auger <eric.auger@redhat.com>

> diff --git a/hw/arm/smmu-common.c b/hw/arm/smmu-common.c
> index 7dc8541e8b..5e85e30bdf 100644
> --- a/hw/arm/smmu-common.c
> +++ b/hw/arm/smmu-common.c
> @@ -34,34 +34,17 @@
>
>  static guint smmu_iotlb_key_hash(gconstpointer v)
>  {
> -    SMMUIOTLBKey *key = (SMMUIOTLBKey *)v;
> -    uint32_t a, b, c;
> -
> -    /* Jenkins hash */
> -    a = b = c = JHASH_INITVAL + sizeof(*key);
> -    a += key->asid;
> -    b += extract64(key->iova, 0, 32);
> -    c += extract64(key->iova, 32, 32);
> -
> -    __jhash_mix(a, b, c);
> -    __jhash_final(a, b, c);
> -
> -    return c;
> +    return (guint)*(const uint64_t *)v;
>  }

So the hash value is now going to be the lower 32
bits of the key, which is to say bits [40,12] of the IOVA,
and won't include the ASID at all. Isn't that going to
result in more hash collisions than would be ideal?

I was going to suggest using the glib builtin g_int64_hash()
instead, but looking at the source that seems to be the
identical implementation to this one. I guess that's
intended for cases where an integer key is really a
random integer, not one where it's got internal structure
of different bit fields within it being for different
purposes.

thanks
-- PMM

