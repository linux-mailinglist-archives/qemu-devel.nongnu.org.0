Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D65A538207A
	for <lists+qemu-devel@lfdr.de>; Sun, 16 May 2021 20:52:16 +0200 (CEST)
Received: from localhost ([::1]:50974 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1liLs7-0003FL-Eu
	for lists+qemu-devel@lfdr.de; Sun, 16 May 2021 14:52:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56346)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1liLq3-0001UI-7Q
 for qemu-devel@nongnu.org; Sun, 16 May 2021 14:50:08 -0400
Received: from mail-ed1-x534.google.com ([2a00:1450:4864:20::534]:35340)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1liLq1-0003s0-5u
 for qemu-devel@nongnu.org; Sun, 16 May 2021 14:50:06 -0400
Received: by mail-ed1-x534.google.com with SMTP id di13so4339773edb.2
 for <qemu-devel@nongnu.org>; Sun, 16 May 2021 11:50:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=lum3qNnJudQLOezeUNNjVWPZpXbh05BkFdyyTNrKZZU=;
 b=ZIAf5rzz1hUR1KYbIj26W5ZGXDcPWLWSUU6OccwYImhfrYNErWWRmj13mLpz9t9cTe
 cotDx2LR2hYJi7aJ7Bje7bxbxWXtck6QODwSAlDP029fEhE3rLOJZkNe7hFil7WvlUyB
 KIcWD8ZCZS8LzjLzL/AAjhmveciWK9zid8Pm32/onqIzgVCX/66VhgoRN+rTAfbSGayo
 EUaoY/V+hOEul0fzzxLCVTPBR2Yfx4scaGtIrdP/E+pDuP4hO/6UluFb48rBLexOz0pW
 st8rx7iVUYu0wykJpRn8rCIxvlRDFWqeInu38mh7QxlsWaXiKysNXqm2nlJsxtsKyFSk
 MOyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=lum3qNnJudQLOezeUNNjVWPZpXbh05BkFdyyTNrKZZU=;
 b=PACjKKOoKhHa8AkXXv3xtuTXTixHC35hOGz9K3HDHzMTwQlRdb1kdEmLDu0J8Mb0EE
 Xl3x7yD6vUvivJKSjWlhD4V6tZ0sL/Ws5ar19ssRPk33OJ6z91DNXBXQvFV+AgDa5mB3
 tc6oni029UiP2j/aTmJJYI4uOSM8uFWpJxjw70v0yhp+pmyrqkZjokKHPuWxq0D/2gU6
 FEBaz+AORV86O0zkEEFhiAJwxuQUnRCm3y9JdER9VrFUHtBo13xRXP9v6I0jSLyZslUJ
 JLx1//poJVowjcTNnZ/GmudDmcZB1MYFcJNgz0ET5ONEAWNFMok+Il7BmHCinMyAgH0n
 jnfQ==
X-Gm-Message-State: AOAM530gTE6yCUMBXpCoAtpo9+hSm4TXDiDb7THu6SOfE3vALkVj8byI
 GZwFJ6RkpPHn+zZNtBTVdGvF9CEIYfgaBnLMQ4H6+A==
X-Google-Smtp-Source: ABdhPJzi4gs7A7S2mA1/2Sg0jeMi1JWAnX1yRop0J9l5fPaTbknTjqK0xnsy98qmBo8ZN+7SkzM1G/W8kzg6hzMzJXI=
X-Received: by 2002:a50:ab06:: with SMTP id s6mr58343028edc.100.1621191003733; 
 Sun, 16 May 2021 11:50:03 -0700 (PDT)
MIME-Version: 1.0
References: <20210514160245.91918-1-mst@redhat.com>
In-Reply-To: <20210514160245.91918-1-mst@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Sun, 16 May 2021 19:49:49 +0100
Message-ID: <CAFEAcA_hxkqLDs=mt2sC0m1Nq6uVSkjUj106DeWE+7VqROev8g@mail.gmail.com>
Subject: Re: [PULL 00/16] pc,pci,virtio: bugfixes, improvements
To: "Michael S. Tsirkin" <mst@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::534;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x534.google.com
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

On Fri, 14 May 2021 at 17:04, Michael S. Tsirkin <mst@redhat.com> wrote:
>
> The following changes since commit 609d7596524ab204ccd71ef42c9eee4c7c338ea4:
>
>   Update version for v6.0.0 release (2021-04-29 18:05:29 +0100)
>
> are available in the Git repository at:
>
>   git://git.kernel.org/pub/scm/virt/kvm/mst/qemu.git tags/for_upstream
>
> for you to fetch changes up to f7a6df5f5bf3acc219352a1b25573ae2082d7e42:
>
>   Fix build with 64 bits time_t (2021-05-14 10:26:18 -0400)
>
> ----------------------------------------------------------------
> pc,pci,virtio: bugfixes, improvements
>
> Fixes all over the place. Faster boot for virtio. ioeventfd support for
> mmio.
>
> Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
>
> ----------------------------------------------------------------


Applied, thanks.

Please update the changelog at https://wiki.qemu.org/ChangeLog/6.1
for any user-visible changes.

-- PMM

