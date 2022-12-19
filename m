Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EFB9C651156
	for <lists+qemu-devel@lfdr.de>; Mon, 19 Dec 2022 18:50:27 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p7KGK-0004oQ-Ea; Mon, 19 Dec 2022 12:49:17 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1p7KGA-0004lC-A4
 for qemu-devel@nongnu.org; Mon, 19 Dec 2022 12:49:06 -0500
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1p7KG5-0000Vb-DF
 for qemu-devel@nongnu.org; Mon, 19 Dec 2022 12:49:03 -0500
Received: by mail-wm1-x329.google.com with SMTP id v7so7035530wmn.0
 for <qemu-devel@nongnu.org>; Mon, 19 Dec 2022 09:49:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:from:to:cc:subject:date
 :message-id:reply-to;
 bh=nQlFCqET+j7l4iOyoTVzc37+HlNPpLUD3+q5Axv17/g=;
 b=KrAYVMSxa1WzUvO/CH76FlWr24vzLiX0vIXV991v5Ont0oL/os0Vmvs5CVS7GsmRQG
 WCVKfW7BUuHfpH3fc4LEub6/BhZJeEO6cfKAMP5slrlBYik2wCGSb0jGhNNdTITBTbaz
 PipbSMAyIRk0DttJF6c9Ycu7/w/cbzn76Khn/t6GJnVxN1dSEye0Wa6n1nQsvjPEfCz8
 E/dswmKn+3Yft4DXGsKpFpz931JqdM+fxt91+eNCsyeAWb7W4bXbP0iuRNm8o/M6mFd1
 0fAGHpV4ujb5o1WW/uwZYPBFtPeEvSzMs8/a4KmqRM0r9+hzEIve+3DAWoKinM45DexI
 4yiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=nQlFCqET+j7l4iOyoTVzc37+HlNPpLUD3+q5Axv17/g=;
 b=mKrnpMtKZrOeg28PNFeAyPhcPOwETAJxevlqPBw89QozjI+60TIgInlJFMuk61BuoM
 DN5Ls9132bT714/ruSG9/MjhuhrzP13yYrJLAp/vDZV9SZFEys4Fidj3zde78rnYlUnn
 ADp4pkFRcl/yVd2ezu/BNHMyMPPFaUpHPYC7OBoyxm46cZmjLxON3b6R98+1cgyjvX0l
 pUUdk7WxE8Wk+SiM13+ESl9hs57RKz5GosESfS5DJpoOxS1Vb2ErlAWvI++z1oKI65MS
 ir9UT0rG+E0OFEsJE3pbRWazlHM/C4OKQnp8V5JYlM8l4R6DPlh+uoakxcvRj8sDGWue
 WtYg==
X-Gm-Message-State: AFqh2kpWVV2NeMlZhIFJ6Iuzbu44pOjSrq3vj6svGQX/a+fpDpHVuVH1
 A2aGTjEitnhwpIOWvVJFq1kqRw==
X-Google-Smtp-Source: AMrXdXvvjQWP6TiPB0LJjAv0SVSBi8Ktm2mRsNOtcaE4Xn0bt9zxQnzNbuLEtyCzjqs8Z/WaUnUOVQ==
X-Received: by 2002:a05:600c:1f14:b0:3d3:5c21:dd9d with SMTP id
 bd20-20020a05600c1f1400b003d35c21dd9dmr1928374wmb.19.1671472139301; 
 Mon, 19 Dec 2022 09:48:59 -0800 (PST)
Received: from zen.linaroharston ([185.81.254.11])
 by smtp.gmail.com with ESMTPSA id
 hn33-20020a05600ca3a100b003cf4eac8e80sm14802051wmb.23.2022.12.19.09.48.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 19 Dec 2022 09:48:58 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 5DE071FFB7;
 Mon, 19 Dec 2022 17:48:58 +0000 (GMT)
References: <20221202132231.1048669-1-alex.bennee@linaro.org>
User-agent: mu4e 1.9.7; emacs 29.0.60
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: slp@redhat.com, mst@redhat.com, marcandre.lureau@redhat.com,
 stefanha@redhat.com, mathieu.poirier@linaro.org, viresh.kumar@linaro.org,
 sgarzare@redhat.com, Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: Re: [RFC PATCH for 8.0] backends/vhost-user: relax the ioeventfd check
Date: Mon, 19 Dec 2022 17:48:50 +0000
In-reply-to: <20221202132231.1048669-1-alex.bennee@linaro.org>
Message-ID: <87v8m7i8s5.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::329;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x329.google.com
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


Alex Benn=C3=A9e <alex.bennee@linaro.org> writes:

> While you certainly need ioeventfds to work for KVM guests it
> shouldn't be limited to that. We can run vhost-user backends for TCG
> guests and either use ioeventfds or in band signalling.
>
> Maybe we should apply the same fix as b0aa77d36d (vhost-user: fix
> ioeventfd_enabled)?
>
> With this change I can run:
>
>   $QEMU $OPTS \
>     -display gtk,gl=3Don \
>     -device vhost-user-gpu-pci,chardev=3Dvhgpu \
>     -chardev socket,id=3Dvhgpu,path=3Dvhgpu.sock
>
> with:
>
>   ./contrib/vhost-user-gpu/vhost-user-gpu \
>     -s vhgpu.sock \
>     -v
>
> and at least see things start-up (although the display gets rotated by
> 180 degrees).
>
> Signed-off-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
> ---
>  backends/vhost-user.c | 10 ++--------
>  1 file changed, 2 insertions(+), 8 deletions(-)
>
> diff --git a/backends/vhost-user.c b/backends/vhost-user.c
> index 5dedb2d987..87d43fb03a 100644
> --- a/backends/vhost-user.c
> +++ b/backends/vhost-user.c
> @@ -21,12 +21,6 @@
>  #include "io/channel-command.h"
>  #include "hw/virtio/virtio-bus.h"
>=20=20
> -static bool
> -ioeventfd_enabled(void)
> -{
> -    return kvm_enabled() && kvm_eventfds_enabled();
> -}
> -
>  int
>  vhost_user_backend_dev_init(VhostUserBackend *b, VirtIODevice *vdev,
>                              unsigned nvqs, Error **errp)
> @@ -35,8 +29,8 @@ vhost_user_backend_dev_init(VhostUserBackend *b, VirtIO=
Device *vdev,
>=20=20
>      assert(!b->vdev && vdev);
>=20=20
> -    if (!ioeventfd_enabled()) {
> -        error_setg(errp, "vhost initialization failed: requires kvm");
> +    if (kvm_enabled() && !kvm_eventfds_enabled()) {
> +        error_setg(errp, "vhost initialization failed: kvm required ioev=
entfds");
>          return -1;
>      }

Gentle ping?

--=20
Alex Benn=C3=A9e
Virtualisation Tech Lead @ Linaro

