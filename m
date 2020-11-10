Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D5B682AD646
	for <lists+qemu-devel@lfdr.de>; Tue, 10 Nov 2020 13:32:45 +0100 (CET)
Received: from localhost ([::1]:35614 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kcSpI-0007Yn-HQ
	for lists+qemu-devel@lfdr.de; Tue, 10 Nov 2020 07:32:44 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:34476)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1kcSna-0006gg-GD
 for qemu-devel@nongnu.org; Tue, 10 Nov 2020 07:30:58 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:40810)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1kcSnV-0005yu-1r
 for qemu-devel@nongnu.org; Tue, 10 Nov 2020 07:30:57 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1605011450;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Zblu9jaDozi5DyD6Ka9Yor/qeKpIAqmo+Mejd5tbPkM=;
 b=Zc4xNz8Xk/z/WlGsulaUlfL7kWeAQAnXb0Lgd/BLlfggcsC0dpnNdDGVTr1tsfVIhqPeJD
 UDpdLz9Fa9n9GB+P6gxFEjrG6MdmHlsbErnK/TcvpTLIaZXF8XMiDj0qKMWsmJWaeoaUsr
 dplNCw87WORIZtFZHzeGYn2WbAJAz2c=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-519-oxUnMiO6ME6Wv-9gsSBpiQ-1; Tue, 10 Nov 2020 07:30:46 -0500
X-MC-Unique: oxUnMiO6ME6Wv-9gsSBpiQ-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id F231618BA283;
 Tue, 10 Nov 2020 12:30:44 +0000 (UTC)
Received: from work-vm (ovpn-115-49.ams2.redhat.com [10.36.115.49])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 959545CC26;
 Tue, 10 Nov 2020 12:30:40 +0000 (UTC)
Date: Tue, 10 Nov 2020 12:30:37 +0000
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: Chuan Zheng <zhengchuan@huawei.com>
Subject: Re: [PATCH v3 04/18] migration/rdma: add multifd_setup_ops for rdma
Message-ID: <20201110123037.GE3108@work-vm>
References: <1602908748-43335-1-git-send-email-zhengchuan@huawei.com>
 <1602908748-43335-5-git-send-email-zhengchuan@huawei.com>
MIME-Version: 1.0
In-Reply-To: <1602908748-43335-5-git-send-email-zhengchuan@huawei.com>
User-Agent: Mutt/1.14.6 (2020-07-11)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dgilbert@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=dgilbert@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/10 02:00:53
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: yubihong@huawei.com, zhang.zhanghailiang@huawei.com, quintela@redhat.com,
 fengzhimin1@huawei.com, qemu-devel@nongnu.org, xiexiangyou@huawei.com,
 alex.chen@huawei.com, wanghao232@huawei.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

* Chuan Zheng (zhengchuan@huawei.com) wrote:
> Signed-off-by: Chuan Zheng <zhengchuan@huawei.com>
> ---
>  migration/multifd.c |  6 ++++
>  migration/multifd.h |  4 +++
>  migration/rdma.c    | 82 +++++++++++++++++++++++++++++++++++++++++++++++++++++
>  3 files changed, 92 insertions(+)
> 
> diff --git a/migration/multifd.c b/migration/multifd.c
> index 1f82307..0d494df 100644
> --- a/migration/multifd.c
> +++ b/migration/multifd.c
> @@ -1210,6 +1210,12 @@ MultiFDSetup *multifd_setup_ops_init(void)
>  {
>      MultiFDSetup *ops;
>  
> +#ifdef CONFIG_RDMA
> +    if (migrate_use_rdma()) {
> +        ops = multifd_rdma_setup();
> +        return ops;
> +    }
> +#endif
>      ops = &multifd_socket_ops;
>      return ops;
>  }
> diff --git a/migration/multifd.h b/migration/multifd.h
> index 446315b..62a0b2a 100644
> --- a/migration/multifd.h
> +++ b/migration/multifd.h
> @@ -173,6 +173,10 @@ typedef struct {
>      void (*recv_channel_setup)(QIOChannel *ioc, MultiFDRecvParams *p);
>  } MultiFDSetup;
>  
> +#ifdef CONFIG_RDMA
> +MultiFDSetup *multifd_rdma_setup(void);
> +#endif
> +MultiFDSetup *multifd_setup_ops_init(void);
>  void multifd_register_ops(int method, MultiFDMethods *ops);
>  
>  #endif
> diff --git a/migration/rdma.c b/migration/rdma.c
> index 0340841..ad4e4ba 100644
> --- a/migration/rdma.c
> +++ b/migration/rdma.c
> @@ -19,6 +19,7 @@
>  #include "qemu/cutils.h"
>  #include "rdma.h"
>  #include "migration.h"
> +#include "multifd.h"
>  #include "qemu-file.h"
>  #include "ram.h"
>  #include "qemu-file-channel.h"
> @@ -4138,3 +4139,84 @@ err:
>      g_free(rdma);
>      g_free(rdma_return_path);
>  }
> +
> +static void *multifd_rdma_send_thread(void *opaque)
> +{
> +    MultiFDSendParams *p = opaque;
> +
> +    while (true) {
> +        qemu_mutex_lock(&p->mutex);
> +        if (p->quit) {
> +            qemu_mutex_unlock(&p->mutex);
> +            break;
> +        }
> +        qemu_mutex_unlock(&p->mutex);
> +        qemu_sem_wait(&p->sem);
> +    }
> +
> +    qemu_mutex_lock(&p->mutex);
> +    p->running = false;
> +    qemu_mutex_unlock(&p->mutex);
> +
> +    return NULL;
> +}

You might like to consider using WITH_QEMU_LOCK_GUARD, I think that
would become:

  while (true) {
      WITH_QEMU_LOCK_GUARD(&p->mutex) {
          if (p->quit) {
              break;
          }
      }
      qemu_sem_wait(&p->sem);
  }
  WITH_QEMU_LOCK_GUARD(&p->mutex) {
      p->running = false;
  }

> +
> +static void multifd_rdma_send_channel_setup(MultiFDSendParams *p)
> +{
> +    Error *local_err = NULL;
> +
> +    if (p->quit) {
> +        error_setg(&local_err, "multifd: send id %d already quit", p->id);
> +        return ;
> +    }
> +    p->running = true;
> +
> +    qemu_thread_create(&p->thread, p->name, multifd_rdma_send_thread, p,
> +                       QEMU_THREAD_JOINABLE);
> +}
> +
> +static void *multifd_rdma_recv_thread(void *opaque)
> +{
> +    MultiFDRecvParams *p = opaque;
> +
> +    while (true) {
> +        qemu_mutex_lock(&p->mutex);
> +        if (p->quit) {
> +            qemu_mutex_unlock(&p->mutex);
> +            break;
> +        }
> +        qemu_mutex_unlock(&p->mutex);
> +        qemu_sem_wait(&p->sem_sync);
> +    }
> +
> +    qemu_mutex_lock(&p->mutex);
> +    p->running = false;
> +    qemu_mutex_unlock(&p->mutex);
> +
> +    return NULL;
> +}
> +
> +static void multifd_rdma_recv_channel_setup(QIOChannel *ioc,
> +                                            MultiFDRecvParams *p)
> +{
> +    QIOChannelRDMA *rioc = QIO_CHANNEL_RDMA(ioc);
> +
> +    p->file = rioc->file;
> +    return;
> +}
> +
> +static MultiFDSetup multifd_rdma_ops = {
> +    .send_thread_setup = multifd_rdma_send_thread,
> +    .recv_thread_setup = multifd_rdma_recv_thread,
> +    .send_channel_setup = multifd_rdma_send_channel_setup,
> +    .recv_channel_setup = multifd_rdma_recv_channel_setup
> +};
> +
> +MultiFDSetup *multifd_rdma_setup(void)
> +{
> +    MultiFDSetup *rdma_ops;
> +
> +    rdma_ops = &multifd_rdma_ops;
> +
> +    return rdma_ops;

Why bother making this a function - just export multifd_rdma_ops ?

Dave

> +}
> -- 
> 1.8.3.1
> 
-- 
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK


