Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4BC9A671ADC
	for <lists+qemu-devel@lfdr.de>; Wed, 18 Jan 2023 12:40:33 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pI6nK-0004sw-Pn; Wed, 18 Jan 2023 06:39:54 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1pI6nI-0004sf-LO
 for qemu-devel@nongnu.org; Wed, 18 Jan 2023 06:39:52 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1pI6nH-0000Vf-3U
 for qemu-devel@nongnu.org; Wed, 18 Jan 2023 06:39:52 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1674041990;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=3Ka9Jf2XCNMoMy8Dt7ZoXwMoenV/FGjsTW1lCF3tzpU=;
 b=gHwt2gy1wZNReM3AGrA9+LxAD+QYqO59285QdJbrHkS/buLdiKkYPmENlo5iqeh8UnVzYV
 Usg2+MqBIW1WKNFOezIAs2a9LNpblkiKemlSmh4RgFZYZ1MOWhM8pEtA9bHb08L6ENNymM
 2gyTbWpJeCtVTM3rJGQUunZ9aNVt85Q=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-458-MkoDg2ZiO4-qS9Ijg-9Ikg-1; Wed, 18 Jan 2023 06:39:49 -0500
X-MC-Unique: MkoDg2ZiO4-qS9Ijg-9Ikg-1
Received: by mail-ed1-f71.google.com with SMTP id
 m7-20020a056402510700b00488d1fcdaebso23220027edd.9
 for <qemu-devel@nongnu.org>; Wed, 18 Jan 2023 03:39:48 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=3Ka9Jf2XCNMoMy8Dt7ZoXwMoenV/FGjsTW1lCF3tzpU=;
 b=n1t1Sat7ZiNFZZBE0jpjbQWH9Kqm7rU1+uDusKomeqxEegAQnccmJ2oSR753PjZyJF
 nRfvrqJZ0pEfxxmFb9NVU8ntCkuAJGAFJirzxshmheeHA2hoePO1GH3AK9yOsWHDyemk
 vBbubui1h2pPB7GzTA2bOjg3rAXzgbOcH/+rEbga+kpUGa4rFMxoCuXABPG2yLcj+M5t
 fJT4Zgw1wQyC2SYtF2w4P7eCB3QtzfEKFvV0Mv7fKeIM1YuThJ6G0zcYjMzBmHfh1GbM
 f9Ul/qTMiXkeXGGMJTk3lmukLP8LKrDxnNb0h90iRkkyxxByaVNM53O+2pt6m/GVxDue
 dcGw==
X-Gm-Message-State: AFqh2kpm5jkJwpmuQ5SK2TEZwb0zFlKgUG8Zd36UsYaoHSD055QDeM1I
 D6Bd5e/eD0YMfaGEjnFxUdeMbFo0WU2JwXhVT/b5W7Vbk7abQaar1WEhCUzttikfJW6AkDZCgDn
 d8xCqUnkaVU1ZbTQ=
X-Received: by 2002:a17:907:207a:b0:872:32eb:9df8 with SMTP id
 qp26-20020a170907207a00b0087232eb9df8mr6884907ejb.45.1674041987908; 
 Wed, 18 Jan 2023 03:39:47 -0800 (PST)
X-Google-Smtp-Source: AMrXdXsE2XJumGwA2gloRws0HDy8YquNK4OskMibBV6ma1b20T81d47q56+zxLtrDsOD1mTUeJ/cOQ==
X-Received: by 2002:a17:907:207a:b0:872:32eb:9df8 with SMTP id
 qp26-20020a170907207a00b0087232eb9df8mr6884880ejb.45.1674041987603; 
 Wed, 18 Jan 2023 03:39:47 -0800 (PST)
Received: from imammedo.users.ipa.redhat.com (nat-pool-brq-t.redhat.com.
 [213.175.37.10]) by smtp.gmail.com with ESMTPSA id
 w5-20020a50fa85000000b00491c819d6d2sm14041813edr.44.2023.01.18.03.39.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 18 Jan 2023 03:39:46 -0800 (PST)
Date: Wed, 18 Jan 2023 12:39:46 +0100
From: Igor Mammedov <imammedo@redhat.com>
To: Bernhard Beschow <shentey@gmail.com>
Cc: qemu-devel@nongnu.org, qemu-trivial@nongnu.org, Richard Henderson
 <richard.henderson@linaro.org>, Paolo Bonzini <pbonzini@redhat.com>,
 Philippe =?UTF-8?B?TWF0aGlldS1EYXVkw6k=?= <philmd@linaro.org>, Markus
 Armbruster <armbru@redhat.com>, Eduardo Habkost <eduardo@habkost.net>,
 "Michael S. Tsirkin" <mst@redhat.com>, Ani Sinha <ani@anisinha.ca>, Marcel
 Apfelbaum <marcel.apfelbaum@gmail.com>, Aurelien Jarno
 <aurelien@aurel32.net>
Subject: Re: [PATCH v3 7/7] piix3, ich9: Reuse qbus_build_aml()
Message-ID: <20230118123946.0b282e2c@imammedo.users.ipa.redhat.com>
In-Reply-To: <20230116152908.147275-8-shentey@gmail.com>
References: <20230116152908.147275-1-shentey@gmail.com>
 <20230116152908.147275-8-shentey@gmail.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.36; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.133.124; envelope-from=imammedo@redhat.com;
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

On Mon, 16 Jan 2023 16:29:08 +0100
Bernhard Beschow <shentey@gmail.com> wrote:

> Signed-off-by: Bernhard Beschow <shentey@gmail.com>
> Reviewed-by: Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org>

Reviewed-by: Igor Mammedov <imammedo@redhat.com>

I'd squash it in previous patch, and rename that to something

'remove no longer needed isa_build_aml()
 =20
 isa_build_aml() doesn't do anything except
 calling call_dev_aml_func() on bus children
 along with other places that do the same.
 Move that into ... and cleanup those places
 as well.
'


> ---
>  hw/i2c/smbus_ich9.c | 5 +----
>  hw/isa/lpc_ich9.c   | 5 +----
>  hw/isa/piix3.c      | 5 +----
>  3 files changed, 3 insertions(+), 12 deletions(-)
>=20
> diff --git a/hw/i2c/smbus_ich9.c b/hw/i2c/smbus_ich9.c
> index ee50ba1f2c..52ba77f3fc 100644
> --- a/hw/i2c/smbus_ich9.c
> +++ b/hw/i2c/smbus_ich9.c
> @@ -97,13 +97,10 @@ static void ich9_smbus_realize(PCIDevice *d, Error **=
errp)
> =20
>  static void build_ich9_smb_aml(AcpiDevAmlIf *adev, Aml *scope)
>  {
> -    BusChild *kid;
>      ICH9SMBState *s =3D ICH9_SMB_DEVICE(adev);
>      BusState *bus =3D BUS(s->smb.smbus);
> =20
> -    QTAILQ_FOREACH(kid, &bus->children, sibling) {
> -            call_dev_aml_func(DEVICE(kid->child), scope);
> -    }
> +    qbus_build_aml(bus, scope);
>  }
> =20
>  static void ich9_smb_class_init(ObjectClass *klass, void *data)
> diff --git a/hw/isa/lpc_ich9.c b/hw/isa/lpc_ich9.c
> index 0ab0a341be..d5d4b0f177 100644
> --- a/hw/isa/lpc_ich9.c
> +++ b/hw/isa/lpc_ich9.c
> @@ -813,7 +813,6 @@ static void ich9_send_gpe(AcpiDeviceIf *adev, AcpiEve=
ntStatusBits ev)
>  static void build_ich9_isa_aml(AcpiDevAmlIf *adev, Aml *scope)
>  {
>      Aml *field;
> -    BusChild *kid;
>      ICH9LPCState *s =3D ICH9_LPC_DEVICE(adev);
>      BusState *bus =3D BUS(s->isa_bus);
>      Aml *sb_scope =3D aml_scope("\\_SB");
> @@ -835,9 +834,7 @@ static void build_ich9_isa_aml(AcpiDevAmlIf *adev, Am=
l *scope)
>      aml_append(sb_scope, field);
>      aml_append(scope, sb_scope);
> =20
> -    QTAILQ_FOREACH(kid, &bus->children, sibling) {
> -            call_dev_aml_func(DEVICE(kid->child), scope);
> -    }
> +    qbus_build_aml(bus, scope);
>  }
> =20
>  static void ich9_lpc_class_init(ObjectClass *klass, void *data)
> diff --git a/hw/isa/piix3.c b/hw/isa/piix3.c
> index 283b971ec4..a9cb39bf21 100644
> --- a/hw/isa/piix3.c
> +++ b/hw/isa/piix3.c
> @@ -306,7 +306,6 @@ static void pci_piix3_realize(PCIDevice *dev, Error *=
*errp)
>  static void build_pci_isa_aml(AcpiDevAmlIf *adev, Aml *scope)
>  {
>      Aml *field;
> -    BusChild *kid;
>      Aml *sb_scope =3D aml_scope("\\_SB");
>      BusState *bus =3D qdev_get_child_bus(DEVICE(adev), "isa.0");
> =20
> @@ -322,9 +321,7 @@ static void build_pci_isa_aml(AcpiDevAmlIf *adev, Aml=
 *scope)
>      aml_append(sb_scope, field);
>      aml_append(scope, sb_scope);
> =20
> -    QTAILQ_FOREACH(kid, &bus->children, sibling) {
> -        call_dev_aml_func(DEVICE(kid->child), scope);
> -    }
> +    qbus_build_aml(bus, scope);
>  }
> =20
>  static void pci_piix3_class_init(ObjectClass *klass, void *data)


