Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C4946DDA6E
	for <lists+qemu-devel@lfdr.de>; Tue, 11 Apr 2023 14:10:00 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pmCoY-0004Ve-JK; Tue, 11 Apr 2023 08:09:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pmCoP-0004VO-0E
 for qemu-devel@nongnu.org; Tue, 11 Apr 2023 08:09:26 -0400
Received: from mail-ej1-x631.google.com ([2a00:1450:4864:20::631])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pmCoM-0004Mj-2s
 for qemu-devel@nongnu.org; Tue, 11 Apr 2023 08:09:24 -0400
Received: by mail-ej1-x631.google.com with SMTP id ga37so20094597ejc.0
 for <qemu-devel@nongnu.org>; Tue, 11 Apr 2023 05:09:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1681214960; x=1683806960;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=FJtJfAG3FTj0Mp4aU87gbbrxBXFK2d65L0vZtbl5EUU=;
 b=K5WofLcaCaGTlr1uf2G9QXqnXtNccGL+HSEll+dOVN0wLYg5J6CaMs+twT7SygPsh4
 dcoxPOCrcNJ7muR+QYpi1/zqFckaqjidpsyXAhl7q4Ju5LO+/M4dM0ixN0XRAvgLUUlZ
 Z7ThIy7FYw7LNsdopNdDiHxBSaAiIrxeuLgXxFYEzx2M1dxSc38Hx4DXN23BjjrPcbdN
 z4SbZmK7bcaiiDMvlnfG7oKYGtx2xU8//nKxbmcz+LNuvTdn+ojrs1EvFCLxVZmtI12k
 uu08f0Npwcg/tna0Z8ssYYK4mbJ7Hk2aNYTwxwgHbxipV9S3IYpnhYZGbMFGIuLv0XqF
 urSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1681214960; x=1683806960;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=FJtJfAG3FTj0Mp4aU87gbbrxBXFK2d65L0vZtbl5EUU=;
 b=f+80DY7tvDFDFMpqYfo+VClI8mvevvV8/1IE12fkdBs6LIDvgGoi5QtieMcmS3rKyN
 CzNU7S9DdMA5tojtgw405VtkjlH9i9Zkt2b5u5U+dH8CwkiqcY147XYKSf0prR7APpMC
 zlWuUd/DlOaOJjTIndzqb1KNEBbwdV3ewWN6YefcxFLVhwUK/yvZFE5sXswPctcczKDQ
 +kS8eZ5HTraW3dd+qkr7AGXXrPyw+IBaKSqJSGC6B47CkSoZNhCfPQsdmLl9G0aHzhlr
 UyfBDkC1f1R38kGmUZ62LoaGJs8RLj30YffIj41jh+9MlMXB3D26az7Q4IoN1xLpp283
 PXZA==
X-Gm-Message-State: AAQBX9chNyNzTPCZX4uIPkntNh/W3yR31Gasg9iDAMZvqwt5LeCJo5Cn
 /RYT7U1JJWqA6ImWh9jNAQNq7AWESRrjjyk2G0fPlA==
X-Google-Smtp-Source: AKy350bbu/IbL3Wka1f0D6W9Vh6lenMtSIMSjr559wYIhjDOzTsWqACJo6Ttx1C3oP9g9uZtCYk7u+/jsKCz8+F5ntg=
X-Received: by 2002:a17:906:730b:b0:939:a51a:dc30 with SMTP id
 di11-20020a170906730b00b00939a51adc30mr6103973ejc.2.1681214960402; Tue, 11
 Apr 2023 05:09:20 -0700 (PDT)
MIME-Version: 1.0
References: <b7796732-6334-c68b-3baa-2354644152f8@msgid.tls.msk.ru>
 <7739b40d-d8ba-ccde-cc6c-5d9f2c93a663@msgid.tls.msk.ru>
In-Reply-To: <7739b40d-d8ba-ccde-cc6c-5d9f2c93a663@msgid.tls.msk.ru>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 11 Apr 2023 13:09:03 +0100
Message-ID: <CAFEAcA8DyTixWoeRpt3R7MHmLEwnvX5Y6ciCDaVj1n7K6GnOeQ@mail.gmail.com>
Subject: Re: xen bits broke x32 build
To: Michael Tokarev <mjt@tls.msk.ru>
Cc: Joao Martins <joao.m.martins@oracle.com>,
 QEMU Developers <qemu-devel@nongnu.org>, 
 David Woodhouse <dwmw@amazon.co.uk>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::631;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x631.google.com
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

On Tue, 11 Apr 2023 at 12:57, Michael Tokarev <mjt@tls.msk.ru> wrote:
>
> 01.04.2023 11:40, Michael Tokarev wrote:
> > After bringing in xen guest support, qemu fails to build on x32:
> >
> > target/i386/kvm/xen-emu.c:876:5: note: in expansion of macro =E2=80=98q=
emu_build_assert=E2=80=99
> >    876 |     qemu_build_assert(sizeof(struct vcpu_info) =3D=3D 64);
> >        |     ^~~~~~~~~~~~~~~~~
> >
> > This one should be easy to fix, but I wonder if there are other issues
> > with x32 exists..
>
> Ok, I took a look at how to disable this new XEN stuff on x32.
>
> It is the commit 820c1aba519bd072ac71c754733f6c86d8b4309 "xen: add
> CONFIG_XEN_BUS and CONFIG_XEN_EMU options for Xen emulation" adding
> this construct to hw/i386/Kconfig:
>
> config XEN_EMU
>      bool
>      default y
>      depends on KVM && (I386 || X86_64)
>
> Since meson does not know about x32, and while ./conifgure does, it
> is not propagated to meson, and sure not propagated to Kconfig too,
> there's some more work needed to disable XEN_EMU on x32.

Frankly I would prefer to just say "we don't support x32".
It's a weird non-standard configuration that as far as I'm
aware is very little used. Its stats in the debian
popularity-contest graphs peaked at 18 users in 2017, and
have mostly been fluctuating between 1 and 3 for the last
couple of years:
https://popcon.debian.org/stat/sub-x32.png

We're currently planning to deprecate-and-drop 32-bit x86
hosts, which are much more widely used than this. I see
no reason why we should care about this oddball failed
experiment of an ABI...

thanks
-- PMM

