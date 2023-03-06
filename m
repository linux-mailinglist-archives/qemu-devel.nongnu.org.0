Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 378C06AC6ED
	for <lists+qemu-devel@lfdr.de>; Mon,  6 Mar 2023 17:03:00 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pZDHW-0000pp-GQ; Mon, 06 Mar 2023 11:01:46 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pZDHU-0000pb-Bm
 for qemu-devel@nongnu.org; Mon, 06 Mar 2023 11:01:44 -0500
Received: from mail-pl1-x633.google.com ([2607:f8b0:4864:20::633])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pZDHS-0007Lq-N1
 for qemu-devel@nongnu.org; Mon, 06 Mar 2023 11:01:44 -0500
Received: by mail-pl1-x633.google.com with SMTP id ky4so10916337plb.3
 for <qemu-devel@nongnu.org>; Mon, 06 Mar 2023 08:01:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1678118501;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=o4t6/LY2ElCnAOlu2Fx4w8/cuO9p5QsAqvGiPHBKUpY=;
 b=awe4HMJyzOj8Su0GsmKZzDw6t2wE1NuXK6Csz43vB6mTHg7/xfrpomy7QHCwx7fmzJ
 qFv2Ri1WilL8h6JRkfYG8I1NNd5Km6UEQ0Ro2dAmNnr9cmCOk98ndKMe8bErHcSBdNYD
 ey8zpyShaX1PoC1pwHP11m4PxlKPjVsyJ29QXFvFhKXpQ/rvk1iu1C/xnhz8pwRfUJ/s
 RI/CDxOiTR0f8AlWbYniD6917Ht+smsGum46msgoEfRVpr7xOKbTCjGmkFjKC3WVB06n
 QzkwqwNYWDSj31p7Vq2Om1EqglG+xqjuJtoGQ2POp/vsfzbjhfj+MnFtrFH8lHRch555
 6WSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678118501;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=o4t6/LY2ElCnAOlu2Fx4w8/cuO9p5QsAqvGiPHBKUpY=;
 b=KXsqvIrjh1syI23ka1LDUVf270nKP31IQLGqKUpLmxUQ0YgeAYLuclXkHJJZU05Y6A
 Sbn/kbjUBO8/p1sOwOdhEo7dtIwKD9d9/pt56Fu0Aptcycl0bcoWOfVpphzPfpWMrMy3
 689bdEOEok/x8n79ijPIe1pic0g4ngJwvsWxl9a1Vy5D+LCGOcBTRSd18kuuPH4KIG51
 c5Pr9QA6rrBbVmjjz9yYBqeyMZOy97gx5JJAw5G3ewONpAYl1/CZ4TXugq5O+G8xzwrq
 +53tzVlukwo3DEInsW9PTY4ZoVb7BB5F55BljtvN0nvV/EjZErMyzQfPnub2wXGiAA9+
 RZSQ==
X-Gm-Message-State: AO0yUKUU1LpYqdpFvowlnbFfMy8Zv0apm7g0iTNQDavKi3g6MktAqxxT
 96kWJN4jdtVtIBaYqFLNZlCSM9XSndgsI6CYv5Nq0g==
X-Google-Smtp-Source: AK7set9q1iVSz3BWXNLQRd/yqxiwuu8H7E8Oex3gAh5jsMn781dZZ0G3Lxj+hFB6GZNmsuuw77T/K/cfCeS5PZQMdtI=
X-Received: by 2002:a17:902:a3c6:b0:19b:8cbb:30fe with SMTP id
 q6-20020a170902a3c600b0019b8cbb30femr4435066plb.13.1678118500693; Mon, 06 Mar
 2023 08:01:40 -0800 (PST)
MIME-Version: 1.0
References: <20230302121719.9390-1-aesteve@redhat.com>
In-Reply-To: <20230302121719.9390-1-aesteve@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 6 Mar 2023 16:01:29 +0000
Message-ID: <CAFEAcA9c98wLAEbtYDfP4eJaopyZY6OSZq=KqzaDq+DvsHk-_Q@mail.gmail.com>
Subject: Re: [PATCH] hw/virtio/vhost-user: avoid using unitialized errp
To: Albert Esteve <aesteve@redhat.com>
Cc: qemu-devel@nongnu.org, alex.bennee@linaro.org, 
 "Michael S. Tsirkin" <mst@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::633;
 envelope-from=peter.maydell@linaro.org; helo=mail-pl1-x633.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Thu, 2 Mar 2023 at 12:18, Albert Esteve <aesteve@redhat.com> wrote:
>
> During protocol negotiation, when we the QEMU
> stub does not support a backend with F_CONFIG,
> it throws a warning and supresses the
> VHOST_USER_PROTOCOL_F_CONFIG bit.
>
> However, the warning uses warn_reportf_err macro
> and passes an unitialized errp pointer. However,
> the macro tries to edit the 'msg' member of the
> unitialized Error and segfaults.
>
> Instead, just use warn_report, which prints a
> warning message directly to the output.
>
> Fixes: 5653493 ("hw/virtio/vhost-user: don't suppress F_CONFIG when supported")
> Signed-off-by: Albert Esteve <aesteve@redhat.com>
> ---
>  hw/virtio/vhost-user.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/hw/virtio/vhost-user.c b/hw/virtio/vhost-user.c
> index e68daa35d4..34c331b3ba 100644
> --- a/hw/virtio/vhost-user.c
> +++ b/hw/virtio/vhost-user.c
> @@ -2031,8 +2031,8 @@ static int vhost_user_backend_init(struct vhost_dev *dev, void *opaque,
>          } else {
>              if (virtio_has_feature(protocol_features,
>                                     VHOST_USER_PROTOCOL_F_CONFIG)) {
> -                warn_reportf_err(*errp, "vhost-user backend supports "
> -                                 "VHOST_USER_PROTOCOL_F_CONFIG but QEMU does not.");
> +                warn_report("vhost-user backend supports "
> +                            "VHOST_USER_PROTOCOL_F_CONFIG but QEMU does not.");
>                  protocol_features &= ~(1ULL << VHOST_USER_PROTOCOL_F_CONFIG);
>              }
>          }

This looks like the right fix to me. warn_reportf_err() is for
"print this message along with the information in the Error object".
But in this code path we are not trying to handle an error that
was reported to us by a function that sets up Error, so it's
not the right function to use.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

