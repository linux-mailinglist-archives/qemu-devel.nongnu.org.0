Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CD3204E3D81
	for <lists+qemu-devel@lfdr.de>; Tue, 22 Mar 2022 12:23:41 +0100 (CET)
Received: from localhost ([::1]:56394 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nWcc0-0005Yc-GQ
	for lists+qemu-devel@lfdr.de; Tue, 22 Mar 2022 07:23:40 -0400
Received: from eggs.gnu.org ([209.51.188.92]:50180)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1nWca1-0003rb-IW
 for qemu-devel@nongnu.org; Tue, 22 Mar 2022 07:21:37 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:26679)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1nWcZy-0007IB-0V
 for qemu-devel@nongnu.org; Tue, 22 Mar 2022 07:21:37 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1647948089;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=sI/gJK8PHjVhsB9l+0a1Cbfqayf1bW3iE9HELjmMQqg=;
 b=Wg7np52ZXYBwDiIXbHtAA3ixJ6zTtwLnuAXJBZO2wD9FyehpYHE6oFSkYicNdaKrxU4b2f
 xiHcF0n/MjUj5r6HLxmij1XMOWR4xaeunvM0w0CPUUAaP4M4SzZ74wZWqXzZv80AhAw54F
 8Ax8P0EqR9I/qaiPe4mygtqaLwyuGwo=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-655-dUsRRlrtNCqSB2GCkDO8og-1; Tue, 22 Mar 2022 07:21:28 -0400
X-MC-Unique: dUsRRlrtNCqSB2GCkDO8og-1
Received: by mail-ed1-f71.google.com with SMTP id
 v15-20020a50f08f000000b0041902200ab4so7551694edl.22
 for <qemu-devel@nongnu.org>; Tue, 22 Mar 2022 04:21:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Bx3w8/lhlewJ7oUWvr/1eh6laDl4Abf2g0d4r2c9J7s=;
 b=VdlI8qTuRC3KCdz5SpnyJqUH3WKEJNw18jxCvWvF/zrfBAR2JfpBSz2U+EwxBuwZRT
 56DlVHzDwpnsEfdQIxJOx6veykdNL3bha86j15tj/y06oF62sKlugwsjqTRnOsKVqfkQ
 2/JFefO1VrEbhHfQMnB6FIYYqkeSZOsqZKo22rH9L8smSM9XZ6XTVSoTwRoL8Jihdlvi
 nRidUCrom03zZby+VCTxAHRGPP47fGYU6eOL3CU2dDKJwRrSTjpbms3KJRWYNcu5p9Ge
 lpWh0XcW1sCCSGrFsPwTT9vAPBeQDND8TntlpTGPYqexl3U3PH8KHZ8gMr+sJ28qe+ya
 Zadw==
X-Gm-Message-State: AOAM530+C4loPW/s5QsR7FGvKMrnxARD0OXH94n1nYUJuONrZPTQlfPr
 YAxmlPvg5uHXhihkp9DWIX9rfUt7MeFNc0aBgv8yDh3HDbyzHsqsmUJa/GCbXL5fQhJ3IZmGP7n
 DhX/Sjem2/JvF1LM=
X-Received: by 2002:a05:6402:5243:b0:419:4ce2:cb5c with SMTP id
 t3-20020a056402524300b004194ce2cb5cmr6931877edd.151.1647948087486; 
 Tue, 22 Mar 2022 04:21:27 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyiCZtBiS5tBYkHXW9CYVzlZ6xWEpBQiuxdMrs5J8/gCaIPyAwbOSsr9vx7UIAZ7GGLmjEZiA==
X-Received: by 2002:a05:6402:5243:b0:419:4ce2:cb5c with SMTP id
 t3-20020a056402524300b004194ce2cb5cmr6931812edd.151.1647948087187; 
 Tue, 22 Mar 2022 04:21:27 -0700 (PDT)
Received: from localhost (nat-pool-brq-t.redhat.com. [213.175.37.10])
 by smtp.gmail.com with ESMTPSA id
 hs12-20020a1709073e8c00b006dfd7dee980sm4080173ejc.30.2022.03.22.04.21.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 22 Mar 2022 04:21:26 -0700 (PDT)
Date: Tue, 22 Mar 2022 12:21:24 +0100
From: Igor Mammedov <imammedo@redhat.com>
To: Markus Armbruster <armbru@redhat.com>
Subject: Re: [PATCH v2 3/3] Use g_new() & friends where that makes obvious
 sense
Message-ID: <20220322122124.4f1d76e9@redhat.com>
In-Reply-To: <20220315144156.1595462-4-armbru@redhat.com>
References: <20220315144156.1595462-1-armbru@redhat.com>
 <20220315144156.1595462-4-armbru@redhat.com>
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
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Daniel Henrique Barboza <danielhb413@gmail.com>, kvm@vger.kernel.org,
 "Michael S. Tsirkin" <mst@redhat.com>, Jason Wang <jasowang@redhat.com>,
 Christian Schoenebeck <qemu_oss@crudebyte.com>, qemu-devel@nongnu.org,
 Peter Xu <peterx@redhat.com>, Klaus Jensen <its@irrelevant.dk>,
 KONRAD Frederic <frederic.konrad@adacore.com>,
 Konstantin Kostiuk <kkostiuk@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>,
 Ani Sinha <ani@anisinha.ca>, Reinoud Zandijk <reinoud@netbsd.org>,
 Eric Blake <eblake@redhat.com>, Sunil Muthuswamy <sunilmut@microsoft.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Yoshinori Sato <ysato@users.sourceforge.jp>,
 Juan Quintela <quintela@redhat.com>, John Snow <jsnow@redhat.com>,
 Paul Durrant <paul@xen.org>, Magnus Damm <magnus.damm@gmail.com>,
 Kamil Rytarowski <kamil@netbsd.org>,
 "Gonglei \(Arei\)" <arei.gonglei@huawei.com>,
 =?UTF-8?B?SGVydsOp?= Poussineau <hpoussin@reactos.org>,
 Michael Roth <michael.roth@amd.com>,
 Anthony Perard <anthony.perard@citrix.com>,
 =?UTF-8?B?TWFyYy1BbmRyw6k=?= Lureau <marcandre.lureau@redhat.com>,
 Artyom Tarasenko <atar4qemu@gmail.com>, Laurent Vivier <lvivier@redhat.com>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>, Amit Shah <amit@kernel.org>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>, haxm-team@intel.com,
 Richard Henderson <richard.henderson@linaro.org>, Greg Kurz <groug@kaod.org>,
 Fabien Chouteau <chouteau@adacore.com>, Yuval Shaia <yuval.shaia.ml@gmail.com>,
 Thomas Huth <thuth@redhat.com>, Eric Auger <eric.auger@redhat.com>,
 Alex Williamson <alex.williamson@redhat.com>, qemu-arm@nongnu.org,
 =?UTF-8?B?Q8Op?= =?UTF-8?B?ZHJpYw==?= Le Goater <clg@kaod.org>,
 Pavel Dovgalyuk <pavel.dovgaluk@ispras.ru>, xen-devel@lists.xenproject.org,
 Keith Busch <kbusch@kernel.org>, qemu-ppc@nongnu.org,
 David Hildenbrand <david@redhat.com>,
 Alex =?UTF-8?B?QmVubsOpZQ==?= <alex.bennee@linaro.org>,
 David Gibson <david@gibson.dropbear.id.au>,
 Eduardo Habkost <eduardo@habkost.net>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 "Daniel P. =?UTF-8?B?QmVycmFuZ8Op?=" <berrange@redhat.com>,
 qemu-block@nongnu.org, Max Filippov <jcmvbkbc@gmail.com>,
 qemu-s390x@nongnu.org, Patrick Venture <venture@google.com>,
 Cornelia Huck <cohuck@redhat.com>,
 Philippe =?UTF-8?B?TWF0aGlldS1EYXVkw6k=?= <f4bug@amsat.org>,
 Jean-Christophe Dubois <jcd@tribudubois.net>,
 Corey Minyard <cminyard@mvista.com>, Wenchao Wang <wenchao.wang@intel.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, 15 Mar 2022 15:41:56 +0100
Markus Armbruster <armbru@redhat.com> wrote:

> g_new(T, n) is neater than g_malloc(sizeof(T) * n).  It's also safer,
> for two reasons.  One, it catches multiplication overflowing size_t.
> Two, it returns T * rather than void *, which lets the compiler catch
> more type errors.
>=20
> This commit only touches allocations with size arguments of the form
> sizeof(T).
>=20
> Patch created mechanically with:
>=20
>     $ spatch --in-place --sp-file scripts/coccinelle/use-g_new-etc.cocci =
\
> =09     --macro-file scripts/cocci-macro-file.h FILES...
>=20
> Signed-off-by: Markus Armbruster <armbru@redhat.com>
> Reviewed-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
> Reviewed-by: C=C3=A9dric Le Goater <clg@kaod.org>
> Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
> Acked-by: Dr. David Alan Gilbert <dgilbert@redhat.com>


for */i386/*
Reviewed-by: Igor Mammedov <imammedo@redhat.com>


nit:
possible miss, see below=20

[...]
> diff --git a/hw/i386/xen/xen-hvm.c b/hw/i386/xen/xen-hvm.c
> index cf8e500514..0731f70410 100644
> --- a/hw/i386/xen/xen-hvm.c
> +++ b/hw/i386/xen/xen-hvm.c

missed:

 pfn_list =3D g_malloc(sizeof (*pfn_list) * nr_pfn);


> @@ -396,7 +396,7 @@ go_physmap:
> =20
>      mr_name =3D memory_region_name(mr);
> =20
> -    physmap =3D g_malloc(sizeof(XenPhysmap));
> +    physmap =3D g_new(XenPhysmap, 1);
> =20
>      physmap->start_addr =3D start_addr;
>      physmap->size =3D size;
> @@ -1281,7 +1281,7 @@ static void xen_read_physmap(XenIOState *state)
>          return;
> =20
>      for (i =3D 0; i < num; i++) {
> -        physmap =3D g_malloc(sizeof (XenPhysmap));
> +        physmap =3D g_new(XenPhysmap, 1);
>          physmap->phys_offset =3D strtoull(entries[i], NULL, 16);
>          snprintf(path, sizeof(path),
>                  "/local/domain/0/device-model/%d/physmap/%s/start_addr",
> @@ -1410,7 +1410,7 @@ void xen_hvm_init_pc(PCMachineState *pcms, MemoryRe=
gion **ram_memory)
>      xen_pfn_t ioreq_pfn;
>      XenIOState *state;
> =20
> -    state =3D g_malloc0(sizeof (XenIOState));
> +    state =3D g_new0(XenIOState, 1);
> =20
>      state->xce_handle =3D xenevtchn_open(NULL, 0);
>      if (state->xce_handle =3D=3D NULL) {
> @@ -1463,7 +1463,7 @@ void xen_hvm_init_pc(PCMachineState *pcms, MemoryRe=
gion **ram_memory)
>      }
> =20
>      /* Note: cpus is empty at this point in init */
> -    state->cpu_by_vcpu_id =3D g_malloc0(max_cpus * sizeof(CPUState *));
> +    state->cpu_by_vcpu_id =3D g_new0(CPUState *, max_cpus);
> =20
>      rc =3D xen_set_ioreq_server_state(xen_domid, state->ioservid, true);
>      if (rc < 0) {
> @@ -1472,7 +1472,7 @@ void xen_hvm_init_pc(PCMachineState *pcms, MemoryRe=
gion **ram_memory)
>          goto err;
>      }
> =20
> -    state->ioreq_local_port =3D g_malloc0(max_cpus * sizeof (evtchn_port=
_t));
> +    state->ioreq_local_port =3D g_new0(evtchn_port_t, max_cpus);

[...]


