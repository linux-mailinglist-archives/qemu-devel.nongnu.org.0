Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B09C45BE918
	for <lists+qemu-devel@lfdr.de>; Tue, 20 Sep 2022 16:32:38 +0200 (CEST)
Received: from localhost ([::1]:56002 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oaeIf-0001Bk-29
	for lists+qemu-devel@lfdr.de; Tue, 20 Sep 2022 10:32:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53904)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1oabNg-0005ZT-8H
 for qemu-devel@nongnu.org; Tue, 20 Sep 2022 07:25:38 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:47901)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1oabNU-0007Vp-6H
 for qemu-devel@nongnu.org; Tue, 20 Sep 2022 07:25:30 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1663673119;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=YTjOvu/pH4WrKbN+wdz3PeCp03xv9F+2JhCWl/O4GZY=;
 b=DXsyOdAqhm2iJ9rhMsKEFiIu3L6Ogq3hvyzgZfNXsZXV4NzIqYYqKNpC3ek2+m3J5F1K8z
 e8Oo7zBGwCMRdQotaDR8v7CBTvQoRz/+Rj3uoKee2PExADcTAoVQLDtWf6BCo6ZMDeUmQ2
 vsCklbTPNSGxVFE1pQ14lrwGvPHxXwc=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-290-Sm4W2I0rOHCb_XUNZFvnAA-1; Tue, 20 Sep 2022 07:25:16 -0400
X-MC-Unique: Sm4W2I0rOHCb_XUNZFvnAA-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
 [10.11.54.6])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 1BDDF101A52A;
 Tue, 20 Sep 2022 11:25:16 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.39.192.163])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id A67D12166B31;
 Tue, 20 Sep 2022 11:25:15 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 6F9E721E6900; Tue, 20 Sep 2022 13:25:14 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Cc: qemu-devel@nongnu.org,  Xie Yongji <xieyongji@bytedance.com>,  Stefan
 Hajnoczi <stefanha@redhat.com>,  Kevin Wolf <kwolf@redhat.com>
Subject: Re: [RFC PATCH] libvduse: Do not truncate terminating NUL character
 with strncpy()
References: <20220919192306.52729-1-f4bug@amsat.org>
Date: Tue, 20 Sep 2022 13:25:14 +0200
In-Reply-To: <20220919192306.52729-1-f4bug@amsat.org> ("Philippe
 =?utf-8?Q?Mathieu-Daud=C3=A9=22's?= message of "Mon, 19 Sep 2022 21:23:06
 +0200")
Message-ID: <87k05yxp7p.fsf@pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.6
Received-SPF: pass client-ip=170.10.133.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org> writes:

> GCC 8 added a -Wstringop-truncation warning:
>
>   The -Wstringop-truncation warning added in GCC 8.0 via r254630 for
>   bug 81117 is specifically intended to highlight likely unintended
>   uses of the strncpy function that truncate the terminating NUL
>   character from the source string.
>
> Here the next line indeed unconditionally zeroes the last byte, so
> we can call strncpy() on the buffer size less the last byte.

Actually, the buffer is all zero to begin with, so we could do this even
without the next line's assignment.

>                                                              This
> fixes when using gcc (Ubuntu 9.4.0-1ubuntu1~20.04.1) 9.4.0:
>
>   [42/666] Compiling C object subprojects/libvduse/libvduse.a.p/libvduse.=
c.o
>   FAILED: subprojects/libvduse/libvduse.a.p/libvduse.c.o
>   cc -m64 -mcx16 -Isubprojects/libvduse/libvduse.a.p -Isubprojects/libvdu=
se -I../../subprojects/libvduse [...] -o subprojects/libvduse/libvduse.a.p/=
libvduse.c.o -c ../../subprojects/libvduse/libvduse.c
>   In file included from /usr/include/string.h:495,
>                    from ../../subprojects/libvduse/libvduse.c:24:
>   In function =E2=80=98strncpy=E2=80=99,
>       inlined from =E2=80=98vduse_dev_create=E2=80=99 at ../../subproject=
s/libvduse/libvduse.c:1312:5:
>   /usr/include/x86_64-linux-gnu/bits/string_fortified.h:106:10: error: =
=E2=80=98__builtin_strncpy=E2=80=99 specified bound 256 equals destination =
size [-Werror=3Dstringop-truncation]
>     106 |   return __builtin___strncpy_chk (__dest, __src, __len, __bos (=
__dest));
>         |          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~~~
>   cc1: all warnings being treated as errors
>   ninja: build stopped: cannot make progress due to previous errors.
>
> Fixes: d9cf16c0be ("libvduse: Replace strcpy() with strncpy()")
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>

The subject feels a bit too alarming to me.  This patch suppresses a
warning, no less, no more.  Behavior doesn't change.  Perhaps

    libvduse: Avoid warning about dangerous use of strncpy()

> ---
> Cc: Xie Yongji <xieyongji@bytedance.com>
> Cc: Markus Armbruster <armbru@redhat.com>
> Cc: Kevin Wolf <kwolf@redhat.com>
>
> RFC: Any better idea? We can't use strpadcpy() because libvduse
> doesn't depend on QEMU.

There's no need for padding: the destination calloc'ed.  So, pstrcpy()
would do, but it's just as unavailable.  Can we use GLib?  There's
g_strlcpy().

Outside this patch's scope: is silent truncation what we want?

> ---
>  subprojects/libvduse/libvduse.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/subprojects/libvduse/libvduse.c b/subprojects/libvduse/libvd=
use.c
> index 1a5981445c..e460780ce3 100644
> --- a/subprojects/libvduse/libvduse.c
> +++ b/subprojects/libvduse/libvduse.c
> @@ -1309,7 +1309,7 @@ VduseDev *vduse_dev_create(const char *name, uint32=
_t device_id,
>          goto err_dev;
>      }
>=20=20
> -    strncpy(dev_config->name, name, VDUSE_NAME_MAX);
> +    strncpy(dev_config->name, name, VDUSE_NAME_MAX - 1);
>      dev_config->name[VDUSE_NAME_MAX - 1] =3D '\0';
>      dev_config->device_id =3D device_id;
>      dev_config->vendor_id =3D vendor_id;

Since the buffer is known to be all zero, the padding done by strncpy()
is unnecessary, and so is the assignment that follows it.  I don't mind.

Reviewed-by: Markus Armbruster <armbru@redhat.com>


