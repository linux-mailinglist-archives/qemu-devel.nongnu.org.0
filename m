Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 09B0417E3B5
	for <lists+qemu-devel@lfdr.de>; Mon,  9 Mar 2020 16:36:17 +0100 (CET)
Received: from localhost ([::1]:45088 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jBKS0-0002pY-1D
	for lists+qemu-devel@lfdr.de; Mon, 09 Mar 2020 11:36:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37018)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <imammedo@redhat.com>) id 1jBKIj-0007LU-N8
 for qemu-devel@nongnu.org; Mon, 09 Mar 2020 11:26:42 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <imammedo@redhat.com>) id 1jBKIi-0006bd-Jl
 for qemu-devel@nongnu.org; Mon, 09 Mar 2020 11:26:41 -0400
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:37479
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <imammedo@redhat.com>) id 1jBKIi-0006bM-Fr
 for qemu-devel@nongnu.org; Mon, 09 Mar 2020 11:26:40 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1583767600;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Ppt/lurGlOUXwMTi9YyTnILZh9n3AtHa2mtahdFGNZ4=;
 b=Lf2SQnCtnObr/xl3RoiGC2aVfi1a2AuXjd/LKB7Dxh6LUTxAPjD8XQvEvaw6845JlAKRia
 E1Ki8vwZY/JIu2RF/kzDxiywEprJapw5ZitR56+NnYQKSoyR/OIHZZaDTlmIxfiWwu6YQm
 1FbzmvZZp5PriW5YAXmsQeJ0Y3Cntxw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-460-pOwrnuvaO5OIxwyTJ43FWA-1; Mon, 09 Mar 2020 11:26:38 -0400
X-MC-Unique: pOwrnuvaO5OIxwyTJ43FWA-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id BB06418C35A4
 for <qemu-devel@nongnu.org>; Mon,  9 Mar 2020 15:26:37 +0000 (UTC)
Received: from Igors-MacBook-Pro (ovpn-206-77.brq.redhat.com [10.40.206.77])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 2EAF88882D;
 Mon,  9 Mar 2020 15:26:33 +0000 (UTC)
Date: Mon, 9 Mar 2020 16:26:31 +0100
From: Igor Mammedov <imammedo@redhat.com>
To: =?UTF-8?Q?Marc-Andr=C3=A9?= Lureau <marcandre.lureau@redhat.com>
Subject: Re: [PATCH] softmmu: fix crash with invalid -M memory-backend=
Message-ID: <20200309162631.01f1d553@Igors-MacBook-Pro>
In-Reply-To: <20200309145155.168942-1-marcandre.lureau@redhat.com>
References: <20200309145155.168942-1-marcandre.lureau@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 205.139.110.120
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
Cc: pbonzini@redhat.com, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon,  9 Mar 2020 15:51:55 +0100
Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com> wrote:

> Fixes: fe64d06afc1c5d895f220c268cfe4d5f1e65d44e ("vl.c: ensure that
> ram_size matches size of machine.memory-backend")
> Signed-off-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>

Reviewed-by: Igor Mammedov <imammedo@redhat.com>

> ---
>  softmmu/vl.c | 5 +++++
>  1 file changed, 5 insertions(+)
>=20
> diff --git a/softmmu/vl.c b/softmmu/vl.c
> index 5549f4b619..38e9c404f2 100644
> --- a/softmmu/vl.c
> +++ b/softmmu/vl.c
> @@ -4287,6 +4287,11 @@ void qemu_init(int argc, char **argv, char **envp)
> =20
>          backend =3D object_resolve_path_type(current_machine->ram_memdev=
_id,
>                                             TYPE_MEMORY_BACKEND, NULL);
> +        if (!backend) {
> +            error_report("Memory backend '%s' not found",
> +                         current_machine->ram_memdev_id);
> +            exit(EXIT_FAILURE);
> +        }
>          backend_size =3D object_property_get_uint(backend, "size",  &err=
or_abort);
>          if (have_custom_ram_size && backend_size !=3D ram_size) {
>                  error_report("Size specified by -m option must match siz=
e of "


