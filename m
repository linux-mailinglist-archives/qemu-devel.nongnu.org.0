Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 71F8730E1CE
	for <lists+qemu-devel@lfdr.de>; Wed,  3 Feb 2021 19:04:48 +0100 (CET)
Received: from localhost ([::1]:53292 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l7MWF-0008Ct-EO
	for lists+qemu-devel@lfdr.de; Wed, 03 Feb 2021 13:04:47 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:48782)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1l7MQ4-0003aO-1x
 for qemu-devel@nongnu.org; Wed, 03 Feb 2021 12:58:24 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:31594)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1l7MPx-0001A5-DK
 for qemu-devel@nongnu.org; Wed, 03 Feb 2021 12:58:23 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1612375095;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=j3Sne9DXwf61unuc+tkaz86MPBfrwyrM01AKKKNhUsQ=;
 b=MQiz1+J8nGvYMKopOSjeSs+GsYpyGY71YZEfvDO5sIAdQCPhsXoSIIJLqGyO4o8cVdKts7
 Hj0hdfn6ixIBfuz/dLTwjMHQDgxPYGVMn4Pyo/vmdWCF0KEyW5RzNP8j0VwKVXe88yJC/3
 fQr7EZ/1gtwbEUx0NFq71Qr2I2TxkUM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-270-wy1kPnkLMnWY-E-Pn8K9mg-1; Wed, 03 Feb 2021 12:58:11 -0500
X-MC-Unique: wy1kPnkLMnWY-E-Pn8K9mg-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 22F76100F343;
 Wed,  3 Feb 2021 17:58:10 +0000 (UTC)
Received: from work-vm (ovpn-115-70.ams2.redhat.com [10.36.115.70])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 0D2441007637;
 Wed,  3 Feb 2021 17:58:07 +0000 (UTC)
Date: Wed, 3 Feb 2021 17:58:05 +0000
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: Chuan Zheng <zhengchuan@huawei.com>
Subject: Re: [PATCH v4 04/18] migration/rdma: add multifd_setup_ops for rdma
Message-ID: <20210203175805.GN2950@work-vm>
References: <1612339311-114805-1-git-send-email-zhengchuan@huawei.com>
 <1612339311-114805-5-git-send-email-zhengchuan@huawei.com>
MIME-Version: 1.0
In-Reply-To: <1612339311-114805-5-git-send-email-zhengchuan@huawei.com>
User-Agent: Mutt/1.14.6 (2020-07-11)
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dgilbert@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=63.128.21.124; envelope-from=dgilbert@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -32
X-Spam_score: -3.3
X-Spam_bar: ---
X-Spam_report: (-3.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.539,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
> Signed-off-by: Chuan Zheng <zhengchuan@huawei.com>
> ---
>  migration/multifd.c |  6 +++++
>  migration/multifd.h |  5 ++++
>  migration/rdma.c    | 71 +++++++++++++++++++++++++++++++++++++++++++++++++++++
>  3 files changed, 82 insertions(+)

I think that's OK, although will need minor changes with my suggested
change to 'migrate_use' in the previous patch.


Reviewed-by: Dr. David Alan Gilbert <dgilbert@redhat.com>

> 
> diff --git a/migration/multifd.c b/migration/multifd.c
> index cb1fc01..4820702 100644
> --- a/migration/multifd.c
> +++ b/migration/multifd.c
> @@ -1232,6 +1232,12 @@ MultiFDSetup *multifd_setup_ops_init(void)
>  {
>      MultiFDSetup *ops;
>  
> +#ifdef CONFIG_RDMA
> +    if (migrate_use_rdma()) {
> +        ops = &multifd_rdma_ops;
> +        return ops;
> +    }
> +#endif
>      ops = &multifd_socket_ops;
>      return ops;
>  }
> diff --git a/migration/multifd.h b/migration/multifd.h
> index 1d2dc90..e3ab4b0 100644
> --- a/migration/multifd.h
> +++ b/migration/multifd.h
> @@ -173,6 +173,11 @@ typedef struct {
>      void (*recv_channel_setup)(QIOChannel *ioc, MultiFDRecvParams *p);
>  } MultiFDSetup;
>  
> +#ifdef CONFIG_RDMA
> +extern MultiFDSetup multifd_rdma_ops;
> +#endif
> +MultiFDSetup *multifd_setup_ops_init(void);
> +
>  void multifd_register_ops(int method, MultiFDMethods *ops);
>  
>  #endif
> diff --git a/migration/rdma.c b/migration/rdma.c
> index 00eac34..e0ea86d 100644
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
> @@ -4139,3 +4140,73 @@ err:
>      g_free(rdma);
>      g_free(rdma_return_path);
>  }
> +
> +static void *multifd_rdma_send_thread(void *opaque)
> +{
> +    MultiFDSendParams *p = opaque;
> +
> +    while (true) {
> +        WITH_QEMU_LOCK_GUARD(&p->mutex) {
> +            if (p->quit) {
> +                break;
> +            }
> +        }
> +        qemu_sem_wait(&p->sem);
> +    }
> +
> +    WITH_QEMU_LOCK_GUARD(&p->mutex) {
> +        p->running = false;
> +    }
> +
> +    return NULL;
> +}
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
> +        WITH_QEMU_LOCK_GUARD(&p->mutex) {
> +            if (p->quit) {
> +                break;
> +            }
> +        }
> +        qemu_sem_wait(&p->sem_sync);
> +    }
> +
> +    WITH_QEMU_LOCK_GUARD(&p->mutex) {
> +        p->running = false;
> +    }
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
> +MultiFDSetup multifd_rdma_ops = {
> +    .send_thread = multifd_rdma_send_thread,
> +    .recv_thread = multifd_rdma_recv_thread,
> +    .send_channel_setup = multifd_rdma_send_channel_setup,
> +    .recv_channel_setup = multifd_rdma_recv_channel_setup
> +};
> -- 
> 1.8.3.1
> 
-- 
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK


