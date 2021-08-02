Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 79F223DDEC5
	for <lists+qemu-devel@lfdr.de>; Mon,  2 Aug 2021 19:54:29 +0200 (CEST)
Received: from localhost ([::1]:59406 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mAc8y-0001tV-3S
	for lists+qemu-devel@lfdr.de; Mon, 02 Aug 2021 13:54:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42460)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1mAc81-0001Dd-Pf
 for qemu-devel@nongnu.org; Mon, 02 Aug 2021 13:53:29 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:42156)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1mAc7y-0008Ty-TR
 for qemu-devel@nongnu.org; Mon, 02 Aug 2021 13:53:28 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1627926805;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=AZdiJXOmp0m0YidxiT76JcHCaIPWdR/du3TPqT4BQ3Y=;
 b=a2DgFYnUsojMTGODa14B64e/G06TDlp2nVDx7GdpvOHrDtRsgNeSjHfKKqSwgOZ62tfSvh
 QaujdkWB5TGEFszZfqM+kv4t+iYPJML3XzsVFvwyF5CNe0pqz+13pJsqZGGo+/GxI967vI
 N3RWnk6ydPJZ2BltZCoQWG/vLA4dAkg=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-186-4c3tSuhrPBqiDIcVwuTfSg-1; Mon, 02 Aug 2021 13:53:24 -0400
X-MC-Unique: 4c3tSuhrPBqiDIcVwuTfSg-1
Received: by mail-wr1-f72.google.com with SMTP id
 q13-20020a05600000cdb02901545f1bdac1so2989313wrx.4
 for <qemu-devel@nongnu.org>; Mon, 02 Aug 2021 10:53:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=AZdiJXOmp0m0YidxiT76JcHCaIPWdR/du3TPqT4BQ3Y=;
 b=D4sx0mzMybM2CyaUzqGFcHFrpaeWHb4of/b7AC8HDclYHLsgOhPWInBgkLO19N9J2S
 VumldI50WVbhyC00x1lXGIlyrL0z19NMv+LBts6lAMMLze3uZGVnRCgDp6k/ydhTa6hC
 ydI2ayG8QZrjiFRJW7pFG6BslAYzGDyaumbL0/kh3lU+36jq5W4OBZuPKvy4iiZWbNxC
 Xywv4wp1QJAWczKmZwwuQT6WrQb6B6t370FiI27p+Pg69qvuqoyxN3dsSyK11pvd0Dv5
 jBxfQDS43jg51/mdo6mE0wMhSjEAxqxjnzv+j0Vm9j5oy3rzQPl1jzRmItaQTNWHMdI/
 mliA==
X-Gm-Message-State: AOAM533bqcZDlHQw2zHlKkWMMaOAF/i0S5d2J6bw+cpNyBM5aMXoQe7I
 jykTNsOfwrTu4wT+nyOL+TCz0I/nRe/aRKWw4NAqjSbT9tMbIrj2Un4KHXsGX8GAPdSDdsR6Vhe
 KWIORceAFdWu5vkI=
X-Received: by 2002:a1c:4b04:: with SMTP id y4mr18153749wma.133.1627926802809; 
 Mon, 02 Aug 2021 10:53:22 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxDdYuFILGSo5gVSkJPHQDfv6bC5UCfWEQYL2+wIM9Vf89F/ciKKBD8OsGN0qvBM3iKMjzuAA==
X-Received: by 2002:a1c:4b04:: with SMTP id y4mr18153732wma.133.1627926802608; 
 Mon, 02 Aug 2021 10:53:22 -0700 (PDT)
Received: from work-vm (cpc109021-salf6-2-0-cust453.10-2.cable.virginm.net.
 [82.29.237.198])
 by smtp.gmail.com with ESMTPSA id u11sm12312136wrt.89.2021.08.02.10.53.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 02 Aug 2021 10:53:21 -0700 (PDT)
Date: Mon, 2 Aug 2021 18:53:20 +0100
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: Markus Armbruster <armbru@redhat.com>
Subject: Re: [PATCH 10/16] migration: Handle migration_incoming_setup()
 errors consistently
Message-ID: <YQgxEGzjyc17PPqX@work-vm>
References: <20210720125408.387910-1-armbru@redhat.com>
 <20210720125408.387910-11-armbru@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210720125408.387910-11-armbru@redhat.com>
User-Agent: Mutt/2.0.7 (2021-05-04)
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dgilbert@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=dgilbert@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.701,
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

* Markus Armbruster (armbru@redhat.com) wrote:
> Commit b673eab4e2 "multifd: Make multifd_load_setup() get an Error
> parameter" changed migration_incoming_setup() to take an Error **
> argument, and adjusted the callers accordingly.  It neglected to
> change adjust multifd_load_setup(): it still exit()s on error.  Clean
> that up.
> 
> The error now gets propagated up two call chains: via
> migration_fd_process_incoming() to rdma_accept_incoming_migration(),
> and via migration_ioc_process_incoming() to
> migration_channel_process_incoming().  Both chain ends report the
> error with error_report_err(), but otherwise ignore it.  Behavioral
> change: we no longer exit() on this error.
> 
> This is consistent with how we handle other errors here, e.g. from
> multifd_recv_new_channel() via migration_ioc_process_incoming() to
> migration_channel_process_incoming().  Wether it's consistently right
> or consistently wrong I can't tell.
> 
> Also clean up the return value from the unusual 0 on success, 1 on
> error to the more common true on success, false on error.
> 
> Cc: Juan Quintela <quintela@redhat.com>
> Cc: Dr. David Alan Gilbert <dgilbert@redhat.com>
> Signed-off-by: Markus Armbruster <armbru@redhat.com>
> ---
>  migration/migration.c | 27 +++++++++------------------
>  1 file changed, 9 insertions(+), 18 deletions(-)
> 
> diff --git a/migration/migration.c b/migration/migration.c
> index 231dc24414..c1c0a48647 100644
> --- a/migration/migration.c
> +++ b/migration/migration.c
> @@ -609,30 +609,25 @@ fail:
>  }
>  
>  /**
> - * @migration_incoming_setup: Setup incoming migration
> - *
> - * Returns 0 for no error or 1 for error
> - *
> + * migration_incoming_setup: Setup incoming migration
>   * @f: file for main migration channel
>   * @errp: where to put errors
> + *
> + * Returns: %true on success, %false on error.
>   */
> -static int migration_incoming_setup(QEMUFile *f, Error **errp)
> +static bool migration_incoming_setup(QEMUFile *f, Error **errp)
>  {
>      MigrationIncomingState *mis = migration_incoming_get_current();
> -    Error *local_err = NULL;
>  
> -    if (multifd_load_setup(&local_err) != 0) {
> -        /* We haven't been able to create multifd threads
> -           nothing better to do */
> -        error_report_err(local_err);
> -        exit(EXIT_FAILURE);
> +    if (multifd_load_setup(errp) != 0) {
> +        return false;
>      }

What I don't know is how well that will survive; for example in
multifd_load_setup it creates multiple threads and calls the recv_setup
member on each thread; now if one of those fails what happens - if we
don't exit, is it cleaned up enough so you can try another
migrate_incoming or is it just going to fall over?

Dave

>  
>      if (!mis->from_src_file) {
>          mis->from_src_file = f;
>      }
>      qemu_file_set_blocking(f, false);
> -    return 0;
> +    return true;
>  }
>  
>  void migration_incoming_process(void)
> @@ -675,14 +670,11 @@ static bool postcopy_try_recover(QEMUFile *f)
>  
>  void migration_fd_process_incoming(QEMUFile *f, Error **errp)
>  {
> -    Error *local_err = NULL;
> -
>      if (postcopy_try_recover(f)) {
>          return;
>      }
>  
> -    if (migration_incoming_setup(f, &local_err)) {
> -        error_propagate(errp, local_err);
> +    if (!migration_incoming_setup(f, errp)) {
>          return;
>      }
>      migration_incoming_process();
> @@ -703,8 +695,7 @@ void migration_ioc_process_incoming(QIOChannel *ioc, Error **errp)
>              return;
>          }
>  
> -        if (migration_incoming_setup(f, &local_err)) {
> -            error_propagate(errp, local_err);
> +        if (!migration_incoming_setup(f, errp)) {
>              return;
>          }
>  
> -- 
> 2.31.1
> 
-- 
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK


