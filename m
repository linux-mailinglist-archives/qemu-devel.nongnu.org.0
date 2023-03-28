Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D7D06CC7D1
	for <lists+qemu-devel@lfdr.de>; Tue, 28 Mar 2023 18:23:53 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1phC5A-0003Xw-G3; Tue, 28 Mar 2023 12:22:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <anisinha@redhat.com>)
 id 1phC58-0003XK-25
 for qemu-devel@nongnu.org; Tue, 28 Mar 2023 12:21:58 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <anisinha@redhat.com>)
 id 1phC56-0000LC-58
 for qemu-devel@nongnu.org; Tue, 28 Mar 2023 12:21:57 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1680020515;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=qwImubl7IMTeXKBuemmq6lFVefD4a2Bh4Jfr7s0zaO4=;
 b=OBlpj1WCv8TEMhGouA9/02omfwb8PYCgQ1xAKIC7vEMpDVE4qhrTSEjGHO2QsXw1QEvqXE
 SioQOCeOkGChv6HdANoMYBXpA4gD9gj+yt/tdURQSUsqYMXrpvS9D6zeNmhiD2PF83/ajU
 boBwDU+AIJH3o5XJloCvr080PuM7V+4=
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com
 [209.85.210.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-147-zYvZgp_GOu-xn3pG-AVJkA-1; Tue, 28 Mar 2023 12:21:53 -0400
X-MC-Unique: zYvZgp_GOu-xn3pG-AVJkA-1
Received: by mail-pf1-f199.google.com with SMTP id
 i26-20020aa796fa000000b006261da7aeceso6028163pfq.5
 for <qemu-devel@nongnu.org>; Tue, 28 Mar 2023 09:21:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680020512;
 h=to:references:message-id:content-transfer-encoding:cc:date
 :in-reply-to:from:subject:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=qwImubl7IMTeXKBuemmq6lFVefD4a2Bh4Jfr7s0zaO4=;
 b=pLjN9iM0FQt5a/7brghkmvAOSbQVDoOwvmk4F28aAjzssGGuLKf8dMSU9G/XfAquZy
 5IQ3grFHY7auLveUIrYgTCIeBV1ge1zIUxJhvleRh6nYmmEdDb/SwZWGEdQ+wsNV/ANi
 1/ENvKsSZa9EGB+1OercRGL1LirJWigdsZyjViKvN5yTFXywPjmJ1m20Z7rbqL0i1Ns8
 P2g/kY4OHMVv8T8V/y4UZglWAm/6n74W7oqCM9Ws8jvIp73kLweGQq+N0VX1jtsLXRd6
 NJ3f+QzC6pKHlvh/ft4W3WNMMjYCDyH/qcGTnWpdbe9+dOqLcFimQtfxpEknQs4NcuMD
 tlQQ==
X-Gm-Message-State: AAQBX9emQ8njA9UL+qrcH/RrRjzFkde+o/sj3ldVH/Px4Y09W6y3QfuT
 IrVAyhxGLQjqBaXqJzqG4V0u9fEYV0rNs8Hc/lqRa37FsoIWEv6fZhDLBURCBEEbwwVTTd5NbpG
 EoAECXtKJ83gsNjE=
X-Received: by 2002:aa7:9af6:0:b0:623:c117:f20e with SMTP id
 y22-20020aa79af6000000b00623c117f20emr14810411pfp.19.1680020512463; 
 Tue, 28 Mar 2023 09:21:52 -0700 (PDT)
X-Google-Smtp-Source: AKy350b7ZtXhY8bzdkFOdycZvtgpa4N3P24p1CR+w4JudFn9uMoaZDgx2BGTFdT1PzR+bVXxNdMuoQ==
X-Received: by 2002:aa7:9af6:0:b0:623:c117:f20e with SMTP id
 y22-20020aa79af6000000b00623c117f20emr14810385pfp.19.1680020512089; 
 Tue, 28 Mar 2023 09:21:52 -0700 (PDT)
Received: from smtpclient.apple ([116.73.135.225])
 by smtp.gmail.com with ESMTPSA id
 x19-20020a631713000000b005033e653a17sm3085737pgl.85.2023.03.28.09.21.49
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 28 Mar 2023 09:21:51 -0700 (PDT)
Content-Type: text/plain;
	charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3696.120.41.1.2\))
Subject: Re: [PATCH] hw/acpi: limit warning on acpi table size to pc machines
 older than version 2.3
From: Ani Sinha <anisinha@redhat.com>
In-Reply-To: <41FE964B-9B17-485A-A0B4-8DFB75EC904C@redhat.com>
Date: Tue, 28 Mar 2023 21:51:47 +0530
Cc: "Michael S. Tsirkin" <mst@redhat.com>, Ani Sinha <ani@anisinha.ca>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Eduardo Habkost <eduardo@habkost.net>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Julia Suvorova <jusual@redhat.com>, qemu-devel@nongnu.org
Content-Transfer-Encoding: quoted-printable
Message-Id: <1726F5CA-BE07-45B5-B8D5-12BBA7B9A810@redhat.com>
References: <20230320112902.90160-1-anisinha@redhat.com>
 <20230328141647.554ec2e7@imammedo.users.ipa.redhat.com>
 <41FE964B-9B17-485A-A0B4-8DFB75EC904C@redhat.com>
To: Igor Mammedov <imammedo@redhat.com>
X-Mailer: Apple Mail (2.3696.120.41.1.2)
Received-SPF: pass client-ip=170.10.129.124; envelope-from=anisinha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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



> On 28-Mar-2023, at 7:35 PM, Anirban Sinha <anisinha@redhat.com> wrote:
>=20
>=20
>=20
>> On 28-Mar-2023, at 5:46 PM, Igor Mammedov <imammedo@redhat.com> =
wrote:
>>=20
>> On Mon, 20 Mar 2023 16:59:02 +0530
>> Ani Sinha <anisinha@redhat.com> wrote:
>>=20
>>> i440fx machine versions 2.3 and newer and q35 machines supports =
dynamic ram
>>> resizing. Please see commit a1666142db6233 ("acpi-build: make ROMs =
RAM blocks resizeable") .
>>> Hence the warning when the ACPI table size exceeds a pre-defined =
value does
>>> not apply to those machines. Add a check limiting the warning =
message to only
>>> those machines that does not support expandable ram blocks, that is, =
i440fx
>>> machines with version 2.2 and older.
>> So q35 is not affected at all? If yes, then mention it here.
>=20
> Hmm, initially I thought q35 was unaffected but seems I was mistaken. =
Looking at 94dec5948aeb240 ("pc: rename machine types=E2=80=9D), seems =
q35 machine types started with version 1.4 and so any version earlier =
than 2.3 in q35 should also be affected.

Ah never mind. We have deprecated all q35 machines older than version =
2.4:

commit 86165b499edf8b03bb2d0e926d116c2f12a95bfe
Author: Eduardo Habkost <ehabkost@redhat.com>
Date:   Sat Jan 23 14:02:09 2016 -0200

    q35: Remove old machine versions
   =20
    Migration with q35 was not possible before commit
    04329029a8c539eb5f75dcb6d8b016f0c53a031a, because q35
    unconditionally creates an ich9-ahci device, that was marked as
    unmigratable. So all q35 machine classes before pc-q35-2.4 were
    not migratable, so there's no point in keeping compatibility code
    for them.
   =20
    Remove all old pc-q35 machine classes and keep only pc-q35-2.4
    and newer.
   =20
    Signed-off-by: Eduardo Habkost <ehabkost@redhat.com>
    Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
    Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
    Reviewed-by: Laszlo Ersek <lersek@redhat.com>
    Reviewed-by: Markus Armbruster <armbru@redhat.com>
    Reviewed-by: Igor Mammedov <imammedo@redhat.com>

So yes q35 is unaffected. I will update the commit log accordingly.


> I will take care of this.
>=20
>=20
>>=20
>>>=20
>>> Signed-off-by: Ani Sinha <anisinha@redhat.com>
>>> ---
>>> hw/i386/acpi-build.c | 6 ++++--
>>> hw/i386/pc.c         | 1 +
>>> hw/i386/pc_piix.c    | 1 +
>>> include/hw/i386/pc.h | 3 +++
>>> 4 files changed, 9 insertions(+), 2 deletions(-)
>>>=20
>>> diff --git a/hw/i386/acpi-build.c b/hw/i386/acpi-build.c
>>> index b19fb4259e..2311bea082 100644
>>> --- a/hw/i386/acpi-build.c
>>> +++ b/hw/i386/acpi-build.c
>>> @@ -2616,7 +2616,8 @@ void acpi_build(AcpiBuildTables *tables, =
MachineState *machine)
>>>        int legacy_table_size =3D
>>>            ROUND_UP(tables_blob->len - aml_len + legacy_aml_len,
>>>                     ACPI_BUILD_ALIGN_SIZE);
>>> -        if (tables_blob->len > legacy_table_size) {
>>> +        if ((tables_blob->len > legacy_table_size) &&
>>> +            !pcmc->resizable_ram_block) {
>>>            /* Should happen only with PCI bridges and -M =
pc-i440fx-2.0.  */
>>>            warn_report("ACPI table size %u exceeds %d bytes,"
>>>                        " migration may not work",
>>> @@ -2627,7 +2628,8 @@ void acpi_build(AcpiBuildTables *tables, =
MachineState *machine)
>>>        g_array_set_size(tables_blob, legacy_table_size);
>>>    } else {
>>>        /* Make sure we have a buffer in case we need to resize the =
tables. */
>>> -        if (tables_blob->len > ACPI_BUILD_TABLE_SIZE / 2) {
>>> +        if ((tables_blob->len > ACPI_BUILD_TABLE_SIZE / 2) &&
>>> +            !pcmc->resizable_ram_block) {
>>>            /* As of QEMU 2.1, this fires with 160 VCPUs and 255 =
memory slots.  */
>>>            warn_report("ACPI table size %u exceeds %d bytes,"
>>>                        " migration may not work",
>>> diff --git a/hw/i386/pc.c b/hw/i386/pc.c
>>> index 7bebea57e3..822d5de333 100644
>>> --- a/hw/i386/pc.c
>>> +++ b/hw/i386/pc.c
>>> @@ -1936,6 +1936,7 @@ static void pc_machine_class_init(ObjectClass =
*oc, void *data)
>>>    pcmc->acpi_data_size =3D 0x20000 + 0x8000;
>>>    pcmc->pvh_enabled =3D true;
>>>    pcmc->kvmclock_create_always =3D true;
>>> +    pcmc->resizable_ram_block =3D true;
>>>    assert(!mc->get_hotplug_handler);
>>>    mc->get_hotplug_handler =3D pc_get_hotplug_handler;
>>>    mc->hotplug_allowed =3D pc_hotplug_allowed;
>>> diff --git a/hw/i386/pc_piix.c b/hw/i386/pc_piix.c
>>> index 2f16011bab..3c74dfcfb4 100644
>>> --- a/hw/i386/pc_piix.c
>>> +++ b/hw/i386/pc_piix.c
>>> @@ -745,6 +745,7 @@ static void =
pc_i440fx_2_2_machine_options(MachineClass *m)
>>>    compat_props_add(m->compat_props, hw_compat_2_2, =
hw_compat_2_2_len);
>>>    compat_props_add(m->compat_props, pc_compat_2_2, =
pc_compat_2_2_len);
>>>    pcmc->rsdp_in_ram =3D false;
>>> +    pcmc->resizable_ram_block =3D false;
>>> }
>>>=20
>>> DEFINE_I440FX_MACHINE(v2_2, "pc-i440fx-2.2", pc_compat_2_2_fn,
>>> diff --git a/include/hw/i386/pc.h b/include/hw/i386/pc.h
>>> index 8206d5405a..3427a35f73 100644
>>> --- a/include/hw/i386/pc.h
>>> +++ b/include/hw/i386/pc.h
>>> @@ -127,6 +127,9 @@ struct PCMachineClass {
>>>=20
>>>    /* create kvmclock device even when KVM PV features are not =
exposed */
>>>    bool kvmclock_create_always;
>>> +
>>> +    /* resizable memory block compat */
>>> +    bool resizable_ram_block;
>> perhaps more specific
>>  resizeable_acpi_blob
>> would be better
>=20
> Sure, will rename accordingly.
>=20
>>=20
>>> };
>>>=20
>>> #define TYPE_PC_MACHINE "generic-pc-machine"
>=20


