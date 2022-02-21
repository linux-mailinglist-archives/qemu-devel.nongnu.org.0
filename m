Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EE2C54BDB13
	for <lists+qemu-devel@lfdr.de>; Mon, 21 Feb 2022 18:06:34 +0100 (CET)
Received: from localhost ([::1]:34748 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nMC8w-0004RM-2Q
	for lists+qemu-devel@lfdr.de; Mon, 21 Feb 2022 12:06:34 -0500
Received: from eggs.gnu.org ([209.51.188.92]:42788)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1nMBz2-0004A2-36
 for qemu-devel@nongnu.org; Mon, 21 Feb 2022 11:56:20 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:41771)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1nMByy-0003Sq-59
 for qemu-devel@nongnu.org; Mon, 21 Feb 2022 11:56:18 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1645462575;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=slQgboJnO3nbTKvRdAfr6iZC+oT3S+X9f9Y/XAxgMVg=;
 b=LwjHTPeg1jQmMbdLWUnFuZB5dKZr3V48KnCcjl+z7ikRzu6o9lamQVHn+QDbtxDkPo1FfV
 9h3j59jIbrJZq5OBIl7XCRfhS8DxDHyQ8j8MuphWnuwasiEQBvMbrga45xq8xWNcYNVUae
 h2TDjYqQUImcOxbU1EngGvg32+CfaIk=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-628-9dchQdhCNxSkEoV-iYAS1Q-1; Mon, 21 Feb 2022 11:56:14 -0500
X-MC-Unique: 9dchQdhCNxSkEoV-iYAS1Q-1
Received: by mail-wr1-f69.google.com with SMTP id
 p9-20020adf9589000000b001e333885ac1so7643592wrp.10
 for <qemu-devel@nongnu.org>; Mon, 21 Feb 2022 08:56:14 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=slQgboJnO3nbTKvRdAfr6iZC+oT3S+X9f9Y/XAxgMVg=;
 b=txVl9gPhCu5obPl3ZdTiMKkdVv4epaC1xlzUq7YQKGKQrV/47d6aJoPC7usKF/iy45
 RWJHJzqjewMzoAFgtI/jf0nH2QfQ372JVCq9b39TUSLtxoo3A02+CdNYfQxWqqvR8HNR
 PbZP2JjP/qnh2Mia7GtXS9oZmr/Xp/iT4ZBhPhZXRYmjbj6dNM748/jmJKAbOkdRgjZY
 R9XAbY8dWuAEJWuqAfsHRR+f0BZ1jqo3BedRoc1OPJVrloyQADGUG9zY4trnb+qOMo8M
 m9pJ0uwmZSIAlf+YRayYmFmU8vQlldfCeiUYzIS9Flrpjo1MHGauAPOvorSUB/hK4ndH
 aHQg==
X-Gm-Message-State: AOAM531SnWozmgxYxQ8yzjUKGG7VzZcjt5dcb+ktVRBRFKZfqamjU4JN
 miVwj5taTR8WGy3BTrKEpTPANR0Q0L3zeIdpJf+9aFZczZ+sIm5pVmQbKx6eDpI8xgMTq+1tUiv
 16J1z136QiJ5IQFc=
X-Received: by 2002:a5d:46d2:0:b0:1e4:b261:7e49 with SMTP id
 g18-20020a5d46d2000000b001e4b2617e49mr16485022wrs.669.1645462573220; 
 Mon, 21 Feb 2022 08:56:13 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxmyhJFhmfDqlaYBmvTm/ODRye/u2ZDi9zX5CwMZLYGwC/K9L8ICBAVg56xLsjaNNg27hGNMA==
X-Received: by 2002:a5d:46d2:0:b0:1e4:b261:7e49 with SMTP id
 g18-20020a5d46d2000000b001e4b2617e49mr16485005wrs.669.1645462572975; 
 Mon, 21 Feb 2022 08:56:12 -0800 (PST)
