Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C31B5677D82
	for <lists+qemu-devel@lfdr.de>; Mon, 23 Jan 2023 15:03:48 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pJxOS-0003OG-3e; Mon, 23 Jan 2023 09:01:53 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1pJxOK-0003O4-UB
 for qemu-devel@nongnu.org; Mon, 23 Jan 2023 09:01:44 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1pJxOJ-0000Do-8D
 for qemu-devel@nongnu.org; Mon, 23 Jan 2023 09:01:44 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1674482501;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=YLzo81HoCcFTk6LkFgXKfC0f7QBujks9zfW6jgpgKms=;
 b=A+mdDXnFmS0KqGnpD+mXjl8AKPZiJX7FD+9Z+Cqljrs6Chd2YIrL5eduAKlz1vTkhKV2gf
 FJaQminiYQbma9XPLxV4X2b9O8T+zKlTCV+a2gagJpoauFdecrVqQZ4n31QiUAYrPR7Xxu
 Udb0wDyrQYUS9glhCIYV5GK450jHMI0=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-452-NhZVFIXkMAe62VLs26M1BA-1; Mon, 23 Jan 2023 09:01:40 -0500
X-MC-Unique: NhZVFIXkMAe62VLs26M1BA-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
 [10.11.54.6])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id A12E01871DA6;
 Mon, 23 Jan 2023 14:01:38 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.39.192.70])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 722CD2166B32;
 Mon, 23 Jan 2023 14:01:38 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 4013721E6A1F; Mon, 23 Jan 2023 15:01:37 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: Peter Krempa <pkrempa@redhat.com>
Cc: qemu-devel@nongnu.org,  Stefan Hajnoczi <stefanha@redhat.com>,  Kevin
 Wolf <kwolf@redhat.com>,  Hanna Reitz <hreitz@redhat.com>,
 qemu-block@nongnu.org
Subject: Re: [PATCH] block/blkio: Fix inclusion of required headers
References: <2bc956011404a1ab03342aefde0087b5b4762562.1674477350.git.pkrempa@redhat.com>
Date: Mon, 23 Jan 2023 15:01:37 +0100
In-Reply-To: <2bc956011404a1ab03342aefde0087b5b4762562.1674477350.git.pkrempa@redhat.com>
 (Peter Krempa's message of "Mon, 23 Jan 2023 13:39:27 +0100")
Message-ID: <87h6whbb9a.fsf@pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.6
Received-SPF: pass client-ip=170.10.133.124; envelope-from=armbru@redhat.com;
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

Peter Krempa <pkrempa@redhat.com> writes:

> After recent header file inclusion rework the build fails when the blkio
> module is enabled:
>
> ../block/blkio.c: In function =E2=80=98blkio_detach_aio_context=E2=80=99:
> ../block/blkio.c:321:24: error: implicit declaration of function =E2=80=
=98bdrv_get_aio_context=E2=80=99; did you mean =E2=80=98qemu_get_aio_contex=
t=E2=80=99? [-Werror=3Dimplicit-function-declaration]
>   321 |     aio_set_fd_handler(bdrv_get_aio_context(bs),
>       |                        ^~~~~~~~~~~~~~~~~~~~
>       |                        qemu_get_aio_context
> ../block/blkio.c:321:24: error: nested extern declaration of =E2=80=98bdr=
v_get_aio_context=E2=80=99 [-Werror=3Dnested-externs]
> ../block/blkio.c:321:24: error: passing argument 1 of =E2=80=98aio_set_fd=
_handler=E2=80=99 makes pointer from integer without a cast [-Werror=3Dint-=
conversion]
>   321 |     aio_set_fd_handler(bdrv_get_aio_context(bs),
>       |                        ^~~~~~~~~~~~~~~~~~~~~~~~
>       |                        |
>       |                        int
> In file included from /home/pipo/git/qemu.git/include/qemu/job.h:33,
>                  from /home/pipo/git/qemu.git/include/block/blockjob.h:30,
>                  from /home/pipo/git/qemu.git/include/block/block_int-glo=
bal-state.h:28,
>                  from /home/pipo/git/qemu.git/include/block/block_int.h:2=
7,
>                  from ../block/blkio.c:13:
> /home/pipo/git/qemu.git/include/block/aio.h:476:37: note: expected =E2=80=
=98AioContext *=E2=80=99 but argument is of type =E2=80=98int=E2=80=99
>   476 | void aio_set_fd_handler(AioContext *ctx,
>       |                         ~~~~~~~~~~~~^~~
> ../block/blkio.c: In function =E2=80=98blkio_file_open=E2=80=99:
> ../block/blkio.c:821:34: error: passing argument 2 of =E2=80=98blkio_atta=
ch_aio_context=E2=80=99 makes pointer from integer without a cast [-Werror=
=3Dint-conversion]
>   821 |     blkio_attach_aio_context(bs, bdrv_get_aio_context(bs));
>       |                                  ^~~~~~~~~~~~~~~~~~~~~~~~
>       |                                  |
>       |                                  int
>

My apologies...

Why are modules disabled by default?

> Fix it by including 'block/block-io.h' which contains the required
> declarations.
>
> Fixes: e2c1c34f139f49ef909bb4322607fb8b39002312
> Signed-off-by: Peter Krempa <pkrempa@redhat.com>
> ---
>  block/blkio.c | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/block/blkio.c b/block/blkio.c
> index 5eae3adfaf..6ad86b23d1 100644
> --- a/block/blkio.c
> +++ b/block/blkio.c
> @@ -19,6 +19,8 @@
>  #include "qemu/module.h"
>  #include "exec/memory.h" /* for ram_block_discard_disable() */
>
> +#include "block/block-io.h"
> +
>  /*
>   * Keep the QEMU BlockDriver names identical to the libblkio driver name=
s.
>   * Using macros instead of typing out the string literals avoids typos.

Reviewed-by: Markus Armbruster <armbru@redhat.com>


