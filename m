Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C41FC5E4F8F
	for <lists+qemu-devel@lfdr.de>; Wed, 21 Sep 2022 20:37:32 +0200 (CEST)
Received: from localhost ([::1]:58422 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ob4Rl-0000ew-G5
	for lists+qemu-devel@lfdr.de; Wed, 21 Sep 2022 14:27:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47252)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1ob4OV-0007OG-PS
 for qemu-devel@nongnu.org; Wed, 21 Sep 2022 14:24:23 -0400
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f]:40790)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1ob4OT-0005Id-Si
 for qemu-devel@nongnu.org; Wed, 21 Sep 2022 14:24:23 -0400
Received: by mail-wm1-x32f.google.com with SMTP id
 v3-20020a1cac03000000b003b4fd0fe6c0so1209888wme.5
 for <qemu-devel@nongnu.org>; Wed, 21 Sep 2022 11:24:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:from:to:cc:subject:date;
 bh=SN5bNuYTmy9D8wWGi1N8aXUqdNV6Eto83he+e9BqfSY=;
 b=RIwLpeE+IHtJGxcNIxWX0fzX4tVqyWcf31C8d9l8lqlbbBBS7Zs49Z4zEWhRVEz9f9
 87Ko26VHZ2VBHF39lpYbno04fK8nX5oni4F87/Oq74t0Cf2qND6ZuRtuzxzEDzjAbabD
 wGBTIYLPvTYFmMfVvX+dpt378ZWtcciHn+RSEJriIKTNKJAGqzsC+DfnxURUFhDlyvfn
 kBp2Nk68W6ePgGRT3RwjJct7cVL25wtCtVxJvgAUsSlmX7K33vXQ86jV/Wo1nYB/W5NL
 x/Yv7xwYzUYArqFPpQA2xiKEqCM7WLdqUF5h1XM4klsRI4/1V9Eye6SQTfHMtRZjmiCS
 oFgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:x-gm-message-state:from:to
 :cc:subject:date;
 bh=SN5bNuYTmy9D8wWGi1N8aXUqdNV6Eto83he+e9BqfSY=;
 b=NWtEh0OcBDdzNV8aV/GMr5H+uZ9fXynVIJx9+4nGmbcPeMjVZliTaVuI9+7ViQ22Ii
 lSSJl8sEpGHs5ttoo6eDVF2UJcV/oUpm2LxyFJnxL6+R8fAoViZ+y5gxDGztAu1wKZOq
 FVkAKjlqup9OvAdgDW7Cq3nzAeRGvoxODJ/cgXh2v9qohnJQmobSXYfovKvPRVlbYEJi
 JoSqrBP2RptA+Kr3+x3g80vb4z/jv8sc+b/EeHe46zHFKu2XZw3Sj17g341AflXFxiex
 3ZiBuoO6Ub0LAOvc+B0i/lVTSRYbPzJ8L9dMNbwRlgwEG121Tl77u7n/GgWh9Iza6uYp
 gqMQ==
X-Gm-Message-State: ACrzQf0OYaMkCU2uYu5CSr7HNvpb9JLrDTGi+fccAiGf7goOgUr2lgIj
 okZGXW7pUu732M2AfPSkmE5d5A==
X-Google-Smtp-Source: AMsMyM6+OILaxgulvaEawiZk4UFCGcvNqKeTmigdlpDSu2b3Jx/szvUbCutC9gDhhYYiMCEek4yqCw==
X-Received: by 2002:a7b:cc99:0:b0:3b4:76f2:192b with SMTP id
 p25-20020a7bcc99000000b003b476f2192bmr6984132wma.138.1663784660399; 
 Wed, 21 Sep 2022 11:24:20 -0700 (PDT)
Received: from zen.linaroharston ([185.81.254.11])
 by smtp.gmail.com with ESMTPSA id
 u7-20020a056000038700b002258235bda3sm3513301wrf.61.2022.09.21.11.24.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 21 Sep 2022 11:24:19 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 3965B1FFB7;
 Wed, 21 Sep 2022 19:24:19 +0100 (BST)
References: <20220921060026.392164-1-chenh@yusur.tech>
User-agent: mu4e 1.9.0; emacs 28.2.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: chenh <chenh@yusur.tech>
Cc: raphael.norwitz@nutanix.com, mst@redhat.com, jasowang@redhat.com,
 kwolf@redhat.com, hreitz@redhat.com, qemu-block@nongnu.org,
 houyl@yusur.tech, zy@yusur.tech, lulu@redhat.com, qemu-devel@nongnu.org
Subject: Re: [PATCH v2] hw/virtio/vhost-user: support obtain vdpa device's
 mac address automatically
Date: Wed, 21 Sep 2022 19:23:12 +0100
In-reply-to: <20220921060026.392164-1-chenh@yusur.tech>
Message-ID: <87mtas60x8.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::32f;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x32f.google.com
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


chenh <chenh@yusur.tech> writes:

> From: Hao Chen <chenh@yusur.tech>
>
> When use dpdk-vdpa tests vdpa device. You need to specify the mac address=
 to
> start the virtual machine through libvirt or qemu, but now, the libvirt or
> qemu can call dpdk vdpa vendor driver's ops .get_config through vhost_net=
_get_config
> to get the mac address of the vdpa hardware without manual configuration.
>
> v1->v2:
> Only copy ETH_ALEN data of netcfg for some vdpa device such as
> NVIDIA BLUEFIELD DPU(BF2)'s netcfg->status is not right.
> We only need the mac address and don't care about the status field.
>
> Signed-off-by: Hao Chen <chenh@yusur.tech>
> ---
>  hw/block/vhost-user-blk.c |  1 -
>  hw/net/virtio-net.c       |  7 +++++++
>  hw/virtio/vhost-user.c    | 19 -------------------
>  3 files changed, 7 insertions(+), 20 deletions(-)
>
> diff --git a/hw/block/vhost-user-blk.c b/hw/block/vhost-user-blk.c
> index 9117222456..5dca4eab09 100644
> --- a/hw/block/vhost-user-blk.c
> +++ b/hw/block/vhost-user-blk.c
> @@ -337,7 +337,6 @@ static int vhost_user_blk_connect(DeviceState *dev, E=
rror **errp)
>=20=20
>      vhost_dev_set_config_notifier(&s->dev, &blk_ops);
>=20=20
> -    s->vhost_user.supports_config =3D true;

<snip>

NACK from me. The supports_config flag is there for a reason.

>=20=20
> diff --git a/hw/virtio/vhost-user.c b/hw/virtio/vhost-user.c
> index bd24741be8..8b01078249 100644
> --- a/hw/virtio/vhost-user.c
> +++ b/hw/virtio/vhost-user.c
> @@ -2013,8 +2013,6 @@ static int vhost_user_backend_init(struct vhost_dev=
 *dev, void *opaque,
>      }
>=20=20
>      if (virtio_has_feature(features, VHOST_USER_F_PROTOCOL_FEATURES)) {
> -        bool supports_f_config =3D vus->supports_config ||
> -            (dev->config_ops && dev->config_ops->vhost_dev_config_notifi=
er);
>          uint64_t protocol_features;
>=20=20
>          dev->backend_features |=3D 1ULL << VHOST_USER_F_PROTOCOL_FEATURE=
S;
> @@ -2033,23 +2031,6 @@ static int vhost_user_backend_init(struct vhost_de=
v *dev, void *opaque,
>           */
>          protocol_features &=3D VHOST_USER_PROTOCOL_FEATURE_MASK;
>=20=20
> -        if (supports_f_config) {
> -            if (!virtio_has_feature(protocol_features,
> -                                    VHOST_USER_PROTOCOL_F_CONFIG)) {
> -                error_setg(errp, "vhost-user device expecting "
> -                           "VHOST_USER_PROTOCOL_F_CONFIG but the vhost-u=
ser backend does "
> -                           "not support it.");
> -                return -EPROTO;
> -            }
> -        } else {
> -            if (virtio_has_feature(protocol_features,
> -                                   VHOST_USER_PROTOCOL_F_CONFIG)) {
> -                warn_reportf_err(*errp, "vhost-user backend supports "
> -                                 "VHOST_USER_PROTOCOL_F_CONFIG but QEMU =
does not.");
> -                protocol_features &=3D ~(1ULL << VHOST_USER_PROTOCOL_F_C=
ONFIG);
> -            }
> -        }
> -
>          /* final set of protocol features */
>          dev->protocol_features =3D protocol_features;
>          err =3D vhost_user_set_protocol_features(dev, dev->protocol_feat=
ures);


--=20
Alex Benn=C3=A9e

