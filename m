Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B2F752C3F89
	for <lists+qemu-devel@lfdr.de>; Wed, 25 Nov 2020 13:06:24 +0100 (CET)
Received: from localhost ([::1]:48406 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1khtZ1-0007fl-Qo
	for lists+qemu-devel@lfdr.de; Wed, 25 Nov 2020 07:06:23 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:43972)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1khtY9-0006tp-9a
 for qemu-devel@nongnu.org; Wed, 25 Nov 2020 07:05:29 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:36322)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1khtY7-0004vj-Lr
 for qemu-devel@nongnu.org; Wed, 25 Nov 2020 07:05:29 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1606305925;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=n2/GLPnwiQtIndr7jzoHP2MgvlKqdmTy4VUPzJn1STs=;
 b=P88g9xjEe1kC2g/x4MQ1Axz76pcfdG/B4YI8A23SdJt1yWcuxVmPLfKqcCFENxoYNWmbLx
 78AO2AFssgsjxGcIn5mccRHpACMr9mvvhFwlazDpUZ83ql68VeFvr2H/w4uB9OJ96y/apP
 ylzih+CIi3F15Qfnz2eWRmOxavO7asU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-489-72nvvumAN1mTUu7vvZqtUQ-1; Wed, 25 Nov 2020 07:05:23 -0500
X-MC-Unique: 72nvvumAN1mTUu7vvZqtUQ-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 7CBFD1005D52
 for <qemu-devel@nongnu.org>; Wed, 25 Nov 2020 12:05:22 +0000 (UTC)
Received: from work-vm (ovpn-115-12.ams2.redhat.com [10.36.115.12])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id E67831001281;
 Wed, 25 Nov 2020 12:05:17 +0000 (UTC)
Date: Wed, 25 Nov 2020 12:05:15 +0000
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: Juan Quintela <quintela@redhat.com>
Subject: Re: [PATCH v2 01/27] migration: Network Failover can't work with a
 paused guest
Message-ID: <20201125120515.GD3222@work-vm>
References: <20201118083748.1328-1-quintela@redhat.com>
 <20201118083748.1328-2-quintela@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20201118083748.1328-2-quintela@redhat.com>
User-Agent: Mutt/1.14.6 (2020-07-11)
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dgilbert@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=dgilbert@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Daniel =?iso-8859-1?Q?P=2E_Berrang=E9?= <berrange@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Jason Wang <jasowang@redhat.com>, qemu-devel@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

* Juan Quintela (quintela@redhat.com) wrote:
> If we have a paused guest, it can't unplug the network VF device, so
> we wait there forever.  Just change the code to give one error on that
> case.
> 
> Signed-off-by: Juan Quintela <quintela@redhat.com>

Reviewed-by: Dr. David Alan Gilbert <dgilbert@redhat.com>

> ---
>  migration/migration.c | 13 +++++++++++++
>  1 file changed, 13 insertions(+)
> 
> diff --git a/migration/migration.c b/migration/migration.c
> index 87a9b59f83..d44fc880f9 100644
> --- a/migration/migration.c
> +++ b/migration/migration.c
> @@ -3548,6 +3548,18 @@ static void *migration_thread(void *opaque)
>      qemu_savevm_state_setup(s->to_dst_file);
>  
>      if (qemu_savevm_state_guest_unplug_pending()) {
> +        /* if guest is paused, it can send back the wait event */
> +        if (!runstate_is_running()) {
> +            Error *local_err = NULL;
> +
> +            error_setg(&local_err, "migration: network failover and "
> +                       "guest is paused'");
> +            migrate_set_error(s, local_err);
> +            error_free(local_err);
> +            migrate_set_state(&s->state, MIGRATION_STATUS_SETUP,
> +                              MIGRATION_STATUS_FAILED);
> +            goto end;
> +        }
>          migrate_set_state(&s->state, MIGRATION_STATUS_SETUP,
>                            MIGRATION_STATUS_WAIT_UNPLUG);
>  
> @@ -3597,6 +3609,7 @@ static void *migration_thread(void *opaque)
>      }
>  
>      trace_migration_thread_after_loop();
> +end:
>      migration_iteration_finish(s);
>      object_unref(OBJECT(s));
>      rcu_unregister_thread();
> -- 
> 2.26.2
> 
-- 
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK


