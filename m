Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CAA16E8BB0
	for <lists+qemu-devel@lfdr.de>; Thu, 20 Apr 2023 09:49:33 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ppP2E-0005nB-FD; Thu, 20 Apr 2023 03:48:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <anisinha@redhat.com>)
 id 1ppP2C-0005i9-89
 for qemu-devel@nongnu.org; Thu, 20 Apr 2023 03:48:52 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <anisinha@redhat.com>)
 id 1ppP2A-0003s1-GN
 for qemu-devel@nongnu.org; Thu, 20 Apr 2023 03:48:51 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1681976929;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=yxR5wG66pp3avAKEUkSQi/3JzWpdH0FcMjQ8jamybAY=;
 b=D2CiFo104YiiuNvptE7a2ZyeqInBdkTUXOG991bY2MRuQA+la9m+gJ1sW+sdy2gCWv1h0j
 e4gxycVCgKlvBGauPtYqZsIQ1N5o9TAecNUktLYPnlhvuNMBw8dGmNDry3cqH2T8g6Ij9V
 NL/5Zd8aNt7o17fJqgMIUYWsxRi5qWI=
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com
 [209.85.210.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-281-Y5n013WcO267JtcGbn4FkA-1; Thu, 20 Apr 2023 03:48:47 -0400
X-MC-Unique: Y5n013WcO267JtcGbn4FkA-1
Received: by mail-pf1-f198.google.com with SMTP id
 d2e1a72fcca58-63b81520de5so841344b3a.0
 for <qemu-devel@nongnu.org>; Thu, 20 Apr 2023 00:48:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1681976926; x=1684568926;
 h=to:references:message-id:content-transfer-encoding:cc:date
 :in-reply-to:from:subject:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=yxR5wG66pp3avAKEUkSQi/3JzWpdH0FcMjQ8jamybAY=;
 b=VxxQjMssZNufaXPHuGnI1tlPj+tTWvITGPuNbgRrugcVVFlJYI3tQo/aZUe5jauKCD
 wvVE6PSt8yx0uAoHoIWb6Mhm2l+KhGUVNJOC1pSxxUU5lLAOzfqeQi40ytIU3NKjQtIa
 6ohqyuIgbAuTeQRM7Fl6IRf7DnbfZcuEsAvs3H9wCp6M1ZJSvXnrF+4BVMJN7LotTuVd
 v4RwohxL1mmji0zZ6Lp7JrUkran/ABPZxsWvlKn2LmfreGoVoujhj77ejxhiPy5JZPDs
 3CoEXeJRBB+XG8PQazS2jLqiXhRELfxq/N2oC9IvOuRv+bdN/xPrcpGGJzgWD3Ew9XEf
 t3NA==
X-Gm-Message-State: AAQBX9e/jBUyi5kgqK9M0w+el6NdzlgxarPAMe0Q/+9uGAnQ8rcGvsGM
 5aIqMAbauo9Oj0iKWVClCuSA4KTZf8f5Pu2KqzArO68xi0iHKXTe0HF5kg27z+I2NUoAKohfQYX
 bVvR/FL9VPxwA7lU=
X-Received: by 2002:aa7:88d1:0:b0:63b:89a9:529f with SMTP id
 k17-20020aa788d1000000b0063b89a9529fmr444300pff.14.1681976925721; 
 Thu, 20 Apr 2023 00:48:45 -0700 (PDT)
X-Google-Smtp-Source: AKy350aHo305qQx50TUdOmU+IYs3F1Ryd5eFWveAy+BdBFdk87LG1l+M9oU7vATqUYpJbez5y5eT1g==
X-Received: by 2002:aa7:88d1:0:b0:63b:89a9:529f with SMTP id
 k17-20020aa788d1000000b0063b89a9529fmr444272pff.14.1681976925293; 
 Thu, 20 Apr 2023 00:48:45 -0700 (PDT)
Received: from smtpclient.apple ([203.212.242.145])
 by smtp.gmail.com with ESMTPSA id
 e16-20020a056a001a9000b0063b87f47062sm625116pfv.127.2023.04.20.00.48.42
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 20 Apr 2023 00:48:44 -0700 (PDT)
Content-Type: text/plain;
	charset=us-ascii
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3696.120.41.1.3\))
Subject: Re: [PATCH v2] hw/acpi: limit warning on acpi table size to pc
 machines older than version 2.3
From: Ani Sinha <anisinha@redhat.com>
In-Reply-To: <20230406100753.12719a7f@imammedo.users.ipa.redhat.com>
Date: Thu, 20 Apr 2023 13:18:42 +0530
Cc: "Michael S. Tsirkin" <mst@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Eduardo Habkost <eduardo@habkost.net>, qemu-devel@nongnu.org
Content-Transfer-Encoding: quoted-printable
Message-Id: <68A9F01E-C17C-4E92-A544-0AD69D4FA622@redhat.com>
References: <20230329045726.14028-1-anisinha@redhat.com>
 <20230406100753.12719a7f@imammedo.users.ipa.redhat.com>
To: Igor Mammedov <imammedo@redhat.com>
X-Mailer: Apple Mail (2.3696.120.41.1.3)
Received-SPF: pass client-ip=170.10.129.124; envelope-from=anisinha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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



> On 06-Apr-2023, at 1:37 PM, Igor Mammedov <imammedo@redhat.com> wrote:
>=20
> On Wed, 29 Mar 2023 10:27:26 +0530
> Ani Sinha <anisinha@redhat.com> wrote:
>=20
>> i440fx machine versions 2.3 and newer supports dynamic ram
>> resizing. See commit a1666142db6233 ("acpi-build: make ROMs RAM =
blocks resizeable") .
>> Currently supported all q35 machine types (versions 2.4 and newer) =
supports
>> resizable RAM/ROM blocks.Therefore the warning generated when the =
ACPI table
>> size exceeds a pre-defined value does not apply to those machine =
versions.
>> Add a check limiting the warning message to only those machines that =
does not
>> support expandable ram blocks (that is, i440fx machines with version =
2.2
>> and older).
>>=20
>> Signed-off-by: Ani Sinha <anisinha@redhat.com>
>=20
> Reviewed-by: Igor Mammedov <imammedo@redhat.com>

Michael, reminder to queue this for the next PR.

>=20
>> ---
>> hw/i386/acpi-build.c | 6 ++++--
>> hw/i386/pc.c         | 1 +
>> hw/i386/pc_piix.c    | 1 +
>> include/hw/i386/pc.h | 3 +++
>> 4 files changed, 9 insertions(+), 2 deletions(-)
>>=20
>> diff --git a/hw/i386/acpi-build.c b/hw/i386/acpi-build.c
>> index b19fb4259e..91be76e61f 100644
>> --- a/hw/i386/acpi-build.c
>> +++ b/hw/i386/acpi-build.c
>> @@ -2616,7 +2616,8 @@ void acpi_build(AcpiBuildTables *tables, =
MachineState *machine)
>>         int legacy_table_size =3D
>>             ROUND_UP(tables_blob->len - aml_len + legacy_aml_len,
>>                      ACPI_BUILD_ALIGN_SIZE);
>> -        if (tables_blob->len > legacy_table_size) {
>> +        if ((tables_blob->len > legacy_table_size) &&
>> +            !pcmc->resizable_acpi_blob) {
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
>> +            !pcmc->resizable_acpi_blob) {
>>             /* As of QEMU 2.1, this fires with 160 VCPUs and 255 =
memory slots.  */
>>             warn_report("ACPI table size %u exceeds %d bytes,"
>>                         " migration may not work",
>> diff --git a/hw/i386/pc.c b/hw/i386/pc.c
>> index 7bebea57e3..2b66985013 100644
>> --- a/hw/i386/pc.c
>> +++ b/hw/i386/pc.c
>> @@ -1936,6 +1936,7 @@ static void pc_machine_class_init(ObjectClass =
*oc, void *data)
>>     pcmc->acpi_data_size =3D 0x20000 + 0x8000;
>>     pcmc->pvh_enabled =3D true;
>>     pcmc->kvmclock_create_always =3D true;
>> +    pcmc->resizable_acpi_blob =3D true;
>>     assert(!mc->get_hotplug_handler);
>>     mc->get_hotplug_handler =3D pc_get_hotplug_handler;
>>     mc->hotplug_allowed =3D pc_hotplug_allowed;
>> diff --git a/hw/i386/pc_piix.c b/hw/i386/pc_piix.c
>> index 2f16011bab..8f7b3ae11b 100644
>> --- a/hw/i386/pc_piix.c
>> +++ b/hw/i386/pc_piix.c
>> @@ -745,6 +745,7 @@ static void =
pc_i440fx_2_2_machine_options(MachineClass *m)
>>     compat_props_add(m->compat_props, hw_compat_2_2, =
hw_compat_2_2_len);
>>     compat_props_add(m->compat_props, pc_compat_2_2, =
pc_compat_2_2_len);
>>     pcmc->rsdp_in_ram =3D false;
>> +    pcmc->resizable_acpi_blob =3D false;
>> }
>>=20
>> DEFINE_I440FX_MACHINE(v2_2, "pc-i440fx-2.2", pc_compat_2_2_fn,
>> diff --git a/include/hw/i386/pc.h b/include/hw/i386/pc.h
>> index 8206d5405a..6008eb045a 100644
>> --- a/include/hw/i386/pc.h
>> +++ b/include/hw/i386/pc.h
>> @@ -127,6 +127,9 @@ struct PCMachineClass {
>>=20
>>     /* create kvmclock device even when KVM PV features are not =
exposed */
>>     bool kvmclock_create_always;
>> +
>> +    /* resizable acpi blob compat */
>> +    bool resizable_acpi_blob;
>> };
>>=20
>> #define TYPE_PC_MACHINE "generic-pc-machine"
>=20


