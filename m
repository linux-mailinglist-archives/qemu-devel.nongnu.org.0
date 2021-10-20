Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7EA7B43483A
	for <lists+qemu-devel@lfdr.de>; Wed, 20 Oct 2021 11:47:50 +0200 (CEST)
Received: from localhost ([::1]:53892 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1md8CL-0006Wq-JU
	for lists+qemu-devel@lfdr.de; Wed, 20 Oct 2021 05:47:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38994)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1md89o-00059v-Nn
 for qemu-devel@nongnu.org; Wed, 20 Oct 2021 05:45:13 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:28056)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1md89m-0007so-Mu
 for qemu-devel@nongnu.org; Wed, 20 Oct 2021 05:45:12 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1634723110;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=0L+Fu1EMYMFzhSsq6MC1fQ6pBSDOKUps0Cz8/waJPdA=;
 b=Xdv9vGA0sh1JckFWQky7i1VqkMVq/tikV7mSZLS001Dwu5Vhr4rArqa/pAoZ+JQsRywuRb
 ICj1ZXMtoDubPF6RMSKx4MqyWnXNzmxCfKHnXHo/IEge4bW6cf+iGPQagQM9dvL8D/maqi
 GI2/+kGhEAXfF3FUwaFCqXPaUGghIwI=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-324-hC6cBm2rOYSmwRa0vP1azQ-1; Wed, 20 Oct 2021 05:45:08 -0400
X-MC-Unique: hC6cBm2rOYSmwRa0vP1azQ-1
Received: by mail-ed1-f72.google.com with SMTP id
 s12-20020a50dacc000000b003dbf7a78e88so17407824edj.2
 for <qemu-devel@nongnu.org>; Wed, 20 Oct 2021 02:45:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=0L+Fu1EMYMFzhSsq6MC1fQ6pBSDOKUps0Cz8/waJPdA=;
 b=OGK/AZzCDx61vkPie2G3ckJnXolAedek/6X+tJzax66MBVkggV0b3rwJlV0kMBWxW9
 ggYzF6ctgL239Phl0/BdNkFwgNgQx7Hp126ElACIEmwjSPPe62iQQYzvH8wKeH31fTZr
 PtAP4wKM/ftKHb/XGajlinqZzktaKqO+evE4WJ9cJZaDEZ+NkbMhJLwoJWT5B8AyyiPg
 Z4G2RVo7l4+8UyVlQnI3n8E7e5dRygySVygeflK4QXNCYF04OYOa1A/wqVsYX/Fq4AsK
 bJD7AZuMn98hSwIuDXrs4UON8TXLtvuR6eIltz+T4MWaSfVTGWU4WusDS5ACHyIGDrlG
 5F+Q==
X-Gm-Message-State: AOAM532rVMw54glBJlOqETQ7JDOhagw4TaMBzbcA487pgqkHhMyDjiMa
 W6hL80ZITmJjKhTTjY8SVNvVdzuP7ksul+EaoXizN04dhYMvLwtfIOZsrObr9chpzELvCGT/OHk
 hKkcVSxmLbQfWRMo=
X-Received: by 2002:a05:6402:42cd:: with SMTP id
 i13mr61054156edc.396.1634723107102; 
 Wed, 20 Oct 2021 02:45:07 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxdBZvMGlfZOMfqlqzWvZkUoFCDW7H+nfXueh84JmWSYh29xPPyt89QAOYgAvUUWTI9mwTf+g==
X-Received: by 2002:a05:6402:42cd:: with SMTP id
 i13mr61054126edc.396.1634723106805; 
 Wed, 20 Oct 2021 02:45:06 -0700 (PDT)
Received: from redhat.com ([2.55.24.172])
 by smtp.gmail.com with ESMTPSA id ke24sm747483ejc.73.2021.10.20.02.45.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 20 Oct 2021 02:45:06 -0700 (PDT)
Date: Wed, 20 Oct 2021 05:45:03 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Igor Mammedov <imammedo@redhat.com>
Subject: Re: [PATCH v2 05/15] tests: acpi: update expected tables blobs
Message-ID: <20211020054302-mutt-send-email-mst@kernel.org>
References: <20210902113551.461632-1-imammedo@redhat.com>
 <20210902113551.461632-6-imammedo@redhat.com>
 <20211018163459-mutt-send-email-mst@kernel.org>
 <20211019115632.283aabe0@redhat.com>
 <20211019062402-mutt-send-email-mst@kernel.org>
 <20211020110521.5d4ba9e0@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20211020110521.5d4ba9e0@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mst@redhat.com;
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

