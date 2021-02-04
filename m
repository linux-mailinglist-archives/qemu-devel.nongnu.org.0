Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 92E7930F069
	for <lists+qemu-devel@lfdr.de>; Thu,  4 Feb 2021 11:21:07 +0100 (CET)
Received: from localhost ([::1]:40178 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l7bl4-0002QC-Lz
	for lists+qemu-devel@lfdr.de; Thu, 04 Feb 2021 05:21:06 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:57876)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1l7bis-0000h1-4R
 for qemu-devel@nongnu.org; Thu, 04 Feb 2021 05:18:50 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:55685)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1l7bip-0000Xj-El
 for qemu-devel@nongnu.org; Thu, 04 Feb 2021 05:18:48 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1612433926;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=xq1IclIKxj8zRHWkZ4eodOo4w1vJeiXXJIjBoF2C+og=;
 b=KGhCnI779f43IBmXov9OrxSlWUh03d7+KnNAiT7XR48dcGdqu6KeXwHf9ZZnuUaYcQ9gz/
 /nMkwl7vCxJMKezdmJK5kYm6MF615lx97Q6sIbl1vx/I8n5OLYNYMUd+xn7udrVqXp5t0p
 6kndLKkQLMdoUiE42hIHDXjVE+UwZ18=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-409-J_HDybg6PYqqVKDcPBkKjg-1; Thu, 04 Feb 2021 05:18:44 -0500
X-MC-Unique: J_HDybg6PYqqVKDcPBkKjg-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 3D65C801960;
 Thu,  4 Feb 2021 10:18:43 +0000 (UTC)
Received: from work-vm (ovpn-114-21.ams2.redhat.com [10.36.114.21])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 1817560C9B;
 Thu,  4 Feb 2021 10:18:38 +0000 (UTC)
Date: Thu, 4 Feb 2021 10:18:36 +0000
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: Chuan Zheng <zhengchuan@huawei.com>
Subject: Re: [PATCH v4 17/18] migration/rdma: send data for both rdma-pin-all
 and NOT rdma-pin-all mode
Message-ID: <20210204101836.GE3039@work-vm>
References: <1612339311-114805-1-git-send-email-zhengchuan@huawei.com>
 <1612339311-114805-18-git-send-email-zhengchuan@huawei.com>
MIME-Version: 1.0
In-Reply-To: <1612339311-114805-18-git-send-email-zhengchuan@huawei.com>
User-Agent: Mutt/1.14.6 (2020-07-11)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dgilbert@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=dgilbert@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -32
X-Spam_score: -3.3
X-Spam_bar: ---
X-Spam_report: (-3.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.539,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: yubihong@huawei.com, berrange@redhat.com, zhang.zhanghailiang@huawei.com,
 quintela@redhat.com, qemu-devel@nongnu.org, xiexiangyou@huawei.com,
 alex.chen@huawei.com, wanghao232@huawei.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

* Chuan Zheng (zhengchuan@huawei.com) wrote:
> Signed-off-by: Zhimin Feng <fengzhimin1@huawei.com>
> Signed-off-by: Chuan Zheng <zhengchuan@huawei.com>
> ---
>  migration/rdma.c | 65 ++++++++++++++++++++++++++++++++++++++++++++++++++++----
>  1 file changed, 61 insertions(+), 4 deletions(-)
> 
> diff --git a/migration/rdma.c b/migration/rdma.c
> index 2097839..c19a91f 100644
> --- a/migration/rdma.c
> +++ b/migration/rdma.c
> @@ -2002,6 +2002,20 @@ static int qemu_rdma_write_one(QEMUFile *f, RDMAContext *rdma,
>                                 .repeat = 1,
>                               };
>  
> +    /* use multifd to send data */
> +    if (migrate_use_multifd()) {
> +        int channel = get_multifd_RDMA_channel();
> +        int ret = 0;
> +        MultiFDSendParams *multifd_send_param = NULL;
> +        ret = get_multifd_send_param(channel, &multifd_send_param);
> +        if (ret) {
> +            error_report("rdma: error getting multifd_send_param(%d)", channel);
> +            return -EINVAL;
> +        }
> +        rdma = (RDMAContext *)multifd_send_param->rdma;
> +        block = &(rdma->local_ram_blocks.block[current_index]);
> +    }
> +
>  retry:
>      sge.addr = (uintptr_t)(block->local_host_addr +
>                              (current_addr - block->offset));
> @@ -2197,6 +2211,27 @@ retry:
>      return 0;
>  }
>  
> +static int multifd_rdma_write_flush(void)
> +{
> +    /* The multifd RDMA threads send data */
> +    MultiFDSendParams *multifd_send_param = NULL;
> +    RDMAContext *rdma = NULL;
> +    MigrationState *s = migrate_get_current();
> +    int ret = 0;
> +
> +    ret = get_multifd_send_param(s->rdma_channel,
> +                                 &multifd_send_param);
> +    if (ret) {
> +        error_report("rdma: error getting multifd_send_param(%d)",
> +                     s->rdma_channel);

Do we need these error_report's for get_multifd_send_param calls - how
can they fail in practice?

> +        return ret;
> +    }
> +    rdma = (RDMAContext *)(multifd_send_param->rdma);
> +    rdma->nb_sent++;
> +
> +    return ret;

But this doesn't actually 'flush' anything?

> +}
> +
>  /*
>   * Push out any unwritten RDMA operations.
>   *
> @@ -2219,8 +2254,15 @@ static int qemu_rdma_write_flush(QEMUFile *f, RDMAContext *rdma)
>      }
>  
>      if (ret == 0) {
> -        rdma->nb_sent++;
> -        trace_qemu_rdma_write_flush(rdma->nb_sent);
> +        if (migrate_use_multifd()) {
> +            ret = multifd_rdma_write_flush();
> +            if (ret) {
> +                return ret;
> +            }
> +        } else {
> +            rdma->nb_sent++;
> +            trace_qemu_rdma_write_flush(rdma->nb_sent);
> +        }
>      }
>  
>      rdma->current_length = 0;
> @@ -4062,6 +4104,7 @@ wait_reg_complete:
>              }
>  
>              qemu_sem_post(&multifd_send_param->sem_sync);
> +            qemu_sem_wait(&multifd_send_param->sem);

why?

>          }
>      }
>  
> @@ -4443,6 +4486,7 @@ static void *multifd_rdma_send_thread(void *opaque)
>      Error *local_err = NULL;
>      int ret = 0;
>      RDMAControlHeader head = { .len = 0, .repeat = 1 };
> +    RDMAContext *rdma = p->rdma;
>  
>      trace_multifd_send_thread_start(p->id);
>      if (multifd_send_initial_packet(p, &local_err) < 0) {
> @@ -4451,7 +4495,7 @@ static void *multifd_rdma_send_thread(void *opaque)
>  
>      /* wait for semaphore notification to register memory */
>      qemu_sem_wait(&p->sem_sync);
> -    if (qemu_rdma_registration(p->rdma) < 0) {
> +    if (qemu_rdma_registration(rdma) < 0) {
>          goto out;
>      }
>      /*
> @@ -4466,12 +4510,25 @@ static void *multifd_rdma_send_thread(void *opaque)
>                  break;
>              }
>          }
> +        /* To complete polling(CQE) */
> +        while (rdma->nb_sent) {

Where is nb_sent decremented?

> +            ret = qemu_rdma_block_for_wrid(rdma, RDMA_WRID_RDMA_WRITE, NULL);
> +            if (ret < 0) {
> +                error_report("multifd RDMA migration: "
> +                             "complete polling error!");
> +                return NULL;
> +            }
> +        }
>          /* Send FINISHED to the destination */
>          head.type = RDMA_CONTROL_REGISTER_FINISHED;
> -        ret = qemu_rdma_exchange_send(p->rdma, &head, NULL, NULL, NULL, NULL);
> +        ret = qemu_rdma_exchange_send(rdma, &head, NULL, NULL, NULL, NULL);
>          if (ret < 0) {
> +            error_report("multifd RDMA migration: "
> +                         "sending remote error!");
>              return NULL;
>          }
> +        /* sync main thread */
> +        qemu_sem_post(&p->sem);
>      }
>  
>  out:
> -- 
> 1.8.3.1
> 
-- 
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK


