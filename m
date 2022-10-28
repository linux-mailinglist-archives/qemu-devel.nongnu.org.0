Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 081566115ED
	for <lists+qemu-devel@lfdr.de>; Fri, 28 Oct 2022 17:34:52 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ooRNN-0007Hl-2d; Fri, 28 Oct 2022 11:34:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1ooRNL-0007HP-9E
 for qemu-devel@nongnu.org; Fri, 28 Oct 2022 11:34:27 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1ooRNJ-0000bR-Ef
 for qemu-devel@nongnu.org; Fri, 28 Oct 2022 11:34:27 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1666971264;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=GQWeDRhariUVr2QC+5BfPjI8ad+Cdck5MZAOQC2z+pI=;
 b=DV846B/mistxFCVGa01n0tIcFf8ItnF5TcxpfXQsvfbXj2bt1lmAHxnbGzvsXF33TSVq6j
 T92ReiW9UTUa6sdHjrqchvlNqbT8V/b/DHoSqRI85In97HMpSBoPJeKuQ6xOXcFJUk7G0q
 19bSnFPCiChr/SuydgwC+dR2r5vWtoo=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-329-v7ilAdAiM6qNkPkNGf9K5g-1; Fri, 28 Oct 2022 11:34:19 -0400
X-MC-Unique: v7ilAdAiM6qNkPkNGf9K5g-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 825663C0F429;
 Fri, 28 Oct 2022 15:34:18 +0000 (UTC)
Received: from redhat.com (unknown [10.39.193.164])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id C776CC15BA8;
 Fri, 28 Oct 2022 15:34:16 +0000 (UTC)
Date: Fri, 28 Oct 2022 17:34:15 +0200
From: Kevin Wolf <kwolf@redhat.com>
To: Emanuele Giuseppe Esposito <eesposit@redhat.com>
Cc: qemu-block@nongnu.org, Hanna Reitz <hreitz@redhat.com>,
 Stefan Weil <sw@weilnetz.de>, Aarushi Mehta <mehta.aaru20@gmail.com>,
 Julia Suvorova <jusual@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 Stefano Garzarella <sgarzare@redhat.com>,
 Fam Zheng <fam@euphon.net>, qemu-devel@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [PATCH v3 3/3] thread-pool: use ThreadPool from the running thread
Message-ID: <Y1v2dwsk7lSnfmg0@redhat.com>
References: <20221028122048.3101120-1-eesposit@redhat.com>
 <20221028122048.3101120-4-eesposit@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221028122048.3101120-4-eesposit@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.8
Received-SPF: pass client-ip=170.10.129.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -25
X-Spam_score: -2.6
X-Spam_bar: --
X-Spam_report: (-2.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.516,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Am 28.10.2022 um 14:20 hat Emanuele Giuseppe Esposito geschrieben:
> Use qemu_get_current_aio_context() where possible, since we always
> submit work to the current thread anyways.
> 
> We want to also be sure that the thread submitting the work is
> the same as the one processing the pool, to avoid adding
> synchronization to the pool list.
> 
> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
> Signed-off-by: Emanuele Giuseppe Esposito <eesposit@redhat.com>
> Reviewed-by: Paolo Bonzini <pbonzini@redhat.com>

> diff --git a/util/thread-pool.c b/util/thread-pool.c
> index 31113b5860..0e26687e97 100644
> --- a/util/thread-pool.c
> +++ b/util/thread-pool.c
> @@ -48,7 +48,7 @@ struct ThreadPoolElement {
>      /* Access to this list is protected by lock.  */
>      QTAILQ_ENTRY(ThreadPoolElement) reqs;
>  
> -    /* Access to this list is protected by the global mutex.  */
> +    /* This list is only written by the thread pool's mother thread.  */
>      QLIST_ENTRY(ThreadPoolElement) all;
>  };
>  
> @@ -251,6 +251,9 @@ BlockAIOCB *thread_pool_submit_aio(ThreadPool *pool,
>  {
>      ThreadPoolElement *req;
>  
> +    /* Assert that the thread submitting work is the same running the pool */
> +    assert(pool->ctx == qemu_get_current_aio_context());
> +
>      req = qemu_aio_get(&thread_pool_aiocb_info, NULL, cb, opaque);
>      req->func = func;
>      req->arg = arg;

Why don't you drop the aio_context_acquire/release() pair in
thread_pool_completion_bh() any more now that we've added the assertion
to show that it's safe?

Kevin


