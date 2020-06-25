Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F0FEB20A281
	for <lists+qemu-devel@lfdr.de>; Thu, 25 Jun 2020 17:59:24 +0200 (CEST)
Received: from localhost ([::1]:38060 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1joUHb-0002Sx-Uq
	for lists+qemu-devel@lfdr.de; Thu, 25 Jun 2020 11:59:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42472)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1joTzm-0006tW-Rn
 for qemu-devel@nongnu.org; Thu, 25 Jun 2020 11:40:58 -0400
Received: from mail-oi1-x241.google.com ([2607:f8b0:4864:20::241]:45248)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1joTzi-0007hO-NR
 for qemu-devel@nongnu.org; Thu, 25 Jun 2020 11:40:57 -0400
Received: by mail-oi1-x241.google.com with SMTP id j11so2670996oiw.12
 for <qemu-devel@nongnu.org>; Thu, 25 Jun 2020 08:40:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=j1+9KBEaRzm4TeFuO1bVsSq74JUEaurxKIpcJCn6dw4=;
 b=WK4zy9hJQp35ndWDYM0/27V2csOrtLs4mYbpVLE+41beTptee2FF0fRkVKDnZ5F6ej
 KspTUp6Jh7qj8xvyJqNME4kPpRepJFjsApDIKFdLzW/RdXEf34nZeeScJLiXEed3b7Oe
 9I4WB1ASDGdfjiO6+f83MCYWrRLzm0+J+vOMQJp+Wr/HRz4rfhFfE+ChmqaCAQK3hJym
 JlOTdMclem5PElZ4H//Xe9IXD6HgVAN6ICRICs7eyqw4BgglNikRwZ0n20khb0wDbBzV
 fVKHI4ojILyeT+OYGdZ5wOZ0m0cbfq+MtPlNiwIGD5Chez41zZDd8iNYSQUmIe+Yqdce
 hYmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=j1+9KBEaRzm4TeFuO1bVsSq74JUEaurxKIpcJCn6dw4=;
 b=ruMUTo3X9Za4OSOvyh//vR3msOynxmd3glicB1C3RTrcFz9Tn60Km/vq5ACMAkLo8a
 eq6k/bNHIzH3ygkG4FJwGFzTaM8OQKQF1OAZL7udcJDx3uAuMcAw/Ft17yyjzTKtw0kq
 5ITzt7WRQM9hMvoZqqKz1/4u+nJXVkjZhGWkUW3ZbUu+cp6gS7TqZf1fT6xbwxvylYsa
 Se0QvHcrtvFQBICaJ5ZIlP4p/AVhhzcGu24Y6fHlEn4T3pYZaUzm6PUUIFhKBX7pBBY1
 LL1gV5h4FoV7alnt72z6rdaep2YRksNsjZhX6Wxueuy3VjiPNx+DhseNJJe28Gb55y3R
 HOvQ==
X-Gm-Message-State: AOAM530RO+L/3EgXRIdyA9j22e6odNsM4e6KV0UTqJKGUDGdb1gn9EP5
 rJOp/i46zKVOgC5seknTmSs7AkcBeFegr2ZkEEfYmA==
X-Google-Smtp-Source: ABdhPJzwCvexVpIKOqDhSwfH/vNPAG7MjbcLivagFCXd3udxaZBdZi/Xyd9ocUhT3Ibg5Azl2lM4Oxx6zQNi7zuoyL0=
X-Received: by 2002:aca:568c:: with SMTP id k134mr2564833oib.48.1593099651936; 
 Thu, 25 Jun 2020 08:40:51 -0700 (PDT)
MIME-Version: 1.0
References: <20200611161500.23580-1-eric.auger@redhat.com>
 <20200611161500.23580-10-eric.auger@redhat.com>
In-Reply-To: <20200611161500.23580-10-eric.auger@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 25 Jun 2020 16:40:41 +0100
Message-ID: <CAFEAcA9ji9Xa5WTOwio0hcgW1ZHoD3O-TaehCBvQEb+Tn-tnXA@mail.gmail.com>
Subject: Re: [PATCH RESEND 9/9] hw/arm/smmuv3: Advertise SMMUv3.2 range
 invalidation
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

On Thu, 11 Jun 2020 at 17:16, Eric Auger <eric.auger@redhat.com> wrote:
>
> Expose the RIL bit so that the guest driver uses range
> invalidation.
>
> Signed-off-by: Eric Auger <eric.auger@redhat.com>
> ---
>  hw/arm/smmuv3-internal.h | 1 +
>  hw/arm/smmuv3.c          | 2 ++
>  2 files changed, 3 insertions(+)

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

