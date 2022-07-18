Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CDDD578192
	for <lists+qemu-devel@lfdr.de>; Mon, 18 Jul 2022 14:06:11 +0200 (CEST)
Received: from localhost ([::1]:39854 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oDPVq-0008N3-PD
	for lists+qemu-devel@lfdr.de; Mon, 18 Jul 2022 08:06:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46902)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1oDPPv-0002Ra-Dm
 for qemu-devel@nongnu.org; Mon, 18 Jul 2022 08:00:04 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:22440)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1oDPPq-0006rn-7E
 for qemu-devel@nongnu.org; Mon, 18 Jul 2022 08:00:01 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1658145593;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=L/eP2dFEMhsJ/8XKYv1+c8YSN7UzCOi+3CCr1uqKb00=;
 b=AQfiOaqFdZME77g+jmTLqEQcuOY1RKcWWPdlnJ2B0Vf4DoZvGeL55wbWTuJytd/2Rago+M
 5tA0sbB7wZAN3IP4kqVjvP4FprmCLpwaWWfRBoSFs1Mkc0rqYB3nZ3zV2zmXUgQIynvoyO
 vvukEM1aHfvrfNH/XMDl2dqlJ7AYbjs=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-86-lEROYeNENZK00skKOy85SQ-1; Mon, 18 Jul 2022 07:59:46 -0400
X-MC-Unique: lEROYeNENZK00skKOy85SQ-1
Received: by mail-wm1-f72.google.com with SMTP id
 a18-20020a05600c225200b003a30355c0feso3871465wmm.6
 for <qemu-devel@nongnu.org>; Mon, 18 Jul 2022 04:59:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=L/eP2dFEMhsJ/8XKYv1+c8YSN7UzCOi+3CCr1uqKb00=;
 b=lUsq0UtG3ne5E9yol8NXg3rvpVTEILvm4P4fvEZc2uetiIWuBnUW3mLx2XozaT3D5V
 l7px9v15eBJ6DCAcZwQZMQhl/T8VUT6aPTwsF92RbkZz/45QwV8WjUTjrCc3FnAcmhqy
 oIE87xO7Rj6QG0XJSWEuzcmS9BkdNicUAaLGMvs/m7FE9aLrHpg30lFH0tOxf0kUUUef
 3iLcfIwWr+R+LoSePHVbYHSelyb6noQ/Ef80fwvRzQBh1FpTNTEkR0EQn68LbWOpUwLB
 0ED29UnmtPAXRcypcyxJKGsR5bJAovIA6dtOMxpmiIS9cChKH3TljWurJUj9ZRtkn2/T
 Oo7g==
X-Gm-Message-State: AJIora+lmKs4EwmT6GBn9kHnkxC5QIKH7cypHo9mQfIQYf4EBNTJrYrX
 LzQFCoO8vI7cJ0dZUTTrsZLQkw8Vkte33xjh9QOWkMtNO6nJ8uaHygfh4WLkraxDsC/t5hB4UCc
 Ypc2wvNciPVPdBvc=
X-Received: by 2002:a5d:5888:0:b0:21d:754b:7afb with SMTP id
 n8-20020a5d5888000000b0021d754b7afbmr22275473wrf.117.1658145584893; 
 Mon, 18 Jul 2022 04:59:44 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1urkW/jxq+xWe7mTfl+iujmTR8TXk5M+MSQpTaOZi5SUPWsYPHJuMBxtfZIEmQSxZFby9maAw==
X-Received: by 2002:a5d:5888:0:b0:21d:754b:7afb with SMTP id
 n8-20020a5d5888000000b0021d754b7afbmr22275451wrf.117.1658145584591; 
 Mon, 18 Jul 2022 04:59:44 -0700 (PDT)
Received: from work-vm (cpc109025-salf6-2-0-cust480.10-2.cable.virginm.net.
 [82.30.61.225]) by smtp.gmail.com with ESMTPSA id
 m17-20020a05600c3b1100b003976fbfbf00sm17752083wms.30.2022.07.18.04.59.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 18 Jul 2022 04:59:44 -0700 (PDT)
Date: Mon, 18 Jul 2022 12:59:41 +0100
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: Juan Quintela <quintela@redhat.com>
Cc: qemu-devel@nongnu.org, Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <f4bug@amsat.org>,
 Yanan Wang <wangyanan55@huawei.com>,
 Eduardo Habkost <eduardo@habkost.net>, Peter Xu <peterx@redhat.com>,
 Leonardo Bras <leobras@redhat.com>
Subject: Re: [PATCH v7 07/13] multifd: Make flags field thread local
Message-ID: <YtVLLY1qlIy6UxFg@work-vm>
References: <20220531104318.7494-1-quintela@redhat.com>
 <20220531104318.7494-8-quintela@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220531104318.7494-8-quintela@redhat.com>
User-Agent: Mutt/2.2.6 (2022-06-05)
Received-SPF: pass client-ip=170.10.133.124; envelope-from=dgilbert@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

* Juan Quintela (quintela@redhat.com) wrote:
> Use of flags with respect to locking was incensistant.  For the
> sending side:
> - it was set to 0 with mutex held on the multifd channel.
> - MULTIFD_FLAG_SYNC was set with mutex held on the migration thread.
> - Everything else was done without the mutex held on the multifd channel.
> 
> On the reception side, it is not used on the migration thread, only on
> the multifd channels threads.
> 
> So we move it to the multifd channels thread only variables, and we
> introduce a new bool sync_needed on the send side to pass that information.

Does this need rework after Leo's recent changes?

Dave

> Signed-off-by: Juan Quintela <quintela@redhat.com>
> ---
>  migration/multifd.h | 10 ++++++----
>  migration/multifd.c | 23 +++++++++++++----------
>  2 files changed, 19 insertions(+), 14 deletions(-)
> 
> diff --git a/migration/multifd.h b/migration/multifd.h
> index 8a45dda58c..af8ce8921d 100644
> --- a/migration/multifd.h
> +++ b/migration/multifd.h
> @@ -98,12 +98,12 @@ typedef struct {
>      bool running;
>      /* should this thread finish */
>      bool quit;
> -    /* multifd flags for each packet */
> -    uint32_t flags;
>      /* global number of generated multifd packets */
>      uint64_t packet_num;
>      /* How many bytes have we sent on the last packet */
>      uint64_t sent_bytes;
> +    /* Do we need to do an iteration sync */
> +    bool sync_needed;
>      /* thread has work to do */
>      int pending_job;
>      /* array of pages to sent.
> @@ -117,6 +117,8 @@ typedef struct {
>  
>      /* pointer to the packet */
>      MultiFDPacket_t *packet;
> +    /* multifd flags for each packet */
> +    uint32_t flags;
>      /* size of the next packet that contains pages */
>      uint32_t next_packet_size;
>      /* packets sent through this channel */
> @@ -163,8 +165,6 @@ typedef struct {
>      bool running;
>      /* should this thread finish */
>      bool quit;
> -    /* multifd flags for each packet */
> -    uint32_t flags;
>      /* global number of generated multifd packets */
>      uint64_t packet_num;
>  
> @@ -172,6 +172,8 @@ typedef struct {
>  
>      /* pointer to the packet */
>      MultiFDPacket_t *packet;
> +    /* multifd flags for each packet */
> +    uint32_t flags;
>      /* size of the next packet that contains pages */
>      uint32_t next_packet_size;
>      /* packets sent through this channel */
> diff --git a/migration/multifd.c b/migration/multifd.c
> index eef47c274f..69b9d7cf98 100644
> --- a/migration/multifd.c
> +++ b/migration/multifd.c
> @@ -602,7 +602,7 @@ int multifd_send_sync_main(QEMUFile *f)
>          }
>  
>          p->packet_num = multifd_send_state->packet_num++;
> -        p->flags |= MULTIFD_FLAG_SYNC;
> +        p->sync_needed = true;
>          p->pending_job++;
>          qemu_mutex_unlock(&p->mutex);
>          qemu_sem_post(&p->sem);
> @@ -656,7 +656,11 @@ static void *multifd_send_thread(void *opaque)
>  
>          if (p->pending_job) {
>              uint64_t packet_num = p->packet_num;
> -            uint32_t flags = p->flags;
> +            p->flags = 0;
> +            if (p->sync_needed) {
> +                p->flags |= MULTIFD_FLAG_SYNC;
> +                p->sync_needed = false;
> +            }
>              p->normal_num = 0;
>  
>              if (use_zero_copy_send) {
> @@ -678,14 +682,13 @@ static void *multifd_send_thread(void *opaque)
>                  }
>              }
>              multifd_send_fill_packet(p);
> -            p->flags = 0;
>              p->num_packets++;
>              p->total_normal_pages += p->normal_num;
>              p->pages->num = 0;
>              p->pages->block = NULL;
>              qemu_mutex_unlock(&p->mutex);
>  
> -            trace_multifd_send(p->id, packet_num, p->normal_num, flags,
> +            trace_multifd_send(p->id, packet_num, p->normal_num, p->flags,
>                                 p->next_packet_size);
>  
>              if (use_zero_copy_send) {
> @@ -713,7 +716,7 @@ static void *multifd_send_thread(void *opaque)
>              p->pending_job--;
>              qemu_mutex_unlock(&p->mutex);
>  
> -            if (flags & MULTIFD_FLAG_SYNC) {
> +            if (p->flags & MULTIFD_FLAG_SYNC) {
>                  qemu_sem_post(&p->sem_sync);
>              }
>              qemu_sem_post(&multifd_send_state->channels_ready);
> @@ -1090,7 +1093,7 @@ static void *multifd_recv_thread(void *opaque)
>      rcu_register_thread();
>  
>      while (true) {
> -        uint32_t flags;
> +        bool sync_needed = false;
>  
>          if (p->quit) {
>              break;
> @@ -1112,11 +1115,11 @@ static void *multifd_recv_thread(void *opaque)
>              break;
>          }
>  
> -        flags = p->flags;
> +        trace_multifd_recv(p->id, p->packet_num, p->normal_num, p->flags,
> +                           p->next_packet_size);
> +        sync_needed = p->flags & MULTIFD_FLAG_SYNC;
>          /* recv methods don't know how to handle the SYNC flag */
>          p->flags &= ~MULTIFD_FLAG_SYNC;
> -        trace_multifd_recv(p->id, p->packet_num, p->normal_num, flags,
> -                           p->next_packet_size);
>          p->num_packets++;
>          p->total_normal_pages += p->normal_num;
>          qemu_mutex_unlock(&p->mutex);
> @@ -1128,7 +1131,7 @@ static void *multifd_recv_thread(void *opaque)
>              }
>          }
>  
> -        if (flags & MULTIFD_FLAG_SYNC) {
> +        if (sync_needed) {
>              qemu_sem_post(&multifd_recv_state->sem_sync);
>              qemu_sem_wait(&p->sem_sync);
>          }
> -- 
> 2.35.3
> 
-- 
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK


