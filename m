Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9654F49E161
	for <lists+qemu-devel@lfdr.de>; Thu, 27 Jan 2022 12:44:22 +0100 (CET)
Received: from localhost ([::1]:51086 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nD3CP-0000Uw-Mk
	for lists+qemu-devel@lfdr.de; Thu, 27 Jan 2022 06:44:21 -0500
Received: from eggs.gnu.org ([209.51.188.92]:39218)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1nD2gV-0006vn-9q
 for qemu-devel@nongnu.org; Thu, 27 Jan 2022 06:11:23 -0500
Received: from [2a00:1450:4864:20::530] (port=33776
 helo=mail-ed1-x530.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1nD2gS-0006C8-9v
 for qemu-devel@nongnu.org; Thu, 27 Jan 2022 06:11:23 -0500
Received: by mail-ed1-x530.google.com with SMTP id b13so3203312edn.0
 for <qemu-devel@nongnu.org>; Thu, 27 Jan 2022 03:11:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=tZhKwAf3sYPBO+cTG0d9mActh9kh357GjbrXNGiPuT4=;
 b=jUQXB/rne540RZ911EEV0XmxxjgDzcarTyUyJZ7pP4woNpe/JzXVGYkildeQUlHFdw
 YTAjP60mlbbY+8/YfF+Ldc6gxioPnsIdAcHnGXcVWoHFXxf2ac3y8SoVHTnZYphv0z53
 iMHJ/oM9zKo/VowNxE9YEln9fnLMkCSSIyy8z6TD6nH3ZR2ftfB+YEkXu6xUzMRocreL
 gjf81K+xknaZwPZuoYOF+ZQ3nvrKf1zg4DqhCpIEDGPNDZjBAzfXfRmgBLhjx/eEKgC/
 9tNoEeppUqMfMYSVZFzLNeW9dLulsr5tUI7LUmLL4GU1xVy8ZfdAlPNkJ98BA36Jzxqf
 QbsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=tZhKwAf3sYPBO+cTG0d9mActh9kh357GjbrXNGiPuT4=;
 b=8LVNgVxf4VmPfiesLYUmUWslWZRdKUo57R2HZs2iEB2d4KcltO2kdpB3HE+iV1oxxl
 0If8bcxJaZdOMa3npEZZoYwnWODm7tloPXiJPVpGUNYMSmc7Lcxv/1wXDjctA61+u5De
 A/C0JaMh1Q7Vti2OqZIBxNpNIAjysWd/ATJtUTL5civXqD2pqqKTkqZMPtvV/2Hi4U5u
 rKQ8uOkBCl6hbx5wHIquYiymXzHFJ5urp0HcAW+zBQ5ulfoq3qM59rg4Qw3i+kbDwGpm
 mRyWV9ZIC1inYeHHSXyPTcTvAf4VGIk3RopRDztxdUFhRR2Mks6OOvVc9rhRkz7j94el
 fy8g==
X-Gm-Message-State: AOAM53388TNakaILo9CIjJQH9CEmO+dqSDWzBlm6Y/BUOvLejH/e2Grc
 c5hUMp0IklxP7TaCR925C3Ur0csVcI/IpA==
X-Google-Smtp-Source: ABdhPJy8yx/WyeGbjHUgcafY+U9vjWw3HVGUqB8t2Ks7PVfRM/HaJdcWcJ6EPJHZRcdw9BGdTvxhIw==
X-Received: by 2002:a50:aadd:: with SMTP id r29mr3204711edc.236.1643281874386; 
 Thu, 27 Jan 2022 03:11:14 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id w18sm8459271edr.59.2022.01.27.03.11.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 27 Jan 2022 03:11:13 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id B091E1FFB7;
 Thu, 27 Jan 2022 11:11:12 +0000 (GMT)
References: <20211220145624.52801-1-victortoso@redhat.com>
User-agent: mu4e 1.7.6; emacs 28.0.91
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Victor Toso <victortoso@redhat.com>
Subject: Re: [PATCH] schemas: add missing vim modeline
Date: Thu, 27 Jan 2022 11:07:46 +0000
In-reply-to: <20211220145624.52801-1-victortoso@redhat.com>
Message-ID: <87lez1bfhr.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::530
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::530;
 envelope-from=alex.bennee@linaro.org; helo=mail-ed1-x530.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Eric Blake <eblake@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Victor Toso <victortoso@redhat.com> writes:

> Similar to f7160f3218 "schemas: Add vim modeline"
>
> Signed-off-by: Victor Toso <victortoso@redhat.com>
> ---
>  qapi/audio.json  | 1 +
>  qapi/compat.json | 1 +
>  qapi/replay.json | 1 +
>  qapi/trace.json  | 1 +
>  4 files changed, 4 insertions(+)
>
> diff --git a/qapi/audio.json b/qapi/audio.json
> index 9cba0df8a4..fe3b506ec3 100644
> --- a/qapi/audio.json
> +++ b/qapi/audio.json
> @@ -1,4 +1,5 @@
>  # -*- mode: python -*-
> +# vim: filetype=3Dpython

I realise we have Emacs mode annotations here as well and I'm not going
to start a holy war but I thought we used .editorconfig to avoid messing
directly with the individual files. So something like:

  [*.json]
  indent_style =3D space
  emacs_mode =3D python
  vim_filetype =3D python

should also do the job.

>  #
>  # Copyright (C) 2015-2019 Zolt=C3=A1n K=C5=91v=C3=A1g=C3=B3 <DirtY.iCE.h=
u@gmail.com>
>  #
> diff --git a/qapi/compat.json b/qapi/compat.json
> index dd7261ae2a..c53b69fe3f 100644
> --- a/qapi/compat.json
> +++ b/qapi/compat.json
> @@ -1,4 +1,5 @@
>  # -*- Mode: Python -*-
> +# vim: filetype=3Dpython
>=20=20
>  ##
>  # =3D Compatibility policy
> diff --git a/qapi/replay.json b/qapi/replay.json
> index bfd83d7591..b4d1ba253b 100644
> --- a/qapi/replay.json
> +++ b/qapi/replay.json
> @@ -1,4 +1,5 @@
>  # -*- Mode: Python -*-
> +# vim: filetype=3Dpython
>  #
>=20=20
>  ##
> diff --git a/qapi/trace.json b/qapi/trace.json
> index eedfded512..119509f565 100644
> --- a/qapi/trace.json
> +++ b/qapi/trace.json
> @@ -1,4 +1,5 @@
>  # -*- mode: python -*-
> +# vim: filetype=3Dpython
>  #
>  # Copyright (C) 2011-2016 Llu=C3=ADs Vilanova <vilanova@ac.upc.edu>
>  #


--=20
Alex Benn=C3=A9e

