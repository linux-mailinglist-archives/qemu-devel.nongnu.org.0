Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F29931533F
	for <lists+qemu-devel@lfdr.de>; Tue,  9 Feb 2021 16:56:55 +0100 (CET)
Received: from localhost ([::1]:49022 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l9VNm-0008RV-5H
	for lists+qemu-devel@lfdr.de; Tue, 09 Feb 2021 10:56:54 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:44846)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1l9VLj-0006uC-M8
 for qemu-devel@nongnu.org; Tue, 09 Feb 2021 10:54:47 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:25518)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1l9VLi-0006lH-0Z
 for qemu-devel@nongnu.org; Tue, 09 Feb 2021 10:54:47 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1612886084;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=wAVHwNAn0wJaWGfz/1oNO05xA40qcb3uPC/4BA2DA/o=;
 b=I0XXExsASaV9OGgnhjWPlbUM6pfpBufC/pqf4VH6KdYi7ua+J/RwVg7MqY2KzaVo61b1RE
 ApolrH1EaYWKcamQeK5dJL+yRgDeTt8zjxJMOxFGU+EXYrWFVOXNP/hDO5MGi11DbFYg2h
 JLseNye1Y7YgvtytnOgOYX2gVeIy1eM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-445-smYjf4uMP-Oelc8JHEZLtg-1; Tue, 09 Feb 2021 10:54:43 -0500
X-MC-Unique: smYjf4uMP-Oelc8JHEZLtg-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id BB755EC1A1;
 Tue,  9 Feb 2021 15:54:41 +0000 (UTC)
Received: from localhost (unknown [10.40.208.3])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 16A085D9CD;
 Tue,  9 Feb 2021 15:54:36 +0000 (UTC)
Date: Tue, 9 Feb 2021 16:54:35 +0100
From: Igor Mammedov <imammedo@redhat.com>
To: isaku.yamahata@gmail.com
Subject: Re: [PATCH v2 7/9] i386: acpi: Don't build HPET ACPI entry if HPET
 is disabled
Message-ID: <20210209165435.24824b69@redhat.com>
In-Reply-To: <4d380b7f97149f82da91f967a419ff3f3a2bc1a4.1612821109.git.isaku.yamahata@intel.com>
References: <cover.1612821108.git.isaku.yamahata@intel.com>
 <4d380b7f97149f82da91f967a419ff3f3a2bc1a4.1612821109.git.isaku.yamahata@intel.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=imammedo@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=216.205.24.124; envelope-from=imammedo@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -33
X-Spam_score: -3.4
X-Spam_bar: ---
X-Spam_report: (-3.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.57,
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
Cc: Sean Christopherson <sean.j.christopherson@intel.com>, philmd@redhat.com,
 qemu-devel@nongnu.org, mst@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon,  8 Feb 2021 13:57:26 -0800
isaku.yamahata@gmail.com wrote:

> From: Sean Christopherson <sean.j.christopherson@intel.com>
>=20
> Omit HPET AML if the HPET is disabled, QEMU is not emulating it and the
> guest may get confused by seeing HPET in the ACPI tables without a
> "physical" device present.
>=20
> The change of DSDT when -no-hpet is as follows.
>=20
> @@ -141,47 +141,6 @@ DefinitionBlock ("", "DSDT", 1, "BOCHS "
>          }
>      }
>=20
> -    Scope (_SB)
> -    {
> -        Device (HPET)
> -        {
> -            Name (_HID, EisaId ("PNP0103") /* HPET System Timer */)  // =
_HID: Hardware ID
> -            Name (_UID, Zero)  // _UID: Unique ID
> -            OperationRegion (HPTM, SystemMemory, 0xFED00000, 0x0400)
> -            Field (HPTM, DWordAcc, Lock, Preserve)
> -            {
> -                VEND,   32,
> -                PRD,    32
> -            }
> -
> -            Method (_STA, 0, NotSerialized)  // _STA: Status
> -            {
> -                Local0 =3D VEND /* \_SB_.HPET.VEND */
> -                Local1 =3D PRD /* \_SB_.HPET.PRD_ */
> -                Local0 >>=3D 0x10
> -                If (((Local0 =3D=3D Zero) || (Local0 =3D=3D 0xFFFF)))
> -                {
> -                    Return (Zero)
> -                }
> -
> -                If (((Local1 =3D=3D Zero) || (Local1 > 0x05F5E100)))
> -                {
> -                    Return (Zero)
> -                }
> -
> -                Return (0x0F)
> -            }
> -
> -            Name (_CRS, ResourceTemplate ()  // _CRS: Current Resource S=
ettings
> -            {
> -                Memory32Fixed (ReadOnly,
> -                    0xFED00000,         // Address Base
> -                    0x00000400,         // Address Length
> -                    )
> -            })
> -        }
> -    }
> -
>      Scope (_SB.PCI0)
>      {
>          Device (ISA)
>=20
> Reviewed-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
> Signed-off-by: Sean Christopherson <sean.j.christopherson@intel.com>

Reviewed-by: Igor Mammedov <imammedo@redhat.com>

> ---
>  hw/i386/acpi-build.c | 8 ++++++--
>  1 file changed, 6 insertions(+), 2 deletions(-)
>=20
> diff --git a/hw/i386/acpi-build.c b/hw/i386/acpi-build.c
> index bcb1f65c1d..73ec0b6d32 100644
> --- a/hw/i386/acpi-build.c
> +++ b/hw/i386/acpi-build.c
> @@ -1405,7 +1405,9 @@ build_dsdt(GArray *table_data, BIOSLinker *linker,
>          aml_append(sb_scope, dev);
>          aml_append(dsdt, sb_scope);
> =20
> -        build_hpet_aml(dsdt);
> +        if (misc->has_hpet) {
> +            build_hpet_aml(dsdt);
> +        }
>          build_piix4_isa_bridge(dsdt);
>          build_isa_devices_aml(dsdt);
>          if (pm->pcihp_bridge_en || pm->pcihp_root_en) {
> @@ -1450,7 +1452,9 @@ build_dsdt(GArray *table_data, BIOSLinker *linker,
> =20
>          aml_append(dsdt, sb_scope);
> =20
> -        build_hpet_aml(dsdt);
> +        if (misc->has_hpet) {
> +            build_hpet_aml(dsdt);
> +        }
>          build_q35_isa_bridge(dsdt);
>          build_isa_devices_aml(dsdt);
>          build_q35_pci0_int(dsdt);


