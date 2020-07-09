Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A311321A205
	for <lists+qemu-devel@lfdr.de>; Thu,  9 Jul 2020 16:22:40 +0200 (CEST)
Received: from localhost ([::1]:40802 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jtXRf-0005TC-Nj
	for lists+qemu-devel@lfdr.de; Thu, 09 Jul 2020 10:22:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52644)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1jtXNm-0007pD-Ck
 for qemu-devel@nongnu.org; Thu, 09 Jul 2020 10:18:38 -0400
Received: from mail-oi1-x241.google.com ([2607:f8b0:4864:20::241]:37864)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1jtXNk-0001wl-Pw
 for qemu-devel@nongnu.org; Thu, 09 Jul 2020 10:18:38 -0400
Received: by mail-oi1-x241.google.com with SMTP id 12so2002521oir.4
 for <qemu-devel@nongnu.org>; Thu, 09 Jul 2020 07:18:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=SjSf6hCBtUL97Io9jvyEFUHtBwR9Elv/asoVkUIeEx4=;
 b=FoxwY+uGGxQ04XDEwhyX0idakgKDHz3CfN6Y3gPRg/9mTc7lppZ+XkakxaAhlqz3Xz
 +GCnvOFXHVlFMIsdRV9/4mJo5QXOzFACXB0URygfmxErVryqi2+a3np4GUXcPyNvwS9I
 /fC8TZuwFxkKA3cJ4Ka/VZNiHdd+2vmV7XMc/VAzLHQtgrGYFbfjZNpfuEPI/ytug962
 zrzYGuhjjB4aKXIUJ6tA2ahiBT0FDvPkiRPtaYzgEfQ/IQ4a5TTr5RyzcLBEz/ee7f2d
 So/ms9ZonsIpDF6N3Mtd9uC9089ANwFNHEDs+Jm4vXOrZivUMP6rZ6+rltCMpmtm19iX
 luRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=SjSf6hCBtUL97Io9jvyEFUHtBwR9Elv/asoVkUIeEx4=;
 b=TB3w4faHa7RXf8GHND4Mmvf8B6E4DIAEDloa6+QyeW12VE10kOmD0fGqZHFnKkmNU0
 y+C92/aBaevIQjKWhQbnwAZp70+ed2+pJLSRWgS8mCqC59DQ/ombGnzNLEyQU4/590Q3
 LxEmbWUHE5uZ/jn5oKAJ+EhwZIS/fZH7unKxBLMA8py8k8uHz08d3DYMyjv40VZzA2H8
 J6AHI9HSV4+HBhGFaNpDwy07rigKBeb52QzDr/4xYTAjOkpT/vm+azkL7RRaAhQF6rfw
 hZxGGutLpIVQKVmV9gBEp+8qepGAixu7qucDZCKKtEiwh3k6fAIoJboyQuaO60LS3x7M
 nVCw==
X-Gm-Message-State: AOAM531eJF/H1OiyNl+Ac3rnI4BJYVwtLeWbzXgHDDZc+CAtP8IXb4CG
 gBY1EnHsMSmJVtN9DI9ONN/d1w7OluW31SNZYgE/QQ==
X-Google-Smtp-Source: ABdhPJyky5MBZp4qNKGYbSqF0BhTvAVeh/pp9lBT8lVS0chIcbz/9j3WOJsb3C0mVK6kuJYwZ9MtLKaet0KQlQlqPLE=
X-Received: by 2002:aca:54c9:: with SMTP id i192mr166150oib.163.1594304314786; 
 Thu, 09 Jul 2020 07:18:34 -0700 (PDT)
MIME-Version: 1.0
References: <20200708160147.18426-1-eric.auger@redhat.com>
In-Reply-To: <20200708160147.18426-1-eric.auger@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 9 Jul 2020 15:18:24 +0100
Message-ID: <CAFEAcA_pvbeMEo9pmqbjEd1ojm-GF=Hcav9Lx-anVtU02GR=oQ@mail.gmail.com>
Subject: Re: [PATCH] virtio-iommu: Fix coverity issue in
 virtio_iommu_handle_command()
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
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>,
 Eric Auger <eric.auger.pro@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, 8 Jul 2020 at 17:02, Eric Auger <eric.auger@redhat.com> wrote:
>
> Coverity points out (CID 1430180) that the new case is missing
> break or a /* fallthrough */ comment. Break is the right thing to
> do as in that case, tail is not used.
>
> Fixes 1733eebb9e ("virtio-iommu: Implement RESV_MEM probe request")
> Signed-off-by: Eric Auger <eric.auger@redhat.com>
> Reported-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>  hw/virtio/virtio-iommu.c | 1 +
>  1 file changed, 1 insertion(+)



Applied to target-arm.next, thanks.

-- PMM

