Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 660404F8689
	for <lists+qemu-devel@lfdr.de>; Thu,  7 Apr 2022 19:49:02 +0200 (CEST)
Received: from localhost ([::1]:37164 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ncWFg-00068c-Vx
	for lists+qemu-devel@lfdr.de; Thu, 07 Apr 2022 13:49:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52138)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1ncW9A-0004K4-Rr
 for qemu-devel@nongnu.org; Thu, 07 Apr 2022 13:42:16 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:46216)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1ncW98-0001CK-9E
 for qemu-devel@nongnu.org; Thu, 07 Apr 2022 13:42:15 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1649353332;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=ty7HDKA7rZxCyje4rbZmlhSrzA+S+a3Gh5xZDz2jVTQ=;
 b=HBB2Ow6NUiYWR4fUDJQpcz0BJzUM442SaBZUMQcyUSYbKzvTGOVU9DEutwl+vWhclnq6m8
 hyMp4yt9VMgM/Aw4i2DquBJ7vYE6BFDgWqHYB4KB4/Omxe+77Iawgy7BDzFYfi+WEeJFIl
 aAATj1sYcGRgWK+KXj+I8Y7u7KkG/aU=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-590-78BS48iHOwKfcb8w0QtPwQ-1; Thu, 07 Apr 2022 13:42:11 -0400
X-MC-Unique: 78BS48iHOwKfcb8w0QtPwQ-1
Received: by mail-wr1-f71.google.com with SMTP id
 l22-20020adfa396000000b0020612097035so1499808wrb.8
 for <qemu-devel@nongnu.org>; Thu, 07 Apr 2022 10:42:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=ty7HDKA7rZxCyje4rbZmlhSrzA+S+a3Gh5xZDz2jVTQ=;
 b=xK7HaTB1GjcMS8MN3E+0/yUPJmurlCbPtaBkuhzmiqw1bLkt56NNscjgB67kLqVURm
 9zWZoJPvIZqZ1BUqhoaXHxkkb2p4nWYDi7ZepSwdXyIwR9Hn3yRlWQeF/lIsKmWJby0R
 QzP6zVNcEqiSBTeKhpGdnB3HWGixJQQmRdGXWzz4rJ3vjQDDpivgOKYwZgqV2OwqVUl/
 S2TkrlVx4LIkAFkIh1faCKYWtDHgrIwYEGVmkRXJ6akOsLR7IEzGeV9zZ9QzG5SDjVaN
 gFnF3sYTldxCUzoGt3nbiRBVTrieRfwBUUFSCGcmirZGDU5z3H1bHiw1a9C/1+efRHb3
 iZ9A==
X-Gm-Message-State: AOAM533pgRiFT/UH32/Q2hULP0szydri03VGzx5/vZsfeuKIwDhaPczM
 adeJzv94Aq/1ajR0LMURpXSaTXKrTDDV4Mz7wm8nDE3qIu89RJ0A9XfKYTITOcdPaLuLg4F8mqH
 Tcv6LusBxSN66ZKk=
X-Received: by 2002:a1c:2904:0:b0:37b:ea53:4cbf with SMTP id
 p4-20020a1c2904000000b0037bea534cbfmr13379089wmp.46.1649353330660; 
 Thu, 07 Apr 2022 10:42:10 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwyQEehup50D+i6QSTrvFkeUJn+Wgddf9hMz5ivpIw5h19S3V7dWJKx/LpV6xpBITIMf2bq+Q==
X-Received: by 2002:a1c:2904:0:b0:37b:ea53:4cbf with SMTP id
 p4-20020a1c2904000000b0037bea534cbfmr13379068wmp.46.1649353330458; 
 Thu, 07 Apr 2022 10:42:10 -0700 (PDT)
Received: from work-vm (cpc109025-salf6-2-0-cust480.10-2.cable.virginm.net.
 [82.30.61.225]) by smtp.gmail.com with ESMTPSA id
 h133-20020a1c218b000000b0038e7c143e78sm8564302wmh.45.2022.04.07.10.42.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 07 Apr 2022 10:42:09 -0700 (PDT)
Date: Thu, 7 Apr 2022 18:42:08 +0100
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: Peter Xu <peterx@redhat.com>
Subject: Re: [PATCH v4 02/19] migration: Drop multifd tls_hostname cache
Message-ID: <Yk8icGbxDXpIBydA@work-vm>
References: <20220331150857.74406-1-peterx@redhat.com>
 <20220331150857.74406-3-peterx@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20220331150857.74406-3-peterx@redhat.com>
User-Agent: Mutt/2.1.5 (2021-12-30)
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dgilbert@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=dgilbert@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: Leonardo Bras Soares Passos <lsoaresp@redhat.com>,
 "Daniel P . Berrange" <berrange@redhat.com>, qemu-devel@nongnu.org,
 Juan Quintela <quintela@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

* Peter Xu (peterx@redhat.com) wrote:
> The hostname is cached N times, N equals to the multifd channels.
> 
> Drop that cache because after previous patch we've got s->hostname
> being alive for the whole lifecycle of migration procedure.
> 
> Cc: Juan Quintela <quintela@redhat.com>
> Cc: Daniel P. Berrange <berrange@redhat.com>
> Signed-off-by: Peter Xu <peterx@redhat.com>

Reviewed-by: Dr. David Alan Gilbert <dgilbert@redhat.com>

> ---
>  migration/multifd.c | 10 +++-------
>  migration/multifd.h |  2 --
>  2 files changed, 3 insertions(+), 9 deletions(-)
> 
> diff --git a/migration/multifd.c b/migration/multifd.c
> index 76b57a7177..1be4ab5d17 100644
> --- a/migration/multifd.c
> +++ b/migration/multifd.c
> @@ -542,8 +542,6 @@ void multifd_save_cleanup(void)
>          qemu_sem_destroy(&p->sem_sync);
>          g_free(p->name);
>          p->name = NULL;
> -        g_free(p->tls_hostname);
> -        p->tls_hostname = NULL;
>          multifd_pages_clear(p->pages);
>          p->pages = NULL;
>          p->packet_len = 0;
> @@ -763,7 +761,7 @@ static void multifd_tls_channel_connect(MultiFDSendParams *p,
>                                          Error **errp)
>  {
>      MigrationState *s = migrate_get_current();
> -    const char *hostname = p->tls_hostname;
> +    const char *hostname = s->hostname;
>      QIOChannelTLS *tioc;
>  
>      tioc = migration_tls_client_create(s, ioc, hostname, errp);
> @@ -787,7 +785,8 @@ static bool multifd_channel_connect(MultiFDSendParams *p,
>      MigrationState *s = migrate_get_current();
>  
>      trace_multifd_set_outgoing_channel(
> -        ioc, object_get_typename(OBJECT(ioc)), p->tls_hostname, error);
> +        ioc, object_get_typename(OBJECT(ioc)),
> +        migrate_get_current()->hostname, error);
>  
>      if (!error) {
>          if (s->parameters.tls_creds &&
> @@ -874,7 +873,6 @@ int multifd_save_setup(Error **errp)
>      int thread_count;
>      uint32_t page_count = MULTIFD_PACKET_SIZE / qemu_target_page_size();
>      uint8_t i;
> -    MigrationState *s;
>  
>      if (!migrate_use_multifd()) {
>          return 0;
> @@ -884,7 +882,6 @@ int multifd_save_setup(Error **errp)
>          return -1;
>      }
>  
> -    s = migrate_get_current();
>      thread_count = migrate_multifd_channels();
>      multifd_send_state = g_malloc0(sizeof(*multifd_send_state));
>      multifd_send_state->params = g_new0(MultiFDSendParams, thread_count);
> @@ -909,7 +906,6 @@ int multifd_save_setup(Error **errp)
>          p->packet->magic = cpu_to_be32(MULTIFD_MAGIC);
>          p->packet->version = cpu_to_be32(MULTIFD_VERSION);
>          p->name = g_strdup_printf("multifdsend_%d", i);
> -        p->tls_hostname = g_strdup(s->hostname);
>          /* We need one extra place for the packet header */
>          p->iov = g_new0(struct iovec, page_count + 1);
>          p->normal = g_new0(ram_addr_t, page_count);
> diff --git a/migration/multifd.h b/migration/multifd.h
> index 4dda900a0b..3d577b98b7 100644
> --- a/migration/multifd.h
> +++ b/migration/multifd.h
> @@ -72,8 +72,6 @@ typedef struct {
>      uint8_t id;
>      /* channel thread name */
>      char *name;
> -    /* tls hostname */
> -    char *tls_hostname;
>      /* channel thread id */
>      QemuThread thread;
>      /* communication channel */
> -- 
> 2.32.0
> 
-- 
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK


