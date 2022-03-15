Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 90A174D95B6
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Mar 2022 08:55:08 +0100 (CET)
Received: from localhost ([::1]:33346 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nU21L-0007C5-56
	for lists+qemu-devel@lfdr.de; Tue, 15 Mar 2022 03:55:07 -0400
Received: from eggs.gnu.org ([209.51.188.92]:59066)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <groug@kaod.org>) id 1nU20Q-00068v-Dp
 for qemu-devel@nongnu.org; Tue, 15 Mar 2022 03:54:10 -0400
Received: from us-smtp-delivery-44.mimecast.com ([207.211.30.44]:36981)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <groug@kaod.org>) id 1nU20N-0002nA-EO
 for qemu-devel@nongnu.org; Tue, 15 Mar 2022 03:54:10 -0400
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-41-wQ12KsT-PDSqq8y9SNA3Rw-1; Tue, 15 Mar 2022 03:53:56 -0400
X-MC-Unique: wQ12KsT-PDSqq8y9SNA3Rw-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 25BE18001EA;
 Tue, 15 Mar 2022 07:53:54 +0000 (UTC)
Received: from bahia (unknown [10.39.192.202])
 by smtp.corp.redhat.com (Postfix) with ESMTP id ED3FC7CB810;
 Tue, 15 Mar 2022 07:53:43 +0000 (UTC)
Date: Tue, 15 Mar 2022 08:53:42 +0100
From: Greg Kurz <groug@kaod.org>
To: Markus Armbruster <armbru@redhat.com>
Subject: Re: [PATCH 2/3] 9pfs: Use g_new() & friends where that makes
 obvious sense
Message-ID: <20220315085342.2b07eff8@bahia>
In-Reply-To: <20220314160108.1440470-3-armbru@redhat.com>
References: <20220314160108.1440470-1-armbru@redhat.com>
 <20220314160108.1440470-3-armbru@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.9
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=groug@kaod.org
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: kaod.org
Content-Type: text/plain; charset=WINDOWS-1252
Content-Transfer-Encoding: quoted-printable
Received-SPF: softfail client-ip=207.211.30.44; envelope-from=groug@kaod.org;
 helo=us-smtp-delivery-44.mimecast.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_LOW=-0.7,
 SPF_HELO_NONE=0.001, SPF_SOFTFAIL=0.665,
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Daniel Henrique Barboza <danielhb413@gmail.com>, kvm@vger.kernel.org,
 "Michael S. Tsirkin" <mst@redhat.com>, Jason Wang <jasowang@redhat.com>,
 Christian Schoenebeck <qemu_oss@crudebyte.com>, qemu-devel@nongnu.org,
 Peter Xu <peterx@redhat.com>, Klaus Jensen <its@irrelevant.dk>,
 KONRAD Frederic <frederic.konrad@adacore.com>,
 Konstantin Kostiuk <kkostiuk@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>,
 Ani Sinha <ani@anisinha.ca>, Reinoud Zandijk <reinoud@netbsd.org>,
 Eric Blake <eblake@redhat.com>, Sunil Muthuswamy <sunilmut@microsoft.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org,
 Yoshinori Sato <ysato@users.sourceforge.jp>,
 Juan Quintela <quintela@redhat.com>, John Snow <jsnow@redhat.com>,
 Paul Durrant <paul@xen.org>, Magnus Damm <magnus.damm@gmail.com>,
 Kamil Rytarowski <kamil@netbsd.org>,
 "Gonglei \(Arei\)" <arei.gonglei@huawei.com>,
 =?UTF-8?B?SGVy?= =?UTF-8?B?dsOp?= Poussineau <hpoussin@reactos.org>,
 Michael Roth <michael.roth@amd.com>,
 Anthony Perard <anthony.perard@citrix.com>,
 =?UTF-8?B?TWFyYy1BbmRyw6k=?= Lureau <marcandre.lureau@redhat.com>,
 Artyom Tarasenko <atar4qemu@gmail.com>, Laurent Vivier <lvivier@redhat.com>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>, Amit Shah <amit@kernel.org>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>, haxm-team@intel.com,
 Richard Henderson <richard.henderson@linaro.org>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Fabien Chouteau <chouteau@adacore.com>, Yuval Shaia <yuval.shaia.ml@gmail.com>,
 Thomas Huth <thuth@redhat.com>, Eric Auger <eric.auger@redhat.com>,
 Alex Williamson <alex.williamson@redhat.com>, qemu-arm@nongnu.org,
 =?UTF-8?B?Q8Op?= =?UTF-8?B?ZHJpYw==?= Le Goater <clg@kaod.org>,
 Pavel Dovgalyuk <pavel.dovgaluk@ispras.ru>,
 Paolo Bonzini <pbonzini@redhat.com>, Keith Busch <kbusch@kernel.org>,
 qemu-ppc@nongnu.org, David Hildenbrand <david@redhat.com>,
 Alex =?UTF-8?B?QmVubsOpZQ==?= <alex.bennee@linaro.org>,
 David Gibson <david@gibson.dropbear.id.au>,
 Eduardo Habkost <eduardo@habkost.net>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 "Daniel P. =?UTF-8?B?QmVycmFuZ8Op?=" <berrange@redhat.com>,
 qemu-block@nongnu.org, Max Filippov <jcmvbkbc@gmail.com>,
 qemu-s390x@nongnu.org, Patrick Venture <venture@google.com>,
 Cornelia Huck <cohuck@redhat.com>,
 Philippe =?UTF-8?B?TWF0aGlldS1EYXVkw6k=?= <f4bug@amsat.org>,
 Jean-Christophe Dubois <jcd@tribudubois.net>,
 Corey Minyard <cminyard@mvista.com>, Wenchao Wang <wenchao.wang@intel.com>,
 Igor Mammedov <imammedo@redhat.com>, Colin Xu <colin.xu@intel.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, 14 Mar 2022 17:01:07 +0100
Markus Armbruster <armbru@redhat.com> wrote:

> g_new(T, n) is neater than g_malloc(sizeof(T) * n).  It's also safer,
> for two reasons.  One, it catches multiplication overflowing size_t.
> Two, it returns T * rather than void *, which lets the compiler catch
> more type errors.
>=20
> This commit only touches allocations with size arguments of the form
> sizeof(T).
>=20
> Patch created mechanically with:
>=20
>     $ spatch --in-place --sp-file scripts/coccinelle/use-g_new-etc.cocci =
\
> =09     --macro-file scripts/cocci-macro-file.h FILES...
>=20
> Except this uncovers a typing error:
>=20
>     ../hw/9pfs/9p.c:855:13: warning: incompatible pointer types assigning=
 to 'QpfEntry *' from 'QppEntry *' [-Wincompatible-pointer-types]
> =09    val =3D g_new0(QppEntry, 1);
> =09=09^ ~~~~~~~~~~~~~~~~~~~
>     1 warning generated.
>=20
> Harmless, because QppEntry is larger than QpfEntry.  Fix to allocate a
> QpfEntry instead.
>=20
> Cc: Greg Kurz <groug@kaod.org>
> Cc: Christian Schoenebeck <qemu_oss@crudebyte.com>
> Signed-off-by: Markus Armbruster <armbru@redhat.com>
> ---

Reviewed-by: Greg Kurz <groug@kaod.org>

>  hw/9pfs/9p-proxy.c           | 2 +-
>  hw/9pfs/9p-synth.c           | 4 ++--
>  hw/9pfs/9p.c                 | 8 ++++----
>  hw/9pfs/codir.c              | 6 +++---
>  tests/qtest/virtio-9p-test.c | 4 ++--
>  5 files changed, 12 insertions(+), 12 deletions(-)
>=20
> diff --git a/hw/9pfs/9p-proxy.c b/hw/9pfs/9p-proxy.c
> index 8b4b5cf7dc..4c5e0fc217 100644
> --- a/hw/9pfs/9p-proxy.c
> +++ b/hw/9pfs/9p-proxy.c
> @@ -1187,7 +1187,7 @@ static int proxy_parse_opts(QemuOpts *opts, FsDrive=
rEntry *fs, Error **errp)
> =20
>  static int proxy_init(FsContext *ctx, Error **errp)
>  {
> -    V9fsProxy *proxy =3D g_malloc(sizeof(V9fsProxy));
> +    V9fsProxy *proxy =3D g_new(V9fsProxy, 1);
>      int sock_id;
> =20
>      if (ctx->export_flags & V9FS_PROXY_SOCK_NAME) {
> diff --git a/hw/9pfs/9p-synth.c b/hw/9pfs/9p-synth.c
> index b3080e415b..d99d263985 100644
> --- a/hw/9pfs/9p-synth.c
> +++ b/hw/9pfs/9p-synth.c
> @@ -49,7 +49,7 @@ static V9fsSynthNode *v9fs_add_dir_node(V9fsSynthNode *=
parent, int mode,
> =20
>      /* Add directory type and remove write bits */
>      mode =3D ((mode & 0777) | S_IFDIR) & ~(S_IWUSR | S_IWGRP | S_IWOTH);
> -    node =3D g_malloc0(sizeof(V9fsSynthNode));
> +    node =3D g_new0(V9fsSynthNode, 1);
>      if (attr) {
>          /* We are adding .. or . entries */
>          node->attr =3D attr;
> @@ -128,7 +128,7 @@ int qemu_v9fs_synth_add_file(V9fsSynthNode *parent, i=
nt mode,
>      }
>      /* Add file type and remove write bits */
>      mode =3D ((mode & 0777) | S_IFREG);
> -    node =3D g_malloc0(sizeof(V9fsSynthNode));
> +    node =3D g_new0(V9fsSynthNode, 1);
>      node->attr         =3D &node->actual_attr;
>      node->attr->inode  =3D synth_node_count++;
>      node->attr->nlink  =3D 1;
> diff --git a/hw/9pfs/9p.c b/hw/9pfs/9p.c
> index a6d6b3f835..8e9d4aea73 100644
> --- a/hw/9pfs/9p.c
> +++ b/hw/9pfs/9p.c
> @@ -324,7 +324,7 @@ static V9fsFidState *alloc_fid(V9fsState *s, int32_t =
fid)
>              return NULL;
>          }
>      }
> -    f =3D g_malloc0(sizeof(V9fsFidState));
> +    f =3D g_new0(V9fsFidState, 1);
>      f->fid =3D fid;
>      f->fid_type =3D P9_FID_NONE;
>      f->ref =3D 1;
> @@ -804,7 +804,7 @@ static int qid_inode_prefix_hash_bits(V9fsPDU *pdu, d=
ev_t dev)
> =20
>      val =3D qht_lookup(&pdu->s->qpd_table, &lookup, hash);
>      if (!val) {
> -        val =3D g_malloc0(sizeof(QpdEntry));
> +        val =3D g_new0(QpdEntry, 1);
>          *val =3D lookup;
>          affix =3D affixForIndex(pdu->s->qp_affix_next);
>          val->prefix_bits =3D affix.bits;
> @@ -852,7 +852,7 @@ static int qid_path_fullmap(V9fsPDU *pdu, const struc=
t stat *stbuf,
>              return -ENFILE;
>          }
> =20
> -        val =3D g_malloc0(sizeof(QppEntry));
> +        val =3D g_new0(QpfEntry, 1);
>          *val =3D lookup;
> =20
>          /* new unique inode and device combo */
> @@ -928,7 +928,7 @@ static int qid_path_suffixmap(V9fsPDU *pdu, const str=
uct stat *stbuf,
>              return -ENFILE;
>          }
> =20
> -        val =3D g_malloc0(sizeof(QppEntry));
> +        val =3D g_new0(QppEntry, 1);
>          *val =3D lookup;
> =20
>          /* new unique inode affix and device combo */
> diff --git a/hw/9pfs/codir.c b/hw/9pfs/codir.c
> index 75148bc985..93ba44fb75 100644
> --- a/hw/9pfs/codir.c
> +++ b/hw/9pfs/codir.c
> @@ -141,9 +141,9 @@ static int do_readdir_many(V9fsPDU *pdu, V9fsFidState=
 *fidp,
> =20
>          /* append next node to result chain */
>          if (!e) {
> -            *entries =3D e =3D g_malloc0(sizeof(V9fsDirEnt));
> +            *entries =3D e =3D g_new0(V9fsDirEnt, 1);
>          } else {
> -            e =3D e->next =3D g_malloc0(sizeof(V9fsDirEnt));
> +            e =3D e->next =3D g_new0(V9fsDirEnt, 1);
>          }
>          e->dent =3D qemu_dirent_dup(dent);
> =20
> @@ -163,7 +163,7 @@ static int do_readdir_many(V9fsPDU *pdu, V9fsFidState=
 *fidp,
>                  break;
>              }
> =20
> -            e->st =3D g_malloc0(sizeof(struct stat));
> +            e->st =3D g_new0(struct stat, 1);
>              memcpy(e->st, &stbuf, sizeof(struct stat));
>          }
> =20
> diff --git a/tests/qtest/virtio-9p-test.c b/tests/qtest/virtio-9p-test.c
> index 01ca076afe..e28c71bd8f 100644
> --- a/tests/qtest/virtio-9p-test.c
> +++ b/tests/qtest/virtio-9p-test.c
> @@ -468,12 +468,12 @@ static void v9fs_rreaddir(P9Req *req, uint32_t *cou=
nt, uint32_t *nentries,
>           togo -=3D 13 + 8 + 1 + 2 + slen, ++n)
>      {
>          if (!e) {
> -            e =3D g_malloc(sizeof(struct V9fsDirent));
> +            e =3D g_new(struct V9fsDirent, 1);
>              if (entries) {
>                  *entries =3D e;
>              }
>          } else {
> -            e =3D e->next =3D g_malloc(sizeof(struct V9fsDirent));
> +            e =3D e->next =3D g_new(struct V9fsDirent, 1);
>          }
>          e->next =3D NULL;
>          /* qid[13] offset[8] type[1] name[s] */


