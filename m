Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A870A5B27C7
	for <lists+qemu-devel@lfdr.de>; Thu,  8 Sep 2022 22:35:59 +0200 (CEST)
Received: from localhost ([::1]:40178 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oWOFi-0001Is-9U
	for lists+qemu-devel@lfdr.de; Thu, 08 Sep 2022 16:35:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58530)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>) id 1oWOAC-0006nu-6y
 for qemu-devel@nongnu.org; Thu, 08 Sep 2022 16:30:16 -0400
Received: from mail-ed1-x534.google.com ([2a00:1450:4864:20::534]:40741)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>) id 1oWOAA-0006db-Ks
 for qemu-devel@nongnu.org; Thu, 08 Sep 2022 16:30:15 -0400
Received: by mail-ed1-x534.google.com with SMTP id m1so26111917edb.7
 for <qemu-devel@nongnu.org>; Thu, 08 Sep 2022 13:30:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:references
 :in-reply-to:subject:cc:to:from:date:from:to:cc:subject:date;
 bh=NF2WnB1wqNt6LGA1toIi1878MgcRluO9mTAmdGJaqwg=;
 b=ZMNEAOmt2rlhaP5bgdkTmVJUOuVg7OuVqWMA7kodfniI7lyOEoBt9C5QnSNSMaxsXy
 CbNS87bJHykrkbaiwB5vLu4i3Q2Jgvwv50g+bGQCJdBWRrBgWix2timUE0QkUG434y9p
 //udeiol4dyimbvD1XYGLSkRUHXdAHzEEtCkqJn+PMD0mZKr2+pvMus+QSBwHpXAkdl5
 tfWYET8rRC8gF+btm8g1+6zA3sSM11DidDxCFql4uVsUzV2prikxJekwMlD0gxRVy8Lg
 IpnNRDoTMHFjtnT3cviSiUGBktPuJ/I/LL1GDmCo/oaObVZx2VcFoKVB+0B1jHu44JKL
 XQmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:references
 :in-reply-to:subject:cc:to:from:date:x-gm-message-state:from:to:cc
 :subject:date;
 bh=NF2WnB1wqNt6LGA1toIi1878MgcRluO9mTAmdGJaqwg=;
 b=SfNOAGULShbDYmpCTmRJLNSYhn3p7mGBQDkA6LrnU3XFPOE1hYa7prrqp7oQdYnKbX
 TPc1/gb8hv/I8LvyCKUeAHt/AQ7aLx25Wdtc3VP8NOBGAonNlg2A6tlkoh6DLjC8PsE8
 yv7r1T/1UCx5uOKMfd+BpbR7wXal2rEju8nYjXWsGxfwC6KgwXMlhJIBYgC6H+iYVRXo
 ASdno25GPSXuUqud6jEqJvo9uqdb+1xHS8gQKfdj5/1aO1B21mLKsghxTWcsb/V8GQWT
 VP//YbbpgmXH97STCpA0iqdRJvRr+CAbVGBOX9F2BBZvw5rHoky6JLpiZ+wYh4eijv6R
 /QGA==
X-Gm-Message-State: ACgBeo3pgXGmxA4YPLxIokyOeGgfE+rNo+6eJxlR5kBnmCVGTgO4B0d/
 RQC0Fc5EymagM1MehY4tRRk=
X-Google-Smtp-Source: AA6agR6Pzd3M01f2uz3i7g4jex9yXDIDnbFZD4YsyF9loNl7f6GZFCdNyLD0vWVw9oAyb/zL7lF3pQ==
X-Received: by 2002:a05:6402:510c:b0:43e:305c:a4d1 with SMTP id
 m12-20020a056402510c00b0043e305ca4d1mr8509656edd.35.1662669013084; 
 Thu, 08 Sep 2022 13:30:13 -0700 (PDT)
Received: from [127.0.0.1] (dynamic-089-014-172-011.89.14.pool.telefonica.de.
 [89.14.172.11]) by smtp.gmail.com with ESMTPSA id
 f21-20020a170906049500b007707ab1139csm1615603eja.75.2022.09.08.13.30.12
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 08 Sep 2022 13:30:12 -0700 (PDT)
Date: Thu, 08 Sep 2022 20:30:03 +0000
From: Bernhard Beschow <shentey@gmail.com>
To: =?ISO-8859-1?Q?Philippe_Mathieu-Daud=E9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
CC: =?ISO-8859-1?Q?Herv=E9_Poussineau?= <hpoussin@reactos.org>,
 Aurelien Jarno <aurelien@aurel32.net>, Paolo Bonzini <pbonzini@redhat.com>,
 Eduardo Habkost <eduardo@habkost.net>,
 Richard Henderson <richard.henderson@linaro.org>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>, Ani Sinha <ani@anisinha.ca>,
 Igor Mammedov <imammedo@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 "Michael S. Tsirkin" <mst@redhat.com>
Subject: =?US-ASCII?Q?Re=3A_=5BPATCH_42/42=5D_hw/i386/acpi-build=3A_Resolv?=
 =?US-ASCII?Q?e_PIIX_ISA_bridge_rather_than_ACPI_controller?=
In-Reply-To: <aa1b63b7-fe8f-1d19-2716-c76525d5bc7a@amsat.org>
References: <20220901162613.6939-1-shentey@gmail.com>
 <20220901162613.6939-43-shentey@gmail.com>
 <aa1b63b7-fe8f-1d19-2716-c76525d5bc7a@amsat.org>
Message-ID: <DA83C0D4-6244-40AA-9895-F225FBCF879F@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::534;
 envelope-from=shentey@gmail.com; helo=mail-ed1-x534.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Am 1=2E September 2022 21:05:03 UTC schrieb "Philippe Mathieu-Daud=C3=A9" <=
f4bug@amsat=2Eorg>:
>On 1/9/22 18:26, Bernhard Beschow wrote:
>> Resolving the PIIX ISA bridge rather than the PIIX ACPI controller mirr=
ors
>> the ICH9 code one line below=2E
>>=20
>> Signed-off-by: Bernhard Beschow <shentey@gmail=2Ecom>
>> ---
>>   hw/i386/acpi-build=2Ec | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>=20
>> diff --git a/hw/i386/acpi-build=2Ec b/hw/i386/acpi-build=2Ec
>> index 8af75b1e22=2E=2Ed7bb1ccb26 100644
>> --- a/hw/i386/acpi-build=2Ec
>> +++ b/hw/i386/acpi-build=2Ec
>> @@ -288,7 +288,7 @@ static void acpi_get_pm_info(MachineState *machine,=
 AcpiPmInfo *pm)
>>     static void acpi_get_misc_info(AcpiMiscInfo *info)
>>   {
>> -    Object *piix =3D object_resolve_type_unambiguous(TYPE_PIIX4_PM);
>> +    Object *piix =3D object_resolve_type_unambiguous(TYPE_PIIX_PCI_DEV=
ICE);
>>       Object *lpc =3D object_resolve_type_unambiguous(TYPE_ICH9_LPC_DEV=
ICE);
>>       assert(!!piix !=3D !!lpc);
>>  =20
>
>This looks correct to  me w=2Er=2Et the hardware, but my understanding is
>some x86 machines allow abusing the PIIX ACPI PCI function, by plugging
>it alone, without the rest of the south bridge=2E=2E=2E Then this patch w=
ould
>regress such Frankenstein use :/

TYPE_PIIX4_PM is not user-creatable and is only instantiated in pc_piix=2E=
c if the southbridge is as well, so those should be equivalent=2E Since acp=
i_get_misc_info() is more about the board and south bridge and not about PM=
, I think checking for TYPE_PIIX_PCI_DEVICE is therefore more appropriate h=
ere=2E

>
>Reviewed-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat=2Eorg>


