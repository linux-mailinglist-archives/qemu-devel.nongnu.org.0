Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E57137FC6A
	for <lists+qemu-devel@lfdr.de>; Thu, 13 May 2021 19:22:05 +0200 (CEST)
Received: from localhost ([::1]:57498 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lhF2C-00020w-4f
	for lists+qemu-devel@lfdr.de; Thu, 13 May 2021 13:22:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49746)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1lhEwK-0002kc-4z
 for qemu-devel@nongnu.org; Thu, 13 May 2021 13:16:03 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:54483)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1lhEwE-0004qg-Oc
 for qemu-devel@nongnu.org; Thu, 13 May 2021 13:15:58 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1620926153;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=fsxeUpb0XBkeerR+/0JDKFO479bwNgbfzYgUn2HB++o=;
 b=QeAn4ajkyusO30Rt2G0VeTX/gejjgO8pj/Ajh/oy5yKk31SAi9aEkAscuIri0xY/Flwd8A
 CbQPGO00D971F0j9+aFThG241oAQezBJreRhpePG6nAbzSkwHBxdbDa+yflXh3+E3T9cNp
 zfRUE4gVVhamKowPaNS3cGwJMXqpXGQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-447-S8S6bFclOeeZCQ0nz3hNlQ-1; Thu, 13 May 2021 13:15:51 -0400
X-MC-Unique: S8S6bFclOeeZCQ0nz3hNlQ-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 806AC107ACE4;
 Thu, 13 May 2021 17:15:50 +0000 (UTC)
Received: from work-vm (ovpn-113-200.ams2.redhat.com [10.36.113.200])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id ABD422B1D0;
 Thu, 13 May 2021 17:15:49 +0000 (UTC)
Date: Thu, 13 May 2021 18:15:47 +0100
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: Li Zhijian <lizhijian@cn.fujitsu.com>
Subject: Re: [PATCH] migration/rdma: Fix cm_event used before being initialized
Message-ID: <YJ1ew79TeJ4pPz1K@work-vm>
References: <20210513113750.22970-1-lizhijian@cn.fujitsu.com>
MIME-Version: 1.0
In-Reply-To: <20210513113750.22970-1-lizhijian@cn.fujitsu.com>
User-Agent: Mutt/2.0.6 (2021-03-06)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dgilbert@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=dgilbert@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.699,
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
> since rdma_ack_cm_event releases a uninitialized cm_event in thise case.
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
> Signed-off-by: Li Zhijian <lizhijian@cn.fujitsu.com>

OK, that's an easy fix then; but I wonder if we should perhaps remove
that rdma_ack_cm_event, if it's the get_cm_event that's failed?

Still,


Reviewed-by: Dr. David Alan Gilbert <dgilbert@redhat.com>

> ---
>  migration/rdma.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/migration/rdma.c b/migration/rdma.c
> index 00eac34232..2dadb62aed 100644
> --- a/migration/rdma.c
> +++ b/migration/rdma.c
> @@ -2466,7 +2466,7 @@ static int qemu_rdma_connect(RDMAContext *rdma, Error **errp)
>                                            .private_data = &cap,
>                                            .private_data_len = sizeof(cap),
>                                          };
> -    struct rdma_cm_event *cm_event;
> +    struct rdma_cm_event *cm_event = NULL;
>      int ret;
>  
>      /*
> -- 
> 2.30.2
> 
> 
> 
-- 
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK


