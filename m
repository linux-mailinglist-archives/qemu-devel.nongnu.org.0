Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A7EB4D8A19
	for <lists+qemu-devel@lfdr.de>; Mon, 14 Mar 2022 17:45:04 +0100 (CET)
Received: from localhost ([::1]:55834 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nTnod-0004Ea-LF
	for lists+qemu-devel@lfdr.de; Mon, 14 Mar 2022 12:45:03 -0400
Received: from eggs.gnu.org ([209.51.188.92]:57728)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <qemu_oss@crudebyte.com>)
 id 1nTnnS-0002Qu-3E; Mon, 14 Mar 2022 12:43:50 -0400
Received: from lizzy.crudebyte.com ([91.194.90.13]:39841)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <qemu_oss@crudebyte.com>)
 id 1nTnnP-0008DA-R0; Mon, 14 Mar 2022 12:43:49 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=crudebyte.com; s=lizzy; h=Content-Type:Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
 Content-ID:Content-Description;
 bh=X9tSXtWCri/hff0a9zIvHAJ+K/ajCEfv9fmgag7jonU=; b=olij9WvSjv6xdim1cbGpj8UPsg
 FY1Ws1a9cPilYbWq3IW7INBPNKYmbbJ4XPtSJhNExhYjIizE+2j2YqCTb9hNuwpqxBITJDgq8N4AW
 SBv/hqAvxfYpS70Dww12ZXL0bKIikp7ImlQUsEzTM5FPfx7yqjr0C7HxZUwOTKMjVFBSYWCeVmIMS
 BsCQrcWpRL78fJPmuJaAmF77cB2Tm+OnXAZAlGchUBblvAxZXfcGqa8EV6L4Vax829SPU0Ah4kMhO
 0qDKLota/IjpNlwPx+FNLMji5CMsztm+/q73XD+5zYQ1ntHFEjA++9KNh+xQoiFEy3hlpY784hCOQ
 Hd4Rw+dg==;
From: Christian Schoenebeck <qemu_oss@crudebyte.com>
To: qemu-devel@nongnu.org
Cc: Markus Armbruster <armbru@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Daniel Henrique Barboza <danielhb413@gmail.com>, kvm@vger.kernel.org,
 "Michael S. Tsirkin" <mst@redhat.com>, Jason Wang <jasowang@redhat.com>,
 Yuval Shaia <yuval.shaia.ml@gmail.com>, Peter Xu <peterx@redhat.com>,
 Klaus Jensen <its@irrelevant.dk>,
 KONRAD Frederic <frederic.konrad@adacore.com>,
 Konstantin Kostiuk <kkostiuk@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>,
 Ani Sinha <ani@anisinha.ca>, Reinoud Zandijk <reinoud@netbsd.org>,
 Eric Blake <eblake@redhat.com>, Sunil Muthuswamy <sunilmut@microsoft.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org,
 Yoshinori Sato <ysato@users.sourceforge.jp>,
 Juan Quintela <quintela@redhat.com>, John Snow <jsnow@redhat.com>,
 Paul Durrant <paul@xen.org>, Magnus Damm <magnus.damm@gmail.com>,
 Kamil Rytarowski <kamil@netbsd.org>,
 "Gonglei (Arei)" <arei.gonglei@huawei.com>,
 =?ISO-8859-1?Q?Herv=E9?= Poussineau <hpoussin@reactos.org>,
 Michael Roth <michael.roth@amd.com>,
 Anthony Perard <anthony.perard@citrix.com>,
 =?ISO-8859-1?Q?Marc=2DAndr=E9?= Lureau <marcandre.lureau@redhat.com>,
 Artyom Tarasenko <atar4qemu@gmail.com>, Laurent Vivier <lvivier@redhat.com>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>, Amit Shah <amit@kernel.org>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>, haxm-team@intel.com,
 Richard Henderson <richard.henderson@linaro.org>, Greg Kurz <groug@kaod.org>,
 Fabien Chouteau <chouteau@adacore.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Eric Auger <eric.auger@redhat.com>,
 Alex Williamson <alex.williamson@redhat.com>, qemu-arm@nongnu.org,
 =?ISO-8859-1?Q?C=E9dric?= Le Goater <clg@kaod.org>,
 Pavel Dovgalyuk <pavel.dovgaluk@ispras.ru>,
 Paolo Bonzini <pbonzini@redhat.com>, Keith Busch <kbusch@kernel.org>,
 qemu-ppc@nongnu.org, David Hildenbrand <david@redhat.com>,
 Alex =?ISO-8859-1?Q?Benn=E9e?= <alex.bennee@linaro.org>,
 David Gibson <david@gibson.dropbear.id.au>,
 Eduardo Habkost <eduardo@habkost.net>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 Daniel =?ISO-8859-1?Q?P=2E_Berrang=E9?= <berrange@redhat.com>,
 qemu-block@nongnu.org, Max Filippov <jcmvbkbc@gmail.com>,
 qemu-s390x@nongnu.org, Patrick Venture <venture@google.com>,
 Cornelia Huck <cohuck@redhat.com>,
 Philippe =?ISO-8859-1?Q?Mathieu=2DDaud=E9?= <f4bug@amsat.org>,
 Jean-Christophe Dubois <jcd@tribudubois.net>,
 Corey Minyard <cminyard@mvista.com>, Wenchao Wang <wenchao.wang@intel.com>,
 Igor Mammedov <imammedo@redhat.com>, Colin Xu <colin.xu@intel.com>
Subject: Re: [PATCH 2/3] 9pfs: Use g_new() & friends where that makes obvious
 sense
Date: Mon, 14 Mar 2022 17:42:49 +0100
Message-ID: <2292394.T0kE68JRDY@silver>
In-Reply-To: <20220314160108.1440470-3-armbru@redhat.com>
References: <20220314160108.1440470-1-armbru@redhat.com>
 <20220314160108.1440470-3-armbru@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"
Received-SPF: pass client-ip=91.194.90.13; envelope-from=qemu_oss@crudebyte.com;
 helo=lizzy.crudebyte.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Montag, 14. M=E4rz 2022 17:01:07 CET Markus Armbruster wrote:
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
>     $ spatch --in-place --sp-file scripts/coccinelle/use-g_new-etc.cocci \
> 	     --macro-file scripts/cocci-macro-file.h FILES...
>=20
> Except this uncovers a typing error:
>=20
>     ../hw/9pfs/9p.c:855:13: warning: incompatible pointer types assigning=
 to
> 'QpfEntry *' from 'QppEntry *' [-Wincompatible-pointer-types] val =3D
> g_new0(QppEntry, 1);
> 		^ ~~~~~~~~~~~~~~~~~~~
>     1 warning generated.
>=20
> Harmless, because QppEntry is larger than QpfEntry.  Fix to allocate a
> QpfEntry instead.
>=20
> Cc: Greg Kurz <groug@kaod.org>
> Cc: Christian Schoenebeck <qemu_oss@crudebyte.com>
> Signed-off-by: Markus Armbruster <armbru@redhat.com>
> ---

