Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DFA584AC38A
	for <lists+qemu-devel@lfdr.de>; Mon,  7 Feb 2022 16:32:14 +0100 (CET)
Received: from localhost ([::1]:57818 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nH5zy-0006wG-1i
	for lists+qemu-devel@lfdr.de; Mon, 07 Feb 2022 10:32:14 -0500
Received: from eggs.gnu.org ([209.51.188.92]:43438)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1nH5es-0002pD-KE
 for qemu-devel@nongnu.org; Mon, 07 Feb 2022 10:10:28 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:52999)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1nH5eo-0005oB-Do
 for qemu-devel@nongnu.org; Mon, 07 Feb 2022 10:10:24 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1644246620;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=mtTdy4xIBlfAdZUmHlXSqagU/GHrBC6ynwM2vD77D9I=;
 b=g5OCkQiKE6bBPuM5yDqE8eQyFIyM0yoedxGcavS3vnpGJQinp33ja5NtqihKMwbjVw+UtS
 koeGRW7q2gWhix1yK5kwE0ETU6O6qpU7KGKKpmSagasBHTyc7vBEwtkz/yD26Hjul46TLP
 3aQNrf2GDssRbBMmsUXZu6HWvS3/mQs=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-446-ghq98dYgPIatAmKT55V3Fg-1; Mon, 07 Feb 2022 10:10:19 -0500
X-MC-Unique: ghq98dYgPIatAmKT55V3Fg-1
Received: by mail-ej1-f70.google.com with SMTP id
 fy20-20020a170906b7d400b006c97d43badaso1187031ejb.14
 for <qemu-devel@nongnu.org>; Mon, 07 Feb 2022 07:10:18 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=mtTdy4xIBlfAdZUmHlXSqagU/GHrBC6ynwM2vD77D9I=;
 b=z4g+R4Vqsc0VEmB4SZ5/U8Cv4ujPxA8DNadr6ZXbVv3YMVWoHYVVPi8toqjkuNMm8S
 +saA8tUippSkVPJArZoXtnFffUOSCdyREoygyKZ20mY8WusxlmpI5z5Pvj87ju46k2QR
 DbzxvbsoKBbpyaW/Y8x/xS8P6LgfqcNyz6fm8J4oWJsOfrrg7FBLvgrxqSxlufzvcsia
 DaM3mRIU+bs/3r2IIrLdoboobZVQ7zyBgzfBhShQRw55SCuh4auMgCdjVJFHByRUXTKE
 iYCnf9Ah797yKxqcSRYuOHhgRKNhjvlgY+F+X0HHd6DrSyn00j4aALpboTHdPAjmrO0d
 6lqQ==
X-Gm-Message-State: AOAM530Dhid5EbnYL62AImSLhGJ2hpSpUYKXRUMwHNjzwiXL75swoBIs
 kktRNTAQZRHlspKSnWWtsLqJq2RXgyGg41ozpv2fACeWdDcaBFEfTq6OdWAut9zGhyU9YQQ7C2J
 Q2gekCJ4tEAB9BM0=
X-Received: by 2002:a05:6402:c15:: with SMTP id
 co21mr14146513edb.185.1644246617912; 
 Mon, 07 Feb 2022 07:10:17 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxq68DJmXQSYmZBFMGcL5pn8BU9ocDTrTyR50VUoi9siZ2+t8YNDjUoTVXEd82GgTyFaIfspw==
X-Received: by 2002:a05:6402:c15:: with SMTP id
 co21mr14146478edb.185.1644246617620; 
 Mon, 07 Feb 2022 07:10:17 -0800 (PST)
Received: from localhost (nat-pool-brq-t.redhat.com. [213.175.37.10])
 by smtp.gmail.com with ESMTPSA id h21sm1677209edt.26.2022.02.07.07.10.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 07 Feb 2022 07:10:16 -0800 (PST)
Date: Mon, 7 Feb 2022 16:10:14 +0100
From: Igor Mammedov <imammedo@redhat.com>
To: "Michael S. Tsirkin" <mst@redhat.com>
Subject: Re: [PATCH v5 16/43] tests/acpi: Add update DSDT.viot
Message-ID: <20220207161014.0689ba4a@redhat.com>
In-Reply-To: <20220204085953-mutt-send-email-mst@kernel.org>
References: <20220202141037.17352-1-Jonathan.Cameron@huawei.com>
 <20220202141037.17352-17-Jonathan.Cameron@huawei.com>
 <20220204085953-mutt-send-email-mst@kernel.org>
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.31; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=imammedo@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=imammedo@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Ben Widawsky <ben.widawsky@intel.com>, Samarth Saxena <samarths@cadence.com>,
 Chris Browy <cbrowy@avery-design.com>, qemu-devel@nongnu.org,
 linux-cxl@vger.kernel.org, linuxarm@huawei.com,
 Shreyas Shah <shreyas.shah@elastics.cloud>, Saransh Gupta1 <saransh@ibm.com>,
 Shameerali Kolothum Thodi <shameerali.kolothum.thodi@huawei.com>,
 Jonathan Cameron <Jonathan.Cameron@huawei.com>,
 Marcel Apfelbaum <marcel@redhat.com>, Dan Williams <dan.j.williams@intel.com>,
 Alex =?UTF-8?B?QmVubsOpZQ==?= <alex.bennee@linaro.org>,
 Philippe =?UTF-8?B?TWF0aGlldS1E?= =?UTF-8?B?YXVkw6k=?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, 4 Feb 2022 09:01:31 -0500
"Michael S. Tsirkin" <mst@redhat.com> wrote:

> On Wed, Feb 02, 2022 at 02:10:10PM +0000, Jonathan Cameron wrote:
> > From: Jonathan Cameron <jonathan.cameron@huawei.com>
> > 
> > The consolidation of DSDT AML generation for PCI host bridges
> > lead to some minor ordering changes and the addition of _ADR
> > with a default of 0 for those case that didn't already have it.
> > Only DSDT.viot test is affected.
> > 
> > Changes all similar to:
> > 
> > Scope (\_SB)
> >      {
> >        Device (PC30)
> >        {
> > -        Name (_UID, 0x30)  // _UID: Unique ID
> >          Name (_BBN, 0x30)  // _BBN: BIOS Bus Number
> >          Name (_HID, EisaId ("PNP0A08") /* PCI Express Bus */)  // _HID: Hardware ID
> >          Name (_CID, EisaId ("PNP0A03") /* PCI Bus */)  // _CID: Compatible ID
> > +        Name (_ADR, Zero)  // _ADR: Address
> > +        Name (_UID, 0x30)  // _UID: Unique ID
> >          Method (_OSC, 4, NotSerialized)  // _OSC: Operating System Capabilities
> > 
> > Signed-off-by: Jonathan Cameron <jonathan.cameron@huawei.com>  
> 
> A bit worried about _ADR here.  It's probably fine as it should be
> unused but in the past some changes like that confused windows guests
> where they would lose e.g. a static ip config since from their
> POV device address changed.

Spec[1] doesn't mention _ADR in context of host bridge(s) at all,
for all I know it shouldn't be there. QEMU inherited it from
SeaBIOS where it is dated to 2008 (as part of large blob adding ACPI for PCI).

Instead of spreading undefined field to other places,
I'd prefer removing it from root host bridge.
But as Michael said it should be very well tested with various guest
OSes.

Jonathan,
Can you compare nic naming (as guest sees it) with current master
and without _ADR on root host bridge?
One way to test it could be
  1. start QEMU(master) configure static IP addr on an interface,
     and shutdown guest
  2. start QEMU(-_ARR) with guest image from step 1 and see if
     interface is still there with IP address it was configured.

test matrix should be something like that:
 PCI(pc machine),PCI-E (q35 machine)/
   Windows 2012-whatever latest Windows, some contemporary linux,
   ancient linux (pre 'stable' interface naming) (something like
   RHEL6 or any other distro from that era)

1) PCI_Firmware_v3.2_01-26-2015_ts_clean_Firmware_Final

> Igor, what do you think?
>
> > ---
> >  tests/data/acpi/q35/DSDT.viot               | Bin 9398 -> 9416 bytes
> >  tests/qtest/bios-tables-test-allowed-diff.h |   1 -
> >  2 files changed, 1 deletion(-)
> > 
> > diff --git a/tests/data/acpi/q35/DSDT.viot b/tests/data/acpi/q35/DSDT.viot
> > index 1c3b4da5cbe81ecab5e1ef50d383b561c5e0f55f..207ac5b9ae4c3a4bc0094c2242d1a1b08771b784 100644
> > GIT binary patch
> > delta 139
> > zcmdnydBT&+CD<k8gbD)#<CBeCu5zLdVlnZ-PVv!A?xF$C#s(bmPELMY6KfQhxC}No
> > z$Z0Y1qbM*kn0!E9nwKNq(Itq1BR<sAg-ZdbOrCM_F9mK?rG^HRr4><?3V@Yv4pmBI
> > F0sxp4B{u*7
> > 
> > delta 143
> > zcmX@%xy_TyCD<ion+gL1<MNGMu5zMYqA~HoPVv!Aj-mn1#s(bmp`I>WlVjy%CeC%7
> > z+^Kj^(SX5#0jQdxl0g7Ptr1kM!sPw((lEse3<_8k8$uNeOjb|?Dc;<vXwM7)8)+to
> > 
> > diff --git a/tests/qtest/bios-tables-test-allowed-diff.h b/tests/qtest/bios-tables-test-allowed-diff.h
> > index 08a8095432..dfb8523c8b 100644
> > --- a/tests/qtest/bios-tables-test-allowed-diff.h
> > +++ b/tests/qtest/bios-tables-test-allowed-diff.h
> > @@ -1,2 +1 @@
> >  /* List of comma-separated changed AML files to ignore */
> > -"tests/data/acpi/q35/DSDT.viot",
> > -- 
> > 2.32.0  
> 


