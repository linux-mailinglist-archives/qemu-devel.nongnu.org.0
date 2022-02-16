Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A683E4B90DE
	for <lists+qemu-devel@lfdr.de>; Wed, 16 Feb 2022 20:02:02 +0100 (CET)
Received: from localhost ([::1]:43178 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nKPYu-0002Hj-H3
	for lists+qemu-devel@lfdr.de; Wed, 16 Feb 2022 14:02:00 -0500
Received: from eggs.gnu.org ([209.51.188.92]:46244)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1nKPXO-0001U1-Oa
 for qemu-devel@nongnu.org; Wed, 16 Feb 2022 14:00:26 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:34285)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1nKPXI-0006Lq-7r
 for qemu-devel@nongnu.org; Wed, 16 Feb 2022 14:00:25 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1645038017;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=uo/Pjv5lfu7jT8w+xAhoP5zrhWyiUhQ0ti04f+GGsuI=;
 b=YdsohgsF2jX2BLGf6d1qkCkj3x1JZIKT6sxtNfWlPo0ErtTCAlwKWV3+dJ+OtHv7suwFox
 Q7GG/RHLvms0sMxszYb5H2xfMULEBkiAA9iFy6ZigsqJh1zwr7W2H4C9lojWqUJnU7zROi
 nylfsTtyyejQKrUKB/JGkGIGTgh47g4=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-138-VmC7QJx_O-qY96-wzURf-Q-1; Wed, 16 Feb 2022 14:00:16 -0500
X-MC-Unique: VmC7QJx_O-qY96-wzURf-Q-1
Received: by mail-wm1-f72.google.com with SMTP id
 n3-20020a05600c294300b0037bc685b717so784336wmd.8
 for <qemu-devel@nongnu.org>; Wed, 16 Feb 2022 11:00:16 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=uo/Pjv5lfu7jT8w+xAhoP5zrhWyiUhQ0ti04f+GGsuI=;
 b=IPlb7B/qynOp9Pm6IadUxttmKHvW71Y+uRYb2D9rwcGM74U8pDCpmNHveS37gGjyk2
 xQztOdaT17TPdT1/3Fc1uAOrKUqoVLlzvaDkpJGzTEUqjkvbB0q2Nyur9ssFPW6FWG1U
 6es7IniAVp20vE4bl8KiOrGn1rCcIv1ToJUu+aeC/+uJhDEEJ10V3kYAkKSl3xD7F4tq
 BqPw6obQknwtZQbisL2LSi3r4Z90Zu+1r32+cQ8sT1oYrUcVRW11UXLSGqN7ojj2WCwF
 ULZWO7MFWr1ge7eIgqH+Go99/1DFrTHYpJBlVFhw+QuLqtwgp9SoKNNGyq6ogGE33leT
 BxiQ==
X-Gm-Message-State: AOAM530CqiXcjpmWWUYF5Bb9K8KS8Muze7eiW5qTB8l8vTHA25FlGeXt
 CO25MmZpqnBWu91viYwb0iJKoaDlEcO5jJKM/+1NRLZfOpqchCPuYCiVBy1rga8YLiKYU0AVTT6
 vVBUx4sa7ckmqo0Q=
X-Received: by 2002:a05:600c:354e:b0:37c:815f:8a3f with SMTP id
 i14-20020a05600c354e00b0037c815f8a3fmr2871385wmq.15.1645038015124; 
 Wed, 16 Feb 2022 11:00:15 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxZOm7BnXJUG9TDjOFfteMpJIzTYiLzYW5IOyW7KAsMpbHYsSmb9ijSkvlfAZaMFOsafwe/kg==
X-Received: by 2002:a05:600c:354e:b0:37c:815f:8a3f with SMTP id
 i14-20020a05600c354e00b0037c815f8a3fmr2871366wmq.15.1645038014925; 
 Wed, 16 Feb 2022 11:00:14 -0800 (PST)
Received: from work-vm (cpc109025-salf6-2-0-cust480.10-2.cable.virginm.net.
 [82.30.61.225])
 by smtp.gmail.com with ESMTPSA id n15sm23931102wmr.9.2022.02.16.11.00.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 16 Feb 2022 11:00:14 -0800 (PST)
Date: Wed, 16 Feb 2022 19:00:12 +0000
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: Peter Xu <peterx@redhat.com>
Subject: Re: [PATCH 03/20] migration: Tracepoint change in postcopy-run
 bottom half
Message-ID: <Yg1JvJlmqdSBQ55z@work-vm>
References: <20220216062809.57179-1-peterx@redhat.com>
 <20220216062809.57179-4-peterx@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20220216062809.57179-4-peterx@redhat.com>
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
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.083,
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
Cc: Leonardo Bras Soares Passos <lsoaresp@redhat.com>, qemu-devel@nongnu.org,
 Juan Quintela <quintela@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

* Peter Xu (peterx@redhat.com) wrote:
> Remove the old two tracepoints and they're even near each other:
> 
>     trace_loadvm_postcopy_handle_run_cpu_sync()
>     trace_loadvm_postcopy_handle_run_vmstart()
> 
> Add trace_loadvm_postcopy_handle_run_bh() with a finer granule trace.
> 
> Signed-off-by: Peter Xu <peterx@redhat.com>

Reviewed-by: Dr. David Alan Gilbert <dgilbert@redhat.com>

> ---
>  migration/savevm.c     | 12 +++++++++---
>  migration/trace-events |  3 +--
>  2 files changed, 10 insertions(+), 5 deletions(-)
> 
> diff --git a/migration/savevm.c b/migration/savevm.c
> index 190cc5fc42..41e3238798 100644
> --- a/migration/savevm.c
> +++ b/migration/savevm.c
> @@ -2006,13 +2006,19 @@ static void loadvm_postcopy_handle_run_bh(void *opaque)
>      Error *local_err = NULL;
>      MigrationIncomingState *mis = opaque;
>  
> +    trace_loadvm_postcopy_handle_run_bh("enter");
> +
>      /* TODO we should move all of this lot into postcopy_ram.c or a shared code
>       * in migration.c
>       */
>      cpu_synchronize_all_post_init();
>  
> +    trace_loadvm_postcopy_handle_run_bh("after cpu sync");
> +
>      qemu_announce_self(&mis->announce_timer, migrate_announce_params());
>  
> +    trace_loadvm_postcopy_handle_run_bh("after announce");
> +
>      /* Make sure all file formats flush their mutable metadata.
>       * If we get an error here, just don't restart the VM yet. */
>      bdrv_invalidate_cache_all(&local_err);
> @@ -2022,9 +2028,7 @@ static void loadvm_postcopy_handle_run_bh(void *opaque)
>          autostart = false;
>      }
>  
> -    trace_loadvm_postcopy_handle_run_cpu_sync();
> -
> -    trace_loadvm_postcopy_handle_run_vmstart();
> +    trace_loadvm_postcopy_handle_run_bh("after invalidate cache");
>  
>      dirty_bitmap_mig_before_vm_start();
>  
> @@ -2037,6 +2041,8 @@ static void loadvm_postcopy_handle_run_bh(void *opaque)
>      }
>  
>      qemu_bh_delete(mis->bh);
> +
> +    trace_loadvm_postcopy_handle_run_bh("return");
>  }
>  
>  /* After all discards we can start running and asking for pages */
> diff --git a/migration/trace-events b/migration/trace-events
> index 92596c00d8..1aec580e92 100644
> --- a/migration/trace-events
> +++ b/migration/trace-events
> @@ -16,8 +16,7 @@ loadvm_handle_recv_bitmap(char *s) "%s"
>  loadvm_postcopy_handle_advise(void) ""
>  loadvm_postcopy_handle_listen(const char *str) "%s"
>  loadvm_postcopy_handle_run(void) ""
> -loadvm_postcopy_handle_run_cpu_sync(void) ""
> -loadvm_postcopy_handle_run_vmstart(void) ""
> +loadvm_postcopy_handle_run_bh(const char *str) "%s"
>  loadvm_postcopy_handle_resume(void) ""
>  loadvm_postcopy_ram_handle_discard(void) ""
>  loadvm_postcopy_ram_handle_discard_end(void) ""
> -- 
> 2.32.0
> 
-- 
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK


