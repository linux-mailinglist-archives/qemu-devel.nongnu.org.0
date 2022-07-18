Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E8F44578818
	for <lists+qemu-devel@lfdr.de>; Mon, 18 Jul 2022 19:06:34 +0200 (CEST)
Received: from localhost ([::1]:48234 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oDUCX-0007lU-I9
	for lists+qemu-devel@lfdr.de; Mon, 18 Jul 2022 13:06:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39016)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1oDU9b-0004XN-Ru
 for qemu-devel@nongnu.org; Mon, 18 Jul 2022 13:03:31 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:22592)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1oDU9X-00076G-Jm
 for qemu-devel@nongnu.org; Mon, 18 Jul 2022 13:03:30 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1658163806;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=A2URN/C3IKqzrFaAo4mtJ59cC/J/um45zZJlP776PU4=;
 b=ijHjNCyqm8JCRSnPyeyaoWO0b3m6AGXTg2bMrUg9sh/F9YbepCpmxcTN52ziV5Y7LIyU+0
 al85AguqVAqqNeMtywdkdUI7fFSKUniOfaN+hHztKKK184KWD5QtWFxPahOXW+exHxs22f
 s9UHhj7V7qMo7o+n1g62rN8PoEGplgI=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-197-Dk8QJtMpOKK3vVXwW9BvQg-1; Mon, 18 Jul 2022 13:03:25 -0400
X-MC-Unique: Dk8QJtMpOKK3vVXwW9BvQg-1
Received: by mail-wr1-f71.google.com with SMTP id
 v23-20020adfa1d7000000b0021d620f5ef3so2124813wrv.16
 for <qemu-devel@nongnu.org>; Mon, 18 Jul 2022 10:03:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=A2URN/C3IKqzrFaAo4mtJ59cC/J/um45zZJlP776PU4=;
 b=G0I6am4Nv6vNuhDvEDQ/IuW5T92je7PpG9eV45RO30t6lHoAHQmZSYU6OIMJMCSb+l
 TVMtgZtUnjSwdUigS0C+HQ2BAcz2//KlB+95uyoIYiZIzRiWs/f5Qcd18e83JNmRMBn+
 QH28RN7Bo70bm3Dd8d3JR8lTe3JwmQLPcndyNd3okzR3vNh9zJB357d5bH2IRhwPSkW4
 fJ7mCL/2KHCS1J07CiTTxADOlRrE4kXkmfYm62bw+LlcfyeGwJYY2tAF6m9GD/oJjMgQ
 RG9REUrGVBsaYOXskuMil10h6Rm/rc9K6FPXNX2Fwm5OwRx4NUJ3wVg2MqF9bpWQRfVO
 aRdA==
X-Gm-Message-State: AJIora/iMb/JilDNKUqw08qYsa4r1AznZItJucsM49mtgvNwe33by+Dq
 W99ysbFoPs9tqws789o5gI/a/lIGon2A2ai13GyIx5dy76UropXguxMvbzLpfPvmLpC9dlVCoLw
 uMbg7XGVEtqx2Gow=
X-Received: by 2002:a05:6000:1a4e:b0:21d:9451:67ec with SMTP id
 t14-20020a0560001a4e00b0021d945167ecmr23837884wry.279.1658163804015; 
 Mon, 18 Jul 2022 10:03:24 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1uxGezYcN25Yy6e2DKYs1ytFfCYjeSQMxaRVcThKZ07aKIvF09PEEcuqHNmHty+xz9YppT6zA==
X-Received: by 2002:a05:6000:1a4e:b0:21d:9451:67ec with SMTP id
 t14-20020a0560001a4e00b0021d945167ecmr23837865wry.279.1658163803729; 
 Mon, 18 Jul 2022 10:03:23 -0700 (PDT)
Received: from work-vm (cpc109025-salf6-2-0-cust480.10-2.cable.virginm.net.
 [82.30.61.225]) by smtp.gmail.com with ESMTPSA id
 k15-20020a7bc30f000000b0039c54bb28f2sm15848500wmj.36.2022.07.18.10.03.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 18 Jul 2022 10:03:23 -0700 (PDT)
Date: Mon, 18 Jul 2022 18:03:20 +0100
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: Juan Quintela <quintela@redhat.com>
Cc: qemu-devel@nongnu.org, Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <f4bug@amsat.org>,
 Yanan Wang <wangyanan55@huawei.com>,
 Eduardo Habkost <eduardo@habkost.net>, Peter Xu <peterx@redhat.com>,
 Leonardo Bras <leobras@redhat.com>
Subject: Re: [PATCH v7 11/13] multifd: Support for zero pages transmission
Message-ID: <YtWSWDKRP1C9baHx@work-vm>
References: <20220531104318.7494-1-quintela@redhat.com>
 <20220531104318.7494-12-quintela@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220531104318.7494-12-quintela@redhat.com>
User-Agent: Mutt/2.2.6 (2022-06-05)
Received-SPF: pass client-ip=170.10.129.124; envelope-from=dgilbert@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

* Juan Quintela (quintela@redhat.com) wrote:
> This patch adds counters and similar.  Logic will be added on the
> following patch.

Yeh, I think so; the duplicate becing the counter for zero pages still
throws me.


Reviewed-by: Dr. David Alan Gilbert <dgilbert@redhat.com>

> Signed-off-by: Juan Quintela <quintela@redhat.com>
> 
> ---
> 
> Added counters for duplicated/non duplicated pages.
> Removed reviewed by from David.
> Add total_zero_pages
> ---
>  migration/multifd.h    | 17 ++++++++++++++++-
>  migration/multifd.c    | 36 +++++++++++++++++++++++++++++-------
>  migration/ram.c        |  2 --
>  migration/trace-events |  8 ++++----
>  4 files changed, 49 insertions(+), 14 deletions(-)
> 
> diff --git a/migration/multifd.h b/migration/multifd.h
> index d48597a1ea..c36d7ff876 100644
> --- a/migration/multifd.h
> +++ b/migration/multifd.h
> @@ -47,7 +47,10 @@ typedef struct {
>      /* size of the next packet that contains pages */
>      uint32_t next_packet_size;
>      uint64_t packet_num;
> -    uint64_t unused[4];    /* Reserved for future use */
> +    /* zero pages */
> +    uint32_t zero_pages;
> +    uint32_t unused32[1];    /* Reserved for future use */
> +    uint64_t unused64[3];    /* Reserved for future use */
>      char ramblock[256];
>      uint64_t offset[];
>  } __attribute__((packed)) MultiFDPacket_t;
> @@ -127,6 +130,8 @@ typedef struct {
>      uint64_t num_packets;
>      /* non zero pages sent through this channel */
>      uint64_t total_normal_pages;
> +    /* zero pages sent through this channel */
> +    uint64_t total_zero_pages;
>      /* buffers to send */
>      struct iovec *iov;
>      /* number of iovs used */
> @@ -135,6 +140,10 @@ typedef struct {
>      ram_addr_t *normal;
>      /* num of non zero pages */
>      uint32_t normal_num;
> +    /* Pages that are  zero */
> +    ram_addr_t *zero;
> +    /* num of zero pages */
> +    uint32_t zero_num;
>      /* used for compression methods */
>      void *data;
>  }  MultiFDSendParams;
> @@ -184,12 +193,18 @@ typedef struct {
>      uint8_t *host;
>      /* non zero pages recv through this channel */
>      uint64_t total_normal_pages;
> +    /* zero pages recv through this channel */
> +    uint64_t total_zero_pages;
>      /* buffers to recv */
>      struct iovec *iov;
>      /* Pages that are not zero */
>      ram_addr_t *normal;
>      /* num of non zero pages */
>      uint32_t normal_num;
> +    /* Pages that are  zero */
> +    ram_addr_t *zero;
> +    /* num of zero pages */
> +    uint32_t zero_num;
>      /* used for de-compression methods */
>      void *data;
>  } MultiFDRecvParams;
> diff --git a/migration/multifd.c b/migration/multifd.c
> index 056599cbaf..0f7c27c08e 100644
> --- a/migration/multifd.c
> +++ b/migration/multifd.c
> @@ -263,6 +263,7 @@ static void multifd_send_fill_packet(MultiFDSendParams *p)
>      packet->normal_pages = cpu_to_be32(p->normal_num);
>      packet->next_packet_size = cpu_to_be32(p->next_packet_size);
>      packet->packet_num = cpu_to_be64(p->packet_num);
> +    packet->zero_pages = cpu_to_be32(p->zero_num);
>  
>      if (p->pages->block) {
>          strncpy(packet->ramblock, p->pages->block->idstr, 256);
> @@ -323,7 +324,15 @@ static int multifd_recv_unfill_packet(MultiFDRecvParams *p, Error **errp)
>      p->next_packet_size = be32_to_cpu(packet->next_packet_size);
>      p->packet_num = be64_to_cpu(packet->packet_num);
>  
> -    if (p->normal_num == 0) {
> +    p->zero_num = be32_to_cpu(packet->zero_pages);
> +    if (p->zero_num > packet->pages_alloc - p->normal_num) {
> +        error_setg(errp, "multifd: received packet "
> +                   "with %u zero pages and expected maximum pages are %u",
> +                   p->zero_num, packet->pages_alloc - p->normal_num) ;
> +        return -1;
> +    }
> +
> +    if (p->normal_num == 0 && p->zero_num == 0) {
>          return 0;
>      }
>  
> @@ -432,6 +441,8 @@ static int multifd_send_pages(QEMUFile *f)
>      ram_counters.multifd_bytes += p->sent_bytes;
>      qemu_file_update_transfer(f, p->sent_bytes);
>      p->sent_bytes = 0;
> +    ram_counters.normal += p->normal_num;
> +    ram_counters.duplicate += p->zero_num;
>      qemu_mutex_unlock(&p->mutex);
>      qemu_sem_post(&p->sem);
>  
> @@ -545,6 +556,8 @@ void multifd_save_cleanup(void)
>          p->iov = NULL;
>          g_free(p->normal);
>          p->normal = NULL;
> +        g_free(p->zero);
> +        p->zero = NULL;
>          multifd_send_state->ops->send_cleanup(p, &local_err);
>          if (local_err) {
>              migrate_set_error(migrate_get_current(), local_err);
> @@ -664,6 +677,7 @@ static void *multifd_send_thread(void *opaque)
>              qemu_mutex_unlock(&p->mutex);
>  
>              p->normal_num = 0;
> +            p->zero_num = 0;
>  
>              if (use_zero_copy_send) {
>                  p->iovs_num = 0;
> @@ -685,8 +699,8 @@ static void *multifd_send_thread(void *opaque)
>              }
>              multifd_send_fill_packet(p);
>  
> -            trace_multifd_send(p->id, packet_num, p->normal_num, p->flags,
> -                               p->next_packet_size);
> +            trace_multifd_send(p->id, packet_num, p->normal_num, p->zero_num,
> +                               p->flags, p->next_packet_size);
>  
>              if (use_zero_copy_send) {
>                  /* Send header first, without zerocopy */
> @@ -710,6 +724,7 @@ static void *multifd_send_thread(void *opaque)
>              qemu_mutex_lock(&p->mutex);
>              p->num_packets++;
>              p->total_normal_pages += p->normal_num;
> +            p->total_zero_pages += p->zero_num;
>              p->pages->num = 0;
>              p->pages->block = NULL;
>              p->sent_bytes += p->packet_len;;
> @@ -751,7 +766,8 @@ out:
>      qemu_mutex_unlock(&p->mutex);
>  
>      rcu_unregister_thread();
> -    trace_multifd_send_thread_end(p->id, p->num_packets, p->total_normal_pages);
> +    trace_multifd_send_thread_end(p->id, p->num_packets, p->total_normal_pages,
> +                                  p->total_zero_pages);
>  
>      return NULL;
>  }
> @@ -938,6 +954,7 @@ int multifd_save_setup(Error **errp)
>          p->normal = g_new0(ram_addr_t, page_count);
>          p->page_size = qemu_target_page_size();
>          p->page_count = page_count;
> +        p->zero = g_new0(ram_addr_t, page_count);
>  
>          if (migrate_use_zero_copy_send()) {
>              p->write_flags = QIO_CHANNEL_WRITE_FLAG_ZERO_COPY;
> @@ -1046,6 +1063,8 @@ int multifd_load_cleanup(Error **errp)
>          p->iov = NULL;
>          g_free(p->normal);
>          p->normal = NULL;
> +        g_free(p->zero);
> +        p->zero = NULL;
>          multifd_recv_state->ops->recv_cleanup(p);
>      }
>      qemu_sem_destroy(&multifd_recv_state->sem_sync);
> @@ -1116,13 +1135,14 @@ static void *multifd_recv_thread(void *opaque)
>              break;
>          }
>  
> -        trace_multifd_recv(p->id, p->packet_num, p->normal_num, p->flags,
> -                           p->next_packet_size);
> +        trace_multifd_recv(p->id, p->packet_num, p->normal_num, p->zero_num,
> +                           p->flags, p->next_packet_size);
>          sync_needed = p->flags & MULTIFD_FLAG_SYNC;
>          /* recv methods don't know how to handle the SYNC flag */
>          p->flags &= ~MULTIFD_FLAG_SYNC;
>          p->num_packets++;
>          p->total_normal_pages += p->normal_num;
> +        p->total_normal_pages += p->zero_num;
>          qemu_mutex_unlock(&p->mutex);
>  
>          if (p->normal_num) {
> @@ -1147,7 +1167,8 @@ static void *multifd_recv_thread(void *opaque)
>      qemu_mutex_unlock(&p->mutex);
>  
>      rcu_unregister_thread();
> -    trace_multifd_recv_thread_end(p->id, p->num_packets, p->total_normal_pages);
> +    trace_multifd_recv_thread_end(p->id, p->num_packets, p->total_normal_pages,
> +                                  p->total_zero_pages);
>  
>      return NULL;
>  }
> @@ -1187,6 +1208,7 @@ int multifd_load_setup(Error **errp)
>          p->normal = g_new0(ram_addr_t, page_count);
>          p->page_count = page_count;
>          p->page_size = qemu_target_page_size();
> +        p->zero = g_new0(ram_addr_t, page_count);
>      }
>  
>      for (i = 0; i < thread_count; i++) {
> diff --git a/migration/ram.c b/migration/ram.c
> index 3b2af07341..7ceef7976b 100644
> --- a/migration/ram.c
> +++ b/migration/ram.c
> @@ -1356,8 +1356,6 @@ static int ram_save_multifd_page(RAMState *rs, RAMBlock *block,
>      if (multifd_queue_page(rs->f, block, offset) < 0) {
>          return -1;
>      }
> -    ram_counters.normal++;
> -
>      return 1;
>  }
>  
> diff --git a/migration/trace-events b/migration/trace-events
> index 1aec580e92..d70e89dbb9 100644
> --- a/migration/trace-events
> +++ b/migration/trace-events
> @@ -114,21 +114,21 @@ unqueue_page(char *block, uint64_t offset, bool dirty) "ramblock '%s' offset 0x%
>  
>  # multifd.c
>  multifd_new_send_channel_async(uint8_t id) "channel %u"
> -multifd_recv(uint8_t id, uint64_t packet_num, uint32_t used, uint32_t flags, uint32_t next_packet_size) "channel %u packet_num %" PRIu64 " pages %u flags 0x%x next packet size %u"
> +multifd_recv(uint8_t id, uint64_t packet_num, uint32_t normal, uint32_t zero, uint32_t flags, uint32_t next_packet_size) "channel %u packet_num %" PRIu64 " normal pages %u zero pages %u flags 0x%x next packet size %u"
>  multifd_recv_new_channel(uint8_t id) "channel %u"
>  multifd_recv_sync_main(long packet_num) "packet num %ld"
>  multifd_recv_sync_main_signal(uint8_t id) "channel %u"
>  multifd_recv_sync_main_wait(uint8_t id) "channel %u"
>  multifd_recv_terminate_threads(bool error) "error %d"
> -multifd_recv_thread_end(uint8_t id, uint64_t packets, uint64_t pages) "channel %u packets %" PRIu64 " pages %" PRIu64
> +multifd_recv_thread_end(uint8_t id, uint64_t packets, uint64_t normal_pages, uint64_t zero_pages) "channel %u packets %" PRIu64 " normal pages %" PRIu64 " zero pages %" PRIu64
>  multifd_recv_thread_start(uint8_t id) "%u"
> -multifd_send(uint8_t id, uint64_t packet_num, uint32_t normal, uint32_t flags, uint32_t next_packet_size) "channel %u packet_num %" PRIu64 " normal pages %u flags 0x%x next packet size %u"
> +multifd_send(uint8_t id, uint64_t packet_num, uint32_t normalpages, uint32_t zero_pages, uint32_t flags, uint32_t next_packet_size) "channel %u packet_num %" PRIu64 " normal pages %u zero pages %u flags 0x%x next packet size %u"
>  multifd_send_error(uint8_t id) "channel %u"
>  multifd_send_sync_main(long packet_num) "packet num %ld"
>  multifd_send_sync_main_signal(uint8_t id) "channel %u"
>  multifd_send_sync_main_wait(uint8_t id) "channel %u"
>  multifd_send_terminate_threads(bool error) "error %d"
> -multifd_send_thread_end(uint8_t id, uint64_t packets, uint64_t normal_pages) "channel %u packets %" PRIu64 " normal pages %"  PRIu64
> +multifd_send_thread_end(uint8_t id, uint64_t packets, uint64_t normal_pages, uint64_t zero_pages) "channel %u packets %" PRIu64 " normal pages %"  PRIu64 " zero pages %"  PRIu64
>  multifd_send_thread_start(uint8_t id) "%u"
>  multifd_tls_outgoing_handshake_start(void *ioc, void *tioc, const char *hostname) "ioc=%p tioc=%p hostname=%s"
>  multifd_tls_outgoing_handshake_error(void *ioc, const char *err) "ioc=%p err=%s"
> -- 
> 2.35.3
> 
-- 
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK


