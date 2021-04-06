Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 69AEE3553D3
	for <lists+qemu-devel@lfdr.de>; Tue,  6 Apr 2021 14:27:31 +0200 (CEST)
Received: from localhost ([::1]:55348 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lTknm-0003uM-Ua
	for lists+qemu-devel@lfdr.de; Tue, 06 Apr 2021 08:27:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36074)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1lTkiI-0000h2-Ti
 for qemu-devel@nongnu.org; Tue, 06 Apr 2021 08:21:48 -0400
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:50598)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1lTki7-0002yP-Ag
 for qemu-devel@nongnu.org; Tue, 06 Apr 2021 08:21:46 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1617711694;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Vh6fzEi75byZaHmHiSOJ190r1LoORedowZ21pud5NCc=;
 b=Jn1/CoVOze0RlS1+DY9AiAdtzwxaKoDHBizAMj0Sef7nkeLFeonyq5bMXP3XBdm2BwUVW5
 yHXy1PPSwhhiXv75+soUFF6BDsaKIn1Nbc3UCVPZsRPAHgPjgtryLISzU6NkCWr075WWK4
 utG7N1HvYHJxTJD85YdI4bQDFVwFDAY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-574-k8tG-4ABNrKkfSDTcdrRNw-1; Tue, 06 Apr 2021 08:21:31 -0400
X-MC-Unique: k8tG-4ABNrKkfSDTcdrRNw-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A97411927801;
 Tue,  6 Apr 2021 12:21:30 +0000 (UTC)
Received: from work-vm (ovpn-114-244.ams2.redhat.com [10.36.114.244])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id A8C1A19C45;
 Tue,  6 Apr 2021 12:21:21 +0000 (UTC)
Date: Tue, 6 Apr 2021 13:21:18 +0100
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: Andrey Gruzdev <andrey.gruzdev@virtuozzo.com>
Subject: Re: [PATCH for-6.0 v1 1/4] migration: Fix missing qemu_fflush() on
 buffer file in bg_migration_thread
Message-ID: <YGxSPrtE9xR4Ve5K@work-vm>
References: <20210401092226.102804-1-andrey.gruzdev@virtuozzo.com>
 <20210401092226.102804-2-andrey.gruzdev@virtuozzo.com>
MIME-Version: 1.0
In-Reply-To: <20210401092226.102804-2-andrey.gruzdev@virtuozzo.com>
User-Agent: Mutt/2.0.6 (2021-03-06)
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dgilbert@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=63.128.21.124; envelope-from=dgilbert@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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
Cc: Juan Quintela <quintela@redhat.com>, David Hildenbrand <david@redhat.com>,
 qemu-devel@nongnu.org, Peter Xu <peterx@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Den Lunev <den@openvz.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

* Andrey Gruzdev (andrey.gruzdev@virtuozzo.com) wrote:
> Added missing qemu_fflush() on buffer file holding precopy device state.
> Increased initial QIOChannelBuffer allocation to 512KB to avoid reallocs.
> Typical configurations often require >200KB for device state and VMDESC.
> 
> Fixes: 8518278a6af589ccc401f06e35f171b1e6fae800 (migration: implementation
>   of background snapshot thread)
> Signed-off-by: Andrey Gruzdev <andrey.gruzdev@virtuozzo.com>

Reviewed-by: Dr. David Alan Gilbert <dgilbert@redhat.com>

> ---
>  migration/migration.c | 8 +++++++-
>  1 file changed, 7 insertions(+), 1 deletion(-)
> 
> diff --git a/migration/migration.c b/migration/migration.c
> index ca8b97baa5..00e13f9d58 100644
> --- a/migration/migration.c
> +++ b/migration/migration.c
> @@ -3812,7 +3812,7 @@ static void *bg_migration_thread(void *opaque)
>       * with vCPUs running and, finally, write stashed non-RAM part of
>       * the vmstate from the buffer to the migration stream.
>       */
> -    s->bioc = qio_channel_buffer_new(128 * 1024);
> +    s->bioc = qio_channel_buffer_new(512 * 1024);
>      qio_channel_set_name(QIO_CHANNEL(s->bioc), "vmstate-buffer");
>      fb = qemu_fopen_channel_output(QIO_CHANNEL(s->bioc));
>      object_unref(OBJECT(s->bioc));
> @@ -3866,6 +3866,12 @@ static void *bg_migration_thread(void *opaque)
>      if (qemu_savevm_state_complete_precopy_non_iterable(fb, false, false)) {
>          goto fail;
>      }
> +    /*
> +     * Since we are going to get non-iterable state data directly
> +     * from s->bioc->data, explicit flush is needed here.
> +     */
> +    qemu_fflush(fb);
> +
>      /* Now initialize UFFD context and start tracking RAM writes */
>      if (ram_write_tracking_start()) {
>          goto fail;
> -- 
> 2.27.0
> 
> 
-- 
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK


