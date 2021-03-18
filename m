Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 76EF3340CFD
	for <lists+qemu-devel@lfdr.de>; Thu, 18 Mar 2021 19:30:39 +0100 (CET)
Received: from localhost ([::1]:56690 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lMxPq-0003Fh-JF
	for lists+qemu-devel@lfdr.de; Thu, 18 Mar 2021 14:30:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40206)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1lMxCJ-0001iJ-NU
 for qemu-devel@nongnu.org; Thu, 18 Mar 2021 14:16:39 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:23218)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1lMxCH-0002NY-VQ
 for qemu-devel@nongnu.org; Thu, 18 Mar 2021 14:16:39 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1616091396;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=FjdQVKq/q+bZ0HDC6QDuqE0MLdPZxcWuMsQXPYBLnng=;
 b=ZZpCrHuFZe2/1IkN2zvpgRwriEkVvlRjVs3hZPBQA3gFrkY3M7PvEys2yxOYRQJN2uITZp
 Hu66KbDklhI9JHvyC4YuStuLQ1H7F5lffKpMveQ6QczNoCqrRKxt4tnajaGMeblv34t20p
 OdBcgN47VlYCKGnbubCx4vQlv1PJrPQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-1-WMhDNja-NaSofRfyuo3jTw-1; Thu, 18 Mar 2021 14:16:35 -0400
X-MC-Unique: WMhDNja-NaSofRfyuo3jTw-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 9B14487A826;
 Thu, 18 Mar 2021 18:16:33 +0000 (UTC)
Received: from [10.36.113.61] (ovpn-113-61.ams2.redhat.com [10.36.113.61])
 by smtp.corp.redhat.com (Postfix) with ESMTP id E28AF6064B;
 Thu, 18 Mar 2021 18:16:28 +0000 (UTC)
Subject: Re: [PATCH 2/3] migration: Inhibit virtio-balloon for the duration of
 background snapshot
To: Andrey Gruzdev <andrey.gruzdev@virtuozzo.com>, qemu-devel@nongnu.org
References: <20210318174611.293520-1-andrey.gruzdev@virtuozzo.com>
 <20210318174611.293520-3-andrey.gruzdev@virtuozzo.com>
From: David Hildenbrand <david@redhat.com>
Organization: Red Hat GmbH
Message-ID: <1892eefd-4405-705d-9242-50145c0d3fcd@redhat.com>
Date: Thu, 18 Mar 2021 19:16:28 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <20210318174611.293520-3-andrey.gruzdev@virtuozzo.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=david@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=david@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.249,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Juan Quintela <quintela@redhat.com>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>, Peter Xu <peterx@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Den Lunev <den@openvz.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 18.03.21 18:46, Andrey Gruzdev wrote:
> The same thing as for incoming postcopy - we cannot deal with concurrent
> RAM discards when using background snapshot feature in outgoing migration.
> 
> Signed-off-by: Andrey Gruzdev <andrey.gruzdev@virtuozzo.com>
> ---
>   hw/virtio/virtio-balloon.c | 8 ++++++--
>   include/migration/misc.h   | 2 ++
>   migration/migration.c      | 8 ++++++++
>   3 files changed, 16 insertions(+), 2 deletions(-)
> 
> diff --git a/hw/virtio/virtio-balloon.c b/hw/virtio/virtio-balloon.c
> index e770955176..d120bf8f43 100644
> --- a/hw/virtio/virtio-balloon.c
> +++ b/hw/virtio/virtio-balloon.c
> @@ -66,8 +66,12 @@ static bool virtio_balloon_pbp_matches(PartiallyBalloonedPage *pbp,
>   
>   static bool virtio_balloon_inhibited(void)
>   {
> -    /* Postcopy cannot deal with concurrent discards, so it's special. */
> -    return ram_block_discard_is_disabled() || migration_in_incoming_postcopy();
> +    /*
> +     * Postcopy cannot deal with concurrent discards,
> +     * so it's special, as well as background snapshots.
> +     */
> +    return ram_block_discard_is_disabled() || migration_in_incoming_postcopy() ||
> +            migration_in_bg_snapshot();
>   }
>   
>   static void balloon_inflate_page(VirtIOBalloon *balloon,
> diff --git a/include/migration/misc.h b/include/migration/misc.h
> index bccc1b6b44..738675ef52 100644
> --- a/include/migration/misc.h
> +++ b/include/migration/misc.h
> @@ -70,6 +70,8 @@ bool migration_in_postcopy_after_devices(MigrationState *);
>   void migration_global_dump(Monitor *mon);
>   /* True if incomming migration entered POSTCOPY_INCOMING_DISCARD */
>   bool migration_in_incoming_postcopy(void);
> +/* True if background snapshot is active */
> +bool migration_in_bg_snapshot(void);
>   
>   /* migration/block-dirty-bitmap.c */
>   void dirty_bitmap_mig_init(void);
> diff --git a/migration/migration.c b/migration/migration.c
> index 496cf6e17b..656d6249a6 100644
> --- a/migration/migration.c
> +++ b/migration/migration.c
> @@ -1976,6 +1976,14 @@ bool migration_in_incoming_postcopy(void)
>       return ps >= POSTCOPY_INCOMING_DISCARD && ps < POSTCOPY_INCOMING_END;
>   }
>   
> +bool migration_in_bg_snapshot(void)
> +{
> +    MigrationState *s = migrate_get_current();
> +
> +    return migrate_background_snapshot() &&
> +            migration_is_setup_or_active(s->state);
> +}
> +
>   bool migration_is_idle(void)
>   {
>       MigrationState *s = current_migration;
> 

Reviewed-by: David Hildenbrand <david@redhat.com>

-- 
Thanks,

David / dhildenb


