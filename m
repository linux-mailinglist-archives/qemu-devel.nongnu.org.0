Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 424344BF6DB
	for <lists+qemu-devel@lfdr.de>; Tue, 22 Feb 2022 12:00:50 +0100 (CET)
Received: from localhost ([::1]:33188 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nMSuV-0004t9-27
	for lists+qemu-devel@lfdr.de; Tue, 22 Feb 2022 06:00:47 -0500
Received: from eggs.gnu.org ([209.51.188.92]:60994)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1nMSrb-0003Tq-GL
 for qemu-devel@nongnu.org; Tue, 22 Feb 2022 05:57:47 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:35815)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1nMSrX-0002aD-QK
 for qemu-devel@nongnu.org; Tue, 22 Feb 2022 05:57:45 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1645527462;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=cqySoOHr8t7CyijangzICILCofPTclMbsSv4y6mnGOI=;
 b=YPtxZ3JZGeL968McTtkpXZodl81Lr9685nZ1rRqK1ez+epuRUmxRVhUKwburQPBrySyTHg
 hizLXazhK2+C+gDXlhdA5CFwxS2ePcu+H9bExsoo9BjQREkOJk4ie7VUuol+9aYH1NKdOb
 IBrCbS4O53OAvcoukr/tTO+1T+FZb8Y=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-457-mqodwhgtNbGIWQ4Bxeuo9g-1; Tue, 22 Feb 2022 05:57:38 -0500
X-MC-Unique: mqodwhgtNbGIWQ4Bxeuo9g-1
Received: by mail-wr1-f72.google.com with SMTP id
 y8-20020adfc7c8000000b001e755c08b91so8787107wrg.15
 for <qemu-devel@nongnu.org>; Tue, 22 Feb 2022 02:57:38 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=cqySoOHr8t7CyijangzICILCofPTclMbsSv4y6mnGOI=;
 b=f388w5egFriOShEfeT0N2hEFsSwZf6Ph2foL17UGD5FIgc3Mkd1DbrN728qDlvZMQN
 s+eN1exVlOCesNrL5BZyC/AYn3+aKak2KaNSm7DViX20Kn/Eyo5zLDM0WULOoZgiP/tv
 w98jZhQX3n05y0rpfkz5jLg7ec+oULjQVYkSKR5qgVDo2p/qWsJfr2fwrKtB/UKRr66v
 y/MQqPdv3Ia0jVYiBfabZCmiThkuYp2ok5ET1sp9f8t7fcZS8oQo1XyFl9yeXCUk+mq6
 jV0NgIpMphXFtmt/GOImEzpDbUqkeJcDJNVlev0b795SEiViZU+i9gCyA5C6FB1Rov8u
 Ymfw==
X-Gm-Message-State: AOAM531hmVrj0zbFfCA/HaB+Gx7rYEzsmwQ5VHkqVYK0uQGf8yCKyWgn
 2sO+g7+Z7i/JDHZArOoF6O4mDxjgYR2KGKUdoIOYZRf+9rQEBnSLrSFmHhc30Y2oCt9wKj0m4Ki
 aQ4SiO7TvP+Docn8=
X-Received: by 2002:a5d:45ca:0:b0:1ea:9bf9:ce5a with SMTP id
 b10-20020a5d45ca000000b001ea9bf9ce5amr964965wrs.620.1645527457677; 
 Tue, 22 Feb 2022 02:57:37 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzlgyeCfGFxHtFShxecUihmp93Nuy/i5J37ETD+fI4A7xClQTDEaXgBhi4b1H7vNJa7yrZsDg==
X-Received: by 2002:a5d:45ca:0:b0:1ea:9bf9:ce5a with SMTP id
 b10-20020a5d45ca000000b001ea9bf9ce5amr964938wrs.620.1645527457364; 
 Tue, 22 Feb 2022 02:57:37 -0800 (PST)
Received: from work-vm (cpc109025-salf6-2-0-cust480.10-2.cable.virginm.net.
 [82.30.61.225]) by smtp.gmail.com with ESMTPSA id
 z5-20020a05600c0a0500b0037bb8df81a2sm2544220wmp.13.2022.02.22.02.57.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 22 Feb 2022 02:57:36 -0800 (PST)
Date: Tue, 22 Feb 2022 10:57:34 +0000
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: Peter Xu <peterx@redhat.com>
Subject: Re: [PATCH 13/20] migration: Move channel setup out of
 postcopy_try_recover()
Message-ID: <YhTBnqF7Z2DLsjhY@work-vm>
References: <20220216062809.57179-1-peterx@redhat.com>
 <20220216062809.57179-14-peterx@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20220216062809.57179-14-peterx@redhat.com>
User-Agent: Mutt/2.1.5 (2021-12-30)
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dgilbert@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.129.124; envelope-from=dgilbert@redhat.com;
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
Cc: Leonardo Bras Soares Passos <lsoaresp@redhat.com>, qemu-devel@nongnu.org,
 Juan Quintela <quintela@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

* Peter Xu (peterx@redhat.com) wrote:
> We used to use postcopy_try_recover() to replace migration_incoming_setup() to
> setup incoming channels.  That's fine for the old world, but in the new world
> there can be more than one channels that need setup.  Better move the channel
> setup out of it so that postcopy_try_recover() only handles the last phase of
> switching to the recovery phase.
> 
> To do that in migration_fd_process_incoming(), move the postcopy_try_recover()
> call to be after migration_incoming_setup(), which will setup the channels.
> While in migration_ioc_process_incoming(), postpone the recover() routine right
> before we'll jump into migration_incoming_process().
> 
> A side benefit is we don't need to pass in QEMUFile* to postcopy_try_recover()
> anymore.  Remove it.
> 
> Signed-off-by: Peter Xu <peterx@redhat.com>

OK, but note one question below:

Reviewed-by: Dr. David Alan Gilbert <dgilbert@redhat.com>

> ---
>  migration/migration.c | 23 +++++++++++------------
>  1 file changed, 11 insertions(+), 12 deletions(-)
> 
> diff --git a/migration/migration.c b/migration/migration.c
> index 67520d3105..b2e6446457 100644
> --- a/migration/migration.c
> +++ b/migration/migration.c
> @@ -665,19 +665,20 @@ void migration_incoming_process(void)
>  }
>  
>  /* Returns true if recovered from a paused migration, otherwise false */
> -static bool postcopy_try_recover(QEMUFile *f)
> +static bool postcopy_try_recover(void)
>  {
>      MigrationIncomingState *mis = migration_incoming_get_current();
>  
>      if (mis->state == MIGRATION_STATUS_POSTCOPY_PAUSED) {
>          /* Resumed from a paused postcopy migration */
>  
> -        mis->from_src_file = f;
> +        /* This should be set already in migration_incoming_setup() */
> +        assert(mis->from_src_file);
>          /* Postcopy has standalone thread to do vm load */
> -        qemu_file_set_blocking(f, true);
> +        qemu_file_set_blocking(mis->from_src_file, true);

Does that set_blocking happen on the 2nd channel somewhere?

Dave

>  
>          /* Re-configure the return path */
> -        mis->to_src_file = qemu_file_get_return_path(f);
> +        mis->to_src_file = qemu_file_get_return_path(mis->from_src_file);
>  
>          migrate_set_state(&mis->state, MIGRATION_STATUS_POSTCOPY_PAUSED,
>                            MIGRATION_STATUS_POSTCOPY_RECOVER);
> @@ -698,11 +699,10 @@ static bool postcopy_try_recover(QEMUFile *f)
>  
>  void migration_fd_process_incoming(QEMUFile *f, Error **errp)
>  {
> -    if (postcopy_try_recover(f)) {
> +    if (!migration_incoming_setup(f, errp)) {
>          return;
>      }
> -
> -    if (!migration_incoming_setup(f, errp)) {
> +    if (postcopy_try_recover()) {
>          return;
>      }
>      migration_incoming_process();
> @@ -718,11 +718,6 @@ void migration_ioc_process_incoming(QIOChannel *ioc, Error **errp)
>          /* The first connection (multifd may have multiple) */
>          QEMUFile *f = qemu_fopen_channel_input(ioc);
>  
> -        /* If it's a recovery, we're done */
> -        if (postcopy_try_recover(f)) {
> -            return;
> -        }
> -
>          if (!migration_incoming_setup(f, errp)) {
>              return;
>          }
> @@ -743,6 +738,10 @@ void migration_ioc_process_incoming(QIOChannel *ioc, Error **errp)
>      }
>  
>      if (start_migration) {
> +        /* If it's a recovery, we're done */
> +        if (postcopy_try_recover()) {
> +            return;
> +        }
>          migration_incoming_process();
>      }
>  }
> -- 
> 2.32.0
> 
-- 
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK


