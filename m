Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E705607E79
	for <lists+qemu-devel@lfdr.de>; Fri, 21 Oct 2022 20:57:35 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1olx8d-0004zD-ED; Fri, 21 Oct 2022 14:52:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1oluUI-0003w9-3v
 for qemu-devel@nongnu.org; Fri, 21 Oct 2022 12:03:14 -0400
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1oluU8-0005ow-Mx
 for qemu-devel@nongnu.org; Fri, 21 Oct 2022 12:03:08 -0400
Received: by mail-wr1-x42f.google.com with SMTP id bv10so5632377wrb.4
 for <qemu-devel@nongnu.org>; Fri, 21 Oct 2022 09:03:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:from:to:cc:subject:date
 :message-id:reply-to;
 bh=EyuP4GqHhBtydkI167Qw34N4fUDX73FMLy1YuwVhCL8=;
 b=KvhXaYD1v3hfd181xVhcOYFW7lVtpJ6wtjESdL3UDccoGljBQ6b2FSRhBt/CeahOdD
 HxiOi2c7kn3lglfivpwg5Lrf91yWYM6KOooLEBVxosBZObdjjUheER1Vl0XB41e2uv1t
 suAhcZsR1KJKk25n0NVEWhhCdgZxgVn3lhZJ/Q5Fit7nBuCQrQOkUmuz75FoHUdHMdhN
 geZ22AZ1908I1ZQ5aGFqU+9kVlzmNoV8It8cLhGQGj4X7u2JUBmtvnVut+y7IZR7N/sG
 Fxg4SK8u9qPQEobbniJ+U48V2RFue2QFHnETPJpiv+sP+g7f+zVRS62LwOe4Y1y5GQLf
 vO0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=EyuP4GqHhBtydkI167Qw34N4fUDX73FMLy1YuwVhCL8=;
 b=5MKNoyi6iwsDKCYszeSaWe8yrizZcuxlSNlLkMwNig8W/4hk/vQSHMorjcuon/NEKF
 D+V6F7wLcOW2hoiX4ZPLRY6d36pqHY9GZgD3XV1sRsu4cdVrp/+k8+9iv3Mv9v6iNNlV
 PpvgNc4UI0hDy4oj7g+EPyJS9VyRCLK/I3/gd1/XOVpOwsMq3ptRLVI6rmaXYOOtbBV1
 JMtvcBTOfFxZxqPW5LU1gdLxaT7lGg7YV3QfQzLAX7TMQlBX8rmic9loY71q6uPzSaMo
 R361hFAiTiwBpayrps25HUk2zQ2z+FQ/3WReMjOg4GjjkdwiJSjf/bz8HK4c3M6Cr30t
 UwWQ==
X-Gm-Message-State: ACrzQf1TaC5Ej5BgtaZAlbUlSuv7D9ZrHFpERyDEqBwaS1GNeb5ZToPx
 aa4FAUdsyjqAiI+43fGJhjoXNA==
X-Google-Smtp-Source: AMsMyM7mfD0PLvNIKxwQ4i3bPt7J/6s9A6oXslbB60FZHq2s4d7EPzuCWhtUg1SrRMD3LsntQ5m7Qg==
X-Received: by 2002:adf:a4cc:0:b0:235:f41c:aa1e with SMTP id
 h12-20020adfa4cc000000b00235f41caa1emr6208248wrb.515.1666368178117; 
 Fri, 21 Oct 2022 09:02:58 -0700 (PDT)
Received: from zen.linaroharston ([185.81.254.11])
 by smtp.gmail.com with ESMTPSA id
 l13-20020a05600c2ccd00b003c6f1732f65sm3411893wmc.38.2022.10.21.09.02.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 21 Oct 2022 09:02:57 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id F18031FFB7;
 Fri, 21 Oct 2022 17:02:56 +0100 (BST)
References: <20221020083810-mutt-send-email-mst@kernel.org>
 <CAARzgwwd_How_h+9sHWPOrWWZ7CbX+DN-uy-KiGf1VVyVmrLnA@mail.gmail.com>
 <20221020084311-mutt-send-email-mst@kernel.org>
 <CAARzgwxfKbrxAqb15GXp4j1enDPUhGBsL5jUzFtDvJkGM-7azw@mail.gmail.com>
 <20221020150857-mutt-send-email-mst@kernel.org>
 <CAARzgwwDjjHL-1fEeuySNZm8NbnGNaeE5h6zrPz_zaANfs5dsw@mail.gmail.com>
 <CAARzgww8P4Za=+r8q2a30TCY7Uzw6g2tgHeLLKr7R+WV-7qQVg@mail.gmail.com>
 <20221021042449-mutt-send-email-mst@kernel.org>
 <CAARzgwyW+ved0iVinWzSCg+KSCL67v+m6KySRdg_hUUev8JLDA@mail.gmail.com>
 <87k04t7ca6.fsf@linaro.org>
 <20221021053828-mutt-send-email-mst@kernel.org>
 <CAARzgwzQZXdJCxn_YmXPGOuVTd7CzwnZ=aQRjVgZ5p2XiTosQA@mail.gmail.com>
 <87bkq575m8.fsf@linaro.org>
 <CAARzgwya9jw3YmAwHcSbzzTUewFcq8JR_hVM+=-cSePfyxO1CQ@mail.gmail.com>
 <CAARzgwy8iEDxet6bHxe4AqU=9qQfC=pk=QWoLdF+rz61T1+bMQ@mail.gmail.com>
User-agent: mu4e 1.9.1; emacs 28.2.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Ani Sinha <ani@anisinha.ca>
Cc: "Michael S. Tsirkin" <mst@redhat.com>, Beraldo Leal <bleal@redhat.com>,
 Cleber Rosa <crosa@redhat.com>, =?utf-8?Q?Daniel_P_=2E_Berrang=C3=A9?=
 <berrange@redhat.com>, Igor Mammedov <imammedo@redhat.com>, John Snow
 <jsnow@redhat.com>, Maydell Peter <peter.maydell@linaro.org>, Paolo
 Bonzini <pbonzini@redhat.com>, Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?=
 <f4bug@amsat.org>,
 Qemu Devel <qemu-devel@nongnu.org>, Thomas Huth <thuth@redhat.com>, Wainer
 dos Santos Moschetta <wainersm@redhat.com>
Subject: Re: [PATCH v6 00/10] Introduce new acpi/smbios avocado tests using
 biosbits
Date: Fri, 21 Oct 2022 16:53:54 +0100
In-reply-to: <CAARzgwy8iEDxet6bHxe4AqU=9qQfC=pk=QWoLdF+rz61T1+bMQ@mail.gmail.com>
Message-ID: <87pmel5fm7.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::42f;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x42f.google.com
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org


Ani Sinha <ani@anisinha.ca> writes:

> On Fri, 21 Oct, 2022, 5:52 pm Ani Sinha, <ani@anisinha.ca> wrote:
>
>  On Fri, 21 Oct, 2022, 5:26 pm Alex Benn=C3=A9e, <alex.bennee@linaro.org>=
 wrote:
>
>  Ani Sinha <ani@anisinha.ca> writes:
>
>  > On Fri, Oct 21, 2022 at 3:10 PM Michael S. Tsirkin <mst@redhat.com> wr=
ote:
>  >>
>  >> On Fri, Oct 21, 2022 at 10:30:09AM +0100, Alex Benn=C3=A9e wrote:
>  >> >
>  >> > Ani Sinha <ani@anisinha.ca> writes:
>  >> >
>  >> > > On Fri, Oct 21, 2022 at 2:02 PM Michael S. Tsirkin <mst@redhat.co=
m> wrote:
>  >> > >>
>  >> > >> On Fri, Oct 21, 2022 at 05:45:15AM +0530, Ani Sinha wrote:
>  >> > >> > And have multiple platform specific branches in bits that have=
 fixes for those
>  >> > >> > platforms so that bits can run there. Plus the existing test c=
an be enhanced to
>  >> > >> > pull in binaries from those branches based on the platform on =
which it is being
>  >> > >> > run.
>  >> > >> >
>  >> > >>
>  >> > >> What a mess.
>  >> > >> Who is going to be testing all these million platforms?
>  >> > >
>  >> > > I am not talking about branches in QEMU but branches in bits.
>  >> > > If you are going to test multiple platforms, you do need to build=
 bits
>  >> > > binaries for them. There is no way around it.
>  >> > > bits is not all platform independent python. It does have binary =
executables.
>  >> > >
>  >> > > Currently bits is built only for the x86 platform. Other platform=
s are
>  >> > > not tested. I doubt if anyone even tried building bits for arm or
>  >> > > mips.
>  >> >
>  >> > I'm not worried about test bits on other targets, but we do run x86
>  >> > targets on a number of hosts. The current reliance on a special pat=
ched
>  >> > host build tool for only one architecture is the problem. If  we ju=
st
>  >> > download the iso that problem goes away.
>  >>
>  >> =F0=9F=91=8Dwhat he said.
>  >
>  > Yes, in that case the problem is that upstream bits does not pass all
>  > the test out of the box. Hence we are taking this approach of keeping
>  > some test scripts in QEMU repo and modifying them. Then generating the
>  > iso with the modified scripts. It also helps developers who want to
>  > write new tests or make enhancements to existing tests.
>  > If modifications need to be made to tests, they need to be versioned.
>  > We have gone through the route of not using submodules and I am not
>  > going to open that can of worms again.
>
>  We have added a mirror of biosbits to the QEMU project so there is no
>  reason why we can't track changes and modifications there (we do this
>  for TestFloat which is forked from the upstream SoftFloat code).
>
>  The whole idea was that say an acpi developer added support for a new ta=
ble in QEMU, he should write a
>  corresponding test for bits so that the same table is exercised during r=
un time. Making those changes from a single
>  repo (either directly or through a submodule)  makes things lit simpler =
and also keeps things in sync with each
>  other. If we use separate repos for acpi bits test, it will be another m=
ess when comes to developers adding changes
>  and keeping things in sync.

For people that care about ACPI it shouldn't be that hard. Most QEMU
developers have separate repos of test cases that aren't directly
integrated into QEMU for various things (e.g. RISU, semihosting,
baremetal, kvm-unit-tests, LTP).

> Not only this. let's look at the developers workflow.
>
> (A) check out bits repo.
> (B) write new test.
> (C) build the bits iso.
> (D) get back to QEMU repo.
> (E) point the test to the new iso so that the test gets executed.

This seems like a long winded workflow. Usually you test your binaries
before integrating them into the acceptance tests. All you need is a
script to launch qemu (either system or point at a developer binary) and
run directly. Only once you are happy with the final ISO would you
upload and then integrate into check-acceptance.

> (F) oops something failed. So let's rinse and repeat.
> (G) once ready, send a PR for bits repo. update tags and figure out how g=
itlab ci works so that the QEMU test can point to
> it. To do that figure out the artefact  hash and other parameters.
> (H) send a patch for QEMU repo to update the test to point to new iso.
>
> How complicated is that? How complicated will it be for the reviewer? Rig=
ht now the developer can simply make changes
> from a single repo and run a avocado test and check logs for failures. On=
ce test is fixed, they can run the test again to
> make sure everything passes. Once done, commit the test in QEMU repo. If =
the test exercises a new table we make sure
> that the commits adding the new table is already present before the test =
that exercises it is committed. Send a patch for
> review. The reviewer applies the patch and simply runs the avocado test f=
rom QEMU repo. Everything is in one place. No
> back and forth between two repos. A lot like "make check".

We do indeed build tests for a lot of make check (unit, qtest, tcg) but
they build on all our host architectures and have configure machinery to
make them optional if host binaries are missing. For avocado tests we
typically are using other peoples binaries so this series is a departure
from that model.

--=20
Alex Benn=C3=A9e

