Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CFE1F2CF5CE
	for <lists+qemu-devel@lfdr.de>; Fri,  4 Dec 2020 21:46:51 +0100 (CET)
Received: from localhost ([::1]:55726 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1klHyc-0005H7-R0
	for lists+qemu-devel@lfdr.de; Fri, 04 Dec 2020 15:46:50 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:56598)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1klFS8-0005Xz-1w
 for qemu-devel@nongnu.org; Fri, 04 Dec 2020 13:05:09 -0500
Received: from mail-lj1-x243.google.com ([2a00:1450:4864:20::243]:38314)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1klFRj-0008Tj-7l
 for qemu-devel@nongnu.org; Fri, 04 Dec 2020 13:05:02 -0500
Received: by mail-lj1-x243.google.com with SMTP id j10so7583330lja.5
 for <qemu-devel@nongnu.org>; Fri, 04 Dec 2020 10:04:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:in-reply-to:date
 :message-id:mime-version:content-transfer-encoding;
 bh=rPz+WN+QCnaUFpTyesOuq2U3IwROWNHXnoIM9pFcl0Y=;
 b=abFfkhu5MkNDv9ACBKwNHAxsAhMRc3HrCerg1YxIl747km41iBpaQFQtXCXhRCeKH/
 IWgm0X/Hcy0COM7Grqd3/ULSOrPd4jcxIFrO8jO4sZWAjZztRZthjpHf5U1WavYbP5vf
 gJ9x9NKvCufVCiMjShIhDMghcvWpORIqymBe93ZN/UvVc8R9vzpYlFBD/7aUou1JaaHi
 QRYD8t2jZLvUEJer0FGWFK28Tanx2NjALbZ+FtJANaTdYtHQ447fRO521rL+xbqCKeli
 TlZblbdSN3v+UWv5Jsh2xnXpiY+2zbsYrcI+rphld0kyce0IpapPuitOz70NozlDeH6p
 Jzkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject
 :in-reply-to:date:message-id:mime-version:content-transfer-encoding;
 bh=rPz+WN+QCnaUFpTyesOuq2U3IwROWNHXnoIM9pFcl0Y=;
 b=Fxzvd3Xs5rN/Hx1/RzOyT+Sw/TlI089s3c7ABuKHOgrEcPj5FHcUlKCfNPGsOXniYH
 7jUJu4Zf3GnE6yFKzOk4LK3vGx1kVaUYBY1Nk3MwCHrg4pkYqnl59ZktEpyXws/3b2Sk
 cOpLuQG0RJODdpfKJY1M8ieynQhwz4m9l4bfvTj7agkZTYaEfrspGEaLy4hBa2T84T1X
 LsL983lok58hDhlu+Kxg2cluNaROTB4UYWhLnkmEKbmOFtk7Ey3vGCr7fLsMWNCRgvgb
 Qn7WVVKgZUNvozb8Dm/WstEvCwaD1kbM5CmFQ3Hw5FJ0aHlFJwsZqBHQ1os7DweNkJ9G
 XllQ==
X-Gm-Message-State: AOAM530u/aDLgsq3HnF1fNo6uAnQM/BqL9SoDSMI4YEXX+5vgnAWVsjf
 ceNaQSvRlsTafvisrjQMfQFjVCAfIpzKbw==
X-Google-Smtp-Source: ABdhPJywaVpCmPawLUmnkG+ZwK9iCo7hbkvQT85pZw1U80X9bZQa3xeC0d2KpLuqniiO3iB5vnQFIQ==
X-Received: by 2002:adf:f304:: with SMTP id i4mr5936606wro.268.1607099134186; 
 Fri, 04 Dec 2020 08:25:34 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id j6sm4125541wrq.38.2020.12.04.08.25.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 04 Dec 2020 08:25:33 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 6C25B1FF7E;
 Fri,  4 Dec 2020 16:25:32 +0000 (GMT)
References: <20201203234857.21051-1-agraf@csgraf.de>
 <20201203234857.21051-9-agraf@csgraf.de>
User-agent: mu4e 1.5.7; emacs 28.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Alexander Graf <agraf@csgraf.de>
Subject: Re: [PATCH v4 08/11] arm: Add Hypervisor.framework build target
In-reply-to: <20201203234857.21051-9-agraf@csgraf.de>
Date: Fri, 04 Dec 2020 16:25:32 +0000
Message-ID: <87360lsflv.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::243;
 envelope-from=alex.bennee@linaro.org; helo=mail-lj1-x243.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Eduardo Habkost <ehabkost@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org,
 Cameron Esfahani <dirty@apple.com>, Roman Bolshakov <r.bolshakov@yadro.com>,
 qemu-arm@nongnu.org, Frank Yang <lfy@google.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Peter Collingbourne <pcc@google.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Alexander Graf <agraf@csgraf.de> writes:

> Now that we have all logic in place that we need to handle Hypervisor.fra=
mework
> on Apple Silicon systems, let's add CONFIG_HVF for aarch64 as well so tha=
t we
> can build it.
>
> Signed-off-by: Alexander Graf <agraf@csgraf.de>
>
> ---
>
> v1 -> v2:
>
>   - Fix build on 32bit arm
>
> v3 -> v4:
>
>   - Remove i386-softmmu target
> ---
>  meson.build                | 11 ++++++++++-
>  target/arm/hvf/meson.build |  3 +++
>  target/arm/meson.build     |  2 ++
>  3 files changed, 15 insertions(+), 1 deletion(-)
>  create mode 100644 target/arm/hvf/meson.build
>
> diff --git a/meson.build b/meson.build
> index 86d433c8a4..a2323e8d23 100644
> --- a/meson.build
> +++ b/meson.build
> @@ -74,16 +74,25 @@ else
>  endif
>=20=20
>  accelerator_targets =3D { 'CONFIG_KVM': kvm_targets }
> +
> +if cpu in ['x86', 'x86_64']
> +  hvf_targets =3D ['x86_64-softmmu']
> +elif cpu in ['aarch64']
> +  hvf_targets =3D ['aarch64-softmmu']
> +else
> +  hvf_targets =3D []
> +endif
> +
>  if cpu in ['x86', 'x86_64', 'arm', 'aarch64']
>    # i368 emulator provides xenpv machine type for multiple architectures
>    accelerator_targets +=3D {
>      'CONFIG_XEN': ['i386-softmmu', 'x86_64-softmmu'],
> +    'CONFIG_HVF': hvf_targets,

I can see this logic continuing to get messier as I just hit a merge
conflict with my Xen on qemu-system-aarch64 patches. Not sure if there
is a cleaner approach though.

>    }
>  endif
>  if cpu in ['x86', 'x86_64']
>    accelerator_targets +=3D {
>      'CONFIG_HAX': ['i386-softmmu', 'x86_64-softmmu'],
> -    'CONFIG_HVF': ['x86_64-softmmu'],
>      'CONFIG_WHPX': ['i386-softmmu', 'x86_64-softmmu'],
>    }
>  endif
> diff --git a/target/arm/hvf/meson.build b/target/arm/hvf/meson.build
> new file mode 100644
> index 0000000000..855e6cce5a
> --- /dev/null
> +++ b/target/arm/hvf/meson.build
> @@ -0,0 +1,3 @@
> +arm_softmmu_ss.add(when: [hvf, 'CONFIG_HVF'], if_true: files(
> +  'hvf.c',
> +))
> diff --git a/target/arm/meson.build b/target/arm/meson.build
> index f5de2a77b8..95bebae216 100644
> --- a/target/arm/meson.build
> +++ b/target/arm/meson.build
> @@ -56,5 +56,7 @@ arm_softmmu_ss.add(files(
>    'psci.c',
>  ))
>=20=20
> +subdir('hvf')
> +
>  target_arch +=3D {'arm': arm_ss}
>  target_softmmu_arch +=3D {'arm': arm_softmmu_ss}


--=20
Alex Benn=C3=A9e

