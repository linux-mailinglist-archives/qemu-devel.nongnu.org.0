Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A5DB10D771
	for <lists+qemu-devel@lfdr.de>; Fri, 29 Nov 2019 15:51:11 +0100 (CET)
Received: from localhost ([::1]:59884 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iahby-0003Zz-2y
	for lists+qemu-devel@lfdr.de; Fri, 29 Nov 2019 09:51:10 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:38469)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <armbru@redhat.com>) id 1iagrd-0002h0-Hw
 for qemu-devel@nongnu.org; Fri, 29 Nov 2019 09:03:18 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <armbru@redhat.com>) id 1iagrV-00054i-UB
 for qemu-devel@nongnu.org; Fri, 29 Nov 2019 09:03:14 -0500
Received: from us-smtp-1.mimecast.com ([207.211.31.81]:52794)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <armbru@redhat.com>) id 1iagrV-00052W-Pa
 for qemu-devel@nongnu.org; Fri, 29 Nov 2019 09:03:09 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1575036187;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=CJ+c0+VjGVfiepa7uGqLbpKLXtzxd0RS5GOPmGSIg3Q=;
 b=OtkAgJHxGKntV1yKavdAz1+RothqNiDzDUgJ2mZLWC3YddSfeCDXODiiupma/C8Dg0+KlM
 DFc3ykNNoxPjV5YdgNx+SGKA6FPFVDB0Ofdy0yfU+0iDtFKB6Gn9458kFL7GKbqJWmE5JG
 zFjhg05qrtnIF43FHq5RebiabfW7W8k=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-7-FPdScMU4OLa-qpKda29VHw-1; Fri, 29 Nov 2019 09:03:06 -0500
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D357D80183D;
 Fri, 29 Nov 2019 14:03:04 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-116-134.ams2.redhat.com
 [10.36.116.134])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 546F210013A7;
 Fri, 29 Nov 2019 14:03:04 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id ED5631138606; Fri, 29 Nov 2019 15:03:02 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Subject: Re: [PATCH v6] hw/core/loader-fit: fix freeing errp in fit_load_fdt
References: <20191127183016.13852-1-vsementsov@virtuozzo.com>
Date: Fri, 29 Nov 2019 15:03:02 +0100
In-Reply-To: <20191127183016.13852-1-vsementsov@virtuozzo.com> (Vladimir
 Sementsov-Ogievskiy's message of "Wed, 27 Nov 2019 21:30:16 +0300")
Message-ID: <87muceeq5l.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.2 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-MC-Unique: FPdScMU4OLa-qpKda29VHw-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 207.211.31.81
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
Cc: pburton@wavecomp.com, aleksandar.rikalo@rt-rk.com, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com> writes:

> fit_load_fdt forget to check that errp is not NULL and to zero it after
> freeing. Fix it.
>
> Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
> Reviewed-by: Eric Blake <eblake@redhat.com>
> ---
>  hw/core/loader-fit.c | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
>
> diff --git a/hw/core/loader-fit.c b/hw/core/loader-fit.c
> index 953b16bc82..3ee9fb2f2e 100644
> --- a/hw/core/loader-fit.c
> +++ b/hw/core/loader-fit.c
> @@ -200,7 +200,10 @@ static int fit_load_fdt(const struct fit_loader *ldr=
, const void *itb,
>      err =3D fit_image_addr(itb, img_off, "load", &load_addr, errp);
>      if (err =3D=3D -ENOENT) {
>          load_addr =3D ROUND_UP(kernel_end, 64 * KiB) + (10 * MiB);
> -        error_free(*errp);
> +        if (errp) {
> +            error_free(*errp);
> +            *errp =3D NULL;
> +        }
>      } else if (err) {
>          error_prepend(errp, "unable to read FDT load address from FIT: "=
);
>          ret =3D err;

This fixes latent bugs when fit_image_addr() fails with ENOENT:

* If a caller passes a null @errp, we crash dereferencing it

* Else, we pass a dangling Error * to the caller, and return success.
  If a caller dereferences the Error * regardless, we have a
  use-after-free.

Not fixed:

* If a caller passes &error_abort or &error_fatal, we die instead of
  taking the recovery path.

We need to use a local_err here.

I'll search for the pattern, and post fix(es).


