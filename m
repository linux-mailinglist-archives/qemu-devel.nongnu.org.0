Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 77BE2574C66
	for <lists+qemu-devel@lfdr.de>; Thu, 14 Jul 2022 13:45:11 +0200 (CEST)
Received: from localhost ([::1]:54436 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oBxHK-0004Ez-4m
	for lists+qemu-devel@lfdr.de; Thu, 14 Jul 2022 07:45:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49862)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1oBxEB-0002nW-Jd
 for qemu-devel@nongnu.org; Thu, 14 Jul 2022 07:41:55 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:35113)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1oBxE7-0001FQ-N3
 for qemu-devel@nongnu.org; Thu, 14 Jul 2022 07:41:53 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1657798910;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Iu2UTN7IbQJ5hcUaqdXRBVluVHUOwyOKRW4pe+RVXhU=;
 b=WOeorYEmzzFU3puG3hXXjvl906/h7/TnL9rodaodwhUzDz1SBaOAUi0xIF4S6ZENXO7qns
 epS+3b+x6IHYV6qS0m7fZqiGPhZgYehlMzn6l+i/heKUp3jQnJ9RuFnyKTwDSmqNJhwnbo
 QeBUCEFhaQ5yoge90fAVNiJP6d5SgmU=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-226-RIqLd_zpNP-VsvUHFo4KeQ-1; Thu, 14 Jul 2022 07:41:49 -0400
X-MC-Unique: RIqLd_zpNP-VsvUHFo4KeQ-1
Received: by mail-ej1-f70.google.com with SMTP id
 ne36-20020a1709077ba400b0072b64ce28aaso672336ejc.3
 for <qemu-devel@nongnu.org>; Thu, 14 Jul 2022 04:41:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Iu2UTN7IbQJ5hcUaqdXRBVluVHUOwyOKRW4pe+RVXhU=;
 b=MjPKuuvHxtVrP9AClnfkqZjBd6DxKOlGpqniViFDsWuuJJyqektECxxNrJRjHKjy95
 cGS8RuknkPr4KhbPm4GmmrcYF7EYjtWmniviQtxR9lEkuKF+tRTvxzFt0G2J44YfWJ/T
 M9oTY+Qu0mMxTGtnW6+40g+aUFDMYuT0YGo0H0tQN05d3VR3xH1Pw5LY1pKv6p44Fuim
 I/IWw0QqkxLmorbkIdXq59srVoTED2srkZj6st02JNee9OqQ2Eb78JNGz8O637XQvSv2
 a8GPQb2YMZZ7T6enNMEZzEikSCMVQGandGhWfcH9o1niIHFLcdqZvEMpt5i74klHW0DS
 cd3g==
X-Gm-Message-State: AJIora9dT6vhXMqAgdJGr6WaYeULf8WwsHMlvEezPJqdx4dk2WQqig5X
 wnNyADUXgOa6U+h7enaqcguUyA4+0bn1nn2kmjJow3vhFyDGMYcsUI0AzJxhDrnzx49ncyZCIVf
 EUnMMJ+HvmDBGYFY=
X-Received: by 2002:a17:907:16a6:b0:72b:5ce6:1f7d with SMTP id
 hc38-20020a17090716a600b0072b5ce61f7dmr8772069ejc.28.1657798907942; 
 Thu, 14 Jul 2022 04:41:47 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1tA40wJFxaaYtwAM8kMdoI+5ux7jlKOQX12OcVhQAfNdhNk/iuGy/7rceR+fQld8UETeLUHHQ==
X-Received: by 2002:a17:907:16a6:b0:72b:5ce6:1f7d with SMTP id
 hc38-20020a17090716a600b0072b5ce61f7dmr8772054ejc.28.1657798907720; 
 Thu, 14 Jul 2022 04:41:47 -0700 (PDT)
Received: from localhost (nat-pool-brq-t.redhat.com. [213.175.37.10])
 by smtp.gmail.com with ESMTPSA id
 j17-20020a17090623f100b0072a55ec6f3bsm609803ejg.165.2022.07.14.04.41.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 14 Jul 2022 04:41:47 -0700 (PDT)
