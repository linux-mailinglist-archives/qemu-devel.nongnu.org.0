Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id ECF2A67C8DA
	for <lists+qemu-devel@lfdr.de>; Thu, 26 Jan 2023 11:43:48 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pKziN-00085a-0a; Thu, 26 Jan 2023 05:42:43 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1pKziK-00084r-Ok; Thu, 26 Jan 2023 05:42:40 -0500
Received: from mail-ej1-x62a.google.com ([2a00:1450:4864:20::62a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1pKziI-00042P-VE; Thu, 26 Jan 2023 05:42:40 -0500
Received: by mail-ej1-x62a.google.com with SMTP id mg12so3930420ejc.5;
 Thu, 26 Jan 2023 02:42:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:references
 :in-reply-to:subject:cc:to:from:date:from:to:cc:subject:date
 :message-id:reply-to;
 bh=qLifYacBouM0vjwxdLLgKZ5LiygptSCvn3mPS0I4pFw=;
 b=pnKledG3WQ4bZ638Q/+LdAtH5lz0j5ishOrIZfBSdG3htOgNxDjM6aDxf6v3GsQu8F
 gZ4iIXaEyknCre+M74peLNkgp7aqfHJNQfd3RlOnv8ttnPXAB23mglcGtNqNZuT2zD/o
 hvmZrnmZm90nt+1DfZmKc270baS9Tupfty8u7JBTNA+xwbIuEqwc1ybK5x1mvymG42EY
 G5agIQ1VDPepHWuVIFgg5RP8sEYaDeRvaSLT+HYKTNlpBGQoGboz0ivfnbiVNkaCvwUs
 yx5vhkwON3w4NeXJnMCGqTC67FrbHPUf00n48HR/ZltxkC2Kquss/YHORzCcABDsgSp8
 BCoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:references
 :in-reply-to:subject:cc:to:from:date:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=qLifYacBouM0vjwxdLLgKZ5LiygptSCvn3mPS0I4pFw=;
 b=QEuKf8IbsbEAtxJVFTowgraq8/EBEuSk020vMlMYRaCbGVb+qJCDfpRWpdNx47VEEC
 i8vLjFna9j4sTmHztiSjlZsOx0tJpAElMseKS0vwNCRnJfAo54mzn2vmcSGmXzpNkv54
 uMaSIHlcEh+JH4zabUSCJpDoPRODnHqTKC7TpZp5rYQz1P6rjYbpBlTOmChH57zjl/bq
 6ao9/O0hidHjNTeBcW59xz5v5sp8lJXOZIuEKqqj7aIaEhSENdKBDPxkZlDxHTe1Dgo7
 UHfPAwvPeISNANRU2NgHbLUSR8+PNbXXDZK0Lft6p9go1CB0CflurMJbssqZL1HOc/TQ
 lHqw==
X-Gm-Message-State: AFqh2koBueB0Q0X66eIWIIhTFxLS5EAeajPncJhYL+2fjJe6MOQ6o7yH
 W/i4tWMhAsYB7llkp7rBHX4=
X-Google-Smtp-Source: AMrXdXssZDVgIFFYTnFH5ew34Vp2MftB/LjYnNCc0SkYJK/aUNysy5GvfqqESZXUTmg/0Nr3coMpRQ==
X-Received: by 2002:a17:906:3f87:b0:809:c1f4:ea09 with SMTP id
 b7-20020a1709063f8700b00809c1f4ea09mr34062678ejj.69.1674729756481; 
 Thu, 26 Jan 2023 02:42:36 -0800 (PST)
Received: from ?IPv6:::1?
 (p200300faaf0bb2007894e99a2a220848.dip0.t-ipconnect.de.
 [2003:fa:af0b:b200:7894:e99a:2a22:848])
 by smtp.gmail.com with ESMTPSA id
 s19-20020a1709060c1300b008699bacc03csm417875ejf.14.2023.01.26.02.42.35
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 26 Jan 2023 02:42:35 -0800 (PST)
Date: Thu, 26 Jan 2023 10:42:31 +0000
From: Bernhard Beschow <shentey@gmail.com>
To: Igor Mammedov <imammedo@redhat.com>
CC: qemu-devel@nongnu.org, Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 qemu-trivial@nongnu.org, Aurelien Jarno <aurelien@aurel32.net>,
 Eduardo Habkost <eduardo@habkost.net>, Ani Sinha <ani@anisinha.ca>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 =?ISO-8859-1?Q?Philippe_Mathieu-Daud=E9?= <philmd@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Markus Armbruster <armbru@redhat.com>
Subject: Re: [PATCH v4 0/7] AML Housekeeping
In-Reply-To: <20230125175234.2984e90d@imammedo.users.ipa.redhat.com>
References: <20230121151941.24120-1-shentey@gmail.com>
 <20230125175234.2984e90d@imammedo.users.ipa.redhat.com>
Message-ID: <AC32E73F-22CB-4577-B985-9744AA70482D@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::62a;
 envelope-from=shentey@gmail.com; helo=mail-ej1-x62a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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



Am 25=2E Januar 2023 16:52:34 UTC schrieb Igor Mammedov <imammedo@redhat=
=2Ecom>:
>On Sat, 21 Jan 2023 16:19:34 +0100
>Bernhard Beschow <shentey@gmail=2Ecom> wrote:
>
>> This series factors out AcpiCpuAmlIfClass::madt_cpu from AcpiDeviceIfCl=
ass=2E
>> By letting the (x86) CPUs implement the new interface, AML generation i=
s
>> delegated to the CPUs, freeing the ACPI controllers from worrying about=
 x86 CPU
>> specifics=2E The delegation to the CPUs is especially interesting for t=
he PIIX4 PM
>> since it is also used in MIPS only contexts where no ACPI bios is avail=
able=2E
>>=20
>> Furthermore, the series introduces qbus_build_aml() which replaces
>> isa_build_aml() and resolves some open coding=2E
>
>I'm done with this series review
>(skipped 6-7/7, since they depend on 5/7 which seems unnecessary to me)

Thanks!

Okay, let's omit patches 5-7 for now=2E It makes sense to include them in =
a dedicated x86 cleanup series=2E

Michael, shall I respin a v5 with only the reviewed patches?

Best regards,
Bernhard
>
>>=20
>> v4:
>> - Squash qbus_build_aml() patches into one (Igor)
>> - Don't use a bare function pointer for AcpiDeviceIfClass::madt_cpu (Ig=
or)
>>=20
>> Testing done:
>> * `make check`
>> * `qemu-system-x86_64 -M pc -m 2G -cdrom manjaro-kde-21=2E2=2E6-220416-=
linux515=2Eiso`
>> * `qemu-system-x86_64 -M q35 -m 2G -cdrom \
>>    manjaro-kde-21=2E2=2E6-220416-linux515=2Eiso`
>>=20
>> v3:
>> - Clean up includes in AcpiDeviceIfClass::madt_cpu sub series last (Mar=
kus)
>> - Restructure qbus_build_aml() sub series (Phil, me)
>>=20
>> v2:
>> - Don't inline qbus_build_aml() (Phil)
>> - Add 'hw/acpi/piix4: No need to #include "hw/southbridge/piix=2Eh"'
>>=20
>> Bernhard Beschow (7):
>>   hw/i386/acpi-build: Remove unused attributes
>>   hw/isa/isa-bus: Turn isa_build_aml() into qbus_build_aml()
>>   hw/acpi/piix4: No need to #include "hw/southbridge/piix=2Eh"
>>   hw/acpi/acpi_dev_interface: Remove unused parameter from
>>     AcpiDeviceIfClass::madt_cpu
>>   hw/acpi/acpi_dev_interface: Factor out TYPE_ACPI_CPU_AML_IF
>>   hw/acpi/acpi_dev_interface: Remove now unused #include "hw/boards=2Eh=
"
>>   hw/i386/pc: Unexport pc_madt_cpu_entry()
>>=20
>>  hw/acpi/hmat=2Eh                       |  3 +-
>>  hw/i386/acpi-common=2Eh                |  3 +-
>>  include/hw/acpi/acpi_aml_interface=2Eh |  3 ++
>>  include/hw/acpi/acpi_cpu_interface=2Eh | 26 ++++++++++++++++
>>  include/hw/acpi/acpi_dev_interface=2Eh |  4 ---
>>  include/hw/i386/pc=2Eh                 |  6 ----
>>  include/hw/isa/isa=2Eh                 |  1 -
>>  hw/acpi/acpi-x86-stub=2Ec              |  7 -----
>>  hw/acpi/acpi_interface=2Ec             | 18 ++++++++++-
>>  hw/acpi/cpu=2Ec                        | 13 ++++----
>>  hw/acpi/hmat=2Ec                       |  1 +
>>  hw/acpi/memory_hotplug=2Ec             |  1 +
>>  hw/acpi/piix4=2Ec                      |  3 --
>>  hw/i2c/smbus_ich9=2Ec                  |  5 +--
>>  hw/i386/acpi-build=2Ec                 |  5 +--
>>  hw/i386/acpi-common=2Ec                | 42 +++----------------------
>>  hw/i386/acpi-microvm=2Ec               |  6 ++--
>>  hw/i386/generic_event_device_x86=2Ec   |  9 ------
>>  hw/isa/isa-bus=2Ec                     | 10 ------
>>  hw/isa/lpc_ich9=2Ec                    |  6 +---
>>  hw/isa/piix3=2Ec                       |  5 +--
>>  monitor/qmp-cmds=2Ec                   |  1 +
>>  target/i386/cpu=2Ec                    | 46 ++++++++++++++++++++++++++=
++
>>  23 files changed, 117 insertions(+), 107 deletions(-)
>>  create mode 100644 include/hw/acpi/acpi_cpu_interface=2Eh
>>=20
>

