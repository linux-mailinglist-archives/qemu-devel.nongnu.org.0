Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B24D84C906E
	for <lists+qemu-devel@lfdr.de>; Tue,  1 Mar 2022 17:33:50 +0100 (CET)
Received: from localhost ([::1]:56464 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nP5Rd-0003j1-Rq
	for lists+qemu-devel@lfdr.de; Tue, 01 Mar 2022 11:33:49 -0500
Received: from eggs.gnu.org ([209.51.188.92]:56012)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nP5Oe-0001XS-4H
 for qemu-devel@nongnu.org; Tue, 01 Mar 2022 11:30:47 -0500
Received: from [2607:f8b0:4864:20::b2a] (port=43756
 helo=mail-yb1-xb2a.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nP5Oc-00043D-M7
 for qemu-devel@nongnu.org; Tue, 01 Mar 2022 11:30:43 -0500
Received: by mail-yb1-xb2a.google.com with SMTP id g26so2680774ybj.10
 for <qemu-devel@nongnu.org>; Tue, 01 Mar 2022 08:30:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=bKVk10tObS6Zdp/IbgEapmTajXCeX0hwnk+7DEiX7gk=;
 b=b3KJsZCBZbZnrqH3KJ2XoWS1MTM/RX8dGQzNjc67HVxH9ML0fun2YyMlHAnoL0LAza
 MhnXPKQ4l+OW9tzyBBA36rzM1NWuoEqLVayehzW0cLa44culfa4DJ+erMdNwqpnPNUSi
 apaxiPu9QN4c7f3s9K4OQgY7/OPjHgTJOPsrlpDu9b0/vR4PgijUfnZ/FD1DUnNDnrg7
 qoeQfihrv0+RrNTQB/xtoeJKv9VU4K4KaxQdcnv37224Ky7X9FCvdWT1auhSJrIiSRq3
 kC/iCoiY8eQC7Fl+TciddYJEGO8BBTb2j8rSCUc5TIviJsIyOsDAdUVogwb/IAFc8ScY
 LxLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=bKVk10tObS6Zdp/IbgEapmTajXCeX0hwnk+7DEiX7gk=;
 b=0ZDjQQXBcDj0Oz+bV+SkYNbXozB9pi5Lv9+iB0e3T88tO0YiV+2fh+NWR5sx82rOUI
 xr6oe3grHllLofuPFkdX5i+Ez2vXU9k9WqG4JYEkJJJu7cNSYm8hGEgUIMzuVceexm+T
 4hOgZnxek4MDOXKa+oQCr64HdUu9xgaW/VJou3sPHnZaB1ifVbnoTzKS3bO3Zo6r8ZzV
 Eb5HuSplNJ3qVwXhFYqdRwNJ+AAWccC5bxf6uLJheLu7aY5LBQd99PH3eLJ+hyOq+HxO
 353LFz7M2+wDXZbMEBFKOhYqdb4XWIZBfN7bhK6KYcmS0GsE+O504nvHyH+fol2f7Jpc
 pXSg==
X-Gm-Message-State: AOAM533pFFOpQ+r0yb8UHM2YxcCG26qD1jXdvywnux9Sddtf+tXEwfZb
 0wYySwpXuHEfUx1yeoyTgttIXlKPFjeKSGNTfq5WYA==
X-Google-Smtp-Source: ABdhPJxBZU//e2cY51NLwGh9hDDqJQNvpYmkNU8IoxFgRGwwjRegsPZSI/LwN1+7TcvEOcrY/lPjiZZGo8w5zwNmM+4=
X-Received: by 2002:a05:6902:83:b0:61a:709b:d841 with SMTP id
 h3-20020a056902008300b0061a709bd841mr23693445ybs.140.1646152241450; Tue, 01
 Mar 2022 08:30:41 -0800 (PST)
MIME-Version: 1.0
References: <20220223223137.114264-1-richard.henderson@linaro.org>
 <CAFEAcA84cFnF9EygS6Xun3VorjeGKf+Lw7zRdkBbcRp6YT_OeQ@mail.gmail.com>
 <CAFEAcA_+70hkNaRhbT=ZT457x+cgD-qSad5QoJY8VAEds5UKeA@mail.gmail.com>
 <Yh5Jqg8oDDfPZ2c9@redhat.com>
In-Reply-To: <Yh5Jqg8oDDfPZ2c9@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 1 Mar 2022 16:30:30 +0000
Message-ID: <CAFEAcA-6C9XmP_HGwL8CarBrcuvg6n1wbR5Ys0jZBC-RrA0-AA@mail.gmail.com>
Subject: Re: [PATCH v3 00/17] target/arm: Implement LVA, LPA, LPA2 features
To: =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::b2a
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::b2a;
 envelope-from=peter.maydell@linaro.org; helo=mail-yb1-xb2a.google.com
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
Cc: alex.bennee@linaro.org, qemu-arm@nongnu.org,
 Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, 1 Mar 2022 at 16:28, Daniel P. Berrang=C3=A9 <berrange@redhat.com> =
wrote:
>
> On Tue, Mar 01, 2022 at 04:16:25PM +0000, Peter Maydell wrote:
> > On Tue, 1 Mar 2022 at 16:08, Peter Maydell <peter.maydell@linaro.org> w=
rote:
> > >
> > > On Wed, 23 Feb 2022 at 22:31, Richard Henderson
> > > <richard.henderson@linaro.org> wrote:
> > > >
> > > > Changes for v3:
> > > >   * Update emulation.rst.
> > > >   * Split out separate update to ID_AA64MMFR0.
> > > >   * Hack for avocado.
> > > >
> > > > If the avocado hack isn't acceptable, perhaps just drop the
> > > > last two patches for now?
> > >
> > > I think that given that there are Linux kernels out there
> > > that won't boot if LPA2 is enabled, we should probably have
> > > a -cpu command line option to disable it. Otherwise we might
> > > get a bunch of "why did my kernel stop booting" bug reports.
> >
> > ...and should using a versioned machine type also default
> > -cpu max to not enabling that? Not sure what x86 or other
> > precedent is there.
>
> I don't recall us coming across an important scenario where a guest
> would fail to boot when we /enable/ a given CPU feature on x86,
> requiring us to hide it from -cpu max/host.
>
> Assuming the QEMU/KVM implementation of a CPU feature is correct
> per the relevant spec, then artificially hiding it by default from
> -cpu max feels questionable, as that penalizes non-buggy guest OS.

Yeah. It's just unfortunate that "buggy guest OS" here is
"every Linux up to 5.11".

-- PMM

