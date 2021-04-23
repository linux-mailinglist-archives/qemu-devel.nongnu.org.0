Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7445A3692B4
	for <lists+qemu-devel@lfdr.de>; Fri, 23 Apr 2021 15:08:00 +0200 (CEST)
Received: from localhost ([::1]:59766 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lZvXL-0002Ua-Hy
	for lists+qemu-devel@lfdr.de; Fri, 23 Apr 2021 09:07:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58204)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lZvRv-0006fj-Fj
 for qemu-devel@nongnu.org; Fri, 23 Apr 2021 09:02:23 -0400
Received: from mail-ej1-x62c.google.com ([2a00:1450:4864:20::62c]:40780)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lZvRp-0000p0-50
 for qemu-devel@nongnu.org; Fri, 23 Apr 2021 09:02:22 -0400
Received: by mail-ej1-x62c.google.com with SMTP id n2so73762467ejy.7
 for <qemu-devel@nongnu.org>; Fri, 23 Apr 2021 06:02:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Wb1j8l6LGbZHTfjRhBuMfHhsp6vsG5M05FgAB4TDGpM=;
 b=lVQsi9RByqF56nDqXm7DU8UczfFsEExOPnapwluJNWAr5AW5dM1IZa8+500spguMhb
 fzTp8Ni/TvGVMJB/gxHF/nEZCVUncE2JNsA2qhT/Hl/LlvLTqeNg0vlfr9uY8Bb4m6oD
 LIkYA1veiC6BAuJVy4Hwn9+KeV0od3o3g0J6JC4LNVSDmxLDO4oquICj7jMCytFss5KA
 KjoPhJ1XlPxmu1+txMMg/lzoWgsBpHUd7vReKfYBDKbKpPgnFHYo6BkSeN0XpgUYDjmp
 IHAq1H8VHhNsdl+aApxGC2gmImol1DPDCpiQ3h/CTBPPg6shblKnk1uxFeX5e++vWj1C
 yjWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Wb1j8l6LGbZHTfjRhBuMfHhsp6vsG5M05FgAB4TDGpM=;
 b=cNowctnlYz7NM2VcZhW4JWb/bgF8kcgs646ymtPrdo3AWBDaa+dZnTI+DFHTeEjsfP
 wyij36t/pkAiGubf+nC0piAdjE+E0OTKWMEiIIzVXb66wmZ//A5X6eHR7S2HIMDNxCyV
 89LXE39tlCV+ROOmsE3EeHua9a9gUB0RkKVy/4G7caSfMNpHur13XjLxKVP7gvpSDN5t
 aHxfPkn5OVfkJQaDW2tb1hXI5l04DIN7My2aTWPLmUdM3+km/nlNbxKfur4yZeZNkFh2
 TGpZrf+lBtvmtERLO1JrXBuKQaJfbqlz0xyd2e7wnzFsCag71c6xQXzuW9XIaOTjNni3
 maOQ==
X-Gm-Message-State: AOAM5305EAgv+abUDa/wrPj/Nvrbk05pwVxxX6pwNrbI2uwpX96Vc/ft
 7yKllfLPFeo/PvL+zDN2JCbBgiZKngX3Qj2kvZ9DdQ==
X-Google-Smtp-Source: ABdhPJwX73sNBtLbn7QV+MWrnWg0GL+p12KOmyfX6+xHKwU9Pzz6wKcE6Ct/IKQ3CVr8s15+4X/ecessiwTU4kRhxSo=
X-Received: by 2002:a17:906:29ca:: with SMTP id
 y10mr4215101eje.250.1619182934842; 
 Fri, 23 Apr 2021 06:02:14 -0700 (PDT)
MIME-Version: 1.0
References: <20210422222429.183108-1-mst@redhat.com>
 <20210422222429.183108-2-mst@redhat.com>
In-Reply-To: <20210422222429.183108-2-mst@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 23 Apr 2021 14:01:19 +0100
Message-ID: <CAFEAcA9LLh7kkqujLpiXjRgRkua77kLAv=MbeG8yq3NP-w8uyg@mail.gmail.com>
Subject: Re: [PULL 1/2] amd_iommu: Fix pte_override_page_mask()
To: "Michael S. Tsirkin" <mst@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::62c;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x62c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
Cc: Jean-Philippe Brucker <jean-philippe@linaro.org>,
 Eduardo Habkost <ehabkost@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 QEMU Developers <qemu-devel@nongnu.org>, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, 22 Apr 2021 at 23:24, Michael S. Tsirkin <mst@redhat.com> wrote:
>
> From: Jean-Philippe Brucker <jean-philippe@linaro.org>
>
> AMD IOMMU PTEs have a special mode allowing to specify an arbitrary page
> size. Quoting the AMD IOMMU specification: "When the Next Level bits [of
> a pte] are 7h, the size of the page is determined by the first zero bit
> in the page address, starting from bit 12."
>
> So if the lowest bits of the page address is 0, the page is 8kB. If the
> lowest bits are 011, the page is 32kB. Currently pte_override_page_mask()
> doesn't compute the right value for this page size and amdvi_translate()
> can return the wrong guest-physical address. With a Linux guest, DMA
> from SATA devices accesses the wrong memory and causes probe failure:
>
> qemu-system-x86_64 ... -device amd-iommu -drive id=hd1,file=foo.bin,if=none \
>                 -device ahci,id=ahci -device ide-hd,drive=hd1,bus=ahci.0
> [    6.613093] ata1.00: qc timeout (cmd 0xec)
> [    6.615062] ata1.00: failed to IDENTIFY (I/O error, err_mask=0x4)
>
> Fix the page mask.
>
> Signed-off-by: Jean-Philippe Brucker <jean-philippe@linaro.org>
> Message-Id: <20210421084007.1190546-1-jean-philippe@linaro.org>
> Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
> Signed-off-by: Michael S. Tsirkin <mst@redhat.com>

Jean-Philippe, do you know if this is a regression since 5.2?
I'm guessing not given that the function in question has been that
way since the amd_iommu was introduced in 2016.

thanks
-- PMM

