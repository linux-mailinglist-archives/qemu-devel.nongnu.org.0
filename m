Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 34B524B8CD3
	for <lists+qemu-devel@lfdr.de>; Wed, 16 Feb 2022 16:47:58 +0100 (CET)
Received: from localhost ([::1]:41352 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nKMX7-0002kU-Bd
	for lists+qemu-devel@lfdr.de; Wed, 16 Feb 2022 10:47:57 -0500
Received: from eggs.gnu.org ([209.51.188.92]:48322)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1nKMSn-00080Q-I8
 for qemu-devel@nongnu.org; Wed, 16 Feb 2022 10:43:29 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:41419)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1nKMSk-0001GD-Mv
 for qemu-devel@nongnu.org; Wed, 16 Feb 2022 10:43:28 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1645026204;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=A2h83PET5lPperJXvOsXuzwmL1tne5oKkk/SOMqRrho=;
 b=XkT1aCVvdBRpZu3gCC4wFcNDT4gcEyBLTLbzp0KaiBdXEv1Pvfglud0yGj7nxa+FRhXuOw
 2aWzBjjEmx/DijlqSdlt+uyzyNja1ohR+Z4wl8huL8Wz2Lj4qDc6z5r45z0Tf5s3Gmc7UJ
 Owy+lSV0bC3Y5+VjSsSjfgG549ffbQI=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-642-oaeiErgsP4asBx6S_1pS6g-1; Wed, 16 Feb 2022 10:43:22 -0500
X-MC-Unique: oaeiErgsP4asBx6S_1pS6g-1
Received: by mail-wr1-f71.google.com with SMTP id
 j8-20020adfc688000000b001e3322ced69so1222945wrg.13
 for <qemu-devel@nongnu.org>; Wed, 16 Feb 2022 07:43:22 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=A2h83PET5lPperJXvOsXuzwmL1tne5oKkk/SOMqRrho=;
 b=GVRYvns++vzYDekvCssLMhXqmawZNR4wXPpoD4SpvyEujM+HEI0aXc/yQqBjpW9O1D
 kfGVOZku69YnxnHL0APc1qXSfgG8Dj4pTB7lFwF9Cb99O74tnx76REsi2n/mwm4cmo0P
 VPtc/UakjFANs6Fn5JC3jKi5zywNh/ktJok74jKxccGrTj4gv06Wv6X+21zTEXa805LE
 w7/ojmqYiKLi9UaXFZl16Jg9r7Gh8bg54rmkMg7yRA3Mn/eNnSo8SS/PVDmNPk2LGQCv
 rhNq3HFIEhbBydXJqvc6Ud/bEpOIsn/dyUq93m5T1VnruzaV2Y6vvfRsWUMcUXKvnj//
 NeGA==
X-Gm-Message-State: AOAM530EhrKQsVV9Hr2KfIccbsuxG0AVHfARNkeuCI1BAkZOp4eNoXWq
 5NGRO4MhFOFM/REz8qJSjBKMvKnGlslUbm68slxH0Zy8db75inKRJDl71jmnAjpqokUKJUgtWbq
 fGgmbM1rzhE3ilQk=
X-Received: by 2002:adf:e549:0:b0:1e3:42a:1cfd with SMTP id
 z9-20020adfe549000000b001e3042a1cfdmr2721868wrm.79.1645026201555; 
 Wed, 16 Feb 2022 07:43:21 -0800 (PST)
X-Google-Smtp-Source: ABdhPJylYC5+huN5hlM7xOAGcBKziETaUUevLHUcba/VrJmlxiHUN7QtsUkD2R3Q3hjdYnkiFz/+Aw==
X-Received: by 2002:adf:e549:0:b0:1e3:42a:1cfd with SMTP id
 z9-20020adfe549000000b001e3042a1cfdmr2721855wrm.79.1645026201359; 
 Wed, 16 Feb 2022 07:43:21 -0800 (PST)
Received: from work-vm (cpc109025-salf6-2-0-cust480.10-2.cable.virginm.net.
 [82.30.61.225])
 by smtp.gmail.com with ESMTPSA id bg23sm24493098wmb.5.2022.02.16.07.43.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 16 Feb 2022 07:43:20 -0800 (PST)
Date: Wed, 16 Feb 2022 15:43:19 +0000
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: Peter Xu <peterx@redhat.com>
Subject: Re: [PATCH 02/20] migration: Finer grained tracepoints for
 POSTCOPY_LISTEN
Message-ID: <Yg0bl/tXUrJZdxY1@work-vm>
References: <20220216062809.57179-1-peterx@redhat.com>
 <20220216062809.57179-3-peterx@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20220216062809.57179-3-peterx@redhat.com>
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
> The enablement of postcopy listening has a few steps, add a few tracepoints to
> be there ready for some basic measurements for them.
> 
> Signed-off-by: Peter Xu <peterx@redhat.com>

Reviewed-by: Dr. David Alan Gilbert <dgilbert@redhat.com>

> ---
>  migration/savevm.c     | 9 ++++++++-
>  migration/trace-events | 2 +-
>  2 files changed, 9 insertions(+), 2 deletions(-)
> 
> diff --git a/migration/savevm.c b/migration/savevm.c
> index 7bb65e1d61..190cc5fc42 100644
> --- a/migration/savevm.c
> +++ b/migration/savevm.c
> @@ -1948,9 +1948,10 @@ static void *postcopy_ram_listen_thread(void *opaque)
>  static int loadvm_postcopy_handle_listen(MigrationIncomingState *mis)
>  {
>      PostcopyState ps = postcopy_state_set(POSTCOPY_INCOMING_LISTENING);
> -    trace_loadvm_postcopy_handle_listen();
>      Error *local_err = NULL;
>  
> +    trace_loadvm_postcopy_handle_listen("enter");
> +
>      if (ps != POSTCOPY_INCOMING_ADVISE && ps != POSTCOPY_INCOMING_DISCARD) {
>          error_report("CMD_POSTCOPY_LISTEN in wrong postcopy state (%d)", ps);
>          return -1;
> @@ -1965,6 +1966,8 @@ static int loadvm_postcopy_handle_listen(MigrationIncomingState *mis)
>          }
>      }
>  
> +    trace_loadvm_postcopy_handle_listen("after discard");
> +
>      /*
>       * Sensitise RAM - can now generate requests for blocks that don't exist
>       * However, at this point the CPU shouldn't be running, and the IO
> @@ -1977,6 +1980,8 @@ static int loadvm_postcopy_handle_listen(MigrationIncomingState *mis)
>          }
>      }
>  
> +    trace_loadvm_postcopy_handle_listen("after uffd");
> +
>      if (postcopy_notify(POSTCOPY_NOTIFY_INBOUND_LISTEN, &local_err)) {
>          error_report_err(local_err);
>          return -1;
> @@ -1991,6 +1996,8 @@ static int loadvm_postcopy_handle_listen(MigrationIncomingState *mis)
>      qemu_sem_wait(&mis->listen_thread_sem);
>      qemu_sem_destroy(&mis->listen_thread_sem);
>  
> +    trace_loadvm_postcopy_handle_listen("return");
> +
>      return 0;
>  }
>  
> diff --git a/migration/trace-events b/migration/trace-events
> index 123cfe79d7..92596c00d8 100644
> --- a/migration/trace-events
> +++ b/migration/trace-events
> @@ -14,7 +14,7 @@ loadvm_handle_cmd_packaged_main(int ret) "%d"
>  loadvm_handle_cmd_packaged_received(int ret) "%d"
>  loadvm_handle_recv_bitmap(char *s) "%s"
>  loadvm_postcopy_handle_advise(void) ""
> -loadvm_postcopy_handle_listen(void) ""
> +loadvm_postcopy_handle_listen(const char *str) "%s"
>  loadvm_postcopy_handle_run(void) ""
>  loadvm_postcopy_handle_run_cpu_sync(void) ""
>  loadvm_postcopy_handle_run_vmstart(void) ""
> -- 
> 2.32.0
> 
-- 
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK


