Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E11E40352C
	for <lists+qemu-devel@lfdr.de>; Wed,  8 Sep 2021 09:19:49 +0200 (CEST)
Received: from localhost ([::1]:35618 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mNrs4-0005H9-8R
	for lists+qemu-devel@lfdr.de; Wed, 08 Sep 2021 03:19:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33622)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1mNrp1-0000vC-Hv
 for qemu-devel@nongnu.org; Wed, 08 Sep 2021 03:16:43 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:59277)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1mNrox-0005iy-FT
 for qemu-devel@nongnu.org; Wed, 08 Sep 2021 03:16:38 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1631085394;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=6GDyXJ2SB7V/5WdoqQgmGo1qN+H2yQzdy99/HnZTZFI=;
 b=eWprgtWD2CQkUj4bBj2dYPqvDmJnNRFVDErykzHUM3Q4PS7NqjmMLtrihYSJejGGzcEVKa
 KFSqZfVinBn/+kqCyYNOldiwgSK8OuAM6OFsaDpd239A5AqTC+5KHO9BwWSk7ywwa9dPUu
 HqyT2GBTAv5n2A1A7helmkvvOYuyD28=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-597-64nybcYAPwa8yImuJnwNlg-1; Wed, 08 Sep 2021 03:16:32 -0400
X-MC-Unique: 64nybcYAPwa8yImuJnwNlg-1
Received: by mail-ed1-f72.google.com with SMTP id
 v13-20020a056402174d00b003c25d6b2f13so622501edx.4
 for <qemu-devel@nongnu.org>; Wed, 08 Sep 2021 00:16:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=6GDyXJ2SB7V/5WdoqQgmGo1qN+H2yQzdy99/HnZTZFI=;
 b=AuTjVKMJI7Qhbn9QjdTF47ETz+7toTMgHJOSBtOUdDqRJ517riVYflgTZoBmC2b0A5
 2iGQeXHV9UHLetVXqEZxhUUhmQIMyOoLHP9zLLWQ6X1jHR3b/3lc6IY4MBU6GV40km3Y
 W2wz2FPfq/CTwlWT7u1DXbidOKzfNbDxO0lwSrPibRQBfQMCH+S9oujfehL2LBnWop5R
 Ie7GqcUninaqainFU66KZUQQzU8DOwdr2xN0LHv8O2axiiLqqywdFonBfpiVsZ8AFWt4
 0AwTOFCwraS61zMFvs+WbFuUOzc2UywfJikw939hrko1aztGr+M9uBzx42eWweLoz0QS
 ZULw==
X-Gm-Message-State: AOAM533GgkbJ5CUWhvsQIdZPZP4wsQZYfaduvJDljsc1ycdsvAj979M2
 uDL34IkHXjhvw0MeSuWtGswNr8zPz0gcBkoYw7Y1B3uBj6nGdnCxRwooz722k2mNTpRylKWKPoV
 ytqa3UUgtywFdyro=
X-Received: by 2002:aa7:d601:: with SMTP id c1mr2346080edr.143.1631085391018; 
 Wed, 08 Sep 2021 00:16:31 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxY81tlsZjVwIAyTaqOCOorA5wDSELu+yPVBJv7Jul5m03BFDRvbAK1lTZToqv8r+0KrYJczg==
X-Received: by 2002:aa7:d601:: with SMTP id c1mr2346042edr.143.1631085390807; 
 Wed, 08 Sep 2021 00:16:30 -0700 (PDT)
Received: from localhost (nat-pool-brq-t.redhat.com. [213.175.37.10])
 by smtp.gmail.com with ESMTPSA id bm26sm514736ejb.16.2021.09.08.00.16.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 08 Sep 2021 00:16:30 -0700 (PDT)
Date: Wed, 8 Sep 2021 09:16:28 +0200
From: Igor Mammedov <imammedo@redhat.com>
To: Philippe =?UTF-8?B?TWF0aGlldS1EYXVkw6k=?= <philmd@redhat.com>
Subject: Re: [PATCH 09/28] hw/acpi: Replace g_memdup() by g_memdup2_qemu()
Message-ID: <20210908091628.3f08afa3@redhat.com>
In-Reply-To: <20210903110702.588291-10-philmd@redhat.com>
References: <20210903110702.588291-1-philmd@redhat.com>
 <20210903110702.588291-10-philmd@redhat.com>
X-Mailer: Claws Mail 3.18.0 (GTK+ 2.24.33; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=imammedo@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=216.205.24.124; envelope-from=imammedo@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.391,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Fam Zheng <fam@euphon.net>, Peter Maydell <peter.maydell@linaro.org>,
 Li Zhijian <lizhijian@cn.fujitsu.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Jason Wang <jasowang@redhat.com>,
 Christian Schoenebeck <qemu_oss@crudebyte.com>, qemu-devel@nongnu.org,
 Peter Xu <peterx@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>,
 Alexandre Iooss <erdnaxe@crans.org>, Eric Blake <eblake@redhat.com>,
 qemu-block@nongnu.org, Zhang Chen <chen.zhang@intel.com>,
 Alex =?UTF-8?B?QmVubsOpZQ==?= <alex.bennee@linaro.org>,
 Helge Deller <deller@gmx.de>, David Hildenbrand <david@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, "Gonglei
 \(Arei\)" <arei.gonglei@huawei.com>, Stefan Weil <sw@weilnetz.de>,
 Laurent Vivier <lvivier@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, Michael Roth <michael.roth@amd.com>,
 Richard Henderson <richard.henderson@linaro.org>, Greg Kurz <groug@kaod.org>,
 Yuval Shaia <yuval.shaia.ml@gmail.com>,
 Alex Williamson <alex.williamson@redhat.com>, qemu-arm@nongnu.org,
 John Snow <jsnow@redhat.com>, David Gibson <david@gibson.dropbear.id.au>,
 Kevin Wolf <kwolf@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 Laurent Vivier <laurent@vivier.eu>, Shannon Zhao <shannon.zhaosl@gmail.com>,
 Hanna Reitz <hreitz@redhat.com>, qemu-ppc@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>, Mahmoud Mandour <ma.mandourr@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri,  3 Sep 2021 13:06:43 +0200
Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com> wrote:

> Per https://discourse.gnome.org/t/port-your-module-from-g-memdup-to-g-mem=
dup2-now/5538
>=20
>   The old API took the size of the memory to duplicate as a guint,
>   whereas most memory functions take memory sizes as a gsize. This
>   made it easy to accidentally pass a gsize to g_memdup(). For large
>   values, that would lead to a silent truncation of the size from 64
>   to 32 bits, and result in a heap area being returned which is
>   significantly smaller than what the caller expects. This can likely
>   be exploited in various modules to cause a heap buffer overflow.
>=20
> Replace g_memdup() by the safer g_memdup2_qemu() wrapper.
>=20
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>

Acked-by: Igor Mammedov <imammedo@redhat.com>


> ---
>  hw/acpi/core.c       | 3 ++-
>  hw/i386/acpi-build.c | 2 +-
>  2 files changed, 3 insertions(+), 2 deletions(-)
>=20
> diff --git a/hw/acpi/core.c b/hw/acpi/core.c
> index 1e004d0078d..9dd2cf09a0b 100644
> --- a/hw/acpi/core.c
> +++ b/hw/acpi/core.c
> @@ -637,7 +637,8 @@ void acpi_pm1_cnt_init(ACPIREGS *ar, MemoryRegion *pa=
rent,
>          suspend[3] =3D 1 | ((!disable_s3) << 7);
>          suspend[4] =3D s4_val | ((!disable_s4) << 7);
> =20
> -        fw_cfg_add_file(fw_cfg, "etc/system-states", g_memdup(suspend, 6=
), 6);
> +        fw_cfg_add_file(fw_cfg, "etc/system-states",
> +                        g_memdup2_qemu(suspend, 6), 6);
>      }
>  }
> =20
> diff --git a/hw/i386/acpi-build.c b/hw/i386/acpi-build.c
> index aa269914b49..54494ca1f65 100644
> --- a/hw/i386/acpi-build.c
> +++ b/hw/i386/acpi-build.c
> @@ -2785,7 +2785,7 @@ void acpi_setup(void)
>           */
>          unsigned rsdp_size =3D acpi_data_len(tables.rsdp);
> =20
> -        build_state->rsdp =3D g_memdup(tables.rsdp->data, rsdp_size);
> +        build_state->rsdp =3D g_memdup2_qemu(tables.rsdp->data, rsdp_siz=
e);
>          fw_cfg_add_file_callback(x86ms->fw_cfg, ACPI_BUILD_RSDP_FILE,
>                                   acpi_build_update, NULL, build_state,
>                                   build_state->rsdp, rsdp_size, true);


