Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 86BFB5A9716
	for <lists+qemu-devel@lfdr.de>; Thu,  1 Sep 2022 14:44:02 +0200 (CEST)
Received: from localhost ([::1]:59750 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oTjY9-0002QX-M9
	for lists+qemu-devel@lfdr.de; Thu, 01 Sep 2022 08:44:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36390)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1oTj7Q-0004L4-Dr
 for qemu-devel@nongnu.org; Thu, 01 Sep 2022 08:16:24 -0400
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429]:41699)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1oTj7N-0006Le-5b
 for qemu-devel@nongnu.org; Thu, 01 Sep 2022 08:16:23 -0400
Received: by mail-wr1-x429.google.com with SMTP id v16so19371215wrm.8
 for <qemu-devel@nongnu.org>; Thu, 01 Sep 2022 05:16:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:from:to:cc:subject:date;
 bh=+QzSpB6xU1csymDicIAoL89N9DMpr1Cj3kn2KY8XZAo=;
 b=nFgaE4VfbDz0dHBpS4hD2X4xlbSrK2PaFpF+Mj3sdKrWBFXZloWiK6A+vqHLTqXuIw
 ShGrWgenIfwydYYm4Mdp1VXqiqzWQ0wOA6mHwWsKLom+Q0lBy5pD6vASO4FqUP6rkMbg
 o7cEFH/plvKXQGl7WoKsI22ctCiD3ZXUNvvECm2ZwUoz2lXN/AptjYPdDtMeKs+lxO+1
 KZmmyCwvdc0jhBzwXx4Jzx6uERN1rYy+HlCmy6yVTmhz/wAsQg8lfeVbFsEFKv3hb2wx
 PD1wPlPTyCmHCP/EgjT54Jyi1YTj1lvyGZiJJiEHDYtDoOV+9jbatC7lmtYqxWwvDHxc
 iiXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:x-gm-message-state:from:to
 :cc:subject:date;
 bh=+QzSpB6xU1csymDicIAoL89N9DMpr1Cj3kn2KY8XZAo=;
 b=h1s05UO4+kfJkfIgoslHjQim+LNwkNtvU4ij3hKLSZhDdTWw4kf9XuB+9dSFDCUuu6
 LEkQwTl941bdmeCEwIMojNwxVCoYe+hC+/L4B+YERg345cVUF3iuRrtX1khjkIg1Dnhn
 SK17OhRgcehTNdlJQPec+XFTYSuvTuP5T5hkDE1+D3iWqvDUbLcsMp/t9TVIIwTV3fdC
 q/FY7eHtNdxpkKHGUy6VxTnk308FCeIZs0dBoEOb07KcMsHfI958MWNoJO+q6xELFP0M
 B1+fG0CsneN5AbQWTVEEB0HikfrUTsVnP5SGDssWBauKa6K9ghXrV9cGY79IJrWVlPzp
 TY4g==
X-Gm-Message-State: ACgBeo3WZVpbnggY6ncKsPT3TozF4MTVofPbpSxWIudX2IGDUA9/flKe
 kne/KfGK20FGdIDLVPnFeEPdOw==
X-Google-Smtp-Source: AA6agR5z8LCW9OrHXm9qFvI/UMHGfC3yEIoW46h64ew4mC1GaDrfE5bw4UXalAw7cSMx0m/KCsWaUg==
X-Received: by 2002:a05:6000:1ac8:b0:220:6af3:935d with SMTP id
 i8-20020a0560001ac800b002206af3935dmr14538228wry.549.1662034578001; 
 Thu, 01 Sep 2022 05:16:18 -0700 (PDT)
Received: from zen.linaroharston ([185.81.254.11])
 by smtp.gmail.com with ESMTPSA id
 f17-20020adfdb51000000b002252cb35184sm14154980wrj.25.2022.09.01.05.16.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 01 Sep 2022 05:16:17 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 19D351FFB7;
 Thu,  1 Sep 2022 13:16:17 +0100 (BST)
