Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BD8E82ADC76
	for <lists+qemu-devel@lfdr.de>; Tue, 10 Nov 2020 17:53:08 +0100 (CET)
Received: from localhost ([::1]:37930 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kcWtE-0008QC-TV
	for lists+qemu-devel@lfdr.de; Tue, 10 Nov 2020 11:53:04 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:44152)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1kcWru-0007x9-5X
 for qemu-devel@nongnu.org; Tue, 10 Nov 2020 11:51:42 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:41458)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1kcWrr-0003Qz-I7
 for qemu-devel@nongnu.org; Tue, 10 Nov 2020 11:51:40 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1605027098;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Gi/U1YhD4f4WexL1ikLctAIvMW2v2EE+xIXCVB63jPQ=;
 b=KJtdiBYTGrnJf7NX9VOKKw2YdXEGQUcx4aF96mb4knG48Y600d8XolRIrmGXpZYGYJIA8T
 ET+Mv76wQdNIb/UCCiFy7jMD55RZEmebtm6qmOiWmLMfJCW4omO93EvQ/ILHaMvdXsqMhk
 R2n6lCmlXP7/E07S6NKik9/P/ZWetTg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-369-MROssHNSMlOUMvmQhAwj2g-1; Tue, 10 Nov 2020 11:51:36 -0500
X-MC-Unique: MROssHNSMlOUMvmQhAwj2g-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 24A99800688;
 Tue, 10 Nov 2020 16:51:35 +0000 (UTC)
Received: from work-vm (ovpn-115-49.ams2.redhat.com [10.36.115.49])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 287F47665F;
 Tue, 10 Nov 2020 16:51:32 +0000 (UTC)
Date: Tue, 10 Nov 2020 16:51:30 +0000
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: Chuan Zheng <zhengchuan@huawei.com>
Subject: Re: [PATCH v3 09/18] migration/rdma: add multifd_rdma_load_setup()
 to setup multifd rdma
Message-ID: <20201110165130.GF3108@work-vm>
References: <1602908748-43335-1-git-send-email-zhengchuan@huawei.com>
 <1602908748-43335-10-git-send-email-zhengchuan@huawei.com>
MIME-Version: 1.0
In-Reply-To: <1602908748-43335-10-git-send-email-zhengchuan@huawei.com>
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

Reviewed-by: Dr. David Alan Gilbert <dgilbert@redhat.com>

> ---
>  migration/rdma.c | 52 ++++++++++++++++++++++++++++++++++++++++++++++++++++
>  1 file changed, 52 insertions(+)
> 
> diff --git a/migration/rdma.c b/migration/rdma.c
> index ad4e4ba..2baa933 100644
> --- a/migration/rdma.c
> +++ b/migration/rdma.c
> @@ -4010,6 +4010,48 @@ static void rdma_accept_incoming_migration(void *opaque)
>      }
>  }
>  
> +static bool multifd_rdma_load_setup(const char *host_port,
> +                                    RDMAContext *rdma, Error **errp)
> +{
> +    int thread_count;
> +    int i;
> +    int idx;
> +    MultiFDRecvParams *multifd_recv_param;
> +    RDMAContext *multifd_rdma;
> +
> +    if (!migrate_use_multifd()) {
> +        return true;
> +    }
> +
> +    if (multifd_load_setup(errp) != 0) {
> +        /*
> +         * We haven't been able to create multifd threads
> +         * nothing better to do
> +         */
> +        return false;
> +    }
> +
> +    thread_count = migrate_multifd_channels();
> +    for (i = 0; i < thread_count; i++) {
> +        if (get_multifd_recv_param(i, &multifd_recv_param) < 0) {
> +            ERROR(errp, "rdma: error getting multifd_recv_param(%d)", i);
> +            return false;
> +        }
> +
> +        multifd_rdma = qemu_rdma_data_init(host_port, errp);
> +        for (idx = 0; idx < RDMA_WRID_MAX; idx++) {
> +            multifd_rdma->wr_data[idx].control_len = 0;
> +            multifd_rdma->wr_data[idx].control_curr = NULL;
> +        }
> +        /* the CM channel and CM id is shared */
> +        multifd_rdma->channel = rdma->channel;
> +        multifd_rdma->listen_id = rdma->listen_id;
> +        multifd_recv_param->rdma = (void *)multifd_rdma;
> +    }
> +
> +    return true;
> +}
> +
>  void rdma_start_incoming_migration(const char *host_port, Error **errp)
>  {
>      int ret;
> @@ -4057,6 +4099,16 @@ void rdma_start_incoming_migration(const char *host_port, Error **errp)
>          qemu_rdma_return_path_dest_init(rdma_return_path, rdma);
>      }
>  
> +    /* multifd rdma setup */
> +    if (!multifd_rdma_load_setup(host_port, rdma, &local_err)) {
> +        /*
> +         * We haven't been able to create multifd threads
> +         * nothing better to do
> +         */
> +        error_report_err(local_err);
> +        goto err;
> +    }
> +
>      qemu_set_fd_handler(rdma->channel->fd, rdma_accept_incoming_migration,
>                          NULL, (void *)(intptr_t)rdma);
>      return;
> -- 
> 1.8.3.1
> 
-- 
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK


