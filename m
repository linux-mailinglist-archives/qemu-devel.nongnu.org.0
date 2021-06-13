Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 78E303A58AE
	for <lists+qemu-devel@lfdr.de>; Sun, 13 Jun 2021 15:25:42 +0200 (CEST)
Received: from localhost ([::1]:39712 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lsQ7Q-0005h0-W7
	for lists+qemu-devel@lfdr.de; Sun, 13 Jun 2021 09:25:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34176)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <liq3ea@gmail.com>) id 1lsQ69-000501-2s
 for qemu-devel@nongnu.org; Sun, 13 Jun 2021 09:24:21 -0400
Received: from mail-qk1-x730.google.com ([2607:f8b0:4864:20::730]:40476)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <liq3ea@gmail.com>) id 1lsQ67-00038W-86
 for qemu-devel@nongnu.org; Sun, 13 Jun 2021 09:24:20 -0400
Received: by mail-qk1-x730.google.com with SMTP id u30so35927374qke.7
 for <qemu-devel@nongnu.org>; Sun, 13 Jun 2021 06:24:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=4M2Qw9leP7RveDxmEk5ST1qcXnb+to1rcwpdVU3S0AQ=;
 b=FZ/1UPj+GdVbnyW7PAfLz+zMy8ty5pxUA9UBdeMIP+DtNyhY8xt2l9drVxcA6Bb4K3
 yTZqz3U1qbsug2n87uowk9sMpZO7VO9snaAppiCvwgQnmjDUbsbJjmjt7G+fKXLThjo0
 ID2H7l7jJkk+Fr+b0vgGfrWromstZxQ3V6UslIYELakXDj7RS9bRW/hP52aqFeCikseB
 M2pFsJlvFg/vOrXw9XeHjZLIguF3dmabUUpSAEhIFfJRcVq3p3E3vBf3ysYEkv89tdkg
 HazHYGdSejQV0iJBo8yKVujRI5Fyd7XViJl9kf7NxIsBxGHh9rA6kfaSGvBWdezFj0Lc
 yrXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=4M2Qw9leP7RveDxmEk5ST1qcXnb+to1rcwpdVU3S0AQ=;
 b=NqsXU92v+vBWcYcfaJMvQFYNAT+2r+vqghDOnu8STdnOGLC5VLEvGQVhSPgqSnSgIC
 iiOBt4pEZLwEIEaD1fbfVEH1OFVK0KLO6F1Ktj35POvDFkH21kQy53eg7EByBIchTNxx
 VN+6hlbgcJ793dx24snNIWQIQ2S6Vw1hkHm589EhzkQQbDoeMTqYUpOfMJMG2LEw3w/b
 zbCgq/2eUeSkea8qWGNeAljDSpHhSqo6isb39CwNkoRzNob3uIrGXcEe4I+mbhxuOToY
 SGnkYjBJ4axAMQS94DSWzf4Sfse4tJrAM87WHUmEkHNUtk4akwTrxxmmFPQAra53nhTu
 kckw==
X-Gm-Message-State: AOAM533koPMmqRVtYqdosSOduHEMV2fIyUE+cB1Dl95F5rDka3EZ7Um7
 UmVAudD0QQMLPyuRVfsXWSCXEPwfauq6DngR4Fc=
X-Google-Smtp-Source: ABdhPJx7DHixQEAw9UUNOnqMo6qGqge0EPJlEDv10Po7SGNJnfTKfIp+9HXqrdRZqKsLnOBCWQxLcXSIs5YzHPdlmmI=
X-Received: by 2002:a05:620a:85d:: with SMTP id
 u29mr12215689qku.346.1623590657816; 
 Sun, 13 Jun 2021 06:24:17 -0700 (PDT)
MIME-Version: 1.0
References: <20210604075029.1201478-1-kraxel@redhat.com>
In-Reply-To: <20210604075029.1201478-1-kraxel@redhat.com>
From: Li Qiang <liq3ea@gmail.com>
Date: Sun, 13 Jun 2021 21:23:41 +0800
Message-ID: <CAKXe6SJTPXzL0z7pck1Jjw=5P6oiESqL40QAZHjxCC6BC6oCiw@mail.gmail.com>
Subject: Re: [PATCH] virtio-gpu: move scanout_id sanity check
To: Gerd Hoffmann <kraxel@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::730;
 envelope-from=liq3ea@gmail.com; helo=mail-qk1-x730.google.com
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
Cc: Alexander Bulekov <alxndr@bu.edu>, Qemu Developers <qemu-devel@nongnu.org>,
 "Michael S. Tsirkin" <mst@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Gerd Hoffmann <kraxel@redhat.com> =E4=BA=8E2021=E5=B9=B46=E6=9C=884=E6=97=
=A5=E5=91=A8=E4=BA=94 =E4=B8=8B=E5=8D=883:50=E5=86=99=E9=81=93=EF=BC=9A
>
> Checking scanout_id in virtio_gpu_do_set_scanout() is too late, for the
> "resource_id =3D=3D 0" case (aka disable scanout) the scanout_id is used
> unchecked.  Move the check into the callers to fix that.
>
> Fixes: e64d4b6a9bc3 ("virtio-gpu: Refactor virtio_gpu_set_scanout")
> Fixes: 32db3c63ae11 ("virtio-gpu: Add virtio_gpu_set_scanout_blob")
> Resolves: https://gitlab.com/qemu-project/qemu/-/issues/383
> Reported-by: Alexander Bulekov <alxndr@bu.edu>
> Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>

Reviewed-by: Li Qiang <liq3ea@gmail.com>

> ---
>  hw/display/virtio-gpu.c | 20 ++++++++++++++------
>  1 file changed, 14 insertions(+), 6 deletions(-)
>
> diff --git a/hw/display/virtio-gpu.c b/hw/display/virtio-gpu.c
> index 4d549377cbc1..e183f4ecdaa5 100644
> --- a/hw/display/virtio-gpu.c
> +++ b/hw/display/virtio-gpu.c
> @@ -610,12 +610,6 @@ static void virtio_gpu_do_set_scanout(VirtIOGPU *g,
>      struct virtio_gpu_scanout *scanout;
>      uint8_t *data;
>
> -    if (scanout_id >=3D g->parent_obj.conf.max_outputs) {
> -        qemu_log_mask(LOG_GUEST_ERROR, "%s: illegal scanout id specified=
 %d",
> -                      __func__, scanout_id);
> -        *error =3D VIRTIO_GPU_RESP_ERR_INVALID_SCANOUT_ID;
> -        return;
> -    }
>      scanout =3D &g->parent_obj.scanout[scanout_id];
>
>      if (r->x > fb->width ||
> @@ -694,6 +688,13 @@ static void virtio_gpu_set_scanout(VirtIOGPU *g,
>      trace_virtio_gpu_cmd_set_scanout(ss.scanout_id, ss.resource_id,
>                                       ss.r.width, ss.r.height, ss.r.x, ss=
.r.y);
>
> +    if (ss.scanout_id >=3D g->parent_obj.conf.max_outputs) {
> +        qemu_log_mask(LOG_GUEST_ERROR, "%s: illegal scanout id specified=
 %d",
> +                      __func__, ss.scanout_id);
> +        cmd->error =3D VIRTIO_GPU_RESP_ERR_INVALID_SCANOUT_ID;
> +        return;
> +    }
> +
>      if (ss.resource_id =3D=3D 0) {
>          virtio_gpu_disable_scanout(g, ss.scanout_id);
>          return;
> @@ -730,6 +731,13 @@ static void virtio_gpu_set_scanout_blob(VirtIOGPU *g=
,
>                                            ss.r.width, ss.r.height, ss.r.=
x,
>                                            ss.r.y);
>
> +    if (ss.scanout_id >=3D g->parent_obj.conf.max_outputs) {
> +        qemu_log_mask(LOG_GUEST_ERROR, "%s: illegal scanout id specified=
 %d",
> +                      __func__, ss.scanout_id);
> +        cmd->error =3D VIRTIO_GPU_RESP_ERR_INVALID_SCANOUT_ID;
> +        return;
> +    }
> +
>      if (ss.resource_id =3D=3D 0) {
>          virtio_gpu_disable_scanout(g, ss.scanout_id);
>          return;
> --
> 2.31.1
>
>

