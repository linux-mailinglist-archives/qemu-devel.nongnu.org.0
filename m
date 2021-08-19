Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2FE663F1CEC
	for <lists+qemu-devel@lfdr.de>; Thu, 19 Aug 2021 17:36:31 +0200 (CEST)
Received: from localhost ([::1]:51414 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mGk5m-00061p-4I
	for lists+qemu-devel@lfdr.de; Thu, 19 Aug 2021 11:36:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43474)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mGk2X-0003T4-ID
 for qemu-devel@nongnu.org; Thu, 19 Aug 2021 11:33:09 -0400
Received: from mail-ej1-x630.google.com ([2a00:1450:4864:20::630]:37419)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mGk2V-0001uA-V1
 for qemu-devel@nongnu.org; Thu, 19 Aug 2021 11:33:09 -0400
Received: by mail-ej1-x630.google.com with SMTP id h9so13795520ejs.4
 for <qemu-devel@nongnu.org>; Thu, 19 Aug 2021 08:33:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Emuy6HTwuLh6IhmoLIqUTPv6/Gqd7wPaMyvx2kT3vxs=;
 b=Agnf/OmLJyKCHfMxwOZneHC355DXRtv8LRCHgOzQerao9kP0IeeNUbk0nnWXQzL0ND
 yF1CGWa63dKrWa8LOLe6OaUpbGi+j8j8n5mGUUTrsqzJ/goqQoDxnaOeIwf8ew22IuqS
 3ibElNZIi8B6VfxZ3OS0FOOla56+eoipKSFzByOIhW6/9vBls2bk/lDdIepv3d9nM03n
 qFJtCrurU9WTnZVuyLdTDfDYZ052EKLnKN5f0mtfnD4UukSo891b9Px2yi8meUuS6RKA
 oJUbfk/nkozVz5JZXuN2ZGgEMyhTmZkJhGV5WHQ8jwUc1OvO12FGiHxxIuS0nZ/tMT5d
 1HDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Emuy6HTwuLh6IhmoLIqUTPv6/Gqd7wPaMyvx2kT3vxs=;
 b=kSi2EFah85Zk39sK/cnhqTs4+sSg3hKVv+ObsXJJnRRJkARrxWE4yx1MJn9daPsjkH
 cB8aZkqeRbaf0V7iHuc4xJXRXA6xatQjCJ3io9cPILYLZjGdiM/qKfI/JBrVdirZSRxq
 SlGPxRBBYR/8Dq1Ml1mUlYrEWZ6MN7tGSVXP67CNXUhAAPQrlOcCUPQaLX3+D5IMlsyy
 QywVBw/0R8R2h6UzkO/EpAWJ1S1Bg/hrk9DT+wGYhHZoffqBQlgNjE84KeVQHsVtbSYw
 /iOZI7HUb7XSC3iohzqBCrcwmg9zJpplhZ4gbxmIxDeapwS4t8FOsV2CrTP61HjNAfkH
 eGug==
X-Gm-Message-State: AOAM532ZAO0L58OOe+Lz7vQWweyxIO5+Yv920vlRhPbOzoFVlCI/50W0
 VYcevxDHM2CL1GNtzg4MIise+x/wB8f2rD9A01Rfcg==
X-Google-Smtp-Source: ABdhPJy4xFGWLvvucB5thQq6pdWH08tKjErSb0KBcOg5iqEvdnDlMGw8xuv/ncUIRZA+Nn95P2Elz3uCZWDnfNvgiao=
X-Received: by 2002:a17:907:1048:: with SMTP id
 oy8mr15940097ejb.382.1629387186425; 
 Thu, 19 Aug 2021 08:33:06 -0700 (PDT)
MIME-Version: 1.0
References: <20210818191920.390759-1-richard.henderson@linaro.org>
 <20210818191920.390759-7-richard.henderson@linaro.org>
In-Reply-To: <20210818191920.390759-7-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 19 Aug 2021 16:32:20 +0100
Message-ID: <CAFEAcA_4=ocZkNCwR5rLbk4cqfmooTFBw19SYvW-K6edjbS+nQ@mail.gmail.com>
Subject: Re: [PATCH v3 06/66] target/hppa: Implement do_unaligned_access for
 user-only
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::630;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x630.google.com
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
Cc: QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, 18 Aug 2021 at 20:22, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  linux-user/hppa/cpu_loop.c | 2 +-
>  target/hppa/cpu.c          | 9 ++++++---
>  2 files changed, 7 insertions(+), 4 deletions(-)

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

