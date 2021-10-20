Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 797A8434878
	for <lists+qemu-devel@lfdr.de>; Wed, 20 Oct 2021 12:01:29 +0200 (CEST)
Received: from localhost ([::1]:43656 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1md8PY-00029A-Hp
	for lists+qemu-devel@lfdr.de; Wed, 20 Oct 2021 06:01:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41578)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1md8MG-0000x2-Mj
 for qemu-devel@nongnu.org; Wed, 20 Oct 2021 05:58:06 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:35551)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1md8MD-0001iX-7g
 for qemu-devel@nongnu.org; Wed, 20 Oct 2021 05:58:04 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1634723880;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=XIPGqf0LshoAVDS4ljSDZgSlHNtqwlBN+xpm69Rlk4E=;
 b=dP+ocLKiTTz7D+S2LvSE8vv4vN1lJAov1rtjncmGBm0LMY6yC5gfbky6m/B6zq3uzCZ59Q
 iysqq9Sh9Azn/ZDGfTkbcG6jYbZ5Ag74ygn6CucCbSJxboZLKOgDciw2ktjmC4Dxxre64w
 N9th45HV8hVw6MWH8QeL2cqVhEy9DT8=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-602-8cnTzcXsPsC0jZtQr-q9Qg-1; Wed, 20 Oct 2021 05:57:58 -0400
X-MC-Unique: 8cnTzcXsPsC0jZtQr-q9Qg-1
Received: by mail-wm1-f71.google.com with SMTP id
 128-20020a1c0486000000b0030dcd45476aso3928699wme.0
 for <qemu-devel@nongnu.org>; Wed, 20 Oct 2021 02:57:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=XIPGqf0LshoAVDS4ljSDZgSlHNtqwlBN+xpm69Rlk4E=;
 b=lsGohVYGW4RTkv6ozq1qFtTbb2EUp8VR2EM3duPm+NDqq6vPovPPfkW+WMKnNJp1Hj
 znDh9KiX+K95/0gptqHzcs1xWc6GM1S+utUKi6uFVKv35uHLYhGIbXYk5QPEDcsCJkz7
 lTej62qdFFwoeGReNH89n0wu6VUNbOn3bTxVQygyDbl9W8c3/fyURFhBZFeALqPX4PPv
 t7b+/Hk6hBox4XIDAdbcuS9dvKgTl5lhdZv+pAvVl1Sy8ZNSNpTSN5KP5+a9jE8eyU/r
 thsyCEZ382iZjNo+VFu3D1Hg6Suy9+yaThPJ6XxADGvwjz7zhVAJCYyPYC/UEsqq77VX
 +91Q==
X-Gm-Message-State: AOAM530+0MmSSD28bIIRJSuw5e4K/prXxEsyr+K/jVB2ZW/EmIxCJp3u
 VQRjlNQLa7dw4HARg5KC1xfwFHjJzAizqGzV56H+CemkrpN/sWeR87pvIwxs4SEHucLc/TY3Dn7
 TG8ulxt5jaebg1U8=
X-Received: by 2002:a7b:cbd1:: with SMTP id n17mr12529788wmi.113.1634723877268; 
 Wed, 20 Oct 2021 02:57:57 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyNZtsbJcjyEzh/8KZBh6R5c1Dmt6zf4Hy/IKPZYmvFLxtzb8FvSJw78+rQ3pZJA0rDUMG0wA==
X-Received: by 2002:a7b:cbd1:: with SMTP id n17mr12529766wmi.113.1634723876983; 
 Wed, 20 Oct 2021 02:57:56 -0700 (PDT)
Received: from localhost (nat-pool-brq-t.redhat.com. [213.175.37.10])
 by smtp.gmail.com with ESMTPSA id v13sm1568137wrs.53.2021.10.20.02.57.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 20 Oct 2021 02:57:56 -0700 (PDT)
Date: Wed, 20 Oct 2021 11:57:55 +0200
From: Igor Mammedov <imammedo@redhat.com>
To: "Michael S. Tsirkin" <mst@redhat.com>
Subject: Re: [PATCH v2 05/15] tests: acpi: update expected tables blobs
Message-ID: <20211020115755.6df29c21@redhat.com>
In-Reply-To: <20211020054302-mutt-send-email-mst@kernel.org>
References: <20210902113551.461632-1-imammedo@redhat.com>
 <20210902113551.461632-6-imammedo@redhat.com>
 <20211018163459-mutt-send-email-mst@kernel.org>
 <20211019115632.283aabe0@redhat.com>
 <20211019062402-mutt-send-email-mst@kernel.org>
 <20211020110521.5d4ba9e0@redhat.com>
 <20211020054302-mutt-send-email-mst@kernel.org>
X-Mailer: Claws Mail 3.18.0 (GTK+ 2.24.33; x86_64-redhat-linux-gnu)
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
Cc: qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, 20 Oct 2021 05:45:03 -0400
"Michael S. Tsirkin" <mst@redhat.com> wrote:

> On Wed, Oct 20, 2021 at 11:05:21AM +0200, Igor Mammedov wrote:
> > On Tue, 19 Oct 2021 06:27:26 -0400
> > "Michael S. Tsirkin" <mst@redhat.com> wrote:
> >   
> > > On Tue, Oct 19, 2021 at 11:56:32AM +0200, Igor Mammedov wrote:  
> > > > On Mon, 18 Oct 2021 16:37:28 -0400
> > > > "Michael S. Tsirkin" <mst@redhat.com> wrote:
> > > >     
> > > > > On Thu, Sep 02, 2021 at 07:35:41AM -0400, Igor Mammedov wrote:    
> > > > > > Update adds CPU entries to MADT/SRAT/FACP and DSDT to cover 288 CPUs.
> > > > > > Notable changes are that CPUs with APIC ID 255 and higher
> > > > > > use 'Processor Local x2APIC Affinity' structure in SRAT and
> > > > > > "Device" element in DSDT.
> > > > > > 
> > > > > > FACP:
> > > > > > -                 Use APIC Cluster Model (V4) : 0
> > > > > > +                 Use APIC Cluster Model (V4) : 1
> > > > > > 
> > > > > > SRAT:
> > > > > > ...
> > > > > > +[1010h 4112   1]                Subtable Type : 00 [Processor Local APIC/SAPIC Affinity]
> > > > > > +[1011h 4113   1]                       Length : 10
> > > > > > +
> > > > > > +[1012h 4114   1]      Proximity Domain Low(8) : 00
> > > > > > +[1013h 4115   1]                      Apic ID : FE
> > > > > > +[1014h 4116   4]        Flags (decoded below) : 00000001
> > > > > > +                                     Enabled : 1
> > > > > > +[1018h 4120   1]              Local Sapic EID : 00
> > > > > > +[1019h 4121   3]    Proximity Domain High(24) : 000000
> > > > > > +[101Ch 4124   4]                 Clock Domain : 00000000
> > > > > > +
> > > > > > +[1020h 4128   1]                Subtable Type : 02 [Processor Local x2APIC Affinity]
> > > > > > +[1021h 4129   1]                       Length : 18
> > > > > > +
> > > > > > +[1022h 4130   2]                    Reserved1 : 0000
> > > > > > +[1024h 4132   4]             Proximity Domain : 00000001
> > > > > > +[1028h 4136   4]                      Apic ID : 000000FF
> > > > > > +[102Ch 4140   4]        Flags (decoded below) : 00000001
> > > > > > +                                     Enabled : 1
> > > > > > +[1030h 4144   4]                 Clock Domain : 00000000
> > > > > > +[1034h 4148   4]                    Reserved2 : 00000000
> > > > > > 
> > > > > > ...
> > > > > > 
> > > > > > +[1320h 4896   1]                Subtable Type : 02 [Processor Local x2APIC Affinity]
> > > > > > +[1321h 4897   1]                       Length : 18
> > > > > > +
> > > > > > +[1322h 4898   2]                    Reserved1 : 0000
> > > > > > +[1324h 4900   4]             Proximity Domain : 00000001
> > > > > > +[1328h 4904   4]                      Apic ID : 0000011F
> > > > > > +[132Ch 4908   4]        Flags (decoded below) : 00000001
> > > > > > +                                     Enabled : 1
> > > > > > +[1330h 4912   4]                 Clock Domain : 00000000
> > > > > > +[1334h 4916   4]                    Reserved2 : 00000000
> > > > > > 
> > > > > > DSDT:
> > > > > > 
> > > > > > ...
> > > > > > +            Processor (C0FE, 0xFE, 0x00000000, 0x00)
> > > > > > +            {
> > > > > > ...
> > > > > > +            }
> > > > > > +
> > > > > > +            Device (C0FF)
> > > > > > +            {
> > > > > > +                Name (_HID, "ACPI0007" /* Processor Device */)  // _HID: Hardware ID
> > > > > > +                Name (_UID, 0xFF)  // _UID: Unique ID
> > > > > > ...
> > > > > > +            }
> > > > > > 
> > > > > > +            Device (C11F)
> > > > > > +            {
> > > > > > +                Name (_HID, "ACPI0007" /* Processor Device */)  // _HID: Hardware ID
> > > > > > +                Name (_UID, 0x011F)  // _UID: Unique ID
> > > > > > ...
> > > > > > +            }
> > > > > > 
> > > > > > APIC:
> > > > > > +[034h 0052   1]                Subtable Type : 00 [Processor Local APIC]
> > > > > > +[035h 0053   1]                       Length : 08
> > > > > > +[036h 0054   1]                 Processor ID : 01
> > > > > > +[037h 0055   1]                Local Apic ID : 01
> > > > > > +[038h 0056   4]        Flags (decoded below) : 00000000
> > > > > > +                           Processor Enabled : 0
> > > > > > 
> > > > > > ...
> > > > > > 
> > > > > > +[81Ch 2076   1]                Subtable Type : 00 [Processor Local APIC]
> > > > > > +[81Dh 2077   1]                       Length : 08
> > > > > > +[81Eh 2078   1]                 Processor ID : FE
> > > > > > +[81Fh 2079   1]                Local Apic ID : FE
> > > > > > +[820h 2080   4]        Flags (decoded below) : 00000000
> > > > > > +                           Processor Enabled : 0
> > > > > > +
> > > > > > +[824h 2084   1]                Subtable Type : 09 [Processor Local x2APIC]
> > > > > > +[825h 2085   1]                       Length : 10
> > > > > > +[826h 2086   2]                     Reserved : 0000
> > > > > > +[828h 2088   4]          Processor x2Apic ID : 000000FF
> > > > > > +[82Ch 2092   4]        Flags (decoded below) : 00000000
> > > > > > +                           Processor Enabled : 0
> > > > > > +[830h 2096   4]                Processor UID : 000000FF
> > > > > > 
> > > > > > ...
> > > > > > 
> > > > > > +[A24h 2596   1]                Subtable Type : 09 [Processor Local x2APIC]
> > > > > > +[A25h 2597   1]                       Length : 10
> > > > > > +[A26h 2598   2]                     Reserved : 0000
> > > > > > +[A28h 2600   4]          Processor x2Apic ID : 0000011F
> > > > > > +[A2Ch 2604   4]        Flags (decoded below) : 00000000
> > > > > > +                           Processor Enabled : 0
> > > > > > +[A30h 2608   4]                Processor UID : 0000011F
> > > > > > +
> > > > > > +[A34h 2612   1]                Subtable Type : 01 [I/O APIC]
> > > > > > +[A35h 2613   1]                       Length : 0C
> > > > > > +[A36h 2614   1]                  I/O Apic ID : 00
> > > > > > +[A37h 2615   1]                     Reserved : 00
> > > > > > +[A38h 2616   4]                      Address : FEC00000
> > > > > > +[A3Ch 2620   4]                    Interrupt : 00000000
> > > > > > +
> > > > > > +[A40h 2624   1]                Subtable Type : 02 [Interrupt Source Override]
> > > > > > +[A41h 2625   1]                       Length : 0A
> > > > > > +[A42h 2626   1]                          Bus : 00
> > > > > > +[A43h 2627   1]                       Source : 00
> > > > > > +[A44h 2628   4]                    Interrupt : 00000002
> > > > > > +[A48h 2632   2]        Flags (decoded below) : 0000
> > > > > >                                      Polarity : 0
> > > > > >                                  Trigger Mode : 0
> > > > > > 
> > > > > > -[04Ah 0074   1]                Subtable Type : 02 [Interrupt Source Override]
> > > > > > -[04Bh 0075   1]                       Length : 0A
> > > > > > -[04Ch 0076   1]                          Bus : 00
> > > > > > -[04Dh 0077   1]                       Source : 05
> > > > > > -[04Eh 0078   4]                    Interrupt : 00000005
> > > > > > -[052h 0082   2]        Flags (decoded below) : 000D
> > > > > > +[A4Ah 2634   1]                Subtable Type : 02 [Interrupt Source Override]
> > > > > > +[A4Bh 2635   1]                       Length : 0A
> > > > > > +[A4Ch 2636   1]                          Bus : 00
> > > > > > +[A4Dh 2637   1]                       Source : 05
> > > > > > +[A4Eh 2638   4]                    Interrupt : 00000005
> > > > > > +[A52h 2642   2]        Flags (decoded below) : 000D
> > > > > >                                      Polarity : 1
> > > > > >                                  Trigger Mode : 3
> > > > > > 
> > > > > > -[054h 0084   1]                Subtable Type : 02 [Interrupt Source Override]
> > > > > > -[055h 0085   1]                       Length : 0A
> > > > > > -[056h 0086   1]                          Bus : 00
> > > > > > -[057h 0087   1]                       Source : 09
> > > > > > -[058h 0088   4]                    Interrupt : 00000009
> > > > > > -[05Ch 0092   2]        Flags (decoded below) : 000D
> > > > > > +[A54h 2644   1]                Subtable Type : 02 [Interrupt Source Override]
> > > > > > +[A55h 2645   1]                       Length : 0A
> > > > > > +[A56h 2646   1]                          Bus : 00
> > > > > > +[A57h 2647   1]                       Source : 09
> > > > > > +[A58h 2648   4]                    Interrupt : 00000009
> > > > > > +[A5Ch 2652   2]        Flags (decoded below) : 000D
> > > > > >                                      Polarity : 1
> > > > > >                                  Trigger Mode : 3
> > > > > > 
> > > > > > -[05Eh 0094   1]                Subtable Type : 02 [Interrupt Source Override]
> > > > > > -[05Fh 0095   1]                       Length : 0A
> > > > > > -[060h 0096   1]                          Bus : 00
> > > > > > -[061h 0097   1]                       Source : 0A
> > > > > > -[062h 0098   4]                    Interrupt : 0000000A
> > > > > > -[066h 0102   2]        Flags (decoded below) : 000D
> > > > > > +[A5Eh 2654   1]                Subtable Type : 02 [Interrupt Source Override]
> > > > > > +[A5Fh 2655   1]                       Length : 0A
> > > > > > +[A60h 2656   1]                          Bus : 00
> > > > > > +[A61h 2657   1]                       Source : 0A
> > > > > > +[A62h 2658   4]                    Interrupt : 0000000A
> > > > > > +[A66h 2662   2]        Flags (decoded below) : 000D
> > > > > >                                      Polarity : 1
> > > > > >                                  Trigger Mode : 3
> > > > > > 
> > > > > > -[068h 0104   1]                Subtable Type : 02 [Interrupt Source Override]
> > > > > > -[069h 0105   1]                       Length : 0A
> > > > > > -[06Ah 0106   1]                          Bus : 00
> > > > > > -[06Bh 0107   1]                       Source : 0B
> > > > > > -[06Ch 0108   4]                    Interrupt : 0000000B
> > > > > > -[070h 0112   2]        Flags (decoded below) : 000D
> > > > > > +[A68h 2664   1]                Subtable Type : 02 [Interrupt Source Override]
> > > > > > +[A69h 2665   1]                       Length : 0A
> > > > > > +[A6Ah 2666   1]                          Bus : 00
> > > > > > +[A6Bh 2667   1]                       Source : 0B
> > > > > > +[A6Ch 2668   4]                    Interrupt : 0000000B
> > > > > > +[A70h 2672   2]        Flags (decoded below) : 000D
> > > > > >                                      Polarity : 1
> > > > > >                                  Trigger Mode : 3
> > > > > > 
> > > > > > -[072h 0114   1]                Subtable Type : 04 [Local APIC NMI]
> > > > > > -[073h 0115   1]                       Length : 06
> > > > > > -[074h 0116   1]                 Processor ID : FF
> > > > > > -[075h 0117   2]        Flags (decoded below) : 0000
> > > > > > +[A72h 2674   1]                Subtable Type : 0A [Local x2APIC NMI]
> > > > > > +[A73h 2675   1]                       Length : 0C
> > > > > > +[A74h 2676   2]        Flags (decoded below) : 0000
> > > > > >                                      Polarity : 0
> > > > > >                                  Trigger Mode : 0
> > > > > > -[077h 0119   1]         Interrupt Input LINT : 01
> > > > > > +[A76h 2678   4]                Processor UID : FFFFFFFF
> > > > > > +[A7Ah 2682   1]         Interrupt Input LINT : 01
> > > > > > +[A7Bh 2683   3]                     Reserved : 000000
> > > > > > 
> > > > > > Signed-off-by: Igor Mammedov <imammedo@redhat.com>
> > > > > > ---
> > > > > > v2:
> > > > > >   - rebase on top of ACPI PCI hotplug changes
> > > > > > ---
> > > > > >  tests/qtest/bios-tables-test-allowed-diff.h |   4 ----
> > > > > >  tests/data/acpi/q35/APIC.xapic              | Bin 0 -> 2686 bytes
> > > > > >  tests/data/acpi/q35/DSDT.xapic              | Bin 0 -> 35652 bytes
> > > > > >  tests/data/acpi/q35/FACP.xapic              | Bin 0 -> 244 bytes
> > > > > >  tests/data/acpi/q35/SRAT.xapic              | Bin 0 -> 5080 bytes
> > > > > >  5 files changed, 4 deletions(-)
> > > > > >  create mode 100644 tests/data/acpi/q35/APIC.xapic
> > > > > >  create mode 100644 tests/data/acpi/q35/FACP.xapic
> > > > > > 
> > > > > > diff --git a/tests/qtest/bios-tables-test-allowed-diff.h b/tests/qtest/bios-tables-test-allowed-diff.h
> > > > > > index c79ff104fb..dfb8523c8b 100644
> > > > > > --- a/tests/qtest/bios-tables-test-allowed-diff.h
> > > > > > +++ b/tests/qtest/bios-tables-test-allowed-diff.h
> > > > > > @@ -1,5 +1 @@
> > > > > >  /* List of comma-separated changed AML files to ignore */
> > > > > > -"tests/data/acpi/q35/DSDT.xapic",
> > > > > > -"tests/data/acpi/q35/SRAT.xapic",
> > > > > > -"tests/data/acpi/q35/FACP",
> > > > > > -"tests/data/acpi/q35/APIC",      
> > > > >     
> > > >     
> > > > > This should have just allowed changes to FACP.xapic and APIC.xapic    
> > > > Probably, I don't recall why I did this.
> > > > Maybe I wanted to get diff for this tables vs baseline as opposed to whole new table.    
> > > 
> > > You can softlink the table to expected if you want this.  
> > 
> > that would make git copy/commit link's content  
> 
> Are you sure? Git has a special object type for symlinks ...

It used to be that way is I'm not mistaken,
it might work now. Regardless, I'd avoid that as it is
likely not portable (thinking Windows).

> 
> > (unless it's done temporary to just generate diff,
> > but then there might be a question why it's not full
> > table diff as it's committed)
> > 
> > Using suffixless baseline here is fine
> > what rises questions is that .xapic is used only for some files,
> > and I don't recall why I wrote it this way anymore.
> > 
> > 
> >   
> > > > Shall I respin?  
> 


