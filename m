Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 06C2B400B53
	for <lists+qemu-devel@lfdr.de>; Sat,  4 Sep 2021 14:28:32 +0200 (CEST)
Received: from localhost ([::1]:37142 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mMUmc-0001xZ-I3
	for lists+qemu-devel@lfdr.de; Sat, 04 Sep 2021 08:28:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43150)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <qemu_oss@crudebyte.com>)
 id 1mMUlH-0000z1-26; Sat, 04 Sep 2021 08:27:07 -0400
Received: from kylie.crudebyte.com ([5.189.157.229]:35345)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <qemu_oss@crudebyte.com>)
 id 1mMUjs-0001jx-W4; Sat, 04 Sep 2021 08:27:06 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=crudebyte.com; s=kylie; h=Content-Type:Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
 Content-ID:Content-Description;
 bh=Zpei16J8rM2tjQRTfK64h0Z7P572C9xba9WUKHBB9ps=; b=Hndcwxt5N2NDr7p5/+Xa9fIxAC
 EeNMbmfUEfjWG9XwuTsZvnYscP/W7W4M1qhRYNipRUsmcGlQPHAG3Q3st3BpZiqF5jV0h+L6RpmI4
 /scFL4PZLVnEZdFQNgcVAKYClug3ykyTb9oI/ifCySaWWLMtbEdwy5FOQwG2+UI60zTKIj+zp9Nub
 8zmePm1Qzoml2tAi1/dPH+xs2zawMERUimJX21TLO+z/RWTjlHtT6OALAlHKZiuKyWC5Phz8PW63m
 Qryh4Jz/VQDrkbnjLa88aYvenEcnq0DCerMd9f464OkdLrHOm4JMDGQxOlXVe9Jcfn4k34Ru/8Fe9
 pAcHIavmNd+u24CugNPoQCtlPOrQUzoQh2neCyFdO4v7ylrjLoUHfiSaaVXD4rpZe/gBg08mFQOEy
 F5dVEFvdJZRi2VbzqLHqdG0vGXPvG6HBhN5RUThuHzscWKiyhhUKeSgd+EfEZ1R1EOv6q6vR3W5J/
 KT0R0LskyUd38NHSP9GuzNmPH2V18AUEAyATbGGEBdHWhJY4qpa1seOiLV3MsQc6c9F7b9yYGlu1u
 tyxmloCkF8KGJyh7AOYXCusp+EKZ6GUdCz63iAaPP8yfdlY6ptP0lpAoynuxt7t8bzkYC/ExQ78P4
 jkMiiirnXFi/s/XBJvx7/AHOUYq2N362jNtMbz7Oo=;
From: Christian Schoenebeck <qemu_oss@crudebyte.com>
To: Philippe =?ISO-8859-1?Q?Mathieu=2DDaud=E9?= <philmd@redhat.com>
Cc: qemu-devel@nongnu.org, Laurent Vivier <lvivier@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 David Gibson <david@gibson.dropbear.id.au>, Kevin Wolf <kwolf@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Markus Armbruster <armbru@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Jason Wang <jasowang@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 David Hildenbrand <david@redhat.com>, Eduardo Habkost <ehabkost@redhat.com>,
 Eric Blake <eblake@redhat.com>, John Snow <jsnow@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>,
 Alex =?ISO-8859-1?Q?Benn=E9e?= <alex.bennee@linaro.org>,
 Hanna Reitz <hreitz@redhat.com>, qemu-block@nongnu.org, qemu-ppc@nongnu.org,
 "Daniel P . Berrange" <berrange@redhat.com>, Greg Kurz <groug@kaod.org>
Subject: Re: [PATCH v3 07/28] hw/9pfs: Replace g_memdup() by g_memdup2()
Date: Sat, 04 Sep 2021 14:25:28 +0200
Message-ID: <4088864.kWaN8W1rKf@silver>
In-Reply-To: <20210903174510.751630-8-philmd@redhat.com>
References: <20210903174510.751630-1-philmd@redhat.com>
 <20210903174510.751630-8-philmd@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"
Received-SPF: pass client-ip=5.189.157.229;
 envelope-from=qemu_oss@crudebyte.com; helo=kylie.crudebyte.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Freitag, 3. September 2021 19:44:49 CEST Philippe Mathieu-Daud=E9 wrote:
> Per
> https://discourse.gnome.org/t/port-your-module-from-g-memdup-to-g-memdup2=
=2Dn
> ow/5538
>=20
>   The old API took the size of the memory to duplicate as a guint,
>   whereas most memory functions take memory sizes as a gsize. This
>   made it easy to accidentally pass a gsize to g_memdup(). For large
>   values, that would lead to a silent truncation of the size from 64
>   to 32 bits, and result in a heap area being returned which is
>   significantly smaller than what the caller expects. This can likely
>   be exploited in various modules to cause a heap buffer overflow.
>=20
> Replace g_memdup() by the safer g_memdup2() wrapper.
>=20
> Signed-off-by: Philippe Mathieu-Daud=E9 <philmd@redhat.com>
> ---
>  hw/9pfs/9p-synth.c | 2 +-
>  hw/9pfs/9p.c       | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
>=20
> diff --git a/hw/9pfs/9p-synth.c b/hw/9pfs/9p-synth.c
> index b38088e0664..d6168c653d2 100644
> --- a/hw/9pfs/9p-synth.c
> +++ b/hw/9pfs/9p-synth.c
> @@ -497,7 +497,7 @@ static int synth_name_to_path(FsContext *ctx, V9fsPath
> *dir_path, out:
>      /* Copy the node pointer to fid */
>      g_free(target->data);
> -    target->data =3D g_memdup(&node, sizeof(void *));
> +    target->data =3D g_memdup2(&node, sizeof(void *));
>      target->size =3D sizeof(void *);
>      return 0;
>  }

That's Ok, trivial change.

> diff --git a/hw/9pfs/9p.c b/hw/9pfs/9p.c
> index c857b313213..a80166fcaff 100644
> --- a/hw/9pfs/9p.c
> +++ b/hw/9pfs/9p.c
> @@ -202,7 +202,7 @@ void v9fs_path_copy(V9fsPath *dst, const V9fsPath *sr=
c)
>  {
>      v9fs_path_free(dst);
>      dst->size =3D src->size;
> -    dst->data =3D g_memdup(src->data, src->size);
> +    dst->data =3D g_memdup2(src->data, src->size);
>  }
>=20
>  int v9fs_name_to_path(V9fsState *s, V9fsPath *dirpath,

src->size is actually just 16 bit (fsdev/file-op-9p.h):

struct V9fsPath {
    uint16_t size;
    char *data;
};

Should (still) be Ok as well as V9fsPath is about file system pathes which =
are=20
currently limited to 4k (PATH_MAX).

Reviewed-by: Christian Schoenebeck <qemu_oss@crudebyte.com>

Best regards,
Christian Schoenebeck



