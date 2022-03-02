Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 769724CA6D6
	for <lists+qemu-devel@lfdr.de>; Wed,  2 Mar 2022 15:00:10 +0100 (CET)
Received: from localhost ([::1]:42248 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nPPWT-0006HX-80
	for lists+qemu-devel@lfdr.de; Wed, 02 Mar 2022 09:00:09 -0500
Received: from eggs.gnu.org ([209.51.188.92]:51810)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1nPOJJ-0006zz-WB
 for qemu-devel@nongnu.org; Wed, 02 Mar 2022 07:42:30 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:32261)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1nPOJH-0003oW-12
 for qemu-devel@nongnu.org; Wed, 02 Mar 2022 07:42:28 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1646224944;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Yrnuj8pStRZoc1nnTwqWeHJxhLwgXDk03D2mqOwAit4=;
 b=EeEg06i9YqBPRO8rrZjZqjt59Sg8QRd4prUIr+iuwz8U66fm/NBWxZu/TOeCMzwYt+OEP3
 3n0O32O4eKZbR4s1yJPlODJym9x170Pj1inkCmg5xYNBfPpciwMl9vyIsMkupNXxQMMf1L
 kLEC8ukNhi7pg4LeeHJTuOBUdK9aOdE=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-324-LbYqLwcXNESklmEK7nqA3g-1; Wed, 02 Mar 2022 07:42:23 -0500
X-MC-Unique: LbYqLwcXNESklmEK7nqA3g-1
Received: by mail-wm1-f70.google.com with SMTP id
 c62-20020a1c3541000000b003815245c642so1867740wma.6
 for <qemu-devel@nongnu.org>; Wed, 02 Mar 2022 04:42:23 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=Yrnuj8pStRZoc1nnTwqWeHJxhLwgXDk03D2mqOwAit4=;
 b=oFF5eAnbFs7vOQ3eqtOj8cvnqoW/QtdmttHkts3lkQdID99USioO55s7t4rPEyoXUM
 nA26pl/Q5LqR3lzvlf6qJ+3bpxCYeOcFIUg15IzGs5SPGg4zP9og9l47NyQAgjEaREN0
 NpKtWdTK/dlKrYEXa3JhlWxZe90FpaRZULk1fZWitnD1AThaPDpNkmN42gtss2Nm15sp
 uo4ld8W83iAFDv71ttUucNhZo9xXQVNwRcV9AS6dVQR0R4uuRAJt2ZACfCoCvE1Yb18f
 pHeqtfFpDJZPsKrJvdhpqDfjLLv1Z3ZdA5P1s7Zwvbb/vcfgmpckdYkh8/P1Mi9PCg9h
 EQmw==
X-Gm-Message-State: AOAM5322nNLuFL0LQNTAKuxaD5TbY9hgH4Fpu1glgasaxpEeGXRL0vmU
 tr3z7twtgVH+Y3Hb7HBucF6I52zEm7ukTRn0DavJkNCJArQVSK3MeuvX/k7DXYLxmuiNveldiP2
 KN3m0PEvfdw+xcwg=
X-Received: by 2002:a5d:64ce:0:b0:1ef:ef72:925e with SMTP id
 f14-20020a5d64ce000000b001efef72925emr8808299wri.413.1646224942685; 
 Wed, 02 Mar 2022 04:42:22 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzeH2qcAvN/asd5LasyQqzO/X0+YwsAGpKsMUuEvZnua+95WQVCp5++J78z2ZMtSV3lqcMhgA==
X-Received: by 2002:a5d:64ce:0:b0:1ef:ef72:925e with SMTP id
 f14-20020a5d64ce000000b001efef72925emr8808283wri.413.1646224942462; 
 Wed, 02 Mar 2022 04:42:22 -0800 (PST)
Received: from redhat.com ([2a10:8006:355c:0:48d6:b937:2fb9:b7de])
 by smtp.gmail.com with ESMTPSA id
 f22-20020a1cc916000000b00380d3e49e89sm5316920wmb.22.2022.03.02.04.42.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 02 Mar 2022 04:42:21 -0800 (PST)
