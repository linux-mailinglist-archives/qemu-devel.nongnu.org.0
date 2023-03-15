Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CE91C6BBC01
	for <lists+qemu-devel@lfdr.de>; Wed, 15 Mar 2023 19:26:46 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pcVoR-0004I1-7j; Wed, 15 Mar 2023 14:25:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1pcVoO-0004Hg-Ni
 for qemu-devel@nongnu.org; Wed, 15 Mar 2023 14:25:20 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1pcVoM-0000U2-Kv
 for qemu-devel@nongnu.org; Wed, 15 Mar 2023 14:25:20 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1678904708;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=uYVyVuVJ2hYegoJ77Py82bxNHVAidwO1ChscKE+byVg=;
 b=Y1dWn3Z5trhSwcKsIiKNzDW/9fXQI4iXqiaWsZ67mqUOA0Vzj9OJ2/aw2XXm+LQFOR4tIr
 NiFgcA+94rwdP3jzIn7mAO0clHWkG8yF3hoAy70w/P2tlAeEh1fIAfv5uaC3l5JAK4QznU
 KiYJdzzY2U7nGZrqOEDvCd09OFA+EVQ=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-86-B4z4yAaANVWJ39Vs4eJnxw-1; Wed, 15 Mar 2023 14:25:04 -0400
X-MC-Unique: B4z4yAaANVWJ39Vs4eJnxw-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
 [10.11.54.4])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 6E3A7385F36B;
 Wed, 15 Mar 2023 18:25:04 +0000 (UTC)
Received: from redhat.com (unknown [10.2.16.147])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 2AB82202701E;
 Wed, 15 Mar 2023 18:25:03 +0000 (UTC)
Date: Wed, 15 Mar 2023 13:25:01 -0500
From: Eric Blake <eblake@redhat.com>
To: Hanna Czenczek <hreitz@redhat.com>
Cc: qemu-block@nongnu.org, qemu-devel@nongnu.org,
 Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>,
 Kevin Wolf <kwolf@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Fam Zheng <fam@euphon.net>
Subject: Re: [RFC 1/2] block: Split padded I/O vectors exceeding IOV_MAX
Message-ID: <20230315182501.w5zed6yktlfeytlf@redhat.com>
References: <20230315121330.29679-1-hreitz@redhat.com>
 <20230315121330.29679-2-hreitz@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230315121330.29679-2-hreitz@redhat.com>
User-Agent: NeoMutt/20220429
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.4
Received-SPF: pass client-ip=170.10.133.124; envelope-from=eblake@redhat.com;
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

On Wed, Mar 15, 2023 at 01:13:29PM +0100, Hanna Czenczek wrote:
> When processing vectored guest requests that are not aligned to the
> storage request alignment, we pad them by adding head and/or tail
> buffers for a read-modify-write cycle.
> 
> The guest can submit I/O vectors up to IOV_MAX (1024) in length, but
> with this padding, the vector can exceed that limit.  As of
> 4c002cef0e9abe7135d7916c51abce47f7fc1ee2 ("util/iov: make
> qemu_iovec_init_extended() honest"), we refuse to pad vectors beyond the
> limit, instead returning an error to the guest.
> 
> To the guest, this appears as a random I/O error.  We should not return
> an I/O error to the guest when it issued a perfectly valid request.
> 
> Before 4c002cef0e9abe7135d7916c51abce47f7fc1ee2, we just made the vector
> longer than IOV_MAX, which generally seems to work (because the guest
> assumes a smaller alignment than we really have, file-posix's
> raw_co_prw() will generally see bdrv_qiov_is_aligned() return false, and
> so emulate the request, so that the IOV_MAX does not matter).  However,
> that does not seem exactly great.
> 
> I see two ways to fix this problem:
> 1. We split such long requests into two requests.
> 2. We join some elements of the vector into new buffers to make it
>    shorter.
> 
> I am wary of (1), because it seems like it may have unintended side
> effects.
> 
> (2) on the other hand seems relatively simple to implement, with
> hopefully few side effects, so this patch does that.

Agreed that approach 2 is more conservative.

> 
> Buglink: https://bugzilla.redhat.com/show_bug.cgi?id=2141964
> Signed-off-by: Hanna Czenczek <hreitz@redhat.com>
> ---
>  block/io.c | 139 ++++++++++++++++++++++++++++++++++++++++++++++++++---
>  util/iov.c |   4 --
>  2 files changed, 133 insertions(+), 10 deletions(-)
>  
> +/*
> + * If padding has made the IOV (`pad->local_qiov`) too long (more than IOV_MAX
> + * elements), collapse some elements into a single one so that it adheres to the
> + * IOV_MAX limit again.
> + *
> + * If collapsing, `pad->collapse_buf` will be used as a bounce buffer of length
> + * `pad->collapse_len`.  `pad->collapsed_qiov` will contain the previous entries
> + * (before collapsing), so that bdrv_padding_destroy() can copy the bounce
> + * buffer content back for read requests.
> + *
> + * Note that we will not touch the padding head or tail entries here.  We cannot
> + * move them to a bounce buffer, because for RMWs, both head and tail expect to
> + * be in an aligned buffer with scratch space after (head) or before (tail) to
> + * perform the read into (because the whole buffer must be aligned, but head's
> + * and tail's lengths naturally cannot be aligned, because they provide padding
> + * for unaligned requests).  A collapsed bounce buffer for multiple IOV elements
> + * cannot provide such scratch space.
> + *
> + * Therefore, this function collapses the first IOV elements after the
> + * (potential) head element.

It looks like you blindly pick the first one or two non-padding iovs
at the front of the array.  Would it be any wiser (in terms of less
memmove() action or even a smaller bounce buffer) to pick iovs at the
end of the array, and/or a sequential search for the smallest
neighboring iovs?  Or is that a micro-optimization that costs more
than it saves?

Would it be any easier to swap the order of padding vs. collapsing?
That is, we already know the user is giving us a long list of iovs; if
it is 1024 elements long, and we can detect that padding will be
needed, should we collapse before padding instead of padding, finding
that we now have 1026, and memmove'ing back into 1024?

But logic-wise, your patch looks correct to me.

Reviewed-by: Eric Blake <eblake@redhat.com>

-- 
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3266
Virtualization:  qemu.org | libvirt.org


