Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 53C6B4D7F56
	for <lists+qemu-devel@lfdr.de>; Mon, 14 Mar 2022 11:00:51 +0100 (CET)
Received: from localhost ([::1]:54048 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nThVR-000532-4u
	for lists+qemu-devel@lfdr.de; Mon, 14 Mar 2022 06:00:49 -0400
Received: from eggs.gnu.org ([209.51.188.92]:54566)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1nThT2-0004HK-H4
 for qemu-devel@nongnu.org; Mon, 14 Mar 2022 05:58:20 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:31158)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1nThSz-00047Q-37
 for qemu-devel@nongnu.org; Mon, 14 Mar 2022 05:58:18 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1647251894;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ik2AfLJgl/0b3K/1mv6przejnNUJd9nfFmJPHggEb6Q=;
 b=X6g2GdMKyvAhuZqXlj2T5O6HESYe/rUw/chRmQw6UqM7ZhMVGJfHi6Sp6oYsaOwJN/YXBJ
 ZY0hjP9vGPYDhRi+yQYTwS4yaNjuqyjcJ6FWngNL21beSAJ9PFHNUtfYCdUkgnojc22H8A
 z9z55gYMc/tNw+oe+uMbPiixEHNvtKk=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-227-qeuWVfInP-SPpm34PCNDFw-1; Mon, 14 Mar 2022 05:58:11 -0400
X-MC-Unique: qeuWVfInP-SPpm34PCNDFw-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com
 [10.11.54.7])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id BE3F985A5BC;
 Mon, 14 Mar 2022 09:58:10 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.36.112.3])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 944AD1466C50;
 Mon, 14 Mar 2022 09:58:10 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 42EEC21E66CE; Mon, 14 Mar 2022 10:58:09 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: Murilo Opsfelder Araujo <muriloo@linux.ibm.com>
Subject: Re: [PATCH v2] block-qdict: Fix -Werror=maybe-uninitialized build
 failure
References: <20220311221634.58288-1-muriloo@linux.ibm.com>
Date: Mon, 14 Mar 2022 10:58:09 +0100
In-Reply-To: <20220311221634.58288-1-muriloo@linux.ibm.com> (Murilo Opsfelder
 Araujo's message of "Fri, 11 Mar 2022 19:16:34 -0300")
Message-ID: <87o8283lfy.fsf@pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.7
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.129.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: Kevin Wolf <kwolf@redhat.com>, Hanna Reitz <hreitz@redhat.com>,
 mopsfelder@gmail.com, qemu-devel@nongnu.org, qemu-block@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Murilo Opsfelder Araujo <muriloo@linux.ibm.com> writes:

> Building QEMU on Fedora 37 (Rawhide Prerelease) ppc64le failed with the
> following error:
>
>     $ ../configure --prefix=3D/usr/local/qemu-disabletcg --target-list=3D=
ppc-softmmu,ppc64-softmmu --disable-tcg --disable-linux-user
>     ...
>     $ make -j$(nproc)
>     ...
>     FAILED: libqemuutil.a.p/qobject_block-qdict.c.o
>     cc -m64 -mlittle-endian -Ilibqemuutil.a.p -I. -I.. -Isubprojects/libv=
host-user -I../subprojects/libvhost-user -Iqapi -Itrace -Iui -Iui/shader -I=
/usr/include/glib-2.0 -I/usr/lib64/glib-2.0/include -I/usr/include/sysprof-=
4 -I/usr/include/lib
>     mount -I/usr/include/blkid -I/usr/include/gio-unix-2.0 -I/usr/include=
/p11-kit-1 -I/usr/include/pixman-1 -fdiagnostics-color=3Dauto -Wall -Winval=
id-pch -Werror -std=3Dgnu11 -O2 -g -isystem /root/qemu/linux-headers -isyst=
em linux-headers -iquote
>      . -iquote /root/qemu -iquote /root/qemu/include -iquote /root/qemu/d=
isas/libvixl -pthread -U_FORTIFY_SOURCE -D_FORTIFY_SOURCE=3D2 -D_GNU_SOURCE=
 -D_FILE_OFFSET_BITS=3D64 -D_LARGEFILE_SOURCE -Wstrict-prototypes -Wredunda=
nt-decls -Wundef -Wwrite
>     -strings -Wmissing-prototypes -fno-strict-aliasing -fno-common -fwrap=
v -Wold-style-declaration -Wold-style-definition -Wtype-limits -Wformat-sec=
urity -Wformat-y2k -Winit-self -Wignored-qualifiers -Wempty-body -Wnested-e=
xterns -Wendif-label
>     s -Wexpansion-to-defined -Wimplicit-fallthrough=3D2 -Wno-missing-incl=
ude-dirs -Wno-shift-negative-value -Wno-psabi -fstack-protector-strong -fPI=
E -MD -MQ libqemuutil.a.p/qobject_block-qdict.c.o -MF libqemuutil.a.p/qobje=
ct_block-qdict.c.o.d -
>     o libqemuutil.a.p/qobject_block-qdict.c.o -c ../qobject/block-qdict.c
>     In file included from /root/qemu/include/qapi/qmp/qdict.h:16,
>                      from /root/qemu/include/block/qdict.h:13,
>                      from ../qobject/block-qdict.c:11:
>     /root/qemu/include/qapi/qmp/qobject.h: In function =E2=80=98qdict_arr=
ay_split=E2=80=99:
>     /root/qemu/include/qapi/qmp/qobject.h:49:17: error: =E2=80=98subqdict=
=E2=80=99 may be used uninitialized [-Werror=3Dmaybe-uninitialized]
>        49 |     typeof(obj) _obj =3D (obj);                              =
     \
>           |                 ^~~~
>     ../qobject/block-qdict.c:227:16: note: =E2=80=98subqdict=E2=80=99 dec=
lared here
>       227 |         QDict *subqdict;
>           |                ^~~~~~~~
>     cc1: all warnings being treated as errors
>
> Fix build failure by expanding the ternary operation.
> Tested with `make check-unit` (the check-block-qdict test passed).
>
> Signed-off-by: Murilo Opsfelder Araujo <muriloo@linux.ibm.com>
> Cc: Kevin Wolf <kwolf@redhat.com>
> Cc: Hanna Reitz <hreitz@redhat.com>
> Cc: Markus Armbruster <armbru@redhat.com>
> ---
> v1: https://lists.nongnu.org/archive/html/qemu-devel/2022-03/msg03224.htm=
l
>
>  qobject/block-qdict.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/qobject/block-qdict.c b/qobject/block-qdict.c
> index 1487cc5dd8..4a83bda2c3 100644
> --- a/qobject/block-qdict.c
> +++ b/qobject/block-qdict.c
> @@ -251,12 +251,12 @@ void qdict_array_split(QDict *src, QList **dst)
>          if (is_subqdict) {
>              qdict_extract_subqdict(src, &subqdict, prefix);
>              assert(qdict_size(subqdict) > 0);
> +            qlist_append_obj(*dst, QOBJECT(subqdict));
>          } else {
>              qobject_ref(subqobj);
>              qdict_del(src, indexstr);
> +            qlist_append_obj(*dst, subqobj);
>          }
> -
> -        qlist_append_obj(*dst, subqobj ?: QOBJECT(subqdict));
>      }
>  }

Reviewed-by: Markus Armbruster <armbru@redhat.com>


