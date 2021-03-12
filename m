Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 55FEA339485
	for <lists+qemu-devel@lfdr.de>; Fri, 12 Mar 2021 18:18:17 +0100 (CET)
Received: from localhost ([::1]:33312 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lKlQV-00045t-SL
	for lists+qemu-devel@lfdr.de; Fri, 12 Mar 2021 12:18:15 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:55172)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lKlOJ-0002Vy-9W
 for qemu-devel@nongnu.org; Fri, 12 Mar 2021 12:15:59 -0500
Received: from mail-ed1-x532.google.com ([2a00:1450:4864:20::532]:43729)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lKlOA-00053a-EK
 for qemu-devel@nongnu.org; Fri, 12 Mar 2021 12:15:58 -0500
Received: by mail-ed1-x532.google.com with SMTP id e7so8987167edu.10
 for <qemu-devel@nongnu.org>; Fri, 12 Mar 2021 09:15:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=4oiRe1kS/b6vN5O/xczKCfDRp0JaHSih/mWF+78ZCXo=;
 b=GkrKQnlT2dQtvmBwOsFkjKI1fDeNy8/n0djY7wWcc4w+R+2rVOVx6LRYL5lG0MYg4o
 ZWPrURynnHG71B6tBIkyz8EUVlm3LlbgKGjE3GXWhgo5+NAofL686QTVgBCN5bADYF4p
 qdKU2wjIfgAs9SdVWakfJwpoV69gg76oaIXz6nxPUe+0cipG6bZ5AZCZQqvVrtr/wPhN
 abDsqJOo3CgqiY95vF0pFTKasbaWBmRer1rTH/Kz1YI8BlKvvWlqJA3kHzn9BIE9OiEv
 gkkBwadiP2W7kcAvpbZr8DdWpv4q9yrxc4tzQeAvcBaBkPYgDJq2Lsv+do9Rr/hYbGP/
 Zf0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=4oiRe1kS/b6vN5O/xczKCfDRp0JaHSih/mWF+78ZCXo=;
 b=PCpPWU88LmbtQr8WLSeJpSV7HwUMBxBM8Yb7YCHyKS5lsRu9vw3NTnNk6N9MKmg1yS
 Q+3DL+d+Bs8ZQntYb3yv8csCdCTAIrKcHxDKgstI30S8fU4vR4IWv+wfMl4FaSG1wmVF
 wpOZZneMiYjUEKipwRvqVI0Xg0ZZnPWYmSXJheogEKFfnXrADMTQ8PEP6X85nJ3gPvSh
 jkN1f/nwVuiVjTenUE8RoEXiNPJIk3c23E6h4vc9PIVrgwiu1GHvMKOM2DxQcueYEw/d
 UO37o8lPQcPdu0XEvzbJyBv5BqJM7f9H5+hxtFL0KsMiCDVP5H8Z3Gi2wqfzpo+YMg2O
 UIbQ==
X-Gm-Message-State: AOAM533hR8XN/sxGYTDZqPBaVFhZyXLrSzbh6c6m/iBDhKeyn+b8zRoo
 kGz84KtR7JymidfhJR4uGcpZCQ==
X-Google-Smtp-Source: ABdhPJxwXyCuuOu0daylCaaq0MCsZQbVMgz6KsMgksTzssR6kAbVX2mAMsS0HpgGDpdqGSi35uk7+g==
X-Received: by 2002:aa7:cc94:: with SMTP id p20mr15608414edt.353.1615569348422; 
 Fri, 12 Mar 2021 09:15:48 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id d19sm3308256edr.45.2021.03.12.09.15.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 12 Mar 2021 09:15:47 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 7979D1FF7E;
 Fri, 12 Mar 2021 17:15:46 +0000 (GMT)
References: <20201013002806.1447-1-luoyonggang@gmail.com>
User-agent: mu4e 1.5.10; emacs 28.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Yonggang Luo <luoyonggang@gmail.com>
Subject: Re: [PATCH v6 0/5] Enable plugin support on msys2/mingw
Date: Fri, 12 Mar 2021 17:15:00 +0000
In-reply-to: <20201013002806.1447-1-luoyonggang@gmail.com>
Message-ID: <874khge1j1.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::532;
 envelope-from=alex.bennee@linaro.org; helo=mail-ed1-x532.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Yonggang Luo <luoyonggang@gmail.com> writes:

> V5-V6=3D0D
> Skip merged patches=3D0D

Queued to 1 and 2 into plugins/next, thanks.

> =3D0D
> V3-V4=3D0D
> Split  plugin: Fixes typo in qemu-plugin.h out=3D0D
> Trying to explain the design of=3D0D
> plugin: Getting qemu-plugin works under win32.=3D0D
> =3D0D
> V1-V2=3D0D
> 1. Fixes review comments=3D0D
> 2. Increase QEMU_PLUGIN_VERSION to 1 for compat  QEMU_PLUGIN_VERSION 0=3D=
0D
> 3. Revise the loader to support for version 0 and 1=3D0D
> 4. By export function qemu_plugin_initialize in plugin, and call it in lo=
ad=3D
> er=3D3D=3D0D
> , so=3D0D
>   we have no need call it in every plugin. And also provide a standard im=
pl=3D
> em=3D3D=3D0D
> entation,=3D0D
>   anyway, use can also override it.=3D0D
> =3D0D
> Add this feature on msys2/mingw by using glib provided cross-platform dls=
ym=3D
>  f=3D3D=3D0D
> unctional.=3D0D
> =3D0D
> Yonggang Luo (5):=3D0D
>   plugins: getting qemu_plugin_get_hwaddr only expose one function=3D0D
>     prototype=3D0D
>   plugins: Fixes typo in qemu-plugin.h=3D0D
>   plugins: Getting qemu-plugin works under win32.=3D0D
>   plugins: Getting qemu-plugin.h can be included in multiple source file=
=3D0D
>   cirrus: Enable plugins in cirrus for windows=3D0D
> =3D0D
>  .cirrus.yml                  |   1 +=3D0D
>  Makefile                     |   1 -=3D0D
>  configure                    |  71 ------------=3D0D
>  contrib/plugins/hotblocks.c  |   1 +=3D0D
>  contrib/plugins/hotpages.c   |   1 +=3D0D
>  contrib/plugins/howvec.c     |   1 +=3D0D
>  contrib/plugins/lockstep.c   |   1 +=3D0D
>  include/qemu/qemu-plugin.h   | 208 +++++++++++++++++++++++++++--------=
=3D0D
>  meson.build                  |   6 +-=3D0D
>  plugins/api.c                | 113 ++++++++++---------=3D0D
>  plugins/core.c               |  16 ++-=3D0D
>  plugins/loader.c             |  50 ++++++++-=3D0D
>  plugins/meson.build          |  10 +-=3D0D
>  plugins/plugin.h             |   1 +=3D0D
>  plugins/qemu-plugins.symbols |  40 -------=3D0D
>  tests/plugin/bb.c            |   1 +=3D0D
>  tests/plugin/empty.c         |   1 +=3D0D
>  tests/plugin/insn.c          |   1 +=3D0D
>  tests/plugin/mem.c           |   1 +=3D0D
>  19 files changed, 298 insertions(+), 227 deletions(-)=3D0D
>  delete mode 100644 plugins/qemu-plugins.symbols=3D0D
> =3D0D
> --=3D3D20=3D0D
> 2.28.0.windows.1=3D0D
> =3D0D


--=20
Alex Benn=C3=A9e

