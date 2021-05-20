Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BA94038B391
	for <lists+qemu-devel@lfdr.de>; Thu, 20 May 2021 17:48:28 +0200 (CEST)
Received: from localhost ([::1]:51964 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ljkuR-0001Ir-Ha
	for lists+qemu-devel@lfdr.de; Thu, 20 May 2021 11:48:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53262)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ljkrP-0007vs-Dc
 for qemu-devel@nongnu.org; Thu, 20 May 2021 11:45:19 -0400
Received: from mail-ej1-x62b.google.com ([2a00:1450:4864:20::62b]:38642)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ljkrN-00088P-R2
 for qemu-devel@nongnu.org; Thu, 20 May 2021 11:45:19 -0400
Received: by mail-ej1-x62b.google.com with SMTP id i7so8214912ejc.5
 for <qemu-devel@nongnu.org>; Thu, 20 May 2021 08:45:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=I6O8/L3ylxIpnQe9NkcAetgPjV6Xg3rsE+K/q/jQeh0=;
 b=W6ZmMg9qp+HDBXl8qWCRbf33Z0Zr/BeDF3LoknVn+sRmccnBbXG02UJGeAd1uRedVp
 quVN+N1t8bxON2jhn0dQH4eq70IYOGN+YhNZyWiYOd0GbHlcfJr+LrF0GAMYKoRuJvKW
 qkJABAqEHWqtEGXuQWMcGRoTv3aqAuNDCIuLKZ/9YfIwXJ4AFstIRNm6ZYax3HN6+nQQ
 QaK9ZRYBSnyKT7pF4zUw7hm6vry/cE7rlZzlwcXe+58wK6THCLm4GGmkOnsDvKBK1gQl
 wbxUmNNJnqSIPAItOrgthFehwLMqmTBdV/dCUM3/ZYp2lusLw+U252cocdhtvvSVKFZl
 zqcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=I6O8/L3ylxIpnQe9NkcAetgPjV6Xg3rsE+K/q/jQeh0=;
 b=G0WjGGUYwtzBlOiKJWEzyKFpZHdYUklM+ieE+MKcQIWtnOF1bstLxtE/ALujz3EdYP
 Pi3W2zhh/S/LbUnWM5wlntJNlYiHeF3S1Oiae9JYnhqhBgM1M81XvbetMSaNX+OybGxG
 BD35718U0kQK+DJ1q1YeuHQ3vTEYk2ywMxblN/YPEnkf+bbs7Vr1FC0orw9h5kz9E432
 D4zstuqAM4ybEoVMOU+eeQJJBJYuBXRr3gUyGzw4UH4SFo75SHoHsBmIGdABLweAg62K
 0dHKPVhUsLdOpjj5wKEbg9XDpZbF5134IAt4dCfIFks/KA+UAYveJHl9i1RbXQ5SWpam
 ibXA==
X-Gm-Message-State: AOAM5328GfkAwNcyKtO1QsEASes6L5tEfsh87qT2L+ZCGeUL1r7HqMuJ
 NzF/tazm/mfdcZEoLsAzWZWuu3zZ/tLvxU9qGJBAnA==
X-Google-Smtp-Source: ABdhPJyf5Iko/ZSQaNMbFugR2NCllk+1Pd5+ZGQ4nC1zryiiGaR+LQkKOESD1BKQ4oCHQmvozhUlvp7Cs9NxAUKJmgI=
X-Received: by 2002:a17:906:d8cb:: with SMTP id
 re11mr5364132ejb.482.1621525516235; 
 Thu, 20 May 2021 08:45:16 -0700 (PDT)
MIME-Version: 1.0
References: <20210510124747.780877-1-eric.auger@redhat.com>
In-Reply-To: <20210510124747.780877-1-eric.auger@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 20 May 2021 16:44:57 +0100
Message-ID: <CAFEAcA88KZSL6V5c7PmRSKvcT38OghVH_sRHgXddJOZ2HdPUsQ@mail.gmail.com>
Subject: Re: [PATCH v2] hw/arm/smmuv3: Another range invalidation fix
To: Eric Auger <eric.auger@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::62b;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x62b.google.com
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
Cc: Kunkun Jiang <jiangkunkun@huawei.com>,
 QEMU Developers <qemu-devel@nongnu.org>, Peter Xu <peterx@redhat.com>,
 qemu-arm <qemu-arm@nongnu.org>,
 Shameerali Kolothum Thodi <shameerali.kolothum.thodi@huawei.com>,
 Eric Auger <eric.auger.pro@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, 10 May 2021 at 13:48, Eric Auger <eric.auger@redhat.com> wrote:
>
> 6d9cd115b9 ("hw/arm/smmuv3: Enforce invalidation on a power of two range")
> failed to completely fix misalignment issues with range
> invalidation. For instance invalidations patterns like "invalidate 32
> 4kB pages starting from 0xff395000 are not correctly handled" due
> to the fact the previous fix only made sure the number of invalidated
> pages were a power of 2 but did not properly handle the start
> address was not aligned with the range. This can be noticed when
> boothing a fedora 33 with protected virtio-blk-pci.
>
> Signed-off-by: Eric Auger <eric.auger@redhat.com>
> Fixes: 6d9cd115b9 ("hw/arm/smmuv3: Enforce invalidation on a power of two range")
>
> ---



Applied to target-arm.next, thanks.

-- PMM