Reviewed-by: Christian Schoenebeck <qemu_oss@crudebyte.com>

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
> @@ -1187,7 +1187,7 @@ static int proxy_parse_opts(QemuOpts *opts,
> FsDriverEntry *fs, Error **errp)
>=20
>  static int proxy_init(FsContext *ctx, Error **errp)
>  {
> -    V9fsProxy *proxy =3D g_malloc(sizeof(V9fsProxy));
> +    V9fsProxy *proxy =3D g_new(V9fsProxy, 1);
>      int sock_id;
>=20
>      if (ctx->export_flags & V9FS_PROXY_SOCK_NAME) {
> diff --git a/hw/9pfs/9p-synth.c b/hw/9pfs/9p-synth.c
> index b3080e415b..d99d263985 100644
> --- a/hw/9pfs/9p-synth.c
> +++ b/hw/9pfs/9p-synth.c
> @@ -49,7 +49,7 @@ static V9fsSynthNode *v9fs_add_dir_node(V9fsSynthNode
> *parent, int mode,
>=20
>      /* Add directory type and remove write bits */
>      mode =3D ((mode & 0777) | S_IFDIR) & ~(S_IWUSR | S_IWGRP | S_IWOTH);
> -    node =3D g_malloc0(sizeof(V9fsSynthNode));
> +    node =3D g_new0(V9fsSynthNode, 1);
>      if (attr) {
>          /* We are adding .. or . entries */
>          node->attr =3D attr;
> @@ -128,7 +128,7 @@ int qemu_v9fs_synth_add_file(V9fsSynthNode *parent, i=
nt
> mode, }
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
> @@ -324,7 +324,7 @@ static V9fsFidState *alloc_fid(V9fsState *s, int32_t
> fid) return NULL;
>          }
>      }
> -    f =3D g_malloc0(sizeof(V9fsFidState));
> +    f =3D g_new0(V9fsFidState, 1);
>      f->fid =3D fid;
>      f->fid_type =3D P9_FID_NONE;
>      f->ref =3D 1;
> @@ -804,7 +804,7 @@ static int qid_inode_prefix_hash_bits(V9fsPDU *pdu,
> dev_t dev)
>=20
>      val =3D qht_lookup(&pdu->s->qpd_table, &lookup, hash);
>      if (!val) {
> -        val =3D g_malloc0(sizeof(QpdEntry));
> +        val =3D g_new0(QpdEntry, 1);
>          *val =3D lookup;
>          affix =3D affixForIndex(pdu->s->qp_affix_next);
>          val->prefix_bits =3D affix.bits;
> @@ -852,7 +852,7 @@ static int qid_path_fullmap(V9fsPDU *pdu, const struct
> stat *stbuf, return -ENFILE;
>          }
>=20
> -        val =3D g_malloc0(sizeof(QppEntry));
> +        val =3D g_new0(QpfEntry, 1);
>          *val =3D lookup;
>=20
>          /* new unique inode and device combo */
> @@ -928,7 +928,7 @@ static int qid_path_suffixmap(V9fsPDU *pdu, const str=
uct
> stat *stbuf, return -ENFILE;
>          }
>=20
> -        val =3D g_malloc0(sizeof(QppEntry));
> +        val =3D g_new0(QppEntry, 1);
>          *val =3D lookup;
>=20
>          /* new unique inode affix and device combo */
> diff --git a/hw/9pfs/codir.c b/hw/9pfs/codir.c
> index 75148bc985..93ba44fb75 100644
> --- a/hw/9pfs/codir.c
> +++ b/hw/9pfs/codir.c
> @@ -141,9 +141,9 @@ static int do_readdir_many(V9fsPDU *pdu, V9fsFidState
> *fidp,
>=20
>          /* append next node to result chain */
>          if (!e) {
> -            *entries =3D e =3D g_malloc0(sizeof(V9fsDirEnt));
> +            *entries =3D e =3D g_new0(V9fsDirEnt, 1);
>          } else {
> -            e =3D e->next =3D g_malloc0(sizeof(V9fsDirEnt));
> +            e =3D e->next =3D g_new0(V9fsDirEnt, 1);
>          }
>          e->dent =3D qemu_dirent_dup(dent);
>=20
> @@ -163,7 +163,7 @@ static int do_readdir_many(V9fsPDU *pdu, V9fsFidState
> *fidp, break;
>              }
>=20
> -            e->st =3D g_malloc0(sizeof(struct stat));
> +            e->st =3D g_new0(struct stat, 1);
>              memcpy(e->st, &stbuf, sizeof(struct stat));
>          }
>=20
> diff --git a/tests/qtest/virtio-9p-test.c b/tests/qtest/virtio-9p-test.c
> index 01ca076afe..e28c71bd8f 100644
> --- a/tests/qtest/virtio-9p-test.c
> +++ b/tests/qtest/virtio-9p-test.c
> @@ -468,12 +468,12 @@ static void v9fs_rreaddir(P9Req *req, uint32_t *cou=
nt,
> uint32_t *nentries, togo -=3D 13 + 8 + 1 + 2 + slen, ++n)
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



