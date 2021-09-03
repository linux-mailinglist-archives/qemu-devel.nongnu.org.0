Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 38FBF400775
	for <lists+qemu-devel@lfdr.de>; Fri,  3 Sep 2021 23:32:43 +0200 (CEST)
Received: from localhost ([::1]:53504 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mMGnh-0001zC-QF
	for lists+qemu-devel@lfdr.de; Fri, 03 Sep 2021 17:32:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34078)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1mMGlt-00010A-9N
 for qemu-devel@nongnu.org; Fri, 03 Sep 2021 17:30:49 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:46002)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1mMGlo-0000ce-Ne
 for qemu-devel@nongnu.org; Fri, 03 Sep 2021 17:30:48 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1630704641;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=XD/n+0T6xkGB5YrOjCufbL4Da9vCr/v6rB9ngrubo2M=;
 b=Ci+poDeBS380wuJKNSNR5/X+2DXBBY1+WkZoN0wwMu8EMfM8QGFTnxqR73DLo+cPxZX+ed
 RGbKEVEkzkSm8pcuB28QnSYNNFlFhhUGClihY2Ry22firYJX/1TaaSUBkLjj4DgfQ8tu/5
 VwKlNUSNeWAxV9D+M6QjqWUOvi0vc9I=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-261-30uToIyeM4i3RbImR1wYlg-1; Fri, 03 Sep 2021 17:30:40 -0400
X-MC-Unique: 30uToIyeM4i3RbImR1wYlg-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 02046107ACCD;
 Fri,  3 Sep 2021 21:30:39 +0000 (UTC)
Received: from redhat.com (ovpn-113-81.phx2.redhat.com [10.3.113.81])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 561A010023AE;
 Fri,  3 Sep 2021 21:30:29 +0000 (UTC)
Date: Fri, 3 Sep 2021 16:30:27 -0500
From: Eric Blake <eblake@redhat.com>
To: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Subject: Re: [PATCH v6 03/11] block: use int64_t instead of uint64_t in
 driver read handlers
Message-ID: <20210903213027.w6axravx5n54odgt@redhat.com>
References: <20210903102807.27127-1-vsementsov@virtuozzo.com>
 <20210903102807.27127-4-vsementsov@virtuozzo.com>
MIME-Version: 1.0
In-Reply-To: <20210903102807.27127-4-vsementsov@virtuozzo.com>
User-Agent: NeoMutt/20210205-739-420e15
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eblake@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=eblake@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.392,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: fam@euphon.net, kwolf@redhat.com, integration@gluster.org, berto@igalia.com,
 stefanha@redhat.com, qemu-block@nongnu.org, pavel.dovgaluk@ispras.ru,
 sw@weilnetz.de, pl@kamp.de, qemu-devel@nongnu.org, jsnow@redhat.com,
 hreitz@redhat.com, kraxel@redhat.com, ronniesahlberg@gmail.com,
 pbonzini@redhat.com, idryomov@gmail.com, philmd@redhat.com, ari@tuxera.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, Sep 03, 2021 at 01:27:59PM +0300, Vladimir Sementsov-Ogievskiy wrote:
> We are generally moving to int64_t for both offset and bytes parameters
> on all io paths.
> 
> Main motivation is realization of 64-bit write_zeroes operation for
> fast zeroing large disk chunks, up to the whole disk.
> 
> We chose signed type, to be consistent with off_t (which is signed) and
> with possibility for signed return type (where negative value means
> error).
> 
> So, convert driver read handlers parameters which are already 64bit to
> signed type.
> 
> While being here, convert also flags parameter to be BdrvRequestFlags.
> 
> Now let's consider all callers. Simple
> 
>   git grep '\->bdrv_\(aio\|co\)_preadv\(_part\)\?'
> 
> shows that's there three callers of driver function:
> 
>  bdrv_driver_preadv() in block/io.c, passes int64_t, checked by
>    bdrv_check_qiov_request() to be non-negative.
> 
>  qcow2_load_vmstate() does bdrv_check_qiov_request().
> 
>  do_perform_cow_read() has uint64_t argument. And a lot of things in
>  qcow2 driver are uint64_t, so converting it is big job. But we must
>  not work with requests that don't satisfy bdrv_check_qiov_request(),
>  so let's just assert it here.
> 
> Still, the functions may be called directly, not only by drv->...
> Let's check:
> 
> git grep '\.bdrv_\(aio\|co\)_preadv\(_part\)\?\s*=' | \
> awk '{print $4}' | sed 's/,//' | sed 's/&//' | sort | uniq | \
> while read func; do git grep "$func(" | \
> grep -v "$func(BlockDriverState"; done
> 
> The only one such caller:
> 
>     QEMUIOVector qiov = QEMU_IOVEC_INIT_BUF(qiov, &data, 1);
>     ...
>     ret = bdrv_replace_test_co_preadv(bs, 0, 1, &qiov, 0);
> 
> in tesTS/unit/test-bdrv-drain.c, and it's OK obviously.

Odd capitalization.

> 
> Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
> ---

> +++ b/block/qcow2-cluster.c
> @@ -505,7 +505,19 @@ static int coroutine_fn do_perform_cow_read(BlockDriverState *bs,
>          return -ENOMEDIUM;
>      }
>  
> -    /* Call .bdrv_co_readv() directly instead of using the public block-layer
> +    /*
> +     * We never deal with requests that doesn't satisfy
> +     * bdrv_check_qiov_request(), and aligning requests to clusters never break

never breaks

> +     * this condition. So, do some assertions before calling
> +     * bs->drv->bdrv_co_preadv_part() which has int64_t arguments.
> +     */
> +    assert(src_cluster_offset <= INT64_MAX);
> +    assert(src_cluster_offset + offset_in_cluster <= INT64_MAX);
> +    assert(qiov->size <= INT64_MAX);
> +    bdrv_check_qiov_request(src_cluster_offset + offset_in_cluster, qiov->size,
> +                            qiov, 0, &error_abort);

> +++ b/slirp
> @@ -1 +1 @@
> -Subproject commit a88d9ace234a24ce1c17189642ef9104799425e0
> +Subproject commit 8f43a99191afb47ca3f3c6972f6306209f367ece
> diff --git a/ui/keycodemapdb b/ui/keycodemapdb
> index d21009b1c9..6119e6e19a 160000
> --- a/ui/keycodemapdb
> +++ b/ui/keycodemapdb
> @@ -1 +1 @@
> -Subproject commit d21009b1c9f94b740ea66be8e48a1d8ad8124023
> +Subproject commit 6119e6e19a050df847418de7babe5166779955e4

Oops.  Fix that (or I can do it while staging, if the rest of the
series is okay), and you have:

Reviewed-by: Eric Blake <eblake@redhat.com>

-- 
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3266
Virtualization:  qemu.org | libvirt.org


