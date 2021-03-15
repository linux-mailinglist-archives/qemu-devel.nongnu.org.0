Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9337D33C861
	for <lists+qemu-devel@lfdr.de>; Mon, 15 Mar 2021 22:20:04 +0100 (CET)
Received: from localhost ([::1]:60392 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lLud9-0004j9-Kw
	for lists+qemu-devel@lfdr.de; Mon, 15 Mar 2021 17:20:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34122)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1lLuc6-0004Gx-Cm
 for qemu-devel@nongnu.org; Mon, 15 Mar 2021 17:18:58 -0400
Received: from mail-io1-xd31.google.com ([2607:f8b0:4864:20::d31]:36752)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1lLuc4-00022W-72
 for qemu-devel@nongnu.org; Mon, 15 Mar 2021 17:18:58 -0400
Received: by mail-io1-xd31.google.com with SMTP id n14so35002033iog.3
 for <qemu-devel@nongnu.org>; Mon, 15 Mar 2021 14:18:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=JGB7q6W+l9ATSnch4AqNMWdx4KSgWjdLtif7D9uKUKA=;
 b=aKtbf6ibibZBPjpwpISoHJUzKmfQGA3eVnOgUPc9yF/OIJ6w4cL/XA74y9Xm6FyXp6
 hbr1e/yFvCH8RfCZMIsq6CxfYfr0UrTo38qXscXKN9CXuYknXQBmyWjhH6T3kysJ3TvF
 Ud3zf0GvNnmqTigYsPgZeGIO7c6s2+7YPnfKxJHSFwoIVmRLKyGeuxWxOLOBgWuY0iy2
 6ss4WeQKCKXsh7Y3bSFY1zwpfXONb4K9Ip1S11dYT7HjmLezGO8un5opQVp7BrEJCQae
 xIREq1GP6HRg0R9NP018HtkYAOfN7T0xyK7o7u1PQ+aHM9FQn5BwcNnvBp4XMLvpRkzY
 Ft9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=JGB7q6W+l9ATSnch4AqNMWdx4KSgWjdLtif7D9uKUKA=;
 b=WVRdYvse2VqkELZ4E/X6xMZJxYEQsbYjQOphREsTlYjoZPlmNdchYL1e9NpopKl/wq
 F1KLJkCOkZfY6LGLqUhpA4vgfFUS0WkxGubC0w/RCQMrlPBc1O23B/s6KfI5yJVEuwd2
 Rtz/n2O08e6seL4Re2VTTAdQ1iBPi41XX0X0KW+QzaSJT9lzU6qJJxGUrUEMl5Ub1Qe4
 FTSzpfP0IYicto3CqlmwLcPCMev61111WJmvLwzotwuksdecUd9clOfb+2TxQ5MJwHzY
 0B20EMNl0YeQ65bfIuS2GHAaP0crK8XvZssOkVHfYtfaWrZZw1Ao+3pWpgfcV2/vh22w
 FbCA==
X-Gm-Message-State: AOAM531zGnvCC4sD7TdaVh9zfuI5B0XvTmKp1sOLsuaISOwAGnZXa5g6
 Y3qspwKDYkbjjB1k8MZfaUhcE/ff5h6Re3wVs9Y=
X-Google-Smtp-Source: ABdhPJwB0A7bkIb9nXKRMpNtOBWFG1FUVByvaLb9jOcFo/OGNxKuomOgfCGpk88XdDz0BQd/ePEMr5ak81mwdtnE65Y=
X-Received: by 2002:a5d:878e:: with SMTP id f14mr1139959ion.176.1615843134953; 
 Mon, 15 Mar 2021 14:18:54 -0700 (PDT)
MIME-Version: 1.0
References: <20210315170439.2868903-1-philmd@redhat.com>
In-Reply-To: <20210315170439.2868903-1-philmd@redhat.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Mon, 15 Mar 2021 17:17:18 -0400
Message-ID: <CAKmqyKPj0QPJV0L2mau115OP9FveC61617KFaOdEmyjV_S8DnQ@mail.gmail.com>
Subject: Re: [PATCH] hw/core: Only build guest-loader if libfdt is available
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::d31;
 envelope-from=alistair23@gmail.com; helo=mail-io1-xd31.google.com
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
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
Cc: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>,
 Alistair Francis <alistair.francis@wdc.com>,
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Christian Borntraeger <borntraeger@de.ibm.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, Mar 15, 2021 at 1:15 PM Philippe Mathieu-Daud=C3=A9
<philmd@redhat.com> wrote:
>
> Add a Kconfig entry for guest-loader so we can optionally deselect
> it (default is built in), and add a Meson dependency on libfdt.
>
> This fixes when building with --disable-fdt:
>
>   /usr/bin/ld: libcommon.fa.p/hw_core_guest-loader.c.o: in function `load=
er_insert_platform_data':
>   hw/core/guest-loader.c:56: undefined reference to `qemu_fdt_add_subnode=
'
>   /usr/bin/ld: hw/core/guest-loader.c:57: undefined reference to `qemu_fd=
t_setprop'
>   /usr/bin/ld: hw/core/guest-loader.c:61: undefined reference to `qemu_fd=
t_setprop_string_array'
>   /usr/bin/ld: hw/core/guest-loader.c:68: undefined reference to `qemu_fd=
t_setprop_string'
>   /usr/bin/ld: hw/core/guest-loader.c:74: undefined reference to `qemu_fd=
t_setprop_string_array'
>   collect2: error: ld returned 1 exit status
>
> Fixes: a33ff6d2c6b ("hw/core: implement a guest-loader to support static =
hypervisor guests")
> Reported-by: Christian Borntraeger <borntraeger@de.ibm.com>
> Tested-by: Christian Borntraeger <borntraeger@de.ibm.com>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  hw/core/Kconfig     | 5 +++++
>  hw/core/meson.build | 3 +--
>  2 files changed, 6 insertions(+), 2 deletions(-)
>
> diff --git a/hw/core/Kconfig b/hw/core/Kconfig
> index fdf03514d7d..9397503656d 100644
> --- a/hw/core/Kconfig
> +++ b/hw/core/Kconfig
> @@ -11,6 +11,11 @@ config GENERIC_LOADER
>      bool
>      default y
>
> +config GUEST_LOADER
> +    bool
> +    default y
> +    depends on TCG
> +
>  config OR_IRQ
>      bool
>
> diff --git a/hw/core/meson.build b/hw/core/meson.build
> index 9cd72edf513..59f1605bb07 100644
> --- a/hw/core/meson.build
> +++ b/hw/core/meson.build
> @@ -16,6 +16,7 @@
>  common_ss.add(files('cpu.c'))
>  common_ss.add(when: 'CONFIG_FITLOADER', if_true: files('loader-fit.c'))
>  common_ss.add(when: 'CONFIG_GENERIC_LOADER', if_true: files('generic-loa=
der.c'))
> +common_ss.add(when: ['CONFIG_GUEST_LOADER', fdt], if_true: files('guest-=
loader.c'))
>  common_ss.add(when: 'CONFIG_OR_IRQ', if_true: files('or-irq.c'))
>  common_ss.add(when: 'CONFIG_PLATFORM_BUS', if_true: files('platform-bus.=
c'))
>  common_ss.add(when: 'CONFIG_PTIMER', if_true: files('ptimer.c'))
> @@ -37,8 +38,6 @@
>    'clock-vmstate.c',
>  ))
>
> -softmmu_ss.add(when: 'CONFIG_TCG', if_true: files('guest-loader.c'))
> -
>  specific_ss.add(when: 'CONFIG_SOFTMMU', if_true: files(
>    'machine-qmp-cmds.c',
>    'numa.c',
> --
> 2.26.2
>
>