Date: Wed, 2 Mar 2022 07:42:18 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Ani Sinha <ani@anisinha.ca>
Subject: Re: [PATCH v4 2/3] hw/acpi: add indication for i8042 in IA-PC boot
 flags of the FADT table
Message-ID: <20220302074022-mutt-send-email-mst@kernel.org>
References: <20220228201733.714580-1-liavalb@gmail.com>
 <20220228201733.714580-3-liavalb@gmail.com>
 <20220301094354.1d37f470@redhat.com>
 <alpine.DEB.2.22.394.2203011514030.1522204@anisinha-lenovo>
 <3face56c-7488-6736-6394-af1d9979d00f@gmail.com>
 <CAARzgwy2SWi_SmL_YSz0Dio=ynrO_ZUtAASFpiu3-sgMagSY0g@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAARzgwy2SWi_SmL_YSz0Dio=ynrO_ZUtAASFpiu3-sgMagSY0g@mail.gmail.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: Igor Mammedov <imammedo@redhat.com>, shentey@gmail.com,
 Liav Albani <liavalb@gmail.com>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Mar 02, 2022 at 10:44:03AM +0530, Ani Sinha wrote:
> On Wed, Mar 2, 2022 at 12:50 AM Liav Albani <liavalb@gmail.com> wrote:
> >
> >
> > On 3/1/22 11:52, Ani Sinha wrote:
> > >
> > > On Tue, 1 Mar 2022, Igor Mammedov wrote:
> > >
> > >> On Mon, 28 Feb 2022 22:17:32 +0200
> > >> Liav Albani <liavalb@gmail.com> wrote:
> > >>
> > >>> This can allow the guest OS to determine more easily if i8042 controller
> > >>> is present in the system or not, so it doesn't need to do probing of the
> > >>> controller, but just initialize it immediately, before enumerating the
> > >>> ACPI AML namespace.
> > >>>
> > >>> This change only applies to the x86/q35 machine type, as it uses FACP
> > >>> ACPI table with revision higher than 1, which should implement at least
> > >>> ACPI 2.0 features within the table, hence it can also set the IA-PC boot
> > >>> flags register according to the ACPI 2.0 specification.
> > >>>
> > >>> Signed-off-by: Liav Albani <liavalb@gmail.com>
> > >>> ---
> > >>>   hw/acpi/aml-build.c         | 11 ++++++++++-
> > >>>   hw/i386/acpi-build.c        |  9 +++++++++
> > >>>   hw/i386/acpi-microvm.c      |  9 +++++++++
> > >> commit message says it's q35 specific, so wy it touched microvm anc piix4?
> > > Igor is correct. Although I see that currently there are no 8042 devices
> > > for microvms, maybe we should be conservative and add the code to detect
> > > the device anyway. In that case, the change could affect microvms too when
> > > such devices get added in the future.
> > >
> > >
> > > echo -e "info qtree\r\nquit\r\n" | ./qemu-system-x86_64 -machine microvm
> > > -monitor stdio 2>/dev/null | grep 8042
> > >
> > > <empty>
> >
> > What about this?
> >
> > echo -e "info qtree\r\nquit\r\n" | qemu-system-x86_64 -machine microvm
> > -device i8042 -monitor stdio 2>/dev/null | grep 8042
> >
> > Or this?
> >
> > echo -e "info mtree\r\nquit\r\n" | qemu-system-x86_64 -machine microvm
> > -device i8042 -monitor stdio 2>/dev/null | grep 8042
> 
> On both occasions you are explicitly adding the device.

Yes of course. It seems a bit cleaner to have -device i8042 -monitor
stdio give us the correct ACPI table even if there's no pressing need
for this ATM, simply because it's not much more code, and because if we
don't we risk guests trying to work around incorrect ACPI tables.
Let us however do this in a patch by its own with proper
documentation and motivation.

-- 
MST


