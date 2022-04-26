Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E74250F37D
	for <lists+qemu-devel@lfdr.de>; Tue, 26 Apr 2022 10:14:38 +0200 (CEST)
Received: from localhost ([::1]:39166 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1njGLE-0001g3-TS
	for lists+qemu-devel@lfdr.de; Tue, 26 Apr 2022 04:14:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34630)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1njGHv-000091-60
 for qemu-devel@nongnu.org; Tue, 26 Apr 2022 04:11:12 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:23269)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1njGHt-0002Y3-A8
 for qemu-devel@nongnu.org; Tue, 26 Apr 2022 04:11:10 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1650960667;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=XuqhaXGZBVq6PmA6B1OrGvDhdLPKzrLHKFkL1qwN+t4=;
 b=fcSS0Ev4Al5501pGHSju3Cy/UI0yAdIpzyS28XGXrgEVM21PtgqgdaVXbvqQZOq6DJJ1os
 lKYlIDV3SUVaC583BKmsS8A0FR57FOSYrCbR9V0RJ670VKWu9VHFjuCT/p3EK0NVgzv9W3
 173wVjNJ5xzSRHn/agPtEiBb0h8M62A=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-149-W6vWJgOjNkubg7huBkyYlA-1; Tue, 26 Apr 2022 04:11:03 -0400
X-MC-Unique: W6vWJgOjNkubg7huBkyYlA-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
 [10.11.54.4])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 4AFE885A5A8;
 Tue, 26 Apr 2022 08:11:03 +0000 (UTC)
Received: from redhat.com (unknown [10.33.36.156])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 8E2DD2024CB7;
 Tue, 26 Apr 2022 08:10:26 +0000 (UTC)
Date: Tue, 26 Apr 2022 09:10:23 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Leonardo Bras <leobras@redhat.com>
Subject: Re: [PATCH v9 6/7] multifd: Send header packet without flags if
 zero-copy-send is enabled
Message-ID: <Ymeo74XfWOwe2Nob@redhat.com>
References: <20220425215055.611825-1-leobras@redhat.com>
 <20220425215055.611825-7-leobras@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20220425215055.611825-7-leobras@redhat.com>
User-Agent: Mutt/2.1.5 (2021-12-30)
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
Received-SPF: pass client-ip=170.10.129.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
Reply-To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
Cc: Elena Ufimtseva <elena.ufimtseva@oracle.com>,
 John G Johnson <john.g.johnson@oracle.com>,
 Jagannathan Raman <jag.raman@oracle.com>, qemu-block@nongnu.org,
 Juan Quintela <quintela@redhat.com>, qemu-devel@nongnu.org,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>, Peter Xu <peterx@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 =?utf-8?Q?Marc-Andr=C3=A9?= Lureau <marcandre.lureau@redhat.com>,
 Fam Zheng <fam@euphon.net>, Eric Blake <eblake@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, Apr 25, 2022 at 06:50:55PM -0300, Leonardo Bras wrote:
> Since d48c3a0445 ("multifd: Use a single writev on the send side"),
> sending the header packet and the memory pages happens in the same
> writev, which can potentially make the migration faster.
> 
> Using channel-socket as example, this works well with the default copying
> mechanism of sendmsg(), but with zero-copy-send=true, it will cause
> the migration to often break.
> 
> This happens because the header packet buffer gets reused quite often,
> and there is a high chance that by the time the MSG_ZEROCOPY mechanism get
> to send the buffer, it has already changed, sending the wrong data and
> causing the migration to abort.
> 
> It means that, as it is, the buffer for the header packet is not suitable
> for sending with MSG_ZEROCOPY.
> 
> In order to enable zero copy for multifd, send the header packet on an
> individual write(), without any flags, and the remanining pages with a
> writev(), as it was happening before. This only changes how a migration
> with zero-copy-send=true works, not changing any current behavior for
> migrations with zero-copy-send=false.
> 
> Signed-off-by: Leonardo Bras <leobras@redhat.com>
> ---
>  migration/multifd.c | 29 ++++++++++++++++++++++++++---
>  1 file changed, 26 insertions(+), 3 deletions(-)
> 
> diff --git a/migration/multifd.c b/migration/multifd.c
> index 15fb668e64..6c940aaa98 100644
> --- a/migration/multifd.c
> +++ b/migration/multifd.c
> @@ -639,6 +639,8 @@ static void *multifd_send_thread(void *opaque)
>          if (p->pending_job) {
>              uint64_t packet_num = p->packet_num;
>              uint32_t flags = p->flags;
> +            int iov_offset = 0;
> +

No need for this if you change:

>              p->iovs_num = 1;

   if (!migrate_use_zero_copy_send()) {
      p->iovs_num = 1;
   }


>              p->normal_num = 0;
>  
> @@ -665,15 +667,36 @@ static void *multifd_send_thread(void *opaque)
>              trace_multifd_send(p->id, packet_num, p->normal_num, flags,
>                                 p->next_packet_size);
>  
> -            p->iov[0].iov_len = p->packet_len;
> -            p->iov[0].iov_base = p->packet;
> +            if (migrate_use_zero_copy_send()) {
> +                /* Send header without zerocopy */
> +                ret = qio_channel_write_all(p->c, (void *)p->packet,
> +                                            p->packet_len, &local_err);
> +                if (ret != 0) {
> +                    break;
> +                }
> +
> +                if (!p->normal_num) {
> +                    /* No pages will be sent */
> +                    goto skip_send;
> +                }

Don't need this AFAIK, because the qio_channel_writev_all
call will be a no-op if  iovs_num is zero

>  
> -            ret = qio_channel_writev_all(p->c, p->iov, p->iovs_num,
> +                /* Skip first iov : header */
> +                iov_offset = 1;

Don't need to set this

> +            } else {
> +                /* Send header using the same writev call */
> +                p->iov[0].iov_len = p->packet_len;
> +                p->iov[0].iov_base = p->packet;
> +            }
> +
> +            ret = qio_channel_writev_all(p->c, p->iov + iov_offset,
> +                                         p->iovs_num - iov_offset,
>                                           &local_err);

This wouldn't need changing if we don't reserve iovs[0] when
not required.

> +
>              if (ret != 0) {
>                  break;
>              }
>  
> +skip_send:
>              qemu_mutex_lock(&p->mutex);
>              p->pending_job--;
>              qemu_mutex_unlock(&p->mutex);
> -- 
> 2.36.0
> 

With regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


