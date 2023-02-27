Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BABD6A4077
	for <lists+qemu-devel@lfdr.de>; Mon, 27 Feb 2023 12:20:11 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pWbX1-0005Ff-GL; Mon, 27 Feb 2023 06:18:59 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pWbWw-0005Df-An
 for qemu-devel@nongnu.org; Mon, 27 Feb 2023 06:18:54 -0500
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pWbWt-000273-RF
 for qemu-devel@nongnu.org; Mon, 27 Feb 2023 06:18:53 -0500
Received: by mail-wr1-x42c.google.com with SMTP id v16so2996221wrn.0
 for <qemu-devel@nongnu.org>; Mon, 27 Feb 2023 03:18:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:from:to:cc:subject:date
 :message-id:reply-to;
 bh=bzU8rk8ARtW3BadttYYMCgLsm22VhVRd1LdjoMZXfeA=;
 b=xchelT/KfZiTym88OK9p3X9HcuddGN2RH+XnPR/BHO8fkiK44LZdSwyQTbxvnx839N
 1A+FpJ3m9C7+bRKxPLQH2PBlgfv8icJU5KHZvYa18OHfm3zdLBHG3qvDFhX2xRTphSxz
 IpSFOsI14dEnWaoujCf3ZzDHcSJSgCZfCkF+kAH0MhAeuMHbbpWnNL14f9RVVSv0jfTJ
 +PqbYqMKuabOETKtroVkOkv+fNb/J8oIfI0i+93AZb5KwyCIFa6mxMOipgDi9g/11vlq
 4C2lehwxpBN1fgGK3wV7MVwC13JXz+3XcnxjEHLDFTtCBiBNTSZ41a/MRfPeKn0aHL+b
 i/iA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=bzU8rk8ARtW3BadttYYMCgLsm22VhVRd1LdjoMZXfeA=;
 b=wPuThR92p3Fdal9m1k1qDNgDpt721ZA+EYdU4tFKik2VtCNk7gvErrMjD3yK/d/l70
 PlWu8XPjCH1O9M4+wL6eVvzjqd4pFrA3o39jVvOuXO9IilVRCgc1Ofw5ruIl+n6n/0AI
 d3lIEuXsIrY2NEHhzZ7icR4fxwoivrwot96AsqFBypCPgK0KpGGc2U64C/3rrDDduYWH
 MB54vM91JNTRSPlIKfd4ErwwMmGawrZmkmQAVF4AMY+z2AaJJLn2pjLeEhOmjcUlQz0T
 1z0RpX0vu/oALMm8muTjb1m260t3j43iBnWJM03GL+htLSMJV3pfRdeA7d2mxi2SpC0s
 4axQ==
X-Gm-Message-State: AO0yUKWASfOeJsJoECKTVd82KLIU7yxW0P6H7Ipiz1wMlvx41gbJy//C
 /qmEXB/VjU3fp9nJLXzfN2+I1Q==
X-Google-Smtp-Source: AK7set8Rk/X+AGplP7woBsttvW0Q+mLsxuIkgeFvMtedxR24YNvvF4BdoZsJkftghWWn4GEEUfiiBQ==
X-Received: by 2002:adf:ee50:0:b0:2c9:8b81:bcf2 with SMTP id
 w16-20020adfee50000000b002c98b81bcf2mr5586540wro.29.1677496729677; 
 Mon, 27 Feb 2023 03:18:49 -0800 (PST)
Received: from zen.linaroharston ([85.9.250.243])
 by smtp.gmail.com with ESMTPSA id
 c20-20020a7bc854000000b003dd1bd66e0dsm8737471wml.3.2023.02.27.03.18.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 27 Feb 2023 03:18:49 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id C5FDB1FFB7;
 Mon, 27 Feb 2023 11:18:48 +0000 (GMT)
References: <20230220091358.17038-1-philmd@linaro.org>
 <20230220091358.17038-18-philmd@linaro.org>
User-agent: mu4e 1.9.21; emacs 29.0.60
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Cc: qemu-ppc@nongnu.org, John Snow <jsnow@redhat.com>,
 qemu-block@nongnu.org, qemu-arm@nongnu.org, "Michael S. Tsirkin"
 <mst@redhat.com>, Marcel Apfelbaum <marcel.apfelbaum@gmail.com>, Paolo
 Bonzini <pbonzini@redhat.com>, Richard Henderson
 <richard.henderson@linaro.org>, Eduardo Habkost <eduardo@habkost.net>,
 qemu-devel@nongnu.org
Subject: Re: [PATCH v2 17/24] hw/ide: Declare
 ide_get_[geometry/bios_chs_trans] in 'hw/ide/internal.h'
Date: Mon, 27 Feb 2023 11:17:03 +0000
In-reply-to: <20230220091358.17038-18-philmd@linaro.org>
Message-ID: <87edqbicfb.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::42c;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x42c.google.com
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


Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org> writes:

> ide_get_geometry() and ide_get_bios_chs_trans() are only
> used by the TYPE_PC_MACHINE.
> "hw/ide.h" is a mixed bag of lost IDE declarations. In order
> to remove this (almost) pointless header soon, move these
> declarations to "hw/ide/internal.h".
>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org>
> ---
>  hw/i386/pc.c              | 3 ++-
>  include/hw/ide.h          | 4 ----
>  include/hw/ide/internal.h | 4 ++++
>  3 files changed, 6 insertions(+), 5 deletions(-)
>
> diff --git a/hw/i386/pc.c b/hw/i386/pc.c
> index 6e592bd969..79297a6ecd 100644
> --- a/hw/i386/pc.c
> +++ b/hw/i386/pc.c
> @@ -34,7 +34,8 @@
>  #include "hw/i386/vmport.h"
>  #include "sysemu/cpus.h"
>  #include "hw/block/fdc.h"
> -#include "hw/ide.h"
> +#include "hw/ide/internal.h"
> +#include "hw/ide/isa.h"

I do kind of wonder why hw/ide/internal.h isn't in the appropriate
subdir (e.g. hw/ide and included as #include "internal.h") rather than
the "public" include directory. However QEMU isn't super consistent with
that:

  =E2=9E=9C  find . -iname "internal.h"
  ./accel/tcg/internal.h
  ./target/ppc/internal.h
  ./target/mips/internal.h
  ./target/hexagon/internal.h
  ./include/hw/ide/internal.h
  =F0=9F=95=9911:15:58 alex@zen:qemu.git  on =EE=82=A0 review/qom-housekeep=
ing-v2 [$?] took 7s=20
  =E2=9E=9C  find . -iname "internals.h"
  ./tests/fp/berkeley-softfloat-3/source/include/internals.h
  ./target/arm/internals.h
  ./target/riscv/internals.h
  ./target/loongarch/internals.h
  ./gdbstub/internals.h

Anyway:

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

--=20
Alex Benn=C3=A9e
Virtualisation Tech Lead @ Linaro

