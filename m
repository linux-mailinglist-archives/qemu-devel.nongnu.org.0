Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C11C169FD3D
	for <lists+qemu-devel@lfdr.de>; Wed, 22 Feb 2023 21:55:46 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pUw97-0001Bx-6g; Wed, 22 Feb 2023 15:55:25 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.williamson@redhat.com>)
 id 1pUw95-0001BW-4I
 for qemu-devel@nongnu.org; Wed, 22 Feb 2023 15:55:23 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.williamson@redhat.com>)
 id 1pUw93-00069M-2H
 for qemu-devel@nongnu.org; Wed, 22 Feb 2023 15:55:22 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1677099319;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=MOCd7U0zYvx4sOO3HXjkG18urbrjYUF/BM9oEiol1oI=;
 b=dl6HPrLf/XkALU3S+JSJ1oJehQAZb0COiu/IoqUSk5X0rgYeJcIqAf8qf96V8ofHBxWyA9
 2MSXq/Tg6tToh/sySz1eGKcIbUlxbYRVzClmYk0pFNHWjXrPro3JE6VFaRT5fGVEDZQK78
 /B8EIEli6SbCvFkLTrST5upKkHS9tbw=
Received: from mail-io1-f72.google.com (mail-io1-f72.google.com
 [209.85.166.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-193-tA83YyAzOxurFtYZ-FOyWA-1; Wed, 22 Feb 2023 15:55:18 -0500
X-MC-Unique: tA83YyAzOxurFtYZ-FOyWA-1
Received: by mail-io1-f72.google.com with SMTP id
 f23-20020a6bdd17000000b00745576ba61cso4718116ioc.18
 for <qemu-devel@nongnu.org>; Wed, 22 Feb 2023 12:55:18 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=MOCd7U0zYvx4sOO3HXjkG18urbrjYUF/BM9oEiol1oI=;
 b=0RmXD1SF5UBgOYyDWxSsfmdkTyjvylBJ4IZiTEKTIz3KKqey6Y/5Sh5zTJowKw8QGr
 bQLBuhardx3MnE8Pa3lhHzrIw9YmA7TjEcIQprqvDLOdLpj+WmsaPFQmAm+vkHHyQ1WE
 RtolSKjxnZSDINyyqN/wzIB3Jhu0VBZO4m6OdmSCOQkH5jxSA8g2NAr3Jnuspjb5tuLK
 /yWr6h8KWtbMN9KouZpmfbngdC5bqT8BOFds48T5bANxF/m1JLnS3Xl+uFKX7YPWUUfK
 wfwDc7t5Nyjn4/FpfEnIvwdXuKohm2F60fBrpfnUigU0AWBmKQHSdYeu7eBi9R9OO8iN
 s/Cg==
X-Gm-Message-State: AO0yUKXMD03ic+JqCIU4pGkDqqISqRE0NI6HQLWdmgWfiYv2XPYxRNeG
 2OtednFb3179dPNa+OIh0azzfq8ou+y9sf0TCZJ8IjdRl4s2GtZ1nM/mrab/pt6l1h5JJdiOuUR
 jQQTd4lDHhjZ85lE=
X-Received: by 2002:a05:6e02:164d:b0:313:d9d7:3cbd with SMTP id
 v13-20020a056e02164d00b00313d9d73cbdmr8049807ilu.10.1677099315275; 
 Wed, 22 Feb 2023 12:55:15 -0800 (PST)
X-Google-Smtp-Source: AK7set+rdvSCvkcbzZB7R4O6326ozmdbwCy915MbuYF0tm2WQv8XLwS+hany8OQY7l0nyssMBbdftA==
X-Received: by 2002:a05:6e02:164d:b0:313:d9d7:3cbd with SMTP id
 v13-20020a056e02164d00b00313d9d73cbdmr8049776ilu.10.1677099315010; 
 Wed, 22 Feb 2023 12:55:15 -0800 (PST)
Received: from redhat.com ([38.15.36.239]) by smtp.gmail.com with ESMTPSA id
 q1-20020a0566380ec100b003a9515b47ebsm3169490jas.68.2023.02.22.12.55.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 22 Feb 2023 12:55:14 -0800 (PST)
Date: Wed, 22 Feb 2023 13:55:12 -0700
From: Alex Williamson <alex.williamson@redhat.com>
To: Avihai Horon <avihaih@nvidia.com>
Cc: <qemu-devel@nongnu.org>, =?UTF-8?B?Q8OpZHJpYw==?= Le Goater
 <clg@redhat.com>, Juan Quintela <quintela@redhat.com>, "Dr. David Alan
 Gilbert" <dgilbert@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Peter Xu <peterx@redhat.com>, "Jason Wang" <jasowang@redhat.com>, Marcel
 Apfelbaum <marcel.apfelbaum@gmail.com>, Paolo Bonzini
 <pbonzini@redhat.com>, Richard Henderson <richard.henderson@linaro.org>,
 Eduardo Habkost <eduardo@habkost.net>, "David Hildenbrand"
 <david@redhat.com>, Philippe =?UTF-8?B?TWF0aGlldS1EYXVkw6k=?=
 <philmd@linaro.org>, Yishai Hadas <yishaih@nvidia.com>, Jason Gunthorpe
 <jgg@nvidia.com>, Maor Gottlieb <maorg@nvidia.com>, Kirti Wankhede
 <kwankhede@nvidia.com>, Tarun Gupta <targupta@nvidia.com>, Joao Martins
 <joao.m.martins@oracle.com>
Subject: Re: [PATCH v2 00/20] vfio: Add migration pre-copy support and
 device dirty tracking
Message-ID: <20230222135512.51b62650.alex.williamson@redhat.com>
In-Reply-To: <20230222174915.5647-1-avihaih@nvidia.com>
References: <20230222174915.5647-1-avihaih@nvidia.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.35; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.129.124;
 envelope-from=alex.williamson@redhat.com;
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


There are various errors running this through the CI on gitlab.

This one seems bogus but needs to be resolved regardless:

https://gitlab.com/alex.williamson/qemu/-/jobs/3817940731
FAILED: libqemu-aarch64-softmmu.fa.p/hw_vfio_common.c.o=20
2786s390x-linux-gnu-gcc -m64 -Ilibqemu-aarch64-softmmu.fa.p -I. -I.. -Itarg=
et/arm -I../target/arm -Iqapi -Itrace -Iui -Iui/shader -I/usr/include/pixma=
n-1 -I/usr/include/capstone -I/usr/include/glib-2.0 -I/usr/lib/s390x-linux-=
gnu/glib-2.0/include -fdiagnostics-color=3Dauto -Wall -Winvalid-pch -Werror=
 -std=3Dgnu11 -O2 -g -isystem /builds/alex.williamson/qemu/linux-headers -i=
system linux-headers -iquote . -iquote /builds/alex.williamson/qemu -iquote=
 /builds/alex.williamson/qemu/include -iquote /builds/alex.williamson/qemu/=
tcg/s390x -pthread -U_FORTIFY_SOURCE -D_FORTIFY_SOURCE=3D2 -D_GNU_SOURCE -D=
_FILE_OFFSET_BITS=3D64 -D_LARGEFILE_SOURCE -fno-strict-aliasing -fno-common=
 -fwrapv -Wundef -Wwrite-strings -Wmissing-prototypes -Wstrict-prototypes -=
Wredundant-decls -Wold-style-declaration -Wold-style-definition -Wtype-limi=
ts -Wformat-security -Wformat-y2k -Winit-self -Wignored-qualifiers -Wempty-=
body -Wnested-externs -Wendif-labels -Wexpansion-to-defined -Wimplicit-fall=
through=3D2 -Wmissing-format-attribute -Wno-missing-include-dirs -Wno-shift=
-negative-value -Wno-psabi -fstack-protector-strong -fPIE -isystem../linux-=
headers -isystemlinux-headers -DNEED_CPU_H '-DCONFIG_TARGET=3D"aarch64-soft=
mmu-config-target.h"' '-DCONFIG_DEVICES=3D"aarch64-softmmu-config-devices.h=
"' -MD -MQ libqemu-aarch64-softmmu.fa.p/hw_vfio_common.c.o -MF libqemu-aarc=
h64-softmmu.fa.p/hw_vfio_common.c.o.d -o libqemu-aarch64-softmmu.fa.p/hw_vf=
io_common.c.o -c ../hw/vfio/common.c
2787../hw/vfio/common.c: In function =E2=80=98vfio_listener_log_global_star=
t=E2=80=99:
2788../hw/vfio/common.c:1772:8: error: =E2=80=98ret=E2=80=99 may be used un=
initialized in this function [-Werror=3Dmaybe-uninitialized]
2789 1772 |     if (ret) {
2790      |        ^

32-bit builds have some actual errors though:

https://gitlab.com/alex.williamson/qemu/-/jobs/3817940719
FAILED: libqemu-aarch64-softmmu.fa.p/hw_vfio_common.c.o=20
2601cc -m32 -Ilibqemu-aarch64-softmmu.fa.p -I. -I.. -Itarget/arm -I../targe=
t/arm -Iqapi -Itrace -Iui -Iui/shader -I/usr/include/pixman-1 -I/usr/includ=
e/glib-2.0 -I/usr/lib/glib-2.0/include -I/usr/include/sysprof-4 -fdiagnosti=
cs-color=3Dauto -Wall -Winvalid-pch -Werror -std=3Dgnu11 -O2 -g -isystem /b=
uilds/alex.williamson/qemu/linux-headers -isystem linux-headers -iquote . -=
iquote /builds/alex.williamson/qemu -iquote /builds/alex.williamson/qemu/in=
clude -iquote /builds/alex.williamson/qemu/tcg/i386 -pthread -U_FORTIFY_SOU=
RCE -D_FORTIFY_SOURCE=3D2 -D_GNU_SOURCE -D_FILE_OFFSET_BITS=3D64 -D_LARGEFI=
LE_SOURCE -fno-strict-aliasing -fno-common -fwrapv -Wundef -Wwrite-strings =
-Wmissing-prototypes -Wstrict-prototypes -Wredundant-decls -Wold-style-decl=
aration -Wold-style-definition -Wtype-limits -Wformat-security -Wformat-y2k=
 -Winit-self -Wignored-qualifiers -Wempty-body -Wnested-externs -Wendif-lab=
els -Wexpansion-to-defined -Wimplicit-fallthrough=3D2 -Wmissing-format-attr=
ibute -Wno-missing-include-dirs -Wno-shift-negative-value -Wno-psabi -fstac=
k-protector-strong -fPIE -isystem../linux-headers -isystemlinux-headers -DN=
EED_CPU_H '-DCONFIG_TARGET=3D"aarch64-softmmu-config-target.h"' '-DCONFIG_D=
EVICES=3D"aarch64-softmmu-config-devices.h"' -MD -MQ libqemu-aarch64-softmm=
u.fa.p/hw_vfio_common.c.o -MF libqemu-aarch64-softmmu.fa.p/hw_vfio_common.c=
.o.d -o libqemu-aarch64-softmmu.fa.p/hw_vfio_common.c.o -c ../hw/vfio/commo=
n.c
2602../hw/vfio/common.c: In function 'vfio_device_feature_dma_logging_start=
_create':
2603../hw/vfio/common.c:1572:27: error: cast from pointer to integer of dif=
ferent size [-Werror=3Dpointer-to-int-cast]
2604 1572 |         control->ranges =3D (uint64_t)ranges;
2605      |                           ^
2606../hw/vfio/common.c:1596:23: error: cast from pointer to integer of dif=
ferent size [-Werror=3Dpointer-to-int-cast]
2607 1596 |     control->ranges =3D (uint64_t)ranges;
2608      |                       ^
2609../hw/vfio/common.c: In function 'vfio_device_feature_dma_logging_start=
_destroy':
2610../hw/vfio/common.c:1620:9: error: cast to pointer from integer of diff=
erent size [-Werror=3Dint-to-pointer-cast]
2611 1620 |         (struct vfio_device_feature_dma_logging_range *)control=
->ranges;
2612      |         ^
2613../hw/vfio/common.c: In function 'vfio_device_dma_logging_report':
2614../hw/vfio/common.c:1810:22: error: cast from pointer to integer of dif=
ferent size [-Werror=3Dpointer-to-int-cast]
2615 1810 |     report->bitmap =3D (uint64_t)bitmap;
2616      |                      ^

Thanks,
Alex


