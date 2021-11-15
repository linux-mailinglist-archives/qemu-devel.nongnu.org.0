Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A293A44FDEB
	for <lists+qemu-devel@lfdr.de>; Mon, 15 Nov 2021 05:26:14 +0100 (CET)
Received: from localhost ([::1]:38900 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mmTZN-0007l1-QZ
	for lists+qemu-devel@lfdr.de; Sun, 14 Nov 2021 23:26:13 -0500
Received: from eggs.gnu.org ([209.51.188.92]:36294)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1mmTYH-00069h-DY
 for qemu-devel@nongnu.org; Sun, 14 Nov 2021 23:25:05 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:44389)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1mmTYF-0004aq-IW
 for qemu-devel@nongnu.org; Sun, 14 Nov 2021 23:25:05 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1636950303;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=9zxDZXS/cxBLKNjZ8UbDGljJ3IyACTHH16hzvtSyZaE=;
 b=YOO0K1P8Q66qxoi5oraqm82qY8DTgtsUt9lCTq6voVoK/62W0DJubav6Bb1fjmHoLLpAVh
 dG/i7TVoC5SwWi9dU9+JEpbcj6jr7/xQR8qLjslVjoaSuM2j6KRieB6MmCDb9o1eZ2rKxb
 kghYHVrYrNp1HxEI3M407OTk/nJW4a4=
Received: from mail-lf1-f72.google.com (mail-lf1-f72.google.com
 [209.85.167.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-304-wVEDYIS9PnmrLTPcGYftIg-1; Sun, 14 Nov 2021 23:25:02 -0500
X-MC-Unique: wVEDYIS9PnmrLTPcGYftIg-1
Received: by mail-lf1-f72.google.com with SMTP id
 g38-20020a0565123ba600b004036147023bso6221682lfv.10
 for <qemu-devel@nongnu.org>; Sun, 14 Nov 2021 20:25:01 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=9zxDZXS/cxBLKNjZ8UbDGljJ3IyACTHH16hzvtSyZaE=;
 b=JmjG3sdp4telsjPgNYloVTFL49EyJo20AdYXHBzEupDeVdJ9lJxU7rOfSLo3N3x0R7
 kAXo7hWW7q7EGm/+YRNOcrF5f3oPccn/E8kcExt51h0NR56GzqRfYZul7Qul1/30nXWw
 wGLE/m801lUZsgNIoBafJ7MA75UVfwVlM3BfQkNzUw7v9rxMWK8ybY3U50ZEve3SpETM
 WZ8dBhmKK1Ng6R7+lEAnaOxlR25y4aLpqUJiWXhWDN+YzO9nerK9i/e+6h2h2kgXPwrb
 8aW0SaDt+69D4VLlTYbJQEkkczU1kqiWUpqFYGS0m+8GKDQiXUlbV25p/wP9Ao1PdFSs
 BGZQ==
X-Gm-Message-State: AOAM533Tfndpj7CuBZEas701PIqxfdV2L2T9tG2qWCcUN95UWDgQvcfL
 Wu/8IY2xD1AgHmFOv3WvBrNeo+sqhOi7Fzu0NiDsIMHgBGg0rph91Cjf7Bx/NSKVlO3F/YAhdRj
 XQ2NHpAw/m1lmbvA6ST5GjpRDChxOkVM=
X-Received: by 2002:a05:6512:3b2b:: with SMTP id
 f43mr32393665lfv.629.1636950300420; 
 Sun, 14 Nov 2021 20:25:00 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzgdbzeMenrikB9Dh0sRiJGDUD/mSmat44/IKd7a1cGJ5oa5xsN/fsMBt8smok1eE5Ov9yC/uBcn2nPHzcEEeE=
X-Received: by 2002:a05:6512:3b2b:: with SMTP id
 f43mr32393660lfv.629.1636950300286; 
 Sun, 14 Nov 2021 20:25:00 -0800 (PST)
MIME-Version: 1.0
References: <20211112193431.2379298-1-eperezma@redhat.com>
 <20211112193431.2379298-3-eperezma@redhat.com>
In-Reply-To: <20211112193431.2379298-3-eperezma@redhat.com>
From: Jason Wang <jasowang@redhat.com>
Date: Mon, 15 Nov 2021 12:24:49 +0800
Message-ID: <CACGkMEu737cb0UFgm3txQ6jbBJ-xwCphppFYz78BeSFMPGdeOA@mail.gmail.com>
Subject: Re: [PATCH 2/2] vdpa: Check for existence of opts.vhostdev
To: =?UTF-8?Q?Eugenio_P=C3=A9rez?= <eperezma@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jasowang@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.133.124; envelope-from=jasowang@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.695,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: qemu-trivial@nongnu.org, Laurent Vivier <lvivier@redhat.com>,
 qemu-devel <qemu-devel@nongnu.org>, Cindy Lu <lulu@redhat.com>,
 "Michael S . Tsirkin" <mst@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Sat, Nov 13, 2021 at 3:35 AM Eugenio P=C3=A9rez <eperezma@redhat.com> wr=
ote:
>
> Since net_init_vhost_vdpa is trying to open it. Not specifying it in the
> command line crash qemu.
>
> Fixes: 7327813d17 ("vhost-vdpa: open device fd in net_init_vhost_vdpa()")
> Signed-off-by: Eugenio P=C3=A9rez <eperezma@redhat.com>

Acked-by: Jason Wang <jasowang@redhat.com>

> ---
>  net/vhost-vdpa.c | 4 ++++
>  1 file changed, 4 insertions(+)
>
> diff --git a/net/vhost-vdpa.c b/net/vhost-vdpa.c
> index 6ffb29f4da..bbd3576f23 100644
> --- a/net/vhost-vdpa.c
> +++ b/net/vhost-vdpa.c
> @@ -260,6 +260,10 @@ int net_init_vhost_vdpa(const Netdev *netdev, const =
char *name,
>
>      assert(netdev->type =3D=3D NET_CLIENT_DRIVER_VHOST_VDPA);
>      opts =3D &netdev->u.vhost_vdpa;
> +    if (!opts->vhostdev) {
> +        error_setg(errp, "vdpa character device not specified with vhost=
dev");
> +        return -1;
> +    }
>
>      vdpa_device_fd =3D qemu_open(opts->vhostdev, O_RDWR, errp);
>      if (vdpa_device_fd =3D=3D -1) {
> --
> 2.27.0
>


