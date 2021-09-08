Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BEE1140398E
	for <lists+qemu-devel@lfdr.de>; Wed,  8 Sep 2021 14:14:53 +0200 (CEST)
Received: from localhost ([::1]:42678 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mNwTc-000207-Qj
	for lists+qemu-devel@lfdr.de; Wed, 08 Sep 2021 08:14:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37768)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1mNwQ7-0004Tc-0F
 for qemu-devel@nongnu.org; Wed, 08 Sep 2021 08:11:15 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:34936)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1mNwQ4-0007RF-Dv
 for qemu-devel@nongnu.org; Wed, 08 Sep 2021 08:11:14 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1631103071;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=F3G00h6hs4udh6BPaQVMLxiyEMReca/qSlx0dc4JLes=;
 b=dEc4H3MnH9fX1Okq2ZB6QINIptKHWJKZp6eGnbhcWUN14nLMPkU5pXph1QCqKzBtn8UW7C
 MWyGr9dXRAa7BPa+Dmgvptjja2RlFz8c+Bbc/BRrpa498FpEPvBEXiPJSIFZ1mUyLdn8bG
 tiyZa4XjiqUupoSY4HlfEx10T8/Ld/I=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-252-q3YpoLQpOZuSL2NgzjQV6w-1; Wed, 08 Sep 2021 08:11:10 -0400
X-MC-Unique: q3YpoLQpOZuSL2NgzjQV6w-1
Received: by mail-ed1-f69.google.com with SMTP id
 d25-20020a056402517900b003c7225c36c2so994686ede.3
 for <qemu-devel@nongnu.org>; Wed, 08 Sep 2021 05:11:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=F3G00h6hs4udh6BPaQVMLxiyEMReca/qSlx0dc4JLes=;
 b=anboq05rBk1xtXXhBg5Uva+ZEQ7dzIbCJklUAnQtaUXNX81yuZ35miBuef8CnbR5dR
 Tc70b3Vaj5xWcD1AguWAj13W2vZEvkuL0rQx0+t63NLPk5PCkTN/MxWuPsWwl2u1zAFm
 imddAphzaV1dy0HlWNVSfdu7wKZTcfMcZKZqx6UFcD2gRGIciaa8nA//y6DxeFiqDw0i
 Z8ECQpT/kATj9dSLH17zb78H3QaPLIfbGqGMBqv7SzTClWAe3foooZ9/xcao0XEkyj8A
 XMgU1Re4Kco9gRX2MAf6LYVc+F1g83WfMgV/MsxkUd3WsFGjiCoWfaO9mz7gadU9wu5I
 Oo/w==
X-Gm-Message-State: AOAM530Lc9jCh1RRZlZwogfxdTLP7wVALQ5b7CP/ndype/mqZWMDbTSE
 FPe2/P3pmS/1Yh5Yd/WMatZB/wpMQz3q0QT5qhrV2/5jFQa4uNaaF/vhIxJ4PGrs+tpDaudiMgE
 1iOrcj818F6hx52U=
X-Received: by 2002:a17:906:d183:: with SMTP id
 c3mr3747323ejz.283.1631103069289; 
 Wed, 08 Sep 2021 05:11:09 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJytzW5obToDUS3sSygg1KwxltxaswE6j78dwU9Yp8Y/ssRynLAsHWB2wyirKwihdoMh3zCulQ==
X-Received: by 2002:a17:906:d183:: with SMTP id
 c3mr3747307ejz.283.1631103069098; 
 Wed, 08 Sep 2021 05:11:09 -0700 (PDT)
Received: from localhost (nat-pool-brq-t.redhat.com. [213.175.37.10])
 by smtp.gmail.com with ESMTPSA id d22sm990906ejj.47.2021.09.08.05.11.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 08 Sep 2021 05:11:06 -0700 (PDT)
Date: Wed, 8 Sep 2021 14:11:05 +0200
From: Igor Mammedov <imammedo@redhat.com>
To: Philippe =?UTF-8?B?TWF0aGlldS1EYXVkw6k=?= <philmd@redhat.com>
Subject: Re: [PATCH] hw/i386/acpi-build: adjust q35 IO addr range for acpi
 pci hotplug
Message-ID: <20210908141105.4f0d5c28@redhat.com>
In-Reply-To: <55495984-43ba-0b93-db74-e7f8602be178@redhat.com>
References: <20210908041139.2219253-1-ani@anisinha.ca>
 <20210908084256.6077f7a3@redhat.com>
 <alpine.DEB.2.22.394.2109081229250.2227929@anisinha-lenovo>
 <20210908104351.72d0bb19@redhat.com>
 <55495984-43ba-0b93-db74-e7f8602be178@redhat.com>
X-Mailer: Claws Mail 3.18.0 (GTK+ 2.24.33; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=imammedo@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.133.124; envelope-from=imammedo@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) DKIMWL_WL_HIGH=-0.393, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: Ani Sinha <ani@anisinha.ca>, jusual@redhat.com, qemu-devel@nongnu.org,
 "Michael S. Tsirkin" <mst@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, 8 Sep 2021 12:21:26 +0200
Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com> wrote:

> On 9/8/21 10:43 AM, Igor Mammedov wrote:
> > On Wed, 8 Sep 2021 12:51:04 +0530 (IST)
> > Ani Sinha <ani@anisinha.ca> wrote:
> >  =20
> >> On Wed, 8 Sep 2021, Igor Mammedov wrote:
> >> =20
> >>> On Wed,  8 Sep 2021 09:41:39 +0530
> >>> Ani Sinha <ani@anisinha.ca> wrote:
> >>>   =20
> >>>> Change caf108bc58790 ("hw/i386/acpi-build: Add ACPI PCI hot-plug met=
hods to Q35")
> >>>> selects an IO address range for acpi based PCI hotplug for q35 arbit=
rarily. It
> >>>> starts at address 0x0cc4 and ends at 0x0cdb. It was assumed that thi=
s address
> >>>> range was free and available. However, upon more testing, it seems t=
his address
> >>>> range to be not available for some latest versions of windows.   =20
> >>>
> >>> The range is something assigned by QEMU, and guest has no say where i=
t should be.
> >>> but perhaps we failed to describe it properly or something similar, s=
o one gets
> >>> 'no resource' error.   =20
> >>
> >> OK dug deeper. The existing range of IO address conflicts with the CPU
> >> hotplug range.
> >>
> >> CPU hotplug range (ICH9_CPU_HOTPLUG_IO_BASE) is 0x0cd8 to 0x0ce3
> >>
> >> This intersects with range 0x0cc4 to 0x0cdb for ACPI_PCIHP_ADDR_ICH9 .=
 =20
> >=20
> > Looking at 'info mtree' it's indeed wrong:
> >=20
> >     0000000000000cc4-0000000000000cdb (prio 0, i/o): acpi-pci-hotplug
> >     0000000000000cd8-0000000000000cf7 (prio 0, i/o): acpi-cpu-hotplug
> >=20
> > which of them eventually handles IO request in intersection range? =20
>=20
> (qemu) info mtree -f
> FlatView #0
>  AS "I/O", root: io
>  Root memory region: io
>   0000000000000cc4-0000000000000cd7 (prio 0, i/o): acpi-pci-hotplug
>   0000000000000cd8-0000000000000cf7 (prio 0, i/o): acpi-cpu-hotplug

thanks, at least it didn't break cpu-hotplug

> >=20
> > Please, add to commit message your findings, so it would point out
> > where problem comes from and what it breaks(doesn't work as expect).
> >=20
> > Given it's broken to begin with (and possibly regression if it broke cp=
u hotplug),
> > I'm inclined to fix it without adding compat stuff.
> > Michael, what do you think? =20
>=20


