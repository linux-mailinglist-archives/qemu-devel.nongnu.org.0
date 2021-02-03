Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7EF3530E3FA
	for <lists+qemu-devel@lfdr.de>; Wed,  3 Feb 2021 21:21:27 +0100 (CET)
Received: from localhost ([::1]:40818 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l7OeU-0007qv-KJ
	for lists+qemu-devel@lfdr.de; Wed, 03 Feb 2021 15:21:26 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:59642)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1l7Od6-0007Ir-No
 for qemu-devel@nongnu.org; Wed, 03 Feb 2021 15:20:00 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:30293)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1l7Od4-0000nA-IX
 for qemu-devel@nongnu.org; Wed, 03 Feb 2021 15:19:59 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1612383596;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=jKHh6l1JzwxmGapEBJz3KKA6yEXfLU8R3ECvTl6a/3A=;
 b=EHuZRmTEOeAZxmNcZ5ihmQF265zWeFVA4/HgmSOK8+q0nSjAMew2pyrRok5CWCO46yy9Dp
 le8+xaQnv1Rt21isgPmu77nE6WU9mHDRDr/3wiH7JWKMN2mh0PaSth4U37ktm5vLdgrUrJ
 lvnuzerbIRmjKAWUL20BosZXc/HLZb0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-580-XIR1tz7qPqSNYOIf_5tdcA-1; Wed, 03 Feb 2021 15:19:53 -0500
X-MC-Unique: XIR1tz7qPqSNYOIf_5tdcA-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id BD9A38030B1;
 Wed,  3 Feb 2021 20:19:51 +0000 (UTC)
Received: from work-vm (ovpn-115-70.ams2.redhat.com [10.36.115.70])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id BF3B85D74F;
 Wed,  3 Feb 2021 20:19:49 +0000 (UTC)
Date: Wed, 3 Feb 2021 20:19:46 +0000
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: Chuan Zheng <zhengchuan@huawei.com>
Subject: Re: [PATCH v4 16/18] migration/rdma: add rdma_channel into
 Migrationstate field
Message-ID: <20210203201946.GY2950@work-vm>
References: <1612339311-114805-1-git-send-email-zhengchuan@huawei.com>
 <1612339311-114805-17-git-send-email-zhengchuan@huawei.com>
MIME-Version: 1.0
In-Reply-To: <1612339311-114805-17-git-send-email-zhengchuan@huawei.com>
User-Agent: Mutt/1.14.6 (2020-07-11)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
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
> Multifd RDMA is need to poll when we send data, record it.

This looks like it's trying to be the equivalent of the 'static int
next_channel' in multifd_send_pages.

If so, why not mkae this 'multifd_channel' and make the function
'multifd_next_channel' and replace the code in multifd_send_pages to use
this as well, rather than make it a special for rdma.

Dave

> Signed-off-by: Chuan Zheng <zhengchuan@huawei.com>
> ---
>  migration/migration.c |  1 +
>  migration/migration.h |  1 +
>  migration/rdma.c      | 14 ++++++++++++++
>  3 files changed, 16 insertions(+)
> 
> diff --git a/migration/migration.c b/migration/migration.c
> index b8f4844..47bd11d 100644
> --- a/migration/migration.c
> +++ b/migration/migration.c
> @@ -1926,6 +1926,7 @@ void migrate_init(MigrationState *s)
>      s->migration_thread_running = false;
>      s->enabled_rdma_migration = false;
>      s->host_port = NULL;
> +    s->rdma_channel = 0;
>      error_free(s->error);
>      s->error = NULL;
>      s->hostname = NULL;
> diff --git a/migration/migration.h b/migration/migration.h
> index 537ee09..5ff46e6 100644
> --- a/migration/migration.h
> +++ b/migration/migration.h
> @@ -288,6 +288,7 @@ struct MigrationState {
>  
>      /* Need by Multi-RDMA */
>      char *host_port;
> +    int rdma_channel;
>  };
>  
>  void migrate_set_state(int *state, int old_state, int new_state);
> diff --git a/migration/rdma.c b/migration/rdma.c
> index f5eb563..2097839 100644
> --- a/migration/rdma.c
> +++ b/migration/rdma.c
> @@ -183,6 +183,20 @@ typedef struct {
>  } RDMAWorkRequestData;
>  
>  /*
> + * Get the multifd RDMA channel used to send data.
> + */
> +static int get_multifd_RDMA_channel(void)
> +{
> +    int thread_count = migrate_multifd_channels();
> +    MigrationState *s = migrate_get_current();
> +
> +    s->rdma_channel++;
> +    s->rdma_channel %= thread_count;
> +
> +    return s->rdma_channel;
> +}
> +
> +/*
>   * Negotiate RDMA capabilities during connection-setup time.
>   */
>  typedef struct {
> -- 
> 1.8.3.1
> 
-- 
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK


