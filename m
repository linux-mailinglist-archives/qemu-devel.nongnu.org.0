Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 64304345098
	for <lists+qemu-devel@lfdr.de>; Mon, 22 Mar 2021 21:20:32 +0100 (CET)
Received: from localhost ([::1]:34790 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lOR2L-0004iR-KP
	for lists+qemu-devel@lfdr.de; Mon, 22 Mar 2021 16:20:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59690)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1lOQzO-0003f4-Do
 for qemu-devel@nongnu.org; Mon, 22 Mar 2021 16:17:26 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:28825)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1lOQzM-0005MW-4Z
 for qemu-devel@nongnu.org; Mon, 22 Mar 2021 16:17:25 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1616444241;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=jJ56t/iS9IL8L4TpxOQZ74ZRWCZXyy1v4jx/547MNhk=;
 b=Bko0RjdVK5iSlqD8NwICkumgewnA/l/+ccKhHq+PRN2EZPEXLOVkHoYHHwhpgRDFgdwe+O
 N0Uo+g8gC4DaF/ijbJFY8MOUcO4ap5wu6q8uU6OUvnEM2qcdT6AwpfAV2ODdnBtJ2peE7I
 Ed4lDsc0NyQXwFHSdxh0OLlaxRhJvWM=
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com
 [209.85.219.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-121-VpJhlQl0MDmRcSDiKJL2DQ-1; Mon, 22 Mar 2021 16:17:20 -0400
X-MC-Unique: VpJhlQl0MDmRcSDiKJL2DQ-1
Received: by mail-qv1-f71.google.com with SMTP id n1so228118qvi.4
 for <qemu-devel@nongnu.org>; Mon, 22 Mar 2021 13:17:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=jJ56t/iS9IL8L4TpxOQZ74ZRWCZXyy1v4jx/547MNhk=;
 b=iaVBTy9Lk/2kxFglu2PQaIdlkII1mIowgsa7DsjU+UlziB0Oanr0J5bi3cAk+9FuS+
 z78Dtl8pq0LkaIDJBSS4zgyQWU6JWYOTOuhKEW6aOEyfg2oWAUOgzGtmqbjtyGgjYD5q
 cTVYlJ9oqfsrtayKSCdQk02A1hObDxJmo+lbma4TkQucqnP2S47ZpxK9mZIuboezN82E
 qJ6uF/E2jTs4CQgpdimIXcRN9n8OPWK273Pr3XuwXzA5Y1d9AdCpdfs0zlT3dwxBDQWV
 w/S80jhLk0siYZ9tAJSa3bnI2Whpq4XTOejIQ84EGCi23UkcuGwH1PBya2Nmob0I3140
 zdcA==
X-Gm-Message-State: AOAM533WBhq8r5t7tnQYu06j/ULKHMiOvUI/CbkLS+B4TfjM7/2fIABR
 bPeY3TfRJK9P/HmRSwmUmfbMB5P5TRh9jgh2AygQFOAmthdyK+mYbDKSS1RufqKzDUF7HXAFnkk
 1wBSxPt6F7RnjVkM=
X-Received: by 2002:ac8:7b3a:: with SMTP id l26mr1635813qtu.150.1616444239450; 
 Mon, 22 Mar 2021 13:17:19 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzN2g+rJdNVLB2Pa4zS0xjJcAe/ZVkMdeFYcD4kE2lGCrvXjE8J22hxI6VIdRSzNwcdrJDnqA==
X-Received: by 2002:ac8:7b3a:: with SMTP id l26mr1635790qtu.150.1616444239156; 
 Mon, 22 Mar 2021 13:17:19 -0700 (PDT)
Received: from xz-x1 (bras-base-toroon474qw-grc-82-174-91-135-175.dsl.bell.ca.
 [174.91.135.175])
 by smtp.gmail.com with ESMTPSA id r8sm9817196qtu.49.2021.03.22.13.17.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 22 Mar 2021 13:17:18 -0700 (PDT)
Date: Mon, 22 Mar 2021 16:17:16 -0400
From: Peter Xu <peterx@redhat.com>
To: Andrey Gruzdev <andrey.gruzdev@virtuozzo.com>
Subject: Re: [PATCH v1 1/3] migration: Fix missing qemu_fflush() on buffer
 file in bg_migration_thread
Message-ID: <20210322201716.GG16645@xz-x1>
References: <20210319145249.425189-1-andrey.gruzdev@virtuozzo.com>
 <20210319145249.425189-2-andrey.gruzdev@virtuozzo.com>
MIME-Version: 1.0
In-Reply-To: <20210319145249.425189-2-andrey.gruzdev@virtuozzo.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=peterx@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=peterx@redhat.com;
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
Cc: Juan Quintela <quintela@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 David Hildenbrand <david@redhat.com>, qemu-devel@nongnu.org,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Den Lunev <den@openvz.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, Mar 19, 2021 at 05:52:47PM +0300, Andrey Gruzdev wrote:
> Added missing qemu_fflush() on buffer file holding precopy device state.
> Increased initial QIOChannelBuffer allocation to 512KB to avoid reallocs.
> Typical configurations often require >200KB for device state and VMDESC.
> 
> Signed-off-by: Andrey Gruzdev <andrey.gruzdev@virtuozzo.com>
> ---
>  migration/migration.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/migration/migration.c b/migration/migration.c
> index ca8b97baa5..32b48fe9f5 100644
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
> @@ -3866,6 +3866,8 @@ static void *bg_migration_thread(void *opaque)
>      if (qemu_savevm_state_complete_precopy_non_iterable(fb, false, false)) {
>          goto fail;
>      }
> +    qemu_fflush(fb);

What will happen if the vmstates are bigger than 512KB?  Would the extra data
be dropped?

In that case, I'm wondering whether we'll need a qemu_file_get_error() after
the flush to detect it, and whether we need to retry with a bigger buffer size?

Thanks,

-- 
Peter Xu


