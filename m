Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D37A038892C
	for <lists+qemu-devel@lfdr.de>; Wed, 19 May 2021 10:12:47 +0200 (CEST)
Received: from localhost ([::1]:34058 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ljHJt-0000dx-M4
	for lists+qemu-devel@lfdr.de; Wed, 19 May 2021 04:12:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51992)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1ljHJ7-0008P9-HP
 for qemu-devel@nongnu.org; Wed, 19 May 2021 04:11:57 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:60377)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1ljHJ4-0006If-D4
 for qemu-devel@nongnu.org; Wed, 19 May 2021 04:11:56 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1621411912;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=wvvcrMszW4A9Cpgf/bloYFOSPDQmCUA2frwA2BXOdvY=;
 b=Ec1ZJ4jDroRusksTGg0cEYhwfyC3G93GodiVebElOUf/rYkHcW1Y2tL2RGAx0YtKeJ61i+
 Nqg+ZAKmkuZaVNVbN/Z/C48IKDSC/vcmWWPO5FJuAh8Om2uFIH23ZULax8ITM0MoXVwt20
 O/DPU3UPcJXKLg62DuxHKf9xGFdRwkU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-277-2UPz5y3ROZKOfeAQd9cbcg-1; Wed, 19 May 2021 04:11:50 -0400
X-MC-Unique: 2UPz5y3ROZKOfeAQd9cbcg-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 75662801106;
 Wed, 19 May 2021 08:11:49 +0000 (UTC)
Received: from work-vm (ovpn-115-77.ams2.redhat.com [10.36.115.77])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 2814D5D762;
 Wed, 19 May 2021 08:11:48 +0000 (UTC)
Date: Wed, 19 May 2021 09:11:45 +0100
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: Li Zhijian <lizhijian@cn.fujitsu.com>
Subject: Re: [PATCH v2] migration/rdma: Fix cm_event used before being
 initialized
Message-ID: <YKTIQdFEr4xN5d3C@work-vm>
References: <20210519064740.10828-1-lizhijian@cn.fujitsu.com>
MIME-Version: 1.0
In-Reply-To: <20210519064740.10828-1-lizhijian@cn.fujitsu.com>
User-Agent: Mutt/2.0.7 (2021-05-04)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dgilbert@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=dgilbert@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.374,
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
> A segmentation fault was triggered when i try to abort a postcopy + rdma
> migration.
> 
> since rdma_ack_cm_event releases a uninitialized cm_event in these case.
> 
> like below:
> 2496     ret = rdma_get_cm_event(rdma->channel, &cm_event);
> 2497     if (ret) {
> 2498         perror("rdma_get_cm_event after rdma_connect");
> 2499         ERROR(errp, "connecting to destination!");
> 2500         rdma_ack_cm_event(cm_event); <<<< cause segmentation fault
> 2501         goto err_rdma_source_connect;
> 2502     }
> 
> Refer to the rdma_get_cm_event() code, cm_event will be
> updated/changed only if rdma_get_cm_event() returns 0. So it's okey to
> remove the ack in error patch.
> 
> Signed-off-by: Li Zhijian <lizhijian@cn.fujitsu.com>

Thanks!


Reviewed-by: Dr. David Alan Gilbert <dgilbert@redhat.com>

> ---
> V2: remove ack from the error patch (Dave)
> ---
>  migration/rdma.c | 1 -
>  1 file changed, 1 deletion(-)
> 
> diff --git a/migration/rdma.c b/migration/rdma.c
> index 00eac34232..41726cc74a 100644
> --- a/migration/rdma.c
> +++ b/migration/rdma.c
> @@ -2497,7 +2497,6 @@ static int qemu_rdma_connect(RDMAContext *rdma, Error **errp)
>      if (ret) {
>          perror("rdma_get_cm_event after rdma_connect");
>          ERROR(errp, "connecting to destination!");
> -        rdma_ack_cm_event(cm_event);
>          goto err_rdma_source_connect;
>      }
>  
> -- 
> 2.30.2
> 
> 
> 
-- 
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK


