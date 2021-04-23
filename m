Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BD133692C1
	for <lists+qemu-devel@lfdr.de>; Fri, 23 Apr 2021 15:10:23 +0200 (CEST)
Received: from localhost ([::1]:36888 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lZvZd-0004iV-1h
	for lists+qemu-devel@lfdr.de; Fri, 23 Apr 2021 09:10:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59780)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lZvXk-0003ZS-26
 for qemu-devel@nongnu.org; Fri, 23 Apr 2021 09:08:24 -0400
Received: from mail-ej1-x62e.google.com ([2a00:1450:4864:20::62e]:44861)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lZvXi-0003xT-HM
 for qemu-devel@nongnu.org; Fri, 23 Apr 2021 09:08:23 -0400
Received: by mail-ej1-x62e.google.com with SMTP id r20so24068974ejo.11
 for <qemu-devel@nongnu.org>; Fri, 23 Apr 2021 06:08:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=N1T+jyjH2Ot/UZmCgo8DksDQKXAL8nrhiLUfB+eyrJA=;
 b=v/fwPtDSKP5bZmWmU+XoohWfl9Nu/7S02ThwdbfEGKkeLxRtHhpJJJ75VJDH/DwLZP
 HvccHuGlmWd24Bv1fuaT5uk0p52KIkil0l0iITiDzMCmetpXh7TBNHLfRvk5kUY3v6IW
 RUU5CZUjAB94kh+PgySQNNpbnzmwaeSLqmk5cAwL1He5LAzkr31Hzr/3FC+RG61ddyhH
 VluuHnSh2qBVgdL/XJN8ycfswg5ItmirAcg8SfVUxyAmNnsh9UiItMRv/gnQ1XIM3ETz
 HWQwv9th53hvFP4/vtIyjtwgulcuVHJgb2ck5hVkYQj3wviJzT49kw9UsPwZyCZ0tjGv
 dUHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=N1T+jyjH2Ot/UZmCgo8DksDQKXAL8nrhiLUfB+eyrJA=;
 b=Lj/edrfopre72l/msje4AZSO3NWYlG0oxAH/xB04IEtFO2khtQNFEGNeKb/wRcGul0
 iOctR2iSggwrdGDPD4XbUXseAv0/toIkM0IfCl2EbpIl5+FeHoZJ6x5/0GR5zDcF0P88
 UdNpH9Xudh6LUVcKRKhYBWKs23amKfNcTXapghUMp+yD5KZHYwxMz6UIzGxiHeybytTd
 UPhAUukr8hfWiRW0pLfyOM33fyf/NGBHhk8jQD0vJhHxS7qehYtyEJ+k94xpM2WmlFvI
 tOuYA6Hw72X9i37mHGPHg7QVS5CPpE/Oi9kKxP28dNYQu2/N2l7bdMwt19vTEjEZ8DOx
 vb1g==
X-Gm-Message-State: AOAM530JRzO6+27p06IlVgeF8zB9x7gH4v2XPxNH+feXp1dxwDeacipL
 B9jlS4SN7e/LW+bds77ndO8bcloeljxLPaKD5U6GstFlVoE=
X-Google-Smtp-Source: ABdhPJypgiCyz5AGn7SboQ2Da4WzfWfoL2DKr2pn3VSCNOs5q/3U6LHZzzf7rJevEh3HsR3Ft7be+jide4cQEyProCQ=
X-Received: by 2002:a17:907:9852:: with SMTP id
 jj18mr4080002ejc.382.1619183301110; 
 Fri, 23 Apr 2021 06:08:21 -0700 (PDT)
MIME-Version: 1.0
References: <20210423031803.1479-1-jasowang@redhat.com>
In-Reply-To: <20210423031803.1479-1-jasowang@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 23 Apr 2021 14:07:25 +0100
Message-ID: <CAFEAcA8pMHHLpPg1ejUmhkD8gMdg=LrHv_RHj08vS4k=8HooeQ@mail.gmail.com>
Subject: Re: [PATCH for 6.0] net: check the existence of peer before trying to
 pad
To: Jason Wang <jasowang@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::62e;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x62e.google.com
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
Cc: Stefan Weil <sw@weilnetz.de>, QEMU Developers <qemu-devel@nongnu.org>,
 Cole Robinson <crobinso@redhat.com>,
 Samuel Thibault <samuel.thibault@ens-lyon.org>, Bin Meng <bmeng.cn@gmail.com>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, 23 Apr 2021 at 04:18, Jason Wang <jasowang@redhat.com> wrote:
>
> There could be case that peer is NULL. This can happen when during
> network device hot-add where net device needs to be added first. So
> the patch check the existence of peer before trying to do the pad.
>
> Fixes: 969e50b61a285 ("net: Pad short frames to minimum size before sending from SLiRP/TAP")
> Signed-off-by: Jason Wang <jasowang@redhat.com>
> ---
>  include/net/net.h | 5 +++++
>  net/slirp.c       | 2 +-
>  net/tap-win32.c   | 2 +-
>  net/tap.c         | 2 +-
>  4 files changed, 8 insertions(+), 3 deletions(-)

Applied to master for 6.0 rc5; thanks.

-- PMM

