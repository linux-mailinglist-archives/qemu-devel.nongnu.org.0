Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A29F5B56E4
	for <lists+qemu-devel@lfdr.de>; Mon, 12 Sep 2022 10:59:15 +0200 (CEST)
Received: from localhost ([::1]:39168 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oXfHe-0002G9-3f
	for lists+qemu-devel@lfdr.de; Mon, 12 Sep 2022 04:59:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43232)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1oXfFd-0000hp-NK
 for qemu-devel@nongnu.org; Mon, 12 Sep 2022 04:57:09 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:52501)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1oXfFb-0002py-JX
 for qemu-devel@nongnu.org; Mon, 12 Sep 2022 04:57:09 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1662973026;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=jLUG2aKtYWudWLidmyDXjoSsOwlG1ybCksIPlqZ3Jso=;
 b=BFrhKzaVqPWpbVkRWbVVuXZWSLwpd9+jy90DWnl4WvqdreCK8TZIXur1iKvK0+iS+NgXtt
 IU0GMbhxzgcxtsMssnWJyu+L94Ub6JfxrTrwL3Jvz57V91bf7/2BbeetFCujZ0V9XWt8g1
 WbQr+soI10DFTioxCAF6ISI9ayWY6Us=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-26-Ww9sxnhAPaeEeTEaGB-fXA-1; Mon, 12 Sep 2022 04:57:04 -0400
X-MC-Unique: Ww9sxnhAPaeEeTEaGB-fXA-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 9A6721C07543;
 Mon, 12 Sep 2022 08:57:04 +0000 (UTC)
Received: from redhat.com (unknown [10.33.36.52])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id F1FED4B400F;
 Mon, 12 Sep 2022 08:57:02 +0000 (UTC)
Date: Mon, 12 Sep 2022 09:56:58 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Nikolay Borisov <nborisov@suse.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Juan Quintela <quintela@redhat.com>
Cc: qemu-devel@nongnu.org
Subject: Re: [PATCH] migration/multifd: Remove redundant copy of page offsets
 during send
Message-ID: <Yx70WiZgJEYPMPhL@redhat.com>
References: <20220810103942.580784-1-nborisov@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20220810103942.580784-1-nborisov@suse.com>
User-Agent: Mutt/2.2.6 (2022-06-05)
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.9
Received-SPF: pass client-ip=170.10.133.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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
Reply-To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Copying in the two migration maintainers.

On Wed, Aug 10, 2022 at 01:39:42PM +0300, Nikolay Borisov wrote:
> All pages which are going to be migrated are first added to
> MultiFDSendParams::MultiFDPages_t::offset array by the main migration
> thread and are subsequently copied to MultiFDSendParams::normal by the
> multifd thread. This is really unnecessary as the MultiFDPages_t is
> guaranteed to be stable since its mutex is being held. Additionally,
> this somewhat simplifies the code as the migration pages are now kept
> in only 1 place during send, also the name 'offset' coupled with the
> context it's being used - usually added to the host pages makes it
> obvious that this is an offset.
> 
> With this change normal/normal_num are no longer used in the multifd
> send path.
> 
> Signed-off-by: Nikolay Borisov <nborisov@suse.com>
> ---
>  migration/multifd-zlib.c |  6 +++---
>  migration/multifd-zstd.c |  6 +++---
>  migration/multifd.c      | 25 ++++++++++---------------
>  3 files changed, 16 insertions(+), 21 deletions(-)
> 
> diff --git a/migration/multifd-zlib.c b/migration/multifd-zlib.c
> index 18213a951302..363b64e95922 100644
> --- a/migration/multifd-zlib.c
> +++ b/migration/multifd-zlib.c
> @@ -122,11 +122,11 @@ static int zlib_send_prepare(MultiFDSendParams *p, Error **errp)
>      int ret;
>      uint32_t i;
> 
> -    for (i = 0; i < p->normal_num; i++) {
> +    for (i = 0; i < p->pages->num; i++) {
>          uint32_t available = z->zbuff_len - out_size;
>          int flush = Z_NO_FLUSH;
> 
> -        if (i == p->normal_num - 1) {
> +        if (i == p->pages->num - 1) {
>              flush = Z_SYNC_FLUSH;
>          }
> 
> @@ -135,7 +135,7 @@ static int zlib_send_prepare(MultiFDSendParams *p, Error **errp)
>           * with compression. zlib does not guarantee that this is safe,
>           * therefore copy the page before calling deflate().
>           */
> -        memcpy(z->buf, p->pages->block->host + p->normal[i], page_size);
> +        memcpy(z->buf, p->pages->block->host + p->pages->offset[i], page_size);
>          zs->avail_in = page_size;
>          zs->next_in = z->buf;
> 
> diff --git a/migration/multifd-zstd.c b/migration/multifd-zstd.c
> index d788d309f22e..4daec8366727 100644
> --- a/migration/multifd-zstd.c
> +++ b/migration/multifd-zstd.c
> @@ -121,13 +121,13 @@ static int zstd_send_prepare(MultiFDSendParams *p, Error **errp)
>      z->out.size = z->zbuff_len;
>      z->out.pos = 0;
> 
> -    for (i = 0; i < p->normal_num; i++) {
> +    for (i = 0; i < p->pages->num; i++) {
>          ZSTD_EndDirective flush = ZSTD_e_continue;
> 
> -        if (i == p->normal_num - 1) {
> +        if (i == p->pages->num - 1) {
>              flush = ZSTD_e_flush;
>          }
> -        z->in.src = p->pages->block->host + p->normal[i];
> +        z->in.src = p->pages->block->host + p->pages->offset[i];
>          z->in.size = page_size;
>          z->in.pos = 0;
> 
> diff --git a/migration/multifd.c b/migration/multifd.c
> index 586ddc9d657a..d70662406490 100644
> --- a/migration/multifd.c
> +++ b/migration/multifd.c
> @@ -89,13 +89,13 @@ static int nocomp_send_prepare(MultiFDSendParams *p, Error **errp)
>      MultiFDPages_t *pages = p->pages;
>      size_t page_size = qemu_target_page_size();
> 
> -    for (int i = 0; i < p->normal_num; i++) {
> -        p->iov[p->iovs_num].iov_base = pages->block->host + p->normal[i];
> +    for (int i = 0; i < pages->num; i++) {
> +        p->iov[p->iovs_num].iov_base = pages->block->host + pages->offset[i];
>          p->iov[p->iovs_num].iov_len = page_size;
>          p->iovs_num++;
>      }
> 
> -    p->next_packet_size = p->normal_num * page_size;
> +    p->next_packet_size = pages->num * page_size;
>      p->flags |= MULTIFD_FLAG_NOCOMP;
>      return 0;
>  }
> @@ -262,7 +262,7 @@ static void multifd_send_fill_packet(MultiFDSendParams *p)
> 
>      packet->flags = cpu_to_be32(p->flags);
>      packet->pages_alloc = cpu_to_be32(p->pages->allocated);
> -    packet->normal_pages = cpu_to_be32(p->normal_num);
> +    packet->normal_pages = cpu_to_be32(p->pages->num);
>      packet->next_packet_size = cpu_to_be32(p->next_packet_size);
>      packet->packet_num = cpu_to_be64(p->packet_num);
> 
> @@ -270,9 +270,9 @@ static void multifd_send_fill_packet(MultiFDSendParams *p)
>          strncpy(packet->ramblock, p->pages->block->idstr, 256);
>      }
> 
> -    for (i = 0; i < p->normal_num; i++) {
> +    for (i = 0; i < p->pages->num; i++) {
>          /* there are architectures where ram_addr_t is 32 bit */
> -        uint64_t temp = p->normal[i];
> +        uint64_t temp = p->pages->offset[i];
> 
>          packet->offset[i] = cpu_to_be64(temp);
>      }
> @@ -668,7 +668,7 @@ static void *multifd_send_thread(void *opaque)
>          if (p->pending_job) {
>              uint64_t packet_num = p->packet_num;
>              uint32_t flags = p->flags;
> -            p->normal_num = 0;
> +            uint32_t num_pages = p->pages->num;
> 
>              if (use_zero_copy_send) {
>                  p->iovs_num = 0;
> @@ -676,12 +676,7 @@ static void *multifd_send_thread(void *opaque)
>                  p->iovs_num = 1;
>              }
> 
> -            for (int i = 0; i < p->pages->num; i++) {
> -                p->normal[p->normal_num] = p->pages->offset[i];
> -                p->normal_num++;
> -            }
> -
> -            if (p->normal_num) {
> +            if (num_pages) {
>                  ret = multifd_send_state->ops->send_prepare(p, &local_err);
>                  if (ret != 0) {
>                      qemu_mutex_unlock(&p->mutex);
> @@ -691,12 +686,12 @@ static void *multifd_send_thread(void *opaque)
>              multifd_send_fill_packet(p);
>              p->flags = 0;
>              p->num_packets++;
> -            p->total_normal_pages += p->normal_num;
> +            p->total_normal_pages += num_pages;
>              p->pages->num = 0;
>              p->pages->block = NULL;
>              qemu_mutex_unlock(&p->mutex);
> 
> -            trace_multifd_send(p->id, packet_num, p->normal_num, flags,
> +            trace_multifd_send(p->id, packet_num, num_pages, flags,
>                                 p->next_packet_size);
> 
>              if (use_zero_copy_send) {
> --
> 2.25.1
> 
> 

With regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


