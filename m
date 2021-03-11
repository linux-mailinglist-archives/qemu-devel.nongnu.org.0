Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 216E9336F2A
	for <lists+qemu-devel@lfdr.de>; Thu, 11 Mar 2021 10:47:25 +0100 (CET)
Received: from localhost ([::1]:46364 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lKHue-0001gn-2Z
	for lists+qemu-devel@lfdr.de; Thu, 11 Mar 2021 04:47:24 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:58794)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1lKHsS-0007z5-Bl
 for qemu-devel@nongnu.org; Thu, 11 Mar 2021 04:45:08 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:21503)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1lKHsK-00086k-3Y
 for qemu-devel@nongnu.org; Thu, 11 Mar 2021 04:45:07 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1615455896;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=H7PO1qHRvrRqVgK7pl6jIQ1XmckEJKhSc3PQPKDxpmI=;
 b=Xg0xLL63XIJ0RK+yOPQ7sL2CeBbqHxygeQz30DY38TP2BsBl2naMlhj1Ap4qW8yve8Dsvy
 +KnVQwxUnwalC0puFuiuAcO/VrFaCRyhPi1TU8eHXM6gXmKNiKJyJp88GIACvrkOVOr0e+
 712mjM4AsQp74Tr3Ezj/1lIa+QlEplE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-456-Tw7fVqjvMDyNRsXa4OhBLg-1; Thu, 11 Mar 2021 04:44:54 -0500
X-MC-Unique: Tw7fVqjvMDyNRsXa4OhBLg-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 6D6D18015BE;
 Thu, 11 Mar 2021 09:44:53 +0000 (UTC)
Received: from work-vm (ovpn-115-29.ams2.redhat.com [10.36.115.29])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 94866669EB;
 Thu, 11 Mar 2021 09:44:52 +0000 (UTC)
Date: Thu, 11 Mar 2021 09:44:50 +0000
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: Mahmoud Mandour <ma.mandourr@gmail.com>
Subject: Re: [PATCH 6/9] migration: Replaced qemu_mutex_lock calls with
 QEMU_LOCK_GUARD
Message-ID: <YEnmkpUm6QelXVcU@work-vm>
References: <20210311031538.5325-1-ma.mandourr@gmail.com>
 <20210311031538.5325-7-ma.mandourr@gmail.com>
MIME-Version: 1.0
In-Reply-To: <20210311031538.5325-7-ma.mandourr@gmail.com>
User-Agent: Mutt/2.0.5 (2021-01-21)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dgilbert@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=63.128.21.124; envelope-from=dgilbert@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.243,
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
Cc: qemu-devel@nongnu.org, Juan Quintela <quintela@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

* Mahmoud Mandour (ma.mandourr@gmail.com) wrote:
> Replaced various qemu_mutex_lock calls and their respective
> qemu_mutex_unlock calls with QEMU_LOCK_GUARD macro. This simplifies
> the code by eliminating the respective qemu_mutex_unlock calls.
> 
> Signed-off-by: Mahmoud Mandour <ma.mandourr@gmail.com>

Reviewed-by: Dr. David Alan Gilbert <dgilbert@redhat.com>

> ---
>  migration/migration.c | 6 ++----
>  migration/ram.c       | 6 ++----
>  2 files changed, 4 insertions(+), 8 deletions(-)
> 
> diff --git a/migration/migration.c b/migration/migration.c
> index a5ddf43559..36768391b6 100644
> --- a/migration/migration.c
> +++ b/migration/migration.c
> @@ -323,7 +323,7 @@ static int migrate_send_rp_message(MigrationIncomingState *mis,
>      int ret = 0;
>  
>      trace_migrate_send_rp_message((int)message_type, len);
> -    qemu_mutex_lock(&mis->rp_mutex);
> +    QEMU_LOCK_GUARD(&mis->rp_mutex);
>  
>      /*
>       * It's possible that the file handle got lost due to network
> @@ -331,7 +331,7 @@ static int migrate_send_rp_message(MigrationIncomingState *mis,
>       */
>      if (!mis->to_src_file) {
>          ret = -EIO;
> -        goto error;
> +        return ret;
>      }
>  
>      qemu_put_be16(mis->to_src_file, (unsigned int)message_type);
> @@ -342,8 +342,6 @@ static int migrate_send_rp_message(MigrationIncomingState *mis,
>      /* It's possible that qemu file got error during sending */
>      ret = qemu_file_get_error(mis->to_src_file);
>  
> -error:
> -    qemu_mutex_unlock(&mis->rp_mutex);
>      return ret;
>  }
>  
> diff --git a/migration/ram.c b/migration/ram.c
> index 72143da0ac..52537f14ac 100644
> --- a/migration/ram.c
> +++ b/migration/ram.c
> @@ -819,7 +819,7 @@ static inline bool migration_bitmap_clear_dirty(RAMState *rs,
>  {
>      bool ret;
>  
> -    qemu_mutex_lock(&rs->bitmap_mutex);
> +    QEMU_LOCK_GUARD(&rs->bitmap_mutex);
>  
>      /*
>       * Clear dirty bitmap if needed.  This _must_ be called before we
> @@ -852,7 +852,6 @@ static inline bool migration_bitmap_clear_dirty(RAMState *rs,
>      if (ret) {
>          rs->migration_dirty_pages--;
>      }
> -    qemu_mutex_unlock(&rs->bitmap_mutex);
>  
>      return ret;
>  }
> @@ -3275,7 +3274,7 @@ static void decompress_data_with_multi_threads(QEMUFile *f,
>      int idx, thread_count;
>  
>      thread_count = migrate_decompress_threads();
> -    qemu_mutex_lock(&decomp_done_lock);
> +    QEMU_LOCK_GUARD(&decomp_done_lock);
>      while (true) {
>          for (idx = 0; idx < thread_count; idx++) {
>              if (decomp_param[idx].done) {
> @@ -3295,7 +3294,6 @@ static void decompress_data_with_multi_threads(QEMUFile *f,
>              qemu_cond_wait(&decomp_done_cond, &decomp_done_lock);
>          }
>      }
> -    qemu_mutex_unlock(&decomp_done_lock);
>  }
>  
>   /*
> -- 
> 2.25.1
> 
-- 
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK


