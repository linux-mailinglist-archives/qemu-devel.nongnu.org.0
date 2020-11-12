Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A4B8A2B08E5
	for <lists+qemu-devel@lfdr.de>; Thu, 12 Nov 2020 16:50:34 +0100 (CET)
Received: from localhost ([::1]:51056 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kdErp-0005b3-Oe
	for lists+qemu-devel@lfdr.de; Thu, 12 Nov 2020 10:50:33 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:32778)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kdEpl-0003zY-Qm
 for qemu-devel@nongnu.org; Thu, 12 Nov 2020 10:48:25 -0500
Received: from mail-ed1-x544.google.com ([2a00:1450:4864:20::544]:36608)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kdEpi-0003bA-If
 for qemu-devel@nongnu.org; Thu, 12 Nov 2020 10:48:25 -0500
Received: by mail-ed1-x544.google.com with SMTP id o20so6833278eds.3
 for <qemu-devel@nongnu.org>; Thu, 12 Nov 2020 07:48:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=hjNA2AvDa9szCroj0fQiLuVwsuQI9Wj/ThU/JyHkgl4=;
 b=CmZbqAuJkkPhgehXPFDHwyfsjZ8uh3y3jXdzUXP3udJnU6tmn1oo5VCtc9MAL4ctXu
 a71QalRSgzl23tiM7zsYhwlrxnkEfz/sXuBi5E//WAN4Vgwqm9RrYg7lPZ3yxGpncfqI
 +CjzbQozbK5FQbLyx41AhNqMLh/j0DnNXJeEWEO3NGj4ItJ8abKmdlxj5mzplZnwa5R8
 EG0UzPmi0nhSEnOOxcKPcga2lgI5siypLdyNWomzXwZCEwwP5plxN/eYj+7s8oxVqXCo
 nZJ6vAU+T2ZSiR99OK7uO56vWwkRmIhZ1DmVa2V3RyfabPbqP/WDwHGZfhvYCcgs85tM
 QL0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=hjNA2AvDa9szCroj0fQiLuVwsuQI9Wj/ThU/JyHkgl4=;
 b=mzn8yR9NxyMBJYy7jyRYqXhDb4ZNki9jjuj6ARkmNAs96oZawOFLKppFX9/Qgd/LsU
 amAtk8yVTwuNOuFflCs8VknDqWp05172MO9Xnix8gV3iXCO0HoA9vpZWn9v/OSmUbqQq
 UgDLzIMAGwnccOw2n4pnrOOzMZ4M8wESdIsj3vHs71G9Il7UwJzKpdHpsOMPCovhHxHu
 3RgfVXIRtQPq6XKs0Q8pYfa+RnJpEvGBWJU/+FLs3QM7ut/gO/0qd7QXddMV1XIVpVbL
 cbq0sWhCDhFGK04V1LF694AkEAgY10GZbRIo1g1DFkfLzpYzl9OV5Xm0/nsHLJSvd9of
 9ZfA==
X-Gm-Message-State: AOAM532u113Nbo583I2PiwnaZyGx++w95W0FKgP66P/lqpDNEHdE174O
 v6d0ov1mAa+d4zLclDBYIb4k156ZZ5pyQn9nMiG+xw==
X-Google-Smtp-Source: ABdhPJx6jzN7KO44rJjiERAOy4vEIJfZZgcfBHawDcyK+MpH2Ps4S4UcxcAzsGd1MOikZz9D5+NENUZvBM47hUbdb14=
X-Received: by 2002:aa7:df82:: with SMTP id b2mr322393edy.251.1605196100753;
 Thu, 12 Nov 2020 07:48:20 -0800 (PST)
MIME-Version: 1.0
References: <5F997B84.9040900@huawei.com> <5F9A5B48.9030509@huawei.com>
In-Reply-To: <5F9A5B48.9030509@huawei.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 12 Nov 2020 15:48:09 +0000
Message-ID: <CAFEAcA-n768kTj8xsb+dv1q5Ut2QJ79T7nhbH=mobYs2MK6vkw@mail.gmail.com>
Subject: Re: [PATCH V2] vhost-user-blk/scsi: Fix broken error handling for
 socket call
To: AlexChen <alex.chen@huawei.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::544;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x544.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: QEMU Trivial <qemu-trivial@nongnu.org>,
 Raphael Norwitz <raphael.s.norwitz@gmail.com>, QEMU <qemu-devel@nongnu.org>,
 "Michael S. Tsirkin" <mst@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Ping? This is a coverity issue fix which has been reviewed,
whose tree should it go via?

Adding mst to cc list as the listed maintainer.

thanks
-- PMM

On Thu, 29 Oct 2020 at 06:05, AlexChen <alex.chen@huawei.com> wrote:
>
> When socket() fails, it returns -1, 0 is the normal return value and should not return error.
>
> Reported-by: Euler Robot <euler.robot@huawei.com>
> Signed-off-by: AlexChen <alex.chen@huawei.com>
> ---
>  contrib/vhost-user-blk/vhost-user-blk.c   | 2 +-
>  contrib/vhost-user-scsi/vhost-user-scsi.c | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/contrib/vhost-user-blk/vhost-user-blk.c b/contrib/vhost-user-blk/vhost-user-blk.c
> index 25eccd02b5..40a2dfc544 100644
> --- a/contrib/vhost-user-blk/vhost-user-blk.c
> +++ b/contrib/vhost-user-blk/vhost-user-blk.c
> @@ -474,7 +474,7 @@ static int unix_sock_new(char *unix_fn)
>      assert(unix_fn);
>
>      sock = socket(AF_UNIX, SOCK_STREAM, 0);
> -    if (sock <= 0) {
> +    if (sock < 0) {
>          perror("socket");
>          return -1;
>      }
> diff --git a/contrib/vhost-user-scsi/vhost-user-scsi.c b/contrib/vhost-user-scsi/vhost-user-scsi.c
> index 3c912384e9..0f9ba4b2a2 100644
> --- a/contrib/vhost-user-scsi/vhost-user-scsi.c
> +++ b/contrib/vhost-user-scsi/vhost-user-scsi.c
> @@ -320,7 +320,7 @@ static int unix_sock_new(char *unix_fn)
>      assert(unix_fn);
>
>      sock = socket(AF_UNIX, SOCK_STREAM, 0);
> -    if (sock <= 0) {
> +    if (sock < 0) {
>          perror("socket");
>          return -1;
>      }
> --
> 2.19.1

