Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E7261473051
	for <lists+qemu-devel@lfdr.de>; Mon, 13 Dec 2021 16:20:11 +0100 (CET)
Received: from localhost ([::1]:41736 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mwn7a-0007Ew-V4
	for lists+qemu-devel@lfdr.de; Mon, 13 Dec 2021 10:20:10 -0500
Received: from eggs.gnu.org ([209.51.188.92]:57480)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1mwn5b-0006Jj-0j
 for qemu-devel@nongnu.org; Mon, 13 Dec 2021 10:18:07 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:58818)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1mwn5Z-0006yH-AK
 for qemu-devel@nongnu.org; Mon, 13 Dec 2021 10:18:06 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1639408684;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=pQFfnD403GXov8/GglS5pq4HcVF3e3dov65Zrc4OqiY=;
 b=IW8mgRvE5xufibfZny3pqXCxsajCtJmXS4skdOV51uG9Z4lINXI5CdlX2r9T92zRuv5mD0
 s0CmjTsJqbXBkk2Hqhg4lbLwdcu8eiAUdK/Ckst2BjazRqrSGadA6AnwhkkOCuwZPhkRJH
 IT8tAknDT66hNzMG2+dld5BHeqqTXFc=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-557-yjQAlBmePv2nE--GFw2xdg-1; Mon, 13 Dec 2021 10:18:03 -0500
X-MC-Unique: yjQAlBmePv2nE--GFw2xdg-1
Received: by mail-wm1-f72.google.com with SMTP id
 o17-20020a05600c511100b00343141e2a16so3742909wms.5
 for <qemu-devel@nongnu.org>; Mon, 13 Dec 2021 07:18:03 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=pQFfnD403GXov8/GglS5pq4HcVF3e3dov65Zrc4OqiY=;
 b=J+w9LYvVHQvQAPCY6Eg7pAnVmdfhficWD2i3YgjQUPOAer32L/lxrEsrGiGRC0KsIo
 ByCL1rxIhpUAZxv1Krhx3EHLn3oLBJ4wJ12nQKAMJ9K9jkrp2d3/iCQSFvhRViBVNi2o
 Mp6373sFy+YCtcK7qdtDgHquPWl1+4HZV5oe+vS7t/I2wpgXu3dFhV7ID/cfB6YlpbVy
 c4Upc05/k8acX+5WDk9h2668+DTL8Yitf2gs8i0XbJ2jzQTYcFP1rZYLgpDp1iagvFg0
 y8wnkr659eesSVJsmH1EI6BZNPnyOotKjeG3dir5xdgbQ/4eE83dhd0rChbN/UCd6FcN
 52Qg==
X-Gm-Message-State: AOAM531fptMfQlh5vymKi5CjPWIIAapWyyNI1cOsKrzB5Q51eXwOwWWi
 10B5+n1ERLNWH3RwpuNtfJbpLAZ0mCqYQ4u29tfA//TBh9zjPoQ3/rvUviIZFc5MIAvnQ49dFfO
 GPOfgSUYEmaCUihY=
X-Received: by 2002:a5d:4563:: with SMTP id a3mr33729499wrc.130.1639408682147; 
 Mon, 13 Dec 2021 07:18:02 -0800 (PST)
X-Google-Smtp-Source: ABdhPJw2rDhZi6mPu5/UlacS0blCfcLX/VXYyng/De6VIgenaeR5HgoemwBKFQ9phQmGE8uFj51VoA==
X-Received: by 2002:a5d:4563:: with SMTP id a3mr33729456wrc.130.1639408681798; 
 Mon, 13 Dec 2021 07:18:01 -0800 (PST)
Received: from work-vm (cpc109025-salf6-2-0-cust480.10-2.cable.virginm.net.
 [82.30.61.225])
 by smtp.gmail.com with ESMTPSA id j134sm7907408wmj.3.2021.12.13.07.18.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 13 Dec 2021 07:18:00 -0800 (PST)
Date: Mon, 13 Dec 2021 15:17:58 +0000
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: Zheng Chuan <zhengchuan@huawei.com>
Subject: Re: [PATCH v3 03/23] multifd: Rename used field to num
Message-ID: <YbdkJiBBiCDJ/35Y@work-vm>
References: <20211124100617.19786-1-quintela@redhat.com>
 <20211124100617.19786-4-quintela@redhat.com>
 <85f4bf3b-9259-7f19-8717-0297251ee6b2@huawei.com>
MIME-Version: 1.0
In-Reply-To: <85f4bf3b-9259-7f19-8717-0297251ee6b2@huawei.com>
User-Agent: Mutt/2.1.3 (2021-09-10)
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
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.713,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Xiexiangyou <xiexiangyou@huawei.com>, Leonardo Bras <leobras@redhat.com>,
 qemu-devel@nongnu.org, Peter Xu <peterx@redhat.com>,
 Juan Quintela <quintela@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

* Zheng Chuan (zhengchuan@huawei.com) wrote:
> Hi, Juan,
> 
> Sorry, forget to send to qemu-devel, resend it.
> 
> On 2021/11/24 18:05, Juan Quintela wrote:
> > We will need to split it later in zero_num (number of zero pages) and
> > normal_num (number of normal pages).  This name is better.
> > 
> > Signed-off-by: Juan Quintela <quintela@redhat.com>
> > ---
> >  migration/multifd.h |  2 +-
> >  migration/multifd.c | 38 +++++++++++++++++++-------------------
> >  2 files changed, 20 insertions(+), 20 deletions(-)
> > 
> > diff --git a/migration/multifd.h b/migration/multifd.h
> > index 15c50ca0b2..86820dd028 100644
> > --- a/migration/multifd.h
> > +++ b/migration/multifd.h
> > @@ -55,7 +55,7 @@ typedef struct {
> >  
> >  typedef struct {
> >      /* number of used pages */
> > -    uint32_t used;
> > +    uint32_t num;
> >      /* number of allocated pages */
> >      uint32_t allocated;
> >      /* global number of generated multifd packets */
> > diff --git a/migration/multifd.c b/migration/multifd.c
> > index 8125d0015c..8ea86d81dc 100644
> > --- a/migration/multifd.c
> > +++ b/migration/multifd.c
> > @@ -252,7 +252,7 @@ static MultiFDPages_t *multifd_pages_init(size_t size)
> >  
> >  static void multifd_pages_clear(MultiFDPages_t *pages)
> >  {
> > -    pages->used = 0;
> > +    pages->num = 0;
> >      pages->allocated = 0;
> >      pages->packet_num = 0;
> >      pages->block = NULL;
> > @@ -270,7 +270,7 @@ static void multifd_send_fill_packet(MultiFDSendParams *p)
> >  
> >      packet->flags = cpu_to_be32(p->flags);
> >      packet->pages_alloc = cpu_to_be32(p->pages->allocated);
> > -    packet->pages_used = cpu_to_be32(p->pages->used);
> > +    packet->pages_used = cpu_to_be32(p->pages->num);
> >      packet->next_packet_size = cpu_to_be32(p->next_packet_size);
> >      packet->packet_num = cpu_to_be64(p->packet_num);
> >  
> > @@ -278,7 +278,7 @@ static void multifd_send_fill_packet(MultiFDSendParams *p)
> >          strncpy(packet->ramblock, p->pages->block->idstr, 256);
> >      }
> >  
> > -    for (i = 0; i < p->pages->used; i++) {
> > +    for (i = 0; i < p->pages->num; i++) {
> >          /* there are architectures where ram_addr_t is 32 bit */
> >          uint64_t temp = p->pages->offset[i];
> >  
> > @@ -332,18 +332,18 @@ static int multifd_recv_unfill_packet(MultiFDRecvParams *p, Error **errp)
> >          p->pages = multifd_pages_init(packet->pages_alloc);
> >      }
> >  
> > -    p->pages->used = be32_to_cpu(packet->pages_used);
> > -    if (p->pages->used > packet->pages_alloc) {
> > +    p->pages->num = be32_to_cpu(packet->pages_used);
> > +    if (p->pages->num > packet->pages_alloc) {
> >          error_setg(errp, "multifd: received packet "
> >                     "with %d pages and expected maximum pages are %d",
> > -                   p->pages->used, packet->pages_alloc) ;
> > +                   p->pages->num, packet->pages_alloc) ;
> >          return -1;
> >      }
> >  
> >      p->next_packet_size = be32_to_cpu(packet->next_packet_size);
> >      p->packet_num = be64_to_cpu(packet->packet_num);
> >  
> > -    if (p->pages->used == 0) {
> > +    if (p->pages->num == 0) {
> >          return 0;
> >      }
> >  
> > @@ -356,7 +356,7 @@ static int multifd_recv_unfill_packet(MultiFDRecvParams *p, Error **errp)
> >          return -1;
> >      }
> >  
> > -    for (i = 0; i < p->pages->used; i++) {
> > +    for (i = 0; i < p->pages->num; i++) {
> >          uint64_t offset = be64_to_cpu(packet->offset[i]);
> >  
> >          if (offset > (block->used_length - page_size)) {
> > @@ -443,13 +443,13 @@ static int multifd_send_pages(QEMUFile *f)
> >          }
> >          qemu_mutex_unlock(&p->mutex);
> >      }
> > -    assert(!p->pages->used);
> > +    assert(!p->pages->num);
> >      assert(!p->pages->block);
> >  
> >      p->packet_num = multifd_send_state->packet_num++;
> >      multifd_send_state->pages = p->pages;
> >      p->pages = pages;
> > -    transferred = ((uint64_t) pages->used) * qemu_target_page_size()
> > +    transferred = ((uint64_t) pages->num) * qemu_target_page_size()
> >                  + p->packet_len;
> The size of zero page should not regard as the whole pagesize.
> I think the transferred should be updated after you introduce zero_num in following patches, such as:
> +    transferred = ((uint64_t) p->normal_num) * qemu_target_page_size()
> +               + ((uint64_t) p->zero_num) * sizeof(uint64_t);
> Otherwise, migration time will get worse if we have low bandwidth limit parameter.
> 
> I tested it with bandwidth limit of 100MB/s and it works fine:)

Yes I think you're right; 'transferred' is normally a measure of used
network bandwidth.

Dave

> >      qemu_file_update_transfer(f, transferred);
> >      ram_counters.multifd_bytes += transferred;
> > @@ -469,12 +469,12 @@ int multifd_queue_page(QEMUFile *f, RAMBlock *block, ram_addr_t offset)
> >      }
> >  
> >      if (pages->block == block) {
> > -        pages->offset[pages->used] = offset;
> > -        pages->iov[pages->used].iov_base = block->host + offset;
> > -        pages->iov[pages->used].iov_len = qemu_target_page_size();
> > -        pages->used++;
> > +        pages->offset[pages->num] = offset;
> > +        pages->iov[pages->num].iov_base = block->host + offset;
> > +        pages->iov[pages->num].iov_len = qemu_target_page_size();
> > +        pages->num++;
> >  
> > -        if (pages->used < pages->allocated) {
> > +        if (pages->num < pages->allocated) {
> >              return 1;
> >          }
> >      }
> > @@ -586,7 +586,7 @@ void multifd_send_sync_main(QEMUFile *f)
> >      if (!migrate_use_multifd()) {
> >          return;
> >      }
> > -    if (multifd_send_state->pages->used) {
> > +    if (multifd_send_state->pages->num) {
> >          if (multifd_send_pages(f) < 0) {
> >              error_report("%s: multifd_send_pages fail", __func__);
> >              return;
> > @@ -649,7 +649,7 @@ static void *multifd_send_thread(void *opaque)
> >          qemu_mutex_lock(&p->mutex);
> >  
> >          if (p->pending_job) {
> > -            uint32_t used = p->pages->used;
> > +            uint32_t used = p->pages->num;
> >              uint64_t packet_num = p->packet_num;
> >              flags = p->flags;
> >  
> > @@ -665,7 +665,7 @@ static void *multifd_send_thread(void *opaque)
> >              p->flags = 0;
> >              p->num_packets++;
> >              p->num_pages += used;
> > -            p->pages->used = 0;
> > +            p->pages->num = 0;
> >              p->pages->block = NULL;
> >              qemu_mutex_unlock(&p->mutex);
> >  
> > @@ -1091,7 +1091,7 @@ static void *multifd_recv_thread(void *opaque)
> >              break;
> >          }
> >  
> > -        used = p->pages->used;
> > +        used = p->pages->num;
> >          flags = p->flags;
> >          /* recv methods don't know how to handle the SYNC flag */
> >          p->flags &= ~MULTIFD_FLAG_SYNC;
> > 
> 
> -- 
> Regards.
> Chuan
> 
-- 
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK


