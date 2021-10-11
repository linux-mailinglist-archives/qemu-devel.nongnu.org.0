Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AED65429499
	for <lists+qemu-devel@lfdr.de>; Mon, 11 Oct 2021 18:27:06 +0200 (CEST)
Received: from localhost ([::1]:54988 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mZy8n-0005PF-QK
	for lists+qemu-devel@lfdr.de; Mon, 11 Oct 2021 12:27:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40844)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1mZy6A-0004PT-Uo
 for qemu-devel@nongnu.org; Mon, 11 Oct 2021 12:24:23 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:20843)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1mZy66-0004wT-4A
 for qemu-devel@nongnu.org; Mon, 11 Oct 2021 12:24:22 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1633969457;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=wRXDAd138plg/d5omtEflMo++ihOKtskHv4+P5huPA4=;
 b=Aw4uHNo7HOMj8cBW7uuGyaypo9jt8tusUuXkgwgzbkSCAkUrcNm3BVGu8+8tx0pfoCuT/V
 IJagp/6gEpN2cxs0Hahm22s34TkXWPbhZzjUsZvsRQVR8TIyQAQS2qiO/koVQqYFafs/zG
 mFAc3L1NHvOxI3xQEfjV88LnHWXPpXo=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-171-iJYZpC_pMg-935OFFJN_2Q-1; Mon, 11 Oct 2021 12:24:14 -0400
X-MC-Unique: iJYZpC_pMg-935OFFJN_2Q-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 457BC1006AA5;
 Mon, 11 Oct 2021 16:24:13 +0000 (UTC)
Received: from redhat.com (ovpn-113-152.phx2.redhat.com [10.3.113.152])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id CDFE65DF2F;
 Mon, 11 Oct 2021 16:24:03 +0000 (UTC)
Date: Mon, 11 Oct 2021 11:24:02 -0500
From: Eric Blake <eblake@redhat.com>
To: Hanna Reitz <hreitz@redhat.com>
Subject: Re: [PATCH] qcow2: Silence clang -m32 compiler warning
Message-ID: <20211011162402.2wqnhxof2r52637w@redhat.com>
References: <20211011155031.149158-1-hreitz@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20211011155031.149158-1-hreitz@redhat.com>
User-Agent: NeoMutt/20210205-852-339c0c
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eblake@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=eblake@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.049,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: Kevin Wolf <kwolf@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>, qemu-devel@nongnu.org,
 qemu-block@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, Oct 11, 2021 at 05:50:31PM +0200, Hanna Reitz wrote:
> With -m32, size_t is generally only a uint32_t.  That makes clang
> complain that in the assertion
> 
>   assert(qiov->size <= INT64_MAX);
> 
> the range of the type of qiov->size (size_t) is too small for any of its
> values to ever exceed INT64_MAX.

Yep, I'm not surprised that we hit that.

> 
> Cast qiov->size to uint64_t to silence clang.
> 
> Fixes: f7ef38dd1310d7d9db76d0aa16899cbc5744f36d
>        ("block: use int64_t instead of uint64_t in driver read
>        handlers")
> Signed-off-by: Hanna Reitz <hreitz@redhat.com>
> ---
> I don't know whether this is the best possible solution, or whether we
> should care about this at all (I personally think it's basically just
> wrong for clang to warn about always-true conditions in assertions), but
> I thought I might as well just send this patch as the basis for a
> discussion.

I agree that the compiler is overly noisy, but the fix is simple
enough that I'm fine with it as written.

Reviewed-by: Eric Blake <eblake@redhat.com>

Since the original went through my tree, I'm happy to take this one
through my NBD tree as well.

> ---
>  block/qcow2-cluster.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/block/qcow2-cluster.c b/block/qcow2-cluster.c
> index 5727f92dcb..21884a1ab9 100644
> --- a/block/qcow2-cluster.c
> +++ b/block/qcow2-cluster.c
> @@ -513,7 +513,8 @@ static int coroutine_fn do_perform_cow_read(BlockDriverState *bs,
>       */
>      assert(src_cluster_offset <= INT64_MAX);
>      assert(src_cluster_offset + offset_in_cluster <= INT64_MAX);
> -    assert(qiov->size <= INT64_MAX);
> +    /* Cast qiov->size to uint64_t to silence a compiler warning on -m32 */
> +    assert((uint64_t)qiov->size <= INT64_MAX);
>      bdrv_check_qiov_request(src_cluster_offset + offset_in_cluster, qiov->size,
>                              qiov, 0, &error_abort);
>      /*
> -- 
> 2.31.1
> 

-- 
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3266
Virtualization:  qemu.org | libvirt.org


