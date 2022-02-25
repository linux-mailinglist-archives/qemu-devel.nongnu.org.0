Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 00DA74C4FC7
	for <lists+qemu-devel@lfdr.de>; Fri, 25 Feb 2022 21:41:50 +0100 (CET)
Received: from localhost ([::1]:49698 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nNhPR-0008Qy-2n
	for lists+qemu-devel@lfdr.de; Fri, 25 Feb 2022 15:41:49 -0500
Received: from eggs.gnu.org ([209.51.188.92]:55384)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>) id 1nNhNo-0007eo-2V
 for qemu-devel@nongnu.org; Fri, 25 Feb 2022 15:40:08 -0500
Received: from [2a00:1450:4864:20::630] (port=38814
 helo=mail-ej1-x630.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>) id 1nNhNm-0005du-8d
 for qemu-devel@nongnu.org; Fri, 25 Feb 2022 15:40:07 -0500
Received: by mail-ej1-x630.google.com with SMTP id r13so13073189ejd.5
 for <qemu-devel@nongnu.org>; Fri, 25 Feb 2022 12:40:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=date:from:to:cc:subject:in-reply-to:references:message-id
 :mime-version:content-transfer-encoding;
 bh=v+7aHXYqOGX+YZxSIE5A93SjGKbKZOz5FTxDnyBxxdE=;
 b=FLyCXwIkhrLd19f4m6PdU8npRB6w9pbHqfjUbfcSafiZeVyYCoGkRYeydfznY2/SO7
 9/oKFmSU63ldqFHFUAOPRG1BszjwKjhTqZogHiFVSyiGO1bvMED90JYGj39SU3srKysx
 WPBzUsY9gjbPDlydWIDvyJ2YD+BWmiWhixu7mPVCqX46S9Wtf8r4KA2PZuUQ4DDT3uKN
 uQWn3Lk4Pt96FSavg77/SKc5MGGFheVrFMkDDiSVG3pIAEd4s5uDU5ZQvGbmsXr0+bo9
 y+o+7DFD4rdPrPXFEXYvezqRg1QMXevpLViKo+BHcDnLpUCXTo8+YXzyAuxFTTRJQkWY
 KFFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:in-reply-to:references
 :message-id:mime-version:content-transfer-encoding;
 bh=v+7aHXYqOGX+YZxSIE5A93SjGKbKZOz5FTxDnyBxxdE=;
 b=lpoHDB5i5NztlQhxyLaktkzsEzKeo1g//Wr5WONRSLnj98Y4++Xy8RhV+YdtoVjSaB
 YmOAZcJuB+FAr9PwB5fBdufmFTuslAxQlEmpPUU7cKS2jHh9j2vIH4QlTxbmkZ+oo6KW
 1GfTkIdamOpOlnW0xgxeMD7w+BoisHdljJvQBwXSg3PdTJE07IfqNi9RtdsONnwMz9ri
 OPO6D8Xb2h+YpCo0ZrxJqgV0Sm0dJRthFZ+/ZcQNRqJdpP0Gj45kEwGYg90w5CJ0apJ0
 DmDKv29/oD9GDjCgjQth8FEXE8CFzJ10PgVWsmtpLmMItipzPejBKEj2WH4NX/3D1zR/
 oxrw==
X-Gm-Message-State: AOAM531BTj/mcxo5gJ2ABEYdDvGUWMrOGD+QA7czY79ROslBHUIYA9GG
 tZuLGiuNugQD3vep5jSb33KWvPhIph4=
X-Google-Smtp-Source: ABdhPJx6qCjM9vr6USP0Q52KzbNREwOMnmFQRer7jgnHcTu/VSj1ZJtPiE99a3tXohNASbLPlAWjMQ==
X-Received: by 2002:a17:906:840a:b0:6cc:6c65:d54c with SMTP id
 n10-20020a170906840a00b006cc6c65d54cmr6442085ejx.106.1645821604100; 
 Fri, 25 Feb 2022 12:40:04 -0800 (PST)
Received: from [127.0.0.1] (dynamic-078-054-087-117.78.54.pool.telefonica.de.
 [78.54.87.117]) by smtp.gmail.com with ESMTPSA id
 bx1-20020a0564020b4100b00410f01a91f0sm1870111edb.73.2022.02.25.12.40.03
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 25 Feb 2022 12:40:03 -0800 (PST)
Date: Fri, 25 Feb 2022 20:40:00 +0000
From: Bernhard Beschow <shentey@gmail.com>
To: qemu-devel@nongnu.org
Subject: =?US-ASCII?Q?Re=3A_=5BPATCH=5D_virtio/virtio-balloon=3A_?=
 =?US-ASCII?Q?Prefer_Object*_over_void*_parameter?=
In-Reply-To: <20220217225351.140095-3-shentey@gmail.com>
References: <20220217225351.140095-1-shentey@gmail.com>
 <20220217225351.140095-3-shentey@gmail.com>
Message-ID: <A0141B14-70D7-4176-BD6E-B0FE5B6AC14A@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::630
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::630;
 envelope-from=shentey@gmail.com; helo=mail-ej1-x630.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: David Hildenbrand <david@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Am 17=2E Februar 2022 22:53:50 UTC schrieb Bernhard Beschow <shentey@gmail=
=2Ecom>:
>*opaque is an alias to *obj=2E Using the ladder makes the code consistent=
 with
>with other devices, e=2Eg=2E accel/kvm/kvm-all and accel/tcg/tcg-all=2E I=
t also
>makes the cast more typesafe=2E
>
>Signed-off-by: Bernhard Beschow <shentey@gmail=2Ecom>
>---
> hw/virtio/virtio-balloon=2Ec | 10 +++++-----
> 1 file changed, 5 insertions(+), 5 deletions(-)
>
>diff --git a/hw/virtio/virtio-balloon=2Ec b/hw/virtio/virtio-balloon=2Ec
>index 9a4f491b54=2E=2E38732d4118 100644
>--- a/hw/virtio/virtio-balloon=2Ec
>+++ b/hw/virtio/virtio-balloon=2Ec
>@@ -241,7 +241,7 @@ static void balloon_stats_get_all(Object *obj, Visito=
r *v, const char *name,
>                                   void *opaque, Error **errp)
> {
>     Error *err =3D NULL;
>-    VirtIOBalloon *s =3D opaque;
>+    VirtIOBalloon *s =3D VIRTIO_BALLOON(obj);
>     int i;
>=20
>     if (!visit_start_struct(v, name, NULL, 0, &err)) {
>@@ -276,7 +276,7 @@ static void balloon_stats_get_poll_interval(Object *o=
bj, Visitor *v,
>                                             const char *name, void *opaq=
ue,
>                                             Error **errp)
> {
>-    VirtIOBalloon *s =3D opaque;
>+    VirtIOBalloon *s =3D VIRTIO_BALLOON(obj);
>     visit_type_int(v, name, &s->stats_poll_interval, errp);
> }
>=20
>@@ -284,7 +284,7 @@ static void balloon_stats_set_poll_interval(Object *o=
bj, Visitor *v,
>                                             const char *name, void *opaq=
ue,
>                                             Error **errp)
> {
>-    VirtIOBalloon *s =3D opaque;
>+    VirtIOBalloon *s =3D VIRTIO_BALLOON(obj);
>     int64_t value;
>=20
>     if (!visit_type_int(v, name, &value, errp)) {
>@@ -1014,12 +1014,12 @@ static void virtio_balloon_instance_init(Object *=
obj)
>     s->free_page_hint_notify=2Enotify =3D virtio_balloon_free_page_hint_=
notify;
>=20
>     object_property_add(obj, "guest-stats", "guest statistics",
>-                        balloon_stats_get_all, NULL, NULL, s);
>+                        balloon_stats_get_all, NULL, NULL, NULL);
>=20
>     object_property_add(obj, "guest-stats-polling-interval", "int",
>                         balloon_stats_get_poll_interval,
>                         balloon_stats_set_poll_interval,
>-                        NULL, s);
>+                        NULL, NULL);
> }
>=20
> static const VMStateDescription vmstate_virtio_balloon =3D {

Ping

