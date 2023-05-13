Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 90FA870167B
	for <lists+qemu-devel@lfdr.de>; Sat, 13 May 2023 13:45:02 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pxnfm-0005PO-Lc; Sat, 13 May 2023 07:44:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>) id 1pxnfj-0005P0-DU
 for qemu-devel@nongnu.org; Sat, 13 May 2023 07:44:23 -0400
Received: from mail-ej1-x62d.google.com ([2a00:1450:4864:20::62d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>) id 1pxnfh-0007sF-Pt
 for qemu-devel@nongnu.org; Sat, 13 May 2023 07:44:23 -0400
Received: by mail-ej1-x62d.google.com with SMTP id
 a640c23a62f3a-9659443fb56so1709693866b.2
 for <qemu-devel@nongnu.org>; Sat, 13 May 2023 04:44:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1683978259; x=1686570259;
 h=content-transfer-encoding:mime-version:message-id:references
 :in-reply-to:subject:cc:to:from:date:from:to:cc:subject:date
 :message-id:reply-to;
 bh=V6rAM+uNA/W1vTTbidrPOvF1WB4ageDhKjMWnQRB0Dk=;
 b=hnfm3bmL71lHvrHS1ylREbQosLNuToMM5JyIfyAEk8e2Is0svS4qNdAaevNg8LmLtg
 Z9qtC/+TbRS3t70tUZ24A23mogaDQCbHnPU1ePpPOi43scxPTf6avbTZzuIu6Ix3zxKV
 Ib9nMn/Eg87HnHJevWS+wHz9blOY3hj6yovgkZPC+CV6dXBIKDE7nlW8mP6EZ9sV6bvC
 LT9zYI+tLoDLxCV+s5hGsdrC5G7jSHaRmau9ExngU+P8/LMoMpdmWyD5IYHdu2QLq2Aw
 3m/9bcgxLABPjhb4VSnzk1b+0lESQihCY+70Ll6pIaOxxGZuwB/dEFFz1tXqokr/48NC
 BMDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683978259; x=1686570259;
 h=content-transfer-encoding:mime-version:message-id:references
 :in-reply-to:subject:cc:to:from:date:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=V6rAM+uNA/W1vTTbidrPOvF1WB4ageDhKjMWnQRB0Dk=;
 b=fAo9jFZO+Ng6VMfYL4Zerv8UjJEKAGolzEfwEk4G4J7janWAiKHzt5+G2HVhZO5XsQ
 56DXUIFIW2UWSqxc13M+KyW02+09FUEg0+vrIgdD1M08Dhj1kt/1U44A7FtFQakqzTea
 117f32cR3RcK5UpRcKmpc2IXWT2qSR8Jl22yJbSXvkX6Z9RMcAHF6ytnD8IyOxCp4dKg
 I2jtR6qkjVK0rj2Vuq7tYPWJflGX2/7M0aeuG44Geqo6sEEIT94RlM/fhLJGj7ZJ+Vw8
 gy7dJb0V6fK1yn3dqLaYMmiwrT5KqfEaY9XrcTF4dgYz/UKAlblXvj61OVrw9aMhcp/u
 GKKA==
X-Gm-Message-State: AC+VfDyYx/Y18MNPxCha8K3Wv5X/Vebk9gxDzB0bl+9lhqAVT1428qJt
 aiHwh24MW4I0zkRCl32OVXQR53icdDI=
X-Google-Smtp-Source: ACHHUZ6JJgPDuB7Q8BYSij4drTRdfqqNWuU4pbKsBlUfNJbXghamkFlPpjRzt6VPnAgzf3POjvW/Yw==
X-Received: by 2002:a17:907:8a02:b0:967:d161:61c6 with SMTP id
 sc2-20020a1709078a0200b00967d16161c6mr19735527ejc.3.1683978259039; 
 Sat, 13 May 2023 04:44:19 -0700 (PDT)
Received: from [127.0.0.1] (dynamic-077-013-174-037.77.13.pool.telefonica.de.
 [77.13.174.37]) by smtp.gmail.com with ESMTPSA id
 k18-20020a17090632d200b009661f07db93sm6684735ejk.223.2023.05.13.04.44.18
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 13 May 2023 04:44:18 -0700 (PDT)
Date: Sat, 13 May 2023 11:44:14 +0000
From: Bernhard Beschow <shentey@gmail.com>
To: "Michael S. Tsirkin" <mst@redhat.com>
CC: qemu-devel@nongnu.org, Richard Henderson <richard.henderson@linaro.org>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 David Woodhouse <dwmw@amazon.co.uk>, Eduardo Habkost <eduardo@habkost.net>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Chuck Zmudzinski <brchuckz@aol.com>, Aurelien Jarno <aurelien@aurel32.net>,
 =?ISO-8859-1?Q?Herv=E9_Poussineau?= <hpoussin@reactos.org>,
 Paul Durrant <paul@xen.org>, Paolo Bonzini <pbonzini@redhat.com>,
 =?ISO-8859-1?Q?Philippe_Mathieu-Daud=E9?= <philmd@linaro.org>,
 Anthony Perard <anthony.perard@citrix.com>, xen-devel@lists.xenproject.org
Subject: Re: [PATCH v4 0/7] Resolve TYPE_PIIX3_XEN_DEVICE
In-Reply-To: <20230421033757-mutt-send-email-mst@kernel.org>
References: <20230403074124.3925-1-shentey@gmail.com>
 <20230421033757-mutt-send-email-mst@kernel.org>
Message-ID: <9EB9A984-61E5-4226-8352-B5DDC6E2C62E@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::62d;
 envelope-from=shentey@gmail.com; helo=mail-ej1-x62d.google.com
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org



Am 21=2E April 2023 07:38:10 UTC schrieb "Michael S=2E Tsirkin" <mst@redha=
t=2Ecom>:
>On Mon, Apr 03, 2023 at 09:41:17AM +0200, Bernhard Beschow wrote:
>> There is currently a dedicated PIIX3 device model for use under Xen=2E =
By reusing
>> existing PCI API during initialization this device model can be elimina=
ted and
>> the plain PIIX3 device model can be used instead=2E
>>=20
>> Resolving TYPE_PIIX3_XEN_DEVICE results in less code while also making =
Xen
>> agnostic towards the precise south bridge being used in the PC machine=
=2E The
>> latter might become particularily interesting once PIIX4 becomes usable=
 in the
>> PC machine, avoiding the "Frankenstein" use of PIIX4_ACPI in PIIX3=2E
>
>xen stuff so I assume that tree?

Ping

>
>> Testing done:
>> - `make check`
>> - Run `xl create` with the following config:
>>     name =3D "Manjaro"
>>     type =3D 'hvm'
>>     memory =3D 1536
>>     apic =3D 1
>>     usb =3D 1
>>     disk =3D [ "file:manjaro-kde-21=2E2=2E6-220416-linux515=2Eiso,hdc:c=
drom,r" ]
>>     device_model_override =3D "/usr/bin/qemu-system-x86_64"
>>     vga =3D "stdvga"
>>     sdl =3D 1
>> - `qemu-system-x86_64 -M pc -m 2G -cpu host -accel kvm \
>>     -cdrom manjaro-kde-21=2E2=2E6-220416-linux515=2Eiso`
>>=20
>> v4:
>> - Add patch fixing latent memory leak in pci_bus_irqs() (Anthony)
>>=20
>> v3:
>> - Rebase onto master
>>=20
>> v2:
>> - xen_piix3_set_irq() is already generic=2E Just rename it=2E (Chuck)
>>=20
>> Tested-by: Chuck Zmudzinski <brchuckz@aol=2Ecom>
>>=20
>> Bernhard Beschow (7):
>>   include/hw/xen/xen: Rename xen_piix3_set_irq() to xen_intx_set_irq()
>>   hw/pci/pci=2Ec: Don't leak PCIBus::irq_count[] in pci_bus_irqs()
>>   hw/isa/piix3: Reuse piix3_realize() in piix3_xen_realize()
>>   hw/isa/piix3: Wire up Xen PCI IRQ handling outside of PIIX3
>>   hw/isa/piix3: Avoid Xen-specific variant of piix3_write_config()
>>   hw/isa/piix3: Resolve redundant k->config_write assignments
>>   hw/isa/piix3: Resolve redundant TYPE_PIIX3_XEN_DEVICE
>>=20
>>  include/hw/southbridge/piix=2Eh |  1 -
>>  include/hw/xen/xen=2Eh          |  2 +-
>>  hw/i386/pc_piix=2Ec             | 36 +++++++++++++++++++--
>>  hw/i386/xen/xen-hvm=2Ec         |  2 +-
>>  hw/isa/piix3=2Ec                | 60 +--------------------------------=
--
>>  hw/pci/pci=2Ec                  |  2 ++
>>  stubs/xen-hw-stub=2Ec           |  2 +-
>>  7 files changed, 39 insertions(+), 66 deletions(-)
>>=20
>> --=20
>> 2=2E40=2E0
>>=20
>

