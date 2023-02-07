Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E787D68DDEF
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Feb 2023 17:28:16 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pPQoL-0007Fk-Ol; Tue, 07 Feb 2023 11:27:13 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kkostiuk@redhat.com>)
 id 1pPQoI-0007FM-2k
 for qemu-devel@nongnu.org; Tue, 07 Feb 2023 11:27:10 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kkostiuk@redhat.com>)
 id 1pPQoG-0006uf-Am
 for qemu-devel@nongnu.org; Tue, 07 Feb 2023 11:27:09 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1675787227;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=xgzi1i9Flj/VJ8VZe3ASjzFUld0AZZ9EfQmV99wmEYE=;
 b=STWVcWNS3eFKyCFvuh31KGeuNFxo3ciA7CTNgp7kDMXQGVRuBxjg7PF2/l2j3J1rgurZii
 0T0PQcPtBQ0yqehLR+cOc89EO28I3//wXtw2ofjBtnJkiVsqjlnRDQAHQ7ZXB6n29H0LdE
 wXgSxVQYFrNZiLe1O5aGyOIfY1JWrSg=
Received: from mail-vs1-f69.google.com (mail-vs1-f69.google.com
 [209.85.217.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-112-DRANZKikMdyUII7ydLCEUQ-1; Tue, 07 Feb 2023 11:27:03 -0500
X-MC-Unique: DRANZKikMdyUII7ydLCEUQ-1
Received: by mail-vs1-f69.google.com with SMTP id
 c7-20020a67ce87000000b00411a72f959fso247522vse.19
 for <qemu-devel@nongnu.org>; Tue, 07 Feb 2023 08:27:02 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=xgzi1i9Flj/VJ8VZe3ASjzFUld0AZZ9EfQmV99wmEYE=;
 b=EL7gKf4HByCoYmr5/vygWnJ3x2bb0/oUPN3hAz5x1tsj+fOpfjSTIJdwdQWTv1Eqz7
 b1dS8zeY9N8U9w5xEONlcBuLK0h8Sfryk701kvf8D44j6w+16f7GcA1Bu2lj1lzOAwM3
 +1OlfZaLH+UAwq4SYWVGCiSIe4oSH1leFhVG0BnxSBgDCuMFI0e1mRj4xbMHPEcX6TXS
 47lFFUkNm6X6FEMgW8uYeqRc5pzZbvEXkpBj9fEBeq2/wOhNbhGqobQZuuH0xAEVRKjA
 SlsVDt+dPrBroZPjAgk+gGEGw33jKS6TvtW08tpIavYdSjRsJMgm5pSJLP9s2xWYioh4
 VHFA==
X-Gm-Message-State: AO0yUKXM00UgX1USHT1DP4OzzgNFxOka2K3mV7GUrlm424cqBD5cOqqQ
 V9BVymYPH6s3K7qFNPK3h1ZYL4g5AufcUtrdxK2caPPHmYAJpDOxPJrlb0gKGrKavfdlBEx+XwT
 K+V5n7oG1CjVuDg8shj6qNhDjp0lSdlI=
X-Received: by 2002:a05:6102:2923:b0:3f3:7117:1244 with SMTP id
 cz35-20020a056102292300b003f371171244mr801506vsb.66.1675787222464; 
 Tue, 07 Feb 2023 08:27:02 -0800 (PST)
X-Google-Smtp-Source: AK7set/lTM9b3cgZT9SKQUE+tYWuL+v73HRjdWJDv/GgDiQA4Ob3dRyAQKtf6grcBYh9IAURTtgoT/pDD4dyWfsPehY=
X-Received: by 2002:a05:6102:2923:b0:3f3:7117:1244 with SMTP id
 cz35-20020a056102292300b003f371171244mr801502vsb.66.1675787222236; Tue, 07
 Feb 2023 08:27:02 -0800 (PST)
MIME-Version: 1.0
References: <20230207075115.1525-1-armbru@redhat.com>
 <20230207075115.1525-2-armbru@redhat.com>
 <87zg9pc19h.fsf@secure.mitica>
In-Reply-To: <87zg9pc19h.fsf@secure.mitica>
From: Konstantin Kostiuk <kkostiuk@redhat.com>
Date: Tue, 7 Feb 2023 18:26:51 +0200
Message-ID: <CAPMcbCrhqfaVAR4kFPX46vvfvb+PrYPgKeRXpads+uTHfJTwDA@mail.gmail.com>
Subject: Re: [PATCH 01/12] error: Drop superfluous #include "qapi/qmp/qerror.h"
To: quintela@redhat.com
Cc: Markus Armbruster <armbru@redhat.com>, qemu-devel@nongnu.org,
 marcandre.lureau@redhat.com, 
 mst@redhat.com, imammedo@redhat.com, ani@anisinha.ca, eduardo@habkost.net, 
 marcel.apfelbaum@gmail.com, philmd@linaro.org, wangyanan55@huawei.com, 
 jiri@resnulli.us, jasowang@redhat.com, pavel.dovgaluk@ispras.ru, 
 pbonzini@redhat.com, zhanghailiang@xfusion.com, dgilbert@redhat.com, 
 michael.roth@amd.com
Content-Type: multipart/alternative; boundary="00000000000019df8f05f41e9e03"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=kkostiuk@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 HTML_MESSAGE=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

--00000000000019df8f05f41e9e03
Content-Type: text/plain; charset="UTF-8"

Reviewed-by: Konstantin Kostiuk <kkostiuk@redhat.com>

On Tue, Feb 7, 2023 at 10:45 AM Juan Quintela <quintela@redhat.com> wrote:

> Markus Armbruster <armbru@redhat.com> wrote:
> > Signed-off-by: Markus Armbruster <armbru@redhat.com>
> > ---
> >  authz/listfile.c               | 1 -
> >  backends/cryptodev-vhost.c     | 1 -
> >  backends/rng.c                 | 1 -
> >  backends/vhost-user.c          | 1 -
> >  block/backup.c                 | 1 -
> >  block/commit.c                 | 1 -
> >  block/mirror.c                 | 1 -
> >  block/stream.c                 | 1 -
> >  hw/core/machine.c              | 1 -
> >  hw/i386/pc.c                   | 1 -
> >  hw/i386/x86.c                  | 1 -
> >  hw/misc/xlnx-zynqmp-apu-ctrl.c | 1 -
> >  migration/colo.c               | 1 -
> >  migration/migration-hmp-cmds.c | 1 -
> >  qga/main.c                     | 1 -
> >  softmmu/qtest.c                | 1 -
> >  target/i386/monitor.c          | 1 -
> >  target/i386/sev-sysemu-stub.c  | 1 -
> >  target/i386/sev.c              | 1 -
> >  util/qemu-config.c             | 1 -
> >  20 files changed, 20 deletions(-)
> >
> > diff --git a/authz/listfile.c b/authz/listfile.c
>
> Reviewed-by: Juan Quintela <quintela@redhat.com>
>
>

--00000000000019df8f05f41e9e03
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Reviewed-by: Konstantin Kostiuk &lt;<a href=3D"mailto:kkos=
tiuk@redhat.com" target=3D"_blank">kkostiuk@redhat.com</a>&gt;</div><br><di=
v class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Tue, Feb 7=
, 2023 at 10:45 AM Juan Quintela &lt;<a href=3D"mailto:quintela@redhat.com"=
>quintela@redhat.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quo=
te" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204=
);padding-left:1ex">Markus Armbruster &lt;<a href=3D"mailto:armbru@redhat.c=
om" target=3D"_blank">armbru@redhat.com</a>&gt; wrote:<br>
&gt; Signed-off-by: Markus Armbruster &lt;<a href=3D"mailto:armbru@redhat.c=
om" target=3D"_blank">armbru@redhat.com</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 authz/listfile.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0| 1 -<br>
&gt;=C2=A0 backends/cryptodev-vhost.c=C2=A0 =C2=A0 =C2=A0| 1 -<br>
&gt;=C2=A0 backends/rng.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0| 1 -<br>
&gt;=C2=A0 backends/vhost-user.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | 1 -<br=
>
&gt;=C2=A0 block/backup.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0| 1 -<br>
&gt;=C2=A0 block/commit.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0| 1 -<br>
&gt;=C2=A0 block/mirror.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0| 1 -<br>
&gt;=C2=A0 block/stream.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0| 1 -<br>
&gt;=C2=A0 hw/core/machine.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 | 1 -<br>
&gt;=C2=A0 hw/i386/pc.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0| 1 -<br>
&gt;=C2=A0 hw/i386/x86.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 | 1 -<br>
&gt;=C2=A0 hw/misc/xlnx-zynqmp-apu-ctrl.c | 1 -<br>
&gt;=C2=A0 migration/colo.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0| 1 -<br>
&gt;=C2=A0 migration/migration-hmp-cmds.c | 1 -<br>
&gt;=C2=A0 qga/main.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0| 1 -<br>
&gt;=C2=A0 softmmu/qtest.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 | 1 -<br>
&gt;=C2=A0 target/i386/monitor.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | 1 -<br=
>
&gt;=C2=A0 target/i386/sev-sysemu-stub.c=C2=A0 | 1 -<br>
&gt;=C2=A0 target/i386/sev.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 | 1 -<br>
&gt;=C2=A0 util/qemu-config.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0| 1 -<br>
&gt;=C2=A0 20 files changed, 20 deletions(-)<br>
&gt;<br>
&gt; diff --git a/authz/listfile.c b/authz/listfile.c<br>
<br>
Reviewed-by: Juan Quintela &lt;<a href=3D"mailto:quintela@redhat.com" targe=
t=3D"_blank">quintela@redhat.com</a>&gt;<br>
<br>
</blockquote></div>

--00000000000019df8f05f41e9e03--


