Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B7E06CA55B
	for <lists+qemu-devel@lfdr.de>; Mon, 27 Mar 2023 15:15:59 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pgmgp-0002mx-GP; Mon, 27 Mar 2023 09:15:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1pgmgm-0002kD-VK
 for qemu-devel@nongnu.org; Mon, 27 Mar 2023 09:15:09 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1pgmgj-0001pO-2s
 for qemu-devel@nongnu.org; Mon, 27 Mar 2023 09:15:08 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1679922903;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Zv4Vcg2eIl2ktnMY8c5mrUNzhhYHtvOW2ohZj7cVldE=;
 b=SJfcpD3bLEjJw8ISrYvVcgDhjwvt+KZRLh3qTIxwa5nog+blSBI2DTslUB75CIcm2Hvcx6
 uxo9MDZa9R4OLjSh2isDv1OlMOek4Rjhb8dOO6YIXk7gBk9KJqGMb/+Myg993mlDikv+w9
 vegRuml5Ut6etN1z9P3ih6ST5iZsur0=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-617-PmgY0Cs5OO2BamJ5zRiT-w-1; Mon, 27 Mar 2023 09:15:00 -0400
X-MC-Unique: PmgY0Cs5OO2BamJ5zRiT-w-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id BE1B9858F09;
 Mon, 27 Mar 2023 13:14:59 +0000 (UTC)
Received: from redhat.com (unknown [10.39.194.191])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 99FE6C15BA0;
 Mon, 27 Mar 2023 13:14:58 +0000 (UTC)
Date: Mon, 27 Mar 2023 15:14:57 +0200
From: Kevin Wolf <kwolf@redhat.com>
To: Stefan Hajnoczi <stefanha@redhat.com>
Cc: qemu-devel@nongnu.org, qemu-block@nongnu.org,
 Fam Zheng <fam@euphon.net>, qemu-stable@nongnu.org,
 Qing Wang <qinwang@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [PATCH for-8.0 v2] aio-posix: fix race between epoll upgrade and
 aio_set_fd_handler()
Message-ID: <ZCGW0TaUKriIVi4V@redhat.com>
References: <20230323144859.1338495-1-stefanha@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230323144859.1338495-1-stefanha@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.8
Received-SPF: pass client-ip=170.10.129.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Am 23.03.2023 um 15:48 hat Stefan Hajnoczi geschrieben:
> If another thread calls aio_set_fd_handler() while the IOThread event
> loop is upgrading from ppoll(2) to epoll(7) then we might miss new
> AioHandlers. The epollfd will not monitor the new AioHandler's fd,
> resulting in hangs.
> 
> Take the AioHandler list lock while upgrading to epoll. This prevents
> AioHandlers from changing while epoll is being set up. If we cannot lock
> because we're in a nested event loop, then don't upgrade to epoll (it
> will happen next time we're not in a nested call).
> 
> The downside to taking the lock is that the aio_set_fd_handler() thread
> has to wait until the epoll upgrade is finished, which involves many
> epoll_ctl(2) system calls. However, this scenario is rare and I couldn't
> think of another solution that is still simple.
> 
> Reported-by: Qing Wang <qinwang@redhat.com>
> Buglink: https://bugzilla.redhat.com/show_bug.cgi?id=2090998
> Cc: Paolo Bonzini <pbonzini@redhat.com>
> Cc: Fam Zheng <fam@euphon.net>
> Signed-off-by: Stefan Hajnoczi <stefanha@redhat.com>
> ---
> v2:
> - Use qemu_lockcnt_inc_and_unlock() instead of qemu_lockcnt_unlock() [Paolo]

Thanks, applied to the block branch.

Kevin


