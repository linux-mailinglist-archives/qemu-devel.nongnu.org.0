Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 23BFF470254
	for <lists+qemu-devel@lfdr.de>; Fri, 10 Dec 2021 15:02:34 +0100 (CET)
Received: from localhost ([::1]:52820 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mvgTl-0005gL-AL
	for lists+qemu-devel@lfdr.de; Fri, 10 Dec 2021 09:02:29 -0500
Received: from eggs.gnu.org ([209.51.188.92]:40392)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1mvgSV-0004rf-Tj
 for qemu-devel@nongnu.org; Fri, 10 Dec 2021 09:01:11 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:30375)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1mvgSS-0004n5-Cx
 for qemu-devel@nongnu.org; Fri, 10 Dec 2021 09:01:10 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1639144867;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=xMeDsmAgu9Q+F0/ufoihzFGJ1mStNM8UQEidhO8LsYs=;
 b=SLPN4ttaFFQeSdEHtiul76FUNMSPxuALuQf6gwXdpfgCOXnnRljHMwv8X/5LoPjmswazEA
 TOQu0VmVPrFijK9ZeyB3SpPM/cbw4ofi3lXhksrC0UndpoHd60Cwb79eY8YgIzrPHr6W5K
 Ky+Vc0iH+inI+zovcMMZmFA4BNv+TvA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-294-8Ea5H5n9OAWRTsM9R-o08g-1; Fri, 10 Dec 2021 09:01:04 -0500
X-MC-Unique: 8Ea5H5n9OAWRTsM9R-o08g-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 451B210168D0;
 Fri, 10 Dec 2021 14:01:03 +0000 (UTC)
Received: from redhat.com (unknown [10.39.192.255])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id D865960C9F;
 Fri, 10 Dec 2021 14:00:39 +0000 (UTC)
Date: Fri, 10 Dec 2021 15:00:38 +0100
From: Kevin Wolf <kwolf@redhat.com>
To: Stefan Hajnoczi <stefanha@redhat.com>
Subject: Re: [RFC] block-backend: prevent dangling BDS pointer in blk_drain()
Message-ID: <YbNdhnxItT7zmeyn@redhat.com>
References: <20211209142304.381253-1-stefanha@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20211209142304.381253-1-stefanha@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kwolf@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -33
X-Spam_score: -3.4
X-Spam_bar: ---
X-Spam_report: (-3.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.619,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: Hanna Reitz <hreitz@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>, qemu-devel@nongnu.org,
 qemu-block@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Am 09.12.2021 um 15:23 hat Stefan Hajnoczi geschrieben:
> The BlockBackend root child can change during bdrv_drained_begin() when
> aio_poll() is invoked. In fact the BlockDriverState can reach refcnt 0
> and blk_drain() is left with a dangling BDS pointer.
> 
> One example is scsi_device_purge_requests(), which calls blk_drain() to
> wait for in-flight requests to cancel. If the backup blockjob is active,
> then the BlockBackend root child is a temporary filter BDS owned by the
> blockjob. The blockjob can complete during bdrv_drained_begin() and the
> last reference to the BDS is released when the temporary filter node is
> removed. This results in a use-after-free when blk_drain() calls
> bdrv_drained_end(bs) on the dangling pointer.
> 
> The general problem is that a function and its callers must not assume
> that bs is still valid across aio_poll(). Explicitly hold a reference to
> bs in blk_drain() to avoid the dangling pointer.
> 
> Signed-off-by: Stefan Hajnoczi <stefanha@redhat.com>
> ---
> I found that BDS nodes are sometimes deleted with bs->quiesce_counter >
> 0 (at least when running "make check"), so it is currently not possible
> to put the bdrv_ref/unref() calls in bdrv_do_drained_begin() and
> bdrv_do_drained_end() because they will be unbalanced. That would have
> been a more general solution than only fixing blk_drain().

They are not supposed to end up unbalanced because detaching a child
calls bdrv_unapply_subtree_drain(). In fact, I think test-bdrv-drain
tests a few scenarios like this.

Do have more details about the case that failed for you?

Kevin


