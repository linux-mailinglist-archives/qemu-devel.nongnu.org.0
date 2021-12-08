Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 027B146DC70
	for <lists+qemu-devel@lfdr.de>; Wed,  8 Dec 2021 20:48:24 +0100 (CET)
Received: from localhost ([::1]:34388 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mv2vO-0004Sy-Aj
	for lists+qemu-devel@lfdr.de; Wed, 08 Dec 2021 14:48:22 -0500
Received: from eggs.gnu.org ([209.51.188.92]:42190)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1mv2ta-0002TF-FT
 for qemu-devel@nongnu.org; Wed, 08 Dec 2021 14:46:30 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:43264)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1mv2tX-00013b-EM
 for qemu-devel@nongnu.org; Wed, 08 Dec 2021 14:46:29 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1638992786;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=ElPoN/64YgzNdw9va+OWXDZBK8x747z/aRsK3OPlnyc=;
 b=GLEaM5mGL/SzPGQ4Yyrl/SSngS6v3uecl8yTw9MwsjS4sYbroE8bnsxvlWR0mG6Y+y5W+r
 RJDWurYMZ4atVYK3T6Alt0aspKdXHcbWQ1JnIEDxehq1qt4w+jTXCPOnDl6MZxF5Ffsnh8
 Nt9OQ53NtwUlxzS+p3sm1ti4rEGhpeg=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-156-BRXB-TtrNeu24KuINkMIkQ-1; Wed, 08 Dec 2021 14:46:24 -0500
X-MC-Unique: BRXB-TtrNeu24KuINkMIkQ-1
Received: by mail-wm1-f69.google.com with SMTP id
 a85-20020a1c7f58000000b0033ddc0eacc8so3517023wmd.9
 for <qemu-devel@nongnu.org>; Wed, 08 Dec 2021 11:46:24 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=ElPoN/64YgzNdw9va+OWXDZBK8x747z/aRsK3OPlnyc=;
 b=iLALe6xhyrG3WytvtFw8XN+Lqom61U3sxPgKoXMCmWeHleJI/0U+j+WoJJWSu76xdY
 jT9JNmbzuuHyxpHq13zrFX/0KBrXxXDoWh6kJI/Eac3zFnO/o0kcMLmXJDOia6HlmcxQ
 8ChJWmXnBdKJIDBPmXQDBQm8YX6bvBCLmV+gTIKeYPaFbAfbMg55NA+5/wiNSgPwpAbm
 jDY7RCXTvZbIk9P8pi1J/+KEgSi7tWkkrJyh1hee1pu581BYzR7Fho0jUJe+rI6m0Oqg
 7Zx9OMVKLS4rflvthnFeoltGv8PuLTSDBc3w/LAp17VbUS/2uRrPSXmGiQBKqp51CDr6
 mzug==
X-Gm-Message-State: AOAM533PGfdTFluaPFK1BoWmqFbiQ4beMQUzTefiR+HVY4zwDedG3dI5
 1axqYPW65YS1Bqdh2XEThHOY/VwQEmEUjG72SxGw5Z/2S+xGAx8tAjdiAy2Rru6X/uSa++E+UUB
 PePIQhbv+GJcHEuw=
X-Received: by 2002:a05:600c:3658:: with SMTP id
 y24mr830501wmq.161.1638992783431; 
 Wed, 08 Dec 2021 11:46:23 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyTHXyao/07QhMmj+zh/VMHgcVMQ6UHhgPaLOX3GB+rzNy/XUXV/hMDG2HwWVCSdzZm0WZB9w==
X-Received: by 2002:a05:600c:3658:: with SMTP id
 y24mr830477wmq.161.1638992783192; 
 Wed, 08 Dec 2021 11:46:23 -0800 (PST)
Received: from work-vm (cpc109025-salf6-2-0-cust480.10-2.cable.virginm.net.
 [82.30.61.225])
 by smtp.gmail.com with ESMTPSA id n2sm6823674wmi.36.2021.12.08.11.46.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 08 Dec 2021 11:46:22 -0800 (PST)
Date: Wed, 8 Dec 2021 19:46:20 +0000
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: Peter Xu <peterx@redhat.com>
Subject: Re: [PATCH 7/7] migration: Finer grained tracepoints for
 POSTCOPY_LISTEN
Message-ID: <YbELjB041z8jSBUE@work-vm>
References: <20211207115016.73195-1-peterx@redhat.com>
 <20211207115016.73195-8-peterx@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20211207115016.73195-8-peterx@redhat.com>
User-Agent: Mutt/2.1.3 (2021-09-10)
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dgilbert@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=dgilbert@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -33
X-Spam_score: -3.4
X-Spam_bar: ---
X-Spam_report: (-3.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.619,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Juan Quintela <quintela@redhat.com>, qemu-devel@nongnu.org,
 Leonardo Bras Soares Passos <lsoaresp@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

* Peter Xu (peterx@redhat.com) wrote:
> The enablement of postcopy listening has a few steps, add a few tracepoints to
> be there ready for some basic measurements for them.
> 
> Signed-off-by: Peter Xu <peterx@redhat.com>
> ---
>  migration/savevm.c     | 5 ++++-
>  migration/trace-events | 2 +-
>  2 files changed, 5 insertions(+), 2 deletions(-)
> 
> diff --git a/migration/savevm.c b/migration/savevm.c
> index 17b8e25e00..5b3f31eab2 100644
> --- a/migration/savevm.c
> +++ b/migration/savevm.c
> @@ -1946,7 +1946,7 @@ static void *postcopy_ram_listen_thread(void *opaque)
>  static int loadvm_postcopy_handle_listen(MigrationIncomingState *mis)
>  {
>      PostcopyState ps = postcopy_state_set(POSTCOPY_INCOMING_LISTENING);
> -    trace_loadvm_postcopy_handle_listen();
> +    trace_loadvm_postcopy_handle_listen(1);

I think we tend just to split this into separate traces in many places;
or if we're using the same one then we should use a string

I'd make this:
  trace_loadvm_postcopy_handle_listen_entry();

for example.

>      Error *local_err = NULL;
>  
>      if (ps != POSTCOPY_INCOMING_ADVISE && ps != POSTCOPY_INCOMING_DISCARD) {
> @@ -1962,6 +1962,7 @@ static int loadvm_postcopy_handle_listen(MigrationIncomingState *mis)
>              postcopy_ram_prepare_discard(mis);
>          }
>      }
> +    trace_loadvm_postcopy_handle_listen(2);
>  
>      /*
>       * Sensitise RAM - can now generate requests for blocks that don't exist
> @@ -1974,6 +1975,7 @@ static int loadvm_postcopy_handle_listen(MigrationIncomingState *mis)
>              return -1;
>          }
>      }
> +    trace_loadvm_postcopy_handle_listen(3);
>  
>      if (postcopy_notify(POSTCOPY_NOTIFY_INBOUND_LISTEN, &local_err)) {
>          error_report_err(local_err);
> @@ -1988,6 +1990,7 @@ static int loadvm_postcopy_handle_listen(MigrationIncomingState *mis)
>                         QEMU_THREAD_DETACHED);
>      qemu_sem_wait(&mis->listen_thread_sem);
>      qemu_sem_destroy(&mis->listen_thread_sem);
> +    trace_loadvm_postcopy_handle_listen(4);

  trace_loadvm_postcopy_handle_listen_entry_end();
>  
>      return 0;
>  }
> diff --git a/migration/trace-events b/migration/trace-events
> index d63a5915f5..1aa6937dc1 100644
> --- a/migration/trace-events
> +++ b/migration/trace-events
> @@ -14,7 +14,7 @@ loadvm_handle_cmd_packaged_main(int ret) "%d"
>  loadvm_handle_cmd_packaged_received(int ret) "%d"
>  loadvm_handle_recv_bitmap(char *s) "%s"
>  loadvm_postcopy_handle_advise(void) ""
> -loadvm_postcopy_handle_listen(void) ""
> +loadvm_postcopy_handle_listen(int i) "%d"
>  loadvm_postcopy_handle_run(void) ""
>  loadvm_postcopy_handle_run_cpu_sync(void) ""
>  loadvm_postcopy_handle_run_vmstart(void) ""
> -- 
> 2.32.0
> 
-- 
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK


