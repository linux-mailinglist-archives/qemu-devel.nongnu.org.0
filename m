Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0EF2A6EE2E2
	for <lists+qemu-devel@lfdr.de>; Tue, 25 Apr 2023 15:23:56 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1prId4-00068Z-Ug; Tue, 25 Apr 2023 09:22:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1prIch-0005rZ-3p
 for qemu-devel@nongnu.org; Tue, 25 Apr 2023 09:22:26 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1prIcf-0008MO-5i
 for qemu-devel@nongnu.org; Tue, 25 Apr 2023 09:22:22 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1682428940;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=0h06YBFLpXvAsCY125OAjPW8kndDCH7z29Vdb6AzP40=;
 b=TsXz+CaKYgOf66lvj+zFU94kkCuEPqnU51YczizoX53nC/ErTe0And9ifIt/9Vh+WD44L0
 /wo6X7SEuNuw/ybSexH+8ceKfeEbTw3UFe6I7/92mQHyhwcgN2rpZUBAskjUDrFcYtcSje
 8mwiv16vurmEbtAeAl9/qFjziyc6Bpw=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-453-nTxQfyhbNAuN8xbfsx8leg-1; Tue, 25 Apr 2023 09:22:18 -0400
X-MC-Unique: nTxQfyhbNAuN8xbfsx8leg-1
Received: by mail-wr1-f72.google.com with SMTP id
 ffacd0b85a97d-302cdf5d034so2794933f8f.0
 for <qemu-devel@nongnu.org>; Tue, 25 Apr 2023 06:22:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682428938; x=1685020938;
 h=content-transfer-encoding:mime-version:message-id:date:reply-to
 :user-agent:references:in-reply-to:subject:cc:to:from
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=0h06YBFLpXvAsCY125OAjPW8kndDCH7z29Vdb6AzP40=;
 b=Hb6RIAKVKM+OlDJzZXjtkLGCPFgUMX1NSbh4ogS9QpU4qLeIZgp5F5G+BCTwBA+n0C
 sB4ysrRNYdpj5gSOqxLQuWFytgAqZF8qBGa30zSuSHhbVX+trYMnPeutSHODOmL7N+rW
 3UHt8udcYPna5/rtBZEQITp7FVbBOG6Z0/aaMW7Dnoo7YYImVe0U2WfYLMVj7CHG1Ohc
 0qkMDVMpLhk35voy6i3dRNdHgwBIgKA2a5mu4Xnomra4/30pmd6FbEEI3qF931kZ/MMV
 n4j37KkapomaDnhcr42kBfcf0yU5borYKIuI3/zOCrxPDE1dbOvP58bjIhjIeLaTdgbb
 kqRg==
X-Gm-Message-State: AAQBX9dWni52YFM1hLEjTIf7jhtJLbkc9JdjYsQygUYdihjRJgebgYL+
 YtqqIRbFohOtG0i9plJCoooHgngQ+ijZ/+/SbUAGDSm639DDRNN0iDnSB/U+/5CoGnFm8tv7Fka
 izdt10qpzN504diw=
X-Received: by 2002:a5d:526e:0:b0:2f7:8f62:1a45 with SMTP id
 l14-20020a5d526e000000b002f78f621a45mr12516519wrc.66.1682428937826; 
 Tue, 25 Apr 2023 06:22:17 -0700 (PDT)
X-Google-Smtp-Source: AKy350Z7KWDyeBRmMb59XlgMsG2y5gEBRxSITb7nqydJxeKtc3rKgncDAD2HGZpX+JcuJuVlled9wg==
X-Received: by 2002:a5d:526e:0:b0:2f7:8f62:1a45 with SMTP id
 l14-20020a5d526e000000b002f78f621a45mr12516499wrc.66.1682428937525; 
 Tue, 25 Apr 2023 06:22:17 -0700 (PDT)
Received: from redhat.com (static-214-39-62-95.ipcom.comunitel.net.
 [95.62.39.214]) by smtp.gmail.com with ESMTPSA id
 d6-20020a5d6dc6000000b002efb31d3c24sm13086697wrz.32.2023.04.25.06.22.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 25 Apr 2023 06:22:16 -0700 (PDT)
From: Juan Quintela <quintela@redhat.com>
To: =?utf-8?Q?C=C3=A9dric?= Le Goater <clg@kaod.org>
Cc: qemu-devel@nongnu.org,  Peter Maydell <peter.maydell@linaro.org>,
 Thomas Huth <thuth@redhat.com>,  Daniel Henrique Barboza
 <danielhb413@gmail.com>,  =?utf-8?Q?Marc-Andr=C3=A9?= Lureau
 <marcandre.lureau@redhat.com>,
 =?utf-8?Q?C=C3=A9dric?= Le Goater <clg@redhat.com>,  Stefan Hajnoczi
 <stefanha@redhat.com>,  Paolo Bonzini <pbonzini@redhat.com>,  Daniel P .
 =?utf-8?Q?Berrang=C3=A9?= <berrange@redhat.com>
Subject: Re: [PATCH] async: Suppress GCC13 false positive in aio_bh_poll()
In-Reply-To: <20230420202939.1982044-1-clg@kaod.org> (=?utf-8?Q?=22C=C3=A9?=
 =?utf-8?Q?dric?= Le Goater"'s
 message of "Thu, 20 Apr 2023 22:29:39 +0200")
References: <20230420202939.1982044-1-clg@kaod.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
Date: Tue, 25 Apr 2023 15:22:15 +0200
Message-ID: <87a5ywgkqg.fsf@secure.mitica>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.129.124; envelope-from=quintela@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -22
X-Spam_score: -2.3
X-Spam_bar: --
X-Spam_report: (-2.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.171,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Reply-To: quintela@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

C=C3=A9dric Le Goater <clg@kaod.org> wrote:
> From: C=C3=A9dric Le Goater <clg@redhat.com>
>
> GCC13 reports an error :
>
> ../util/async.c: In function =E2=80=98aio_bh_poll=E2=80=99:
> include/qemu/queue.h:303:22: error: storing the address of local
> variable =E2=80=98slice=E2=80=99 in =E2=80=98*ctx.bh_slice_list.sqh_last=
=E2=80=99
> [-Werror=3Ddangling-pointer=3D]
>   303 |     (head)->sqh_last =3D &(elm)->field.sqe_next;                 =
         \
>       |     ~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~
> ../util/async.c:169:5: note: in expansion of macro =E2=80=98QSIMPLEQ_INSE=
RT_TAIL=E2=80=99
>   169 |     QSIMPLEQ_INSERT_TAIL(&ctx->bh_slice_list, &slice, next);
>       |     ^~~~~~~~~~~~~~~~~~~~
> ../util/async.c:161:17: note: =E2=80=98slice=E2=80=99 declared here
>   161 |     BHListSlice slice;
>       |                 ^~~~~
> ../util/async.c:161:17: note: =E2=80=98ctx=E2=80=99 declared here
>
> But the local variable 'slice' is removed from the global context list
> in following loop of the same routine. Add a pragma to silent GCC.
>
> Cc: Stefan Hajnoczi <stefanha@redhat.com>
> Cc: Paolo Bonzini <pbonzini@redhat.com>
> Cc: Daniel P. Berrang=C3=A9 <berrange@redhat.com>
> Signed-off-by: C=C3=A9dric Le Goater <clg@redhat.com>
> ---
>  util/async.c | 14 ++++++++++++++
>  1 file changed, 14 insertions(+)
>
> diff --git a/util/async.c b/util/async.c
> index 21016a1ac7..856e1a8a33 100644
> --- a/util/async.c
> +++ b/util/async.c
> @@ -164,7 +164,21 @@ int aio_bh_poll(AioContext *ctx)
>=20=20
>      /* Synchronizes with QSLIST_INSERT_HEAD_ATOMIC in aio_bh_enqueue(). =
 */
>      QSLIST_MOVE_ATOMIC(&slice.bh_list, &ctx->bh_list);
> +
> +    /*
> +     * GCC13 [-Werror=3Ddangling-pointer=3D] complains that the local va=
riable
> +     * 'slice' is being stored in the global 'ctx->bh_slice_list' but the
> +     * list is emptied before this function returns.
> +     */
> +#if !defined(__clang__)
> +#pragma GCC diagnostic push
> +#pragma GCC diagnostic ignored "-Wpragmas"
> +#pragma GCC diagnostic ignored "-Wdangling-pointer=3D"
> +#endif
>      QSIMPLEQ_INSERT_TAIL(&ctx->bh_slice_list, &slice, next);
> +#if !defined(__clang__)
> +#pragma GCC diagnostic pop
> +#endif
>=20=20
>      while ((s =3D QSIMPLEQ_FIRST(&ctx->bh_slice_list))) {
>          QEMUBH *bh;

I know, I know.

I like to make fun of the compiler as the next guy.  But it is not
simpler this other change, just put the variable in the heap?

Later, Juan.


From bb5792a6763a451c72ef5cfd78b09032689f54e5 Mon Sep 17 00:00:00 2001
From: Juan Quintela <quintela@redhat.com>
Date: Tue, 25 Apr 2023 15:19:11 +0200
Subject: [PATCH] Silent GCC13 warning

Gcc complains about putting a local variable on a global list, not
noticing that we remove the whole list before leaving the function.

Signed-off-by: Juan Quintela <quintela@redhat.com>
---
 util/async.c | 10 +++++++---
 1 file changed, 7 insertions(+), 3 deletions(-)

diff --git a/util/async.c b/util/async.c
index 21016a1ac7..7a8432e9e9 100644
--- a/util/async.c
+++ b/util/async.c
@@ -158,13 +158,17 @@ void aio_bh_call(QEMUBH *bh)
 /* Multiple occurrences of aio_bh_poll cannot be called concurrently. */
 int aio_bh_poll(AioContext *ctx)
 {
-    BHListSlice slice;
+    /*
+     * gcc13 complains about putting a local variable
+     * in a global list, so put it on the heap.
+     */
+    g_autofree BHListSlice *slice =3D g_new(BHListSlice, 1);
     BHListSlice *s;
     int ret =3D 0;
=20
     /* Synchronizes with QSLIST_INSERT_HEAD_ATOMIC in aio_bh_enqueue().  */
-    QSLIST_MOVE_ATOMIC(&slice.bh_list, &ctx->bh_list);
-    QSIMPLEQ_INSERT_TAIL(&ctx->bh_slice_list, &slice, next);
+    QSLIST_MOVE_ATOMIC(&slice->bh_list, &ctx->bh_list);
+    QSIMPLEQ_INSERT_TAIL(&ctx->bh_slice_list, slice, next);
=20
     while ((s =3D QSIMPLEQ_FIRST(&ctx->bh_slice_list))) {
         QEMUBH *bh;
--=20
2.40.0


