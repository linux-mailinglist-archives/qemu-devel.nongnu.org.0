Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 98A023D0BB6
	for <lists+qemu-devel@lfdr.de>; Wed, 21 Jul 2021 12:07:43 +0200 (CEST)
Received: from localhost ([::1]:40608 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m698g-0007ht-Jt
	for lists+qemu-devel@lfdr.de; Wed, 21 Jul 2021 06:07:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46924)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1m68zj-0006Jg-Bl
 for qemu-devel@nongnu.org; Wed, 21 Jul 2021 05:58:27 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:31344)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1m68zh-0005WI-GJ
 for qemu-devel@nongnu.org; Wed, 21 Jul 2021 05:58:27 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1626861504;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=JrKH3unpVPwYrYQe2oald75TWuC4xlbfwBoh4+0OBL4=;
 b=TyRITBqNw/y6RkWxN3Iz5A3Bv+WfWUDlvJT14Dj2o/itvxszrOLHtvBwDuma51T+w1BiaM
 7EvcV5AjzfJpyN/PejpibuX0TpZrm+1yletct7tPlMEUslsx9aXXUVo+X0KPSsUc2MYTp1
 CfDVd+auq0vxG1QtxWB87RV3ULtMNEM=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-312-_Id3mHsRMSySL5bjTe8Ksw-1; Wed, 21 Jul 2021 05:58:20 -0400
X-MC-Unique: _Id3mHsRMSySL5bjTe8Ksw-1
Received: by mail-wr1-f69.google.com with SMTP id
 h15-20020adffd4f0000b0290137e68ed637so772673wrs.22
 for <qemu-devel@nongnu.org>; Wed, 21 Jul 2021 02:58:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=JrKH3unpVPwYrYQe2oald75TWuC4xlbfwBoh4+0OBL4=;
 b=egsI4BLz9JXHNu1993X+91Eir7aVnG8zcqBXoGX1/cWUPqXmf7RRHw8Z+mpmuBSUgk
 zKZI4lewlDrS7s3uWGzIklNkXBohh8MsugqvtnkErKA2YtnYDFSwDTssBmTiczeWf6U6
 ppDg3vQ2k7qHQw8UKFdW/9kfo0ypnVgp4i5+cf52wtS3pCarvcE6P8M+1Xb1idL+3cTD
 ZSvJWEnCSVJ1744k43TbqDRDQghjqsEeLA1rJHtn1iG9wyUlRndFsL/bdjhLUvSEKQxs
 JEGcEc+29NXoaJB8Cma7QdRakIeovN0m/XUcrwiAs9R+Jtr21KnEJBjtoisckolW9D7N
 1bRg==
X-Gm-Message-State: AOAM531uesk4jcS3gflLfonv8lgWHVSrbPGH4MmzCDbJK4uHArUoMVKE
 ey7Y11vPuhsn4Ox09k1Uw3Q4Fou58tilWqpPukfHs2Br9dqsavNqwfBMdnwMb3kSXIQmI34P/K4
 dGvFJVk9nsPxhPVI=
X-Received: by 2002:a7b:c74a:: with SMTP id w10mr3176951wmk.54.1626861499704; 
 Wed, 21 Jul 2021 02:58:19 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwAOLtiqgsS0udwuqIHEADIk3xWy5Q+0ZROsuQgM1o+wiZCfhY+gNc3um2aaVbED3QQcTPOUQ==
X-Received: by 2002:a7b:c74a:: with SMTP id w10mr3176944wmk.54.1626861499588; 
 Wed, 21 Jul 2021 02:58:19 -0700 (PDT)
Received: from work-vm (cpc109021-salf6-2-0-cust453.10-2.cable.virginm.net.
 [82.29.237.198])
 by smtp.gmail.com with ESMTPSA id e6sm3753242wme.28.2021.07.21.02.58.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 21 Jul 2021 02:58:19 -0700 (PDT)
Date: Wed, 21 Jul 2021 10:58:17 +0100
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: Peter Xu <peterx@redhat.com>
Subject: Re: [PATCH 3/5] migration: Introduce migration_ioc_[un]register_yank()
Message-ID: <YPfvuaKLjeuX+K3A@work-vm>
References: <20210721012134.792845-1-peterx@redhat.com>
 <20210721012134.792845-4-peterx@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210721012134.792845-4-peterx@redhat.com>
User-Agent: Mutt/2.0.7 (2021-05-04)
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dgilbert@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=dgilbert@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -42
X-Spam_score: -4.3
X-Spam_bar: ----
X-Spam_report: (-4.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.474,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Lukas Straub <lukasstraub2@web.de>,
 Leonardo Bras Soares Passos <lsoaresp@redhat.com>, qemu-devel@nongnu.org,
 Juan Quintela <quintela@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

* Peter Xu (peterx@redhat.com) wrote:
> There're plenty of places in migration/* that checks against either socket or
> tls typed ioc for yank operations.  Provide two helpers to hide all these
> information.
> 
> Signed-off-by: Peter Xu <peterx@redhat.com>

Reviewed-by: Dr. David Alan Gilbert <dgilbert@redhat.com>

> ---
>  migration/channel.c           | 15 ++-------------
>  migration/multifd.c           |  8 ++------
>  migration/qemu-file-channel.c |  8 ++------
>  migration/yank_functions.c    | 28 ++++++++++++++++++++++++++++
>  migration/yank_functions.h    |  2 ++
>  5 files changed, 36 insertions(+), 25 deletions(-)
> 
> diff --git a/migration/channel.c b/migration/channel.c
> index 01275a9162..c4fc000a1a 100644
> --- a/migration/channel.c
> +++ b/migration/channel.c
> @@ -44,13 +44,7 @@ void migration_channel_process_incoming(QIOChannel *ioc)
>                               TYPE_QIO_CHANNEL_TLS)) {
>          migration_tls_channel_process_incoming(s, ioc, &local_err);
>      } else {
> -        if (object_dynamic_cast(OBJECT(ioc), TYPE_QIO_CHANNEL_SOCKET) ||
> -            object_dynamic_cast(OBJECT(ioc), TYPE_QIO_CHANNEL_TLS)) {
> -            yank_register_function(MIGRATION_YANK_INSTANCE,
> -                                   migration_yank_iochannel,
> -                                   QIO_CHANNEL(ioc));
> -        }
> -
> +        migration_ioc_register_yank(ioc);
>          migration_ioc_process_incoming(ioc, &local_err);
>      }
>  
> @@ -94,12 +88,7 @@ void migration_channel_connect(MigrationState *s,
>          } else {
>              QEMUFile *f = qemu_fopen_channel_output(ioc);
>  
> -            if (object_dynamic_cast(OBJECT(ioc), TYPE_QIO_CHANNEL_SOCKET) ||
> -                object_dynamic_cast(OBJECT(ioc), TYPE_QIO_CHANNEL_TLS)) {
> -                yank_register_function(MIGRATION_YANK_INSTANCE,
> -                                       migration_yank_iochannel,
> -                                       QIO_CHANNEL(ioc));
> -            }
> +            migration_ioc_register_yank(ioc);
>  
>              qemu_mutex_lock(&s->qemu_file_lock);
>              s->to_dst_file = f;
> diff --git a/migration/multifd.c b/migration/multifd.c
> index ab41590e71..377da78f5b 100644
> --- a/migration/multifd.c
> +++ b/migration/multifd.c
> @@ -987,12 +987,8 @@ int multifd_load_cleanup(Error **errp)
>      for (i = 0; i < migrate_multifd_channels(); i++) {
>          MultiFDRecvParams *p = &multifd_recv_state->params[i];
>  
> -        if ((object_dynamic_cast(OBJECT(p->c), TYPE_QIO_CHANNEL_SOCKET) ||
> -             object_dynamic_cast(OBJECT(p->c), TYPE_QIO_CHANNEL_TLS))
> -            && OBJECT(p->c)->ref == 1) {
> -            yank_unregister_function(MIGRATION_YANK_INSTANCE,
> -                                     migration_yank_iochannel,
> -                                     QIO_CHANNEL(p->c));
> +        if (OBJECT(p->c)->ref == 1) {
> +            migration_ioc_unregister_yank(p->c);
>          }
>  
>          object_unref(OBJECT(p->c));
> diff --git a/migration/qemu-file-channel.c b/migration/qemu-file-channel.c
> index fad340ea7a..867a5ed0c3 100644
> --- a/migration/qemu-file-channel.c
> +++ b/migration/qemu-file-channel.c
> @@ -107,12 +107,8 @@ static int channel_close(void *opaque, Error **errp)
>      int ret;
>      QIOChannel *ioc = QIO_CHANNEL(opaque);
>      ret = qio_channel_close(ioc, errp);
> -    if ((object_dynamic_cast(OBJECT(ioc), TYPE_QIO_CHANNEL_SOCKET) ||
> -         object_dynamic_cast(OBJECT(ioc), TYPE_QIO_CHANNEL_TLS))
> -        && OBJECT(ioc)->ref == 1) {
> -        yank_unregister_function(MIGRATION_YANK_INSTANCE,
> -                                 migration_yank_iochannel,
> -                                 QIO_CHANNEL(ioc));
> +    if (OBJECT(ioc)->ref == 1) {
> +        migration_ioc_unregister_yank(ioc);
>      }
>      object_unref(OBJECT(ioc));
>      return ret;
> diff --git a/migration/yank_functions.c b/migration/yank_functions.c
> index 96c90e17dc..23697173ae 100644
> --- a/migration/yank_functions.c
> +++ b/migration/yank_functions.c
> @@ -11,6 +11,9 @@
>  #include "qapi/error.h"
>  #include "io/channel.h"
>  #include "yank_functions.h"
> +#include "qemu/yank.h"
> +#include "io/channel-socket.h"
> +#include "io/channel-tls.h"
>  
>  void migration_yank_iochannel(void *opaque)
>  {
> @@ -18,3 +21,28 @@ void migration_yank_iochannel(void *opaque)
>  
>      qio_channel_shutdown(ioc, QIO_CHANNEL_SHUTDOWN_BOTH, NULL);
>  }
> +
> +/* Return whether yank is supported on this ioc */
> +static bool migration_ioc_yank_supported(QIOChannel *ioc)
> +{
> +    return object_dynamic_cast(OBJECT(ioc), TYPE_QIO_CHANNEL_SOCKET) ||
> +        object_dynamic_cast(OBJECT(ioc), TYPE_QIO_CHANNEL_TLS);
> +}
> +
> +void migration_ioc_register_yank(QIOChannel *ioc)
> +{
> +    if (migration_ioc_yank_supported(ioc)) {
> +        yank_register_function(MIGRATION_YANK_INSTANCE,
> +                               migration_yank_iochannel,
> +                               QIO_CHANNEL(ioc));
> +    }
> +}
> +
> +void migration_ioc_unregister_yank(QIOChannel *ioc)
> +{
> +    if (migration_ioc_yank_supported(ioc)) {
> +        yank_unregister_function(MIGRATION_YANK_INSTANCE,
> +                                 migration_yank_iochannel,
> +                                 QIO_CHANNEL(ioc));
> +    }
> +}
> diff --git a/migration/yank_functions.h b/migration/yank_functions.h
> index 055ea22523..74c7f18c91 100644
> --- a/migration/yank_functions.h
> +++ b/migration/yank_functions.h
> @@ -15,3 +15,5 @@
>   * @opaque: QIOChannel to shutdown
>   */
>  void migration_yank_iochannel(void *opaque);
> +void migration_ioc_register_yank(QIOChannel *ioc);
> +void migration_ioc_unregister_yank(QIOChannel *ioc);
> -- 
> 2.31.1
> 
-- 
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK


