Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 46BDD6BF9BE
	for <lists+qemu-devel@lfdr.de>; Sat, 18 Mar 2023 13:08:10 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pdVKm-0007I7-My; Sat, 18 Mar 2023 08:06:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1pdVKi-0007Hk-Sd
 for qemu-devel@nongnu.org; Sat, 18 Mar 2023 08:06:49 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1pdVKh-0002g6-77
 for qemu-devel@nongnu.org; Sat, 18 Mar 2023 08:06:48 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1679141205;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=JIJ9rC5OpUCmMBz9W7E5xdMT7UmL8CA5m6yZrWDo4KQ=;
 b=cV2r0G2xXVf0OKTG1pqJiCv/Z0sFXFQ9GKXoITiT5u3jZQwLHHJ5WyRvsDBlZghQHYSQF6
 hjZ3dNUkrim44mvxD8R6CmSwrjHIfptllEIe4m12RPKiDIns7MC12LABzkJORYlJSSl+rf
 MIwUn2NXKBLIXRv8AOgAt7S3cuakkdg=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-646-q9VIdHQqNkKb4EBERp-kpg-1; Sat, 18 Mar 2023 08:06:43 -0400
X-MC-Unique: q9VIdHQqNkKb4EBERp-kpg-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
 [10.11.54.3])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 4B78A1C05141;
 Sat, 18 Mar 2023 12:06:43 +0000 (UTC)
Received: from redhat.com (unknown [10.2.16.99])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 20ED81121315;
 Sat, 18 Mar 2023 12:06:42 +0000 (UTC)
Date: Sat, 18 Mar 2023 07:06:40 -0500
From: Eric Blake <eblake@redhat.com>
To: Hanna Czenczek <hreitz@redhat.com>
Cc: qemu-block@nongnu.org, qemu-devel@nongnu.org,
 Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>,
 Kevin Wolf <kwolf@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Fam Zheng <fam@euphon.net>
Subject: Re: [PATCH 1/4] util/iov: Make qiov_slice() public
Message-ID: <20230318120640.ewhjipdc57cm5z3k@redhat.com>
References: <20230317175019.10857-1-hreitz@redhat.com>
 <20230317175019.10857-2-hreitz@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230317175019.10857-2-hreitz@redhat.com>
User-Agent: NeoMutt/20220429
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.3
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

On Fri, Mar 17, 2023 at 06:50:16PM +0100, Hanna Czenczek wrote:
> We want to inline qemu_iovec_init_extended() in block/io.c for padding
> requests, and having access to qiov_slice() is useful for this.
> 
> (We will need to count the number of I/O vector elements of a slice
> there, and then later process this slice.  Without qiov_slice(), we
> would need to call qemu_iovec_subvec_niov(), and all further
> IOV-processing functions may need to skip prefixing elements to
> accomodate for a qiov_offset.  Because qemu_iovec_subvec_niov()
> internally calls qiov_slice(), we can just have the block/io.c code call
> qiov_slice() itself, thus get the number of elements, and also create an
> iovec array with the superfluous prefixing elements stripped, so the
> following processing functions no longer need to skip them.)

Might be worth mentioning in the commit message that you also renamed
it to qemu_iovec_slice() as part of exporting.

> 
> Signed-off-by: Hanna Czenczek <hreitz@redhat.com>
> ---
>  include/qemu/iov.h |  3 +++
>  util/iov.c         | 14 +++++++-------
>  2 files changed, 10 insertions(+), 7 deletions(-)

Reviewed-by: Eric Blake <eblake@redhat.com>

-- 
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3266
Virtualization:  qemu.org | libvirt.org


