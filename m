Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DDF046174F
	for <lists+qemu-devel@lfdr.de>; Mon, 29 Nov 2021 15:00:24 +0100 (CET)
Received: from localhost ([::1]:43148 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mrhCh-0000z0-JY
	for lists+qemu-devel@lfdr.de; Mon, 29 Nov 2021 09:00:23 -0500
Received: from eggs.gnu.org ([209.51.188.92]:51552)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mrh9U-0006Z2-Ak
 for qemu-devel@nongnu.org; Mon, 29 Nov 2021 08:57:04 -0500
Received: from [2a00:1450:4864:20::432] (port=40748
 helo=mail-wr1-x432.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mrh9S-00042Z-Kw
 for qemu-devel@nongnu.org; Mon, 29 Nov 2021 08:57:03 -0500
Received: by mail-wr1-x432.google.com with SMTP id t9so20032240wrx.7
 for <qemu-devel@nongnu.org>; Mon, 29 Nov 2021 05:57:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=3R0nafG5ODL5DRR7ec4ccsXtAd+EwKH++2HjSLBAW6c=;
 b=GMFB725bAevOPhKetlFm2nh3z45lZpBl5maAdtNCllhW0IwMnwH4htujoBg+nLE8bL
 N7IcOld4sYTSJDSYtdGjh1aVc+0uLzLG9VJrMWdKnnSdRPUC04TbGnzq3Xl2TWPQb8cn
 CSdsm+Pqt29TdIGYwGKpbIVbJThQgETDSxI/+tXiWnBX2zt6D6c33VWF3eTLsQ3pUqae
 5+q0Ur3KV/X1dIi0y4UEFnO5x3g8qFrSqiu8kYYZm6qY3TlPjiCaDdX17I6DVoqdNJVH
 Ogw0jVnW5cLpmjcbOUiKiBGSLCt/fo4skU1CUBIVm/q4ovwRY5rXipr/pQ1y4trj+I8W
 dffQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=3R0nafG5ODL5DRR7ec4ccsXtAd+EwKH++2HjSLBAW6c=;
 b=MkGHca3288kXUJ/dLPjXcSyqErOZUSOtEylLiPY2Tgf93MEB/y5+G4b0kStKhr0zA7
 cLeIPzdsRq8pExSVHEBcTkmqK5fa7h7whu1IGzODtu2AFMQ0lKVHl8GyUScjCNm6QpoP
 yXDNT6MtdZTP2w5fXJrMHQiZwCv8WhcZI4+C679C5Klwga67zzhlw6qOpT1D4giJR2o7
 qYtaZ8wZ2fsgxRj2rdiF1M8zK4WAVMPupfX90O7y0RKMlmJhDXTXkEyZVXONOPxDuYpn
 94d41wcN9Fx4RfBwwPZiG02gzyjFjQsu73sah/2EAPuzjTPEOakbvvNWYY4jIspX4FzF
 wnrw==
X-Gm-Message-State: AOAM530kr0KRqtBeKhT0KhSpMb7S0c3NHYqkKj/OsJdBqp3e+OSNqWC7
 Q+3YWMK47FG3X3zPcMIZeFigXEC30EuVcHzQUuqXuQ==
X-Google-Smtp-Source: ABdhPJxroHcSOfVuJ1pdVOhOp3MoWJl23Uo6hAP2EuzI0Wge9d8V9UkpyZ0B8eWTZigdYdNwHImYwvJwCVs8CzzomNo=
X-Received: by 2002:adf:f0c5:: with SMTP id x5mr32443081wro.484.1638194220994; 
 Mon, 29 Nov 2021 05:57:00 -0800 (PST)
MIME-Version: 1.0
References: <20211112170454.3158925-1-alex.bennee@linaro.org>
In-Reply-To: <20211112170454.3158925-1-alex.bennee@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 29 Nov 2021 13:56:50 +0000
Message-ID: <CAFEAcA9iJdkhuPZtm_h66H2L2N+=Ue5UJ3jDnF+cxdVTZpdxsA@mail.gmail.com>
Subject: Re: [RFC PATCH] hw/intc: clean-up error reporting for failed ITS cmd
To: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::432
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::432;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x432.google.com
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
Cc: Shashi Mallela <shashi.mallela@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, 12 Nov 2021 at 17:05, Alex Benn=C3=A9e <alex.bennee@linaro.org> wro=
te:
>
> While trying to debug a GIC ITS failure I saw some guest errors that
> had poor formatting as well as leaving me confused as to what failed.
> As most of the checks aren't possible without a valid dte split that
> check apart and then check the other conditions in steps. This avoids
> us relying on undefined data.
>
> I still get a failure with the current kvm-unit-tests but at least I
> know (partially) why now:
>
>   Exception return from AArch64 EL1 to AArch64 EL1 PC 0x40080588
>   PASS: gicv3: its-trigger: inv/invall: dev2/eventid=3D20 now triggers an=
 LPI
>   ITS: MAPD devid=3D2 size =3D 0x8 itt=3D0x40430000 valid=3D0
>   INT dev_id=3D2 event_id=3D20
>   process_its_cmd: invalid command attributes: invalid dte: 0 for 2 (MEM_=
TX: 0)
>   PASS: gicv3: its-trigger: mapd valid=3Dfalse: no LPI after device unmap
>   SUMMARY: 6 tests, 1 unexpected failures
>
> Signed-off-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
> Cc: Shashi Mallela <shashi.mallela@linaro.org>
> Cc: Peter Maydell <peter.maydell@linaro.org>
> --

Seems reasonable to me; I've put this on my list of things to queue
for 7.0.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

