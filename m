Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C20C650CA8
	for <lists+qemu-devel@lfdr.de>; Mon, 19 Dec 2022 14:31:31 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p7GE9-0003nf-2i; Mon, 19 Dec 2022 08:30:45 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1p7GE5-0003lo-9e
 for qemu-devel@nongnu.org; Mon, 19 Dec 2022 08:30:41 -0500
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1p7GE3-0005bn-Ee
 for qemu-devel@nongnu.org; Mon, 19 Dec 2022 08:30:41 -0500
Received: by mail-wm1-x32c.google.com with SMTP id
 v124-20020a1cac82000000b003cf7a4ea2caso8788102wme.5
 for <qemu-devel@nongnu.org>; Mon, 19 Dec 2022 05:30:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:from:to:cc:subject:date
 :message-id:reply-to;
 bh=UlPLPpl56U/bXAj2k5gLxsEbWsnUhmMHwa6ZL+b6GYc=;
 b=sISDUqyFevk+LKCQngSXmeQKP3X6KbLF9UiUup/BQPFP5NC/yG3CR2rtOV5AOlrRoz
 2NfhmGDJoymDeeU1OuNOCpcggembl3ODt/QiQGGxbWuD/2pVml7c7KZ4wcA8LLW+JGWI
 uNjHl3n4pNy8D4ihyteytl8+69GSgm2PimiHPH/3Dhk1NKjGom5nfQLzIZuV+OzjGP2k
 jpXnXUVnsKZ7Oje/Id0pqtFQ7NNeB+07P8sRkq1HHfcQfQ9ukAgRd17X3UqndU7FS95c
 m3vltdF3Xuipy7lAKI1qsmZxs6EsFTU2PplX5F6sIoVEA79Qk4nKfcCMSoeAEdyNxLhH
 EyFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=UlPLPpl56U/bXAj2k5gLxsEbWsnUhmMHwa6ZL+b6GYc=;
 b=3lPPYjDNg0yJaQlWaymh8RPXGwU2W/ghqUdxwxnGujgJt7A0QflE4o/Sb8U1JcLND3
 OViIsDKqoiXSs6pqlJb0/ingyro1sa1nrD8rfZYJvszLNrV3yW2NKWeRLrJTOsIM5OGP
 a4FS53gGDWtGosMfQgimmPUKpq5/gwN912qC1y6nWmE+HLf1cqo5RJwOvKT8J4yIbG59
 cM0AARbyNueh+J4eU6Xi959Zm9bnixBMO7VRZf4x2QWx0B3iz6/7G8m51Ce1lAK38J1p
 GOfFISz4GCMS+M6KfLqpnu8l/evlOUreErLqZO1s9ZETvCS8dtJ0NDDLdjzc8+5+4yHq
 7x/A==
X-Gm-Message-State: ANoB5plp1T773/kajKK5uuQxXSyo8+lWhzu1w9GaajdjayyoBLX4prs6
 LI/PYlOps91AhsA47m8kQfWmvA==
X-Google-Smtp-Source: AA0mqf4Xdip+r7skuBy7lODHoTWA5Ki9oHZGfFRdiMDNpcuRv0VJmJpUY1Fyf6w4t7SHLDm6OrJjiw==
X-Received: by 2002:a05:600c:1e26:b0:3d2:2043:9cb7 with SMTP id
 ay38-20020a05600c1e2600b003d220439cb7mr25133115wmb.5.1671456636123; 
 Mon, 19 Dec 2022 05:30:36 -0800 (PST)
Received: from zen.linaroharston ([185.81.254.11])
 by smtp.gmail.com with ESMTPSA id
 p13-20020a05600c1d8d00b003d01b84e9b2sm12572845wms.27.2022.12.19.05.30.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 19 Dec 2022 05:30:35 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 4B5B21FFB7;
 Mon, 19 Dec 2022 13:30:35 +0000 (GMT)
References: <20221202030003.11441-1-vikram.garhwal@amd.com>
 <20221202030003.11441-11-vikram.garhwal@amd.com>
 <871qphc0p3.fsf@linaro.org> <ade61d47-f8c0-09cc-1a44-faaaff87d76a@amd.com>
 <alpine.DEB.2.22.394.2212021429220.4039@ubuntu-linux-20-04-desktop>
 <d87025d8-b653-d80e-22c0-05f052447706@xen.org>
User-agent: mu4e 1.9.7; emacs 29.0.60
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Julien Grall <julien@xen.org>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Vikram Garhwal
 <vikram.garhwal@amd.com>, qemu-dev@xilinx.com, stefano.stabellini@amd.com,
 xen-devel@lists.xenproject.org, Peter Maydell <peter.maydell@linaro.org>,
 Anthony Perard <anthony.perard@citrix.com>, Paul Durrant <paul@xen.org>,
 "open list:ARM TCG CPUs" <qemu-arm@nongnu.org>, "open list:All patches CC
 here" <qemu-devel@nongnu.org>
Subject: Re: [QEMU][PATCH v2 10/11] hw/arm: introduce xenpv machine
Date: Mon, 19 Dec 2022 13:28:46 +0000
In-reply-to: <d87025d8-b653-d80e-22c0-05f052447706@xen.org>
Message-ID: <87bknzldvo.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::32c;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x32c.google.com
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


Julien Grall <julien@xen.org> writes:

> Hi,
>
> On 02/12/2022 22:36, Stefano Stabellini wrote:
>>> Do you know what Xen version your build env has?
>> I think Alex is just building against upstream Xen. GUEST_TPM_BASE
>> is
>> not defined there yet. I think we would need to introduce in
>> xen_common.h something like:
>> #ifndef GUEST_TPM_BASE
>> #define GUEST_TPM_BASE 0x0c000000
>> #endif
>
> I think this would be a big mistake to add the two lines above in QEMU.
>
> Libxl is responsible for creating the domain and generating the
> firwmare tables. Any mismatch of values will be a real pain to debug.
>
> Even if...
>
>> We already have similar code in xen_common.h for other things.
>> Also, it
>> would be best to get GUEST_TPM_BASE defined upstream in Xen first.
>
> ... we introduce upstream first, the guest layout is not part of the
> stable ABI and therefore could change from release to release.
>
>>=20
>>> Another way to fix this(as Julien suggested) is by setting this GUEST_T=
PM_BASE
>>> value via a property or something and user can set it via command line.
>>>
>>> @sstabellini@kernel.org, do you think of any other fix?
>> Setting the TPM address from the command line is nice and preferable
>> to
>> hardcoding the value in xen_common.h. It comes with the challenge that
>> it is not very scalable (imagine we have a dozen emulated devices) but
>> for now it is fine and a good way to start if you can arrange it.
>
> It is not clear which one you think is not scalable. If this is the
> command line option approach, then I think this is unrealistic to ask
> every user to rebuild there QEMU just because the guest layout has
> changed.
>
> Today the rebuild may only be necessary when switching to a new
> release. But in the future we may imagine a per-domain layout (e.g.
> for legacy purpose). So you will now need to request the user to have
> one QEMU built per domain.

I agree if this is something that can change it needs to be configured
from the command line or somehow otherwise gleaned from the source of
truth. Isn't this information available via XenStore? Isn't that what
Viresh has to do for all the VirtIO devices he's adding to libxl?

A default value for the option could be done I guess.

>
> How is that scalable?
>
> Cheers,


--=20
Alex Benn=C3=A9e
Virtualisation Tech Lead @ Linaro

