Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [IPv6:2001:470:142::17])
	by mail.lfdr.de (Postfix) with ESMTPS id C5DF71C5798
	for <lists+qemu-devel@lfdr.de>; Tue,  5 May 2020 15:56:31 +0200 (CEST)
Received: from localhost ([::1]:55878 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jVy3i-0004On-Q3
	for lists+qemu-devel@lfdr.de; Tue, 05 May 2020 09:56:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52594)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1jVy2D-00037j-Fz
 for qemu-devel@nongnu.org; Tue, 05 May 2020 09:54:57 -0400
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:23999
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1jVy2C-0007pK-Ck
 for qemu-devel@nongnu.org; Tue, 05 May 2020 09:54:57 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1588686895;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=kKj0jdGlaivo2/mLp8xmiHLrPG6KTffbwB1bxZSBrco=;
 b=RKHbFJDZnx+O9YlFUnynFR5yPiVkdLaLOLy4utm0DeLoGlY73GfnmZRqu8JC9Pqqb25btc
 /++XtF2WoafjBlbdUPhAxuhsdoWKu8J5YmwxtSQrFQ9nfPO0kr567hzRmb+nTEWNTrQEYL
 yv8SYTdo7xIQX+7wSdbQS2D49qNeZbY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-123-P027GwyWNu-Sk-WKp7KZ7Q-1; Tue, 05 May 2020 09:54:53 -0400
X-MC-Unique: P027GwyWNu-Sk-WKp7KZ7Q-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id DF5128014C1;
 Tue,  5 May 2020 13:54:51 +0000 (UTC)
Received: from localhost (unknown [10.40.208.7])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 3352A10013D9;
 Tue,  5 May 2020 13:54:41 +0000 (UTC)
Date: Tue, 5 May 2020 15:54:39 +0200
From: Igor Mammedov <imammedo@redhat.com>
To: Gerd Hoffmann <kraxel@redhat.com>
Subject: Re: [PATCH v2 01/13] acpi: make build_madt() more generic.
Message-ID: <20200505155439.335d0c85@redhat.com>
In-Reply-To: <20200505134305.22666-2-kraxel@redhat.com>
References: <20200505134305.22666-1-kraxel@redhat.com>
 <20200505134305.22666-2-kraxel@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=207.211.31.120; envelope-from=imammedo@redhat.com;
 helo=us-smtp-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/05/05 00:37:38
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_PASS=-0.001 autolearn=_AUTOLEARN
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
Cc: Eduardo Habkost <ehabkost@redhat.com>, Sergio Lopez <slp@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, qemu-devel@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>, Richard Henderson <rth@twiddle.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue,  5 May 2020 15:42:53 +0200
Gerd Hoffmann <kraxel@redhat.com> wrote:

> Remove PCMachineState dependency from build_madt().
> Pass AcpiDeviceIf as separate argument instead of
> depending on PCMachineState->acpi_dev.
>=20
> Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
> Reviewed-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>

Reviewed-by: Igor Mammedov <imammedo@redhat.com>

> ---
>  hw/i386/acpi-build.c | 14 +++++++-------
>  1 file changed, 7 insertions(+), 7 deletions(-)
>=20
> diff --git a/hw/i386/acpi-build.c b/hw/i386/acpi-build.c
> index 765409a90eb6..fe60c10201ad 100644
> --- a/hw/i386/acpi-build.c
> +++ b/hw/i386/acpi-build.c
> @@ -366,14 +366,13 @@ void pc_madt_cpu_entry(AcpiDeviceIf *adev, int uid,
>  }
> =20
>  static void
> -build_madt(GArray *table_data, BIOSLinker *linker, PCMachineState *pcms)
> +build_madt(GArray *table_data, BIOSLinker *linker,
> +           X86MachineState *x86ms, AcpiDeviceIf *adev)
>  {
> -    MachineClass *mc =3D MACHINE_GET_CLASS(pcms);
> -    X86MachineState *x86ms =3D X86_MACHINE(pcms);
> -    const CPUArchIdList *apic_ids =3D mc->possible_cpu_arch_ids(MACHINE(=
pcms));
> +    MachineClass *mc =3D MACHINE_GET_CLASS(x86ms);
> +    const CPUArchIdList *apic_ids =3D mc->possible_cpu_arch_ids(MACHINE(=
x86ms));
>      int madt_start =3D table_data->len;
> -    AcpiDeviceIfClass *adevc =3D ACPI_DEVICE_IF_GET_CLASS(pcms->acpi_dev=
);
> -    AcpiDeviceIf *adev =3D ACPI_DEVICE_IF(pcms->acpi_dev);
> +    AcpiDeviceIfClass *adevc =3D ACPI_DEVICE_IF_GET_CLASS(adev);
>      bool x2apic_mode =3D false;
> =20
>      AcpiMultipleApicTable *madt;
> @@ -2561,7 +2560,8 @@ void acpi_build(AcpiBuildTables *tables, MachineSta=
te *machine)
>      aml_len +=3D tables_blob->len - fadt;
> =20
>      acpi_add_table(table_offsets, tables_blob);
> -    build_madt(tables_blob, tables->linker, pcms);
> +    build_madt(tables_blob, tables->linker, x86ms,
> +               ACPI_DEVICE_IF(pcms->acpi_dev));
> =20
>      vmgenid_dev =3D find_vmgenid_dev();
>      if (vmgenid_dev) {


