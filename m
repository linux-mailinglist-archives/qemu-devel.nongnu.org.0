Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 488524ED9C7
	for <lists+qemu-devel@lfdr.de>; Thu, 31 Mar 2022 14:42:58 +0200 (CEST)
Received: from localhost ([::1]:32776 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nZu8e-0004J6-Pl
	for lists+qemu-devel@lfdr.de; Thu, 31 Mar 2022 08:42:56 -0400
Received: from eggs.gnu.org ([209.51.188.92]:58992)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1nZu4h-0002QN-Lv
 for qemu-devel@nongnu.org; Thu, 31 Mar 2022 08:38:51 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:43700)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1nZu4d-0002X2-1W
 for qemu-devel@nongnu.org; Thu, 31 Mar 2022 08:38:49 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1648730325;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ldw0Sb3yzvWIdYBuTiOlhgEMF+36AvHYiDi3gGCHIH4=;
 b=Fjc2iap2IEAfcmFZLKKvsDrbReEyStvAQWH8cR2R7YUNpPIjQhVkXXhgPK/of/ZpzXbJB9
 0jHcv7xeRI27gJV7JhMLbMXfKJZrRKJESil2J+lY3mvemP7Bk4YsjRsSbAvkqald5oPAqa
 UJA97PaFviivFgp1s9PepwtCT1vVnNM=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-439-H6ShKLJaMXy2pCnnnIUzBg-1; Thu, 31 Mar 2022 08:38:44 -0400
X-MC-Unique: H6ShKLJaMXy2pCnnnIUzBg-1
Received: by mail-ed1-f70.google.com with SMTP id
 i4-20020aa7c9c4000000b00419c542270dso9152099edt.8
 for <qemu-devel@nongnu.org>; Thu, 31 Mar 2022 05:38:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=CPaUlqak15OsH/SbLjDlYbQD7WEpuYKqPWLpD5VYfIs=;
 b=DG4HKInB3+PhRFf8CNsRkuBmfDKamQQ3LS+Z2+I2MzMqVoF15w3N5jM98F/qzVI/5j
 Q9cjkOt83k3qLwfeUZ22e3vnpu0IsW+pxbKNKX0CCqkGEiGlM1q1zOG0NOkwZ/AJMlN9
 uO76HKIas/ktLX/klUsePyn0dv5xEqxwK5B7OpVjk4Tx1No2oH8gRc6K0YbYYf6NxNxB
 7gxiNJSzSoGje4jWd71YgeOKyGiC1XjoUuJXPrum/KgCU9Ud+Al0qspO16noB8DFPnbw
 5efMG9ALzX8Gnt8kdn4V7MNvbUE0w/al/obJw/TSHf6oxuaaVtn/dRPV33hIQgVUBjT/
 F9Ag==
X-Gm-Message-State: AOAM5305IqWYoccQ5uyjj4MfnlysSOkO77zVDI0siiAEbnp9MRd5b3vT
 qvnnezdOuW9a1k9Qj1LJJr7lLvfQdcxeo2keJQ63g1LljflnUGAoafv9WsR+U4jZ7wx5JXAZG70
 iJbTrhE+KWfDUavw=
X-Received: by 2002:a17:907:1c82:b0:6e0:acef:d238 with SMTP id
 nb2-20020a1709071c8200b006e0acefd238mr4820589ejc.96.1648730323343; 
 Thu, 31 Mar 2022 05:38:43 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzKcXFy7chkw+y8p9masjR11ftF3SGUj2IQL4+nEjiJe7Cc+VFd9uXfF7nqv92ECZbaOV6AcA==
X-Received: by 2002:a17:907:1c82:b0:6e0:acef:d238 with SMTP id
 nb2-20020a1709071c8200b006e0acefd238mr4820564ejc.96.1648730323082; 
 Thu, 31 Mar 2022 05:38:43 -0700 (PDT)
Received: from localhost (nat-pool-brq-t.redhat.com. [213.175.37.10])
 by smtp.gmail.com with ESMTPSA id
 m17-20020a17090672d100b006df98bb199dsm9383817ejl.129.2022.03.31.05.38.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 31 Mar 2022 05:38:42 -0700 (PDT)
Date: Thu, 31 Mar 2022 14:38:41 +0200
From: Igor Mammedov <imammedo@redhat.com>
To: Lukasz Maniak <lukasz.maniak@linux.intel.com>
Subject: Re: [PATCH v7 12/12] hw/acpi: Make the PCI hot-plug aware of SR-IOV
Message-ID: <20220331143841.55ae9372@redhat.com>
In-Reply-To: <20220318191819.1711831-13-lukasz.maniak@linux.intel.com>
References: <20220318191819.1711831-1-lukasz.maniak@linux.intel.com>
 <20220318191819.1711831-13-lukasz.maniak@linux.intel.com>
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.31; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=imammedo@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.129.124; envelope-from=imammedo@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: fam@euphon.net, kwolf@redhat.com, stefanha@redhat.com,
 qemu-block@nongnu.org, mst@redhat.com, armbru@redhat.com,
 lukasz.gieryk@linux.intel.com, f4bug@amsat.org, qemu-devel@nongnu.org,
 kbusch@kernel.org, its@irrelevant.dk, hreitz@redhat.com, xypron.glpk@gmx.de,
 k.jensen@samsung.com, ani@anisinha.ca
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, 18 Mar 2022 20:18:19 +0100
Lukasz Maniak <lukasz.maniak@linux.intel.com> wrote:

> From: =C5=81ukasz Gieryk <lukasz.gieryk@linux.intel.com>
>=20
> PCI device capable of SR-IOV support is a new, still-experimental
> feature with only a single working example of the Nvme device.
>=20
> This patch in an attempt to fix a double-free problem when a
> SR-IOV-capable Nvme device is hot-unplugged. The problem and the
> reproduction steps can be found in this thread:
>=20
> https://patchew.org/QEMU/20220217174504.1051716-1-lukasz.maniak@linux.int=
el.com/20220217174504.1051716-14-lukasz.maniak@linux.intel.com/

pls include that in patch description.

> Details of the proposed solution are, for convenience, included below.
>=20
> 1) The current SR-IOV implementation assumes it=E2=80=99s the PhysicalFun=
ction
>    that creates and deletes VirtualFunctions.
> 2) It=E2=80=99s a design decision (the Nvme device at least) for the VFs =
to be
>    of the same class as PF. Effectively, they share the dc->hotpluggable
>    value.
> 3) When a VF is created, it=E2=80=99s added as a child node to PF=E2=80=
=99s PCI bus
>    slot.
> 4) Monitor/device_del triggers the ACPI mechanism. The implementation is
>    not aware of SR/IOV and ejects PF=E2=80=99s PCI slot, directly unreali=
zing all
>    hot-pluggable (!acpi_pcihp_pc_no_hotplug) children nodes.
> 5) VFs are unrealized directly, and it doesn=E2=80=99t work well with (1)=
.
>    SR/IOV structures are not updated, so when it=E2=80=99s PF=E2=80=99s t=
urn to be
>    unrealized, it works on stale pointers to already-deleted VFs.
it's unclear what's bing hotpluged and unplugged, it would be better if
you included QEMU CLI and relevan qmp/monito commands to reproduce it.

>=20
> Signed-off-by: =C5=81ukasz Gieryk <lukasz.gieryk@linux.intel.com>
> ---
>  hw/acpi/pcihp.c | 6 +++++-
>  1 file changed, 5 insertions(+), 1 deletion(-)
>=20
> diff --git a/hw/acpi/pcihp.c b/hw/acpi/pcihp.c
> index 6351bd3424d..248839e1110 100644
> --- a/hw/acpi/pcihp.c
> +++ b/hw/acpi/pcihp.c
> @@ -192,8 +192,12 @@ static bool acpi_pcihp_pc_no_hotplug(AcpiPciHpState =
*s, PCIDevice *dev)
>       * ACPI doesn't allow hotplug of bridge devices.  Don't allow
>       * hot-unplug of bridge devices unless they were added by hotplug
>       * (and so, not described by acpi).
> +     *
> +     * Don't allow hot-unplug of SR-IOV Virtual Functions, as they
> +     * will be removed implicitly, when Physical Function is unplugged.
>       */
> -    return (pc->is_bridge && !dev->qdev.hotplugged) || !dc->hotpluggable=
;
> +    return (pc->is_bridge && !dev->qdev.hotplugged) || !dc->hotpluggable=
 ||
> +           pci_is_vf(dev);
>  }
> =20
>  static void acpi_pcihp_eject_slot(AcpiPciHpState *s, unsigned bsel, unsi=
gned slots)


