Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 401182AD5ED
	for <lists+qemu-devel@lfdr.de>; Tue, 10 Nov 2020 13:12:51 +0100 (CET)
Received: from localhost ([::1]:46918 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kcSW1-0007nX-TA
	for lists+qemu-devel@lfdr.de; Tue, 10 Nov 2020 07:12:49 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:58160)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1kcSVH-0007Lt-CA
 for qemu-devel@nongnu.org; Tue, 10 Nov 2020 07:12:03 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:36663)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1kcSVF-0007v4-0t
 for qemu-devel@nongnu.org; Tue, 10 Nov 2020 07:12:02 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1605010319;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=KLKW2v0w6WYFsGq8udI0/UtzBM8nR/v4QqXkDkseNIk=;
 b=TPUpicxnHWPH4qu3acHD51/TQPVf78Lxa4ud5cgdHh5Q3AWD6uzvPgSuWQ7sJe6dtrwFCb
 R+TeJVyYldQbqL/oYJ2JbPUDSWh8/DtqcftLaTdlJHN4Vo5pH9g5DYjSZQi/21DQY1VTZ8
 bu+yapqLMOf24dqdLvQUXVaNZZDZTP0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-510-7pvCl8s_N6mwLIe6qZmRZA-1; Tue, 10 Nov 2020 07:11:57 -0500
X-MC-Unique: 7pvCl8s_N6mwLIe6qZmRZA-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id BE55B1006C9B;
 Tue, 10 Nov 2020 12:11:55 +0000 (UTC)
Received: from work-vm (ovpn-115-49.ams2.redhat.com [10.36.115.49])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 4E2FE1A340;
 Tue, 10 Nov 2020 12:11:53 +0000 (UTC)
Date: Tue, 10 Nov 2020 12:11:50 +0000
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: Chuan Zheng <zhengchuan@huawei.com>
Subject: Re: [PATCH v3 03/18] migration/rdma: create multifd_setup_ops for
 Tx/Rx thread
Message-ID: <20201110121150.GD3108@work-vm>
References: <1602908748-43335-1-git-send-email-zhengchuan@huawei.com>
 <1602908748-43335-4-git-send-email-zhengchuan@huawei.com>
MIME-Version: 1.0
In-Reply-To: <1602908748-43335-4-git-send-email-zhengchuan@huawei.com>
User-Agent: Mutt/1.14.6 (2020-07-11)
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dgilbert@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=63.128.21.124; envelope-from=dgilbert@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/10 00:21:06
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
> Create multifd_setup_ops for TxRx thread, no logic change.
> 
> Signed-off-by: Chuan Zheng <zhengchuan@huawei.com>
> ---
>  migration/multifd.c | 44 +++++++++++++++++++++++++++++++++++++++-----
>  migration/multifd.h |  7 +++++++
>  2 files changed, 46 insertions(+), 5 deletions(-)
> 
> diff --git a/migration/multifd.c b/migration/multifd.c
> index 68b171f..1f82307 100644
> --- a/migration/multifd.c
> +++ b/migration/multifd.c
> @@ -383,6 +383,8 @@ struct {
>      int exiting;
>      /* multifd ops */
>      MultiFDMethods *ops;
> +    /* multifd setup ops */
> +    MultiFDSetup *setup_ops;
>  } *multifd_send_state;
>  
>  /*
> @@ -790,8 +792,9 @@ static bool multifd_channel_connect(MultiFDSendParams *p,
>          } else {
>              /* update for tls qio channel */
>              p->c = ioc;
> -            qemu_thread_create(&p->thread, p->name, multifd_send_thread, p,
> -                                   QEMU_THREAD_JOINABLE);
> +            qemu_thread_create(&p->thread, p->name,
> +                               multifd_send_state->setup_ops->send_thread_setup,
> +                               p, QEMU_THREAD_JOINABLE);
>         }
>         return false;
>      }
> @@ -839,6 +842,11 @@ cleanup:
>      multifd_new_send_channel_cleanup(p, sioc, local_err);
>  }
>  
> +static void multifd_send_channel_setup(MultiFDSendParams *p)
> +{
> +    socket_send_channel_create(multifd_new_send_channel_async, p);
> +}
> +
>  int multifd_save_setup(Error **errp)
>  {
>      int thread_count;
> @@ -856,6 +864,7 @@ int multifd_save_setup(Error **errp)
>      multifd_send_state->pages = multifd_pages_init(page_count);
>      qemu_sem_init(&multifd_send_state->channels_ready, 0);
>      qatomic_set(&multifd_send_state->exiting, 0);
> +    multifd_send_state->setup_ops = multifd_setup_ops_init();
>      multifd_send_state->ops = multifd_ops[migrate_multifd_compression()];
>  
>      for (i = 0; i < thread_count; i++) {
> @@ -875,7 +884,7 @@ int multifd_save_setup(Error **errp)
>          p->packet->version = cpu_to_be32(MULTIFD_VERSION);
>          p->name = g_strdup_printf("multifdsend_%d", i);
>          p->tls_hostname = g_strdup(s->hostname);
> -        socket_send_channel_create(multifd_new_send_channel_async, p);
> +        multifd_send_state->setup_ops->send_channel_setup(p);
>      }
>  
>      for (i = 0; i < thread_count; i++) {
> @@ -902,6 +911,8 @@ struct {
>      uint64_t packet_num;
>      /* multifd ops */
>      MultiFDMethods *ops;
> +    /* multifd setup ops */
> +    MultiFDSetup *setup_ops;
>  } *multifd_recv_state;
>  
>  static void multifd_recv_terminate_threads(Error *err)
> @@ -1095,6 +1106,7 @@ int multifd_load_setup(Error **errp)
>      multifd_recv_state->params = g_new0(MultiFDRecvParams, thread_count);
>      qatomic_set(&multifd_recv_state->count, 0);
>      qemu_sem_init(&multifd_recv_state->sem_sync, 0);
> +    multifd_recv_state->setup_ops = multifd_setup_ops_init();
>      multifd_recv_state->ops = multifd_ops[migrate_multifd_compression()];
>  
>      for (i = 0; i < thread_count; i++) {
> @@ -1173,9 +1185,31 @@ bool multifd_recv_new_channel(QIOChannel *ioc, Error **errp)
>      p->num_packets = 1;
>  
>      p->running = true;
> -    qemu_thread_create(&p->thread, p->name, multifd_recv_thread, p,
> -                       QEMU_THREAD_JOINABLE);
> +    multifd_recv_state->setup_ops->recv_channel_setup(ioc, p);
> +    qemu_thread_create(&p->thread, p->name,
> +                       multifd_recv_state->setup_ops->recv_thread_setup,
> +                       p, QEMU_THREAD_JOINABLE);
>      qatomic_inc(&multifd_recv_state->count);
>      return qatomic_read(&multifd_recv_state->count) ==
>             migrate_multifd_channels();
>  }
> +
> +static void multifd_recv_channel_setup(QIOChannel *ioc, MultiFDRecvParams *p)
> +{
> +    return;
> +}
> +
> +static MultiFDSetup multifd_socket_ops = {
> +    .send_thread_setup = multifd_send_thread,
> +    .recv_thread_setup = multifd_recv_thread,
> +    .send_channel_setup = multifd_send_channel_setup,
> +    .recv_channel_setup = multifd_recv_channel_setup
> +};

I don't think you need '_setup' on the thread function names here.

Dave

> +MultiFDSetup *multifd_setup_ops_init(void)
> +{
> +    MultiFDSetup *ops;
> +
> +    ops = &multifd_socket_ops;
> +    return ops;
> +}
> diff --git a/migration/multifd.h b/migration/multifd.h
> index 8d6751f..446315b 100644
> --- a/migration/multifd.h
> +++ b/migration/multifd.h
> @@ -166,6 +166,13 @@ typedef struct {
>      int (*recv_pages)(MultiFDRecvParams *p, uint32_t used, Error **errp);
>  } MultiFDMethods;
>  
> +typedef struct {
> +    void *(*send_thread_setup)(void *opaque);
> +    void *(*recv_thread_setup)(void *opaque);
> +    void (*send_channel_setup)(MultiFDSendParams *p);
> +    void (*recv_channel_setup)(QIOChannel *ioc, MultiFDRecvParams *p);
> +} MultiFDSetup;
> +
>  void multifd_register_ops(int method, MultiFDMethods *ops);
>  
>  #endif
> -- 
> 1.8.3.1
> 
-- 
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK


