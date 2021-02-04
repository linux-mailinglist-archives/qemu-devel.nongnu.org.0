Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E004530F107
	for <lists+qemu-devel@lfdr.de>; Thu,  4 Feb 2021 11:40:48 +0100 (CET)
Received: from localhost ([::1]:59610 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l7c48-00069J-0e
	for lists+qemu-devel@lfdr.de; Thu, 04 Feb 2021 05:40:48 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:60660)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1l7bwX-0007Bg-V0
 for qemu-devel@nongnu.org; Thu, 04 Feb 2021 05:32:57 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:41344)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1l7bwU-0006bf-QX
 for qemu-devel@nongnu.org; Thu, 04 Feb 2021 05:32:56 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1612434773;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=/osaP0MbFpclO3OzMpiNU8BhjWGIfaBgDOYDFB56zjg=;
 b=DyWbb99rdTY11yV2U6FywPUFNyP0AWRPwTc3WU422nfhkS/FACoTckBmDR37BNqIdl1Ucy
 iUEdc/4wE+qwrSYKsCFahyE5gwZvAcfq69EF/C3mBZ/YJbOXgGBsB8WbA/joqSMpv4Y8vp
 lEuUXQqVWFgEW/Y9fCuN5+PAgEpI0AM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-19-Oy5oo7X0O---JJM2P9pibw-1; Thu, 04 Feb 2021 05:32:49 -0500
X-MC-Unique: Oy5oo7X0O---JJM2P9pibw-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 378CA36492;
 Thu,  4 Feb 2021 10:32:48 +0000 (UTC)
Received: from work-vm (ovpn-114-21.ams2.redhat.com [10.36.114.21])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id E6D285B698;
 Thu,  4 Feb 2021 10:32:45 +0000 (UTC)
Date: Thu, 4 Feb 2021 10:32:43 +0000
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: Chuan Zheng <zhengchuan@huawei.com>
Subject: Re: [PATCH v4 18/18] migration/rdma: RDMA cleanup for multifd
 migration
Message-ID: <20210204103243.GF3039@work-vm>
References: <1612339311-114805-1-git-send-email-zhengchuan@huawei.com>
 <1612339311-114805-19-git-send-email-zhengchuan@huawei.com>
MIME-Version: 1.0
In-Reply-To: <1612339311-114805-19-git-send-email-zhengchuan@huawei.com>
User-Agent: Mutt/1.14.6 (2020-07-11)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
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
> Signed-off-by: Chuan Zheng <zhengchuan@huawei.com>
> ---
>  migration/multifd.c |  6 ++++++
>  migration/multifd.h |  1 +
>  migration/rdma.c    | 16 +++++++++++++++-
>  3 files changed, 22 insertions(+), 1 deletion(-)
> 
> diff --git a/migration/multifd.c b/migration/multifd.c
> index 1186246..4031648 100644
> --- a/migration/multifd.c
> +++ b/migration/multifd.c
> @@ -577,6 +577,9 @@ void multifd_save_cleanup(void)
>          p->packet_len = 0;
>          g_free(p->packet);
>          p->packet = NULL;
> +#ifdef CONFIG_RDMA
> +        multifd_rdma_cleanup(p->rdma);
> +#endif

You may find it easier to add an entry into stubs/ for
multifd_rdma_cleanup; it then avoids the need for the ifdef.

>          multifd_send_state->ops->send_cleanup(p, &local_err);
>          if (local_err) {
>              migrate_set_error(migrate_get_current(), local_err);
> @@ -1039,6 +1042,9 @@ int multifd_load_cleanup(Error **errp)
>          p->packet_len = 0;
>          g_free(p->packet);
>          p->packet = NULL;
> +#ifdef CONFIG_RDMA
> +        multifd_rdma_cleanup(p->rdma);
> +#endif
>          multifd_recv_state->ops->recv_cleanup(p);
>      }
>      qemu_sem_destroy(&multifd_recv_state->sem_sync);
> diff --git a/migration/multifd.h b/migration/multifd.h
> index 26d4489..0ecec5e 100644
> --- a/migration/multifd.h
> +++ b/migration/multifd.h
> @@ -183,6 +183,7 @@ typedef struct {
>  
>  #ifdef CONFIG_RDMA
>  extern MultiFDSetup multifd_rdma_ops;
> +void multifd_rdma_cleanup(void *opaque);
>  #endif
>  void multifd_send_terminate_threads(Error *err);
>  int multifd_send_initial_packet(MultiFDSendParams *p, Error **errp);
> diff --git a/migration/rdma.c b/migration/rdma.c
> index c19a91f..f14357f 100644
> --- a/migration/rdma.c
> +++ b/migration/rdma.c
> @@ -2369,7 +2369,7 @@ static void qemu_rdma_cleanup(RDMAContext *rdma)
>  {
>      int idx;
>  
> -    if (rdma->cm_id && rdma->connected) {
> +    if (rdma->channel && rdma->cm_id && rdma->connected) {
>          if ((rdma->error_state ||
>               migrate_get_current()->state == MIGRATION_STATUS_CANCELLING) &&
>              !rdma->received_error) {
> @@ -4599,6 +4599,20 @@ static void multifd_rdma_recv_channel_setup(QIOChannel *ioc,
>      return;
>  }
>  
> +void multifd_rdma_cleanup(void *opaque)

I think you need to make it clear that this is only to cleanup one
channel, rather than the whole multifd-rdma connection;
multifd_load_cleanup for example cleans up all the channels, where as I
think this is only doing one?

Don't use a 'void *opaque' except for something that's called via
a registration/callback scheme that's designed to be generic
(e.g. multifd_send_thread does it because it's called from
qemu_thread_create that doesn't know the type).  Where you know
the type, use it!

> +{
> +    RDMAContext *rdma = (RDMAContext *)opaque;
> +
> +    if (!migrate_use_rdma()) {
> +        return;
> +    }
> +
> +    rdma->listen_id = NULL;
> +    rdma->channel = NULL;
> +    qemu_rdma_cleanup(rdma);
> +    g_free(rdma);
> +}
> +
>  MultiFDSetup multifd_rdma_ops = {
>      .send_thread = multifd_rdma_send_thread,
>      .recv_thread = multifd_rdma_recv_thread,
> -- 
> 1.8.3.1
> 
-- 
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK


