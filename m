Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 469F23ADB90
	for <lists+qemu-devel@lfdr.de>; Sat, 19 Jun 2021 22:04:14 +0200 (CEST)
Received: from localhost ([::1]:43070 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1luhCP-0007d9-Bu
	for lists+qemu-devel@lfdr.de; Sat, 19 Jun 2021 16:04:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46282)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <idryomov@gmail.com>)
 id 1luhB2-0006qV-DC; Sat, 19 Jun 2021 16:02:48 -0400
Received: from mail-io1-xd33.google.com ([2607:f8b0:4864:20::d33]:38602)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <idryomov@gmail.com>)
 id 1luhB0-0003yX-Fz; Sat, 19 Jun 2021 16:02:48 -0400
Received: by mail-io1-xd33.google.com with SMTP id k11so9846525ioa.5;
 Sat, 19 Jun 2021 13:02:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=UJVlJkMswPl2T/9TfSFuDR+pf8AiGB+e6hEy+7DOT+I=;
 b=WJKk7K1twpEmRSMYi/rWpKwXDEkdlWH7oQjlWgHWpGNnc6B3leK2Xj8YlBFSbAWM0O
 RKUVE2k+0H+SannYlOC9WzosA8XfBdnpmiXFzMtaMgpvQxh0X9eFsbky9elEp0uH4NrT
 MJ8W7q7im9M5EMNTm9m9EBctDqv3/jBXaClPdobi8N5HvZ79TabTNK9CiE5ioGv+kJPW
 DpZYAo56YQon0hMhicCVhoRsXLVff47a3XdXprgYZSAO6NShsQ6yUSmx1d56+DTpZR0g
 S2C3thsa+KY+Dah5bDNtZrpe/56AJ+h9c61dsJi8rbgOgRqRT01oR9r4ZSAZ3nizl4ug
 vqOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=UJVlJkMswPl2T/9TfSFuDR+pf8AiGB+e6hEy+7DOT+I=;
 b=nM0fDfO0RRqJlvYQDEUKc2wU7WRCwJQTN6b/SaS2SXr39GeiJqKbfBwUs22o+iiUQw
 scK6vW/Roc3LAwRsJkTBre7fWogg/CbRk5V/blJvEPQWtqELsKCYe4RrayeBk8hAb9zv
 RF1+7CxcBxgAAhKiUMd0KAIbYHAwiWnDiIh6v3wqYGYph8CGW5Xq439V51PXg9OAZ1Kg
 /ycixqxE0sUsCXVfj2pfjOOiWBJD1T8sCLzJBui5Ben37ZsCDMciEGO9M7AAltzsItna
 +ZBes+kP9lYh/PpxZOwmFvYMbw8QERJKARMQW/OPBMzr+VJtibG08vnFj9Aq36oyw/Zl
 hZpg==
X-Gm-Message-State: AOAM532CG6GSG77LQAdmsxTXlQoduNCgZoiOsivmMUqQqYXPKHyIZxOp
 WR5kvSajs2BG41j0hWS0DFyadbJJVDW/WSRqSTA=
X-Google-Smtp-Source: ABdhPJymDjqPB3CI5ak80J/OxZGVsIkIJZahm2OtewD+Y8Th2z7yHmZBgjiJh7y3jSCNSfntuCagfeeLr3+kbovNtfc=
X-Received: by 2002:a02:9109:: with SMTP id a9mr9767609jag.93.1624132964945;
 Sat, 19 Jun 2021 13:02:44 -0700 (PDT)
MIME-Version: 1.0
References: <20210519142359.23083-1-pl@kamp.de>
 <20210519142359.23083-3-pl@kamp.de>
In-Reply-To: <20210519142359.23083-3-pl@kamp.de>
From: Ilya Dryomov <idryomov@gmail.com>
Date: Sat, 19 Jun 2021 22:02:34 +0200
Message-ID: <CAOi1vP-vGkdhnVU-g17NSLM5_Yibeeu=GKkGsMN=+GiHONGeGA@mail.gmail.com>
Subject: Re: [PATCH V3 2/6] block/rbd: store object_size in BDRVRBDState
To: Peter Lieven <pl@kamp.de>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::d33;
 envelope-from=idryomov@gmail.com; helo=mail-io1-xd33.google.com
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
Cc: kwolf@redhat.com, berrange@redhat.com, qemu-block@nongnu.org,
 qemu-devel@nongnu.org, ct@flyingcircus.io, mreitz@redhat.com,
 Paolo Bonzini <pbonzini@redhat.com>, Ilya Dryomov <idryomov@redhat.com>,
 Jason Dillaman <dillaman@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, May 19, 2021 at 4:29 PM Peter Lieven <pl@kamp.de> wrote:
>
> Signed-off-by: Peter Lieven <pl@kamp.de>
> ---
>  block/rbd.c | 18 +++++++-----------
>  1 file changed, 7 insertions(+), 11 deletions(-)
>
> diff --git a/block/rbd.c b/block/rbd.c
> index 6b1cbe1d75..b4caea4f1b 100644
> --- a/block/rbd.c
> +++ b/block/rbd.c
> @@ -90,6 +90,7 @@ typedef struct BDRVRBDState {
>      char *snap;
>      char *namespace;
>      uint64_t image_size;
> +    uint64_t object_size;
>  } BDRVRBDState;
>
>  static int qemu_rbd_connect(rados_t *cluster, rados_ioctx_t *io_ctx,
> @@ -675,6 +676,7 @@ static int qemu_rbd_open(BlockDriverState *bs, QDict *options, int flags,
>      const QDictEntry *e;
>      Error *local_err = NULL;
>      char *keypairs, *secretid;
> +    rbd_image_info_t info;
>      int r;
>
>      keypairs = g_strdup(qdict_get_try_str(options, "=keyvalue-pairs"));
> @@ -739,13 +741,15 @@ static int qemu_rbd_open(BlockDriverState *bs, QDict *options, int flags,
>          goto failed_open;
>      }
>
> -    r = rbd_get_size(s->image, &s->image_size);
> +    r = rbd_stat(s->image, &info, sizeof(info));
>      if (r < 0) {
> -        error_setg_errno(errp, -r, "error getting image size from %s",
> +        error_setg_errno(errp, -r, "error getting image info from %s",
>                           s->image_name);
>          rbd_close(s->image);
>          goto failed_open;
>      }
> +    s->image_size = info.size;
> +    s->object_size = info.obj_size;
>
>      /* If we are using an rbd snapshot, we must be r/o, otherwise
>       * leave as-is */
> @@ -957,15 +961,7 @@ static BlockAIOCB *qemu_rbd_aio_flush(BlockDriverState *bs,
>  static int qemu_rbd_getinfo(BlockDriverState *bs, BlockDriverInfo *bdi)
>  {
>      BDRVRBDState *s = bs->opaque;
> -    rbd_image_info_t info;
> -    int r;
> -
> -    r = rbd_stat(s->image, &info, sizeof(info));
> -    if (r < 0) {
> -        return r;
> -    }
> -
> -    bdi->cluster_size = info.obj_size;
> +    bdi->cluster_size = s->object_size;
>      return 0;
>  }
>
> --
> 2.17.1
>
>
>

Reviewed-by: Ilya Dryomov <idryomov@gmail.com>

Thanks,

                Ilya

