Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 12D0A40191C
	for <lists+qemu-devel@lfdr.de>; Mon,  6 Sep 2021 11:44:37 +0200 (CEST)
Received: from localhost ([::1]:40876 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mNBB6-0004sG-5C
	for lists+qemu-devel@lfdr.de; Mon, 06 Sep 2021 05:44:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37624)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mNB9N-0003Od-8r
 for qemu-devel@nongnu.org; Mon, 06 Sep 2021 05:42:49 -0400
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a]:40927)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mNB9H-0004ZX-CD
 for qemu-devel@nongnu.org; Mon, 06 Sep 2021 05:42:49 -0400
Received: by mail-wm1-x32a.google.com with SMTP id
 n14-20020a05600c3b8e00b002f8bd2f8ab6so1196792wms.5
 for <qemu-devel@nongnu.org>; Mon, 06 Sep 2021 02:42:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=xc1cyGtI9IOmOP9xvAIijrJwOA0djLU8xkl+Mc34l0U=;
 b=yi/SscZUOlss+7sLNhqo60L8A6NdQ96rKEk92lzt7MQTRG5Rc6B8LXu8Y51fD2rcxo
 LZW6FuW//ug/PLYvhck2Fte+sbVvk1hM/17f3IpuiasOFCkIAzcKzDHxOXlTcOOYu6zH
 P9VwVtBg4442ZVextzSIi/oZkQ0/TrfgQjwmjUaIXbRDDPkA8z3PsWxq4+UgegGVdygj
 vIuL2YwVIrfm0edTQ/kHH8bUyXnWgqvuW6sa+QuWcZOOVgxwPLHvcFcLyjR9jpnqPRI+
 DuLRyZet7xjwoW+PZlFOIHYZgBBN3NbmJgfwtrsrKPBfmQKsKQIPvwT6ibcJpeUOu5Am
 wAqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=xc1cyGtI9IOmOP9xvAIijrJwOA0djLU8xkl+Mc34l0U=;
 b=p8SQv8b6gTEkXI5aG7FTiK9AlZXcrbRNH+4m6rZi2VgBA5qV0MhuHHmb6nBJlHTbPL
 tbP4WC2t4Fp+65/WHxJWnJNqXKADRtQs0eVZ6sErcL/uIGHzuZ6QdvIpnOBSv3Swwyng
 NaCR+W81iMt8LlJpkPlAG29yyrFBFr6qBsDCuxlm8JcJd7Mz3jOV/+l5ip3Osu3bNY2B
 4vyPxjDfbOk9s058L8QNuTzHqO4JdagA3LgSfUMZQ1BpO+Xy6anwv6lZ5V/Mr7+eh34m
 Vuzaqh+KJQGplZgYvIdD6sSoy5dy8cuJWycAAd0sQkWGajuHUiTwqlJSBPnolD+TxVuw
 qIyQ==
X-Gm-Message-State: AOAM531el57ogwHofjWt6LfE/Ks2RiiLHi8MsNqWAB/VHzi0nrdVrA9G
 ImV8VmN9UzSMNTSNS4DuAV3LMy4HWU+iN20PFg4U7Mv/0WA=
X-Google-Smtp-Source: ABdhPJxA7saRaQq12G5xKisOm1qfhn82I20Uhj1yHax3jTmqvV1+1wU8Qkgt6ncRNr1axr53d8sakZykhmUR1gbxtZs=
X-Received: by 2002:a7b:c246:: with SMTP id b6mr10525322wmj.37.1630921361711; 
 Mon, 06 Sep 2021 02:42:41 -0700 (PDT)
MIME-Version: 1.0
References: <20210904213506.486886-1-mst@redhat.com>
In-Reply-To: <20210904213506.486886-1-mst@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 6 Sep 2021 10:41:53 +0100
Message-ID: <CAFEAcA9gJ8mR1t3sJPfq52=vAKZnhf1N5iiR9Wa99ZTmwFFX=Q@mail.gmail.com>
Subject: Re: [PULL 00/35] pc,pci,virtio: fixes, cleanups
To: "Michael S. Tsirkin" <mst@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::32a;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x32a.google.com
X-Spam_score_int: -1
X-Spam_score: -0.2
X-Spam_bar: /
X-Spam_report: (-0.2 / 5.0 requ) DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

On Sat, 4 Sept 2021 at 22:36, Michael S. Tsirkin <mst@redhat.com> wrote:
>
> The following changes since commit 8880cc4362fde4ecdac0b2092318893118206fcf:
>
>   Merge remote-tracking branch 'remotes/cschoenebeck/tags/pull-9p-20210902' into staging (2021-09-03 08:27:38 +0100)
>
> are available in the Git repository at:
>
>   git://git.kernel.org/pub/scm/virt/kvm/mst/qemu.git tags/for_upstream
>
> for you to fetch changes up to 499c8b4de96eecc554a03e452226f79f169a233b:
>
>   vhost-vdpa: remove the unncessary queue_index assignment (2021-09-04 17:34:05 -0400)
>
> ----------------------------------------------------------------
> pc,pci,virtio: fixes, cleanups
>
> Fixes, cleanups all over the place.
>
> Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
>


Applied, thanks.

Please update the changelog at https://wiki.qemu.org/ChangeLog/6.2
for any user-visible changes.

-- PMM

