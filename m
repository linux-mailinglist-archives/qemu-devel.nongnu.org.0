Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C8DB3D0B95
	for <lists+qemu-devel@lfdr.de>; Wed, 21 Jul 2021 11:51:01 +0200 (CEST)
Received: from localhost ([::1]:48154 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m68sW-0008Db-L8
	for lists+qemu-devel@lfdr.de; Wed, 21 Jul 2021 05:51:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45418)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1m68r3-00071M-0L
 for qemu-devel@nongnu.org; Wed, 21 Jul 2021 05:49:29 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:41292)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1m68r1-0007rB-91
 for qemu-devel@nongnu.org; Wed, 21 Jul 2021 05:49:28 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1626860966;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=GXs7eDZ9bTbyxkxfLmOWv3lrw9KeQUEfX1FVwjxiP2c=;
 b=UgB4mR7L/hjn0InwXbSmDndDvwf1teb2jCxHWOvSYDfiypyo50vVnwjGzswELyoKxG5GKI
 627fPWnhOfEVtlVbqfcCWZX9nsnQvKlo3qtIu4FfNhVPN1HWQSU/UT6OgZGBDbhNlbll2c
 fazu393dogHL5flyL/vKUMZZ/fqhLE8=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-450-lU80c-VoPHOlRSuU2BIDkw-1; Wed, 21 Jul 2021 05:49:25 -0400
X-MC-Unique: lU80c-VoPHOlRSuU2BIDkw-1
Received: by mail-wr1-f71.google.com with SMTP id
 m9-20020a5d4a090000b029013e2b4a9d1eso784005wrq.4
 for <qemu-devel@nongnu.org>; Wed, 21 Jul 2021 02:49:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=GXs7eDZ9bTbyxkxfLmOWv3lrw9KeQUEfX1FVwjxiP2c=;
 b=RCkQAYl+hx4r8OKOgwTjsQEGmXkSZv4oNCXCtFsjQMga8D9ptw5O2RUkKJHcwajnM7
 szEscxFPU5jy7jY7ORM/Vyk0BYNy9c3PkpA3dsrlAKnFQ0TdlrV08dgjCBk9OKaOhAP7
 ikhKHijOABB6r/ZIIkYnBWfVancxkzXGYZuYajVslTmQ+OnsxDfmgBdBZGK1jVqNmxzr
 eBzlhMXUvfD1YUNNcJ7xYXOmq95Vz1KrEYR2wySOaT5nqSm47XxdTytxhxTqnsZ+E0Wc
 IOeqJzMtiqtxW3i0+wQpezPghz/G0JRuXBJfOpAsPj53wKjD7PamCCv1eWWHUG3znwAt
 Jm0Q==
X-Gm-Message-State: AOAM532FBbORW5RblyZ9mk51EFTwsp7ZlBA61DSUyZCRgx9bKcSbDMB1
 iFnL8//68zmv/1SZvmXLRdabrLFSrytrOtRuuGZK1ti2mYSlGKY38UqF84Px0NzFHCJhVYSbKw7
 fLezQ9kYPVMduiEA=
X-Received: by 2002:a05:600c:4f05:: with SMTP id
 l5mr3138927wmq.96.1626860963841; 
 Wed, 21 Jul 2021 02:49:23 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxwF/pi/+Vigj+6/51fCNpUfsWPyv3Lk8s2oF1jYmPc/Zbj0d6pQ6Y6hd2HJVpOR0RJeZ+4rQ==
X-Received: by 2002:a05:600c:4f05:: with SMTP id
 l5mr3138918wmq.96.1626860963693; 
 Wed, 21 Jul 2021 02:49:23 -0700 (PDT)
Received: from work-vm (cpc109021-salf6-2-0-cust453.10-2.cable.virginm.net.
 [82.29.237.198])
 by smtp.gmail.com with ESMTPSA id c62sm7856155wme.0.2021.07.21.02.49.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 21 Jul 2021 02:49:22 -0700 (PDT)
Date: Wed, 21 Jul 2021 10:49:21 +0100
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: Peter Xu <peterx@redhat.com>
Subject: Re: [PATCH 1/5] migration: Fix missing join() of rp_thread
Message-ID: <YPftoYsHQGgvvUqy@work-vm>
References: <20210721012134.792845-1-peterx@redhat.com>
 <20210721012134.792845-2-peterx@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210721012134.792845-2-peterx@redhat.com>
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
> It's possible that the migration thread skip the join() of the rp_thread in
> below race and crash on src right at finishing migration:
> 
>        migration_thread                     rp_thread
>        ----------------                     ---------
>     migration_completion()
>                                         (before rp_thread quits)
>                                         from_dst_file=NULL
>                                         [thread got scheduled out]
>       s->rp_state.from_dst_file==NULL
>         (skip join() of rp_thread)
>     migrate_fd_cleanup()
>       qemu_fclose(s->to_dst_file)
>       yank_unregister_instance()
>         assert(yank_find_entry())  <------- crash
> 
> It could mostly happen with postcopy, but that shouldn't be required, e.g., I
> think it could also trigger with MIGRATION_CAPABILITY_RETURN_PATH set.
> 
> It's suspected that above race could be the root cause of a recent (but rare)
> migration-test break reported by either Dave or PMM:
> 
> https://lore.kernel.org/qemu-devel/YPamXAHwan%2FPPXLf@work-vm/
> 
> The issue is: from_dst_file is reset in the rp_thread, so if the thread reset
> it to NULL fast enough then the migration thread will assume there's no
> rp_thread at all.
> 
> This could potentially cause more severe issue (e.g. crash) after the yank code.
> 
> Fix it by using a boolean to keep "whether we've created rp_thread".
> 
> Cc: Dr. David Alan Gilbert <dgilbert@redhat.com>
> Signed-off-by: Peter Xu <peterx@redhat.com>

Reviewed-by: Dr. David Alan Gilbert <dgilbert@redhat.com>

> ---
>  migration/migration.c | 4 +++-
>  migration/migration.h | 7 +++++++
>  2 files changed, 10 insertions(+), 1 deletion(-)
> 
> diff --git a/migration/migration.c b/migration/migration.c
> index 2d306582eb..21b94f75a3 100644
> --- a/migration/migration.c
> +++ b/migration/migration.c
> @@ -2867,6 +2867,7 @@ static int open_return_path_on_source(MigrationState *ms,
>  
>      qemu_thread_create(&ms->rp_state.rp_thread, "return path",
>                         source_return_path_thread, ms, QEMU_THREAD_JOINABLE);
> +    ms->rp_state.rp_thread_created = true;
>  
>      trace_open_return_path_on_source_continue();
>  
> @@ -2891,6 +2892,7 @@ static int await_return_path_close_on_source(MigrationState *ms)
>      }
>      trace_await_return_path_close_on_source_joining();
>      qemu_thread_join(&ms->rp_state.rp_thread);
> +    ms->rp_state.rp_thread_created = false;
>      trace_await_return_path_close_on_source_close();
>      return ms->rp_state.error;
>  }
> @@ -3170,7 +3172,7 @@ static void migration_completion(MigrationState *s)
>       * it will wait for the destination to send it's status in
>       * a SHUT command).
>       */
> -    if (s->rp_state.from_dst_file) {
> +    if (s->rp_state.rp_thread_created) {
>          int rp_error;
>          trace_migration_return_path_end_before();
>          rp_error = await_return_path_close_on_source(s);
> diff --git a/migration/migration.h b/migration/migration.h
> index 2ebb740dfa..c302879fad 100644
> --- a/migration/migration.h
> +++ b/migration/migration.h
> @@ -195,6 +195,13 @@ struct MigrationState {
>          QEMUFile     *from_dst_file;
>          QemuThread    rp_thread;
>          bool          error;
> +        /*
> +         * We can also check non-zero of rp_thread, but there's no "official"
> +         * way to do this, so this bool makes it slightly more elegant.
> +         * Checking from_dst_file for this is racy because from_dst_file will
> +         * be cleared in the rp_thread!
> +         */
> +        bool          rp_thread_created;
>          QemuSemaphore rp_sem;
>      } rp_state;
>  
> -- 
> 2.31.1
> 
-- 
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK


