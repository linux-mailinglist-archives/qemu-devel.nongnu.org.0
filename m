Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 65DA04C1037
	for <lists+qemu-devel@lfdr.de>; Wed, 23 Feb 2022 11:23:10 +0100 (CET)
Received: from localhost ([::1]:58230 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nMond-0006Er-E2
	for lists+qemu-devel@lfdr.de; Wed, 23 Feb 2022 05:23:09 -0500
Received: from eggs.gnu.org ([209.51.188.92]:37710)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <groug@kaod.org>) id 1nMojM-0003Vj-Nu
 for qemu-devel@nongnu.org; Wed, 23 Feb 2022 05:18:44 -0500
Received: from us-smtp-delivery-44.mimecast.com ([205.139.111.44]:21509)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <groug@kaod.org>) id 1nMojK-0005TX-7Z
 for qemu-devel@nongnu.org; Wed, 23 Feb 2022 05:18:44 -0500
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-668-756J4y8eMHyyDlfBzEuJiQ-1; Wed, 23 Feb 2022 05:18:39 -0500
X-MC-Unique: 756J4y8eMHyyDlfBzEuJiQ-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 3CC121091DA3
 for <qemu-devel@nongnu.org>; Wed, 23 Feb 2022 10:18:38 +0000 (UTC)
Received: from bahia (unknown [10.39.192.175])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 4BBE26C1BE;
 Wed, 23 Feb 2022 10:18:37 +0000 (UTC)
Date: Wed, 23 Feb 2022 11:18:35 +0100
From: Greg Kurz <groug@kaod.org>
To: Hanna Reitz <hreitz@redhat.com>
Subject: Re: [Virtio-fs] [PATCH] virtiofsd: Let meson check for
 statx.stx_mnt_id
Message-ID: <20220223111835.00ef0e83@bahia>
In-Reply-To: <20220223092340.9043-1-hreitz@redhat.com>
References: <20220223092340.9043-1-hreitz@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: kaod.org
Content-Type: text/plain; charset=WINDOWS-1252
Content-Transfer-Encoding: quoted-printable
Received-SPF: softfail client-ip=205.139.111.44; envelope-from=groug@kaod.org;
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
Cc: virtio-fs@redhat.com, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, 23 Feb 2022 10:23:40 +0100
Hanna Reitz <hreitz@redhat.com> wrote:

> In virtiofsd, we assume that the presence of the STATX_MNT_ID macro
> implies existence of the statx.stx_mnt_id field.  Unfortunately, that is
> not necessarily the case: glibc has introduced the macro in its commit
> 88a2cf6c4bab6e94a65e9c0db8813709372e9180, but the statx.stx_mnt_id field
> is still missing from its own headers.
>=20
> Let meson.build actually chek for both STATX_MNT_ID and
> statx.stx_mnt_id, and set CONFIG_STATX_MNT_ID if both are present.
> Then, use this config macro in virtiofsd.
>=20
> Closes: https://gitlab.com/qemu-project/qemu/-/issues/882
> Signed-off-by: Hanna Reitz <hreitz@redhat.com>
> ---

Reviewed-by: Greg Kurz <groug@kaod.org>

>  meson.build                      | 13 +++++++++++++
>  tools/virtiofsd/passthrough_ll.c |  2 +-
>  2 files changed, 14 insertions(+), 1 deletion(-)
>=20
> diff --git a/meson.build b/meson.build
> index 8df40bfac4..a5b63e62cd 100644
> --- a/meson.build
> +++ b/meson.build
> @@ -1306,6 +1306,18 @@ statx_test =3D gnu_source_prefix + '''
> =20
>  has_statx =3D cc.links(statx_test)
> =20
> +# Check whether statx() provides mount ID information
> +
> +statx_mnt_id_test =3D gnu_source_prefix + '''
> +  #include <sys/stat.h>
> +  int main(void) {
> +    struct statx statxbuf;
> +    statx(0, "", 0, STATX_BASIC_STATS | STATX_MNT_ID, &statxbuf);
> +    return statxbuf.stx_mnt_id;
> +  }'''
> +
> +has_statx_mnt_id =3D cc.links(statx_mnt_id_test)
> +
>  have_vhost_user_blk_server =3D get_option('vhost_user_blk_server') \
>    .require(targetos =3D=3D 'linux',
>             error_message: 'vhost_user_blk_server requires linux') \
> @@ -1553,6 +1565,7 @@ config_host_data.set('CONFIG_NETTLE', nettle.found(=
))
>  config_host_data.set('CONFIG_QEMU_PRIVATE_XTS', xts =3D=3D 'private')
>  config_host_data.set('CONFIG_MALLOC_TRIM', has_malloc_trim)
>  config_host_data.set('CONFIG_STATX', has_statx)
> +config_host_data.set('CONFIG_STATX_MNT_ID', has_statx_mnt_id)
>  config_host_data.set('CONFIG_ZSTD', zstd.found())
>  config_host_data.set('CONFIG_FUSE', fuse.found())
>  config_host_data.set('CONFIG_FUSE_LSEEK', fuse_lseek.found())
> diff --git a/tools/virtiofsd/passthrough_ll.c b/tools/virtiofsd/passthrou=
gh_ll.c
> index dfa2fc250d..028dacdd8f 100644
> --- a/tools/virtiofsd/passthrough_ll.c
> +++ b/tools/virtiofsd/passthrough_ll.c
> @@ -1039,7 +1039,7 @@ static int do_statx(struct lo_data *lo, int dirfd, =
const char *pathname,
>  {
>      int res;
> =20
> -#if defined(CONFIG_STATX) && defined(STATX_MNT_ID)
> +#if defined(CONFIG_STATX) && defined(CONFIG_STATX_MNT_ID)
>      if (lo->use_statx) {
>          struct statx statxbuf;
> =20


