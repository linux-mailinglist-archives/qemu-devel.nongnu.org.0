Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 61A5F3BBA45
	for <lists+qemu-devel@lfdr.de>; Mon,  5 Jul 2021 11:37:24 +0200 (CEST)
Received: from localhost ([::1]:49754 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m0L2Z-0008L9-F8
	for lists+qemu-devel@lfdr.de; Mon, 05 Jul 2021 05:37:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60662)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1m0KyF-0004Ex-Mj
 for qemu-devel@nongnu.org; Mon, 05 Jul 2021 05:32:55 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:38362)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1m0KyD-0003Qx-7k
 for qemu-devel@nongnu.org; Mon, 05 Jul 2021 05:32:55 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1625477572;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=KujMTb9m0eJYeDQE7276PTbY3rVKReoLv23g+pRDNx0=;
 b=NV7bNBMSSosxh0c4zg3RQEN8WPin/JYaR3HpMVGt4drBVF8F3Jqt/XrPeVWxH9JYytXRlm
 Om6UhMQSkuQIHPaKcIVnIQ0tvlCpMNpWTajsZKDn7VMUBvEyfz4a62IpPDHbaPEzH2ilnW
 wUfA3ZSLLPPbp55w1PxSXGIeaARnAM4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-148-_4vKdrz3PNaKA4GLVhlkEw-1; Mon, 05 Jul 2021 05:32:49 -0400
X-MC-Unique: _4vKdrz3PNaKA4GLVhlkEw-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 7179C9F92C;
 Mon,  5 Jul 2021 09:32:48 +0000 (UTC)
Received: from redhat.com (ovpn-114-184.ams2.redhat.com [10.36.114.184])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 68D8D5C1A1;
 Mon,  5 Jul 2021 09:32:47 +0000 (UTC)
Date: Mon, 5 Jul 2021 10:32:44 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: "Marcks, Harrison" <Harrison.Marcks@ncr.com>
Subject: Re: [PATCH] crypto tls session: GNUTLS internal buffer is now
 cleared of stale data
