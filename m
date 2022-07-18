Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1407F5783A1
	for <lists+qemu-devel@lfdr.de>; Mon, 18 Jul 2022 15:23:30 +0200 (CEST)
Received: from localhost ([::1]:44062 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oDQie-0000Xv-US
	for lists+qemu-devel@lfdr.de; Mon, 18 Jul 2022 09:23:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40912)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1oDQfA-0003zO-Ey
 for qemu-devel@nongnu.org; Mon, 18 Jul 2022 09:19:52 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:29086)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1oDQf5-0004Vi-KG
 for qemu-devel@nongnu.org; Mon, 18 Jul 2022 09:19:51 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1658150386;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=cck6j31a6GGnAXgUvWla4Fd9yefj64wD7oLzM0kCxNw=;
 b=S5C5p17YgVb+6SmJTyX8YsP3nkHJC/C1mnBM9xEL6h91iAATg69U0yhMo29UiXuc7Hmkh/
 /pngzJqdWdCDsV1jO12ifv0Ohr4b/geCZD7sAMwFOVsewq4AsiyJTfhlsTUK4dU/6b7EtH
 cS8P0EZwYHadJw/WtR5cIznBwm/RYUo=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-60-i2Cmf3YNOnyByhHC0VoSvg-1; Mon, 18 Jul 2022 09:19:45 -0400
X-MC-Unique: i2Cmf3YNOnyByhHC0VoSvg-1
Received: by mail-wm1-f71.google.com with SMTP id
 v11-20020a1cf70b000000b003a318238826so1421402wmh.2
 for <qemu-devel@nongnu.org>; Mon, 18 Jul 2022 06:19:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=cck6j31a6GGnAXgUvWla4Fd9yefj64wD7oLzM0kCxNw=;
 b=i3iIXlP0DFnSjsbJKFOZ2N+Cwpu7ZamzT3LYaMaQMUk0ilQfqOYJ3OziqgLLemKuEO
 o9mOxom6j8wG1BE1/xzJLGSGOM3CoeaV3udP2vDU+4u7FwbHLKwoKH7YDgtMO8SY6RNL
 3uh8mmIPAWQ7vi5xSXl2Cy9OD8r0fzhWgk+hrj9MPj6JYkhWF+DiOR7MRPlyvhpYku4F
 2fIfvMpm9wQ1Yii4V8F1OwR6PWAIi8ByKPU/XMVyvj3GVHvWAfHs8GjJOrxLwXvLr+b0
 51Bg6Z7zRZ2WJZL19PyWQwrueHQLwnn0MfaOU3xiJYhLvppU8LRWBLab9F5tPDr5ucVC
 hb+A==
X-Gm-Message-State: AJIora/8mdIgdEX0E9rNgSKVp9GFeXI7ko6IsLvKYPEh3v9JcZLZwEek
 ffB71M9hhMso5wzFpUEPo4Zmwcbek51N7brPDW4FdNYZ8ZBj6iD9Os0HsbTRz3gtvhKcwkzNsya
 VLdTXpIJi7zQ6PQ8=
X-Received: by 2002:a05:600c:3ca2:b0:3a0:1825:2e6b with SMTP id
 bg34-20020a05600c3ca200b003a018252e6bmr31699929wmb.132.1658150384160; 
 Mon, 18 Jul 2022 06:19:44 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1vzZKvfQjPgWXvG7dsvBlwRjU9Qsu24T3raSm9TQcwV4H+Xn/j/yLmskK0gH68gKmaFgxG7Fg==
X-Received: by 2002:a05:600c:3ca2:b0:3a0:1825:2e6b with SMTP id
 bg34-20020a05600c3ca200b003a018252e6bmr31699910wmb.132.1658150383937; 
 Mon, 18 Jul 2022 06:19:43 -0700 (PDT)
Received: from work-vm (cpc109025-salf6-2-0-cust480.10-2.cable.virginm.net.
 [82.30.61.225]) by smtp.gmail.com with ESMTPSA id
 m9-20020a056000180900b0021d6a520ce9sm10909790wrh.47.2022.07.18.06.19.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 18 Jul 2022 06:19:43 -0700 (PDT)
Date: Mon, 18 Jul 2022 14:19:41 +0100
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: Juan Quintela <quintela@redhat.com>
Cc: qemu-devel@nongnu.org, Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <f4bug@amsat.org>,
 Yanan Wang <wangyanan55@huawei.com>,
 Eduardo Habkost <eduardo@habkost.net>, Peter Xu <peterx@redhat.com>,
 Leonardo Bras <leobras@redhat.com>
Subject: Re: [PATCH v7 12/13] multifd: Zero pages transmission
Message-ID: <YtVd7fRQHot3rQwA@work-vm>
References: <20220531104318.7494-1-quintela@redhat.com>
 <20220531104318.7494-13-quintela@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220531104318.7494-13-quintela@redhat.com>
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
> This implements the zero page dection and handling.
> 
> Signed-off-by: Juan Quintela <quintela@redhat.com>

Reviewed-by: Dr. David Alan Gilbert <dgilbert@redhat.com>

> 
> ---
> 
> Add comment for offset (dave)
> Use local variables for offset/block to have shorter lines
> ---
>  migration/multifd.h |  5 +++++
>  migration/multifd.c | 41 +++++++++++++++++++++++++++++++++++++++--
>  2 files changed, 44 insertions(+), 2 deletions(-)
> 
> diff --git a/migration/multifd.h b/migration/multifd.h
> index c36d7ff876..209e3a9756 100644
> --- a/migration/multifd.h
> +++ b/migration/multifd.h
> @@ -52,6 +52,11 @@ typedef struct {
>      uint32_t unused32[1];    /* Reserved for future use */
>      uint64_t unused64[3];    /* Reserved for future use */
>      char ramblock[256];
> +    /*
> +     * This array contains the pointers to:
> +     *  - normal pages (initial normal_pages entries)
> +     *  - zero pages (following zero_pages entries)
> +     */
>      uint64_t offset[];
>  } __attribute__((packed)) MultiFDPacket_t;
>  
> diff --git a/migration/multifd.c b/migration/multifd.c
> index 0f7c27c08e..fcdd241c5c 100644
> --- a/migration/multifd.c
> +++ b/migration/multifd.c
> @@ -11,6 +11,7 @@
>   */
>  
>  #include "qemu/osdep.h"
> +#include "qemu/cutils.h"
>  #include "qemu/rcu.h"
>  #include "exec/target_page.h"
>  #include "sysemu/sysemu.h"
> @@ -275,6 +276,12 @@ static void multifd_send_fill_packet(MultiFDSendParams *p)
>  
>          packet->offset[i] = cpu_to_be64(temp);
>      }
> +    for (i = 0; i < p->zero_num; i++) {
> +        /* there are architectures where ram_addr_t is 32 bit */
> +        uint64_t temp = p->zero[i];
> +
> +        packet->offset[p->normal_num + i] = cpu_to_be64(temp);
> +    }
>  }
>  
>  static int multifd_recv_unfill_packet(MultiFDRecvParams *p, Error **errp)
> @@ -358,6 +365,18 @@ static int multifd_recv_unfill_packet(MultiFDRecvParams *p, Error **errp)
>          p->normal[i] = offset;
>      }
>  
> +    for (i = 0; i < p->zero_num; i++) {
> +        uint64_t offset = be64_to_cpu(packet->offset[p->normal_num + i]);
> +
> +        if (offset > (block->used_length - p->page_size)) {
> +            error_setg(errp, "multifd: offset too long %" PRIu64
> +                       " (max " RAM_ADDR_FMT ")",
> +                       offset, block->used_length);
> +            return -1;
> +        }
> +        p->zero[i] = offset;
> +    }
> +
>      return 0;
>  }
>  
> @@ -646,6 +665,8 @@ static void *multifd_send_thread(void *opaque)
>  {
>      MultiFDSendParams *p = opaque;
>      Error *local_err = NULL;
> +    /* qemu older than 7.0 don't understand zero page on multifd channel */
> +    bool use_zero_page = migrate_use_multifd_zero_page();
>      int ret = 0;
>      bool use_zero_copy_send = migrate_use_zero_copy_send();
>  
> @@ -668,6 +689,7 @@ static void *multifd_send_thread(void *opaque)
>          qemu_mutex_lock(&p->mutex);
>  
>          if (p->pending_job) {
> +            RAMBlock *rb = p->pages->block;
>              uint64_t packet_num = p->packet_num;
>              p->flags = 0;
>              if (p->sync_needed) {
> @@ -686,8 +708,16 @@ static void *multifd_send_thread(void *opaque)
>              }
>  
>              for (int i = 0; i < p->pages->num; i++) {
> -                p->normal[p->normal_num] = p->pages->offset[i];
> -                p->normal_num++;
> +                uint64_t offset = p->pages->offset[i];
> +                if (use_zero_page &&
> +                    buffer_is_zero(rb->host + offset, p->page_size)) {
> +                    p->zero[p->zero_num] = offset;
> +                    p->zero_num++;
> +                    ram_release_page(rb->idstr, offset);
> +                } else {
> +                    p->normal[p->normal_num] = offset;
> +                    p->normal_num++;
> +                }
>              }
>  
>              if (p->normal_num) {
> @@ -1152,6 +1182,13 @@ static void *multifd_recv_thread(void *opaque)
>              }
>          }
>  
> +        for (int i = 0; i < p->zero_num; i++) {
> +            void *page = p->host + p->zero[i];
> +            if (!buffer_is_zero(page, p->page_size)) {
> +                memset(page, 0, p->page_size);
> +            }
> +        }
> +
>          if (sync_needed) {
>              qemu_sem_post(&multifd_recv_state->sem_sync);
>              qemu_sem_wait(&p->sem_sync);
> -- 
> 2.35.3
> 
-- 
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK


