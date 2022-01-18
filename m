Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 74BAF492CF7
	for <lists+qemu-devel@lfdr.de>; Tue, 18 Jan 2022 19:08:18 +0100 (CET)
Received: from localhost ([::1]:36508 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n9su1-0000nG-AZ
	for lists+qemu-devel@lfdr.de; Tue, 18 Jan 2022 13:08:17 -0500
Received: from eggs.gnu.org ([209.51.188.92]:36078)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1n9sjI-0008B7-9K
 for qemu-devel@nongnu.org; Tue, 18 Jan 2022 12:57:12 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:28661)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1n9sjD-0003PT-IX
 for qemu-devel@nongnu.org; Tue, 18 Jan 2022 12:57:10 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1642528625;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=1agRHYCFjPFFtxWvVUTKBpttTCdlsGiH0RhH6m/42Mo=;
 b=BkASlQ7/RXB0qvv8lKlPUIE6XvLF17dxvG5MQ1uINVN+ReIXHiq/KANDB4Qm3pkUtXnKG1
 CZFPu+uOagujXRHCO6+QWzMI+1uUPCewFnPKrpsWIaHUgTU30P+IeLaxxZGY4hyhLlA1CX
 SfWQ7FrYwb2otHj8P7a299wAWXgQ3bE=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-631-DhwOv2QeNHSvMWXIkVMrVA-1; Tue, 18 Jan 2022 12:57:04 -0500
X-MC-Unique: DhwOv2QeNHSvMWXIkVMrVA-1
Received: by mail-wm1-f72.google.com with SMTP id
 14-20020a05600c024e00b0034a83f7391aso10551wmj.4
 for <qemu-devel@nongnu.org>; Tue, 18 Jan 2022 09:57:04 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=1agRHYCFjPFFtxWvVUTKBpttTCdlsGiH0RhH6m/42Mo=;
 b=LxU9bbuV5i+qNHmEdwEaHbrTofKcq4unFPNbt/zZwF/5Dpy05wiRE04uUXxDZS/+g+
 FuCWGrRK/Xuavj+b6nbgQVfA7DRD29lbonMjOpLHAN1CjTeLkydWTCZfE4LFmitdpvLO
 KhXaXSxM170s0Fc7quUXEUS2gmGg9aRxX5Gh+w4mlG+YbBG+Rvu17t16iTFg4RV0iJho
 R2YDum3/R8ZWv9W0u06RYzwupwf90R1906ZbS7Lyq3rEYb5sd2oKghq+mQa2W52aJrbp
 PtrCEsyR7z7G8qbOrJGRRK7G5lt0t4R4wqDhNjSxfUahMcCMWaQm6o7TUdRW4Td6ikYm
 se7Q==
X-Gm-Message-State: AOAM533urawXraG+YqgRnzCUWa9Y/+Kq+jg5Gwzp0mMqtMFascBBBikg
 rlv8n6aBVTo24mKIBi7Y0AQ14bQo6WIsQGgEU8pxEgJpSxBmwZaq7FqiAdA9ZBVGO4WJ7FGY2Xk
 HuK7cpGhU6FJH5S0=
X-Received: by 2002:adf:b60d:: with SMTP id f13mr14748401wre.225.1642528621755; 
 Tue, 18 Jan 2022 09:57:01 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwprx8PWKnP2kvmHVM2JzLo6gCU+AKaHQbHzVvGR2xXd40SPcvXhXHW5aDVH74TWbYNdI7R7Q==
X-Received: by 2002:adf:b60d:: with SMTP id f13mr14748379wre.225.1642528621489; 
 Tue, 18 Jan 2022 09:57:01 -0800 (PST)
Received: from work-vm (82-132-236-232.dab.02.net. [82.132.236.232])
 by smtp.gmail.com with ESMTPSA id h5sm17213492wrq.44.2022.01.18.09.57.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 18 Jan 2022 09:57:00 -0800 (PST)
Date: Tue, 18 Jan 2022 17:56:57 +0000
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: Juan Quintela <quintela@redhat.com>
Subject: Re: [PATCH v4 08/23] multifd: Move iov from pages to params
Message-ID: <Yeb/aaVGA+gphb/q@work-vm>
References: <20220111130024.5392-1-quintela@redhat.com>
 <20220111130024.5392-9-quintela@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20220111130024.5392-9-quintela@redhat.com>
User-Agent: Mutt/2.1.5 (2021-12-30)
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
Cc: Eduardo Habkost <eduardo@habkost.net>, qemu-devel@nongnu.org,
 Peter Xu <peterx@redhat.com>,
 Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <f4bug@amsat.org>,
 Yanan Wang <wangyanan55@huawei.com>, Leonardo Bras <leobras@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

* Juan Quintela (quintela@redhat.com) wrote:
> This will allow us to reduce the number of system calls on the next patch.
> 
> Signed-off-by: Juan Quintela <quintela@redhat.com>
> ---
>  migration/multifd.h |  8 ++++++--
>  migration/multifd.c | 34 ++++++++++++++++++++++++----------
>  2 files changed, 30 insertions(+), 12 deletions(-)
> 
> diff --git a/migration/multifd.h b/migration/multifd.h
> index e57adc783b..c3f18af364 100644
> --- a/migration/multifd.h
> +++ b/migration/multifd.h
> @@ -62,8 +62,6 @@ typedef struct {
>      uint64_t packet_num;
>      /* offset of each page */
>      ram_addr_t *offset;
> -    /* pointer to each page */
> -    struct iovec *iov;
>      RAMBlock *block;
>  } MultiFDPages_t;
>  
> @@ -110,6 +108,10 @@ typedef struct {
>      uint64_t num_pages;
>      /* syncs main thread and channels */
>      QemuSemaphore sem_sync;
> +    /* buffers to send */
> +    struct iovec *iov;
> +    /* number of iovs used */
> +    uint32_t iovs_num;
>      /* used for compression methods */
>      void *data;
>  }  MultiFDSendParams;
> @@ -149,6 +151,8 @@ typedef struct {
>      uint64_t num_pages;
>      /* syncs main thread and channels */
>      QemuSemaphore sem_sync;
> +    /* buffers to recv */
> +    struct iovec *iov;

Why is there the asymmetry between send and recv, where the send
has the iovs_num and the recv doesn't?

Dave

>      /* used for de-compression methods */
>      void *data;
>  } MultiFDRecvParams;
> diff --git a/migration/multifd.c b/migration/multifd.c
> index 4d62850258..f75bd3c188 100644
> --- a/migration/multifd.c
> +++ b/migration/multifd.c
> @@ -86,7 +86,16 @@ static void nocomp_send_cleanup(MultiFDSendParams *p, Error **errp)
>   */
>  static int nocomp_send_prepare(MultiFDSendParams *p, Error **errp)
>  {
> -    p->next_packet_size = p->pages->num * qemu_target_page_size();
> +    MultiFDPages_t *pages = p->pages;
> +    size_t page_size = qemu_target_page_size();
> +
> +    for (int i = 0; i < p->pages->num; i++) {
> +        p->iov[p->iovs_num].iov_base = pages->block->host + pages->offset[i];
> +        p->iov[p->iovs_num].iov_len = page_size;
> +        p->iovs_num++;
> +    }
> +
> +    p->next_packet_size = p->pages->num * page_size;
>      p->flags |= MULTIFD_FLAG_NOCOMP;
>      return 0;
>  }
> @@ -104,7 +113,7 @@ static int nocomp_send_prepare(MultiFDSendParams *p, Error **errp)
>   */
>  static int nocomp_send_write(MultiFDSendParams *p, uint32_t used, Error **errp)
>  {
> -    return qio_channel_writev_all(p->c, p->pages->iov, used, errp);
> +    return qio_channel_writev_all(p->c, p->iov, p->iovs_num, errp);
>  }
>  
>  /**
> @@ -146,13 +155,18 @@ static void nocomp_recv_cleanup(MultiFDRecvParams *p)
>  static int nocomp_recv_pages(MultiFDRecvParams *p, Error **errp)
>  {
>      uint32_t flags = p->flags & MULTIFD_FLAG_COMPRESSION_MASK;
> +    size_t page_size = qemu_target_page_size();
>  
>      if (flags != MULTIFD_FLAG_NOCOMP) {
>          error_setg(errp, "multifd %u: flags received %x flags expected %x",
>                     p->id, flags, MULTIFD_FLAG_NOCOMP);
>          return -1;
>      }
> -    return qio_channel_readv_all(p->c, p->pages->iov, p->pages->num, errp);
> +    for (int i = 0; i < p->pages->num; i++) {
> +        p->iov[i].iov_base = p->pages->block->host + p->pages->offset[i];
> +        p->iov[i].iov_len = page_size;
> +    }
> +    return qio_channel_readv_all(p->c, p->iov, p->pages->num, errp);
>  }
>  
>  static MultiFDMethods multifd_nocomp_ops = {
> @@ -242,7 +256,6 @@ static MultiFDPages_t *multifd_pages_init(size_t size)
>      MultiFDPages_t *pages = g_new0(MultiFDPages_t, 1);
>  
>      pages->allocated = size;
> -    pages->iov = g_new0(struct iovec, size);
>      pages->offset = g_new0(ram_addr_t, size);
>  
>      return pages;
> @@ -254,8 +267,6 @@ static void multifd_pages_clear(MultiFDPages_t *pages)
>      pages->allocated = 0;
>      pages->packet_num = 0;
>      pages->block = NULL;
> -    g_free(pages->iov);
> -    pages->iov = NULL;
>      g_free(pages->offset);
>      pages->offset = NULL;
>      g_free(pages);
> @@ -365,8 +376,6 @@ static int multifd_recv_unfill_packet(MultiFDRecvParams *p, Error **errp)
>              return -1;
>          }
>          p->pages->offset[i] = offset;
> -        p->pages->iov[i].iov_base = block->host + offset;
> -        p->pages->iov[i].iov_len = page_size;
>      }
>  
>      return 0;
> @@ -470,8 +479,6 @@ int multifd_queue_page(QEMUFile *f, RAMBlock *block, ram_addr_t offset)
>  
>      if (pages->block == block) {
>          pages->offset[pages->num] = offset;
> -        pages->iov[pages->num].iov_base = block->host + offset;
> -        pages->iov[pages->num].iov_len = qemu_target_page_size();
>          pages->num++;
>  
>          if (pages->num < pages->allocated) {
> @@ -567,6 +574,8 @@ void multifd_save_cleanup(void)
>          p->packet_len = 0;
>          g_free(p->packet);
>          p->packet = NULL;
> +        g_free(p->iov);
> +        p->iov = NULL;
>          multifd_send_state->ops->send_cleanup(p, &local_err);
>          if (local_err) {
>              migrate_set_error(migrate_get_current(), local_err);
> @@ -654,6 +663,7 @@ static void *multifd_send_thread(void *opaque)
>              uint32_t used = p->pages->num;
>              uint64_t packet_num = p->packet_num;
>              uint32_t flags = p->flags;
> +            p->iovs_num = 0;
>  
>              if (used) {
>                  ret = multifd_send_state->ops->send_prepare(p, &local_err);
> @@ -922,6 +932,7 @@ int multifd_save_setup(Error **errp)
>          p->packet->version = cpu_to_be32(MULTIFD_VERSION);
>          p->name = g_strdup_printf("multifdsend_%d", i);
>          p->tls_hostname = g_strdup(s->hostname);
> +        p->iov = g_new0(struct iovec, page_count);
>          socket_send_channel_create(multifd_new_send_channel_async, p);
>      }
>  
> @@ -1021,6 +1032,8 @@ int multifd_load_cleanup(Error **errp)
>          p->packet_len = 0;
>          g_free(p->packet);
>          p->packet = NULL;
> +        g_free(p->iov);
> +        p->iov = NULL;
>          multifd_recv_state->ops->recv_cleanup(p);
>      }
>      qemu_sem_destroy(&multifd_recv_state->sem_sync);
> @@ -1161,6 +1174,7 @@ int multifd_load_setup(Error **errp)
>                        + sizeof(uint64_t) * page_count;
>          p->packet = g_malloc0(p->packet_len);
>          p->name = g_strdup_printf("multifdrecv_%d", i);
> +        p->iov = g_new0(struct iovec, page_count);
>      }
>  
>      for (i = 0; i < thread_count; i++) {
> -- 
> 2.34.1
> 
-- 
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK


