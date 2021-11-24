Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 325BE45CD91
	for <lists+qemu-devel@lfdr.de>; Wed, 24 Nov 2021 20:56:39 +0100 (CET)
Received: from localhost ([::1]:47300 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mpyNi-0006XQ-30
	for lists+qemu-devel@lfdr.de; Wed, 24 Nov 2021 14:56:38 -0500
Received: from eggs.gnu.org ([209.51.188.92]:39090)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1mpy5T-0001lR-P4
 for qemu-devel@nongnu.org; Wed, 24 Nov 2021 14:37:47 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:54358)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1mpy5R-0000va-Bl
 for qemu-devel@nongnu.org; Wed, 24 Nov 2021 14:37:46 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1637782664;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=IK2Fsa9VfsKG/er8lEodR1TGRfeku8Ei6gOGmyFrbfc=;
 b=YKX7aKYMyfXXN8jjJSlNuitnOq10vcEVZ1LtSA1KJe1ffFw4V2jwyN7+vJXdfcbIrzQY0x
 Zy989XtK7Ot8Ng/p4LxtT6XrA/35gHVBWVdY7mf4pn3kYCJDsQJ7btRjU52NzZcMbxRgyM
 gvR4ZB2wXTWk7bFpZ0eqSlG45WsWSgQ=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-399-j4OWdDHdOeWkCtHFcQo19g-1; Wed, 24 Nov 2021 14:37:42 -0500
X-MC-Unique: j4OWdDHdOeWkCtHFcQo19g-1
Received: by mail-wm1-f72.google.com with SMTP id
 l4-20020a05600c1d0400b00332f47a0fa3so1991725wms.8
 for <qemu-devel@nongnu.org>; Wed, 24 Nov 2021 11:37:42 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=IK2Fsa9VfsKG/er8lEodR1TGRfeku8Ei6gOGmyFrbfc=;
 b=gIoz85xKxUJ7tqZRpMdEk3HwvMfjcci0SuD6HNuByybIisuxeSaW3TmEMaXbL0+Wug
 bZTAKDCry3u3KXhpr8SKNWheJVStPWe+siu5LixWICyx9fKNvlE7DcN64qU32bAgRFW/
 2XiQo6tcBN+4IfI/7gddA5GLyDg+uPyVV9okkC6l33cDZPOSMNNuXtzg+CHY0PXuy/C3
 ArbijEYDT0ck51ICTJPY197JHXTSwANIoQHKFFjF//wtYdCnAF/F/BzW79Z/2Oy6K9o6
 bkHLqpxV0jV4lyNTXFwTNdj1sYJ3hdZ1kLDxIPehM3uEW3hesAn5UMfuPT6PmMsDdeMV
 CloQ==
X-Gm-Message-State: AOAM531qria0LKFFOwunW/c6wH4FA5vftCo0OgRYhLR416W/RnrZ/OBf
 kaUOolR8rgqJieIfec1OplhLKoS96l3d6iJNJ4OogKrz9ffb8Wal48mL+KPCSRnb2IV35ZG4HPq
 0mpiMYDFYXGimoVo=
X-Received: by 2002:adf:e8c1:: with SMTP id k1mr22256993wrn.257.1637782661646; 
 Wed, 24 Nov 2021 11:37:41 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyivkVrZ9SBoGwOkK+a7ynoMhaqlWLftOaDZFb5p3PTOzXNRqfvfVlVEhrcoPKl7nOTNmg5tw==
X-Received: by 2002:adf:e8c1:: with SMTP id k1mr22256957wrn.257.1637782661394; 
 Wed, 24 Nov 2021 11:37:41 -0800 (PST)
Received: from work-vm (cpc109025-salf6-2-0-cust480.10-2.cable.virginm.net.
 [82.30.61.225])
 by smtp.gmail.com with ESMTPSA id h7sm650842wrt.64.2021.11.24.11.37.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 24 Nov 2021 11:37:40 -0800 (PST)
Date: Wed, 24 Nov 2021 19:37:39 +0000
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: Juan Quintela <quintela@redhat.com>
Subject: Re: [PATCH v3 03/23] multifd: Rename used field to num
Message-ID: <YZ6Ug+P2YjHndWKK@work-vm>
References: <20211124100617.19786-1-quintela@redhat.com>
 <20211124100617.19786-4-quintela@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20211124100617.19786-4-quintela@redhat.com>
User-Agent: Mutt/2.0.7 (2021-05-04)
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dgilbert@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.129.124; envelope-from=dgilbert@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.7,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Leonardo Bras <leobras@redhat.com>, qemu-devel@nongnu.org,
 Peter Xu <peterx@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

* Juan Quintela (quintela@redhat.com) wrote:
> We will need to split it later in zero_num (number of zero pages) and
> normal_num (number of normal pages).  This name is better.
> 
> Signed-off-by: Juan Quintela <quintela@redhat.com>
> ---
>  migration/multifd.h |  2 +-
>  migration/multifd.c | 38 +++++++++++++++++++-------------------
>  2 files changed, 20 insertions(+), 20 deletions(-)
> 
> diff --git a/migration/multifd.h b/migration/multifd.h
> index 15c50ca0b2..86820dd028 100644
> --- a/migration/multifd.h
> +++ b/migration/multifd.h
> @@ -55,7 +55,7 @@ typedef struct {
>  
>  typedef struct {
>      /* number of used pages */
> -    uint32_t used;
> +    uint32_t num;

What does 'used' actually mean here?

Dave

>      /* number of allocated pages */
>      uint32_t allocated;
>      /* global number of generated multifd packets */
> diff --git a/migration/multifd.c b/migration/multifd.c
> index 8125d0015c..8ea86d81dc 100644
> --- a/migration/multifd.c
> +++ b/migration/multifd.c
> @@ -252,7 +252,7 @@ static MultiFDPages_t *multifd_pages_init(size_t size)
>  
>  static void multifd_pages_clear(MultiFDPages_t *pages)
>  {
> -    pages->used = 0;
> +    pages->num = 0;
>      pages->allocated = 0;
>      pages->packet_num = 0;
>      pages->block = NULL;
> @@ -270,7 +270,7 @@ static void multifd_send_fill_packet(MultiFDSendParams *p)
>  
>      packet->flags = cpu_to_be32(p->flags);
>      packet->pages_alloc = cpu_to_be32(p->pages->allocated);
> -    packet->pages_used = cpu_to_be32(p->pages->used);
> +    packet->pages_used = cpu_to_be32(p->pages->num);
>      packet->next_packet_size = cpu_to_be32(p->next_packet_size);
>      packet->packet_num = cpu_to_be64(p->packet_num);
>  
> @@ -278,7 +278,7 @@ static void multifd_send_fill_packet(MultiFDSendParams *p)
>          strncpy(packet->ramblock, p->pages->block->idstr, 256);
>      }
>  
> -    for (i = 0; i < p->pages->used; i++) {
> +    for (i = 0; i < p->pages->num; i++) {
>          /* there are architectures where ram_addr_t is 32 bit */
>          uint64_t temp = p->pages->offset[i];
>  
> @@ -332,18 +332,18 @@ static int multifd_recv_unfill_packet(MultiFDRecvParams *p, Error **errp)
>          p->pages = multifd_pages_init(packet->pages_alloc);
>      }
>  
> -    p->pages->used = be32_to_cpu(packet->pages_used);
> -    if (p->pages->used > packet->pages_alloc) {
> +    p->pages->num = be32_to_cpu(packet->pages_used);
> +    if (p->pages->num > packet->pages_alloc) {
>          error_setg(errp, "multifd: received packet "
>                     "with %d pages and expected maximum pages are %d",
> -                   p->pages->used, packet->pages_alloc) ;
> +                   p->pages->num, packet->pages_alloc) ;
>          return -1;
>      }
>  
>      p->next_packet_size = be32_to_cpu(packet->next_packet_size);
>      p->packet_num = be64_to_cpu(packet->packet_num);
>  
> -    if (p->pages->used == 0) {
> +    if (p->pages->num == 0) {
>          return 0;
>      }
>  
> @@ -356,7 +356,7 @@ static int multifd_recv_unfill_packet(MultiFDRecvParams *p, Error **errp)
>          return -1;
>      }
>  
> -    for (i = 0; i < p->pages->used; i++) {
> +    for (i = 0; i < p->pages->num; i++) {
>          uint64_t offset = be64_to_cpu(packet->offset[i]);
>  
>          if (offset > (block->used_length - page_size)) {
> @@ -443,13 +443,13 @@ static int multifd_send_pages(QEMUFile *f)
>          }
>          qemu_mutex_unlock(&p->mutex);
>      }
> -    assert(!p->pages->used);
> +    assert(!p->pages->num);
>      assert(!p->pages->block);
>  
>      p->packet_num = multifd_send_state->packet_num++;
>      multifd_send_state->pages = p->pages;
>      p->pages = pages;
> -    transferred = ((uint64_t) pages->used) * qemu_target_page_size()
> +    transferred = ((uint64_t) pages->num) * qemu_target_page_size()
>                  + p->packet_len;
>      qemu_file_update_transfer(f, transferred);
>      ram_counters.multifd_bytes += transferred;
> @@ -469,12 +469,12 @@ int multifd_queue_page(QEMUFile *f, RAMBlock *block, ram_addr_t offset)
>      }
>  
>      if (pages->block == block) {
> -        pages->offset[pages->used] = offset;
> -        pages->iov[pages->used].iov_base = block->host + offset;
> -        pages->iov[pages->used].iov_len = qemu_target_page_size();
> -        pages->used++;
> +        pages->offset[pages->num] = offset;
> +        pages->iov[pages->num].iov_base = block->host + offset;
> +        pages->iov[pages->num].iov_len = qemu_target_page_size();
> +        pages->num++;
>  
> -        if (pages->used < pages->allocated) {
> +        if (pages->num < pages->allocated) {
>              return 1;
>          }
>      }
> @@ -586,7 +586,7 @@ void multifd_send_sync_main(QEMUFile *f)
>      if (!migrate_use_multifd()) {
>          return;
>      }
> -    if (multifd_send_state->pages->used) {
> +    if (multifd_send_state->pages->num) {
>          if (multifd_send_pages(f) < 0) {
>              error_report("%s: multifd_send_pages fail", __func__);
>              return;
> @@ -649,7 +649,7 @@ static void *multifd_send_thread(void *opaque)
>          qemu_mutex_lock(&p->mutex);
>  
>          if (p->pending_job) {
> -            uint32_t used = p->pages->used;
> +            uint32_t used = p->pages->num;
>              uint64_t packet_num = p->packet_num;
>              flags = p->flags;
>  
> @@ -665,7 +665,7 @@ static void *multifd_send_thread(void *opaque)
>              p->flags = 0;
>              p->num_packets++;
>              p->num_pages += used;
> -            p->pages->used = 0;
> +            p->pages->num = 0;
>              p->pages->block = NULL;
>              qemu_mutex_unlock(&p->mutex);
>  
> @@ -1091,7 +1091,7 @@ static void *multifd_recv_thread(void *opaque)
>              break;
>          }
>  
> -        used = p->pages->used;
> +        used = p->pages->num;
>          flags = p->flags;
>          /* recv methods don't know how to handle the SYNC flag */
>          p->flags &= ~MULTIFD_FLAG_SYNC;
> -- 
> 2.33.1
> 
-- 
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK


