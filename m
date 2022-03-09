Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E0ED4D2E88
	for <lists+qemu-devel@lfdr.de>; Wed,  9 Mar 2022 12:59:49 +0100 (CET)
Received: from localhost ([::1]:39570 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nRuyq-0004yU-D1
	for lists+qemu-devel@lfdr.de; Wed, 09 Mar 2022 06:59:48 -0500
Received: from eggs.gnu.org ([209.51.188.92]:52118)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1nRuwm-0003T9-Ar
 for qemu-devel@nongnu.org; Wed, 09 Mar 2022 06:57:44 -0500
Received: from [2a00:1450:4864:20::536] (port=39749
 helo=mail-ed1-x536.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1nRuwk-0005dS-Iq
 for qemu-devel@nongnu.org; Wed, 09 Mar 2022 06:57:39 -0500
Received: by mail-ed1-x536.google.com with SMTP id g20so2515682edw.6
 for <qemu-devel@nongnu.org>; Wed, 09 Mar 2022 03:57:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=j7fZmY9MnLrDcpGvcRCVc9M+2/nf5JqSRyVg0kWJM7o=;
 b=xYQzgwaQ6kj3Ft7Hdzul8stxVN0GW796lloBW6ve++kqDZAQxhYo4uUYZa7k23Nwr/
 UPZHG1Io+dfDCByCrLUJLsuceNAWiK3vLOQ2m6pO9j0/IDIm+g2RoOI2vOXWkRKBVhgb
 K3W71v+ukJmL7HT1YcgRyvl5Smy6lX8kg4SSRiiPu3ZUAeBahjB+4WRWNNXdpZ71IB/a
 PMDlxfXeeWuVZKa1mWjtmezgAvSzc3rLU7bCorvxjSrV5Qe6ccSq0Jv4C+qxmwSkRGRT
 0d3HjCUm7FDCxwfIkArXRXBRb2iHXUtR302q2WE5ff8DvaBHL0WkrjC267Acc93pdb8+
 YY2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=j7fZmY9MnLrDcpGvcRCVc9M+2/nf5JqSRyVg0kWJM7o=;
 b=CP40LrbpeP2fuftOw+Pd7rgRKz/iAHiGgjd6v/6nrXU47UcevAYveG3FyLcS10HFnY
 sxu85q1johu5CB8ngs+tBxPtg2u+vVXdfCh8yxxpEot2RfbAcFPJHpQ+CvIf5FrFfAGZ
 k8SLB24AwomWXwbbMZCZe3DhGfXWXc5qpEFJLPNpRCQvf/cuZAg96oCXBsWrFvpA0Knc
 EFe7M0KWOrIIn0TzQl/8wgxyjbUF/ALJyy5jflQ7O/tqA3DZgRgjXLuKWnZ5g8hF21nq
 38UgUypbaOux14MOu1wMuXd1Lz2OCmUhz4J4/Eb8ysnUzrX/VmVmZIOxweCS9RpBUGJR
 y38Q==
X-Gm-Message-State: AOAM531JgQIWMX9K5k7mrpy+DJBDkjD/OXVoNaDWLF2O1prl5XjfYa+I
 HtIFKC/mglZRDrR58yh+ouUKAw==
X-Google-Smtp-Source: ABdhPJwhlQ9oJPW5PoUhXpKA0z/u5YnADsjF0d+ixQdq0rZTpH5QxEobSQZMOpjxKvjvQU61g/igeQ==
X-Received: by 2002:a05:6402:d06:b0:412:eafd:8b9a with SMTP id
 eb6-20020a0564020d0600b00412eafd8b9amr20869232edb.278.1646827053954; 
 Wed, 09 Mar 2022 03:57:33 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id
 o20-20020a056402039400b004167e662c45sm721494edv.60.2022.03.09.03.57.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 09 Mar 2022 03:57:32 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id E544A1FFB7;
 Wed,  9 Mar 2022 11:57:31 +0000 (GMT)
References: <20220308145521.3106395-1-kraxel@redhat.com>
 <20220308145521.3106395-6-kraxel@redhat.com>
User-agent: mu4e 1.7.9; emacs 28.0.91
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Gerd Hoffmann <kraxel@redhat.com>
Subject: Re: [PATCH 05/11] edk2: add microvm build
Date: Wed, 09 Mar 2022 11:55:26 +0000
In-reply-to: <20220308145521.3106395-6-kraxel@redhat.com>
Message-ID: <87mthz5oes.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::536
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::536;
 envelope-from=alex.bennee@linaro.org; helo=mail-ed1-x536.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: Thomas Huth <thuth@redhat.com>, Beraldo Leal <bleal@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>, qemu-devel@nongnu.org,
 Ani Sinha <ani@anisinha.ca>, Igor Mammedov <imammedo@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Gerd Hoffmann <kraxel@redhat.com> writes:

> Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>

Out of interest how do you usually trigger these builds?

=E2=9E=9C  make pc-bios/edk2-x86_64-microvm.fd
  GIT     ui/keycodemapdb meson tests/fp/berkeley-testfloat-3 tests/fp/berk=
eley-softfloat-3 dtc capstone slirp
make: *** No rule to make target 'pc-bios/edk2-x86_64-microvm.fd'.  Stop.
=F0=9F=95=9911:56:30 alex@zen:qemu.git/builds/all  on =EE=82=A0 review/edk2=
-version-bump [$!?] [=F0=9F=94=B4 USAGE]=20
=E2=9C=97  cd roms/
=F0=9F=95=9911:57:07 alex@zen:builds/all/roms  on =EE=82=A0 review/edk2-ver=
sion-bump [$!?]=20
=E2=9E=9C  make ../pc-bios/edk2-x86_64-microvm.fd
make: *** No rule to make target '../pc-bios/edk2-x86_64-microvm.fd'.  Stop.
=F0=9F=95=9911:57:10 alex@zen:builds/all/roms  on =EE=82=A0 review/edk2-ver=
sion-bump [$!?] [=F0=9F=94=B4 USAGE]=20
=E2=9C=97=20=20



> ---
>  roms/Makefile.edk2 | 11 +++++++++++
>  1 file changed, 11 insertions(+)
>
> diff --git a/roms/Makefile.edk2 b/roms/Makefile.edk2
> index a669019fe5b2..57996c968687 100644
> --- a/roms/Makefile.edk2
> +++ b/roms/Makefile.edk2
> @@ -33,6 +33,7 @@ flashdevs :=3D \
>  	i386-secure-code \
>  	x86_64-code \
>  	x86_64-secure-code \
> +	x86_64-microvm \
>  	\
>  	arm-vars \
>  	i386-vars
> @@ -145,6 +146,16 @@ submodules:
>  		-D SMM_REQUIRE
>  	cp edk2/Build/Ovmf3264/$(target)_$(call toolchain,x86_64)/FV/OVMF_CODE.=
fd $@
>=20=20
> +../pc-bios/edk2-x86_64-microvm.fd: submodules
> +	+./edk2-build.sh \
> +		x86_64 \
> +		--arch=3DX64 \
> +		--platform=3DOvmfPkg/Microvm/MicrovmX64.dsc \
> +		-D NETWORK_IP6_ENABLE \
> +		-D NETWORK_HTTP_BOOT_ENABLE \
> +		-D NETWORK_TLS_ENABLE
> +	cp edk2/Build/MicrovmX64/$(target)_$(call toolchain,x86_64)/FV/MICROVM.=
fd $@
> +
>  ../pc-bios/edk2-arm-vars.fd: ../pc-bios/edk2-arm-code.fd
>  	cp edk2/Build/ArmVirtQemu-ARM/$(target)_$(call toolchain,arm)/FV/QEMU_V=
ARS.fd \
>  		$@


--=20
Alex Benn=C3=A9e

