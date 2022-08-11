Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C15C58F8F3
	for <lists+qemu-devel@lfdr.de>; Thu, 11 Aug 2022 10:21:42 +0200 (CEST)
Received: from localhost ([::1]:43708 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oM3Rl-0007MR-LX
	for lists+qemu-devel@lfdr.de; Thu, 11 Aug 2022 04:21:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59328)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <leobras@redhat.com>)
 id 1oM3HW-0008LB-T1
 for qemu-devel@nongnu.org; Thu, 11 Aug 2022 04:11:07 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:30027)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <leobras@redhat.com>)
 id 1oM3HQ-0000Gc-7S
 for qemu-devel@nongnu.org; Thu, 11 Aug 2022 04:11:02 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1660205457;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=1dc5draMqMZhQvGrfM84ncToNvoGpIcqL1sNf53wWSE=;
 b=Lri5QkjTW1MebfNSPm7SKBDIknlFWsV99Y4/j80LTLes2jJvfDjvy5T1PdnhcA33QQwENG
 D3V6uLaLoyKDxQH1m1nunLShV0d0APs3V4BkPTcBUPhgx37gmDC+JdD8CWvLJpfINwlAEk
 KRIaalSEjliYRI0ji6dj4DBBY49nQuY=
Received: from mail-ua1-f70.google.com (mail-ua1-f70.google.com
 [209.85.222.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-629-LKY6roeAPZe9XiL_SJR9JQ-1; Thu, 11 Aug 2022 04:10:56 -0400
X-MC-Unique: LKY6roeAPZe9XiL_SJR9JQ-1
Received: by mail-ua1-f70.google.com with SMTP id
 p6-20020a9f3806000000b00384ca6cf4c3so3280968uad.5
 for <qemu-devel@nongnu.org>; Thu, 11 Aug 2022 01:10:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=mime-version:user-agent:content-transfer-encoding:references
 :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
 :from:to:cc;
 bh=1dc5draMqMZhQvGrfM84ncToNvoGpIcqL1sNf53wWSE=;
 b=YF8Lc57NFvmK+/H48SWKR5yjekPdSfPy1kloJdlX2KIXGYxKs5phctwLJfzW6W7GYY
 vp61nAIkkwXlj999Z5OhwWyPfirKPg7KCdJDWeR6k7ovE+HMstUId9W6PqIcQUJWCHs5
 NTp5soktxeV4NZQiw/rQ8iNiVGTwQ6ckDoZ4i94YFImi/cRp0JlyhQnEvNYeQWNcN97/
 A2fdktZJyUrsMtg7Y1P816uRKzYfgjbPJTgN/H/76ycxi+eJwxtGKK1/UFBVhjvJfLPT
 B28RmfTLdt+QGxybXsWJX+duNrRaxye1LMGbXiYXzVAdE1jFbpiMsZRpfQv5J8HmFUsG
 gyHg==
X-Gm-Message-State: ACgBeo3iL+XOjzDixNUhqv7TQf1zuy66yNBv58OT0iLeg6gE+nm81y9f
 sT9nWljaimx5nGxtkoIIVIm09J8kqSHuxmn1rnYWWjDWBTHDWc3LGWWo7G2NyW71ui/kCZPlt1r
 Vh0IKhGwaa81Hk38=
X-Received: by 2002:a67:f887:0:b0:388:9beb:9075 with SMTP id
 h7-20020a67f887000000b003889beb9075mr8974938vso.61.1660205456134; 
 Thu, 11 Aug 2022 01:10:56 -0700 (PDT)
X-Google-Smtp-Source: AA6agR4v1/ZPJRhKblIQQq3bsCsRSotN9oHc5/S7suJznfEZCqlRVgJrvj4XjcCyzxFbWfMqLo5GJw==
X-Received: by 2002:a67:f887:0:b0:388:9beb:9075 with SMTP id
 h7-20020a67f887000000b003889beb9075mr8974930vso.61.1660205455879; 
 Thu, 11 Aug 2022 01:10:55 -0700 (PDT)
Received: from ?IPv6:2804:1b3:a800:5713:6880:fd74:a3e5:2086?
 ([2804:1b3:a800:5713:6880:fd74:a3e5:2086])
 by smtp.gmail.com with ESMTPSA id
 81-20020a1f1454000000b003770952298dsm1397582vku.21.2022.08.11.01.10.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 11 Aug 2022 01:10:55 -0700 (PDT)
Message-ID: <7b781bcb37cda71e3cd19364940719f832573462.camel@redhat.com>
Subject: Re: [PATCH v7 01/12] multifd: Create page_size fields into both
 MultiFD{Recv,Send}Params
From: Leonardo =?ISO-8859-1?Q?Br=E1s?= <leobras@redhat.com>
To: Juan Quintela <quintela@redhat.com>, qemu-devel@nongnu.org
Cc: Marcel Apfelbaum <marcel.apfelbaum@gmail.com>, "Dr. David Alan Gilbert"
 <dgilbert@redhat.com>, Peter Xu <peterx@redhat.com>, Eric Blake
 <eblake@redhat.com>, Philippe =?ISO-8859-1?Q?Mathieu-Daud=E9?=
 <f4bug@amsat.org>,  Yanan Wang <wangyanan55@huawei.com>, Markus Armbruster
 <armbru@redhat.com>, Eduardo Habkost <eduardo@habkost.net>
Date: Thu, 11 Aug 2022 05:10:51 -0300
In-Reply-To: <20220802063907.18882-2-quintela@redhat.com>
References: <20220802063907.18882-1-quintela@redhat.com>
 <20220802063907.18882-2-quintela@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.44.3 
MIME-Version: 1.0
Received-SPF: pass client-ip=170.10.129.124; envelope-from=leobras@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

Hello Juan,

On Tue, 2022-08-02 at 08:38 +0200, Juan Quintela wrote:
> We were calling qemu_target_page_size() left and right.
>=20
> Signed-off-by: Juan Quintela <quintela@redhat.com>

IMHO looks a good idea to bring that info inside the multifd parameters.

> ---
>  migration/multifd.h      |  4 ++++
>  migration/multifd-zlib.c | 14 ++++++--------
>  migration/multifd-zstd.c | 12 +++++-------
>  migration/multifd.c      | 18 ++++++++----------
>  4 files changed, 23 insertions(+), 25 deletions(-)
>=20
> diff --git a/migration/multifd.h b/migration/multifd.h
> index 519f498643..86fb9982b3 100644
> --- a/migration/multifd.h
> +++ b/migration/multifd.h
> @@ -80,6 +80,8 @@ typedef struct {
>      bool registered_yank;
>      /* packet allocated len */
>      uint32_t packet_len;
> +    /* guest page size */
> +    uint32_t page_size;
>      /* multifd flags for sending ram */
>      int write_flags;
> =20
> @@ -143,6 +145,8 @@ typedef struct {
>      QIOChannel *c;
>      /* packet allocated len */
>      uint32_t packet_len;
> +    /* guest page size */
> +    uint32_t page_size;
> =20
>      /* syncs main thread and channels */
>      QemuSemaphore sem_sync;
> diff --git a/migration/multifd-zlib.c b/migration/multifd-zlib.c
> index 18213a9513..37770248e1 100644
> --- a/migration/multifd-zlib.c
> +++ b/migration/multifd-zlib.c
> @@ -116,7 +116,6 @@ static void zlib_send_cleanup(MultiFDSendParams *p, E=
rror **errp)
>  static int zlib_send_prepare(MultiFDSendParams *p, Error **errp)
>  {
>      struct zlib_data *z =3D p->data;
> -    size_t page_size =3D qemu_target_page_size();
>      z_stream *zs =3D &z->zs;
>      uint32_t out_size =3D 0;
>      int ret;
> @@ -135,8 +134,8 @@ static int zlib_send_prepare(MultiFDSendParams *p, Er=
ror **errp)
>           * with compression. zlib does not guarantee that this is safe,
>           * therefore copy the page before calling deflate().
>           */
> -        memcpy(z->buf, p->pages->block->host + p->normal[i], page_size);
> -        zs->avail_in =3D page_size;
> +        memcpy(z->buf, p->pages->block->host + p->normal[i], p->page_siz=
e);
> +        zs->avail_in =3D p->page_size;
>          zs->next_in =3D z->buf;
> =20
>          zs->avail_out =3D available;
> @@ -242,12 +241,11 @@ static void zlib_recv_cleanup(MultiFDRecvParams *p)
>  static int zlib_recv_pages(MultiFDRecvParams *p, Error **errp)
>  {
>      struct zlib_data *z =3D p->data;
> -    size_t page_size =3D qemu_target_page_size();
>      z_stream *zs =3D &z->zs;
>      uint32_t in_size =3D p->next_packet_size;
>      /* we measure the change of total_out */
>      uint32_t out_size =3D zs->total_out;
> -    uint32_t expected_size =3D p->normal_num * page_size;
> +    uint32_t expected_size =3D p->normal_num * p->page_size;
>      uint32_t flags =3D p->flags & MULTIFD_FLAG_COMPRESSION_MASK;
>      int ret;
>      int i;
> @@ -274,7 +272,7 @@ static int zlib_recv_pages(MultiFDRecvParams *p, Erro=
r **errp)
>              flush =3D Z_SYNC_FLUSH;
>          }
> =20
> -        zs->avail_out =3D page_size;
> +        zs->avail_out =3D p->page_size;
>          zs->next_out =3D p->host + p->normal[i];
> =20
>          /*
> @@ -288,8 +286,8 @@ static int zlib_recv_pages(MultiFDRecvParams *p, Erro=
r **errp)
>          do {
>              ret =3D inflate(zs, flush);
>          } while (ret =3D=3D Z_OK && zs->avail_in
> -                             && (zs->total_out - start) < page_size);
> -        if (ret =3D=3D Z_OK && (zs->total_out - start) < page_size) {
> +                             && (zs->total_out - start) < p->page_size);
> +        if (ret =3D=3D Z_OK && (zs->total_out - start) < p->page_size) {
>              error_setg(errp, "multifd %u: inflate generated too few outp=
ut",
>                         p->id);
>              return -1;
> diff --git a/migration/multifd-zstd.c b/migration/multifd-zstd.c
> index d788d309f2..f4a8e1ed1f 100644
> --- a/migration/multifd-zstd.c
> +++ b/migration/multifd-zstd.c
> @@ -113,7 +113,6 @@ static void zstd_send_cleanup(MultiFDSendParams *p, E=
rror **errp)
>  static int zstd_send_prepare(MultiFDSendParams *p, Error **errp)
>  {
>      struct zstd_data *z =3D p->data;
> -    size_t page_size =3D qemu_target_page_size();
>      int ret;
>      uint32_t i;
> =20
> @@ -128,7 +127,7 @@ static int zstd_send_prepare(MultiFDSendParams *p, Er=
ror **errp)
>              flush =3D ZSTD_e_flush;
>          }
>          z->in.src =3D p->pages->block->host + p->normal[i];
> -        z->in.size =3D page_size;
> +        z->in.size =3D p->page_size;
>          z->in.pos =3D 0;
> =20
>          /*
> @@ -241,8 +240,7 @@ static int zstd_recv_pages(MultiFDRecvParams *p, Erro=
r **errp)
>  {
>      uint32_t in_size =3D p->next_packet_size;
>      uint32_t out_size =3D 0;
> -    size_t page_size =3D qemu_target_page_size();
> -    uint32_t expected_size =3D p->normal_num * page_size;
> +    uint32_t expected_size =3D p->normal_num * p->page_size;
>      uint32_t flags =3D p->flags & MULTIFD_FLAG_COMPRESSION_MASK;
>      struct zstd_data *z =3D p->data;
>      int ret;
> @@ -265,7 +263,7 @@ static int zstd_recv_pages(MultiFDRecvParams *p, Erro=
r **errp)
> =20
>      for (i =3D 0; i < p->normal_num; i++) {
>          z->out.dst =3D p->host + p->normal[i];
> -        z->out.size =3D page_size;
> +        z->out.size =3D p->page_size;
>          z->out.pos =3D 0;
> =20
>          /*
> @@ -279,8 +277,8 @@ static int zstd_recv_pages(MultiFDRecvParams *p, Erro=
r **errp)
>          do {
>              ret =3D ZSTD_decompressStream(z->zds, &z->out, &z->in);
>          } while (ret > 0 && (z->in.size - z->in.pos > 0)
> -                         && (z->out.pos < page_size));
> -        if (ret > 0 && (z->out.pos < page_size)) {
> +                         && (z->out.pos < p->page_size));
> +        if (ret > 0 && (z->out.pos < p->page_size)) {
>              error_setg(errp, "multifd %u: decompressStream buffer too sm=
all",
>                         p->id);
>              return -1;
> diff --git a/migration/multifd.c b/migration/multifd.c
> index 586ddc9d65..d2070c9cee 100644
> --- a/migration/multifd.c
> +++ b/migration/multifd.c
> @@ -87,15 +87,14 @@ static void nocomp_send_cleanup(MultiFDSendParams *p,=
 Error **errp)
>  static int nocomp_send_prepare(MultiFDSendParams *p, Error **errp)
>  {
>      MultiFDPages_t *pages =3D p->pages;
> -    size_t page_size =3D qemu_target_page_size();
> =20
>      for (int i =3D 0; i < p->normal_num; i++) {
>          p->iov[p->iovs_num].iov_base =3D pages->block->host + p->normal[=
i];
> -        p->iov[p->iovs_num].iov_len =3D page_size;
> +        p->iov[p->iovs_num].iov_len =3D p->page_size;
>          p->iovs_num++;
>      }
> =20
> -    p->next_packet_size =3D p->normal_num * page_size;
> +    p->next_packet_size =3D p->normal_num * p->page_size;
>      p->flags |=3D MULTIFD_FLAG_NOCOMP;
>      return 0;
>  }
> @@ -139,7 +138,6 @@ static void nocomp_recv_cleanup(MultiFDRecvParams *p)
>  static int nocomp_recv_pages(MultiFDRecvParams *p, Error **errp)
>  {
>      uint32_t flags =3D p->flags & MULTIFD_FLAG_COMPRESSION_MASK;
> -    size_t page_size =3D qemu_target_page_size();
> =20
>      if (flags !=3D MULTIFD_FLAG_NOCOMP) {
>          error_setg(errp, "multifd %u: flags received %x flags expected %=
x",
> @@ -148,7 +146,7 @@ static int nocomp_recv_pages(MultiFDRecvParams *p, Er=
ror **errp)
>      }
>      for (int i =3D 0; i < p->normal_num; i++) {
>          p->iov[i].iov_base =3D p->host + p->normal[i];
> -        p->iov[i].iov_len =3D page_size;
> +        p->iov[i].iov_len =3D p->page_size;
>      }
>      return qio_channel_readv_all(p->c, p->iov, p->normal_num, errp);
>  }
> @@ -281,8 +279,7 @@ static void multifd_send_fill_packet(MultiFDSendParam=
s *p)
>  static int multifd_recv_unfill_packet(MultiFDRecvParams *p, Error **errp=
)
>  {
>      MultiFDPacket_t *packet =3D p->packet;
> -    size_t page_size =3D qemu_target_page_size();
> -    uint32_t page_count =3D MULTIFD_PACKET_SIZE / page_size;
> +    uint32_t page_count =3D MULTIFD_PACKET_SIZE / p->page_size;
>      RAMBlock *block;
>      int i;
> =20
> @@ -344,7 +341,7 @@ static int multifd_recv_unfill_packet(MultiFDRecvPara=
ms *p, Error **errp)
>      for (i =3D 0; i < p->normal_num; i++) {
>          uint64_t offset =3D be64_to_cpu(packet->offset[i]);
> =20
> -        if (offset > (block->used_length - page_size)) {
> +        if (offset > (block->used_length - p->page_size)) {
>              error_setg(errp, "multifd: offset too long %" PRIu64
>                         " (max " RAM_ADDR_FMT ")",
>                         offset, block->used_length);
> @@ -433,8 +430,7 @@ static int multifd_send_pages(QEMUFile *f)
>      p->packet_num =3D multifd_send_state->packet_num++;
>      multifd_send_state->pages =3D p->pages;
>      p->pages =3D pages;
> -    transferred =3D ((uint64_t) pages->num) * qemu_target_page_size()
> -                + p->packet_len;
> +    transferred =3D ((uint64_t) pages->num) * p->page_size + p->packet_l=
en;
>      qemu_file_acct_rate_limit(f, transferred);
>      ram_counters.multifd_bytes +=3D transferred;
>      ram_counters.transferred +=3D transferred;
> @@ -939,6 +935,7 @@ int multifd_save_setup(Error **errp)
>          /* We need one extra place for the packet header */
>          p->iov =3D g_new0(struct iovec, page_count + 1);
>          p->normal =3D g_new0(ram_addr_t, page_count);
> +        p->page_size =3D qemu_target_page_size();
> =20
>          if (migrate_use_zero_copy_send()) {
>              p->write_flags =3D QIO_CHANNEL_WRITE_FLAG_ZERO_COPY;
> @@ -1186,6 +1183,7 @@ int multifd_load_setup(Error **errp)
>          p->name =3D g_strdup_printf("multifdrecv_%d", i);
>          p->iov =3D g_new0(struct iovec, page_count);
>          p->normal =3D g_new0(ram_addr_t, page_count);
> +        p->page_size =3D qemu_target_page_size();
>      }
> =20
>      for (i =3D 0; i < thread_count; i++) {


IIUC this info should never change after assigned, and is the same on every
multifd channel param.=20

I wonder if it would be interesting to have a common area for this kind of =
info,
which could be referenced by every multifd channel parameter.
Or maybe too much trouble?

Anyway, FWIW:
Reviewed-by: Leonardo Bras <leobras@redhat.com>

Best regards,=20
Leo


