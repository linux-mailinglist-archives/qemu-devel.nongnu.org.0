Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1718D510296
	for <lists+qemu-devel@lfdr.de>; Tue, 26 Apr 2022 18:08:45 +0200 (CEST)
Received: from localhost ([::1]:34820 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1njNk3-0003Oq-PF
	for lists+qemu-devel@lfdr.de; Tue, 26 Apr 2022 12:08:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38070)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1njNds-0004L3-6P
 for qemu-devel@nongnu.org; Tue, 26 Apr 2022 12:02:20 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:26936)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1njNdq-0007Zm-Ce
 for qemu-devel@nongnu.org; Tue, 26 Apr 2022 12:02:19 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1650988937;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=VWOk6qPmvieWV391Izt/ljwwuJqoF15wKea0EP1kpSI=;
 b=iiVjD6HhsK8o90NPTulcQZMHk4qqtP7DNSw0iKiRr3Nlay7/eSFvqCbtdpLtB8ijHErlbn
 MJKgBcsIsTxVPeVMu/cQEnlbr3Ph8csLa0Xjl2BlJc6Sc32SE09bcJuI4F1gKs+6z/PaZl
 OwVTOJYIW2VPeIqMbZJ/ItRpF0gfgCM=
Received: from mail-io1-f70.google.com (mail-io1-f70.google.com
 [209.85.166.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-156-x4myDi1cOaqv738IMiGQ3g-1; Tue, 26 Apr 2022 12:02:16 -0400
X-MC-Unique: x4myDi1cOaqv738IMiGQ3g-1
Received: by mail-io1-f70.google.com with SMTP id
 x16-20020a6bfe10000000b006409f03e39eso14457139ioh.7
 for <qemu-devel@nongnu.org>; Tue, 26 Apr 2022 09:02:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=VWOk6qPmvieWV391Izt/ljwwuJqoF15wKea0EP1kpSI=;
 b=bVweCRAO/VxgCsPOFnCc19nvnsnYb0Rim7dkkuMDPxR1Wn0kvEojm4P64PLB3ddHzP
 meBv9hl44KoMqNpq6SP8XMZGE5DTgVkevMN5iFLhQHNqvYAdoXSL2YYO0JYdS5yvTuYb
 IdFnTh6B06kgeIKP04VJGEMoG7QFUnU7oJDNvKx9x/9EVowI/ltu8HiDrdL/RH1LIx9R
 IH8zkfyxxXFuxzAz6Twr0PGiNSTe5GRo4BAPBKq43zKLKd6jQQ+SvGVomw/0SdIALumx
 RymEEKkcBh2/Iq4nCG10gfA7vL9jIxeEFlJkVEQzuZGHYjVNzJmyInH5jC1wT4WofSIg
 VlLA==
X-Gm-Message-State: AOAM532W7VmzIfgM0ld433r+pUKOBYHrD8dtG2x3YATQlAUqGnPAk/yc
 PdiKIkQ5PpasuLbM3ZtvyaTPq56rv9LsplOJfSqsNINOTmHOXkqSu+8a/Jf/cRIxh72nNjqccLO
 mlkkEFKOeH+8dSNo=
X-Received: by 2002:a05:6e02:1c2d:b0:2cc:4986:3f61 with SMTP id
 m13-20020a056e021c2d00b002cc49863f61mr9368735ilh.246.1650988935184; 
 Tue, 26 Apr 2022 09:02:15 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwTrFRuMDrFs34quT6Whw1nVAX6vzKcAiGRVsGfgp5qXlHp1YJtCJB4XmC/6BK9rjOZXdkd2A==
X-Received: by 2002:a05:6e02:1c2d:b0:2cc:4986:3f61 with SMTP id
 m13-20020a056e021c2d00b002cc49863f61mr9368709ilh.246.1650988934855; 
 Tue, 26 Apr 2022 09:02:14 -0700 (PDT)
Received: from xz-m1.local
 (cpec09435e3e0ee-cmc09435e3e0ec.cpe.net.cable.rogers.com. [99.241.198.116])
 by smtp.gmail.com with ESMTPSA id
 x3-20020a056e021bc300b002cc507aacddsm8438534ilv.66.2022.04.26.09.02.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 26 Apr 2022 09:02:14 -0700 (PDT)
Date: Tue, 26 Apr 2022 12:02:12 -0400
From: Peter Xu <peterx@redhat.com>
To: Leonardo Bras <leobras@redhat.com>
Subject: Re: [PATCH v9 7/7] multifd: Implement zero copy write in multifd
 migration (multifd-zero-copy)
Message-ID: <YmgXhEI0AdQ2SILO@xz-m1.local>
References: <20220425215055.611825-1-leobras@redhat.com>
 <20220425215055.611825-8-leobras@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20220425215055.611825-8-leobras@redhat.com>
Received-SPF: pass client-ip=170.10.133.124; envelope-from=peterx@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
Cc: Elena Ufimtseva <elena.ufimtseva@oracle.com>,
 John G Johnson <john.g.johnson@oracle.com>,
 Jagannathan Raman <jag.raman@oracle.com>, qemu-block@nongnu.org,
 Juan Quintela <quintela@redhat.com>, qemu-devel@nongnu.org,
 Markus Armbruster <armbru@redhat.com>,
 Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?utf-8?Q?Marc-Andr=C3=A9?= Lureau <marcandre.lureau@redhat.com>,
 Fam Zheng <fam@euphon.net>, Eric Blake <eblake@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Leo,

This patch looks mostly good to me, a few nitpicks below.

On Mon, Apr 25, 2022 at 06:50:56PM -0300, Leonardo Bras wrote:
> Implement zero copy send on nocomp_send_write(), by making use of QIOChannel
> writev + flags & flush interface.
> 
> Change multifd_send_sync_main() so flush_zero_copy() can be called
> after each iteration in order to make sure all dirty pages are sent before
> a new iteration is started. It will also flush at the beginning and at the
> end of migration.
> 
> Also make it return -1 if flush_zero_copy() fails, in order to cancel
> the migration process, and avoid resuming the guest in the target host
> without receiving all current RAM.
> 
> This will work fine on RAM migration because the RAM pages are not usually freed,
> and there is no problem on changing the pages content between writev_zero_copy() and
> the actual sending of the buffer, because this change will dirty the page and
> cause it to be re-sent on a next iteration anyway.
> 
> A lot of locked memory may be needed in order to use multifd migration
> with zero-copy enabled, so disabling the feature should be necessary for
> low-privileged users trying to perform multifd migrations.
> 
> Signed-off-by: Leonardo Bras <leobras@redhat.com>
> ---
>  migration/multifd.h   |  2 ++
>  migration/migration.c | 11 ++++++++++-
>  migration/multifd.c   | 34 ++++++++++++++++++++++++++++++----
>  migration/socket.c    |  5 +++--
>  4 files changed, 45 insertions(+), 7 deletions(-)
> 
> diff --git a/migration/multifd.h b/migration/multifd.h
> index bcf5992945..4d8d89e5e5 100644
> --- a/migration/multifd.h
> +++ b/migration/multifd.h
> @@ -92,6 +92,8 @@ typedef struct {
>      uint32_t packet_len;
>      /* pointer to the packet */
>      MultiFDPacket_t *packet;
> +    /* multifd flags for sending ram */
> +    int write_flags;
>      /* multifd flags for each packet */
>      uint32_t flags;
>      /* size of the next packet that contains pages */
> diff --git a/migration/migration.c b/migration/migration.c
> index 4b6df2eb5e..31739b2af9 100644
> --- a/migration/migration.c
> +++ b/migration/migration.c
> @@ -1497,7 +1497,16 @@ static bool migrate_params_check(MigrationParameters *params, Error **errp)
>          error_prepend(errp, "Invalid mapping given for block-bitmap-mapping: ");
>          return false;
>      }
> -
> +#ifdef CONFIG_LINUX
> +    if (params->zero_copy_send &&
> +        (!migrate_use_multifd() ||
> +         params->multifd_compression != MULTIFD_COMPRESSION_NONE ||
> +         (params->tls_creds && *params->tls_creds))) {
> +        error_setg(errp,
> +                   "Zero copy only available for non-compressed non-TLS multifd migration");
> +        return false;
> +    }
> +#endif
>      return true;
>  }
>  
> diff --git a/migration/multifd.c b/migration/multifd.c
> index 6c940aaa98..e37cc6e0d9 100644
> --- a/migration/multifd.c
> +++ b/migration/multifd.c
> @@ -569,6 +569,7 @@ void multifd_save_cleanup(void)
>  int multifd_send_sync_main(QEMUFile *f)
>  {
>      int i;
> +    bool flush_zero_copy;
>  
>      if (!migrate_use_multifd()) {
>          return 0;
> @@ -579,6 +580,14 @@ int multifd_send_sync_main(QEMUFile *f)
>              return -1;
>          }
>      }
> +
> +    /*
> +     * When using zero-copy, it's necessary to flush after each iteration to
> +     * make sure pages from earlier iterations don't end up replacing newer
> +     * pages.
> +     */
> +    flush_zero_copy = migrate_use_zero_copy_send();

Would you mind inline it if it's only used once?

It's great to have that comment, but IMHO it could be more explicit, even
marking a TODO showing that maybe we could do better in the future:

  /*
   * When using zero-copy, it's necessary to flush the pages before any of
   * the pages can be sent again, so we'll make sure the new version of the
   * pages will always arrive _later_ than the old pages.
   *
   * Currently we achieve this by flushing the zero-page requested writes
   * per ram iteration, but in the future we could potentially optimize it
   * to be less frequent, e.g. only after we finished one whole scanning of
   * all the dirty bitmaps.
   */

> +
>      for (i = 0; i < migrate_multifd_channels(); i++) {
>          MultiFDSendParams *p = &multifd_send_state->params[i];
>  
> @@ -600,6 +609,17 @@ int multifd_send_sync_main(QEMUFile *f)
>          ram_counters.transferred += p->packet_len;
>          qemu_mutex_unlock(&p->mutex);
>          qemu_sem_post(&p->sem);
> +
> +        if (flush_zero_copy && p->c) {
> +            int ret;
> +            Error *err = NULL;
> +
> +            ret = qio_channel_flush(p->c, &err);
> +            if (ret < 0) {
> +                error_report_err(err);
> +                return -1;
> +            }
> +        }
>      }
>      for (i = 0; i < migrate_multifd_channels(); i++) {
>          MultiFDSendParams *p = &multifd_send_state->params[i];
> @@ -688,10 +708,9 @@ static void *multifd_send_thread(void *opaque)
>                  p->iov[0].iov_base = p->packet;
>              }
>  
> -            ret = qio_channel_writev_all(p->c, p->iov + iov_offset,
> -                                         p->iovs_num - iov_offset,
> -                                         &local_err);
> -
> +            ret = qio_channel_writev_full_all(p->c, p->iov + iov_offset,
> +                                              p->iovs_num - iov_offset, NULL,
> +                                              0, p->write_flags, &local_err);

I kind of agree with Dan in previous patch - this iov_offset is confusing,
better drop it.

>              if (ret != 0) {
>                  break;
>              }
> @@ -920,6 +939,13 @@ int multifd_save_setup(Error **errp)
>          /* We need one extra place for the packet header */
>          p->iov = g_new0(struct iovec, page_count + 1);
>          p->normal = g_new0(ram_addr_t, page_count);
> +
> +        if (migrate_use_zero_copy_send()) {
> +            p->write_flags = QIO_CHANNEL_WRITE_FLAG_ZERO_COPY;
> +        } else {
> +            p->write_flags = 0;
> +        }
> +
>          socket_send_channel_create(multifd_new_send_channel_async, p);
>      }
>  
> diff --git a/migration/socket.c b/migration/socket.c
> index 3754d8f72c..4fd5e85f50 100644
> --- a/migration/socket.c
> +++ b/migration/socket.c
> @@ -79,8 +79,9 @@ static void socket_outgoing_migration(QIOTask *task,
>  
>      trace_migration_socket_outgoing_connected(data->hostname);
>  
> -    if (migrate_use_zero_copy_send()) {
> -        error_setg(&err, "Zero copy send not available in migration");
> +    if (migrate_use_zero_copy_send() &&
> +        !qio_channel_has_feature(sioc, QIO_CHANNEL_FEATURE_WRITE_ZERO_COPY)) {
> +        error_setg(&err, "Zero copy send feature not detected in host kernel");
>      }
>  
>  out:
> -- 
> 2.36.0
> 

-- 
Peter Xu


