Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E79B38832F
	for <lists+qemu-devel@lfdr.de>; Wed, 19 May 2021 01:33:04 +0200 (CEST)
Received: from localhost ([::1]:59046 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lj9Cw-0002Io-Ru
	for lists+qemu-devel@lfdr.de; Tue, 18 May 2021 19:33:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49932)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <joel.stan@gmail.com>)
 id 1lj96d-0007C3-21; Tue, 18 May 2021 19:26:31 -0400
Received: from mail-qv1-xf31.google.com ([2607:f8b0:4864:20::f31]:45643)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <joel.stan@gmail.com>)
 id 1lj96X-0002Ca-So; Tue, 18 May 2021 19:26:30 -0400
Received: by mail-qv1-xf31.google.com with SMTP id h7so5241246qvs.12;
 Tue, 18 May 2021 16:26:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=tfw0awxc35lUykI0i5cxL9i5cGRGbe45yHTrSIx3LeU=;
 b=Inch6jl5XIwpVmSkAAs/ZaQp75N1qV28RfP39duVVIYfWV/aQEupktfdsejMIQmn5/
 SyD0xz7c/ENolU/hVAxThuyqAW72Fi8wUHBYApn7O163HdGA/LSBESmAzqscDhRD+NMK
 yKauyBVj2QbfyCviRSJd2Y99lChQL6NJkU38M=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=tfw0awxc35lUykI0i5cxL9i5cGRGbe45yHTrSIx3LeU=;
 b=iOeSEQ87Vkpz1uttYktGDoE+xwZ4TOyPWR+s+Zivq4ExoiiB/k8KmdWiO44Ru6X41Q
 kw/LImjY0LQOoxpMHyCQ6bvwztpK/63VcRjOUQOkLWIUhkrz3zYPN2vyzPkSUJ08v2fs
 lCgnAkFZ507YC0vBs1NyLmtD2wTu3GGIM5GuqbwMNG5rxUWHRgS8lVRglDPTKAmd80bJ
 5X35rgw6L11QA08tpy525sJyKfaZwrLN0gK9ropRoyLEPkkYh8b0f12YNEOqLpQXWssG
 6aS6pMYhiTJn63ydzSiNOQOtUM0emP2dkzgeru2sS3VD5SIlzYZybPf0c1FkyEYnZGLY
 4ZDg==
X-Gm-Message-State: AOAM532DpzKhmeQ5qzbcTxT2y91bWuFAKDE2eTpHyy//ShQWrpTeSf9M
 iAbN2izjcF7RVu6EW1iayOG5r7DMgAMpqFtRYeY=
X-Google-Smtp-Source: ABdhPJzcI7FW3JFOwwcsKPf93+JR3IWs4opx3rZunTBImhhbceK8h8i3aYGWYOCXLibtGqE60/WTkJUlPc35ng5xVD8=
X-Received: by 2002:ad4:4961:: with SMTP id p1mr8757261qvy.43.1621380384253;
 Tue, 18 May 2021 16:26:24 -0700 (PDT)
MIME-Version: 1.0
References: <20210518194118.755410-1-venture@google.com>
 <20210518194118.755410-4-venture@google.com>
In-Reply-To: <20210518194118.755410-4-venture@google.com>
From: Joel Stanley <joel@jms.id.au>
Date: Tue, 18 May 2021 23:26:12 +0000
Message-ID: <CACPK8XcOhJ=aqu8mSZCT69ZLZdQ3wiZhCcP8pDsyFTPe+t77ew@mail.gmail.com>
Subject: Re: [PATCH 3/4] hw/arm: quanta-q71l add pca954x muxes
To: Patrick Venture <venture@google.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::f31;
 envelope-from=joel.stan@gmail.com; helo=mail-qv1-xf31.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Andrew Jeffery <andrew@aj.id.au>,
 Havard Skinnemoen <hskinnemoen@google.com>,
 QEMU Developers <qemu-devel@nongnu.org>, Hao Wu <wuhaotsh@google.com>,
 Tyrone Ting <kfting@nuvoton.com>, qemu-arm <qemu-arm@nongnu.org>,
 =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, 18 May 2021 at 19:41, Patrick Venture <venture@google.com> wrote:
>
> Adds the pca954x muxes expected.
>
> Tested: Booted quanta-q71l image to userspace.
> Signed-off-by: Patrick Venture <venture@google.com>
> Reviewed-by: Hao Wu <wuhaotsh@google.com>

Reviewed-by: Joel Stanley <joel@jms.id.au>

