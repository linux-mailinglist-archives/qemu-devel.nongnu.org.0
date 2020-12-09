Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AB4212D44A1
	for <lists+qemu-devel@lfdr.de>; Wed,  9 Dec 2020 15:45:58 +0100 (CET)
Received: from localhost ([::1]:39344 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kn0j7-0002yW-P0
	for lists+qemu-devel@lfdr.de; Wed, 09 Dec 2020 09:45:57 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:46938)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kn0bi-0004iy-4G
 for qemu-devel@nongnu.org; Wed, 09 Dec 2020 09:38:19 -0500
Received: from mail-ed1-x544.google.com ([2a00:1450:4864:20::544]:42011)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kn0bY-0006qi-J8
 for qemu-devel@nongnu.org; Wed, 09 Dec 2020 09:38:17 -0500
Received: by mail-ed1-x544.google.com with SMTP id v22so1792781edt.9
 for <qemu-devel@nongnu.org>; Wed, 09 Dec 2020 06:38:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=tY2pRoJSA4IwRutKjYqnf5Amsud2MNeJ+2hsIo6YyPU=;
 b=QWLwOkawVaAQgyz2u+OM+8s1TBItXRRbIa+D4TzJBXWfs3Nzod0Tai4t3tFHjaV4yi
 3Apsu8VBofu/P0zMthLHUGXnTlwFN2iDVrfi5PnA99/SXUnto6scb9VEbqcOhZrchsRF
 EPYkJKWDg2zGRFgD2dWd9LYqEu5PfjHlbuV5BS8F7jMLGC9yvE79aT3AiL0pMJNeGM++
 /Xf5mrElmAuiJOD7UjmoxFisRQ02gtVI3TirmOv7G53e/S2nxT2cp9pP/38vW+S4/A8z
 ELhZFt3jeYVjZPf29C8LAEyqhhiMzREUL2Wrl/bsBEW1OMDS4j8W9vjB1FVTQBQaq1F9
 ByCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=tY2pRoJSA4IwRutKjYqnf5Amsud2MNeJ+2hsIo6YyPU=;
 b=FqsBxsIYg1a1q+gxllpTgmoyhm//uqj0EmRfcEEuitcfHmPe/VbCY+jtjn1REZDOQP
 7KnHYOez7Bq7RRqrl+KDl8fa13mGEXkYpBo1UBrjiPc/yuSbrP75DKGXVwdPS1UMASQ+
 lRIKBdjYwUWqD7uIsMYm0i/wiDH0GRhIKtIuYMgbFcqgKtZi93d2S49GAn8sZHfnhMMC
 aYkRoADHFg+QxvzZn2M8P7W/aQ8hIwJsZyl4EIap1y4EIPVnjcuKWzjiW7epGscrJXUi
 rGtFLbWpAGl4bNXHhfIHCXoabV0rJt4XiDNJ63ekrEHENRFFwa2LDofz+v4mHQn8bebY
 8bzg==
X-Gm-Message-State: AOAM531lSP1ujsMt1fXdA9Nbr+JItcB/8h6ISxV9o0QNsutQ5ImJhBBS
 lpFROVITYMVR10SLftn+R955s8MCnQyjOH4OOP4wBg==
X-Google-Smtp-Source: ABdhPJwpB9Gc9Kn5SMC6kxnFjdxCmwOjBfkw86LrTgTicl3JrkDc3ZM47yfX4k0ZfuL4/vufcTiud5mZ7q9MPf/bBhY=
X-Received: by 2002:a05:6402:1383:: with SMTP id
 b3mr2261542edv.100.1607524686952; 
 Wed, 09 Dec 2020 06:38:06 -0800 (PST)
MIME-Version: 1.0
References: <20201208193307.646726-1-mst@redhat.com>
In-Reply-To: <20201208193307.646726-1-mst@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Wed, 9 Dec 2020 14:37:55 +0000
Message-ID: <CAFEAcA_F7F_FHFmKvDbcrKE=5cr7-3KqBbTti1kA2N+xQPX=Kg@mail.gmail.com>
Subject: Re: [PULL 00/66] pc,pci,virtio: fixes, cleanups
To: "Michael S. Tsirkin" <mst@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::544;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x544.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
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
Cc: QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, 8 Dec 2020 at 19:33, Michael S. Tsirkin <mst@redhat.com> wrote:
>
> The following changes since commit 553032db17440f8de011390e5a1cfddd13751b0b:
>
>   Update version for v5.2.0 release (2020-12-08 15:55:19 +0000)
>
> are available in the Git repository at:
>
>   git://git.kernel.org/pub/scm/virt/kvm/mst/qemu.git tags/for_upstream
>
> for you to fetch changes up to 023e57b93a24f2e7901cf460a45cb5058fa23549:
>
>   hw/virtio-pci Added AER capability. (2020-12-08 13:48:58 -0500)
>
> ----------------------------------------------------------------
> pc,pci,virtio: fixes, cleanups
>
> Lots of fixes, cleanups.
> CPU hot-unplug improvements.
> A new AER property for virtio devices, adding a dummy AER capability.
>
> Signed-off-by: Michael S. Tsirkin <mst@redhat.com>

Fails to compile on ppc64:


Run-time dependency capstone found: NO (tried pkgconfig)
Configuring capstone-defs.h using configuration
Run-time dependency slirp found: NO (tried pkgconfig)
Configuring libslirp-version.h using configuration
Library fdt found: YES
Configuring config-host.h using configuration
Program scripts/hxtool found: YES
Program scripts/shaderinclude.pl found: YES
Program scripts/qapi-gen.py found: YES
Program scripts/qemu-version.sh found: YES

|Executing subproject libvhost-user method meson
|
|Project name: libvhost-user
|Project version: undefined
|C compiler for the host machine: cc (gcc 4.8.5 "cc (GCC) 4.8.5
20150623 (Red Hat 4.8.5-39)")
|C linker for the host machine: cc ld.bfd 2.27-43
|Run-time dependency glib-2.0 found: YES 2.56.1

../../subprojects/libvhost-user/meson.build:12:7: ERROR: C symbol
memfd_create not found in header sys/mman.h

A full log can be found at /home/pm215/qemu/build/all/meson-logs/meson-log.txt
FAILED: build.ninja
/usr/bin/python3 /home/pm215/qemu/meson/meson.py --internal regenerate
/home/pm215/qemu /home/pm215/qemu/build/all --backend ninja
ninja: error: rebuilding 'build.ninja': subcommand failed
make: *** [run-ninja] Error 1
make: Leaving directory `/home/pm215/qemu/build/all'

thanks
-- PMM