Received: from work-vm (cpc109025-salf6-2-0-cust480.10-2.cable.virginm.net.
 [82.30.61.225])
 by smtp.gmail.com with ESMTPSA id z7sm7979364wml.40.2022.02.21.08.56.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 21 Feb 2022 08:56:12 -0800 (PST)
Date: Mon, 21 Feb 2022 16:56:10 +0000
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: Peter Xu <peterx@redhat.com>
Subject: Re: [PATCH 14/20] migration: Add
 migration_incoming_transport_cleanup()
Message-ID: <YhPEKvNc1ITGEU1I@work-vm>
References: <20220216062809.57179-1-peterx@redhat.com>
 <20220216062809.57179-15-peterx@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20220216062809.57179-15-peterx@redhat.com>
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
> Add a helper to cleanup the transport listener.
> 
> When do it, we should also null-ify the cleanup hook and the data, then it's
> even safe to call it multiple times.
> 
> Move the socket_address_list cleanup altogether, because that's a mirror of the
> listener channels and only for the purpose of query-migrate.  Hence when
> someone wants to cleanup the listener transport, it should also want to cleanup
> the socket list too, always.
> 
> No functional change intended.
> 
> Signed-off-by: Peter Xu <peterx@redhat.com>

Reviewed-by: Dr. David Alan Gilbert <dgilbert@redhat.com>

> ---
>  migration/migration.c | 22 ++++++++++++++--------
>  migration/migration.h |  1 +
>  2 files changed, 15 insertions(+), 8 deletions(-)
> 
> diff --git a/migration/migration.c b/migration/migration.c
> index b2e6446457..6bb321cdd3 100644
> --- a/migration/migration.c
> +++ b/migration/migration.c
> @@ -279,6 +279,19 @@ MigrationIncomingState *migration_incoming_get_current(void)
>      return current_incoming;
>  }
>  
> +void migration_incoming_transport_cleanup(MigrationIncomingState *mis)
> +{
> +    if (mis->socket_address_list) {
> +        qapi_free_SocketAddressList(mis->socket_address_list);
> +        mis->socket_address_list = NULL;
> +    }
> +
> +    if (mis->transport_cleanup) {
> +        mis->transport_cleanup(mis->transport_data);
> +        mis->transport_data = mis->transport_cleanup = NULL;
> +    }
> +}
> +
>  void migration_incoming_state_destroy(void)
>  {
>      struct MigrationIncomingState *mis = migration_incoming_get_current();
> @@ -299,10 +312,8 @@ void migration_incoming_state_destroy(void)
>          g_array_free(mis->postcopy_remote_fds, TRUE);
>          mis->postcopy_remote_fds = NULL;
>      }
> -    if (mis->transport_cleanup) {
> -        mis->transport_cleanup(mis->transport_data);
> -    }
>  
> +    migration_incoming_transport_cleanup(mis);
>      qemu_event_reset(&mis->main_thread_load_event);
>  
>      if (mis->page_requested) {
> @@ -310,11 +321,6 @@ void migration_incoming_state_destroy(void)
>          mis->page_requested = NULL;
>      }
>  
> -    if (mis->socket_address_list) {
> -        qapi_free_SocketAddressList(mis->socket_address_list);
> -        mis->socket_address_list = NULL;
> -    }
> -
>      yank_unregister_instance(MIGRATION_YANK_INSTANCE);
>  }
>  
> diff --git a/migration/migration.h b/migration/migration.h
> index d677a750c9..f17ccc657c 100644
> --- a/migration/migration.h
> +++ b/migration/migration.h
> @@ -166,6 +166,7 @@ struct MigrationIncomingState {
>  
>  MigrationIncomingState *migration_incoming_get_current(void);
>  void migration_incoming_state_destroy(void);
> +void migration_incoming_transport_cleanup(MigrationIncomingState *mis);
>  /*
>   * Functions to work with blocktime context
>   */
> -- 
> 2.32.0
> 
-- 
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK


