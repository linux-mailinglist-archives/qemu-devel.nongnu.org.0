Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4754F403523
	for <lists+qemu-devel@lfdr.de>; Wed,  8 Sep 2021 09:19:02 +0200 (CEST)
Received: from localhost ([::1]:60734 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mNrrI-0003AX-Kl
	for lists+qemu-devel@lfdr.de; Wed, 08 Sep 2021 03:19:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33442)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1mNroX-0000Yi-Bh
 for qemu-devel@nongnu.org; Wed, 08 Sep 2021 03:16:09 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:56850)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1mNroR-0005DQ-Lr
 for qemu-devel@nongnu.org; Wed, 08 Sep 2021 03:16:08 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1631085362;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=rYNJzjFh8jIWFpD2yeR88/tXIIZPuFUG/CAquxgxKVg=;
 b=HxRO2DXQTTHIYhRZqdR+ZysgvvETa+gL2FRq8mT86xT7FAOVE2QJctoi6nmVqZda5fv3A1
 mTzwrBx8dWdyXqCD6mp0FmjGUZTKA+8znzbPSVs7f7COnscbAZmVIkFgnIxiHtOAlADL/b
 31jmAv261lVx0l0iOxFFFSOj1+Au6TA=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-588-QwOacO_QNRWRuO-EUSdgbw-1; Wed, 08 Sep 2021 03:16:01 -0400
X-MC-Unique: QwOacO_QNRWRuO-EUSdgbw-1
Received: by mail-ej1-f71.google.com with SMTP id
 gw26-20020a170906f15a00b005c48318c60eso554511ejb.7
 for <qemu-devel@nongnu.org>; Wed, 08 Sep 2021 00:16:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=+HK4DwjshowkvDWESjpm/l2pWLn+JpLdOS6SO9jRqCE=;
 b=UPM5GyFt1010VEvMPLyrtwfpzf4tdfuM1zMRU74qkOfXtN2oNbGTK+3264oEkQES0a
 x64kj51hYuWjT2Z6Jdxi5yGnWH+Y0cT2v4zDVznrUOmr3GUxVXOBVUJBw51r00NezgWO
 znAxWTkmclOMD2L01BbeqI7P0tEs/sUQIxhplNJP3bvEZDJZ/EmaaWkASYgPAVpLXBSs
 qLNjnM0hRjWAlCdjW+aisX0ec7ot50FHaVjHfxk9uFqDUINxz6ZkE+lp1a06Ltt8UMr3
 Bi5cD7jcPRyQCg2wQ3aq9GneSjdft7q3D52kcu44levWuDt3x2fBwdt060aYtIyZjoMx
 xTnA==
X-Gm-Message-State: AOAM531pjGLGyPZZjZeZm3iRNIuK8t+RqNx5VsZcBoOtWjhdRSKyZQ5Y
 LF5qEOjhn6u9ddsz7N/ZG8mMzfvIpaJuDsoXZ7kkwuWIiK5TLhJWNJR2hsY5Kmd8tCrvVbgwj8W
 v3sYGEZ/flF+JvLo=
X-Received: by 2002:a17:906:4452:: with SMTP id
 i18mr2436760ejp.374.1631085360659; 
 Wed, 08 Sep 2021 00:16:00 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwrG5DTIEwzreRMtvFeYld02StyAkQBf7HrXG+WaCpfBSAW/6yOTtXFTTw6uDO+8Svo6d2JUw==
X-Received: by 2002:a17:906:4452:: with SMTP id
 i18mr2436690ejp.374.1631085360239; 
 Wed, 08 Sep 2021 00:16:00 -0700 (PDT)
Received: from localhost (nat-pool-brq-t.redhat.com. [213.175.37.10])
 by smtp.gmail.com with ESMTPSA id qq16sm506918ejb.120.2021.09.08.00.15.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 08 Sep 2021 00:15:59 -0700 (PDT)
Date: Wed, 8 Sep 2021 09:15:58 +0200
From: Igor Mammedov <imammedo@redhat.com>
To: Philippe =?UTF-8?B?TWF0aGlldS1EYXVkw6k=?= <philmd@redhat.com>
Subject: Re: [PATCH 08/28] hw/acpi: Avoid truncating acpi_data_len() to 32-bit
Message-ID: <20210908091558.0a00cd02@redhat.com>
In-Reply-To: <20210903110702.588291-9-philmd@redhat.com>
References: <20210903110702.588291-1-philmd@redhat.com>
 <20210903110702.588291-9-philmd@redhat.com>
X-Mailer: Claws Mail 3.18.0 (GTK+ 2.24.33; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=imammedo@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.133.124; envelope-from=imammedo@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.391,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

On Fri,  3 Sep 2021 13:06:42 +0200
Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com> wrote:

> acpi_data_len() returns an unsigned type, which might be bigger
> than 32-bit (although it is unlikely such value is returned).
> Hold the returned value in an 'unsigned' type to avoid unlikely
> size truncation.
>=20
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>

Acked-by: Igor Mammedov <imammedo@redhat.com>

> ---
>  hw/arm/virt-acpi-build.c | 2 +-
>  hw/i386/acpi-build.c     | 4 ++--
>  2 files changed, 3 insertions(+), 3 deletions(-)
>=20
> diff --git a/hw/arm/virt-acpi-build.c b/hw/arm/virt-acpi-build.c
> index 037cc1fd82c..95543d43e2a 100644
> --- a/hw/arm/virt-acpi-build.c
> +++ b/hw/arm/virt-acpi-build.c
> @@ -885,7 +885,7 @@ void virt_acpi_build(VirtMachineState *vms, AcpiBuild=
Tables *tables)
> =20
>  static void acpi_ram_update(MemoryRegion *mr, GArray *data)
>  {
> -    uint32_t size =3D acpi_data_len(data);
> +    unsigned size =3D acpi_data_len(data);
> =20
>      /* Make sure RAM size is correct - in case it got changed
>       * e.g. by migration */
> diff --git a/hw/i386/acpi-build.c b/hw/i386/acpi-build.c
> index a33ac8b91e1..aa269914b49 100644
> --- a/hw/i386/acpi-build.c
> +++ b/hw/i386/acpi-build.c
> @@ -2660,7 +2660,7 @@ void acpi_build(AcpiBuildTables *tables, MachineSta=
te *machine)
> =20
>  static void acpi_ram_update(MemoryRegion *mr, GArray *data)
>  {
> -    uint32_t size =3D acpi_data_len(data);
> +    unsigned size =3D acpi_data_len(data);
> =20
>      /* Make sure RAM size is correct - in case it got changed e.g. by mi=
gration */
>      memory_region_ram_resize(mr, size, &error_abort);
> @@ -2783,7 +2783,7 @@ void acpi_setup(void)
>           * Though RSDP is small, its contents isn't immutable, so
>           * we'll update it along with the rest of tables on guest access=
.
>           */
> -        uint32_t rsdp_size =3D acpi_data_len(tables.rsdp);
> +        unsigned rsdp_size =3D acpi_data_len(tables.rsdp);
> =20
>          build_state->rsdp =3D g_memdup(tables.rsdp->data, rsdp_size);
>          fw_cfg_add_file_callback(x86ms->fw_cfg, ACPI_BUILD_RSDP_FILE,


