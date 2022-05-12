Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 897855254D3
	for <lists+qemu-devel@lfdr.de>; Thu, 12 May 2022 20:28:23 +0200 (CEST)
Received: from localhost ([::1]:60786 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1npDXy-00068f-9H
	for lists+qemu-devel@lfdr.de; Thu, 12 May 2022 14:28:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39780)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1npCto-00022S-BD
 for qemu-devel@nongnu.org; Thu, 12 May 2022 13:46:54 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:53644)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1npCte-000069-DR
 for qemu-devel@nongnu.org; Thu, 12 May 2022 13:46:47 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1652377600;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Z/VphYQPjplj0EJHSq+pVFDUznhL3SNzw7ipsSicmE0=;
 b=UnDj6stkA9kZAgMoQoyM8HD0c89uMGWNgy7eD42MV8qfTOLlSHHPcetsrXKk6OwEcZsVl8
 bOz3nGPATPJV4ewZ9EcDZRI0tI2HI/6v3xaxC7eIWwynuvtqRUBLRVdAEJO8u3/bffERVk
 gheMm3gWe6qebbT9kzAibM5ql0ZO218=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-145-MBtHECjFM7aPs1BHk6JBlw-1; Thu, 12 May 2022 13:46:38 -0400
X-MC-Unique: MBtHECjFM7aPs1BHk6JBlw-1
Received: by mail-wm1-f72.google.com with SMTP id
 m26-20020a7bcb9a000000b0039455e871b6so1942683wmi.8
 for <qemu-devel@nongnu.org>; Thu, 12 May 2022 10:46:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=Z/VphYQPjplj0EJHSq+pVFDUznhL3SNzw7ipsSicmE0=;
 b=e2/tXEASqLcfPkmzaK8NDRBxyHh+/DI6Zg1uer9qMJKSG9ElnBHaWomIy8ARIo7N0X
 TQdKXtTDnLXaVwwl4RaVgs8c8xJNhCAy7qLX9H3mXQl1U5doGpxBjFN9pk2Jik3pctCc
 yLrVPzJl6fAOajn5lvy+5+Ny+bMtpoQtAhNxp+bfDySCLmreGJCMmd5XiBN5BAhY8qaP
 A6bPilCCGe5Fw3ixgoF1YQ94N1zXirORZbekjA+Db57olpyoU4PFnN2ECb/S1aNSc0Qi
 tDKF59CqFCE77ZOBmlWNX4T4TyZThg/MD8Fdg5n1GqWorExKSIkCXOv8+XFSSP47SIWX
 3U1Q==
X-Gm-Message-State: AOAM533C9Re8bQvw3gw/K1EKRwHF/UFWBWWsV+QnAXShEAMAvau9Q4L1
 P0452ovLl/2tehwgNr0ypReyDTvPN8voHjY2ozJrrNaQ9foJzsKJ/aT7h5UigM72JGZWKc+cTPS
 RmkP3wiozVQos68U=
X-Received: by 2002:a05:600c:4ec9:b0:394:7d73:325e with SMTP id
 g9-20020a05600c4ec900b003947d73325emr11169568wmq.61.1652377597654; 
 Thu, 12 May 2022 10:46:37 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwutwA1A6H2C9WyvcJTy9he8Uq2Joi063rHgikXZXbsFpwOSTG3Sz1DU61x00y7RdWK2iY/wg==
X-Received: by 2002:a05:600c:4ec9:b0:394:7d73:325e with SMTP id
 g9-20020a05600c4ec900b003947d73325emr11169541wmq.61.1652377597344; 
 Thu, 12 May 2022 10:46:37 -0700 (PDT)
Received: from work-vm (cpc109025-salf6-2-0-cust480.10-2.cable.virginm.net.
 [82.30.61.225]) by smtp.gmail.com with ESMTPSA id
 l12-20020adfbd8c000000b0020c547f75easm107734wrh.101.2022.05.12.10.46.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 12 May 2022 10:46:36 -0700 (PDT)
Date: Thu, 12 May 2022 18:46:34 +0100
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: Peter Xu <peterx@redhat.com>
Cc: qemu-devel@nongnu.org, "Daniel P . Berrange" <berrange@redhat.com>,
 Juan Quintela <quintela@redhat.com>,
 Leonardo Bras Soares Passos <lsoaresp@redhat.com>
Subject: Re: [PATCH v5 16/21] migration: Add helpers to detect TLS capability
Message-ID: <Yn1H+g0gw2T0znbe@work-vm>
References: <20220425233847.10393-1-peterx@redhat.com>
 <20220425233847.10393-17-peterx@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220425233847.10393-17-peterx@redhat.com>
User-Agent: Mutt/2.2.1 (2022-02-19)
Received-SPF: pass client-ip=170.10.129.124; envelope-from=dgilbert@redhat.com;
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

* Peter Xu (peterx@redhat.com) wrote:
> Add migrate_tls_enabled() to detect whether TLS is configured.
> 
> Add migrate_channel_requires_tls() to detect whether the specific channel
> requires TLS.
> 
> No functional change intended.
> 
> Signed-off-by: Peter Xu <peterx@redhat.com>

Reviewed-by: Dr. David Alan Gilbert <dgilbert@redhat.com>

