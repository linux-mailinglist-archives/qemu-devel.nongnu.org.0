Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C8DE38F375
	for <lists+qemu-devel@lfdr.de>; Mon, 24 May 2021 21:06:25 +0200 (CEST)
Received: from localhost ([::1]:39644 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1llFuB-0005CA-Vo
	for lists+qemu-devel@lfdr.de; Mon, 24 May 2021 15:06:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47506)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1llFru-0004GG-9X
 for qemu-devel@nongnu.org; Mon, 24 May 2021 15:04:02 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:32775)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1llFrq-00045Q-TV
 for qemu-devel@nongnu.org; Mon, 24 May 2021 15:04:00 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1621883037;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=6BXkOYrp5a1roNyQUXv+xF0hJCVDTx8xIyHRjh2/6+g=;
 b=VLHKyTgnXYO4Zxf9wFqiqlRx2Td6oCbHpLzp97ygsLd1DadZSxD4uQArWRuszMcjhkS033
 mGUD2krIDN6fZSQ5Bw9D1LspqG1w/fUDUsSdZTnC511ik0cDsFXtQdOt5JlMP6rbk4DUS6
 +3MCq1M86JyyFGfQNtruUWYWClwNPe0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-368-nYRIYy0lPL2M93h7ldKkVA-1; Mon, 24 May 2021 15:03:55 -0400
X-MC-Unique: nYRIYy0lPL2M93h7ldKkVA-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 05BAA1854E2A;
 Mon, 24 May 2021 19:03:55 +0000 (UTC)
Received: from work-vm (ovpn-112-207.ams2.redhat.com [10.36.112.207])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 1E7EB5D9C0;
 Mon, 24 May 2021 19:03:53 +0000 (UTC)
Date: Mon, 24 May 2021 20:03:51 +0100
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: Li Zhijian <lizhijian@cn.fujitsu.com>
Subject: Re: [PATCH RESEND 2/4] migration/rdma: Fix rdma_addrinfo res leaks
Message-ID: <YKv4lxNnb8ssrpHR@work-vm>
References: <20210520081148.17001-1-lizhijian@cn.fujitsu.com>
 <20210520081148.17001-2-lizhijian@cn.fujitsu.com>
MIME-Version: 1.0
In-Reply-To: <20210520081148.17001-2-lizhijian@cn.fujitsu.com>
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
> rdma_freeaddrinfo() is the reverse operation of rdma_getaddrinfo()
> 
> Signed-off-by: Li Zhijian <lizhijian@cn.fujitsu.com>

Reviewed-by: Dr. David Alan Gilbert <dgilbert@redhat.com>

That call seems entirely undocumented, but looks like it's been there at
least 10 years.

> ---
>  migration/rdma.c | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/migration/rdma.c b/migration/rdma.c
> index 7e7595faab..651534e825 100644
> --- a/migration/rdma.c
> +++ b/migration/rdma.c
> @@ -987,10 +987,12 @@ static int qemu_rdma_resolve_host(RDMAContext *rdma, Error **errp)
>          }
>      }
>  
> +    rdma_freeaddrinfo(res);
>      ERROR(errp, "could not resolve address %s", rdma->host);
>      goto err_resolve_get_addr;
>  
>  route:
> +    rdma_freeaddrinfo(res);
>      qemu_rdma_dump_gid("source_resolve_addr", rdma->cm_id);
>  
>      ret = rdma_get_cm_event(rdma->channel, &cm_event);
> @@ -2593,6 +2595,7 @@ static int qemu_rdma_dest_init(RDMAContext *rdma, Error **errp)
>          break;
>      }
>  
> +    rdma_freeaddrinfo(res);
>      if (!e) {
>          ERROR(errp, "Error: could not rdma_bind_addr!");
>          goto err_dest_init_bind_addr;
> -- 
> 2.30.2
> 
> 
> 
-- 
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK


