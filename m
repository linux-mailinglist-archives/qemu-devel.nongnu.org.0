Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E36D730E318
	for <lists+qemu-devel@lfdr.de>; Wed,  3 Feb 2021 20:11:07 +0100 (CET)
Received: from localhost ([::1]:41260 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l7NYQ-0005IU-SM
	for lists+qemu-devel@lfdr.de; Wed, 03 Feb 2021 14:11:06 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:37212)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1l7NN5-0006Xm-5H
 for qemu-devel@nongnu.org; Wed, 03 Feb 2021 13:59:23 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:38253)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1l7NN0-00016S-JB
 for qemu-devel@nongnu.org; Wed, 03 Feb 2021 13:59:22 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1612378756;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Fn42p6PgAaJihNjO4/yC+wbh8TL7Qtb9aSyWqDyA53E=;
 b=Sxpk3uEVKaudJxyWenfxCly+CdPajTfY87d9YZijwnYjt3gFMpqmX2ytOQwYBQWJm2Zd14
 RizwtSn8LCLTOXfnIgUTftBOBX/+O4kbZTIzbuGDOTl0DrNN/KoeOFOdbcBAqw5xb6Uk38
 F93gRNvk82gth1s5Rk3JKS1YXWBoxFU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-242-Pif7sr1WOP-gRRujP4fzHg-1; Wed, 03 Feb 2021 13:59:12 -0500
X-MC-Unique: Pif7sr1WOP-gRRujP4fzHg-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 254E6189DF4E;
 Wed,  3 Feb 2021 18:59:11 +0000 (UTC)
Received: from work-vm (ovpn-115-70.ams2.redhat.com [10.36.115.70])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 38EBD60BFA;
 Wed,  3 Feb 2021 18:59:09 +0000 (UTC)
Date: Wed, 3 Feb 2021 18:59:06 +0000
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: Chuan Zheng <zhengchuan@huawei.com>
Subject: Re: [PATCH v4 10/18] migration/rdma: Create the multifd recv
 channels for RDMA
Message-ID: <20210203185906.GT2950@work-vm>
References: <1612339311-114805-1-git-send-email-zhengchuan@huawei.com>
 <1612339311-114805-11-git-send-email-zhengchuan@huawei.com>
MIME-Version: 1.0
In-Reply-To: <1612339311-114805-11-git-send-email-zhengchuan@huawei.com>
User-Agent: Mutt/1.14.6 (2020-07-11)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
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
> We still don't transmit anything through them, and we only build
> the RDMA connections.
> 
> Signed-off-by: Zhimin Feng <fengzhimin1@huawei.com>
> Signed-off-by: Chuan Zheng <zhengchuan@huawei.com>
> ---
>  migration/rdma.c | 69 ++++++++++++++++++++++++++++++++++++++++++++++++++++++--
>  1 file changed, 67 insertions(+), 2 deletions(-)
> 
> diff --git a/migration/rdma.c b/migration/rdma.c
> index 996afb0..ed8a015 100644
> --- a/migration/rdma.c
> +++ b/migration/rdma.c
> @@ -3267,6 +3267,40 @@ static void rdma_cm_poll_handler(void *opaque)
>      }
>  }
>  
> +static bool qemu_rdma_accept_setup(RDMAContext *rdma)
> +{
> +    RDMAContext *multifd_rdma = NULL;
> +    int thread_count;
> +    int i;
> +    MultiFDRecvParams *multifd_recv_param;
> +    thread_count = migrate_multifd_channels();
> +    /* create the multifd channels for RDMA */
> +    for (i = 0; i < thread_count; i++) {
> +        if (get_multifd_recv_param(i, &multifd_recv_param) < 0) {
> +            error_report("rdma: error getting multifd_recv_param(%d)", i);
> +            return false;
> +        }
> +
> +        multifd_rdma = (RDMAContext *) multifd_recv_param->rdma;
> +        if (multifd_rdma->cm_id == NULL) {
> +            break;
> +        } else {
> +            multifd_rdma = NULL;
> +        }

I'm confused by what this if is doing - what are the two cases?

> +    }
> +
> +    if (multifd_rdma) {
> +        qemu_set_fd_handler(rdma->channel->fd,
> +                            rdma_accept_incoming_migration,
> +                            NULL, (void *)(intptr_t)multifd_rdma);
> +    } else {
> +        qemu_set_fd_handler(rdma->channel->fd, rdma_cm_poll_handler,
> +                            NULL, rdma);
> +    }
> +
> +    return true;
> +}
> +
>  static int qemu_rdma_accept(RDMAContext *rdma)
>  {
>      RDMACapabilities cap;
> @@ -3366,6 +3400,10 @@ static int qemu_rdma_accept(RDMAContext *rdma)
>          qemu_set_fd_handler(rdma->channel->fd, rdma_accept_incoming_migration,
>                              NULL,
>                              (void *)(intptr_t)rdma->return_path);
> +    } else if (migrate_use_multifd()) {
> +        if (!qemu_rdma_accept_setup(rdma)) {
> +            goto err_rdma_dest_wait;
> +        }
>      } else {
>          qemu_set_fd_handler(rdma->channel->fd, rdma_cm_poll_handler,
>                              NULL, rdma);
> @@ -3976,6 +4014,34 @@ static QEMUFile *qemu_fopen_rdma(RDMAContext *rdma, const char *mode)
>      return rioc->file;
>  }
>  
> +static void migration_rdma_process_incoming(QEMUFile *f,
> +                                            RDMAContext *rdma, Error **errp)
> +{
> +    MigrationIncomingState *mis = migration_incoming_get_current();
> +    QIOChannel *ioc = NULL;
> +    bool start_migration = false;
> +
> +    if (!migrate_use_multifd()) {
> +        rdma->migration_started_on_destination = 1;
> +        migration_fd_process_incoming(f, errp);
> +        return;
> +    }
> +
> +    if (!mis->from_src_file) {
> +        mis->from_src_file = f;
> +        qemu_file_set_blocking(f, false);
> +    } else {
> +        ioc = QIO_CHANNEL(getQIOChannel(f));
> +        /* Multiple connections */
> +        assert(migrate_use_multifd());

Are you sure that's never triggerable by something trying to connect
badly? If it was it would be better to error than abort.

> +        start_migration = multifd_recv_new_channel(ioc, errp);

And what does 'start_migration' mean here - is that meaning that we have
a full set of connections?

Dave

> +    }
> +
> +    if (start_migration) {
> +        migration_incoming_process();
> +    }
> +}
> +
>  static void rdma_accept_incoming_migration(void *opaque)
>  {
>      RDMAContext *rdma = opaque;
> @@ -4004,8 +4070,7 @@ static void rdma_accept_incoming_migration(void *opaque)
>          return;
>      }
>  
> -    rdma->migration_started_on_destination = 1;
> -    migration_fd_process_incoming(f, &local_err);
> +    migration_rdma_process_incoming(f, rdma, &local_err);
>      if (local_err) {
>          error_reportf_err(local_err, "RDMA ERROR:");
>      }
> -- 
> 1.8.3.1
> 
-- 
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK


