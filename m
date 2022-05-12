Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A8395525248
	for <lists+qemu-devel@lfdr.de>; Thu, 12 May 2022 18:16:47 +0200 (CEST)
Received: from localhost ([::1]:39786 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1npBUb-0002rd-Ri
	for lists+qemu-devel@lfdr.de; Thu, 12 May 2022 12:16:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44910)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1npBBu-0003XV-Rl
 for qemu-devel@nongnu.org; Thu, 12 May 2022 11:57:28 -0400
Received: from mail-yw1-x1131.google.com ([2607:f8b0:4864:20::1131]:33228)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1npBBt-0007Lr-Bb
 for qemu-devel@nongnu.org; Thu, 12 May 2022 11:57:26 -0400
Received: by mail-yw1-x1131.google.com with SMTP id
 00721157ae682-2f863469afbso62365007b3.0
 for <qemu-devel@nongnu.org>; Thu, 12 May 2022 08:57:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=8cpU5FPEUQX/9aa5eSI1XBRrXQPJa7LUdRyyvsZWLWI=;
 b=bZSsCRql6yx1scKaPIxHtHDDg6lSrzF+Y7bK9TqPJsHC657opRkdTm77LPG/z/KOQu
 O/M0HMubXi0UZ/FGsYaDLcmxUvQHcQd6yTYJke0Z1hM2m9qbUrzCJBrWYKKRA7U8T/rK
 HCexbp6moF+0MX3qzMUKXo2fatLenW57LsF/C8plIzcP4e+jTBLikPXEAVX06RSehNQG
 ngV2+0OaXctJstPs8ZX8w2r3sEkZJrbiQtDXQXDhjlahSw6b8faSVQwUwT9GspVflEZQ
 iXoOE/NUrxZSemlRDfVUeERh77udcP43yOsX9VJu9+RJCBpvka4MpGAuY1zljIQ0PxhP
 TyjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=8cpU5FPEUQX/9aa5eSI1XBRrXQPJa7LUdRyyvsZWLWI=;
 b=QABQpbo5HWK9O91in5riHCdiQnk9XsDX3A03mM+9wqRZFxMNReSujFbKEktYX/iS52
 nIgSkmb+zQpPHr0U/3Tbs79pimDZTLT5ynIpvyq0vr5BgnVWOpa1B5dRgPICvtuLgb5s
 9FnNne0tuTYLr/UZ7DG6L/17zIGbXoClw2/D6aqJFa/aKeRx3ZYpHabHjMZaeRiCiCOF
 fftUTC2Qo40DGIGbd5PKrKRjulP860PPtkitvBxnHPSavoVuNiFAz0LsWjj+zfByktRt
 C5g6jTnhKoD74mQnh3PviHuSgQclaKrneJbo7/iAXJOYcMYshHUuOx60AtZIQXnRLGxc
 BPmQ==
X-Gm-Message-State: AOAM531nrCx7AD6izW3ylc1nODsNAoE04m8JjHo6WTCvpJOKh8UFn1/Y
 Aqg+ayY1dF1CeXtD/WSEq0xK6+LE9dJvP1PB6Is8cA==
X-Google-Smtp-Source: ABdhPJwX9AUGe9oUl8rWGtiE55wqcb39Jp2GuVR/9ozYM8jiQ6kyGhQkIb6z8On9TYgCSTkt7Dd8oAk+SmUxtrV65Tg=
X-Received: by 2002:a81:1dcf:0:b0:2fa:d094:14ff with SMTP id
 d198-20020a811dcf000000b002fad09414ffmr816726ywd.10.1652371044423; Thu, 12
 May 2022 08:57:24 -0700 (PDT)
MIME-Version: 1.0
References: <20220427100116.30453-1-stefanha@redhat.com>
In-Reply-To: <20220427100116.30453-1-stefanha@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 12 May 2022 16:57:13 +0100
Message-ID: <CAFEAcA_1cFLDK+oE8=VQaX-FQqTtVH=WP6C47Xo+f99SLin2EQ@mail.gmail.com>
Subject: Re: [PATCH] vhost-user-scsi: avoid unlink(NULL) with fd passing
To: Stefan Hajnoczi <stefanha@redhat.com>
Cc: qemu-devel@nongnu.org, Raphael Norwitz <raphael.norwitz@nutanix.com>, 
 "Michael S. Tsirkin" <mst@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::1131;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x1131.google.com
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

On Wed, 27 Apr 2022 at 11:04, Stefan Hajnoczi <stefanha@redhat.com> wrote:
>
> Commit 747421e949fc1eb3ba66b5fcccdb7ba051918241 ("Implements Backend
> Program conventions for vhost-user-scsi") introduced fd-passing support
> as part of implementing the vhost-user backend program conventions.
>
> When fd passing is used the UNIX domain socket path is NULL and we must
> not call unlink(2).
>
> Fixes: Coverity CID 1488353
> Fixes: 747421e949fc1eb3ba66b5fcccdb7ba051918241 ("Implements Backend Program conventions for vhost-user-scsi")
> Signed-off-by: Stefan Hajnoczi <stefanha@redhat.com>
> ---
>  contrib/vhost-user-scsi/vhost-user-scsi.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
>
> diff --git a/contrib/vhost-user-scsi/vhost-user-scsi.c b/contrib/vhost-user-scsi/vhost-user-scsi.c
> index b2c0f98253..08335d4b2b 100644
> --- a/contrib/vhost-user-scsi/vhost-user-scsi.c
> +++ b/contrib/vhost-user-scsi/vhost-user-scsi.c
> @@ -433,7 +433,9 @@ out:
>      if (vdev_scsi) {
>          g_main_loop_unref(vdev_scsi->loop);
>          g_free(vdev_scsi);
> -        unlink(opt_socket_path);
> +        if (opt_socket_path) {
> +            unlink(opt_socket_path);
> +        }
>      }

Shouldn't this check-and-unlink be one level up, outside the
"if (vdev_scsi)" ? There are error exit paths which get us to
the 'out:' label where we have called unix_sock_new() but
not yet done the g_new0() of vdev_scsi(). The only thing
that needs to be guarded by "if (vdev_scsi)" is the
g_main_loop_unref() (the g_free of vdev_scsi itself could
be inside or outside, since g_free(NULL) is a nop).

thanks
-- PMM