On Wed, Oct 20, 2021 at 11:05:21AM +0200, Igor Mammedov wrote:
> On Tue, 19 Oct 2021 06:27:26 -0400
> "Michael S. Tsirkin" <mst@redhat.com> wrote:
> 
> > On Tue, Oct 19, 2021 at 11:56:32AM +0200, Igor Mammedov wrote:
> > > On Mon, 18 Oct 2021 16:37:28 -0400
> > > "Michael S. Tsirkin" <mst@redhat.com> wrote:
> > >   
> > > > On Thu, Sep 02, 2021 at 07:35:41AM -0400, Igor Mammedov wrote:  
> > > > > Update adds CPU entries to MADT/SRAT/FACP and DSDT to cover 288 CPUs.
> > > > > Notable changes are that CPUs with APIC ID 255 and higher
> > > > > use 'Processor Local x2APIC Affinity' structure in SRAT and
> > > > > "Device" element in DSDT.
> > > > > 
> > > > > FACP:
> > > > > -                 Use APIC Cluster Model (V4) : 0
> > > > > +                 Use APIC Cluster Model (V4) : 1
> > > > > 
> > > > > SRAT:
> > > > > ...
> > > > > +[1010h 4112   1]                Subtable Type : 00 [Processor Local APIC/SAPIC Affinity]
> > > > > +[1011h 4113   1]                       Length : 10
> > > > > +
> > > > > +[1012h 4114   1]      Proximity Domain Low(8) : 00
> > > > > +[1013h 4115   1]                      Apic ID : FE
> > > > > +[1014h 4116   4]        Flags (decoded below) : 00000001
> > > > > +                                     Enabled : 1
> > > > > +[1018h 4120   1]              Local Sapic EID : 00
> > > > > +[1019h 4121   3]    Proximity Domain High(24) : 000000
> > > > > +[101Ch 4124   4]                 Clock Domain : 00000000
> > > > > +
> > > > > +[1020h 4128   1]                Subtable Type : 02 [Processor Local x2APIC Affinity]
> > > > > +[1021h 4129   1]                       Length : 18
> > > > > +
> > > > > +[1022h 4130   2]                    Reserved1 : 0000
> > > > > +[1024h 4132   4]             Proximity Domain : 00000001
> > > > > +[1028h 4136   4]                      Apic ID : 000000FF
> > > > > +[102Ch 4140   4]        Flags (decoded below) : 00000001
> > > > > +                                     Enabled : 1
> > > > > +[1030h 4144   4]                 Clock Domain : 00000000
> > > > > +[1034h 4148   4]                    Reserved2 : 00000000
> > > > > 
> > > > > ...
> > > > > 
> > > > > +[1320h 4896   1]                Subtable Type : 02 [Processor Local x2APIC Affinity]
> > > > > +[1321h 4897   1]                       Length : 18
> > > > > +
> > > > > +[1322h 4898   2]                    Reserved1 : 0000
> > > > > +[1324h 4900   4]             Proximity Domain : 00000001
> > > > > +[1328h 4904   4]                      Apic ID : 0000011F
> > > > > +[132Ch 4908   4]        Flags (decoded below) : 00000001
> > > > > +                                     Enabled : 1
> > > > > +[1330h 4912   4]                 Clock Domain : 00000000
> > > > > +[1334h 4916   4]                    Reserved2 : 00000000
> > > > > 
> > > > > DSDT:
> > > > > 
> > > > > ...
> > > > > +            Processor (C0FE, 0xFE, 0x00000000, 0x00)
> > > > > +            {
> > > > > ...
> > > > > +            }
> > > > > +
> > > > > +            Device (C0FF)
> > > > > +            {
> > > > > +                Name (_HID, "ACPI0007" /* Processor Device */)  // _HID: Hardware ID
> > > > > +                Name (_UID, 0xFF)  // _UID: Unique ID
> > > > > ...
> > > > > +            }
> > > > > 
> > > > > +            Device (C11F)
> > > > > +            {
> > > > > +                Name (_HID, "ACPI0007" /* Processor Device */)  // _HID: Hardware ID
> > > > > +                Name (_UID, 0x011F)  // _UID: Unique ID
> > > > > ...
> > > > > +            }
> > > > > 
> > > > > APIC:
> > > > > +[034h 0052   1]                Subtable Type : 00 [Processor Local APIC]
> > > > > +[035h 0053   1]                       Length : 08
> > > > > +[036h 0054   1]                 Processor ID : 01
> > > > > +[037h 0055   1]                Local Apic ID : 01
> > > > > +[038h 0056   4]        Flags (decoded below) : 00000000
> > > > > +                           Processor Enabled : 0
> > > > > 
> > > > > ...
> > > > > 
> > > > > +[81Ch 2076   1]                Subtable Type : 00 [Processor Local APIC]
> > > > > +[81Dh 2077   1]                       Length : 08
> > > > > +[81Eh 2078   1]                 Processor ID : FE
> > > > > +[81Fh 2079   1]                Local Apic ID : FE
> > > > > +[820h 2080   4]        Flags (decoded below) : 00000000
> > > > > +                           Processor Enabled : 0
> > > > > +
> > > > > +[824h 2084   1]                Subtable Type : 09 [Processor Local x2APIC]
> > > > > +[825h 2085   1]                       Length : 10
> > > > > +[826h 2086   2]                     Reserved : 0000
> > > > > +[828h 2088   4]          Processor x2Apic ID : 000000FF
> > > > > +[82Ch 2092   4]        Flags (decoded below) : 00000000
> > > > > +                           Processor Enabled : 0
> > > > > +[830h 2096   4]                Processor UID : 000000FF
> > > > > 
> > > > > ...
> > > > > 
> > > > > +[A24h 2596   1]                Subtable Type : 09 [Processor Local x2APIC]
> > > > > +[A25h 2597   1]                       Length : 10
> > > > > +[A26h 2598   2]                     Reserved : 0000
> > > > > +[A28h 2600   4]          Processor x2Apic ID : 0000011F
> > > > > +[A2Ch 2604   4]        Flags (decoded below) : 00000000
> > > > > +                           Processor Enabled : 0
> > > > > +[A30h 2608   4]                Processor UID : 0000011F
> > > > > +
> > > > > +[A34h 2612   1]                Subtable Type : 01 [I/O APIC]
> > > > > +[A35h 2613   1]                       Length : 0C
> > > > > +[A36h 2614   1]                  I/O Apic ID : 00
> > > > > +[A37h 2615   1]                     Reserved : 00
> > > > > +[A38h 2616   4]                      Address : FEC00000
> > > > > +[A3Ch 2620   4]                    Interrupt : 00000000
> > > > > +
> > > > > +[A40h 2624   1]                Subtable Type : 02 [Interrupt Source Override]
> > > > > +[A41h 2625   1]                       Length : 0A
> > > > > +[A42h 2626   1]                          Bus : 00
> > > > > +[A43h 2627   1]                       Source : 00
> > > > > +[A44h 2628   4]                    Interrupt : 00000002
> > > > > +[A48h 2632   2]        Flags (decoded below) : 0000
> > > > >                                      Polarity : 0
> > > > >                                  Trigger Mode : 0
> > > > > 
> > > > > -[04Ah 0074   1]                Subtable Type : 02 [Interrupt Source Override]
> > > > > -[04Bh 0075   1]                       Length : 0A
> > > > > -[04Ch 0076   1]                          Bus : 00
> > > > > -[04Dh 0077   1]                       Source : 05
> > > > > -[04Eh 0078   4]                    Interrupt : 00000005
> > > > > -[052h 0082   2]        Flags (decoded below) : 000D
> > > > > +[A4Ah 2634   1]                Subtable Type : 02 [Interrupt Source Override]
> > > > > +[A4Bh 2635   1]                       Length : 0A
> > > > > +[A4Ch 2636   1]                          Bus : 00
> > > > > +[A4Dh 2637   1]                       Source : 05
> > > > > +[A4Eh 2638   4]                    Interrupt : 00000005
> > > > > +[A52h 2642   2]        Flags (decoded below) : 000D
> > > > >                                      Polarity : 1
> > > > >                                  Trigger Mode : 3
> > > > > 
> > > > > -[054h 0084   1]                Subtable Type : 02 [Interrupt Source Override]
> > > > > -[055h 0085   1]                       Length : 0A
> > > > > -[056h 0086   1]                          Bus : 00
> > > > > -[057h 0087   1]                       Source : 09
> > > > > -[058h 0088   4]                    Interrupt : 00000009
> > > > > -[05Ch 0092   2]        Flags (decoded below) : 000D
> > > > > +[A54h 2644   1]                Subtable Type : 02 [Interrupt Source Override]
> > > > > +[A55h 2645   1]                       Length : 0A
> > > > > +[A56h 2646   1]                          Bus : 00
> > > > > +[A57h 2647   1]                       Source : 09
> > > > > +[A58h 2648   4]                    Interrupt : 00000009
> > > > > +[A5Ch 2652   2]        Flags (decoded below) : 000D
> > > > >                                      Polarity : 1
> > > > >                                  Trigger Mode : 3
> > > > > 
> > > > > -[05Eh 0094   1]                Subtable Type : 02 [Interrupt Source Override]
> > > > > -[05Fh 0095   1]                       Length : 0A
> > > > > -[060h 0096   1]                          Bus : 00
> > > > > -[061h 0097   1]                       Source : 0A
> > > > > -[062h 0098   4]                    Interrupt : 0000000A
> > > > > -[066h 0102   2]        Flags (decoded below) : 000D
> > > > > +[A5Eh 2654   1]                Subtable Type : 02 [Interrupt Source Override]
> > > > > +[A5Fh 2655   1]                       Length : 0A
> > > > > +[A60h 2656   1]                          Bus : 00
> > > > > +[A61h 2657   1]                       Source : 0A
> > > > > +[A62h 2658   4]                    Interrupt : 0000000A
> > > > > +[A66h 2662   2]        Flags (decoded below) : 000D
> > > > >                                      Polarity : 1
> > > > >                                  Trigger Mode : 3
> > > > > 
> > > > > -[068h 0104   1]                Subtable Type : 02 [Interrupt Source Override]
> > > > > -[069h 0105   1]                       Length : 0A
> > > > > -[06Ah 0106   1]                          Bus : 00
> > > > > -[06Bh 0107   1]                       Source : 0B
> > > > > -[06Ch 0108   4]                    Interrupt : 0000000B
> > > > > -[070h 0112   2]        Flags (decoded below) : 000D
> > > > > +[A68h 2664   1]                Subtable Type : 02 [Interrupt Source Override]
> > > > > +[A69h 2665   1]                       Length : 0A
> > > > > +[A6Ah 2666   1]                          Bus : 00
> > > > > +[A6Bh 2667   1]                       Source : 0B
> > > > > +[A6Ch 2668   4]                    Interrupt : 0000000B
> > > > > +[A70h 2672   2]        Flags (decoded below) : 000D
> > > > >                                      Polarity : 1
> > > > >                                  Trigger Mode : 3
> > > > > 
> > > > > -[072h 0114   1]                Subtable Type : 04 [Local APIC NMI]
> > > > > -[073h 0115   1]                       Length : 06
> > > > > -[074h 0116   1]                 Processor ID : FF
> > > > > -[075h 0117   2]        Flags (decoded below) : 0000
> > > > > +[A72h 2674   1]                Subtable Type : 0A [Local x2APIC NMI]
> > > > > +[A73h 2675   1]                       Length : 0C
> > > > > +[A74h 2676   2]        Flags (decoded below) : 0000
> > > > >                                      Polarity : 0
> > > > >                                  Trigger Mode : 0
> > > > > -[077h 0119   1]         Interrupt Input LINT : 01
> > > > > +[A76h 2678   4]                Processor UID : FFFFFFFF
> > > > > +[A7Ah 2682   1]         Interrupt Input LINT : 01
> > > > > +[A7Bh 2683   3]                     Reserved : 000000
> > > > > 
> > > > > Signed-off-by: Igor Mammedov <imammedo@redhat.com>
> > > > > ---
> > > > > v2:
> > > > >   - rebase on top of ACPI PCI hotplug changes
> > > > > ---
> > > > >  tests/qtest/bios-tables-test-allowed-diff.h |   4 ----
> > > > >  tests/data/acpi/q35/APIC.xapic              | Bin 0 -> 2686 bytes
> > > > >  tests/data/acpi/q35/DSDT.xapic              | Bin 0 -> 35652 bytes
> > > > >  tests/data/acpi/q35/FACP.xapic              | Bin 0 -> 244 bytes
> > > > >  tests/data/acpi/q35/SRAT.xapic              | Bin 0 -> 5080 bytes
> > > > >  5 files changed, 4 deletions(-)
> > > > >  create mode 100644 tests/data/acpi/q35/APIC.xapic
> > > > >  create mode 100644 tests/data/acpi/q35/FACP.xapic
> > > > > 
> > > > > diff --git a/tests/qtest/bios-tables-test-allowed-diff.h b/tests/qtest/bios-tables-test-allowed-diff.h
> > > > > index c79ff104fb..dfb8523c8b 100644
> > > > > --- a/tests/qtest/bios-tables-test-allowed-diff.h
> > > > > +++ b/tests/qtest/bios-tables-test-allowed-diff.h
> > > > > @@ -1,5 +1 @@
> > > > >  /* List of comma-separated changed AML files to ignore */
> > > > > -"tests/data/acpi/q35/DSDT.xapic",
> > > > > -"tests/data/acpi/q35/SRAT.xapic",
> > > > > -"tests/data/acpi/q35/FACP",
> > > > > -"tests/data/acpi/q35/APIC",    
> > > >   
> > >   
> > > > This should have just allowed changes to FACP.xapic and APIC.xapic  
> > > Probably, I don't recall why I did this.
> > > Maybe I wanted to get diff for this tables vs baseline as opposed to whole new table.  
> > 
> > You can softlink the table to expected if you want this.
> 
> that would make git copy/commit link's content

Are you sure? Git has a special object type for symlinks ...

> (unless it's done temporary to just generate diff,
> but then there might be a question why it's not full
> table diff as it's committed)
> 
> Using suffixless baseline here is fine
> what rises questions is that .xapic is used only for some files,
> and I don't recall why I wrote it this way anymore.
> 
> 
> 
> > > Shall I respin?


