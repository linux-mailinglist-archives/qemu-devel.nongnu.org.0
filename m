Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 323F2341D10
	for <lists+qemu-devel@lfdr.de>; Fri, 19 Mar 2021 13:41:26 +0100 (CET)
Received: from localhost ([::1]:44256 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lNERL-0007Xf-TS
	for lists+qemu-devel@lfdr.de; Fri, 19 Mar 2021 08:41:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51092)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1lNEPw-0006ZY-LM
 for qemu-devel@nongnu.org; Fri, 19 Mar 2021 08:39:52 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:39155)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1lNEPv-0001OU-4M
 for qemu-devel@nongnu.org; Fri, 19 Mar 2021 08:39:52 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1616157590;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=pK8v5Sg20F4/iF9/oOWlGVJhA2HKzhlvkgH/Ld8kjFA=;
 b=jI7Siyr/DRTFtvvTydnedA7ptuKKQUH8QozKQA5zqwx9roLlUe35r/aPB1uciWAOpiX+MO
 b7+J2u/wk0dol6ffGYA4s1JII8bW0/UFpTawnzqjcKxz6BtXesFwlJa6/l0lcTbwZqsxUj
 iSZ29LcRE3IE1ntsJBGk+NBN4BcWWrg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-238-hOVE8a3rOzO9JsXT1r1kkw-1; Fri, 19 Mar 2021 08:39:48 -0400
X-MC-Unique: hOVE8a3rOzO9JsXT1r1kkw-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 6C5D8108BD16;
 Fri, 19 Mar 2021 12:39:47 +0000 (UTC)
Received: from [10.36.112.11] (ovpn-112-11.ams2.redhat.com [10.36.112.11])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 62DD31C959;
 Fri, 19 Mar 2021 12:39:45 +0000 (UTC)
Subject: Re: [PATCH 1/3] migration: Fix missing qemu_fflush() on buffer file
 in bg_migration_thread
To: Andrey Gruzdev <andrey.gruzdev@virtuozzo.com>, qemu-devel@nongnu.org
References: <20210318174611.293520-1-andrey.gruzdev@virtuozzo.com>
 <20210318174611.293520-2-andrey.gruzdev@virtuozzo.com>
From: David Hildenbrand <david@redhat.com>
Organization: Red Hat GmbH
Message-ID: <598dd667-9152-0160-b27d-699bffb955cb@redhat.com>
Date: Fri, 19 Mar 2021 13:39:44 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <20210318174611.293520-2-andrey.gruzdev@virtuozzo.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=david@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=david@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.251,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
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
> Added missing qemu_fflush() on buffer file holding precopy device state.
> Increased initial QIOChannelBuffer allocation to 512KB to avoid reallocs.
> Typical configurations often require >200KB for device state and VMDESC.
> 
> Signed-off-by: Andrey Gruzdev <andrey.gruzdev@virtuozzo.com>
> ---
>   migration/migration.c | 4 +++-
>   1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/migration/migration.c b/migration/migration.c
> index 36768391b6..496cf6e17b 100644
> --- a/migration/migration.c
> +++ b/migration/migration.c
> @@ -3857,7 +3857,7 @@ static void *bg_migration_thread(void *opaque)
>        * with vCPUs running and, finally, write stashed non-RAM part of
>        * the vmstate from the buffer to the migration stream.
>        */
> -    s->bioc = qio_channel_buffer_new(128 * 1024);
> +    s->bioc = qio_channel_buffer_new(512 * 1024);

^ would that better be a separate patch? It sounds more like an 
improvement than a fix.

>       qio_channel_set_name(QIO_CHANNEL(s->bioc), "vmstate-buffer");
>       fb = qemu_fopen_channel_output(QIO_CHANNEL(s->bioc));
>       object_unref(OBJECT(s->bioc));
> @@ -3911,6 +3911,8 @@ static void *bg_migration_thread(void *opaque)
>       if (qemu_savevm_state_complete_precopy_non_iterable(fb, false, false)) {
>           goto fail;
>       }
> +    qemu_fflush(fb);

Fixes: ?

> +
>       /* Now initialize UFFD context and start tracking RAM writes */
>       if (ram_write_tracking_start()) {
>           goto fail;
> 


-- 
Thanks,

David / dhildenb


