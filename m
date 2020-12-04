Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 271D32CF5E3
	for <lists+qemu-devel@lfdr.de>; Fri,  4 Dec 2020 21:55:21 +0100 (CET)
Received: from localhost ([::1]:43138 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1klI6q-00046l-8V
	for lists+qemu-devel@lfdr.de; Fri, 04 Dec 2020 15:55:20 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:34768)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1klFit-0001wo-Qf
 for qemu-devel@nongnu.org; Fri, 04 Dec 2020 13:22:28 -0500
Received: from mail-lj1-x242.google.com ([2a00:1450:4864:20::242]:46225)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1klFis-0005U2-8z
 for qemu-devel@nongnu.org; Fri, 04 Dec 2020 13:22:27 -0500
Received: by mail-lj1-x242.google.com with SMTP id f24so7610354ljk.13
 for <qemu-devel@nongnu.org>; Fri, 04 Dec 2020 10:22:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:in-reply-to:date
 :message-id:mime-version:content-transfer-encoding;
 bh=DT4k71A0UTzjUzWYVJX1crwdIg2PoCOYNkUxQR0aFhw=;
 b=YLpxuVIQOX57nu5+Ir3pMSvqEAs3EaJmjBuREsoKUUpNYop01wPXL4Bf7BrpsEAZY9
 bJOCIyltTRqDURMT+WK5MyXf3BTxZcCUgYFHs5PKB/gRNnZTQVWUbRjoNSmqE4sVY8zl
 wIA5BKm2dBlbGFC1uSY5mdroPHY6gVDAxM0Y0uMxKXh9smOUa3uBRzkvLS3dqo0Ip76/
 Ke9rxUdT1gGfl3g8lt35lgAMII0LOdppKnp3LKD72b6zyIxQvcbIoAU0dY+2/xh/3gRy
 2gt3tkx3qrOv+2DASjuJ86IGSE2Fr8K+zIzZ8CGD/seVov+GE4mouVEHQEx5aPboqPqk
 7nsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject
 :in-reply-to:date:message-id:mime-version:content-transfer-encoding;
 bh=DT4k71A0UTzjUzWYVJX1crwdIg2PoCOYNkUxQR0aFhw=;
 b=Ho7uZeiUc2Z3msTyqP9gApE76TcNz1YHaWYd2iomB7ZCJTJfiz3oFuYhwmgeh0ld+9
 RQF7cSZXSHpl7qsln+Jz6kIVBOXaHaRuZ0Zl4be0GWMlr9+kCRoSMsHPwouH/iA4PV1K
 xocwA2jEXgl2o7NoGxN7XS2dmawb91bth89aozJjKxKdbjvS/tP+Q1vHbgIZfa31H/lx
 Zky61gyBtJ+5RfoA5ByJfemQ0YCkHUWi25xrbBZ9OtL+3UPXu2i0TnNNJ5gKB8ZFwdFl
 8BUr05WoahAFgsyrI9/OY6XyStbVBJOczvZ8L25gsBID7IoinpguEW3aQhkRLUFbBOT8
 siwA==
X-Gm-Message-State: AOAM530syURHV0OX4143/JWVwY+jPWDGsPvSKRQDFk1Oa9xj4Oq3GVI6
 kTNvEyGKfgOpB8CsoVDpKJ+Pm6Qy/QBcPQ==
X-Google-Smtp-Source: ABdhPJzNG3CvKAl1mZcCUg96i4NRO9iHJ0UQckFqDcBCX43fKhX00GMU7IBsX6pH4hqad1eOO0S7AQ==
X-Received: by 2002:adf:ea45:: with SMTP id j5mr5898691wrn.171.1607098559567; 
 Fri, 04 Dec 2020 08:15:59 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id p3sm4041607wrs.50.2020.12.04.08.15.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 04 Dec 2020 08:15:58 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 95C101FF7E;
 Fri,  4 Dec 2020 16:15:57 +0000 (GMT)
References: <20201203234857.21051-1-agraf@csgraf.de>
 <20201203234857.21051-5-agraf@csgraf.de>
User-agent: mu4e 1.5.7; emacs 28.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Alexander Graf <agraf@csgraf.de>
Subject: Re: [PATCH v4 04/11] hvf: Introduce hvf vcpu struct
In-reply-to: <20201203234857.21051-5-agraf@csgraf.de>
Date: Fri, 04 Dec 2020 16:15:57 +0000
Message-ID: <875z5hsg1u.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::242;
 envelope-from=alex.bennee@linaro.org; helo=mail-lj1-x242.google.com
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

> We will need more than a single field for hvf going forward. To keep
> the global vcpu struct uncluttered, let's allocate a special hvf vcpu
> struct, similar to how hax does it.
>
> Signed-off-by: Alexander Graf <agraf@csgraf.de>
> Reviewed-by: Roman Bolshakov <r.bolshakov@yadro.com>
> Tested-by: Roman Bolshakov <r.bolshakov@yadro.com>
> ---
>  accel/hvf/hvf-cpus.c        |   8 +-
>  include/hw/core/cpu.h       |   3 +-
>  include/sysemu/hvf_int.h    |   4 +
>  target/i386/hvf/hvf.c       | 102 +++++++++---------
>  target/i386/hvf/vmx.h       |  24 +++--
>  target/i386/hvf/x86.c       |  28 ++---
>  target/i386/hvf/x86_descr.c |  26 ++---
>  target/i386/hvf/x86_emu.c   |  62 +++++------
>  target/i386/hvf/x86_mmu.c   |   4 +-
>  target/i386/hvf/x86_task.c  |  12 +--
>  target/i386/hvf/x86hvf.c    | 210 ++++++++++++++++++------------------
>  11 files changed, 247 insertions(+), 236 deletions(-)
>
> diff --git a/accel/hvf/hvf-cpus.c b/accel/hvf/hvf-cpus.c
> index 60f6d76bf3..1b0c868944 100644
> --- a/accel/hvf/hvf-cpus.c
> +++ b/accel/hvf/hvf-cpus.c
> @@ -312,10 +312,12 @@ static void hvf_cpu_synchronize_pre_loadvm(CPUState=
 *cpu)
>=20=20
>  static void hvf_vcpu_destroy(CPUState *cpu)
>  {
> -    hv_return_t ret =3D hv_vcpu_destroy(cpu->hvf_fd);
> +    hv_return_t ret =3D hv_vcpu_destroy(cpu->hvf->fd);
>      assert_hvf_ok(ret);
>=20=20
>      hvf_arch_vcpu_destroy(cpu);
> +    free(cpu->hvf);

You should pair g_malloc0 with g_free.

> +    cpu->hvf =3D NULL;
>  }
>=20=20
>  static void dummy_signal(int sig)
> @@ -326,6 +328,8 @@ static int hvf_init_vcpu(CPUState *cpu)
>  {
>      int r;
>=20=20
> +    cpu->hvf =3D g_malloc0(sizeof(*cpu->hvf));
> +

Otherwise so far, so mechanical ;-)

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>


--=20
Alex Benn=C3=A9e

