Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 54562609A3B
	for <lists+qemu-devel@lfdr.de>; Mon, 24 Oct 2022 08:11:58 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1omqIB-00068O-QH; Mon, 24 Oct 2022 01:46:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1omqHc-0005mw-0t
 for qemu-devel@nongnu.org; Mon, 24 Oct 2022 01:46:01 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1omqHX-0000u9-NR
 for qemu-devel@nongnu.org; Mon, 24 Oct 2022 01:45:53 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1666590348;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=1PoG0FQT2c4UkGydohqPRXgn4pALXTindYsLRjqQo2c=;
 b=dkm/MlDkdx6f3fpUPqadqs9t5HBvgCqLW8PteUr2ZxBXvVaElSbEZnmqtdqxf/6L318Ura
 6bjhZd8BuYn2U4Be3R1IYHxR8fDOT7H0sOnW4+T81N0rBI3v6waGE/hGt8P4bwh30uc2sH
 6TUXhf0kxPPYBbgFnUGZvHCTKHTHdi4=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-85-yT5wv1YoNWKr_3xnkVkYow-1; Mon, 24 Oct 2022 01:45:42 -0400
X-MC-Unique: yT5wv1YoNWKr_3xnkVkYow-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
 [10.11.54.3])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 1C6B8802540;
 Mon, 24 Oct 2022 05:45:17 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.39.195.118])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id B2720112132C;
 Mon, 24 Oct 2022 05:45:01 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 9F01A21E6936; Mon, 24 Oct 2022 07:44:57 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: Volker =?utf-8?Q?R=C3=BCmelin?= <vr_qemu@t-online.de>
Cc: Gerd Hoffmann <kraxel@redhat.com>,  =?utf-8?Q?Marc-Andr=C3=A9?= Lureau
 <marcandre.lureau@redhat.com>,  qemu-devel@nongnu.org,
 qemu-trivial@nongnu.org
Subject: Re: [PATCH] ui: remove useless typecasts
References: <20221022141204.29358-1-vr_qemu@t-online.de>
Date: Mon, 24 Oct 2022 07:44:57 +0200
In-Reply-To: <20221022141204.29358-1-vr_qemu@t-online.de> ("Volker
 =?utf-8?Q?R=C3=BCmelin=22's?=
 message of "Sat, 22 Oct 2022 16:12:04 +0200")
Message-ID: <87k04pu65i.fsf@pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.3
Received-SPF: pass client-ip=170.10.129.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -32
X-Spam_score: -3.3
X-Spam_bar: ---
X-Spam_report: (-3.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.517,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Volker R=C3=BCmelin <vr_qemu@t-online.de> writes:

> Commit 8f9abdf586 ("chardev: src buffer const for write functions")
> changed the type of the second parameter of qemu_chr_be_write()
> from uint8_t * to const uint8_t *. Remove the now useless type
> casts from qemu_chr_be_write() function calls in ui/console.c and
> ui/gtk.c.
>
> Cc: qemu-trivial@nongnu.org
> Signed-off-by: Volker R=C3=BCmelin <vr_qemu@t-online.de>
> ---
>  ui/console.c | 2 +-
>  ui/gtk.c     | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/ui/console.c b/ui/console.c
> index 49da6a91df..65c117874c 100644
> --- a/ui/console.c
> +++ b/ui/console.c
> @@ -1297,7 +1297,7 @@ static void kbd_send_chars(QemuConsole *s)
>          uint32_t size;
>=20=20
>          buf =3D fifo8_pop_buf(&s->out_fifo, MIN(len, avail), &size);
> -        qemu_chr_be_write(s->chr, (uint8_t *)buf, size);
> +        qemu_chr_be_write(s->chr, buf, size);
>          len =3D qemu_chr_be_can_write(s->chr);
>          avail -=3D size;
>      }
> diff --git a/ui/gtk.c b/ui/gtk.c
> index 92daaa6a6e..7ec21f7798 100644
> --- a/ui/gtk.c
> +++ b/ui/gtk.c
> @@ -1763,7 +1763,7 @@ static void gd_vc_send_chars(VirtualConsole *vc)
>          uint32_t size;
>=20=20
>          buf =3D fifo8_pop_buf(&vc->vte.out_fifo, MIN(len, avail), &size);
> -        qemu_chr_be_write(vc->vte.chr, (uint8_t *)buf, size);
> +        qemu_chr_be_write(vc->vte.chr, buf, size);
>          len =3D qemu_chr_be_can_write(vc->vte.chr);
>          avail -=3D size;
>      }

Reviewed-by: Markus Armbruster <armbru@redhat.com>

Related:

tests/unit/test-char.c:219:    qemu_chr_be_write(base, (void *)"hello", 6);
tests/unit/test-char.c:236:    qemu_chr_be_write(base, (void *)"\1b", 2);
tests/unit/test-char.c:240:    qemu_chr_be_write(base, (void *)"\1c", 2);
tests/unit/test-char.c:247:    qemu_chr_be_write(base, (void *)"hello", 6);
tests/unit/test-char.c:253:    qemu_chr_be_write(base, (void *)"\1b", 2);
tests/unit/test-char.c:319:    qemu_chr_be_write(base, (void *)"hello", 6);
tests/unit/test-char.c:323:    qemu_chr_be_write(base, (void *)"\1c", 2);
tests/unit/test-char.c:324:    qemu_chr_be_write(base, (void *)"hello", 6);
tests/unit/test-char.c:331:    qemu_chr_be_write(base, (void *)"\1?", 2);

The cast strips away const, and the conversion adds it back.  Slightly
unclean.  Not sure its worth a patch.

I wonder why the parameter isn't const void *, though.


