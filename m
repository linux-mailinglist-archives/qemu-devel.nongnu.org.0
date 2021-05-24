Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 670B338F378
	for <lists+qemu-devel@lfdr.de>; Mon, 24 May 2021 21:08:01 +0200 (CEST)
Received: from localhost ([::1]:45738 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1llFvk-0000xs-GV
	for lists+qemu-devel@lfdr.de; Mon, 24 May 2021 15:08:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48070)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1llFuC-0006Y3-Ny
 for qemu-devel@nongnu.org; Mon, 24 May 2021 15:06:24 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:23526)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1llFu7-0005k4-D2
 for qemu-devel@nongnu.org; Mon, 24 May 2021 15:06:24 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1621883178;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=AgRe5uZVS5i/pEx7J2YnJj0mjQtXiaAZZj90Quoq+O8=;
 b=JCVEBpauQYUjymhk7l5Tftb0o1KatVnAabQFiPxPMDVrDGDxYNz0MW0JLypvLwy7gTAZqd
 /3iLJdo7ufycOFmdSY0bG6GbSF1vhWeWuDRRl/d+8tSSUPyYtVtnFrelAfrk5Tf6LFB2zd
 fWRhJK5Bf/esYnNdFqMRn/RQ1gC/kFc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-330-vPwNMpXpOCSd8QH2zj3D3w-1; Mon, 24 May 2021 15:06:17 -0400
X-MC-Unique: vPwNMpXpOCSd8QH2zj3D3w-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 38B6E803621;
 Mon, 24 May 2021 19:06:16 +0000 (UTC)
Received: from work-vm (ovpn-112-207.ams2.redhat.com [10.36.112.207])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 658755D9C0;
 Mon, 24 May 2021 19:06:15 +0000 (UTC)
Date: Mon, 24 May 2021 20:06:12 +0100
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: Li Zhijian <lizhijian@cn.fujitsu.com>
Subject: Re: [PATCH RESEND 1/4] migration/rdma: cleanup rmda in
 rdma_start_incoming_migration error path
Message-ID: <YKv5JOhp7bje8R5w@work-vm>
References: <20210520081148.17001-1-lizhijian@cn.fujitsu.com>
MIME-Version: 1.0
In-Reply-To: <20210520081148.17001-1-lizhijian@cn.fujitsu.com>
User-Agent: Mutt/2.0.7 (2021-05-04)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dgilbert@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=dgilbert@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.371,
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
Cc: qemu-devel@nongnu.org, quintela@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

* Li Zhijian (lizhijian@cn.fujitsu.com) wrote:
> the error path after calling qemu_rdma_dest_init() should do rdma cleanup
> 
> Signed-off-by: Li Zhijian <lizhijian@cn.fujitsu.com>

Reviewed-by: Dr. David Alan Gilbert <dgilbert@redhat.com>

> ---
>  migration/rdma.c | 7 +++++--
>  1 file changed, 5 insertions(+), 2 deletions(-)
> 
> diff --git a/migration/rdma.c b/migration/rdma.c
> index 41726cc74a..7e7595faab 100644
> --- a/migration/rdma.c
> +++ b/migration/rdma.c
> @@ -4040,7 +4040,7 @@ void rdma_start_incoming_migration(const char *host_port, Error **errp)
>  
>      if (ret) {
>          ERROR(errp, "listening on socket!");
> -        goto err;
> +        goto cleanup_rdma;
>      }
>  
>      trace_rdma_start_incoming_migration_after_rdma_listen();
> @@ -4050,7 +4050,7 @@ void rdma_start_incoming_migration(const char *host_port, Error **errp)
>          rdma_return_path = qemu_rdma_data_init(host_port, &local_err);
>  
>          if (rdma_return_path == NULL) {
> -            goto err;
> +            goto cleanup_rdma;
>          }
>  
>          qemu_rdma_return_path_dest_init(rdma_return_path, rdma);
> @@ -4059,6 +4059,9 @@ void rdma_start_incoming_migration(const char *host_port, Error **errp)
>      qemu_set_fd_handler(rdma->channel->fd, rdma_accept_incoming_migration,
>                          NULL, (void *)(intptr_t)rdma);
>      return;
> +
> +cleanup_rdma:
> +    qemu_rdma_cleanup(rdma);
>  err:
>      error_propagate(errp, local_err);
>      if (rdma) {
> -- 
> 2.30.2
> 
> 
> 
-- 
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK


