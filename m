Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C4B861974B
	for <lists+qemu-devel@lfdr.de>; Fri,  4 Nov 2022 14:14:54 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1oqwVM-00024n-7k; Fri, 04 Nov 2022 09:13:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1oqwVK-00024O-DD
 for qemu-devel@nongnu.org; Fri, 04 Nov 2022 09:13:02 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1oqwVH-0006tu-KJ
 for qemu-devel@nongnu.org; Fri, 04 Nov 2022 09:13:02 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1667567578;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=w3S6zsC7+ZpDgQZmNecvfWm4ZBk88gsEiuBCXbqxzpU=;
 b=exakQ10xHh06TbiylPsjSR7Yb3a64Wz4yifjS/GP/1AjIxetfZ0fxvJx2k4ubruz5Qhlvh
 T0DFmyQ1fTkH/oYTOu/3XWAlgXhjM4RsUq4q/8ljYd7fsl52TqlgtdZSKf5Ug1hzKRhM97
 0TFhLw+woufawn82iYd7yYrXLTbSAQ4=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-622-mUWVU5l_Ooi2gI_RN95EAQ-1; Fri, 04 Nov 2022 09:12:55 -0400
X-MC-Unique: mUWVU5l_Ooi2gI_RN95EAQ-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
 [10.11.54.1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id DA53B857F90;
 Fri,  4 Nov 2022 13:12:54 +0000 (UTC)
Received: from redhat.com (unknown [10.39.193.192])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 4D7D340C835A;
 Fri,  4 Nov 2022 13:12:53 +0000 (UTC)
Date: Fri, 4 Nov 2022 14:12:51 +0100
From: Kevin Wolf <kwolf@redhat.com>
To: Paolo Bonzini <pbonzini@redhat.com>
Cc: Emanuele Giuseppe Esposito <eesposit@redhat.com>, qemu-block@nongnu.org,
 Hanna Reitz <hreitz@redhat.com>, John Snow <jsnow@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>,
 Eric Blake <eblake@redhat.com>, Fam Zheng <fam@euphon.net>,
 qemu-devel@nongnu.org
Subject: Re: [PATCH 2/9] block-copy: add missing coroutine_fn annotations
Message-ID: <Y2UP0/eWfAHtfmBc@redhat.com>
References: <20221103134206.4041928-1-eesposit@redhat.com>
 <20221103134206.4041928-3-eesposit@redhat.com>
 <8f24c24c-ca61-108c-924b-39465a3c67fe@redhat.com>
 <Y2QDPXegFTdpBy6S@redhat.com>
 <dfb4906f-5fff-0430-a3c8-c1f660d3497d@redhat.com>
 <aa37a312-96c1-3bf7-29fe-fbe83eb48f61@redhat.com>
 <ac92cf1f-49c4-b263-f48f-4be17044d61e@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ac92cf1f-49c4-b263-f48f-4be17044d61e@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.1
Received-SPF: pass client-ip=170.10.133.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.045,
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Am 04.11.2022 um 09:44 hat Paolo Bonzini geschrieben:
> On 11/4/22 08:35, Emanuele Giuseppe Esposito wrote:
> > But isn't it a bug also not to mark a function _only_ called by
> > coroutine_fn? My point is that if this function is an implementation of
> > a BlockDriver callback marked as coroutine_fn (like in patch 6 with
> > vmdk), then it would make sense.
> 
> If a function implements a coroutine_fn callback but does not suspend, then
> it makes sense to mark it coroutine_fn.
> 
> In general it's not a bug.  In most cases it would only be a coincidence
> that the function is called from a coroutine_fn.  For example consider
> bdrv_round_to_clusters().  Marking it coroutine_fn signals that it may
> suspend now (it doesn't) or in the future.  However it's only doing some
> math based on the result of bdrv_get_info(), so it is extremely unlikely
> that this will happen.
> 
> In this case... oh wait.  block_copy_is_cluster_allocated is calling
> bdrv_is_allocated, and block_copy_reset_unallocated calls
> block_copy_is_cluster_allocated.  bdrv_is_allocated is a mixed
> coroutine/non-coroutine function, and in this case it is useful to document
> that bdrv_is_allocated will suspend.  The patch is correct, only the commit
> message is wrong.

Ah, right, now I remember that this is what I had discussed with
Emanuele. I knew that there was a reason for it...

What we probably should really do is a bdrv_co_is_allocated() that
doesn't go through the mixed function, but directly calls
bdrv_co_common_block_status_above(). bdrv_is_allocated() is only a
smaller wrapper anyway, so it wouldn't duplicate much code.

I seem to remember that Emanuele had a few more bdrv_is_allocated()
calls that actually took the coroutine path and could use the same new
function.

Kevin


