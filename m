Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4AFC812FC55
	for <lists+qemu-devel@lfdr.de>; Fri,  3 Jan 2020 19:21:54 +0100 (CET)
Received: from localhost ([::1]:55584 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1inRa5-0000yx-Cu
	for lists+qemu-devel@lfdr.de; Fri, 03 Jan 2020 13:21:53 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:47624)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <dgilbert@redhat.com>) id 1inRZ7-0000a6-51
 for qemu-devel@nongnu.org; Fri, 03 Jan 2020 13:20:55 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <dgilbert@redhat.com>) id 1inRZ2-0003Af-FW
 for qemu-devel@nongnu.org; Fri, 03 Jan 2020 13:20:51 -0500
Received: from us-smtp-1.mimecast.com ([207.211.31.81]:29222)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <dgilbert@redhat.com>) id 1inRZ1-00037z-Pp
 for qemu-devel@nongnu.org; Fri, 03 Jan 2020 13:20:48 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1578075646;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=JA+7XXqsuG0RDZroBuDegWLzqIEXQEvWpl9xRxuRCPA=;
 b=BwYzkZi8moeyAZ/GnPp16xfbiQ96ON0r3gtYEakt9dB5tgsnYepSYnzpQXXOCkLUF5ftd5
 2+p01/wJcRdx5wkgnKscqvlr+l4ou51coPDvxnmJ1YHrKMDTs8cMkKdt9mylnzvFFYzNVK
 Zd7cJA4JzB7t2ps2wDydwdlN9vS3HkU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-5-8CmC7qzNOvWkau4pJ9W0rg-1; Fri, 03 Jan 2020 13:20:44 -0500
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 044B78024CC
 for <qemu-devel@nongnu.org>; Fri,  3 Jan 2020 18:20:43 +0000 (UTC)
Received: from work-vm (ovpn-117-78.ams2.redhat.com [10.36.117.78])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id E1E945D9C5;
 Fri,  3 Jan 2020 18:20:40 +0000 (UTC)
Date: Fri, 3 Jan 2020 18:20:38 +0000
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: Juan Quintela <quintela@redhat.com>
Subject: Re: [PATCH v2 07/10] migration: Make no compression operations into
 its own structure
Message-ID: <20200103182038.GS3804@work-vm>
References: <20191218020119.3776-1-quintela@redhat.com>
 <20191218020119.3776-8-quintela@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20191218020119.3776-8-quintela@redhat.com>
User-Agent: Mutt/1.13.0 (2019-11-30)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-MC-Unique: 8CmC7qzNOvWkau4pJ9W0rg-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 207.211.31.81
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
Cc: Laurent Vivier <lvivier@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Daniel =?iso-8859-1?Q?P=2E_Berrang=E9?= <berrange@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, qemu-devel@nongnu.org,
 Markus Armbruster <armbru@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