> ---
>  migration/channel.c   | 10 ++--------
>  migration/migration.c |  8 ++++++++
>  migration/migration.h |  2 ++
>  migration/multifd.c   |  7 +------
>  migration/tls.c       |  9 +++++++++
>  migration/tls.h       |  4 ++++
>  6 files changed, 26 insertions(+), 14 deletions(-)
> 
> diff --git a/migration/channel.c b/migration/channel.c
> index c6a8dcf1d7..36e59eaeec 100644
> --- a/migration/channel.c
> +++ b/migration/channel.c
> @@ -38,10 +38,7 @@ void migration_channel_process_incoming(QIOChannel *ioc)
>      trace_migration_set_incoming_channel(
>          ioc, object_get_typename(OBJECT(ioc)));
>  
> -    if (s->parameters.tls_creds &&
> -        *s->parameters.tls_creds &&
> -        !object_dynamic_cast(OBJECT(ioc),
> -                             TYPE_QIO_CHANNEL_TLS)) {
> +    if (migrate_channel_requires_tls(ioc)) {
>          migration_tls_channel_process_incoming(s, ioc, &local_err);
>      } else {
>          migration_ioc_register_yank(ioc);
> @@ -71,10 +68,7 @@ void migration_channel_connect(MigrationState *s,
>          ioc, object_get_typename(OBJECT(ioc)), hostname, error);
>  
>      if (!error) {
> -        if (s->parameters.tls_creds &&
> -            *s->parameters.tls_creds &&
> -            !object_dynamic_cast(OBJECT(ioc),
> -                                 TYPE_QIO_CHANNEL_TLS)) {
> +        if (migrate_channel_requires_tls(ioc)) {
>              migration_tls_channel_connect(s, ioc, hostname, &error);
>  
>              if (!error) {
> diff --git a/migration/migration.c b/migration/migration.c
> index cd9650f2e2..71a50b5c37 100644
> --- a/migration/migration.c
> +++ b/migration/migration.c
> @@ -49,6 +49,7 @@
>  #include "trace.h"
>  #include "exec/target_page.h"
>  #include "io/channel-buffer.h"
> +#include "io/channel-tls.h"
>  #include "migration/colo.h"
>  #include "hw/boards.h"
>  #include "hw/qdev-properties.h"
> @@ -4250,6 +4251,13 @@ void migration_global_dump(Monitor *mon)
>                     ms->clear_bitmap_shift);
>  }
>  
> +bool migrate_tls_enabled(void)
> +{
> +    MigrationState *s = migrate_get_current();
> +
> +    return s->parameters.tls_creds && *s->parameters.tls_creds;
> +}
> +
>  #define DEFINE_PROP_MIG_CAP(name, x)             \
>      DEFINE_PROP_BOOL(name, MigrationState, enabled_capabilities[x], false)
>  
> diff --git a/migration/migration.h b/migration/migration.h
> index 6ee520642f..db176ea749 100644
> --- a/migration/migration.h
> +++ b/migration/migration.h
> @@ -436,6 +436,8 @@ bool migrate_use_events(void);
>  bool migrate_postcopy_blocktime(void);
>  bool migrate_background_snapshot(void);
>  bool migrate_postcopy_preempt(void);
> +/* Whether TLS is enabled for migration? */
> +bool migrate_tls_enabled(void);
>  
>  /* Sending on the return path - generic and then for each message type */
>  void migrate_send_rp_shut(MigrationIncomingState *mis,
> diff --git a/migration/multifd.c b/migration/multifd.c
> index 9ea4f581e2..19e3c44491 100644
> --- a/migration/multifd.c
> +++ b/migration/multifd.c
> @@ -782,17 +782,12 @@ static bool multifd_channel_connect(MultiFDSendParams *p,
>                                      QIOChannel *ioc,
>                                      Error *error)
>  {
> -    MigrationState *s = migrate_get_current();
> -
>      trace_multifd_set_outgoing_channel(
>          ioc, object_get_typename(OBJECT(ioc)),
>          migrate_get_current()->hostname, error);
>  
>      if (!error) {
> -        if (s->parameters.tls_creds &&
> -            *s->parameters.tls_creds &&
> -            !object_dynamic_cast(OBJECT(ioc),
> -                                 TYPE_QIO_CHANNEL_TLS)) {
> +        if (migrate_channel_requires_tls(ioc)) {
>              multifd_tls_channel_connect(p, ioc, &error);
>              if (!error) {
>                  /*
> diff --git a/migration/tls.c b/migration/tls.c
> index 32c384a8b6..bd1fa01048 100644
> --- a/migration/tls.c
> +++ b/migration/tls.c
> @@ -166,3 +166,12 @@ void migration_tls_channel_connect(MigrationState *s,
>                                NULL,
>                                NULL);
>  }
> +
> +bool migrate_channel_requires_tls(QIOChannel *ioc)
> +{
> +    if (!migrate_tls_enabled()) {
> +        return false;
> +    }
> +
> +    return !object_dynamic_cast(OBJECT(ioc), TYPE_QIO_CHANNEL_TLS);
> +}
> diff --git a/migration/tls.h b/migration/tls.h
> index de4fe2cafd..a54c1dcec7 100644
> --- a/migration/tls.h
> +++ b/migration/tls.h
> @@ -37,4 +37,8 @@ void migration_tls_channel_connect(MigrationState *s,
>                                     QIOChannel *ioc,
>                                     const char *hostname,
>                                     Error **errp);
> +
> +/* Whether the QIO channel requires further TLS handshake? */
> +bool migrate_channel_requires_tls(QIOChannel *ioc);
> +
>  #endif
> -- 
> 2.32.0
> 
-- 
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK


