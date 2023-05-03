Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 54BF26F591D
	for <lists+qemu-devel@lfdr.de>; Wed,  3 May 2023 15:35:09 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1puCch-0004B7-MD; Wed, 03 May 2023 09:34:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1puCcf-0004Ao-BB
 for qemu-devel@nongnu.org; Wed, 03 May 2023 09:34:21 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1puCcd-0008SE-D0
 for qemu-devel@nongnu.org; Wed, 03 May 2023 09:34:20 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1683120858;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=LErarw/44jaSkG/LRbhsrxUTpuAHvO/1U21cLWueBcs=;
 b=gH6bshm3OVyV68mWsPGYHtv7pqk8wR3jPFAYeHUXxkQVn5iP7ofGtPCTdBcVQyIag1bwTf
 G4kgbwYFZsX0SzrqKF1lxF1QGRt36MvN9vEansBsX8D63I4592TV/3BvMfifNaHnTn78OF
 26bi7ac57mGtQGhdK1UZAodjZBNFrsY=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-55-Va8S2CP-PcSOP8oIIYtfjg-1; Wed, 03 May 2023 09:34:16 -0400
X-MC-Unique: Va8S2CP-PcSOP8oIIYtfjg-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
 [10.11.54.6])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 8C2E4884349
 for <qemu-devel@nongnu.org>; Wed,  3 May 2023 13:34:16 +0000 (UTC)
Received: from redhat.com (unknown [10.42.28.37])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 18A8C2166B29;
 Wed,  3 May 2023 13:34:14 +0000 (UTC)
Date: Wed, 3 May 2023 14:34:11 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Juan Quintela <quintela@redhat.com>
Cc: qemu-devel@nongnu.org, Peter Xu <peterx@redhat.com>,
 Leonardo Bras <leobras@redhat.com>
Subject: Re: [PATCH v2 01/16] migration: Create migrate_rdma()
Message-ID: <ZFJi0/K2BXhYkh75@redhat.com>
References: <20230503131847.11603-1-quintela@redhat.com>
 <20230503131847.11603-2-quintela@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20230503131847.11603-2-quintela@redhat.com>
User-Agent: Mutt/2.2.9 (2022-11-12)
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.6
Received-SPF: pass client-ip=170.10.129.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -22
X-Spam_score: -2.3
X-Spam_bar: --
X-Spam_report: (-2.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.161,
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
Reply-To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Wed, May 03, 2023 at 03:18:32PM +0200, Juan Quintela wrote:
> Helper to say if we are doing a migration over rdma.
> 
> Signed-off-by: Juan Quintela <quintela@redhat.com>
> ---
>  migration/migration.h | 3 +++
>  migration/options.c   | 7 +++++++
>  migration/options.h   | 1 +
>  migration/rdma.c      | 4 +++-
>  4 files changed, 14 insertions(+), 1 deletion(-)
> 
> diff --git a/migration/migration.h b/migration/migration.h
> index 3a918514e7..47fe116167 100644
> --- a/migration/migration.h
> +++ b/migration/migration.h
> @@ -432,6 +432,9 @@ struct MigrationState {
>  
>      /* QEMU_VM_VMDESCRIPTION content filled for all non-iterable devices. */
>      JSONWriter *vmdesc;
> +
> +    /* Is this a rdma migration */
> +    bool rdma_migration;
>  };
>  
>  void migrate_set_state(int *state, int old_state, int new_state);
> diff --git a/migration/options.c b/migration/options.c
> index 53b7fc5d5d..39843f9325 100644
> --- a/migration/options.c
> +++ b/migration/options.c
> @@ -349,6 +349,13 @@ bool migrate_postcopy(void)
>      return migrate_postcopy_ram() || migrate_dirty_bitmaps();
>  }
>  
> +bool migrate_rdma(void)
> +{
> +    MigrationState *s = migrate_get_current();
> +
> +    return s->rdma_migration;
> +}
> +
>  bool migrate_tls(void)
>  {
>      MigrationState *s = migrate_get_current();
> diff --git a/migration/options.h b/migration/options.h
> index 3c322867cd..3c555e28c7 100644
> --- a/migration/options.h
> +++ b/migration/options.h
> @@ -61,6 +61,7 @@ bool migrate_zero_copy_send(void);
>  
>  bool migrate_multifd_flush_after_each_section(void);
>  bool migrate_postcopy(void);
> +bool migrate_rdma(void);
>  bool migrate_tls(void);
>  
>  /* capabilities helpers */
> diff --git a/migration/rdma.c b/migration/rdma.c
> index 7e747b2595..b026e98519 100644
> --- a/migration/rdma.c
> +++ b/migration/rdma.c
> @@ -4119,6 +4119,7 @@ void rdma_start_incoming_migration(const char *host_port, Error **errp)
>      int ret;
>      RDMAContext *rdma;
>      Error *local_err = NULL;
> +    MigrationState *s = migrate_get_current();
>  
>      trace_rdma_start_incoming_migration();
>  
> @@ -4149,7 +4150,7 @@ void rdma_start_incoming_migration(const char *host_port, Error **errp)
>      }
>  
>      trace_rdma_start_incoming_migration_after_rdma_listen();
> -
> +    s->rdma_migration = true;
>      qemu_set_fd_handler(rdma->channel->fd, rdma_accept_incoming_migration,
>                          NULL, (void *)(intptr_t)rdma);
>      return;
> @@ -4225,6 +4226,7 @@ void rdma_start_outgoing_migration(void *opaque,
>  
>      trace_rdma_start_outgoing_migration_after_rdma_connect();
>  
> +    s->rdma_migration = true;
>      s->to_dst_file = qemu_fopen_rdma(rdma, "wb");
>      migrate_fd_connect(s, NULL);
>      return;

Is the "MigrationState" allocated freshly for every incoming
or outgoing migration ?  If it is reused, then something
needs to set 's->rdma_migration = false' in non-RDMA code
paths.

With regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


