Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C51069F019
	for <lists+qemu-devel@lfdr.de>; Wed, 22 Feb 2023 09:22:59 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pUkNZ-0004Wr-QE; Wed, 22 Feb 2023 03:21:33 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1pUkNX-0004WO-Af; Wed, 22 Feb 2023 03:21:31 -0500
Received: from mail-ed1-x535.google.com ([2a00:1450:4864:20::535])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1pUkNV-0005CD-9N; Wed, 22 Feb 2023 03:21:30 -0500
Received: by mail-ed1-x535.google.com with SMTP id x10so26229037edd.13;
 Wed, 22 Feb 2023 00:21:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:references
 :in-reply-to:subject:cc:to:from:date:from:to:cc:subject:date
 :message-id:reply-to;
 bh=fRilIlHbt1tRuzNnHtzhblIoDQU4aWjMmETXbO/TVvo=;
 b=P5wYetqkSy+rB9jJjoYrDnP6l8Bk/GREvy2zATjU5B3P8TxwpfbUP4xSin6aHAzR8H
 R7d4bWxSFSL8WdGXfrnX4ArXOTs58tjlz/T6oFjkS/BNFxwyfOk1nn+wty0xKY5O/0bW
 mFaZ1un0Ob6fQI6ed8OMq4a/d6SOwthTfpPmRlfXIS7uKPiJcQUEWRVUqHaKa2GWp+cR
 +sDqYuEDzDRoUvzOIaOIXEaf8c2ijHemZ7NjaR9wtsGoX08+uYmlqPqKGITNvvkj5lbd
 +qjgwxIaoQdgLfiqhZvbPIp+gqW72xvTZ7N18itg3hzsmCS1IyRf6kZ+7S/n4JHpO94a
 Jkpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:references
 :in-reply-to:subject:cc:to:from:date:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=fRilIlHbt1tRuzNnHtzhblIoDQU4aWjMmETXbO/TVvo=;
 b=vLtm3Zwz+lvL5cZ/ixb9YLCiNpPh1+qnIeAiYv5+VV726v9ygHPbOQpI+tQBoG6kN7
 AGP093v2buLVLwBnuN1ZMDhLdQ5i4d+pOdizq/8K0gRxg4YPQxbbvgPFiZ3QriZ8gVEV
 +8w53mGarvGofKN4Zs7R/GbaKXFY1/MUdD7pvDpV/lwACJkHAOMRHdHDROMSUIleMtYX
 A648Frrm7PAf37Yq5JTEfTDcO6geYejG4sa/J6sux+0Vk0T7oPS/6Ys6vIaRV+Q2GJm2
 pal3bIoeVk5k/VjqZDe5RgpiUP3SMEcw4vfXJBzHEUzoJ/F3XCz/f5sYGATrj5B288eG
 om6w==
X-Gm-Message-State: AO0yUKVCIsrZnYlQcwpVxdKhIvpTwC4OtrDMxX9i5iObnv1d+/ZuC8zV
 5kQHSA8m+IW3GTaiFH8T9es=
X-Google-Smtp-Source: AK7set/moUrrgbVAIj6iwtQhNhsFScHQQWkLGswhIzyotG4YG7SUKnTXCuNDDfoan4FmfBrYL5begQ==
X-Received: by 2002:a17:907:7d90:b0:8e9:9e13:9290 with SMTP id
 oz16-20020a1709077d9000b008e99e139290mr148072ejc.27.1677054085735; 
 Wed, 22 Feb 2023 00:21:25 -0800 (PST)
Received: from ?IPv6:::1?
 (p200300faaf06ee001c45576075939c6f.dip0.t-ipconnect.de.
 [2003:fa:af06:ee00:1c45:5760:7593:9c6f])
 by smtp.gmail.com with ESMTPSA id
 kq9-20020a170906abc900b008d9c518a318sm2906297ejb.142.2023.02.22.00.21.25
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 22 Feb 2023 00:21:25 -0800 (PST)
Date: Wed, 22 Feb 2023 08:21:16 +0000
From: Bernhard Beschow <shentey@gmail.com>
To: Xiaoyao Li <xiaoyao.li@intel.com>, qemu-devel@nongnu.org
CC: Paolo Bonzini <pbonzini@redhat.com>,
 Sunil Muthuswamy <sunilmut@microsoft.com>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>, qemu-trivial@nongnu.org,
 Richard Henderson <richard.henderson@linaro.org>,
 Juan Quintela <quintela@redhat.com>, Eduardo Habkost <eduardo@habkost.net>,
 Thomas Huth <thuth@redhat.com>, Igor Mammedov <imammedo@redhat.com>,
 BALATON Zoltan <balaton@eik.bme.hu>, Ani Sinha <ani@anisinha.ca>,
 Laurent Vivier <lvivier@redhat.com>,
 =?ISO-8859-1?Q?Philippe_Mathieu-Daud=E9?= <philmd@linaro.org>
Subject: =?US-ASCII?Q?Re=3A_=5BPATCH_v4_6/9=5D_hw/i386/pc=3A_Init?=
 =?US-ASCII?Q?ialize_ram=5Fmemory_variable_directly?=
In-Reply-To: <87e11e16-f9ad-bfb4-cc1c-d5288741ded3@intel.com>
References: <20230213162004.2797-1-shentey@gmail.com>
 <20230213162004.2797-7-shentey@gmail.com>
 <87e11e16-f9ad-bfb4-cc1c-d5288741ded3@intel.com>
Message-ID: <356429F3-BC92-4EC0-AC57-036606A96131@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::535;
 envelope-from=shentey@gmail.com; helo=mail-ed1-x535.google.com
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



Am 22=2E Februar 2023 02:38:04 UTC schrieb Xiaoyao Li <xiaoyao=2Eli@intel=
=2Ecom>:
>On 2/14/2023 12:20 AM, Bernhard Beschow wrote:
>> Going through pc_memory_init() seems quite complicated for a simple
>> assignment=2E
>>=20
>
>=2E=2E=2E
>
>> diff --git a/hw/i386/pc_piix=2Ec b/hw/i386/pc_piix=2Ec
>> index 5bde4533cc=2E=2E00ba725656 100644
>> --- a/hw/i386/pc_piix=2Ec
>> +++ b/hw/i386/pc_piix=2Ec
>> @@ -143,6 +143,7 @@ static void pc_init1(MachineState *machine,
>>       if (xen_enabled()) {
>>           xen_hvm_init_pc(pcms, &ram_memory);

In Xen mode, ram_memory is initialized here and machine->ram isn't used at=
 all=2E

>>       } else {
>> +        ram_memory =3D machine->ram;

The idea of moving the assignment here is to make the code more symmetric =
to Xen and to establish the invariant of ram_memory being initialized after=
 this if-else block=2E IOW one shouldn't need to use machine->ram directly =
after this point=2E

>>           if (!pcms->max_ram_below_4g) {
>>               pcms->max_ram_below_4g =3D 0xe0000000; /* default: 3=2E5G=
 */
>>           }
>> @@ -205,8 +206,7 @@ static void pc_init1(MachineState *machine,
>>         /* allocate ram and load rom/bios */
>>       if (!xen_enabled()) {
>> -        pc_memory_init(pcms, system_memory,
>> -                       rom_memory, &ram_memory, hole64_size);
>
>IMHO, it seems more proper to put
>
>+        ram_memory =3D machine->ram;
>
>here rather than above=2E

This patch allowed for further cleanup (establishing above invariant) whic=
h I inlined for simplicity=2E

Do you still see issues here?

Thanks,
Bernhard
>
>> +        pc_memory_init(pcms, system_memory, rom_memory, hole64_size);
>>       } else {
>>           pc_system_flash_cleanup_unused(pcms);
>>           if (machine->kernel_filename !=3D NULL) {
>

