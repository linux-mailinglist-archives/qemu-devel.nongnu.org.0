Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E17BF6F063A
	for <lists+qemu-devel@lfdr.de>; Thu, 27 Apr 2023 14:55:56 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ps19B-0002wu-Tn; Thu, 27 Apr 2023 08:54:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1ps199-0002w0-Q9
 for qemu-devel@nongnu.org; Thu, 27 Apr 2023 08:54:51 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1ps198-00041x-Cr
 for qemu-devel@nongnu.org; Thu, 27 Apr 2023 08:54:51 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1682600089;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=YhD+mPdC7Q2e1NiKmwDD0dVE8YjM5dihdSdVtqkjVnE=;
 b=AEWG97rcvbtLbVOLN4mFOt/ShXTR3/3h9mcEkov73CJZtJH9micfsu6jUsBjnonKdI8hg5
 NYWEQCYC3HSMzMdOnG7gcOQuvEKgr0R7Evkz+fN/UbVC9ose+x5acVkwyKGNwbmW3skc+V
 6TXgyCPx4xvZtmnCuJ0DABNGTDLBYf8=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-567-VugdNk_iP-uCb255btxVuQ-1; Thu, 27 Apr 2023 08:54:46 -0400
X-MC-Unique: VugdNk_iP-uCb255btxVuQ-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
 [10.11.54.3])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 46C0B1C1300C;
 Thu, 27 Apr 2023 12:54:46 +0000 (UTC)
Received: from redhat.com (unknown [10.39.193.241])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 1927C1121314;
 Thu, 27 Apr 2023 12:54:44 +0000 (UTC)
Date: Thu, 27 Apr 2023 14:54:43 +0200
From: Kevin Wolf <kwolf@redhat.com>
To: Stefan Hajnoczi <stefanha@redhat.com>
Cc: qemu-devel@nongnu.org, qemu-block@nongnu.org, eesposit@redhat.com,
 Peter Lieven <pl@kamp.de>, Hanna Reitz <hreitz@redhat.com>
Subject: Re: [PATCH] block/nfs: avoid BDRV_POLL_WHILE() in
 nfs_co_get_allocated_file_size()
Message-ID: <ZEpwk91dGJ4wnDV9@redhat.com>
References: <20230403233033.408120-1-stefanha@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230403233033.408120-1-stefanha@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.3
Received-SPF: pass client-ip=170.10.129.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -22
X-Spam_score: -2.3
X-Spam_bar: --
X-Spam_report: (-2.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.171,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Am 04.04.2023 um 01:30 hat Stefan Hajnoczi geschrieben:
> Commit 82618d7bc341 ("block: Convert bdrv_get_allocated_file_size() to
> co_wrapper") made nfs_get_allocated_file_size() a coroutine. The
> coroutine still uses BDRV_POLL_WHILE() to wait for the NFS RPC to
> complete.
> 
> Take it a step further and yield the coroutine until the RPC completes.
> This avoids the blocking, nested event loop and unifies
> nfs_co_get_allocated_file_size() with the other coroutine functions that
> send RPCs:
> - Use nfs_co_init_task() to set up a coroutine NFSRPC task.
> - Take client->mutex to protect fd handler state since we're in IO_CODE.
> - Use nfs_co_generic_cb() instead of a specialized callback function.
> - Yield until the task completes.
> 
> Getting rid of BDRV_POLL_WHILE() helps with the multi-queue block layer
> effort where we don't want to take the AioContext lock.
> 
> This commit passes qemu-iotests/check -nfs, except inactivate-failure,
> which also fails before this commit.
> 
> Signed-off-by: Stefan Hajnoczi <stefanha@redhat.com>

This conflicts with Paolo's commit 3fe64abc, which seems to address the
same bug. Your patch does some more cleanup like removing
nfs_get_allocated_file_size_cb() in favour of nfs_co_generic_cb().

Do you want to rebase and send the remaining pieces as a cleanup patch?

Kevin


