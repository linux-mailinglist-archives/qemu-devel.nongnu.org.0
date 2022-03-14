Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 62AD74D8881
	for <lists+qemu-devel@lfdr.de>; Mon, 14 Mar 2022 16:49:43 +0100 (CET)
Received: from localhost ([::1]:48206 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nTmx4-0002M3-HP
	for lists+qemu-devel@lfdr.de; Mon, 14 Mar 2022 11:49:42 -0400
Received: from eggs.gnu.org ([209.51.188.92]:44144)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1nTmtd-0006ME-7w
 for qemu-devel@nongnu.org; Mon, 14 Mar 2022 11:46:09 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:48416)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1nTmtW-0007Za-Ow
 for qemu-devel@nongnu.org; Mon, 14 Mar 2022 11:46:08 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1647272762;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=CBomr4i2qdHcD4X+hkpYtDkRqwcFbzvQ4GFbtECpjUM=;
 b=IjdUItVeDrPvK24BhXqfa6+vGxvev1IAxoAxs4LdZp0A0mlOUGjk+E0TaVlVd9jxMuJQwY
 ZseT3E3/7i3Q2H9cco+qSWy3UBESng4edHNhH6XQGZrTw3CSIX1pp/jZAJUqxHEnxcCZat
 GFMGw7/Yv/mWci6+VwjKNoLsCHkCvr4=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-427-tznzmJ60MmSyUvL6QliX-Q-1; Mon, 14 Mar 2022 11:45:58 -0400
X-MC-Unique: tznzmJ60MmSyUvL6QliX-Q-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
 [10.11.54.1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 3FB63802A6A;
 Mon, 14 Mar 2022 15:45:58 +0000 (UTC)
Received: from redhat.com (unknown [10.22.17.185])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 9D8B441136EE;
 Mon, 14 Mar 2022 15:45:56 +0000 (UTC)
Date: Mon, 14 Mar 2022 10:45:55 -0500
From: Eric Blake <eblake@redhat.com>
To: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Subject: Re: [PATCH v2] block/nbd.c: Fixed IO request coroutine not being
 wakeup when kill NBD server
Message-ID: <20220314154555.vu4ix45c4c4bvffy@redhat.com>
References: <20220309074844.275450-1-lei.rao@intel.com>
 <b903228e-c412-a92a-2b3b-e171cfc5755f@virtuozzo.com>
MIME-Version: 1.0
In-Reply-To: <b903228e-c412-a92a-2b3b-e171cfc5755f@virtuozzo.com>
User-Agent: NeoMutt/20211029-410-d8ee8c
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.1
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eblake@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.129.124; envelope-from=eblake@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: kwolf@redhat.com, qemu-block@nongnu.org, Rao Lei <lei.rao@intel.com>,
 qemu-devel@nongnu.org, chen.zhang@intel.com, hreitz@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Mar 09, 2022 at 04:21:01PM +0300, Vladimir Sementsov-Ogievskiy wrote:
> 09.03.2022 10:48, Rao Lei wrote:
> > During the IO stress test, the IO request coroutine has a probability that is
> > can't be awakened when the NBD server is killed.
> > 
> > The GDB stack is as follows:

> > When we do failover in COLO mode, QEMU will hang while it is waiting for
> > the in-flight IO. From the call trace, we can see the IO request coroutine
> > has yielded in nbd_co_send_request(). When we kill the NBD server, it will never
> > be wake up. Actually, when we do IO stress test, it will have a lot of
> > requests in free_sema queue. When the NBD server is killed, current
> > MAX_NBD_REQUESTS finishes with errors but they wake up at most
> > MAX_NBD_REQEUSTS from the queue. So, let's move qemu_co_queue_next out
> > to fix this issue.
> > 
> > Signed-off-by: Lei Rao<lei.rao@intel.com>
> 
> Reviewed-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>

Thanks; will queue through my NBD tree.

-- 
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3266
Virtualization:  qemu.org | libvirt.org


