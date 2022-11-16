Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DB32462B391
	for <lists+qemu-devel@lfdr.de>; Wed, 16 Nov 2022 07:56:59 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ovCLM-0007Db-Qp; Wed, 16 Nov 2022 01:56:20 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1ovCLJ-0007DG-Lc
 for qemu-devel@nongnu.org; Wed, 16 Nov 2022 01:56:17 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1ovCLI-0006zK-A2
 for qemu-devel@nongnu.org; Wed, 16 Nov 2022 01:56:17 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1668581774;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=1oDGat731PN6265FvJVXWWD0XIZm07U/AtGxzPhl13o=;
 b=ICL7Xb82+dhQvXTq5LZPPnAba8xnDQ/79+KXUMrbkIJ1tdeTP2l1Af7Z+YzCS4v11BsfQ8
 XbkYBkj+srtLkPJ8ref1ZeFfoEyHUuH6XYnFDjGHrb+ovA0nqNlIzhZdKR8aemONCHGoDZ
 h/m+BCXhD9xZmuh+AMM1h/+PEFvCC/4=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-433-gpwSa007MSWopQJvNv_KnA-1; Wed, 16 Nov 2022 01:56:12 -0500
X-MC-Unique: gpwSa007MSWopQJvNv_KnA-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
 [10.11.54.3])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 5B6A5185A78F;
 Wed, 16 Nov 2022 06:56:11 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.39.193.175])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 1AC49112131E;
 Wed, 16 Nov 2022 06:56:11 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id EA5A321E6921; Wed, 16 Nov 2022 07:56:07 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: =?utf-8?Q?C=C3=A9dric?= Le Goater <clg@kaod.org>
Cc: Alistair Francis <alistair@alistair23.me>,  Francisco Iglesias
 <frasse.iglesias@gmail.com>,  Kevin Wolf <kwolf@redhat.com>,  Hanna Reitz
 <hreitz@redhat.com>,  Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?=
 <philmd@linaro.org>,  Peter
 Maydell <peter.maydell@linaro.org>,  Peter Delevoryas <peter@pjd.dev>,
 qemu-block@nongnu.org,  qemu-devel@nongnu.org
Subject: Re: [PATCH v2] m25p80: Improve error when the backend file size
 does not match the device
References: <20221115151000.2080833-1-clg@kaod.org>
Date: Wed, 16 Nov 2022 07:56:07 +0100
In-Reply-To: <20221115151000.2080833-1-clg@kaod.org> (=?utf-8?Q?=22C=C3=A9?=
 =?utf-8?Q?dric?= Le Goater"'s
 message of "Tue, 15 Nov 2022 16:10:00 +0100")
Message-ID: <87edu3o0ag.fsf@pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.3
Received-SPF: pass client-ip=170.10.129.124; envelope-from=armbru@redhat.com;
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

C=C3=A9dric Le Goater <clg@kaod.org> writes:

> Currently, when a block backend is attached to a m25p80 device and the
> associated file size does not match the flash model, QEMU complains
> with the error message "failed to read the initial flash content".
> This is confusing for the user.
>
> Use blk_check_size_and_read_all() instead of blk_pread() to improve
> the reported error.
>
> Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>
> ---
>  hw/block/m25p80.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/hw/block/m25p80.c b/hw/block/m25p80.c
> index 02adc87527..68a757abf3 100644
> --- a/hw/block/m25p80.c
> +++ b/hw/block/m25p80.c
> @@ -24,6 +24,7 @@
>  #include "qemu/osdep.h"
>  #include "qemu/units.h"
>  #include "sysemu/block-backend.h"
> +#include "hw/block/block.h"
>  #include "hw/qdev-properties.h"
>  #include "hw/qdev-properties-system.h"
>  #include "hw/ssi/ssi.h"
> @@ -1614,8 +1615,7 @@ static void m25p80_realize(SSIPeripheral *ss, Error=
 **errp)
>          trace_m25p80_binding(s);
>          s->storage =3D blk_blockalign(s->blk, s->size);
>=20=20
> -        if (blk_pread(s->blk, 0, s->size, s->storage, 0) < 0) {
> -            error_setg(errp, "failed to read the initial flash content");
> +        if (!blk_check_size_and_read_all(s->blk, s->storage, s->size, er=
rp)) {
>              return;
>          }
>      } else {

Ignorant question: what does blk_pread() on short read?  Does it fail?
Or does it succeed, returning how much it read?  I tried to find an
answer in function comments, no luck.

Are there more instances of "we fill some fixed-size memory (such as a
ROM or flash) from a block backend?"


