Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 01AF06AE8A1
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Mar 2023 18:18:11 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pZawP-0001da-20; Tue, 07 Mar 2023 12:17:33 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1pZawM-0001cr-C5
 for qemu-devel@nongnu.org; Tue, 07 Mar 2023 12:17:30 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1pZawK-0007N8-O6
 for qemu-devel@nongnu.org; Tue, 07 Mar 2023 12:17:29 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1678209448;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=sRrosd99JiWrFqzZKPL2kqhEm/oz2BqdFsRR8BMO8ug=;
 b=ivOjOFRKJyBB0MxAKUZ8x7POrGF48vnDPL7YtmbTLQQlCaM+9jA/5Us3N5rw3/nHMnEP0T
 oDpz47bN483xPbaMLJONm++97VwGUdAXYaToo62ygob5taOcATV0FGG2978knSJ1GFeTgT
 3yt3oyzgJpXN69vTqx1NeKftYYp2Ru0=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-634-cdsFPBMCNgeKVMdVQh2PxA-1; Tue, 07 Mar 2023 12:17:26 -0500
X-MC-Unique: cdsFPBMCNgeKVMdVQh2PxA-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
 [10.11.54.10])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 0E1213C0F227;
 Tue,  7 Mar 2023 17:17:25 +0000 (UTC)
Received: from redhat.com (unknown [10.39.193.72])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id D5FCC492B00;
 Tue,  7 Mar 2023 17:17:23 +0000 (UTC)
Date: Tue, 7 Mar 2023 18:17:22 +0100
From: Kevin Wolf <kwolf@redhat.com>
To: Stefan Hajnoczi <stefanha@redhat.com>
Cc: qemu-devel@nongnu.org, Fam Zheng <fam@euphon.net>, qemu-block@nongnu.org,
 Emanuele Giuseppe Esposito <eesposit@redhat.com>,
 Markus Armbruster <armbru@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Hanna Reitz <hreitz@redhat.com>
Subject: Re: [PATCH 1/6] block: don't acquire AioContext lock in
 bdrv_drain_all()
Message-ID: <ZAdxog0T8XkSSUZd@redhat.com>
References: <20230301205801.2453491-1-stefanha@redhat.com>
 <20230301205801.2453491-2-stefanha@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230301205801.2453491-2-stefanha@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.10
Received-SPF: pass client-ip=170.10.133.124; envelope-from=kwolf@redhat.com;
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

Am 01.03.2023 um 21:57 hat Stefan Hajnoczi geschrieben:
> There is no need for the AioContext lock in bdrv_drain_all() because
> nothing in AIO_WAIT_WHILE() needs the lock and the condition is atomic.
> 
> Note that the NULL AioContext argument to AIO_WAIT_WHILE() is odd. In
> the future it can be removed.

It can be removed for all callers that run in the main loop context. For
code running in an iothread, it's still important to pass a non-NULL
context. This makes me doubt that the ctx parameter can really be
removed without changing more.

Is your plan to remove the if from AIO_WAIT_WHILE_INTERNAL(), too, and
to poll qemu_get_current_aio_context() instead of ctx_ or the main
context?

> There is an assertion in
> AIO_WAIT_WHILE() that checks that we're in the main loop AioContext and
> we would lose that check by dropping the argument. However, that was a
> precursor to the GLOBAL_STATE_CODE()/IO_CODE() macros and is now a
> duplicate check. So I think we won't lose much by dropping it, but let's
> do a few more AIO_WAIT_WHILE_UNLOCKED() coversions of this sort to
> confirm this is the case.
> 
> Signed-off-by: Stefan Hajnoczi <stefanha@redhat.com>

Yes, it seems that we don't lose much, except maybe some consistency in
the intermediate state. The commit message could state a bit more
directly what we gain, though. Since you mention removing the parameter
as a future possibility, I assume that's the goal with it, but I
wouldn't be sure just from reading the commit message.

Kevin


