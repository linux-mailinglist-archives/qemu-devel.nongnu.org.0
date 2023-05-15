Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 876DF70277A
	for <lists+qemu-devel@lfdr.de>; Mon, 15 May 2023 10:44:45 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pyToP-00048R-Px; Mon, 15 May 2023 04:44:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1pyToF-00047z-IX
 for qemu-devel@nongnu.org; Mon, 15 May 2023 04:43:59 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1pyToE-0004Yw-0p
 for qemu-devel@nongnu.org; Mon, 15 May 2023 04:43:59 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1684140237;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=vi619ztcQGjUgwj9Tfq9U0x899Gs5kd7OL7Bbnl+pl8=;
 b=S6H+F8Da4Z9oo5FNL+R5a4RFMMG0HMJqZnqBaaut5NZPesoFPxlCMwd8rsKZ4uY0BqvN8U
 Sek/QZ+xwNJyXPze+4jetjKlhFPoZrTHAVSgPhwkWg7Fp4S+gKyIQRfQ//pSO2kpfeaFOf
 p8Fow27V8CZank5itWTGwayHTCQHdHc=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-586-pWSY4j-sN6yifMZJy-rUlA-1; Mon, 15 May 2023 04:43:55 -0400
X-MC-Unique: pWSY4j-sN6yifMZJy-rUlA-1
Received: by mail-wr1-f72.google.com with SMTP id
 ffacd0b85a97d-30643d4a430so4368658f8f.0
 for <qemu-devel@nongnu.org>; Mon, 15 May 2023 01:43:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1684140234; x=1686732234;
 h=mime-version:message-id:date:reply-to:user-agent:references
 :in-reply-to:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=vi619ztcQGjUgwj9Tfq9U0x899Gs5kd7OL7Bbnl+pl8=;
 b=IVbwri/7HddpjL83GmYOds/5kZvtnuTfvl1WS1CJD/K+yfdTk2/3a9Kj9nXl0PDZas
 7LEKWm2WuFk6XLQBN5mhduRSuTPVJm1T8EifmO3s7tK0apffPGav78kmxhWGWl/bAuQ0
 DlSwYunKUoJgZYFAiXGncYeHmThNh8lp1JKjs5GR2NFxpZO6cKlR6lVtctvar3jBV5Je
 65wzWegr8u9Slfh4D0fOYDb0Ixi+muoiyzB3Rz3NePjzMR/THUkH7sr6IucS4fq6Oelp
 GenFnL3iQc766KeAGfOxx79Vhdh5w2oHvG1ezRo/Zk8nynPAFtS+nKt8wd/tufq7HthU
 1u7Q==
X-Gm-Message-State: AC+VfDyAZlQSajLNwCB1PMz2uFw2Tnr/ODXC5ojz2H4QbiZ2L81FJqIN
 FM8kBuGn1WM+QnTc8WkE3h12eNAy5ZfFLt4TMNkLLgybt4wP1ZqOi0A3aEhJ4Od2t3KiHtSXiIs
 z9DOJ5s/R8UhcPbc=
X-Received: by 2002:a05:6000:50e:b0:2ef:af46:1278 with SMTP id
 a14-20020a056000050e00b002efaf461278mr24021090wrf.10.1684140234784; 
 Mon, 15 May 2023 01:43:54 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ66B1lEGksOIF9E7FKcOByrBKiAoJywmw694ZOcKeO+bJm8K3oIvbKfRWcZRDYvjjtAA0OfEA==
X-Received: by 2002:a05:6000:50e:b0:2ef:af46:1278 with SMTP id
 a14-20020a056000050e00b002efaf461278mr24021070wrf.10.1684140234443; 
 Mon, 15 May 2023 01:43:54 -0700 (PDT)
Received: from redhat.com (static-92-120-85-188.ipcom.comunitel.net.
 [188.85.120.92]) by smtp.gmail.com with ESMTPSA id
 f5-20020adff985000000b002fda1b12a0bsm32065576wrr.2.2023.05.15.01.43.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 15 May 2023 01:43:53 -0700 (PDT)
From: Juan Quintela <quintela@redhat.com>
To: Het Gala <het.gala@nutanix.com>
Cc: qemu-devel@nongnu.org,  prerna.saxena@nutanix.com,  dgilbert@redhat.com,
 pbonzini@redhat.com,  berrange@redhat.com,  armbru@redhat.com,
 eblake@redhat.com,  manish.mishra@nutanix.com,
 aravind.retnakaran@nutanix.com
Subject: Re: [PATCH v4 2/8] migration: Converts uri parameter into
 'MigrateAddress' struct
In-Reply-To: <20230512143240.192504-3-het.gala@nutanix.com> (Het Gala's
 message of "Fri, 12 May 2023 14:32:34 +0000")
References: <20230512143240.192504-1-het.gala@nutanix.com>
 <20230512143240.192504-3-het.gala@nutanix.com>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
Date: Mon, 15 May 2023 10:43:52 +0200
Message-ID: <87353y2ddj.fsf@secure.mitica>
MIME-Version: 1.0
Content-Type: text/plain
Received-SPF: pass client-ip=170.10.133.124; envelope-from=quintela@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Reply-To: quintela@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Het Gala <het.gala@nutanix.com> wrote:
> This patch introduces code that can parse 'uri' string parameter and
> spit out 'MigrateAddress' struct. All the required migration parameters
> are stored in the struct.
>
> Suggested-by: Aravind Retnakaran <aravind.retnakaran@nutanix.com>
> Signed-off-by: Het Gala <het.gala@nutanix.com>

