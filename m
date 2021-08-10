Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 68C723E5C65
	for <lists+qemu-devel@lfdr.de>; Tue, 10 Aug 2021 15:57:59 +0200 (CEST)
Received: from localhost ([::1]:43644 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mDSGU-0006Hj-DS
	for lists+qemu-devel@lfdr.de; Tue, 10 Aug 2021 09:57:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46006)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ardb@kernel.org>)
 id 1mDSDV-0001Qo-OA; Tue, 10 Aug 2021 09:54:53 -0400
Received: from mail.kernel.org ([198.145.29.99]:47814)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ardb@kernel.org>)
 id 1mDSDR-0002v4-KQ; Tue, 10 Aug 2021 09:54:52 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 96B2E61073;
 Tue, 10 Aug 2021 13:54:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1628603687;
 bh=3t7sOCgcZ7Voa/1oPqI18JDCHx5GjM2EIHW1CY/E5J8=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=CYm/qARTWjc83aVWplI7XBZOiCptYd497fCf3mT/7OUtoFvS0EbR3Cf4JljJ34pmS
 50zc4Kb+pYa4h15BUlJIkRl6nxFPhrU0mQxcT6U/gqtSY4SVfMPyhHaSOL1rPC/Qqh
 oavirCjc7HISre3jEjblAcxCZN3fTE4XrlUvOtEF2faqEEVJir+r8nMgVRZiwZD3Gn
 V7BdJnSFWapFCKSipY207dhWxALZ7siIlfFbux4MHwfmV8mSoeM735dcbFnTMrkIZ7
 KQ6gehwcaIqPqIXmanPGlV4p11A5RB2lUvczb3gNuBkQP7cr/X4SbJ4YiTB5cgJCHb
 X+Pf4bhYWQ70w==
Received: by mail-ot1-f48.google.com with SMTP id
 e13-20020a9d63cd0000b02904fa42f9d275so11174923otl.1; 
 Tue, 10 Aug 2021 06:54:47 -0700 (PDT)
X-Gm-Message-State: AOAM533r3UkNHvBJWJhCTQwGqQDs+FfVT7AlVTfu1GbqCtAxsGjqdbAC
 7lRIW0GBf+Yiwmi6YsFqP5fwix9aDHTw5XfolG8=
X-Google-Smtp-Source: ABdhPJwh49OsHgA0csi8L0qqPnjYBRqz7mFsbxxjELpXnHz3fyp3tuYR1kAuPJWmS0DNIonP2YPt8Hw0Z7maUKwV360=
X-Received: by 2002:a9d:5cb:: with SMTP id 69mr21058780otd.90.1628603686954;
 Tue, 10 Aug 2021 06:54:46 -0700 (PDT)
MIME-Version: 1.0
References: <20210810083057.99651-1-eric.auger@redhat.com>
 <CAMj1kXHie7aFoQ-7aMcckX2OMepbGeE6SLV8x=FDppeZHws5OA@mail.gmail.com>
 <4dae638d-6f96-c036-2a6b-5ef179012029@redhat.com>
 <PAXPR08MB6987EDE1A3331050FC312AC490F79@PAXPR08MB6987.eurprd08.prod.outlook.com>
In-Reply-To: <PAXPR08MB6987EDE1A3331050FC312AC490F79@PAXPR08MB6987.eurprd08.prod.outlook.com>
From: Ard Biesheuvel <ardb@kernel.org>
Date: Tue, 10 Aug 2021 15:54:35 +0200
X-Gmail-Original-Message-ID: <CAMj1kXGeVZBqi00Xg8xhE_CoCQnDDmbbhawg-5reNpTTr=bCvA@mail.gmail.com>
Message-ID: <CAMj1kXGeVZBqi00Xg8xhE_CoCQnDDmbbhawg-5reNpTTr=bCvA@mail.gmail.com>
Subject: Re: [PATCH for-6.2] hw/arm/virt_acpi_build: Generate DBG2 table
To: Samer El-Haj-Mahmoud <Samer.El-Haj-Mahmoud@arm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=198.145.29.99; envelope-from=ardb@kernel.org;
 helo=mail.kernel.org
