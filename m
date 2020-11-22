Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B2A102BC569
	for <lists+qemu-devel@lfdr.de>; Sun, 22 Nov 2020 12:40:48 +0100 (CET)
Received: from localhost ([::1]:47928 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kgnja-0006MO-Af
	for lists+qemu-devel@lfdr.de; Sun, 22 Nov 2020 06:40:46 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:59432)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kgniL-0005vt-9O
 for qemu-devel@nongnu.org; Sun, 22 Nov 2020 06:39:29 -0500
Received: from mail-ed1-x544.google.com ([2a00:1450:4864:20::544]:40155)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kgniJ-0002fY-M6
 for qemu-devel@nongnu.org; Sun, 22 Nov 2020 06:39:29 -0500
Received: by mail-ed1-x544.google.com with SMTP id d18so14185862edt.7
 for <qemu-devel@nongnu.org>; Sun, 22 Nov 2020 03:39:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=umqZwv6MBtqHH3NmT1LwaMJ37tpywtTp6hsLTyA7jjs=;
 b=RdW/ZJ+WDo0ckPexBGA91kBLc5AcLZJIVKQbZ0LJJU1up2IzjDI8zoVRAKG7GxS+hI
 IOrLpyklG0V9fEoJP6ly7rI55lqM6wdVvD/2RUjPNYK5gjYmO4f76Hj8QYoAT7nlA9rV
 rPddejxqJZnFZlzxpZdcA/GRtPUfjd3M/s0MOABpcRc+C3xB3kSd4VN6mZSkf3gEBRkC
 rppVgVRkU2pmo+6QiT3e67pyL/6bOEyYq5O4NqIdgoVzgKPg3ANVEgPS2G0856SfoZQK
 RuvTCnDhZRm3vDHhrn9xnRfZcqF/p1FVJZhEJm6fG/FT4BWldI4b5h7rsa2uy1OUp1Ys
 f40A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=umqZwv6MBtqHH3NmT1LwaMJ37tpywtTp6hsLTyA7jjs=;
 b=cJiGfIas6IJnGXCyCWJufp6cNbbnXvhpnNey/xhdzruSkZUAvfrpJJczBYWvPrKvRW
 p2NpyWhr7X0p6Do2Hyx6Yp/yZf6ycRtlgQcJai034IWHhbfOydscJcGlpTwmmnwIODgY
 TyI4xidgWb6J5uLl5ypH6ylozU5OPnwogNKe3xszm3HsEZDhAbQfamGLLNf81chLEeyY
 d43xGFnrOr2jVd0o8RnYvBT0XpAg3F0xxGmz1EFfnqYpH3jy9aJZTvuVgDrQzqSfu9a5
 mGKDaOWskFEJKE0fRnMucabUAj6ZnsXgxXioHM30p5RESyksu29Nmho1i22k7oo2eTJS
 0Xqw==
X-Gm-Message-State: AOAM531WbvXPWORZv33yLlN0T2lP6SAXcew5zXkO0E2rQoMiZ+gL/u4n
 PR6X53mj7PIFZTuX98lxNQqvkzjDGg3WEqJYnnz+JA==
X-Google-Smtp-Source: ABdhPJx4roJ3hvvFyCSV6AD3Uprb7FPkRxpGFVufoO/zdhNqP5JlaPgxj7HGU0CFdq1sZ0dmiCp+k0XQqFsZYfm7xIE=
X-Received: by 2002:a05:6402:3089:: with SMTP id
 de9mr44142219edb.100.1606045165280; 
 Sun, 22 Nov 2020 03:39:25 -0800 (PST)
MIME-Version: 1.0
References: <20201122044426.13454-1-ruc_gongyuanjun@163.com>
In-Reply-To: <20201122044426.13454-1-ruc_gongyuanjun@163.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Sun, 22 Nov 2020 11:39:14 +0000
Message-ID: <CAFEAcA-Oc1JO-3H+mmjmhTuVLa89fMN8HgWHhnO8q5TpBg61MA@mail.gmail.com>
Subject: Re: [PATCH 1/1] /net/tap.c: Fix a memory leak
To: ruc_gongyuanjun@163.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::544;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x544.google.com
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
Cc: Jason Wang <jasowang@redhat.com>, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Sun, 22 Nov 2020 at 11:07, <ruc_gongyuanjun@163.com> wrote:
>
> From: yuanjungong <ruc_gongyuanjun@163.com>
>
> Close fd before returning.
>
> Buglink: https://bugs.launchpad.net/qemu/+bug/1904486
> Signed-off-by: yuanjungong <ruc_gongyuanjun@163.com>
> ---
>  net/tap.c | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/net/tap.c b/net/tap.c
> index c46ff66..fe95fa7 100644
> --- a/net/tap.c
> +++ b/net/tap.c
> @@ -817,6 +817,7 @@ int net_init_tap(const Netdev *netdev, const char *name,
>          if (ret < 0) {
>              error_setg_errno(errp, -ret, "%s: Can't use file descriptor %d",
>                               name, fd);
> +            close(fd);
>              return -1;
>          }
>
> @@ -831,6 +832,7 @@ int net_init_tap(const Netdev *netdev, const char *name,
>                           vhostfdname, vnet_hdr, fd, &err);
>          if (err) {
>              error_propagate(errp, err);
> +            close(fd);
>              return -1;
>          }
>      } else if (tap->has_fds) {
> --
> 2.17.1

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

