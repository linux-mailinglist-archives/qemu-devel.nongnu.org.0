Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 868F72F4CAE
	for <lists+qemu-devel@lfdr.de>; Wed, 13 Jan 2021 15:04:13 +0100 (CET)
Received: from localhost ([::1]:60566 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kzgku-0001Ak-Iq
	for lists+qemu-devel@lfdr.de; Wed, 13 Jan 2021 09:04:12 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:47148)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1kzghR-0000DQ-JI
 for qemu-devel@nongnu.org; Wed, 13 Jan 2021 09:00:38 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:37190)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1kzghF-00014J-Fu
 for qemu-devel@nongnu.org; Wed, 13 Jan 2021 09:00:37 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1610546423;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=FmHjYNoeL6FAkZr0wDvWaFjSl3LrwYREuzXpaMWgWgk=;
 b=SDwS+/6SnBqnvQyRUuLJeHuG8q1jDlBRyu047/vjAWViOUeKxWEhhdLozPTbQqXbohJ3KE
 T/3PhgTdQAP7Kz8LAJGxfoNzZxOK5eqPGCKWkkewERLL0+777hpV9ywv2OOe/4kFP4fvUJ
 QOIFOccm5QU2dy7eeM7r0o2RyiI4cEQ=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-379-8YTa8EJ2OW6V-ZQch6O3Rw-1; Wed, 13 Jan 2021 09:00:19 -0500
X-MC-Unique: 8YTa8EJ2OW6V-ZQch6O3Rw-1
Received: by mail-wm1-f70.google.com with SMTP id z188so1669084wme.1
 for <qemu-devel@nongnu.org>; Wed, 13 Jan 2021 06:00:19 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=FmHjYNoeL6FAkZr0wDvWaFjSl3LrwYREuzXpaMWgWgk=;
 b=hjPuakD1+2jKnJzkxBGAQiRNGm5IzU9HjAXbWfkxQD8GZB7de4bGIpB9J1EHFGJmlD
 JSKDZ1+o7nvi4kClJF8D7RV3W16ovLHxe1bZyU6BVhDPAFUqagwuvslPeVnKHe8uS2hP
 m/raOPYHBzsYFmsSry1sqGSQG6X5dqcqrtDfc3kXpEe9SS8gS7wmXh/cbXajOQX7Pq/o
 RyEJhtRnmq2EcCni9I0rG8Qy8JSqhyGk/TTkRmraEeFPerM4Dh6qYO9UqSabgeaPxz9a
 M2Xzxwvq5qzeOnnr9O396P2pWQ6r2d6drylCrLJbTenzXPbtWI974nqj7ls+LYaRDgZr
 BIKQ==
X-Gm-Message-State: AOAM530i4CEAtZoobKZuZik/RQC2p61Q3O5lwDSDfm18MuvoLdFz+Xk5
 i5LwEUzYQGlQ36FcDp0QrL+pc5hKqzvFy7YGhxfiZeNy8lqdc4sfG7BOqC8LPzUEma8cwlg1w3P
 unHqozLsoJm5slFc=
X-Received: by 2002:adf:f6c9:: with SMTP id y9mr2792196wrp.121.1610546418721; 
 Wed, 13 Jan 2021 06:00:18 -0800 (PST)
X-Google-Smtp-Source: ABdhPJw0ESywUuNiUcbDK6nWat6FVzQWCwBDAQbq+g/1qLpA4yefBtS5Rls1tJXI19EEsEHIgQ1/6w==
X-Received: by 2002:adf:f6c9:: with SMTP id y9mr2792172wrp.121.1610546418522; 
 Wed, 13 Jan 2021 06:00:18 -0800 (PST)
Received: from redhat.com (bzq-79-178-32-166.red.bezeqint.net. [79.178.32.166])
 by smtp.gmail.com with ESMTPSA id a8sm2542086wmd.6.2021.01.13.06.00.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 13 Jan 2021 06:00:17 -0800 (PST)
Date: Wed, 13 Jan 2021 09:00:13 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Jiahui Cen <cenjiahui@huawei.com>
Subject: Re: [PATCH v4 2/8] acpi: Fix unmatched expected DSDT.pxb file
Message-ID: <20210113085942-mutt-send-email-mst@kernel.org>
References: <20210107114043.9624-1-cenjiahui@huawei.com>
 <20210107114043.9624-3-cenjiahui@huawei.com>
MIME-Version: 1.0
In-Reply-To: <20210107114043.9624-3-cenjiahui@huawei.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.25,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: xieyingtai@huawei.com, Eduardo Habkost <ehabkost@redhat.com>,
 Ard Biesheuvel <ard.biesheuvel@arm.com>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>, Igor Mammedov <imammedo@redhat.com>,
 Laszlo Ersek <lersek@redhat.com>, wu.wubin@huawei.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Jan 07, 2021 at 07:40:37PM +0800, Jiahui Cen wrote:
> Commit fe1127da11 ("unit-test: Add the binary file and clear diff.h") does not
> use the up-to-date expected file for pxb for ARM virt.
> 
> Fix the expected DSDT.pxb file.
> 
> Full diff of changed file disassembly:
> 
> diff -ru /tmp/old/tests/data/acpi/virt/DSDT.pxb.dsl /tmp/new/tests/data/acpi/virt/DSDT.pxb.dsl
> --- /tmp/old/tests/data/acpi/virt/DSDT.pxb.dsl  2021-01-07 17:04:51.246831080 +0800

This --- sign confuses git am. You shouldn't put this in the commit log
really ...


> +++ /tmp/new/tests/data/acpi/virt/DSDT.pxb.dsl  2021-01-07 17:11:59.566831080 +0800
> @@ -9,9 +9,9 @@
>   *
>   * Original Table Header:
>   *     Signature        "DSDT"
> - *     Length           0x00001E7A (7802)
> + *     Length           0x00001DF9 (7673)
>   *     Revision         0x02
> - *     Checksum         0x57
> + *     Checksum         0x42
>   *     OEM ID           "BOCHS "
>   *     OEM Table ID     "BXPCDSDT"
>   *     OEM Revision     0x00000001 (1)
> @@ -45,32 +45,6 @@
>              })
>          }
> 
> -        Device (FLS0)
> -        {
> -            Name (_HID, "LNRO0015")  // _HID: Hardware ID
> -            Name (_UID, Zero)  // _UID: Unique ID
> -            Name (_CRS, ResourceTemplate ()  // _CRS: Current Resource Settings
> -            {
> -                Memory32Fixed (ReadWrite,
> -                    0x00000000,         // Address Base
> -                    0x04000000,         // Address Length
> -                    )
> -            })
> -        }
> -
> -        Device (FLS1)
> -        {
> -            Name (_HID, "LNRO0015")  // _HID: Hardware ID
> -            Name (_UID, One)  // _UID: Unique ID
> -            Name (_CRS, ResourceTemplate ()  // _CRS: Current Resource Settings
> -            {
> -                Memory32Fixed (ReadWrite,
> -                    0x04000000,         // Address Base
> -                    0x04000000,         // Address Length
> -                    )
> -            })
> -        }
> -
>          Device (FWCF)
>          {
>              Name (_HID, "QEMU0002")  // _HID: Hardware ID
> @@ -665,9 +639,6 @@
>          {
>              Name (_HID, "PNP0A08" /* PCI Express Bus */)  // _HID: Hardware ID
>              Name (_CID, "PNP0A03" /* PCI Bus */)  // _CID: Compatible ID
> -            Name (_ADR, Zero)  // _ADR: Address
> -            Name (_CCA, One)  // _CCA: Cache Coherency Attribute
> -            Name (_SEG, Zero)  // _SEG: PCI Segment
>              Name (_BBN, 0x80)  // _BBN: BIOS Bus Number
>              Name (_UID, 0x80)  // _UID: Unique ID
>              Name (_STR, Unicode ("pxb Device"))  // _STR: Description String
> @@ -1857,7 +1828,7 @@
>              Name (_CID, "PNP0A03" /* PCI Bus */)  // _CID: Compatible ID
>              Name (_SEG, Zero)  // _SEG: PCI Segment
>              Name (_BBN, Zero)  // _BBN: BIOS Bus Number
> -            Name (_UID, "PCI0")  // _UID: Unique ID
> +            Name (_UID, Zero)  // _UID: Unique ID
>              Name (_STR, Unicode ("PCIe 0 Device"))  // _STR: Description String
>              Name (_CCA, One)  // _CCA: Cache Coherency Attribute
>              Name (_PRT, Package (0x80)  // _PRT: PCI Routing Table
> @@ -2983,41 +2954,37 @@
>                  Return (0x0000004010000000)
>              }
> 
> -            Method (_CRS, 0, NotSerialized)  // _CRS: Current Resource Settings
> +            Name (_CRS, ResourceTemplate ()  // _CRS: Current Resource Settings
>              {
> -                Return (ResourceTemplate ()
> -                {
> -                    WordBusNumber (ResourceProducer, MinFixed, MaxFixed, PosDecode,
> -                        0x0000,             // Granularity
> -                        0x0000,             // Range Minimum
> -                        0x007F,             // Range Maximum
> -                        0x0000,             // Translation Offset
> -                        0x0080,             // Length
> -                        ,, )
> -                    DWordMemory (ResourceProducer, PosDecode, MinFixed, MaxFixed, NonCacheable, ReadWrite,
> -                        0x00000000,         // Granularity
> -                        0x10000000,         // Range Minimum
> -                        0x3EFEFFFF,         // Range Maximum
> -                        0x00000000,         // Translation Offset
> -                        0x2EFF0000,         // Length
> -                        ,, , AddressRangeMemory, TypeStatic)
> -                    DWordIO (ResourceProducer, MinFixed, MaxFixed, PosDecode, EntireRange,
> -                        0x00000000,         // Granularity
> -                        0x00000000,         // Range Minimum
> -                        0x0000FFFF,         // Range Maximum
> -                        0x3EFF0000,         // Translation Offset
> -                        0x00010000,         // Length
> -                        ,, , TypeStatic, DenseTranslation)
> -                    QWordMemory (ResourceProducer, PosDecode, MinFixed, MaxFixed, NonCacheable, ReadWrite,
> -                        0x0000000000000000, // Granularity
> -                        0x0000008000000000, // Range Minimum
> -                        0x000000FFFFFFFFFF, // Range Maximum
> -                        0x0000000000000000, // Translation Offset
> -                        0x0000008000000000, // Length
> -                        ,, , AddressRangeMemory, TypeStatic)
> -                })
> -            }
> -
> +                WordBusNumber (ResourceProducer, MinFixed, MaxFixed, PosDecode,
> +                    0x0000,             // Granularity
> +                    0x0000,             // Range Minimum
> +                    0x007F,             // Range Maximum
> +                    0x0000,             // Translation Offset
> +                    0x0080,             // Length
> +                    ,, )
> +                DWordMemory (ResourceProducer, PosDecode, MinFixed, MaxFixed, NonCacheable, ReadWrite,
> +                    0x00000000,         // Granularity
> +                    0x10000000,         // Range Minimum
> +                    0x3EFEFFFF,         // Range Maximum
> +                    0x00000000,         // Translation Offset
> +                    0x2EFF0000,         // Length
> +                    ,, , AddressRangeMemory, TypeStatic)
> +                DWordIO (ResourceProducer, MinFixed, MaxFixed, PosDecode, EntireRange,
> +                    0x00000000,         // Granularity
> +                    0x00000000,         // Range Minimum
> +                    0x0000FFFF,         // Range Maximum
> +                    0x3EFF0000,         // Translation Offset
> +                    0x00010000,         // Length
> +                    ,, , TypeStatic, DenseTranslation)
> +                QWordMemory (ResourceProducer, PosDecode, MinFixed, MaxFixed, NonCacheable, ReadWrite,
> +                    0x0000000000000000, // Granularity
> +                    0x0000008000000000, // Range Minimum
> +                    0x000000FFFFFFFFFF, // Range Maximum
> +                    0x0000000000000000, // Translation Offset
> +                    0x0000008000000000, // Length
> +                    ,, , AddressRangeMemory, TypeStatic)
> +            })
>              Name (SUPP, Zero)
>              Name (CTRL, Zero)
>              Method (_OSC, 4, NotSerialized)  // _OSC: Operating System Capabilities
> 
> Fixes: fe1127da11 ("unit-test: Add the binary file and clear diff.h")
> Signed-off-by: Jiahui Cen <cenjiahui@huawei.com>
> ---
>  tests/data/acpi/virt/DSDT.pxb | Bin 7802 -> 7673 bytes
>  1 file changed, 0 insertions(+), 0 deletions(-)
> 
> diff --git a/tests/data/acpi/virt/DSDT.pxb b/tests/data/acpi/virt/DSDT.pxb
> index d5f0533a02d62bc2ae2db9b9de9484e5c06652fe..76f5f1c2fd487644c6b4f827a70ad770edb9fdc9 100644
> GIT binary patch
> delta 70
> zcmV-M0J;DAJo!5cL{mgm`5gcN0z#1r8v=ygktblW?YIa6OPZ6X2_m!G35f{>PNz^q
> cNt3DxACrg^53`&Ttq27OUqez;vr-%=0*oRUFaQ7m
> 
> delta 217
> zcmexq{mX{SCD<jTN{)enDSRTAG*j!-iRuaUhHgH=1|0Doo-VvTenI{Q28N~#9Py!^
> zE<n;bC|FRCi?5B7fsp|MSSlH!n?PC&v1wsM*TMqS1=eEW7Vhi@(GuwD8){%+U<5Qj
> zIK*+|g83XwzOyGgaw_pVx&(nNb#?@r6YT1~If1i>lgWL><aa`bth@ovo(7xch1YU$
> Qia3I;VOX;HqO=AR0CN5_Pyhe`
> 
> -- 
> 2.29.2


