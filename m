Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B9BC14B2501
	for <lists+qemu-devel@lfdr.de>; Fri, 11 Feb 2022 12:57:03 +0100 (CET)
Received: from localhost ([::1]:53800 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nIUXu-0002f2-Tb
	for lists+qemu-devel@lfdr.de; Fri, 11 Feb 2022 06:57:02 -0500
Received: from eggs.gnu.org ([209.51.188.92]:35138)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1nIUVf-00017a-Qc
 for qemu-devel@nongnu.org; Fri, 11 Feb 2022 06:54:43 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:31534)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1nIUVc-0007g2-Io
 for qemu-devel@nongnu.org; Fri, 11 Feb 2022 06:54:42 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1644580478;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=w72ONOiYvw75ZOHe2ORIlweVqO3P1Xf/1XXkGdpxqiE=;
 b=SSDnD4Xu0FCutO2IR01Tj4llybHbvvaJYFVyV9FjL5GYFKemsRpehqFa5zSABc/EGZqkAc
 1gY3SeGB1UYFZoQaAH0TTn6wK3lvzLOXJPoPbiWimH2Ijq5ma68J63KB6wcANDNzOrQx1h
 X4rOE4yGOe4W4hwtSN4n0oxpvF0dpIw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-202-EKOnlJk_OAS_WN4-3a-33w-1; Fri, 11 Feb 2022 06:54:35 -0500
X-MC-Unique: EKOnlJk_OAS_WN4-3a-33w-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 6514E192D787;
 Fri, 11 Feb 2022 11:54:34 +0000 (UTC)
Received: from redhat.com (unknown [10.39.194.97])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 1A09E7C0F9;
 Fri, 11 Feb 2022 11:54:31 +0000 (UTC)
Date: Fri, 11 Feb 2022 12:54:30 +0100
From: Kevin Wolf <kwolf@redhat.com>
To: Emanuele Giuseppe Esposito <eesposit@redhat.com>
Subject: Re: [PATCH 1/6] block/io.c: fix bdrv_child_cb_drained_begin
 invocations from a coroutine
Message-ID: <YgZOdni4B7/mIQQ6@redhat.com>
References: <20220208153655.1251658-1-eesposit@redhat.com>
 <20220208153655.1251658-2-eesposit@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20220208153655.1251658-2-eesposit@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kwolf@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: Fam Zheng <fam@euphon.net>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>, qemu-block@nongnu.org,
 qemu-devel@nongnu.org, Hanna Reitz <hreitz@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 John Snow <jsnow@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Am 08.02.2022 um 16:36 hat Emanuele Giuseppe Esposito geschrieben:
> Using bdrv_do_drained_begin_quiesce() in bdrv_child_cb_drained_begin()
> is not a good idea: the callback might be called when running
> a drain in a coroutine, and bdrv_drained_begin_poll() does not
> handle that case, resulting in assertion failure.

I remembered that we talked about this only recently on IRC, but it
didn't make any sense to me again when I read this commit message. So I
think we need --verbose.

The .drained_begin callback was always meant to run outside of coroutine
context, so the unexpected part isn't that it calls a function that
can't run in coroutine context, but that it is already called itself in
coroutine context.

The problematic path is bdrv_replace_child_noperm() which then calls
bdrv_parent_drained_begin_single(poll=true). Polling in coroutine
context is dangerous, it can cause deadlocks because the caller of the
coroutine can't make progress. So I believe this call is already wrong
in coroutine context.

Now I don't know the call path up to bdrv_replace_child_noperm(), but as
far as I remember, that was another function that was originally never
run in coroutine context. Maybe we have good reason to change this, I
can't point to anything that would be inherently wrong with it, but I
would still be curious in which context it does run in a coroutine now.

Anyway, whatever the specific place is, I believe we must drop out of
coroutine context _before_ calling bdrv_parent_drained_begin_single(),
not only in callbacks called by it.

> Instead, bdrv_do_drained_begin with no recursion and poll
> will accomplish the same thing (invoking bdrv_do_drained_begin_quiesce)
> but will firstly check if we are already in a coroutine, and exit
> from that via bdrv_co_yield_to_drain().
> 
> Signed-off-by: Emanuele Giuseppe Esposito <eesposit@redhat.com>

Kevin


