Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D2B8C69D750
	for <lists+qemu-devel@lfdr.de>; Tue, 21 Feb 2023 00:50:38 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pUFuU-0007kx-4u; Mon, 20 Feb 2023 18:49:30 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1pUFuS-0007kS-FJ; Mon, 20 Feb 2023 18:49:28 -0500
Received: from mail-ed1-x52f.google.com ([2a00:1450:4864:20::52f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1pUFuQ-0005xr-CU; Mon, 20 Feb 2023 18:49:28 -0500
Received: by mail-ed1-x52f.google.com with SMTP id cq23so10219993edb.1;
 Mon, 20 Feb 2023 15:49:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:references
 :in-reply-to:subject:cc:to:from:date:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Gs22ZxGEsLAJ1tKVS6b+eEoUoLSRCH9x24lc65dcSxU=;
 b=ca1OCHJY63EUwRjK/jiRvwG4I5BWXH5xcMYSEKvkr/sBelp/VaEiIvmCQCJ0gEMsHl
 lO/zNRIqS4Tklfeu2RM4GYQYNCM5JNqgoJB9xDTJEZ+w1M76OT2t3TBc7KxVaZCsQWA3
 oZZ80gRxld9/hZfoTyJvM46JI6bymxgHv/Ty8ZMpAvMLIE/e2aqEbfh0NXK+iHwxxtgQ
 1eYaSzZrrkU5xq2JMzbG75yYNCmK3gN8D0gGELAikeNx6XutPMlUhbpvN+71hYMIIY8h
 DmRLle6m+q9mMKJEyCJ5PzCGWKF3+DUtjgOgTflFthVjZqym2kIr6FLP/0BtgRjEFnYW
 gKHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:references
 :in-reply-to:subject:cc:to:from:date:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Gs22ZxGEsLAJ1tKVS6b+eEoUoLSRCH9x24lc65dcSxU=;
 b=MvJk7x/7ZFjBiU80TcP7sLXIUWu+lEe4RdFXoECRIDcKOk6yYeccbSjEX9FPV2CGr6
 IWi2T1/flckLOKc8KnYHsPT3HW7m+fuUvT81R41t55r1sRjiOQM3UmyGivY0MRHYkV1m
 69v6aMB14Tsr61tvvsk059MQOj6qdiezg4N39dnlXSk2lkHTgma16udohDM8/urDBKg7
 pDsMzYtNXluZPwFZx1rTM5vUkeVnyxfOI3JG9ldtgz0O51pMKaeozxBH8GxOIC86N9vo
 mpWG2utvbJxIXlThhml8MM9mCxFZIiwfcElrxOJZwW92jXuTSHm//ZuK+TBM+cCYBthE
 3KxQ==
X-Gm-Message-State: AO0yUKXeANTDrt8X5+u74963nu1ZBC9b/TZL6dCHUDpK4wccaInoYBs0
 cPF7I/hYQWFw8vKkLnRBTgk=
X-Google-Smtp-Source: AK7set957ug17eVqCWF3Tk7ufH9Tv+akZLY9LtK6K+42J0XdOBvU+DpI8miTeU4gdOJ0zoGYOnQlmQ==
X-Received: by 2002:a17:906:eca1:b0:87d:eff1:acc8 with SMTP id
 qh1-20020a170906eca100b0087deff1acc8mr10419294ejb.48.1676936963428; 
 Mon, 20 Feb 2023 15:49:23 -0800 (PST)
Received: from ?IPv6:::1?
 (p200300faaf06ee000cdc023a29c679bc.dip0.t-ipconnect.de.
 [2003:fa:af06:ee00:cdc:23a:29c6:79bc])
 by smtp.gmail.com with ESMTPSA id
 b15-20020a1709062b4f00b008db605598b9sm846040ejg.67.2023.02.20.15.49.22
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 20 Feb 2023 15:49:23 -0800 (PST)
Date: Mon, 20 Feb 2023 23:49:19 +0000
From: Bernhard Beschow <shentey@gmail.com>
To: =?ISO-8859-1?Q?Philippe_Mathieu-Daud=E9?= <philmd@linaro.org>,
 "Michael S. Tsirkin" <mst@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Igor Mammedov <imammedo@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>
CC: qemu-devel@nongnu.org, Thomas Huth <thuth@redhat.com>,
 =?ISO-8859-1?Q?Herv=E9_Poussineau?= <hpoussin@reactos.org>,
 qemu-block@nongnu.org, John Snow <jsnow@redhat.com>,
 Eduardo Habkost <eduardo@habkost.net>, Kevin Wolf <kwolf@redhat.com>,
 qemu-ppc@nongnu.org, Hanna Reitz <hreitz@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Gerd Hoffmann <kraxel@redhat.com>,
 =?ISO-8859-1?Q?Daniel_P=2E_Berrang=E9?= <berrange@redhat.com>,
 "reviewer:Incompatible changes" <libvir-list@redhat.com>
Subject: =?US-ASCII?Q?Re=3A_=5BPATCH_v2_07/18=5D_hw/ide/piix=3A_Ensure?=
 =?US-ASCII?Q?_IDE_output_IRQs_are_wired_at_realization?=
In-Reply-To: <666316cf-6f1e-8f62-dab7-8b0da698faa7@linaro.org>
References: <20230215161641.32663-1-philmd@linaro.org>
 <20230215161641.32663-8-philmd@linaro.org>
 <CAG4p6K6zMEMT07qDzPyEgc1F+FPp-AHyhgZWRhYAaJsfOUZD=g@mail.gmail.com>
 <0350214d-fd70-4d24-8db8-66185f5d6780@linaro.org>
 <666316cf-6f1e-8f62-dab7-8b0da698faa7@linaro.org>
Message-ID: <27575298-BEFB-48FD-BD07-DC03DBA3292A@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::52f;
 envelope-from=shentey@gmail.com; helo=mail-ed1-x52f.google.com
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



Am 19=2E Februar 2023 21:54:34 UTC schrieb "Philippe Mathieu-Daud=C3=A9" <=
philmd@linaro=2Eorg>:
>+Daniel, Igor, Marcel & libvirt
>
>On 16/2/23 16:33, Philippe Mathieu-Daud=C3=A9 wrote:
>> On 16/2/23 15:43, Bernhard Beschow wrote:
>>>=20
>>>=20
>>> On Wed, Feb 15, 2023 at 5:20 PM Philippe Mathieu-Daud=C3=A9 <philmd@li=
naro=2Eorg <mailto:philmd@linaro=2Eorg>> wrote:
>>>=20
>>> =C2=A0=C2=A0=C2=A0 Ensure both IDE output IRQ lines are wired=2E
>>>=20
>>> =C2=A0=C2=A0=C2=A0 We can remove the last use of isa_get_irq(NULL)=2E
>>>=20
>>> =C2=A0=C2=A0=C2=A0 Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@=
linaro=2Eorg
>>> =C2=A0=C2=A0=C2=A0 <mailto:philmd@linaro=2Eorg>>
>>> =C2=A0=C2=A0=C2=A0 ---
>>> =C2=A0=C2=A0=C2=A0=C2=A0 =C2=A0hw/ide/piix=2Ec | 13 ++++++++-----
>>> =C2=A0=C2=A0=C2=A0=C2=A0 =C2=A01 file changed, 8 insertions(+), 5 dele=
tions(-)
>>>=20
>>> =C2=A0=C2=A0=C2=A0 diff --git a/hw/ide/piix=2Ec b/hw/ide/piix=2Ec
>>> =C2=A0=C2=A0=C2=A0 index 9d876dd4a7=2E=2Eb75a4ddcca 100644
>>> =C2=A0=C2=A0=C2=A0 --- a/hw/ide/piix=2Ec
>>> =C2=A0=C2=A0=C2=A0 +++ b/hw/ide/piix=2Ec
>>> =C2=A0=C2=A0=C2=A0 @@ -133,14 +133,17 @@ static bool pci_piix_init_bus=
(PCIIDEState *d,
>>> =C2=A0=C2=A0=C2=A0 unsigned i, Error **errp)
>>> =C2=A0=C2=A0=C2=A0=C2=A0 =C2=A0 =C2=A0 =C2=A0static const struct {
>>> =C2=A0=C2=A0=C2=A0=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0int iobase;
>>> =C2=A0=C2=A0=C2=A0=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0int iobase2=
;
>>> =C2=A0=C2=A0=C2=A0 -=C2=A0 =C2=A0 =C2=A0 =C2=A0 int isairq;
>>> =C2=A0=C2=A0=C2=A0=C2=A0 =C2=A0 =C2=A0 =C2=A0} port_info[] =3D {
>>> =C2=A0=C2=A0=C2=A0 -=C2=A0 =C2=A0 =C2=A0 =C2=A0 {0x1f0, 0x3f6, 14},
>>> =C2=A0=C2=A0=C2=A0 -=C2=A0 =C2=A0 =C2=A0 =C2=A0 {0x170, 0x376, 15},
>>> =C2=A0=C2=A0=C2=A0 +=C2=A0 =C2=A0 =C2=A0 =C2=A0 {0x1f0, 0x3f6},
>>> =C2=A0=C2=A0=C2=A0 +=C2=A0 =C2=A0 =C2=A0 =C2=A0 {0x170, 0x376},
>>> =C2=A0=C2=A0=C2=A0=C2=A0 =C2=A0 =C2=A0 =C2=A0};
>>> =C2=A0=C2=A0=C2=A0=C2=A0 =C2=A0 =C2=A0 =C2=A0int ret;
>>>=20
>>> =C2=A0=C2=A0=C2=A0 -=C2=A0 =C2=A0 qemu_irq irq_out =3D d->irq[i] ? : i=
sa_get_irq(NULL,
>>> =C2=A0=C2=A0=C2=A0 port_info[i]=2Eisairq);
>>> =C2=A0=C2=A0=C2=A0 +=C2=A0 =C2=A0 if (!d->irq[i]) {
>>> =C2=A0=C2=A0=C2=A0 +=C2=A0 =C2=A0 =C2=A0 =C2=A0 error_setg(errp, "outp=
ut IDE IRQ %u not connected", i);
>>> =C2=A0=C2=A0=C2=A0 +=C2=A0 =C2=A0 =C2=A0 =C2=A0 return false;
>>> =C2=A0=C2=A0=C2=A0 +=C2=A0 =C2=A0 }
>>> =C2=A0=C2=A0=C2=A0 +
>>> =C2=A0=C2=A0=C2=A0=C2=A0 =C2=A0 =C2=A0 =C2=A0ide_bus_init(&d->bus[i], =
sizeof(d->bus[i]), DEVICE(d), i, 2);
>>> =C2=A0=C2=A0=C2=A0=C2=A0 =C2=A0 =C2=A0 =C2=A0ret =3D ide_init_ioport(&=
d->bus[i], NULL, port_info[i]=2Eiobase,
>>> =C2=A0=C2=A0=C2=A0=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0port_info[i]=2Eiobase2)=
;
>>> =C2=A0=C2=A0=C2=A0 @@ -149,7 +152,7 @@ static bool pci_piix_init_bus(P=
CIIDEState *d,
>>> =C2=A0=C2=A0=C2=A0 unsigned i, Error **errp)
>>> =C2=A0=C2=A0=C2=A0=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 object_get_typename(OBJECT(d)=
), i);
>>> =C2=A0=C2=A0=C2=A0=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return fals=
e;
>>> =C2=A0=C2=A0=C2=A0=C2=A0 =C2=A0 =C2=A0 =C2=A0}
>>> =C2=A0=C2=A0=C2=A0 -=C2=A0 =C2=A0 ide_bus_init_output_irq(&d->bus[i], =
irq_out);
>>> =C2=A0=C2=A0=C2=A0 +=C2=A0 =C2=A0 ide_bus_init_output_irq(&d->bus[i], =
d->irq[i]);
>>>=20
>>> =C2=A0=C2=A0=C2=A0=C2=A0 =C2=A0 =C2=A0 =C2=A0bmdma_init(&d->bus[i], &d=
->bmdma[i], d);
>>> =C2=A0=C2=A0=C2=A0=C2=A0 =C2=A0 =C2=A0 =C2=A0d->bmdma[i]=2Ebus =3D &d-=
>bus[i];
>>> =C2=A0=C2=A0=C2=A0 -- =C2=A0=C2=A0=C2=A0 2=2E38=2E1
>>>=20
>>>=20
>>> This now breaks user-created =C2=A0piix3-ide:
>>>=20
>>> =C2=A0=C2=A0 qemu-system-x86_64 -M q35 -device piix3-ide
>>>=20
>>> Results in:
>>>=20
>>> =C2=A0=C2=A0 qemu-system-x86_64: -device piix3-ide: output IDE IRQ 0 n=
ot connected
>>=20
>> Thank you for this real-life-impossible-but-exists-in-QEMU test-case!
>
>Do we really want to maintain this Frankenstein use case?
>
>1/ Q35 comes with a PCIe bus on which sits a ICH chipset, which already
>   contains a AHCI function exposing multiple IDE buses=2E
>   What is the point on using an older tech?

I just chose Q35 in the test case to demonstrate that we'd not meet our ow=
n deprecation rules=2E

IIUC, QEMU guarantees a deprecation period for at least two major versions=
=2E So if we deprecated user-creatable piix-ide in 8=2E1, we are not allowe=
d to remove it before 10=2E1=2E Let's stick to our rules to give our users =
a chance to adapt gracefully=2E

>
>2/ Why can we plug a PCI function on a PCIe bridge without using a
>   pcie-pci-bridge?
>
>3/ Chipsets come as a whole=2E Software drivers might expect all PCI
>   functions working (Linux considering each function individually
>   is not the norm)
>
>
>I get your use case working with the following diff [*]:
>
>-- >8 --
>diff --git a/hw/ide/piix=2Ec b/hw/ide/piix=2Ec
>index 74e2f4288d=2E=2Ecb1628963a 100644
>--- a/hw/ide/piix=2Ec
>+++ b/hw/ide/piix=2Ec
>@@ -140,8 +140,19 @@ static bool pci_piix_init_bus(PCIIDEState *d, unsign=
ed i, Error **errp)
>     };
>
>     if (!d->irq[i]) {
>-        error_setg(errp, "output IDE IRQ %u not connected", i);
>-        return false;
>+        if (DEVICE_GET_CLASS(d)->user_creatable) {
>+            /* Returns NULL unless there is exactly one ISA bus */
>+            Object *isabus =3D object_resolve_path_type("", TYPE_ISA_BUS=
, NULL);
>+
>+            if (!isabus) {
>+                error_setg(errp, "Unable to find a single ISA bus");
>+                return false;
>+            }
>+            d->irq[i] =3D isa_bus_get_irq(ISA_BUS(isabus), 14 + i);
>+        } else {
>+            error_setg(errp, "output IDE IRQ %u not connected", i);
>+            return false;
>+        }
>     }
>
>     ide_bus_init(&d->bus[i], sizeof(d->bus[i]), DEVICE(d), i, 2);
>@@ -201,6 +212,13 @@ static void piix3_ide_class_init(ObjectClass *klass,=
 void *data)
>     k->class_id =3D PCI_CLASS_STORAGE_IDE;
>     set_bit(DEVICE_CATEGORY_STORAGE, dc->categories);
>     dc->hotpluggable =3D false;
>+    /*
>+     * This function is part of a Super I/O chip and shouldn't be user
>+     * creatable=2E However QEMU accepts impossible hardware setups such
>+     * plugging a PIIX IDE function on a ICH ISA bridge=2E
>+     * Keep this Frankenstein (ab)use working=2E
>+     */
>+    dc->user_creatable =3D true;
> }
>
> static const TypeInfo piix3_ide_info =3D {
>@@ -224,6 +242,8 @@ static void piix4_ide_class_init(ObjectClass *klass, =
void *data)
>     k->class_id =3D PCI_CLASS_STORAGE_IDE;
>     set_bit(DEVICE_CATEGORY_STORAGE, dc->categories);
>     dc->hotpluggable =3D false;
>+    /* Reason: Part of a Super I/O chip */
>+    dc->user_creatable =3D false;

piix3-ide and piix4-ide are implemented in the same file=2E This means tha=
t above test case should also apply for piix4-ide, even when CONFIG_PIIX4=
=3Dn=2E To meet our deprecation rules, we're not allowed to treat piix4 dif=
ferently=2E

Best regards,
Bernhard

> }
>---
>
>But the hardware really looks Frankenstein now:
>
>(qemu) info qom-tree
>/machine (pc-q35-8=2E0-machine)
>  /peripheral-anon (container)
>    /device[0] (piix3-ide)
>      /bmdma[0] (memory-region)
>      /bmdma[1] (memory-region)
>      /bus master container[0] (memory-region)
>      /bus master[0] (memory-region)
>      /ide=2E6 (IDE)
>      /ide=2E7 (IDE)
>      /ide[0] (memory-region)
>      /ide[1] (memory-region)
>      /ide[2] (memory-region)
>      /ide[3] (memory-region)
>      /piix-bmdma-container[0] (memory-region)
>      /piix-bmdma[0] (memory-region)
>      /piix-bmdma[1] (memory-region)
>  /q35 (q35-pcihost)
>  /unattached (container)
>    /device[17] (ich9-ahci)
>      /ahci-idp[0] (memory-region)
>      /ahci[0] (memory-region)
>      /bus master container[0] (memory-region)
>      /bus master[0] (memory-region)
>      /ide=2E0 (IDE)
>      /ide=2E1 (IDE)
>      /ide=2E2 (IDE)
>      /ide=2E3 (IDE)
>      /ide=2E4 (IDE)
>      /ide=2E5 (IDE)
>    /device[2] (ICH9-LPC)
>      /bus master container[0] (memory-region)
>      /bus master[0] (memory-region)
>      /ich9-pm[0] (memory-region)
>      /isa=2E0 (ISA)
>
>I guess the diff [*] is acceptable as a kludge, but we might consider
>deprecating such use=2E
>
>Paolo, Michael & libvirt folks, what do you think?
>
>Regards,
>
>Phil=2E

