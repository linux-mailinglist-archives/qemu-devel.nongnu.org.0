Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 279E86029B3
	for <lists+qemu-devel@lfdr.de>; Tue, 18 Oct 2022 12:54:03 +0200 (CEST)
Received: from localhost ([::1]:45426 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1okkET-00014Y-L6
	for lists+qemu-devel@lfdr.de; Tue, 18 Oct 2022 06:54:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43110)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1okk6Z-00059G-R1
 for qemu-devel@nongnu.org; Tue, 18 Oct 2022 06:45:54 -0400
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436]:44995)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1okk6W-0008BA-5J
 for qemu-devel@nongnu.org; Tue, 18 Oct 2022 06:45:51 -0400
Received: by mail-wr1-x436.google.com with SMTP id r13so22772071wrj.11
 for <qemu-devel@nongnu.org>; Tue, 18 Oct 2022 03:45:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:from:to:cc:subject:date
 :message-id:reply-to;
 bh=0DAdLdJuVRrqz8N/5zMivP3WITnVBBgpB9v/jpgXQOo=;
 b=A+B6loEXSsLP0916qU8ObbDIzH6X8n0SI2FBSn6pCGOK3nPJuAKu7+gBRCWkPCxw+o
 l84RQlA+C2/wJp2o0C1M9ge5SgtYKuhxW2QQXWLombV9j71HCPH9FCAROMFpgPxf7WFG
 EDNZcf0dDyP4lcGff3UsIYWcr31jM2o5+oXEbIPUVUKj7bxUCNZtBgECfvXVrG71/9Am
 jFP2zf9w4ymADm24ho7Szp58E6RYC8m4fuEHsL9DhzKyVN9yphbP2UsPw+zY5s8LwX6E
 aa+Qc3BcrOuMC62aFez4eoNgWlTm6HCclV0jEQsVnaQT5uFx4yhX+XB6/s2r/AaVmwj8
 l6vw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=0DAdLdJuVRrqz8N/5zMivP3WITnVBBgpB9v/jpgXQOo=;
 b=bkRM2HCb3zUgTKjVLS46Envr3uhNE2NrQMhNYmJEc92vFZRSkKD8sDaahtoxPBd0ZA
 9Gv9Kr3DCr8GfvdkRbAjBhOerkffXJ9rFfc6W9917FqhEh4v0fcY1fa1aIHgwE77cwL/
 36rb277gJfnjKtsl4yqubJJG4MG5eHoCj/F4gXMZtT6VhXbZCVM/zbdt1islAGKjbTaS
 0/BcLPIuCUfqrX20S+3LBDIrItUS7V8ZxYipHpXJVKH/MP/Pw93EjT5qT7ByTiadLDMD
 ED0MRlVo4ZU+kR0u2LhffgtN2DEG/ANse4nYTaYFqBv0JZx6D76EE5Sw2z05lNtKDye4
 Q2DA==
X-Gm-Message-State: ACrzQf0/ck+PJQ6VLtqx1FB434ib/4pfJfmGbV85tZGwv27r0mxJUdmZ
 J26M6oMszOhNC6TWHQO8GDkQ09ULxFLZ3A==
X-Google-Smtp-Source: AMsMyM74IfiE4z1v7T9VJXW6JofphW2u5IysNnYHZBuhHbecqfjHkuAkwGz6VL+Z09KFbM8G7/KzdQ==
X-Received: by 2002:adf:ebcf:0:b0:22c:9eb4:d6f6 with SMTP id
 v15-20020adfebcf000000b0022c9eb4d6f6mr1458324wrn.251.1666089946258; 
 Tue, 18 Oct 2022 03:45:46 -0700 (PDT)
Received: from zen.linaroharston ([185.81.254.11])
 by smtp.gmail.com with ESMTPSA id
 g2-20020a05600c000200b003c5571c27a1sm15614469wmc.32.2022.10.18.03.45.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 18 Oct 2022 03:45:45 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 0F09F1FFB7;
 Tue, 18 Oct 2022 11:45:45 +0100 (BST)
References: <20221018023651.1359420-1-yajunw@nvidia.com>
User-agent: mu4e 1.9.1; emacs 28.2.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Yajun Wu <yajunw@nvidia.com>
Cc: qemu-devel@nongnu.org, mst@redhat.com, Parav Pandit <parav@nvidia.com>
Subject: Re: [PATCH] vhost-user: Fix out of order vring host notification
 handling
Date: Tue, 18 Oct 2022 11:34:34 +0100
In-reply-to: <20221018023651.1359420-1-yajunw@nvidia.com>
Message-ID: <87ilkhcsva.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::436;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x436.google.com
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


Yajun Wu <yajunw@nvidia.com> writes:

> vhost backend sends host notification for every VQ. If backend creates
> VQs in parallel, the VHOST_USER_SLAVE_VRING_HOST_NOTIFIER_MSG may
> arrive to QEMU in different order than incremental queue index order.
>
> For example VQ 1's message arrive earlier than VQ 0's:
> After alloc VhostUserHostNotifier for VQ 1. GPtrArray becomes
>
>     [ nil, VQ1 pointer ]
>
> After alloc VhostUserHostNotifier for VQ 0. GPtrArray becomes
>
>     [ VQ0 pointer, nil, VQ1 pointer ]
>
> This is wrong. fetch_notifier will return NULL for VQ 1 in
> vhost_user_get_vring_base, causes host notifier miss removal(leak).
>
> The fix is to remove current element from GPtrArray, make the right
> position for element to insert.
>
> Fixes: 503e355465 ("virtio/vhost-user: dynamically assign VhostUserHostNo=
tifiers")
> Signed-off-by: Yajun Wu <yajunw@nvidia.com>
> Acked-by: Parav Pandit <parav@nvidia.com>
>
> ---
>  hw/virtio/vhost-user.c | 5 +++++
>  1 file changed, 5 insertions(+)
>
> diff --git a/hw/virtio/vhost-user.c b/hw/virtio/vhost-user.c
> index 03415b6c95..d256ce589b 100644
> --- a/hw/virtio/vhost-user.c
> +++ b/hw/virtio/vhost-user.c
> @@ -1543,6 +1543,11 @@ static VhostUserHostNotifier *fetch_or_create_noti=
fier(VhostUserState *u,
>=20=20
>      n =3D g_ptr_array_index(u->notifiers, idx);
>      if (!n) {
> +        /*
> +         * In case notification arrive out-of-order,
> +         * make room for current index.
> +         */
> +        g_ptr_array_remove_index(u->notifiers, idx);
>          n =3D g_new0(VhostUserHostNotifier, 1);
>          n->idx =3D idx;
>          g_ptr_array_insert(u->notifiers, idx, n);

Ahh reading the description of g_ptr_array_insert() it doesn't
explicitly say it shuffles the data currently at index up but I can see
from the code it does. I guess you can imply it from the other function
descriptions.

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

--=20
Alex Benn=C3=A9e