Markus, could you comment?

> ---
>  migration/migration.c | 63 +++++++++++++++++++++++++++++++++++++++++--
>  1 file changed, 61 insertions(+), 2 deletions(-)
>
> diff --git a/migration/migration.c b/migration/migration.c
> index 0ee07802a5..a7e4e286aa 100644
> --- a/migration/migration.c
> +++ b/migration/migration.c
> @@ -64,6 +64,7 @@
>  #include "yank_functions.h"
>  #include "sysemu/qtest.h"
>  #include "options.h"
> +#include "qemu/sockets.h"
>  
>  static NotifierList migration_state_notifiers =
>      NOTIFIER_LIST_INITIALIZER(migration_state_notifiers);
> @@ -408,13 +409,58 @@ void migrate_add_address(SocketAddress *address)
>                        QAPI_CLONE(SocketAddress, address));
>  }
>  
> +static bool migrate_uri_parse(const char *uri,
> +                              MigrateAddress **channel,
> +                              Error **errp)
> +{
> +    Error *local_err = NULL;

Remove this.

> +    MigrateAddress *addrs = g_new0(MigrateAddress, 1);
> +    SocketAddress *saddr;
> +    InetSocketAddress *isock = &addrs->u.rdma;
> +    strList **tail = &addrs->u.exec.args;
> +
> +    if (strstart(uri, "exec:", NULL)) {
> +        addrs->transport = MIGRATE_TRANSPORT_EXEC;
> +        QAPI_LIST_APPEND(tail, g_strdup("/bin/sh"));
> +        QAPI_LIST_APPEND(tail, g_strdup("-c"));
> +        QAPI_LIST_APPEND(tail, g_strdup(uri + strlen("exec:")));
> +    } else if (strstart(uri, "rdma:", NULL) &&
> +               !inet_parse(isock, uri + strlen("rdma:"), errp)) {
> +        addrs->transport = MIGRATE_TRANSPORT_RDMA;
> +    } else if (strstart(uri, "tcp:", NULL) ||
> +                strstart(uri, "unix:", NULL) ||
> +                strstart(uri, "vsock:", NULL) ||
> +                strstart(uri, "fd:", NULL)) {
> +        addrs->transport = MIGRATE_TRANSPORT_SOCKET;
> +        saddr = socket_parse(uri, &local_err);

           saddr = socket_parse(uri, &local_err);

           if (saddr == NULL) {
                   qapi_free_MigrateAddress(addrs);
                   return false;
           }

> +        addrs->u.socket = *saddr;
> +    }
> +
> +    if (local_err) {
> +        qapi_free_SocketAddress(saddr);
> +        qapi_free_InetSocketAddress(isock);
> +        error_propagate(errp, local_err);
> +        return false;
> +    }

And remove this last chunk?
Or I am missing something?

> +
> +    *channel = addrs;
> +    return true;
> +}
> +
>  static void qemu_start_incoming_migration(const char *uri, Error **errp)
>  {
>      const char *p = NULL;
> +    MigrateAddress *channel = g_new0(MigrateAddress, 1);
>  
>      /* URI is not suitable for migration? */
>      if (!migration_channels_and_uri_compatible(uri, errp)) {
> -        return;
> +        goto out;
> +    }
> +
> +    if (uri && !migrate_uri_parse(uri, &channel, errp)) {
> +        error_setg(errp, "Error parsing uri");

Why are we doing this error_setg?  We are supposed to have a better
error assigned to errp already, no?

> +        goto out;
>      }
>  
>      qapi_event_send_migration(MIGRATION_STATUS_SETUP);
> @@ -433,6 +479,9 @@ static void qemu_start_incoming_migration(const char *uri, Error **errp)
>      } else {
>          error_setg(errp, "unknown migration protocol: %s", uri);
>      }
> +
> +out:
> +    qapi_free_MigrateAddress(channel);

I wish, I really wish, that there was a way to free things on error.


>  }
>  
>  static void process_incoming_migration_bh(void *opaque)
> @@ -1638,10 +1687,16 @@ void qmp_migrate(const char *uri, bool has_blk, bool blk,
>      Error *local_err = NULL;
>      MigrationState *s = migrate_get_current();
>      const char *p = NULL;
> +    MigrateAddress *channel = g_new0(MigrateAddress, 1);
>  
>      /* URI is not suitable for migration? */
>      if (!migration_channels_and_uri_compatible(uri, errp)) {
> -        return;
> +        goto out;
> +    }
> +
> +    if (!migrate_uri_parse(uri, &channel, &local_err)) {
> +        error_setg(errp, "Error parsing uri");

Same here about setting errp.

> +        goto out;
>      }
>  
>      if (!migrate_prepare(s, has_blk && blk, has_inc && inc,
> @@ -1688,6 +1743,10 @@ void qmp_migrate(const char *uri, bool has_blk, bool blk,
>          error_propagate(errp, local_err);
>          return;
>      }
> +
> +out:
> +    qapi_free_MigrateAddress(channel);
> +    return;
>  }
>  
>  void qmp_migrate_cancel(Error **errp)