Message-ID: <YOLRvMw8dgEAREtV@redhat.com>
References: <PH0PR15MB448020F90D7E38336344FF92F3029@PH0PR15MB4480.namprd15.prod.outlook.com>
MIME-Version: 1.0
In-Reply-To: <PH0PR15MB448020F90D7E38336344FF92F3029@PH0PR15MB4480.namprd15.prod.outlook.com>
User-Agent: Mutt/2.0.7 (2021-05-04)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -42
X-Spam_score: -4.3
X-Spam_bar: ----
X-Spam_report: (-4.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.441,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Reply-To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
Cc: "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Jun 29, 2021 at 03:50:04PM +0000, Marcks, Harrison wrote:
> From 7a95cd3f827be55153e7e457caa89351c48f247d Mon Sep 17 00:00:00 2001
> From: harrison marcks <harrison.marcks@ncr.com>
> Date: Tue, 29 Jun 2021 16:50:00 +0100
> Subject: [PATCH] crypto tls session: GNUTLS internal buffer is now cleared of
>  stale data
> 
> QEMU Serial devices only request up their "ITL" level. As the GNUTLS is
> not a socket proper, if the data on the line exceeds this level then QEMU
> won't go back and look for it. The fix adds a watch on the tls channel
> that uses an internal gnutls function to check pending records. Then
> changes the condition in the tls-channel watch to read from the buffer
> again (if there are indeed records still pending)
> 
> Signed-off-by: harrison marcks <harrison.marcks@ncr.com>
> ---
>  crypto/tlssession.c         | 18 ++++++++
>  crypto/trace-events         |  1 +
>  include/crypto/tlssession.h | 28 ++++++++++++
>  include/io/channel-tls.h    |  2 +
>  io/channel-tls.c            | 89 ++++++++++++++++++++++++++++++++++++-
>  io/trace-events             |  7 +++
>  6 files changed, 144 insertions(+), 1 deletion(-)

Unfortunately this patch doesn't apply to git master:

  https://patchew.org/QEMU/PH0PR15MB448020F90D7E38336344FF92F3029@PH0PR15MB4480.namprd15.prod.outlook.com/

> diff --git a/crypto/tlssession.c b/crypto/tlssession.c
> index 33203e8ca7..94bd464516 100644
> --- a/crypto/tlssession.c
> +++ b/crypto/tlssession.c
> @@ -457,6 +457,24 @@ qcrypto_tls_session_write(QCryptoTLSSession *session,
>  }
>  
>  
> +QCryptoTLSSessionRecordStatus
> +qcrypto_tls_session_read_check_buffer(QCryptoTLSSession *session)
> +{
> +    QCryptoTLSSessionRecordStatus status = QCRYPTO_TLS_RECORD_EMPTY;
> +
> +    if (gnutls_record_check_pending(session->handle) > 0) {
> +        status = QCRYPTO_TLS_RECORDS_PENDING;
> +    }
> +
> +    trace_qcrypto_tls_session_read_check_buffer(
> +                                        session
> +                                        , status

Putting the ',' on a new line is not a QEMU codestyle.

> +                                        , gnutls_record_check_pending(session->handle)
> +                                        );

The ); shouldn't be on a new line either

> +    return status;
> +}
> +
> +
>  ssize_t
>  qcrypto_tls_session_read(QCryptoTLSSession *session,
>                           char *buf,
> diff --git a/crypto/trace-events b/crypto/trace-events
> index 9e594d30e8..d47edf4050 100644
> --- a/crypto/trace-events
> +++ b/crypto/trace-events
> @@ -21,3 +21,4 @@ qcrypto_tls_creds_x509_load_cert_list(void *creds, const char *file) "TLS creds
>  # tlssession.c
>  qcrypto_tls_session_new(void *session, void *creds, const char *hostname, const char *authzid, int endpoint) "TLS session new session=%p creds=%p hostname=%s authzid=%s endpoint=%d"
>  qcrypto_tls_session_check_creds(void *session, const char *status) "TLS session check creds session=%p status=%s"
> +qcrypto_tls_session_read_check_buffer(void* session, int status, long recordsN) "TLS session buffer check session=%p status=%d records pending=%ld"

QEMU code style is 'void *' not 'void*' - as seen in the line above

> diff --git a/include/crypto/tlssession.h b/include/crypto/tlssession.h
> index 15b9cef086..4108271d62 100644
> --- a/include/crypto/tlssession.h
> +++ b/include/crypto/tlssession.h
> @@ -321,4 +321,32 @@ int qcrypto_tls_session_get_key_size(QCryptoTLSSession *sess,
>   */
>  char *qcrypto_tls_session_get_peer_name(QCryptoTLSSession *sess);
>  
> +/**
> + * QCryptoTLSSessionRecordStatus:
> + * enum definitions for telling outside functions whether
> + * there are "records"/bytes waiting to be read in GNUTLS.
> + *
> + * QCRYPTO_TLS_RECORD_NULL is an empty/init state
> + *
> + */
> +typedef enum {
> +    QCRYPTO_TLS_RECORD_NULL, /* empty state */
> +    QCRYPTO_TLS_RECORD_EMPTY,
> +    QCRYPTO_TLS_RECORDS_PENDING
> +} QCryptoTLSSessionRecordStatus;
> +
> +/**
> + * qcrypto_tls_session_read_check_buffer:
> + * @session: the TLS session object
> + *
> + * checks the internal GNUTLS buffer for the remaining bytes and
> + * returns one of:
> + *      QCRYPTO_TLS_RECORD_EMPTY - No pending bytes
> + *      QCRYPTO_TLS_RECORDS_PENDING - pending bytes
> + *
> + * Returns: QCryptoTLSSessionRecordStatus
> + */
> +QCryptoTLSSessionRecordStatus
> +qcrypto_tls_session_read_check_buffer(QCryptoTLSSession *session);
> +
>  #endif /* QCRYPTO_TLSSESSION_H */
> diff --git a/include/io/channel-tls.h b/include/io/channel-tls.h
> index fdbdf12feb..401fe786a2 100644
> --- a/include/io/channel-tls.h
> +++ b/include/io/channel-tls.h
> @@ -29,6 +29,7 @@
>  #define QIO_CHANNEL_TLS(obj)                                     \
>      OBJECT_CHECK(QIOChannelTLS, (obj), TYPE_QIO_CHANNEL_TLS)
>  
> +typedef struct QIOChannelTLSSource QIOChannelTLSSource;
>  typedef struct QIOChannelTLS QIOChannelTLS;
>  
>  /**
> @@ -49,6 +50,7 @@ struct QIOChannelTLS {
>      QIOChannel *master;
>      QCryptoTLSSession *session;
>      QIOChannelShutdown shutdown;
> +    QIOChannelTLSSource *source;
>  };
>  
>  /**
> diff --git a/io/channel-tls.c b/io/channel-tls.c
> index 7ec8ceff2f..77b80f2bf8 100644
> --- a/io/channel-tls.c
> +++ b/io/channel-tls.c
> @@ -24,6 +24,12 @@
>  #include "io/channel-tls.h"
>  #include "trace.h"
>  
> +struct QIOChannelTLSSource {
> +    GSource parent;
> +    GIOCondition condition;
> +    QIOChannelTLS *tioc;
> +};
> +
>  
>  static ssize_t qio_channel_tls_write_handler(const char *buf,
>                                               size_t len,
> @@ -269,6 +275,10 @@ static ssize_t qio_channel_tls_readv(QIOChannel *ioc,
>          ssize_t ret = qcrypto_tls_session_read(tioc->session,
>                                                 iov[i].iov_base,
>                                                 iov[i].iov_len);
> +        trace_qio_channel_tls_readv_iov_len(tioc->session
> +                                            , iov[i].iov_base
> +                                            , iov[i].iov_len);

Again with this invalid code style.

>          if (ret < 0) {
>              if (errno == EAGAIN) {
>                  if (got) {
> @@ -290,6 +300,15 @@ static ssize_t qio_channel_tls_readv(QIOChannel *ioc,
>              break;
>          }
>      }
> +
> +    if (qcrypto_tls_session_read_check_buffer(tioc->session)
> +        == QCRYPTO_TLS_RECORDS_PENDING) {

"==" on the previous line

> +        tioc->source->condition |= G_IO_IN;

This will reference a NULL pointer if no source has been created

> +        trace_qio_channel_tls_readv_extra_records(tioc->session
> +                                                , tioc->source->condition
> +                                                , got);

And again

> +    }
> +
>      return got;
>  }
>  
> @@ -385,12 +404,80 @@ static void qio_channel_tls_set_aio_fd_handler(QIOChannel *ioc,
>      qio_channel_set_aio_fd_handler(tioc->master, ctx, io_read, io_write, opaque);
>  }
>  
> +static gboolean
> +qio_channel_tls_source_check(GSource *source);
> +
> +static gboolean
> +qio_channel_tls_source_prepare(GSource *source,
> +                                gint *timeout)

Parameters are not lined up

> +{
> +    *timeout = -1;
> +    trace_qio_channel_tls_source_prepare(source, *timeout);
> +    return qio_channel_tls_source_check(source);
> +}
> +
> +static gboolean
> +qio_channel_tls_source_check(GSource *source)
> +{
> +    QIOChannelTLSSource *tsource = (QIOChannelTLSSource *)source;
> +    trace_qio_channel_tls_source_check(tsource->condition);
> +    return (G_IO_IN | G_IO_OUT) & tsource->condition;
> +}
> +
> +static gboolean
> +qio_channel_tls_source_dispatch(GSource *source,
> +                                   GSourceFunc callback,
> +                                   gpointer user_data)
> +{
> +    QIOChannelFunc func = (QIOChannelFunc)callback;
> +    QIOChannelTLSSource *tsource = (QIOChannelTLSSource *)source;
> +    trace_qio_channel_tls_source_dispatch(tsource->tioc
> +                            , tsource->condition
> +                            , func);
> +
> +    return (*func)(QIO_CHANNEL(tsource->tioc),
> +                   ((G_IO_IN | G_IO_OUT) & tsource->condition),
> +                   user_data);
> +}
> +
> +static void
> +qio_channel_tls_source_finalize(GSource *source)
> +{
> +    QIOChannelTLSSource *tsource = (QIOChannelTLSSource *)source;
> +    trace_qio_channel_tls_source_finalize(tsource, tsource->tioc);
> +
> +    object_unref(OBJECT(tsource->tioc));
> +}
> +
> +GSourceFuncs qio_channel_tls_source_funcs = {
> +    qio_channel_tls_source_prepare,
> +    qio_channel_tls_source_check,
> +    qio_channel_tls_source_dispatch,
> +    qio_channel_tls_source_finalize
> +};
> +
> +
>  static GSource *qio_channel_tls_create_watch(QIOChannel *ioc,
>                                               GIOCondition condition)
>  {
>      QIOChannelTLS *tioc = QIO_CHANNEL_TLS(ioc);
>  
> -    return qio_channel_create_watch(tioc->master, condition);
> +    QIOChannelTLSSource *tsource;
> +    GSource *source;
> +
> +    source = g_source_new(&qio_channel_tls_source_funcs,
> +                          sizeof(QIOChannelTLSSource));
> +    tsource = (QIOChannelTLSSource *)source;
> +
> +    tsource->tioc = tioc;
> +    tioc->source = tsource;

So this assumes there's only ever 1 source present. That's certainly
the normal case, but I don't like making that assumption.

IMHO the link should be one way from QIOChannelTLSSource -> QIOChannelTLS.
Just keep a 'bool' flag in the QIOChannelTLS struct to indicate whether
there's pending data cached. This would avoid the NULL pointer problem
mentioned earlier.

> +    object_ref(OBJECT(tioc));
> +
> +    tsource->condition = condition;
> +    trace_qio_channel_tls_create_watch(tsource
> +                                        , tioc
> +                                        , condition);
> +    return source;
>  }
>  
>  QCryptoTLSSession *
> diff --git a/io/trace-events b/io/trace-events
> index d7bc70b966..2f82c15e68 100644
> --- a/io/trace-events
> +++ b/io/trace-events
> @@ -42,6 +42,13 @@ qio_channel_tls_handshake_fail(void *ioc) "TLS handshake fail ioc=%p"
>  qio_channel_tls_handshake_complete(void *ioc) "TLS handshake complete ioc=%p"
>  qio_channel_tls_credentials_allow(void *ioc) "TLS credentials allow ioc=%p"
>  qio_channel_tls_credentials_deny(void *ioc) "TLS credentials deny ioc=%p"
> +qio_channel_tls_source_prepare(void *source, int timeout) "TLS source=%p prepare timeout=%d"
> +qio_channel_tls_source_check(int condition) "TLS source condition=%d"
> +qio_channel_tls_source_dispatch(void* channel_p, int condition, void* func) "TLS dispatch source=%p condition=%d callback func=%p"

'void *' not 'void*'

> +qio_channel_tls_source_finalize(void* source_p, void* channel_p) "TLS source finalize source=%p ioc=%p"
> +qio_channel_tls_create_watch(void* tsource, void* tioc, int condition) "TLS create watch source=%p channel=%p condition=%d"
> +qio_channel_tls_readv_extra_records(void* session_p, int condition, long got) "TLS readv extra recs session=%p condition=%d got=%ld"
> +qio_channel_tls_readv_iov_len(void* session_p, void* iov_base, long iov_len) "TLS readv iov len session=%p iov_base=%p iov_len=%ld"
>  
>  # channel-websock.c
>  qio_channel_websock_new_server(void *ioc, void *master) "Websock new client ioc=%p master=%p"
> -- 
> 2.17.1
> 

Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


