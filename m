Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C97C16CC1B7
	for <lists+qemu-devel@lfdr.de>; Tue, 28 Mar 2023 16:08:28 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ph9xm-0006Ij-0f; Tue, 28 Mar 2023 10:06:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <anisinha@redhat.com>)
 id 1ph9xk-0006IL-49
 for qemu-devel@nongnu.org; Tue, 28 Mar 2023 10:06:12 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <anisinha@redhat.com>)
 id 1ph9xe-0002cg-So
 for qemu-devel@nongnu.org; Tue, 28 Mar 2023 10:06:11 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1680012364;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=T2ylFDZ/vKhU66sV/3fw+oAKTDgmCFtHZgzSeq23SaM=;
 b=WyP18la8o7oCUlAAPijFEqIFBNDS3tUux5wUYEphNX0WvTvZ6hhGLNBIGto9oc1d+zUvqS
 5139o9v6EgFYGIdV9031J0+L0hCOTG6vgRvhQeJ+nWxd4k6pVv6GR/a4aK/5vtEs82wQcg
 1Nig7yRaAqLaMW0j6Wnh+R210P/Z02g=
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com
 [209.85.214.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-639-pF4N9OmmNJeQb5UT7zjOeA-1; Tue, 28 Mar 2023 10:06:02 -0400
X-MC-Unique: pF4N9OmmNJeQb5UT7zjOeA-1
Received: by mail-pl1-f199.google.com with SMTP id
 s4-20020a170902ea0400b001a1f4137086so7728836plg.14
 for <qemu-devel@nongnu.org>; Tue, 28 Mar 2023 07:06:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680012361;
 h=to:references:message-id:content-transfer-encoding:cc:date
 :in-reply-to:from:subject:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=T2ylFDZ/vKhU66sV/3fw+oAKTDgmCFtHZgzSeq23SaM=;
 b=H3GsyDmxBmaNJsk1fo0/eXBWcVkTXQ5UpiOTLQCW8igkyJXJZk3O+xX9BtyL8M4j5V
 LcWmfYS51BgP8HJXp5ERWMrLKp9anrkeTE12TItlLpUtumfdaKEHrpX4jQUh1FCL7GZI
 lz2jupomIUl60qHjwPG332LGJ1olZlWu+dGLqmd6X9R+E55pgGqY+0FWRLqP3AuXT41z
 eqgCcvQhfixLXMyIQbv5hG9wEtaTRoi+n14eVApbgkUzLPamXBO3oIkIdyJGvuLdVSOP
 Y58cy/A1l6sS5685RrgibAXey26YmbBFx/E0Sipn7HPPAkZndgdffJeGewj78Oqycswe
 V8UA==
X-Gm-Message-State: AO0yUKUOH6PNakHHKQl6lvhzW/JPX5u13vIZh5880RCMl4GQhBbT81LW
 K57HbE/ZUgtWru/baNS5JfQLAZ/+NxKRKMiRGIxhQgnk87mBbs+wUrtEjnCnCgOpxwtkUP4xSmz
 y1AyI3XVLJBsb8F0=
X-Received: by 2002:a05:6a20:b806:b0:d9:8a1b:3315 with SMTP id
 fi6-20020a056a20b80600b000d98a1b3315mr12525583pzb.59.1680012360884; 
 Tue, 28 Mar 2023 07:06:00 -0700 (PDT)
X-Google-Smtp-Source: AK7set+UHR0LP91pNy/9hmmSrwR1Ujxlt3FPWO29U76ZUsbwTyG1ueGvD9jwk6shGw0uk6fA4+8JMA==
X-Received: by 2002:a05:6a20:b806:b0:d9:8a1b:3315 with SMTP id
 fi6-20020a056a20b80600b000d98a1b3315mr12525564pzb.59.1680012360501; 
 Tue, 28 Mar 2023 07:06:00 -0700 (PDT)
Received: from smtpclient.apple ([116.73.135.225])
 by smtp.gmail.com with ESMTPSA id
 o10-20020a63fb0a000000b004dff15fc121sm19767118pgh.36.2023.03.28.07.05.56
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 28 Mar 2023 07:05:59 -0700 (PDT)
Content-Type: text/plain;
	charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3696.120.41.1.2\))
Subject: Re: [PATCH] hw/acpi: limit warning on acpi table size to pc machines
 older than version 2.3
From: Anirban Sinha <anisinha@redhat.com>
In-Reply-To: <20230328141647.554ec2e7@imammedo.users.ipa.redhat.com>
Date: Tue, 28 Mar 2023 19:35:54 +0530
Cc: "Michael S. Tsirkin" <mst@redhat.com>, Ani Sinha <ani@anisinha.ca>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Eduardo Habkost <eduardo@habkost.net>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Julia Suvorova <jusual@redhat.com>, qemu-devel@nongnu.org
Content-Transfer-Encoding: quoted-printable
Message-Id: <41FE964B-9B17-485A-A0B4-8DFB75EC904C@redhat.com>
References: <20230320112902.90160-1-anisinha@redhat.com>
 <20230328141647.554ec2e7@imammedo.users.ipa.redhat.com>
To: Igor Mammedov <imammedo@redhat.com>
X-Mailer: Apple Mail (2.3696.120.41.1.2)
Received-SPF: pass client-ip=170.10.129.124; envelope-from=anisinha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org



> On 28-Mar-2023, at 5:46 PM, Igor Mammedov <imammedo@redhat.com> wrote:
>=20
> On Mon, 20 Mar 2023 16:59:02 +0530
> Ani Sinha <anisinha@redhat.com> wrote:
>=20
>> i440fx machine versions 2.3 and newer and q35 machines supports =
dynamic ram
>> resizing. Please see commit a1666142db6233 ("acpi-build: make ROMs =
RAM blocks resizeable") .
>> Hence the warning when the ACPI table size exceeds a pre-defined =
value does
>> not apply to those machines. Add a check limiting the warning message =
to only
>> those machines that does not support expandable ram blocks, that is, =
i440fx
>> machines with version 2.2 and older.
> So q35 is not affected at all? If yes, then mention it here.

Hmm, initially I thought q35 was unaffected but seems I was mistaken. =
Looking at 94dec5948aeb240 ("pc: rename machine types=E2=80=9D), seems =
q35 machine types started with version 1.4 and so any version earlier =
than 2.3 in q35 should also be affected. I will take care of this.

=20
>=20
>>=20
>> Signed-off-by: Ani Sinha <anisinha@redhat.com>
>> ---
>> hw/i386/acpi-build.c | 6 ++++--
>> hw/i386/pc.c         | 1 +
>> hw/i386/pc_piix.c    | 1 +
>> include/hw/i386/pc.h | 3 +++
>> 4 files changed, 9 insertions(+), 2 deletions(-)
>>=20
>> diff --git a/hw/i386/acpi-build.c b/hw/i386/acpi-build.c
>> index b19fb4259e..2311bea082 100644
>> --- a/hw/i386/acpi-build.c
>> +++ b/hw/i386/acpi-build.c
>> @@ -2616,7 +2616,8 @@ void acpi_build(AcpiBuildTables *tables, =
MachineState *machine)
>>         int legacy_table_size =3D
>>             ROUND_UP(tables_blob->len - aml_len + legacy_aml_len,
>>                      ACPI_BUILD_ALIGN_SIZE);
>> -        if (tables_blob->len > legacy_table_size) {
>> +        if ((tables_blob->len > legacy_table_size) &&
>> +            !pcmc->resizable_ram_block) {
>>             /* Should happen only with PCI bridges and -M =
pc-i440fx-2.0.  */
>>             warn_report("ACPI table size %u exceeds %d bytes,"
>>                         " migration may not work",
>> @@ -2627,7 +2628,8 @@ void acpi_build(AcpiBuildTables *tables, =
MachineState *machine)
>>         g_array_set_size(tables_blob, legacy_table_size);
>>     } else {
>>         /* Make sure we have a buffer in case we need to resize the =
tables. */
>> -        if (tables_blob->len > ACPI_BUILD_TABLE_SIZE / 2) {
>> +        if ((tables_blob->len > ACPI_BUILD_TABLE_SIZE / 2) &&
>> +            !pcmc->resizable_ram_block) {
>>             /* As of QEMU 2.1, this fires with 160 VCPUs and 255 =
memory slots.  */
>>             warn_report("ACPI table size %u exceeds %d bytes,"
>>                         " migration may not work",
>> diff --git a/hw/i386/pc.c b/hw/i386/pc.c
>> index 7bebea57e3..822d5de333 100644
>> --- a/hw/i386/pc.c
>> +++ b/hw/i386/pc.c
>> @@ -1936,6 +1936,7 @@ static void pc_machine_class_init(ObjectClass =
*oc, void *data)
>>     pcmc->acpi_data_size =3D 0x20000 + 0x8000;
>>     pcmc->pvh_enabled =3D true;
>>     pcmc->kvmclock_create_always =3D true;
>> +    pcmc->resizable_ram_block =3D true;
>>     assert(!mc->get_hotplug_handler);
>>     mc->get_hotplug_handler =3D pc_get_hotplug_handler;
>>     mc->hotplug_allowed =3D pc_hotplug_allowed;
>> diff --git a/hw/i386/pc_piix.c b/hw/i386/pc_piix.c
>> index 2f16011bab..3c74dfcfb4 100644
>> --- a/hw/i386/pc_piix.c
>> +++ b/hw/i386/pc_piix.c
>> @@ -745,6 +745,7 @@ static void =
pc_i440fx_2_2_machine_options(MachineClass *m)
>>     compat_props_add(m->compat_props, hw_compat_2_2, =
hw_compat_2_2_len);
>>     compat_props_add(m->compat_props, pc_compat_2_2, =
pc_compat_2_2_len);
>>     pcmc->rsdp_in_ram =3D false;
>> +    pcmc->resizable_ram_block =3D false;
>> }
>>=20
>> DEFINE_I440FX_MACHINE(v2_2, "pc-i440fx-2.2", pc_compat_2_2_fn,
>> diff --git a/include/hw/i386/pc.h b/include/hw/i386/pc.h
>> index 8206d5405a..3427a35f73 100644
>> --- a/include/hw/i386/pc.h
>> +++ b/include/hw/i386/pc.h
>> @@ -127,6 +127,9 @@ struct PCMachineClass {
>>=20
>>     /* create kvmclock device even when KVM PV features are not =
exposed */
>>     bool kvmclock_create_always;
>> +
>> +    /* resizable memory block compat */
>> +    bool resizable_ram_block;
> perhaps more specific
>   resizeable_acpi_blob
> would be better

Sure, will rename accordingly.

>=20
>> };
>>=20
>> #define TYPE_PC_MACHINE "generic-pc-machine"