Date: Thu, 14 Jul 2022 13:41:46 +0200
From: Igor Mammedov <imammedo@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>
Cc: "Michael S. Tsirkin" <mst@redhat.com>, qemu-devel@nongnu.org
Subject: Re: [PULL 00/54] virtio,pc,pci: fixes,cleanups,features
Message-ID: <20220714134146.23617610@redhat.com>
In-Reply-To: <CAFEAcA8u8jm7b+JD_t0qMNMy+WSJPOw=qxqptZpwTp=TkcXrhg@mail.gmail.com>
References: <20220610075631.367501-1-mst@redhat.com>
 <CAFEAcA8u8jm7b+JD_t0qMNMy+WSJPOw=qxqptZpwTp=TkcXrhg@mail.gmail.com>
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.133.124; envelope-from=imammedo@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, 14 Jul 2022 10:16:34 +0100
Peter Maydell <peter.maydell@linaro.org> wrote:

> On Fri, 10 Jun 2022 at 08:57, Michael S. Tsirkin <mst@redhat.com> wrote:
> > ----------------------------------------------------------------
> > virtio,pc,pci: fixes,cleanups,features
> >
> > more CXL patches
> > VIOT
> > Igor's huge AML rework
> > fixes, cleanups all over the place =20
>=20
> Hi. On my macos machine (an x86 one), 'make check' output for
> the bios-tables-test for both i386 and x86-64 guests now includes
> a warning message:
>=20
> qemu-system-i386: -device isa-applesmc: warning: Using AppleSMC with inva=
lid key
>=20
> I have not bisected but I rather suspect that this is the result of
> the applesmc test changes in this pullreq.

Like warning says, test case doesn't have SMC key after which
QEMU uses some made up default.

It can't suppressed with 'qtest_enabled()' since QEMU in test
doesn't use qtest as accelerator.

I'm more inclined to removing warning.

>=20
> >       tests: acpi: add applesmc testcase =20
>=20
>=20
>  45/582 qemu:qtest+qtest-i386 / qtest-i386/bios-tables-test
>   OK             108.07s   47 subtests passed
> =E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=
=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=
=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=
=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=
=E2=80=95=E2=80=95=E2=80=95=E2=80=95 =E2=9C=80  =E2=80=95=E2=80=95=E2=80=95=
=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=
=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=
=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=
=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=
=80=95
> stderr:
>=20
> Looking for expected file 'tests/data/acpi/pc/FACP'
> Using expected file 'tests/data/acpi/pc/FACP'
> Looking for expected file 'tests/data/acpi/pc/APIC'
> Using expected file 'tests/data/acpi/pc/APIC'
> Looking for expected file 'tests/data/acpi/pc/HPET'
> Using expected file 'tests/data/acpi/pc/HPET'
> Looking for expected file 'tests/data/acpi/pc/WAET'
> Using expected file 'tests/data/acpi/pc/WAET'
> Looking for expected file 'tests/data/acpi/pc/FACS'
> Using expected file 'tests/data/acpi/pc/FACS'
> Looking for expected file 'tests/data/acpi/pc/DSDT'
> Using expected file 'tests/data/acpi/pc/DSDT'
>=20
> [snip]
> Looking for expected file 'tests/data/acpi/q35/FACS.acpierst'
> Looking for expected file 'tests/data/acpi/q35/FACS'
> Using expected file 'tests/data/acpi/q35/FACS'
> Looking for expected file 'tests/data/acpi/q35/DSDT.acpierst'
> Using expected file 'tests/data/acpi/q35/DSDT.acpierst'
> qemu-system-i386: -device isa-applesmc: warning: Using AppleSMC with inva=
lid key
>=20
> Looking for expected file 'tests/data/acpi/q35/FACP.applesmc'
> Looking for expected file 'tests/data/acpi/q35/FACP'
> Using expected file 'tests/data/acpi/q35/FACP'
> [snip]
>=20
>=20
> Could somebody investigate why this happens and fix it, please?
>=20
> thanks
> -- PMM
>=20