References: <20220901071803.273291-1-hi@alyssa.is>
User-agent: mu4e 1.9.0; emacs 28.1.91
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Alyssa Ross <hi@alyssa.is>
Cc: "Michael S . Tsirkin" <mst@redhat.com>, qemu-devel@nongnu.org
Subject: Re: [PATCH] docs: clarify absence of set_features in vhost-user
Date: Thu, 01 Sep 2022 13:12:06 +0100
In-reply-to: <20220901071803.273291-1-hi@alyssa.is>
Message-ID: <877d2nnvce.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::429;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x429.google.com
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


Alyssa Ross <hi@alyssa.is> writes:

> The previous wording was (at least to me) ambiguous about whether a
> backend should enable features immediately after they were set using
> VHOST_USER_SET_PROTOCOL_FEATURES, or wait for support for protocol
> features to be acknowledged if it hasn't been yet before enabling
> those features.
>
> This patch attempts to make it clearer that
> VHOST_USER_SET_PROTOCOL_FEATURES should immediately enable features,
> even if support for protocol features has not yet been acknowledged,
> while still also making clear that the frontend SHOULD acknowledge
> support for protocol features.
>
> Previous discussion begins here:
> <https://lore.kernel.org/qemu-devel/87sgd1ktx9.fsf@alyssa.is/>
>
> Cc: Michael S. Tsirkin <mst@redhat.com>
> Signed-off-by: Alyssa Ross <hi@alyssa.is>
> ---
>  docs/interop/vhost-user.rst | 14 +++++++++-----
>  1 file changed, 9 insertions(+), 5 deletions(-)
>
> diff --git a/docs/interop/vhost-user.rst b/docs/interop/vhost-user.rst
> index 3f18ab424e..c8b9771a16 100644
> --- a/docs/interop/vhost-user.rst
> +++ b/docs/interop/vhost-user.rst
> @@ -906,9 +906,9 @@ Front-end message types
>    ``VHOST_USER_SET_FEATURES``.
>=20=20
>  .. Note::
> -   Back-ends that report ``VHOST_USER_F_PROTOCOL_FEATURES`` must
> -   support this message even before ``VHOST_USER_SET_FEATURES`` was
> -   called.
> +   While QEMU should acknowledge ``VHOST_USER_F_PROTOCOL_FEATURES``, a
> +   back-end must allow ``VHOST_USER_GET_PROTOCOL_FEATURES`` even if
> +   ``VHOST_USER_F_PROTOCOL_FEATURES`` has not been acknowledged yet.

I think this is just restating the same logic from above introduced in:

  fa9972662c (vhost-user.rst: add clarifying language about protocol negoti=
ation)

that we don't need VHOST_USER_F_PROTOCOL_FEATURES to be acked by
VHOST_USER_SET_FEATURES? I agree the wording is hard to follow though. I
suspect what would really help is some clear message sequence diagrams
in the document showing the negotiation steps.


>=20=20
>  ``VHOST_USER_SET_PROTOCOL_FEATURES``
>    :id: 16
> @@ -923,8 +923,12 @@ Front-end message types
>    ``VHOST_USER_SET_FEATURES``.
>=20=20
>  .. Note::
> -   Back-ends that report ``VHOST_USER_F_PROTOCOL_FEATURES`` must support
> -   this message even before ``VHOST_USER_SET_FEATURES`` was called.
> +   While QEMU should acknowledge ``VHOST_USER_F_PROTOCOL_FEATURES``, a
> +   back-end must allow ``VHOST_USER_SET_PROTOCOL_FEATURES`` even if
> +   ``VHOST_USER_F_PROTOCOL_FEATURES`` has not been acknowledged yet.
> +   The back-end must not wait for ``VHOST_USER_SET_FEATURES`` before
> +   enabling protocol features requested with
> +   ``VHOST_USER_SET_PROTOCOL_FEATURES``.
>=20=20
>  ``VHOST_USER_SET_OWNER``
>    :id: 3
>
> base-commit: e93ded1bf6c94ab95015b33e188bc8b0b0c32670


--=20
Alex Benn=C3=A9e

