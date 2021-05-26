Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 078F7391620
	for <lists+qemu-devel@lfdr.de>; Wed, 26 May 2021 13:29:24 +0200 (CEST)
Received: from localhost ([::1]:54836 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1llrj1-0007Wh-2l
	for lists+qemu-devel@lfdr.de; Wed, 26 May 2021 07:29:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54430)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1llrgt-0005wn-7J
 for qemu-devel@nongnu.org; Wed, 26 May 2021 07:27:11 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:47102)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1llrgo-0005Wn-GI
 for qemu-devel@nongnu.org; Wed, 26 May 2021 07:27:09 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1622028423;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=lTLSgO8q2cGKdQNIGcjPQlbSImYVdfSp28asWGrNcgg=;
 b=DSbIyIcl9U7DN92Ec99uqNi/pxRGVQkwcKyJN/LxJePqf/3P5X3EEdh7jF53/EHOrXm6wf
 z3GYvipAilTS6Wrhgwm8H2Nq06VLNcZiGwdszYrhXYHMCyiyJHAXqyEkLtI0ypwRMEFeUX
 Tpv9np49SkbWAV2LhJJNyX1wp2ZZcYI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-44-XvdtuxBUPnKqaaHpDd3G_A-1; Wed, 26 May 2021 07:27:02 -0400
X-MC-Unique: XvdtuxBUPnKqaaHpDd3G_A-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 32C55180FD66;
 Wed, 26 May 2021 11:27:01 +0000 (UTC)
Received: from work-vm (ovpn-114-247.ams2.redhat.com [10.36.114.247])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 9C3736A046;
 Wed, 26 May 2021 11:26:59 +0000 (UTC)
Date: Wed, 26 May 2021 12:26:57 +0100
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: Li Zhijian <lizhijian@cn.fujitsu.com>
Subject: Re: [PATCH v2] migration/rdma: Fix cm_event used before being
 initialized
Message-ID: <YK4wgbUwUWJzEKbU@work-vm>
References: <20210519064740.10828-1-lizhijian@cn.fujitsu.com>
MIME-Version: 1.0
In-Reply-To: <20210519064740.10828-1-lizhijian@cn.fujitsu.com>
User-Agent: Mutt/2.0.7 (2021-05-04)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
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

Queued

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
> 
-- 
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK


