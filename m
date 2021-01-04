Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EB6B12E8FAF
	for <lists+qemu-devel@lfdr.de>; Mon,  4 Jan 2021 05:02:23 +0100 (CET)
Received: from localhost ([::1]:56978 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kwH4Y-0001eb-I1
	for lists+qemu-devel@lfdr.de; Sun, 03 Jan 2021 23:02:22 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:36042)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <raphael.s.norwitz@gmail.com>)
 id 1kwH3W-0001Bv-5f; Sun, 03 Jan 2021 23:01:18 -0500
Received: from mail-ot1-x32f.google.com ([2607:f8b0:4864:20::32f]:42790)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <raphael.s.norwitz@gmail.com>)
 id 1kwH3U-000401-Jt; Sun, 03 Jan 2021 23:01:17 -0500
Received: by mail-ot1-x32f.google.com with SMTP id 11so24860887oty.9;
 Sun, 03 Jan 2021 20:01:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=T44tOiCFP+HXGi+Kk+3H8L1/RjjJ0G7cnH5l3ZTBqlM=;
 b=dsfZJxpnJz5fAacvYm1bF0IWrGC+8F4HPfcPEaiJxjEObygXe48rwMTRg9Haw4FNi5
 AQ0AG65623DUug1WRbDQGAaeLYj+ODwCKAJv8bf6gMRuDm2+k/ZZkG76cVCVYqyunG/5
 mMfgEc1vu1yyaWGOLRKuVWxqfD+4qIZeCaIR70qDGSUYbv7hdBws1c/5Ja85b+b9HE+w
 1RV/854K214PvwCErhUmSqoI6JRHRoBvc4T4X1iH4mU3cF4jOBaDtgBBTDqCfwi+VPbl
 hp2QIAmkIWaSNWlP6UPkHIJQ+9E7TBwHdRQUTpKjrIbL3gM+fw6ShAj0NRuAJouU49XH
 NrnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=T44tOiCFP+HXGi+Kk+3H8L1/RjjJ0G7cnH5l3ZTBqlM=;
 b=SyTmSvkHzV44gxum6eK9NNOnSAtEETY2Gc/LnoUArAhWt0nscZS9+KMzVudwlmeQNP
 a4FRWYzZ5Fgf9b5X+BevCkHV6MvWUhGbK22zk/NTmI0wKseUvO3+q4r6upP4fYvhVryu
 qCbP3FMZOxmb0StFFaH7c2SLMnbuss289u6PkDyrmqTUFgaU9yYwf97Cq5THw1Py1m7d
 6uDbRxrkEoZ05rpBcT62eJeD37F6lRC7EazMTcrcMALrusAtkBq2FKMMyEq3/Cslh2ea
 u3sdiCYgSOdL0Wge4TQQZbM0J3iObAnxESMn/mOLzPtBQaTY0zD9KcaZgf2qDn17Ysyn
 hKyA==
X-Gm-Message-State: AOAM532jQ7os3l79Ith3eon1mNWoOeKKv/Bu2vtzxG0OrQDTYLL9EmpM
 FM3YTVAivq5YdbqkFvy9W29MeomDL6Z2zM9PFE4=
X-Google-Smtp-Source: ABdhPJxINABhWLQ1llCOHXi7i8asCD77wE1m5nzlSmXpUpMfOk+g5Z6l2IBzLSIipwJB5Z69WdbWhlNQ8ZzNhkpIbbQ=
X-Received: by 2002:a05:6830:164d:: with SMTP id
 h13mr48912450otr.337.1609732874234; 
 Sun, 03 Jan 2021 20:01:14 -0800 (PST)
MIME-Version: 1.0
References: <20201207172030.251905-1-stefanha@redhat.com>
 <20201207172030.251905-2-stefanha@redhat.com>
In-Reply-To: <20201207172030.251905-2-stefanha@redhat.com>
From: Raphael Norwitz <raphael.s.norwitz@gmail.com>
Date: Sun, 3 Jan 2021 23:01:03 -0500
Message-ID: <CAFubqFv9XzrtRWpeppGh2v5qM_pSZiTB2o_a_9kGwXv1d=LjEg@mail.gmail.com>
Subject: Re: [PATCH v2 01/12] vhost-user-blk: fix blkcfg->num_queues endianness
To: Stefan Hajnoczi <stefanha@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::32f;
 envelope-from=raphael.s.norwitz@gmail.com; helo=mail-ot1-x32f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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
Cc: Laurent Vivier <lvivier@redhat.com>, Kevin Wolf <kwolf@redhat.com>,
 Thomas Huth <thuth@redhat.com>, qemu-block@nongnu.org,
 Peter Maydell <peter.maydell@linaro.org>,
 "Michael S . Tsirkin" <mst@redhat.com>, QEMU <qemu-devel@nongnu.org>,
 Coiby Xu <Coiby.Xu@gmail.com>, Max Reitz <mreitz@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Raphael Norwitz <raphael.norwitz@nutanix.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Apologies for the late review - will get to the rest of the series as
soon as I can.

On Mon, Dec 7, 2020 at 12:31 PM Stefan Hajnoczi <stefanha@redhat.com> wrote:
>
> Treat the num_queues field as virtio-endian. On big-endian hosts the
> vhost-user-blk num_queues field was in the wrong endianness.
>
> Move the blkcfg.num_queues store operation from realize to
> vhost_user_blk_update_config() so feature negotiation has finished and
> we know the endianness of the device. VIRTIO 1.0 devices are
> little-endian, but in case someone wants to use legacy VIRTIO we support
> all endianness cases.
>
> Signed-off-by: Stefan Hajnoczi <stefanha@redhat.com>

Reviewed-by: Raphael Norwitz <raphael.norwitz@nutanix.com>


> ---
>  hw/block/vhost-user-blk.c | 7 +++----
>  1 file changed, 3 insertions(+), 4 deletions(-)
>
> diff --git a/hw/block/vhost-user-blk.c b/hw/block/vhost-user-blk.c
> index 2dd3d93ca0..d9d9dc8a89 100644
> --- a/hw/block/vhost-user-blk.c
> +++ b/hw/block/vhost-user-blk.c
> @@ -53,6 +53,9 @@ static void vhost_user_blk_update_config(VirtIODevice *vdev, uint8_t *config)
>  {
>      VHostUserBlk *s = VHOST_USER_BLK(vdev);
>
> +    /* Our num_queues overrides the device backend */
> +    virtio_stw_p(vdev, &s->blkcfg.num_queues, s->num_queues);
> +
>      memcpy(config, &s->blkcfg, sizeof(struct virtio_blk_config));
>  }
>
> @@ -490,10 +493,6 @@ reconnect:
>          goto reconnect;
>      }
>
> -    if (s->blkcfg.num_queues != s->num_queues) {
> -        s->blkcfg.num_queues = s->num_queues;
> -    }
> -
>      return;
>
>  virtio_err:
> --
> 2.28.0
>

