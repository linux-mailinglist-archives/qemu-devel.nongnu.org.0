Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AEC4A316946
	for <lists+qemu-devel@lfdr.de>; Wed, 10 Feb 2021 15:41:07 +0100 (CET)
Received: from localhost ([::1]:58952 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l9qfy-0007Av-PS
	for lists+qemu-devel@lfdr.de; Wed, 10 Feb 2021 09:41:06 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:42294)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1l9qdt-0006DI-1J
 for qemu-devel@nongnu.org; Wed, 10 Feb 2021 09:38:58 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:23692)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1l9qdq-0004iv-SD
 for qemu-devel@nongnu.org; Wed, 10 Feb 2021 09:38:56 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1612967934;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=lVQpVgwYEBPnUZRgurTdJ8uSWYXuiIi7ky6CuTEyw7Y=;
 b=ZeafESWs2VWqi6gALD5yxWBrS5XtlyF76HHtD9eX/ygauE5pCOFAo52A7RPcBzJ4ImkimY
 XugUTQjBLXKuOFmrkgodXkL15ArlxW6P7aewHXFKUtw0g3fdPBlMQDFERVr+ijOeFaLFLG
 ItEpTMClQ3y7Fmzp7aeyZk75cw2GM60=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-256-z6vL9kKWM9iELmQjWQ3LHw-1; Wed, 10 Feb 2021 09:38:52 -0500
X-MC-Unique: z6vL9kKWM9iELmQjWQ3LHw-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id EE1E5801962;
 Wed, 10 Feb 2021 14:38:50 +0000 (UTC)
Received: from merkur.fritz.box (ovpn-115-33.ams2.redhat.com [10.36.115.33])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 8326360C0F;
 Wed, 10 Feb 2021 14:38:49 +0000 (UTC)
Date: Wed, 10 Feb 2021 15:38:47 +0100
From: Kevin Wolf <kwolf@redhat.com>
To: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Subject: Re: [PATCH v2 30/36] block: bdrv_reopen_multiple: refresh
 permissions on updated graph
Message-ID: <20210210143847.GE5144@merkur.fritz.box>
References: <20201127144522.29991-1-vsementsov@virtuozzo.com>
 <20201127144522.29991-31-vsementsov@virtuozzo.com>
 <20210205175706.GI7072@merkur.fritz.box>
 <88b2a88e-e5dd-9ce6-a11c-20ba2c4befa9@virtuozzo.com>
MIME-Version: 1.0
In-Reply-To: <88b2a88e-e5dd-9ce6-a11c-20ba2c4befa9@virtuozzo.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kwolf@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=63.128.21.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -33
X-Spam_score: -3.4
X-Spam_bar: ---
X-Spam_report: (-3.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.568,
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
Cc: qemu-block@nongnu.org, armbru@redhat.com, qemu-devel@nongnu.org,
 mreitz@redhat.com, den@openvz.org, jsnow@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Am 08.02.2021 um 12:21 hat Vladimir Sementsov-Ogievskiy geschrieben:
> > Come to think of it, the AioContext handling is probably wrong already
> > before your series. reopen_commit for one node could move the whole tree
> > to a different context and then the later nodes would all be processed
> > while holding the wrong lock.
> 
> Probably proper way is to acquire all involved aio contexts as I do in
> 29 and update aio-context updating functions to work in such
> conditions(all aio contexts are already acquired by caller).

Whoops, what I gave was kind of a non-answer...

So essentially the reason for the locking rules of changing the
AioContext is that they drain the node first and drain imposes the
locking rule that the AioContext for the node to be drained must be
locked, and all other AioContexts must be unlocked.

The reason why drain imposes the rule is that we run AIO_WAIT_WHILE() in
one thread and we may need the event loops in other threads to make
progress until the while condition can eventually become false. If other
threads can't make progress because their lock is taken, we'll see
deadlocks sooner or later.

Kevin


