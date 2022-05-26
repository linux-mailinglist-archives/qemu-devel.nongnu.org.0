Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C52D534AAF
	for <lists+qemu-devel@lfdr.de>; Thu, 26 May 2022 09:16:12 +0200 (CEST)
Received: from localhost ([::1]:54398 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nu7j9-0007iM-3j
	for lists+qemu-devel@lfdr.de; Thu, 26 May 2022 03:16:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46752)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1nu7dT-0005bQ-SQ
 for qemu-devel@nongnu.org; Thu, 26 May 2022 03:10:20 -0400
Received: from mail-oi1-x22d.google.com ([2607:f8b0:4864:20::22d]:44028)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1nu7dR-00049n-RN
 for qemu-devel@nongnu.org; Thu, 26 May 2022 03:10:19 -0400
Received: by mail-oi1-x22d.google.com with SMTP id l84so1175634oif.10
 for <qemu-devel@nongnu.org>; Thu, 26 May 2022 00:10:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=MYh5sxq1TDZJmXUxWi7frjQPvGqPtnU6AVNZq6/6vR4=;
 b=LsFu8cjLV5f0FLGbmvHYNyVBx+zzQcVULYCI3ukHOXJdPvnv53Y2IpbEJBdqzvrb5D
 iw6Yv9E7u2VNcLtecv0lNYaZnxuEUjQ0SGfI6mhll+ydTgXFzKLhOTfbcMKXawPddeC1
 Y2hw4rYqWM+bUbTXu4Sp1QDEl79r44/XVCl/jN6tzURRkB5znIkkPX57qMieM5JyPHR0
 dGGueHqbK8VqglppVfuDPVbLozUfJgMzFu58YD1AN7yFj8AyRG6yyP7/S5GYcTdohAFW
 fD0UP5YHRyzWz4vb8CgzZkrYpCZEKKWhma7CWg/SMek5qZz3c/NUKgtG2lrRk97p0K7X
 D+uA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=MYh5sxq1TDZJmXUxWi7frjQPvGqPtnU6AVNZq6/6vR4=;
 b=VUdP2Hj5y8gNdRHQbzA5avEhR/CRgSZXMweqBOMmoAs24NUgGqblUeH3YDDwTY50I8
 fILGX1FCpcjy0+dPxaWb9ooTibB0R1vPFjvrCrofCbBeXj6yHKfXMw2pD0CTNmiFwu7Y
 wZ+5vH+UcKPJ72lKZVzoSdWH6CP04RwzM6S98UIoecN0kHqnfSLev4x9y/wSEYMc0J0b
 M6kDcyoyHmtqrtgigAVcO/c+emUak8lkyCXd2VtutGIdZzIXBCcDyYJ4VGUtkn44svX0
 JVmbuT6GFHIgZXQMm6MyuUNMk2d+CZNrK/HS2mNBfsQmzeZ+cq2qUlfQCxUZ8f49dWRU
 8jTg==
X-Gm-Message-State: AOAM533xnsge5pSlBlReUQChMvdOWh0DW/yuUZoFjO55vsFiM5w+pFzf
 im6TXowbZjaW74giePs8LzY3uKqkxeJBSg==
X-Google-Smtp-Source: ABdhPJxG1jFQ06/ifawRY+fwlOyLxaN1iAql5k2pKuJs0HbhjRW6dexsBr7fZ0dA8EIUJw2kYr7K8w==
X-Received: by 2002:a05:6808:657:b0:32b:10ca:f8c1 with SMTP id
 z23-20020a056808065700b0032b10caf8c1mr370675oih.143.1653549015952; 
 Thu, 26 May 2022 00:10:15 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id
 h5-20020aca1805000000b00325cda1ffb9sm325597oih.56.2022.05.26.00.10.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 26 May 2022 00:10:14 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 40C881FFB7;
 Thu, 26 May 2022 08:10:12 +0100 (BST)
References: <20220526034851.683258-1-yajunw@nvidia.com>
User-agent: mu4e 1.7.23; emacs 28.1.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Yajun Wu <yajunw@nvidia.com>
Cc: qemu-devel@nongnu.org, mst@redhat.com, Parav Pandit <parav@nvidia.com>
Subject: Re: [PATCH] virtio/vhost-user: Fix wrong vhost notifier GPtrArray size
Date: Thu, 26 May 2022 08:08:31 +0100
In-reply-to: <20220526034851.683258-1-yajunw@nvidia.com>
Message-ID: <874k1c22i3.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::22d;
 envelope-from=alex.bennee@linaro.org; helo=mail-oi1-x22d.google.com
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


Yajun Wu <yajunw@nvidia.com> writes:

> In fetch_or_create_notifier, idx begins with 0. So the GPtrArray size
> should be idx + 1 and g_ptr_array_set_size should be called with idx + 1.
>
> This wrong GPtrArray size causes fetch_or_create_notifier return an inval=
id
> address. Passing this invalid pointer to vhost_user_host_notifier_remove
> causes assert fail:
>
>     qemu/include/qemu/int128.h:27: int128_get64: Assertion `r =3D=3D a' f=
ailed.
> 	shutting down, reason=3Dcrashed
>
> Backends like dpdk-vdpa which sends out vhost notifier requests almost al=
ways
> hit qemu crash.

My bad. I was looking for ways to exercise this code but the internal
tests didn't do it. I guess I should look at getting a test setup for
dpdk. Anyway:

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>


>
> Fixes: 503e355465 ("virtio/vhost-user: dynamically assign VhostUserHostNo=
tifiers")
> Signed-off-by: Yajun Wu <yajunw@nvidia.com>
> Acked-by: Parav Pandit <parav@nvidia.com>
> Change-Id: I87e0f7591ca9a59d210879b260704a2d9e9d6bcd
> ---
>  hw/virtio/vhost-user.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/hw/virtio/vhost-user.c b/hw/virtio/vhost-user.c
> index b040c1ad2b..dbc690d16c 100644
> --- a/hw/virtio/vhost-user.c
> +++ b/hw/virtio/vhost-user.c
> @@ -1525,7 +1525,7 @@ static VhostUserHostNotifier *fetch_or_create_notif=
ier(VhostUserState *u,
>  {
>      VhostUserHostNotifier *n =3D NULL;
>      if (idx >=3D u->notifiers->len) {
> -        g_ptr_array_set_size(u->notifiers, idx);
> +        g_ptr_array_set_size(u->notifiers, idx + 1);
>      }
>=20=20
>      n =3D g_ptr_array_index(u->notifiers, idx);


--=20
Alex Benn=C3=A9e