X-Spam_score_int: -77
X-Spam_score: -7.8
X-Spam_bar: -------
X-Spam_report: (-7.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.704,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_HI=-5, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Andrew Jones <drjones@redhat.com>,
 "gshan@redhat.com" <gshan@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 "jcm@redhat.com" <jcm@redhat.com>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 "eric.auger@redhat.com" <eric.auger@redhat.com>,
 Shannon Zhao <shannon.zhaosl@gmail.com>, qemu-arm <qemu-arm@nongnu.org>,
 Igor Mammedov <imammedo@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>,
 Al Stone <ahs3@redhat.com>,
 "eric.auger.pro@gmail.com" <eric.auger.pro@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, 10 Aug 2021 at 15:11, Samer El-Haj-Mahmoud
<Samer.El-Haj-Mahmoud@arm.com> wrote:
>
>
>
> > -----Original Message-----
> > From: Eric Auger <eric.auger@redhat.com>
> > Sent: Tuesday, August 10, 2021 6:25 AM
> > To: Ard Biesheuvel <ardb@kernel.org>
> > Cc: eric.auger.pro@gmail.com; Michael S. Tsirkin <mst@redhat.com>; Igor
> > Mammedov <imammedo@redhat.com>; Philippe Mathieu-Daud=C3=A9
> > <philmd@redhat.com>; Peter Maydell <peter.maydell@linaro.org>; Shannon
> > Zhao <shannon.zhaosl@gmail.com>; qemu-arm <qemu-arm@nongnu.org>;
> > qemu-devel@nongnu.org; Andrew Jones <drjones@redhat.com>;
> > gshan@redhat.com; Samer El-Haj-Mahmoud <Samer.El-Haj-
> > Mahmoud@arm.com>; Al Stone <ahs3@redhat.com>; jcm@redhat.com
> > Subject: Re: [PATCH for-6.2] hw/arm/virt_acpi_build: Generate DBG2 tabl=
e
> >
> > Hello Ard,
> > On 8/10/21 11:36 AM, Ard Biesheuvel wrote:
> > > On Tue, 10 Aug 2021 at 10:31, Eric Auger <eric.auger@redhat.com> wrot=
e:
> > >> ARM SBBR specification mandates DBG2 table (Debug Port Table 2).
> > >> this latter allows to describe one or more debug ports.
> > >>
> > >> Generate an DBG2 table featuring a single debug port, the PL011.
> > >>
> > >> The DBG2 specification can be found at:
> > >> https://docs.microsoft.com/en-us/windows-hardware/drivers/bringup/ac=
pi-
> > debug-port-table?redirectedfrom=3DMSDN
> > >>
> > > Have the legal issues around this table been resolved in the mean
> > > time?
> > I don't know exactly what they are. Adding Al and Jon in the loop they
> > have more information about this.
> > How did you resolve the issue for EDK2
> > (DynamicTablesPkg/Library/Acpi/Arm/AcpiDbg2LibArm/Dbg2Generator.c)?
> > >  Also, any clue why this table is mandatory to begin with? The
> > > SBBR has been very trigger happy lately with making things mandatory
> > > that aren't truly required from a functional perspective.
> > It seems there are kernel FW test suites that check all mandated tables
> > are available and they currently fail for ARM virt.
> > Indeed from a function pov, I don't know much about its usage on ARM.
> >
> > Maybe the SBBR spec should not flag the DBG2 as mandatory and test
> > suites shall be updated. I think this should be clarified at ARM then,
> > all the more so if there are legal issues as its spec is owned by Micro=
soft?
> >
>
> DBG2 has been required in SBBR since SBBR ver 1.0 (published 2016, with t=
he 0.9 draft since 2014)
> https://developer.arm.com/documentation/den0044/b/?lang=3Den
>
> SBBR requires DBG2 because Windows requires it on all systems: https://do=
cs.microsoft.com/en-us/windows-hardware/drivers/bringup/acpi-system-descrip=
tion-tables#debug-port-table-2-dbg2 , and Windows is one of the key OSes ta=
rgeted by SBBR.
>
> The DBG2 (and SPCR) spec license issue has been resolved since August 201=
5. Microsoft updated both specs with identical license language, giving pat=
ent rights for implementations under the Microsoft Community Promise, and t=
he Open OWF 1.0. This Foundation.
>
> DBG2: https://docs.microsoft.com/en-us/windows-hardware/drivers/bringup/a=
cpi-debug-port-table
> SPCR: https://docs.microsoft.com/en-us/windows-hardware/drivers/serports/=
serial-port-console-redirection-table
>

Thanks Samer, for stating this on record here - and apologies for
suggesting that this was another frivolous addition to a recent SBBR
revision.

As for the difference between the two: SPCR describes the serial
console, which is an actual interactive console used for maintenance,
which exists in addition to the full blown Windows GUI, which is
always the primary interface.

DBG2 is used as a debug port, which is used for the kernel debugger,
if I am not mistaken. So SPCR and DBG2 are complementary, and it does
make sense to have both.

