Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 82E2330E3BB
	for <lists+qemu-devel@lfdr.de>; Wed,  3 Feb 2021 21:03:16 +0100 (CET)
Received: from localhost ([::1]:44548 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l7OMt-0004fR-Ie
	for lists+qemu-devel@lfdr.de; Wed, 03 Feb 2021 15:03:15 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:51870)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1l7OCR-0004yP-OG
 for qemu-devel@nongnu.org; Wed, 03 Feb 2021 14:52:27 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:23879)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1l7OCL-0005u6-Oa
 for qemu-devel@nongnu.org; Wed, 03 Feb 2021 14:52:26 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1612381940;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=jyBuhvkQP9WrLTJY4lgBpI/aMPew2cFz3lye7EZ4DYY=;
 b=Id+Ufq9GsgXqXKb57EGIjEICTkeUxoGab2BASFcJYuhq1ATSmL9iPwUmiY7Sl5DYeP0dUG
 MQAABr+eurfUr76GtutLhS6L2KRFATvU1Ag4+gNGTV/fhqtE11qApA6VWftPpXVdeGr8YQ
 /1W5tRNeT4LGqNXH5pAS8+E6nSyei6w=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-109-wYWp-84TO1ezZ--Mn1dfRQ-1; Wed, 03 Feb 2021 14:52:18 -0500
X-MC-Unique: wYWp-84TO1ezZ--Mn1dfRQ-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 04A7518A08BE;
 Wed,  3 Feb 2021 19:52:17 +0000 (UTC)
Received: from work-vm (ovpn-115-70.ams2.redhat.com [10.36.115.70])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 2D988722C7;
 Wed,  3 Feb 2021 19:52:15 +0000 (UTC)
Date: Wed, 3 Feb 2021 19:52:12 +0000
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: Chuan Zheng <zhengchuan@huawei.com>
Subject: Re: [PATCH v4 12/18] migration/rdma: Create the multifd send
 channels for RDMA
Message-ID: <20210203195212.GV2950@work-vm>
References: <1612339311-114805-1-git-send-email-zhengchuan@huawei.com>
 <1612339311-114805-13-git-send-email-zhengchuan@huawei.com>
MIME-Version: 1.0
In-Reply-To: <1612339311-114805-13-git-send-email-zhengchuan@huawei.com>
User-Agent: Mutt/1.14.6 (2020-07-11)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
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
>  migration/multifd.c |  4 ++--
>  migration/multifd.h |  2 ++
>  migration/rdma.c    | 57 +++++++++++++++++++++++++++++++++++++++++++++++++++++
>  3 files changed, 61 insertions(+), 2 deletions(-)
> 
> diff --git a/migration/multifd.c b/migration/multifd.c
> index ae0b7f0..919a414 100644
> --- a/migration/multifd.c
> +++ b/migration/multifd.c
> @@ -176,7 +176,7 @@ void multifd_register_ops(int method, MultiFDMethods *ops)
>      multifd_ops[method] = ops;
>  }
>  
> -static int multifd_send_initial_packet(MultiFDSendParams *p, Error **errp)
> +int multifd_send_initial_packet(MultiFDSendParams *p, Error **errp)
>  {
>      MultiFDInit_t msg = {};
>      int ret;
> @@ -503,7 +503,7 @@ int multifd_queue_page(QEMUFile *f, RAMBlock *block, ram_addr_t offset)
>      return 1;
>  }
>  
> -static void multifd_send_terminate_threads(Error *err)
> +void multifd_send_terminate_threads(Error *err)
>  {
>      int i;
>  
> diff --git a/migration/multifd.h b/migration/multifd.h
> index b17a2c1..26d4489 100644
> --- a/migration/multifd.h
> +++ b/migration/multifd.h
> @@ -184,6 +184,8 @@ typedef struct {
>  #ifdef CONFIG_RDMA
>  extern MultiFDSetup multifd_rdma_ops;
>  #endif
> +void multifd_send_terminate_threads(Error *err);
> +int multifd_send_initial_packet(MultiFDSendParams *p, Error **errp);
>  int get_multifd_send_param(int id, MultiFDSendParams **param);
>  int get_multifd_recv_param(int id, MultiFDRecvParams **param);
>  MultiFDSetup *multifd_setup_ops_init(void);
> diff --git a/migration/rdma.c b/migration/rdma.c
> index 9654b87..cff9446 100644
> --- a/migration/rdma.c
> +++ b/migration/rdma.c
> @@ -4261,9 +4261,54 @@ err:
>      g_free(rdma_return_path);
>  }
>  
> +static int multifd_channel_rdma_connect(void *opaque)
> +{
> +    MultiFDSendParams *p = opaque;
> +    Error *local_err = NULL;
> +    int ret = 0;
> +    MigrationState *s = migrate_get_current();
> +
> +    p->rdma = qemu_rdma_data_init(s->host_port, &local_err);
> +    if (p->rdma == NULL) {
> +        goto out;
> +    }
> +
> +    ret = qemu_rdma_source_init(p->rdma,
> +                                migrate_rdma_pin_all(),
> +                                &local_err);
> +    if (ret) {
> +        goto out;
> +    }
> +
> +    ret = qemu_rdma_connect(p->rdma, &local_err);
> +    if (ret) {
> +        goto out;
> +    }
> +
> +    p->file = qemu_fopen_rdma(p->rdma, "wb");
> +    if (p->file == NULL) {
> +        goto out;
> +    }
> +
> +    p->c = QIO_CHANNEL(getQIOChannel(p->file));
> +
> +out:
> +    if (local_err) {
> +        trace_multifd_send_error(p->id);
> +    }

If any of the previous steps have failed, but not the first step,
what cleans up?

> +    return ret;
> +}
> +
>  static void *multifd_rdma_send_thread(void *opaque)
>  {
>      MultiFDSendParams *p = opaque;
> +    Error *local_err = NULL;
> +
> +    trace_multifd_send_thread_start(p->id);
> +    if (multifd_send_initial_packet(p, &local_err) < 0) {
> +        goto out;
> +    }
>  
>      while (true) {
>          WITH_QEMU_LOCK_GUARD(&p->mutex) {
> @@ -4274,6 +4319,12 @@ static void *multifd_rdma_send_thread(void *opaque)
>          qemu_sem_wait(&p->sem);
>      }
>  
> +out:
> +    if (local_err) {
> +        trace_multifd_send_error(p->id);
> +        multifd_send_terminate_threads(local_err);
> +    }
> +
>      WITH_QEMU_LOCK_GUARD(&p->mutex) {
>          p->running = false;
>      }
> @@ -4285,6 +4336,12 @@ static void multifd_rdma_send_channel_setup(MultiFDSendParams *p)
>  {
>      Error *local_err = NULL;
>  
> +    if (multifd_channel_rdma_connect(p)) {
> +        error_setg(&local_err, "multifd: rdma channel %d not established",
> +                   p->id);
> +        return ;
> +    }
> +
>      if (p->quit) {
>          error_setg(&local_err, "multifd: send id %d already quit", p->id);
>          return ;
> -- 
> 1.8.3.1
> 
-- 
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK


