Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D01949E4A5
	for <lists+qemu-devel@lfdr.de>; Thu, 27 Jan 2022 15:31:44 +0100 (CET)
Received: from localhost ([::1]:59314 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nD5oN-0006e9-9E
	for lists+qemu-devel@lfdr.de; Thu, 27 Jan 2022 09:31:43 -0500
Received: from eggs.gnu.org ([209.51.188.92]:52618)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1nD5Xk-0007yA-NN
 for qemu-devel@nongnu.org; Thu, 27 Jan 2022 09:14:33 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:22631)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1nD5Xj-00028V-7i
 for qemu-devel@nongnu.org; Thu, 27 Jan 2022 09:14:32 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1643292870;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=/4YQBd0EOyjDHGoIozj1n0eDeMIx6cbGfzYD1y0BC0g=;
 b=W9cW4kyZV5j6szb+mw5Te/A0HL0twRu0skqMY9xvjYjcS0X45hA7iRhztfr7n7BIVtw4vf
 BSbuYCUq+YCIjLGGXTdZDkVa+vp5OHkPE6SGI4k2tpBQr4xILiIxMP6Ogou4di/ros2Mpc
 t3jrRcBaaAqF1Xp7oxdGtUx5FmTWStk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-180-sbATfuhMO76XMICttMkaDQ-1; Thu, 27 Jan 2022 09:14:27 -0500
X-MC-Unique: sbATfuhMO76XMICttMkaDQ-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 31CAE84B9A5;
 Thu, 27 Jan 2022 14:14:26 +0000 (UTC)
Received: from redhat.com (unknown [10.39.195.252])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id B6D3584651;
 Thu, 27 Jan 2022 14:14:15 +0000 (UTC)
Date: Thu, 27 Jan 2022 15:14:14 +0100
From: Kevin Wolf <kwolf@redhat.com>
To: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Subject: Re: [PATCH] block: bdrv_set_backing_hd(): use drained section
Message-ID: <YfKotrIcGEbOKkaO@redhat.com>
References: <20220124173741.2984056-1-vsementsov@virtuozzo.com>
MIME-Version: 1.0
In-Reply-To: <20220124173741.2984056-1-vsementsov@virtuozzo.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kwolf@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.159,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: den@openvz.org, hreitz@redhat.com, qemu-devel@nongnu.org,
 qemu-block@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Am 24.01.2022 um 18:37 hat Vladimir Sementsov-Ogievskiy geschrieben:
> Graph modifications should be done in drained section. stream_prepare()
> handler of block stream job call bdrv_set_backing_hd() without using
> drained section and it's theoretically possible that some IO request
> will interleave with graph modification and will use outdated pointers
> to removed block nodes.
> 
> Some other callers use bdrv_set_backing_hd() not caring about drained
> sections too. So it seems good to make a drained section exactly in
> bdrv_set_backing_hd().
> 
> Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>

Thanks, applied to the block branch.

> Hi all!
> 
> We faced the following bug in our Rhel7-based downstream:
> read request crashes because backing bs is NULL unexpectedly (honestly,
> it crashes inside bdrv_is_allocated(), which is called during read and
> it's a downstream-only code, but that doesn't make real sense).
> 
> In gdb I also see block-stream job in state
> "refcnt = 0, status = JOB_STATUS_NULL", but it's still in jobs list.
> 
> So, I assume that backing file was disappeared exactly as final step of
> block-stream job. And the problem is that this step should be done in
> drained section, but seems that it isn't.
> 
> If we have a drained section, we'd wait for finish of read request
> before removing the backing node.
> 
> I don't have a reproducer. I spent some time to write a test, but there
> are problems that makes hard to use blkdebug's break-points: we have
> drained section at block-stream start, and we do have drained section at
> block-stream finish: bdrv_cor_filter_drop() called from stream_prepare()
> does drained section (unlike bdrv_set_backing_hd()).

Maybe a unit test would be easier to write for this kind of thing than
an iotest?

> So, the fix is intuitive. I think, it's correct)
> 
> Note also, that alternative would be to make a drained section in
> stream_prepare() and don't touch bdrv_set_backing_hd() function. But it
> seems good to make a public graph-modification function more safe.

Yes, makes sense to me.

Kevin


