Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 20E80310D8E
	for <lists+qemu-devel@lfdr.de>; Fri,  5 Feb 2021 17:04:19 +0100 (CET)
Received: from localhost ([::1]:45766 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l83aj-0007oJ-Kd
	for lists+qemu-devel@lfdr.de; Fri, 05 Feb 2021 11:04:17 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:32772)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1l83Yk-000731-Ej
 for qemu-devel@nongnu.org; Fri, 05 Feb 2021 11:02:14 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:40901)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1l83Yg-00039K-R9
 for qemu-devel@nongnu.org; Fri, 05 Feb 2021 11:02:14 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1612540928;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=j7XLtWGYu/YcuJLZotFQJLJ0vVj/BEcBcg5XSbN7LuI=;
 b=CtzXbJ8ypZJ32H6e5YbCKZy12kb3RiLLx9wwqR1t/qtNb4tvplZUp0x6QiZOadR71w0ua2
 AVTZFeSgVBV9poU25DWHQTGo0Cnr2+nH0h9r64vzqO3QiANx9c33Gol6M5LVTQ6GBZbx5B
 nvWDHJTmMXTxESS1wk0QjUoIM8RUVoA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-2-kO0qzTMtPB6QzZdZP0y5QQ-1; Fri, 05 Feb 2021 11:02:02 -0500
X-MC-Unique: kO0qzTMtPB6QzZdZP0y5QQ-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 4709B8710EE;
 Fri,  5 Feb 2021 16:02:01 +0000 (UTC)
Received: from merkur.fritz.box (ovpn-114-240.ams2.redhat.com [10.36.114.240])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id B3E2F5C257;
 Fri,  5 Feb 2021 16:01:59 +0000 (UTC)
Date: Fri, 5 Feb 2021 17:01:58 +0100
From: Kevin Wolf <kwolf@redhat.com>
To: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Subject: Re: [PATCH v2 29/36] blockdev: qmp_x_blockdev_reopen: acquire all
 contexts
Message-ID: <20210205160158.GE7072@merkur.fritz.box>
References: <20201127144522.29991-1-vsementsov@virtuozzo.com>
 <20201127144522.29991-30-vsementsov@virtuozzo.com>
MIME-Version: 1.0
In-Reply-To: <20201127144522.29991-30-vsementsov@virtuozzo.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kwolf@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.352,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

Am 27.11.2020 um 15:45 hat Vladimir Sementsov-Ogievskiy geschrieben:
> During reopen we may add backing bs from other aio context, which may
> lead to changing original context of top bs.
> 
> We are going to move graph modification to prepare stage. So, it will
> be possible that bdrv_flush() in bdrv_reopen_prepare called on bs in
> non-original aio context, which we didn't aquire which leads to crash.
> 
> More correct would be to acquire all aio context we are going to work
> with. And the simplest ways is to just acquire all of them. It may be
> optimized later if needed.
> 
> Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>

I'm afraid it's not as easy. Holding the lock of more than one
AioContext is always a bit risky with respect to deadlocks.

For example, changing the AioContext of a node with
bdrv_set_aio_context_ignore() has explicit rules that are now violated:

 * The caller must own the AioContext lock for the old AioContext of bs, but it
 * must not own the AioContext lock for new_context (unless new_context is the
 * same as the current context of bs).

Draining while holding all AioContext locks is suspicious, too. I think
I have seen deadlocks before, which is why bdrv_drain_all_*() are
careful to only ever lock a single AioContext at a time.

Kevin


