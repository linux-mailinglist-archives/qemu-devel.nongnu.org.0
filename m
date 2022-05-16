Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2043A528AAA
	for <lists+qemu-devel@lfdr.de>; Mon, 16 May 2022 18:37:02 +0200 (CEST)
Received: from localhost ([::1]:36980 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nqdiP-00082D-6a
	for lists+qemu-devel@lfdr.de; Mon, 16 May 2022 12:37:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50170)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nqdgO-00053k-9p
 for qemu-devel@nongnu.org; Mon, 16 May 2022 12:34:56 -0400
Received: from mail-yw1-x1132.google.com ([2607:f8b0:4864:20::1132]:37500)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nqdgM-0001FD-LO
 for qemu-devel@nongnu.org; Mon, 16 May 2022 12:34:55 -0400
Received: by mail-yw1-x1132.google.com with SMTP id
 00721157ae682-2f16645872fso159511637b3.4
 for <qemu-devel@nongnu.org>; Mon, 16 May 2022 09:34:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=eXAqJsIfQYO9eqAdV4rI6UIfwZR3ZyZ/ToKczEPfTiE=;
 b=ORMk3WYoCl9qdlcx3Tupq/7TKZiCGE/oU/HJl85vHVt59BncP3636yr2tWlam3ql+I
 WMhq2q1WVhKVoUS5qfzdvoqlS7tdRFN7FLRBB9N8OViw49dIhy9PXWsQGkXnh5dsGzqP
 8eVBgOXW5GNpLbm8J5ZeWqqJ4bQgHKVhgWhjIS3p+L3aSK7VYIpZbT07ccqvJT4Jz9ab
 vRZaHQNkszam62EqiGMXUYR9MztoenOzT4YGxjESE25YRlReVU5eF9ozEp7hmhT7bslj
 eE07eBalJWG5e62ryha8FNeb193PxsM6RcmjWm864jay+DrspfYZLurkfnZHHMTG/gWN
 ufbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=eXAqJsIfQYO9eqAdV4rI6UIfwZR3ZyZ/ToKczEPfTiE=;
 b=T0vHYHsKfrCyt6bjFLLU0b/qRQZBg/lb04S7cjCenOChOlyDqotmZvh0UzbxsVYX3F
 wki2dMmvg4syo+nqieyLZvYYDfZ7aN2AMjv8w/gmQ+CfUvlnlX0S2s60k8SKTdKGfzZ8
 hF5Gxh9Ky6l+fWNH5FkEhroqFlS7UZfYyYkB0aNpVeoUDSR+C4RAJm5yQC+icncEq4QC
 hnUfWtZSd64Ep7nxxuaywp37v67crxnksHMfBvqZlC5kyqTVIHtvfArGUme4Kxvcyq+u
 nxJW1NLD6YGNpIo5RGa2gH8WMkIhmuhAR2KCcmep/8MFFaE/55hEg3DtEQuRED1qB6gW
 Gh4w==
X-Gm-Message-State: AOAM531krhxmQhtcmCXxmZAN0flrXoOkUfXTqw64sMTidiMCki1zIbge
 RhFSOJ6Uj1/uxR7EvEu9d2SiELZFwuaQKm3Y27kdoQ==
X-Google-Smtp-Source: ABdhPJx3XNgLYny6okebb2+GUl8bYzobwSa7oBnpMwA+DmmTWJ2wkHb5BLaBPVLAamjmJZp6VbpLEALDt06NIhczNQo=
X-Received: by 2002:a0d:fc83:0:b0:2e5:b0f4:c125 with SMTP id
 m125-20020a0dfc83000000b002e5b0f4c125mr20978697ywf.347.1652718893741; Mon, 16
 May 2022 09:34:53 -0700 (PDT)
MIME-Version: 1.0
References: <20220516155701.1789638-1-stefanha@redhat.com>
In-Reply-To: <20220516155701.1789638-1-stefanha@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 16 May 2022 17:34:42 +0100
Message-ID: <CAFEAcA9VZ=VAJtTHiJbooRADrZNqc2shpOdU=wmDBpb-RRm7vw@mail.gmail.com>
Subject: Re: [PATCH v2] vhost-user-scsi: avoid unlink(NULL) with fd passing
To: Stefan Hajnoczi <stefanha@redhat.com>
Cc: qemu-devel@nongnu.org, Raphael Norwitz <raphael.norwitz@nutanix.com>, 
 "Michael S. Tsirkin" <mst@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::1132;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x1132.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, 16 May 2022 at 16:57, Stefan Hajnoczi <stefanha@redhat.com> wrote:
>
> Commit 747421e949fc1eb3ba66b5fcccdb7ba051918241 ("Implements Backend
> Program conventions for vhost-user-scsi") introduced fd-passing support
> as part of implementing the vhost-user backend program conventions.
>
> When fd passing is used the UNIX domain socket path is NULL and we must
> not call unlink(2).
>
> The unlink(2) call is necessary when the listen socket, lsock, was
> created successfully since that means the UNIX domain socket is visible
> in the file system.
>
> Fixes: Coverity CID 1488353
> Fixes: 747421e949fc1eb3ba66b5fcccdb7ba051918241 ("Implements Backend Program conventions for vhost-user-scsi")
> Signed-off-by: Stefan Hajnoczi <stefanha@redhat.com>
> ---
>  contrib/vhost-user-scsi/vhost-user-scsi.c | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
>

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