* Juan Quintela (quintela@redhat.com) wrote:
> It will be used later.
>=20
> Signed-off-by: Juan Quintela <quintela@redhat.com>
>=20
> ---
> Move setup of ->ops helper to proper place (wei)
> Rename s/none/nocomp/ (dave)
> Introduce MULTIFD_FLAG_NOCOMP
> ---
>  migration/migration.c |   9 ++
>  migration/migration.h |   1 +
>  migration/ram.c       | 194 ++++++++++++++++++++++++++++++++++++++++--
>  3 files changed, 196 insertions(+), 8 deletions(-)
>=20
> diff --git a/migration/migration.c b/migration/migration.c
> index 93c6ed10a6..56203eb536 100644
> --- a/migration/migration.c
> +++ b/migration/migration.c
> @@ -2213,6 +2213,15 @@ int migrate_multifd_channels(void)
>      return s->parameters.multifd_channels;
>  }
> =20
> +int migrate_multifd_method(void)
> +{
> +    MigrationState *s;
> +
> +    s =3D migrate_get_current();
> +
> +    return s->parameters.multifd_compress;
> +}
> +
>  int migrate_use_xbzrle(void)
>  {
>      MigrationState *s;
> diff --git a/migration/migration.h b/migration/migration.h
> index 545f283ae7..d3ea45e25a 100644
> --- a/migration/migration.h
> +++ b/migration/migration.h
> @@ -299,6 +299,7 @@ bool migrate_auto_converge(void);
>  bool migrate_use_multifd(void);
>  bool migrate_pause_before_switchover(void);
>  int migrate_multifd_channels(void);
> +int migrate_multifd_method(void);
> =20
>  int migrate_use_xbzrle(void);
>  int64_t migrate_xbzrle_cache_size(void);
> diff --git a/migration/ram.c b/migration/ram.c
> index fcf50e648a..10661e03ae 100644
> --- a/migration/ram.c
> +++ b/migration/ram.c
> @@ -44,6 +44,7 @@
>  #include "page_cache.h"
>  #include "qemu/error-report.h"
>  #include "qapi/error.h"
> +#include "qapi/qapi-types-migration.h"
>  #include "qapi/qapi-events-migration.h"
>  #include "qapi/qmp/qerror.h"
>  #include "trace.h"
> @@ -581,6 +582,7 @@ exit:
>  #define MULTIFD_VERSION 1
> =20
>  #define MULTIFD_FLAG_SYNC (1 << 0)
> +#define MULTIFD_FLAG_NOCOMP (1 << 1)
> =20
>  /* This value needs to be a multiple of qemu_target_page_size() */
>  #define MULTIFD_PACKET_SIZE (512 * 1024)
> @@ -662,6 +664,8 @@ typedef struct {
>      uint64_t num_pages;
>      /* syncs main thread and channels */
>      QemuSemaphore sem_sync;
> +    /* used for compression methods */
> +    void *data;
>  }  MultiFDSendParams;
> =20
>  typedef struct {
> @@ -699,8 +703,153 @@ typedef struct {
>      uint64_t num_pages;
>      /* syncs main thread and channels */
>      QemuSemaphore sem_sync;
> +    /* used for de-compression methods */
> +    void *data;
>  } MultiFDRecvParams;
> =20
> +typedef struct {
> +    /* Setup for sending side */
> +    int (*send_setup)(MultiFDSendParams *p, Error **errp);
> +    /* Cleanup for sending side */
> +    void (*send_cleanup)(MultiFDSendParams *p, Error **errp);
> +    /* Prepare the send packet */
> +    int (*send_prepare)(MultiFDSendParams *p, uint32_t used, Error **err=
p);
> +    /* Write the send packet */
> +    int (*send_write)(MultiFDSendParams *p, uint32_t used, Error **errp)=
;
> +    /* Setup for receiving side */
> +    int (*recv_setup)(MultiFDRecvParams *p, Error **errp);
> +    /* Cleanup for receiving side */
> +    void (*recv_cleanup)(MultiFDRecvParams *p);
> +    /* Read all pages */
> +    int (*recv_pages)(MultiFDRecvParams *p, uint32_t used, Error **errp)=
;
> +} MultiFDMethods;
> +
> +/* Multifd without compression */
> +
> +/**
> + * nocomp_send_setup: setup send side
> + *
> + * For no compression this function does nothing.
> + *
> + * Returns 0 for success or -1 for error
> + *
> + * @p: Params for the channel that we are using
> + * @errp: pointer to an error
> + */
> +static int nocomp_send_setup(MultiFDSendParams *p, Error **errp)
> +{
> +    return 0;
> +}
> +
> +/**
> + * nocomp_send_cleanup: cleanup send side
> + *
> + * For no compression this function does nothing.
> + *
> + * @p: Params for the channel that we are using
> + */
> +static void nocomp_send_cleanup(MultiFDSendParams *p, Error **errp)
> +{
> +    return;
> +}
> +
> +/**
> + * nocomp_send_prepare: prepare date to be able to send
> + *
> + * For no compression we just have to calculate the size of the
> + * packet.
> + *
> + * Returns 0 for success or -1 for error
> + *
> + * @p: Params for the channel that we are using
> + * @used: number of pages used
> + * @errp: pointer to an error
> + */
> +static int nocomp_send_prepare(MultiFDSendParams *p, uint32_t used,
> +                               Error **errp)
> +{
> +    p->next_packet_size =3D used * qemu_target_page_size();
> +    p->flags |=3D MULTIFD_FLAG_NOCOMP;
> +    return 0;
> +}
> +
> +/**
> + * nocomp_send_write: do the actual write of the data
> + *
> + * For no compression we just have to write the data.
> + *
> + * Returns 0 for success or -1 for error
> + *
> + * @p: Params for the channel that we are using
> + * @used: number of pages used
> + * @errp: pointer to an error
> + */
> +static int nocomp_send_write(MultiFDSendParams *p, uint32_t used, Error =
**errp)
> +{
> +    return qio_channel_writev_all(p->c, p->pages->iov, used, errp);
> +}
> +
> +/**
> + * nocomp_recv_setup: setup receive side
> + *
> + * For no compression this function does nothing.
> + *
> + * Returns 0 for success or -1 for error
> + *
> + * @p: Params for the channel that we are using
> + * @errp: pointer to an error
> + */
> +static int nocomp_recv_setup(MultiFDRecvParams *p, Error **errp)
> +{
> +    return 0;
> +}
> +
> +/**
> + * nocomp_recv_cleanup: setup receive side
> + *
> + * For no compression this function does nothing.
> + *
> + * @p: Params for the channel that we are using
> + */
> +static void nocomp_recv_cleanup(MultiFDRecvParams *p)
> +{
> +}
> +
> +/**
> + * nocomp_recv_pages: read the data from the channel into actual pages
> + *
> + * For no compression we just need to read things into the correct place=
.
> + *
> + * Returns 0 for success or -1 for error
> + *
> + * @p: Params for the channel that we are using
> + * @used: number of pages used
> + * @errp: pointer to an error
> + */
> +static int nocomp_recv_pages(MultiFDRecvParams *p, uint32_t used, Error =
**errp)
> +{
> +    if (p->flags !=3D MULTIFD_FLAG_NOCOMP) {
> +        error_setg(errp, "multifd %d: flags received %x flags expected %=
x",
> +                   p->id, MULTIFD_FLAG_NOCOMP, p->flags);

That looks the wrong way around to me - shouldn't that be
   p->flags, MULTIFD_FLAG_NOCOMP
?

> +        return -1;
> +    }
> +    return qio_channel_readv_all(p->c, p->pages->iov, used, errp);
> +}
> +
> +static MultiFDMethods multifd_nocomp_ops =3D {
> +    .send_setup =3D nocomp_send_setup,
> +    .send_cleanup =3D nocomp_send_cleanup,
> +    .send_prepare =3D nocomp_send_prepare,
> +    .send_write =3D nocomp_send_write,
> +    .recv_setup =3D nocomp_recv_setup,
> +    .recv_cleanup =3D nocomp_recv_cleanup,
> +    .recv_pages =3D nocomp_recv_pages
> +};
> +
> +static MultiFDMethods *multifd_ops[MULTIFD_COMPRESS__MAX] =3D {
> +    [MULTIFD_COMPRESS_NONE] =3D &multifd_nocomp_ops,
> +};
> +
>  static int multifd_send_initial_packet(MultiFDSendParams *p, Error **err=
p)
>  {
>      MultiFDInit_t msg;
> @@ -898,6 +1047,8 @@ struct {
>      uint64_t packet_num;
>      /* send channels ready */
>      QemuSemaphore channels_ready;
> +    /* multifd ops */
> +    MultiFDMethods *ops;
>  } *multifd_send_state;
> =20
>  /*
> @@ -1027,6 +1178,7 @@ void multifd_save_cleanup(void)
>      multifd_send_terminate_threads(NULL);
>      for (i =3D 0; i < migrate_multifd_channels(); i++) {
>          MultiFDSendParams *p =3D &multifd_send_state->params[i];
> +        Error *local_err =3D NULL;
> =20
>          if (p->running) {
>              qemu_thread_join(&p->thread);
> @@ -1043,6 +1195,10 @@ void multifd_save_cleanup(void)
>          p->packet_len =3D 0;
>          g_free(p->packet);
>          p->packet =3D NULL;
> +        multifd_send_state->ops->send_cleanup(p, &local_err);
> +        if (local_err) {
> +            migrate_set_error(migrate_get_current(), local_err);
> +        }
>      }
>      qemu_sem_destroy(&multifd_send_state->channels_ready);
>      g_free(multifd_send_state->params);
> @@ -1123,7 +1279,14 @@ static void *multifd_send_thread(void *opaque)
>              uint64_t packet_num =3D p->packet_num;
>              flags =3D p->flags;
> =20
> -            p->next_packet_size =3D used * qemu_target_page_size();
> +            if (used) {
> +                ret =3D multifd_send_state->ops->send_prepare(p, used,
> +                                                            &local_err);
> +                if (ret !=3D 0) {
> +                    qemu_mutex_unlock(&p->mutex);
> +                    break;
> +                }
> +            }
>              multifd_send_fill_packet(p);
>              p->flags =3D 0;
>              p->num_packets++;
> @@ -1140,8 +1303,7 @@ static void *multifd_send_thread(void *opaque)
>              }
> =20
>              if (used) {
> -                ret =3D qio_channel_writev_all(p->c, p->pages->iov,
> -                                             used, &local_err);
> +                ret =3D multifd_send_state->ops->send_write(p, used, &lo=
cal_err);
>                  if (ret !=3D 0) {
>                      break;
>                  }
> @@ -1212,6 +1374,7 @@ int multifd_save_setup(Error **errp)
>  {
>      int thread_count;
>      uint32_t page_count =3D MULTIFD_PACKET_SIZE / qemu_target_page_size(=
);
> +    int ret =3D 0;
>      uint8_t i;
> =20
>      if (!migrate_use_multifd()) {
> @@ -1222,9 +1385,11 @@ int multifd_save_setup(Error **errp)
>      multifd_send_state->params =3D g_new0(MultiFDSendParams, thread_coun=
t);
>      multifd_send_state->pages =3D multifd_pages_init(page_count);
>      qemu_sem_init(&multifd_send_state->channels_ready, 0);
> +    multifd_send_state->ops =3D multifd_ops[migrate_multifd_method()];
> =20
>      for (i =3D 0; i < thread_count; i++) {
>          MultiFDSendParams *p =3D &multifd_send_state->params[i];
> +        int res;
> =20
>          qemu_mutex_init(&p->mutex);
>          qemu_sem_init(&p->sem, 0);
> @@ -1240,8 +1405,12 @@ int multifd_save_setup(Error **errp)
>          p->packet->version =3D cpu_to_be32(MULTIFD_VERSION);
>          p->name =3D g_strdup_printf("multifdsend_%d", i);
>          socket_send_channel_create(multifd_new_send_channel_async, p);
> +        res =3D multifd_send_state->ops->send_setup(p, errp);
> +        if (ret =3D=3D 0) {
> +            ret =3D res;

How do you handle the errp's here - I think that if is so that you
get the 'ret' from the first thread that fails; but I don't think you're
allowed to call that twice if the first one set it's errp.

> +        }
>      }
> -    return 0;
> +    return ret;
>  }
> =20
>  struct {
> @@ -1252,6 +1421,8 @@ struct {
>      QemuSemaphore sem_sync;
>      /* global number of generated multifd packets */
>      uint64_t packet_num;
> +    /* multifd ops */
> +    MultiFDMethods *ops;
>  } *multifd_recv_state;
> =20
>  static void multifd_recv_terminate_threads(Error *err)
> @@ -1287,7 +1458,6 @@ static void multifd_recv_terminate_threads(Error *e=
rr)
>  int multifd_load_cleanup(Error **errp)
>  {
>      int i;
> -    int ret =3D 0;
> =20
>      if (!migrate_use_multifd()) {
>          return 0;
> @@ -1316,6 +1486,7 @@ int multifd_load_cleanup(Error **errp)
>          p->packet_len =3D 0;
>          g_free(p->packet);
>          p->packet =3D NULL;
> +        multifd_recv_state->ops->recv_cleanup(p);
>      }
>      qemu_sem_destroy(&multifd_recv_state->sem_sync);
>      g_free(multifd_recv_state->params);
> @@ -1323,7 +1494,7 @@ int multifd_load_cleanup(Error **errp)
>      g_free(multifd_recv_state);
>      multifd_recv_state =3D NULL;
> =20
> -    return ret;
> +    return 0;
>  }
> =20
>  static void multifd_recv_sync_main(void)
> @@ -1388,6 +1559,8 @@ static void *multifd_recv_thread(void *opaque)
> =20
>          used =3D p->pages->used;
>          flags =3D p->flags;
> +        /* recv methods don't know how to handle the SYNC flag */
> +        p->flags &=3D ~MULTIFD_FLAG_SYNC;
>          trace_multifd_recv(p->id, p->packet_num, used, flags,
>                             p->next_packet_size);
>          p->num_packets++;
> @@ -1395,8 +1568,7 @@ static void *multifd_recv_thread(void *opaque)
>          qemu_mutex_unlock(&p->mutex);
> =20
>          if (used) {
> -            ret =3D qio_channel_readv_all(p->c, p->pages->iov,
> -                                        used, &local_err);
> +            ret =3D multifd_recv_state->ops->recv_pages(p, used, &local_=
err);
>              if (ret !=3D 0) {
>                  break;
>              }
> @@ -1435,9 +1607,11 @@ int multifd_load_setup(Error **errp)
>      multifd_recv_state->params =3D g_new0(MultiFDRecvParams, thread_coun=
t);
>      atomic_set(&multifd_recv_state->count, 0);
>      qemu_sem_init(&multifd_recv_state->sem_sync, 0);
> +    multifd_recv_state->ops =3D multifd_ops[migrate_multifd_method()];
> =20
>      for (i =3D 0; i < thread_count; i++) {
>          MultiFDRecvParams *p =3D &multifd_recv_state->params[i];
> +        int ret;
> =20
>          qemu_mutex_init(&p->mutex);
>          qemu_sem_init(&p->sem_sync, 0);
> @@ -1448,6 +1622,10 @@ int multifd_load_setup(Error **errp)
>                        + sizeof(ram_addr_t) * page_count;
>          p->packet =3D g_malloc0(p->packet_len);
>          p->name =3D g_strdup_printf("multifdrecv_%d", i);
> +        ret =3D multifd_recv_state->ops->recv_setup(p, errp);
> +        if (ret !=3D 0) {
> +            return ret;
> +        }

same question as the save case above

>      }
>      return 0;
>  }
> --=20
> 2.23.0
>=20
--
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK


