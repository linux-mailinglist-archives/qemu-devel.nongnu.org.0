Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 41F35697B1C
	for <lists+qemu-devel@lfdr.de>; Wed, 15 Feb 2023 12:49:34 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pSGH4-0003co-Fc; Wed, 15 Feb 2023 06:48:34 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1pSGH2-0003cE-5k
 for qemu-devel@nongnu.org; Wed, 15 Feb 2023 06:48:32 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1pSGH0-0001o5-2s
 for qemu-devel@nongnu.org; Wed, 15 Feb 2023 06:48:31 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1676461708;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=lyFpfhmDv0IdPdcN7WJRFvoKxaRlZPW58GQKDqVDuto=;
 b=TU/YJo2IG3l8f9njt81ja8PvwwG6tVcDa16YWZ1UlWRpMikxTwp6jusmzPf7QIZ/sKTuJW
 23ME2CzyWJxfDW90NkM5YrVgVfVBI2NVO62NXfRkoD9Hw21MD+Um07bB0YVGiK0MRah6zd
 JDS87ljgnpIgGE0nswxNQZB39etygM0=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-49-T5XovjVBOuy9lhYd7wut4w-1; Wed, 15 Feb 2023 06:48:27 -0500
X-MC-Unique: T5XovjVBOuy9lhYd7wut4w-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
 [10.11.54.6])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id C63D629A9CB0;
 Wed, 15 Feb 2023 11:48:25 +0000 (UTC)
Received: from redhat.com (unknown [10.39.194.224])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id E14042166B30;
 Wed, 15 Feb 2023 11:48:24 +0000 (UTC)
Date: Wed, 15 Feb 2023 12:48:23 +0100
From: Kevin Wolf <kwolf@redhat.com>
To: Stefano Garzarella <sgarzare@redhat.com>
Cc: qemu-devel@nongnu.org, qemu-block@nongnu.org,
 Hanna Reitz <hreitz@redhat.com>, Aihua Liang <aliang@redhat.com>
Subject: Re: [PATCH v2] block: temporarily hold the new AioContext of bs_top
 in bdrv_append()
Message-ID: <Y+zGh+VSRcvnFdDr@redhat.com>
References: <20230214171621.11574-1-sgarzare@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230214171621.11574-1-sgarzare@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.6
Received-SPF: pass client-ip=170.10.129.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

Am 14.02.2023 um 18:16 hat Stefano Garzarella geschrieben:
> bdrv_append() is called with bs_top AioContext held, but
> bdrv_attach_child_noperm() could change the AioContext of bs_top.
> 
> bdrv_replace_node_noperm() calls bdrv_drained_begin() starting from
> commit 2398747128 ("block: Don't poll in bdrv_replace_child_noperm()").
> bdrv_drained_begin() can call BDRV_POLL_WHILE that assumes the new lock
> is taken, so let's temporarily hold the new AioContext to prevent QEMU
> from failing in BDRV_POLL_WHILE when it tries to release the wrong
> AioContext.
> 
> Buglink: https://bugzilla.redhat.com/show_bug.cgi?id=2168209
> Reported-by: Aihua Liang <aliang@redhat.com>
> Signed-off-by: Stefano Garzarella <sgarzare@redhat.com>

Thanks, applied to the block branch.

Kevin


