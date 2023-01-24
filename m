Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AA90D679E31
	for <lists+qemu-devel@lfdr.de>; Tue, 24 Jan 2023 17:07:25 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pKLo3-0007Ep-OS; Tue, 24 Jan 2023 11:05:55 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1pKLnz-0007Cc-QI
 for qemu-devel@nongnu.org; Tue, 24 Jan 2023 11:05:51 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1pKLnx-0002of-R0
 for qemu-devel@nongnu.org; Tue, 24 Jan 2023 11:05:51 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1674576349;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=u8Z4lzjFZdQvs6PtQvM4HEy07Fz5hNTy9HSrxDKdTBg=;
 b=LHiXkp4yBRTvI0lyi56NMkZbwbw7ed00SnRYWm9NajK6xh47sqppwqT0gpuYL7GpAuERpV
 3qQDNtchrCqXWEYsJuaz3sPmPl7FcTWmlrvHwTlSO5/eUaJuHkgIoT53yvBUMotWNaHuWb
 /cugdEdAkRAiIVfNpzJiMcAxoUpjySw=
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-296-FZBq_dmLMSiWFtr9nDsAow-1; Tue, 24 Jan 2023 11:05:46 -0500
X-MC-Unique: FZBq_dmLMSiWFtr9nDsAow-1
Received: by mail-ej1-f69.google.com with SMTP id
 xj11-20020a170906db0b00b0077b6ecb23fcso10157927ejb.5
 for <qemu-devel@nongnu.org>; Tue, 24 Jan 2023 08:05:43 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=u8Z4lzjFZdQvs6PtQvM4HEy07Fz5hNTy9HSrxDKdTBg=;
 b=cmsOCIPjhSB0lGBNE+eOGQX0tX35SvAY66+vYBCN6b5MULeZefrbjKqZEp3iHgDWYD
 kFqgTSv2rp59zB0vfvhqAVahSmFy03dyplVX+V/tMd8P8hR9REzNZE7cyK4FCxI1TWu+
 tMdv2kfTo0JyyYSG+8alO4OKgN7uF2uJY4TXUY8EVsdYuV9zf9V8Y29pH9kpdFmJBXj8
 gbtS3AwlWInbg9UXbKYGxhXIyXdYCP3QyoV54WE6LqR/igEzVg7MiK6/zw8RgU/fXOrA
 HzZsyDHYPgsLbHsgugpwzBrCbrAoOXB2AQewth08BRmozioxfLKdS7a3iIJmn8XpKbhW
 YZhg==
X-Gm-Message-State: AFqh2kp/OWZ7q6ZehVdJQoW5ZkNvh97rp0ZjvnxBVxDVV3Lh/uqJZ0R/
 ZhF89HjsbgeQSJYUcX7z/4HK9H/MzZPTXs5OrBbA2y0pqoMtym1M1Ud3/pQFnbPufn4DdkBMDs3
 m6EY5QU/Z/07hkcw=
X-Received: by 2002:a17:906:4ed9:b0:7c1:7145:5b3c with SMTP id
 i25-20020a1709064ed900b007c171455b3cmr31081612ejv.46.1674576342012; 
 Tue, 24 Jan 2023 08:05:42 -0800 (PST)
X-Google-Smtp-Source: AMrXdXve4YnS/OAdLW+F3Z19MlmoSq78ERWAuncuBEOkEn5D9a1q1/4V77uSv0VOPxDUrZYuAbisvw==
X-Received: by 2002:a17:906:4ed9:b0:7c1:7145:5b3c with SMTP id
 i25-20020a1709064ed900b007c171455b3cmr31081586ejv.46.1674576341747; 
 Tue, 24 Jan 2023 08:05:41 -0800 (PST)
Received: from imammedo.users.ipa.redhat.com (nat-pool-brq-t.redhat.com.
 [213.175.37.10]) by smtp.gmail.com with ESMTPSA id
 p4-20020a056402044400b0048ecd372fc9sm1223166edw.2.2023.01.24.08.05.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 24 Jan 2023 08:05:41 -0800 (PST)
Date: Tue, 24 Jan 2023 17:05:40 +0100
From: Igor Mammedov <imammedo@redhat.com>
To: Bernhard Beschow <shentey@gmail.com>
Cc: Philippe =?UTF-8?B?TWF0aGlldS1EYXVkw6k=?= <philmd@linaro.org>,
 qemu-devel@nongnu.org, Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Eduardo Habkost <eduardo@habkost.net>, Marcel Apfelbaum
 <marcel.apfelbaum@gmail.com>, Ani Sinha <ani@anisinha.ca>, "Michael S.
 Tsirkin" <mst@redhat.com>, Aurelien Jarno <aurelien@aurel32.net>
Subject: Re: [PATCH 3/7] hw/acpi/{ich9,piix4}: Resolve redundant io_base
 address attributes
Message-ID: <20230124170540.3995c49c@imammedo.users.ipa.redhat.com>
In-Reply-To: <8BFD0F5A-088F-4A17-8998-E9C618558FF6@gmail.com>
References: <20230122170724.21868-1-shentey@gmail.com>
 <20230122170724.21868-4-shentey@gmail.com>
 <c38c9c94-b629-0cdd-acd9-ac800ff9da8d@linaro.org>
 <8BFD0F5A-088F-4A17-8998-E9C618558FF6@gmail.com>
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

s/resolve/remove|drop/

On Mon, 23 Jan 2023 15:49:29 +0000
Bernhard Beschow <shentey@gmail.com> wrote:

> Am 23. Januar 2023 07:57:08 UTC schrieb "Philippe Mathieu-Daud=C3=A9" <ph=
ilmd@linaro.org>:
> >Hi Bernhard,
> >
> >On 22/1/23 18:07, Bernhard Beschow wrote: =20
> >> A MemoryRegion has an addr attribute which gets set to the same values
> >> as the redundant io_addr attributes.


MemoryRegion::addr is an offset within subregion while fields you
are removing are absolute values (offset within address space).

Assuming that the former is the same as the later seems wrong
to me (even if they both match at the moment).
So I'd drop this patch.


> >> Signed-off-by: Bernhard Beschow <shentey@gmail.com>
> >> ---
> >>   include/hw/acpi/ich9.h  |  1 -
> >>   include/hw/acpi/piix4.h |  2 --
> >>   hw/acpi/ich9.c          | 17 ++++++++---------
> >>   hw/acpi/piix4.c         | 11 ++++++-----
> >>   4 files changed, 14 insertions(+), 17 deletions(-) =20
> > =20
> >> diff --git a/hw/acpi/piix4.c b/hw/acpi/piix4.c
> >> index 370b34eacf..2e9bc63fca 100644
> >> --- a/hw/acpi/piix4.c
> >> +++ b/hw/acpi/piix4.c
> >> @@ -91,13 +91,14 @@ static void apm_ctrl_changed(uint32_t val, void *a=
rg)
> >>   static void pm_io_space_update(PIIX4PMState *s)
> >>   {
> >>       PCIDevice *d =3D PCI_DEVICE(s);
> >> +    uint32_t io_base;
> >>   -    s->io_base =3D le32_to_cpu(*(uint32_t *)(d->config + 0x40));
> >> -    s->io_base &=3D 0xffc0;
> >> +    io_base =3D le32_to_cpu(*(uint32_t *)(d->config + 0x40));
> >> +    io_base &=3D 0xffc0;
> >>         memory_region_transaction_begin();
> >>       memory_region_set_enabled(&s->io, d->config[0x80] & 1);
> >> -    memory_region_set_address(&s->io, s->io_base);
> >> +    memory_region_set_address(&s->io, io_base); =20
> >
> >OK for this part.
> > =20
> >>       memory_region_transaction_commit();
> >>   }
> >>   @@ -433,8 +434,8 @@ static void piix4_pm_add_properties(PIIX4PMState=
 *s)
> >>                                     &s->ar.gpe.len, OBJ_PROP_FLAG_READ=
);
> >>       object_property_add_uint16_ptr(OBJECT(s), ACPI_PM_PROP_SCI_INT,
> >>                                     &sci_int, OBJ_PROP_FLAG_READ);
> >> -    object_property_add_uint32_ptr(OBJECT(s), ACPI_PM_PROP_PM_IO_BASE,
> >> -                                  &s->io_base, OBJ_PROP_FLAG_READ);
> >> +    object_property_add_uint64_ptr(OBJECT(s), ACPI_PM_PROP_PM_IO_BASE,
> >> +                                   &s->io.addr, OBJ_PROP_FLAG_READ); =
=20
> >
> >+Eduardo/Mark
> >
> >We shouldn't do that IMO, because we access an internal field from
> >another QOM object.
> >
> >We can however alias the MR property:
> >
> >  object_property_add_alias(OBJECT(s), ACPI_PM_PROP_PM_IO_BASE,
> >                            OBJECT(&s->io), "addr"); =20

also, do not access 'io.addr' directly elsewhere in the patch either.

>=20
> Indeed! And the "addr" property is already read-only -- which seems like =
a good fit.
>=20
> > =20
> >>   } =20
>=20


