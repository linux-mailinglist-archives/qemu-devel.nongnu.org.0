Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A0D64A024E
	for <lists+qemu-devel@lfdr.de>; Fri, 28 Jan 2022 21:51:22 +0100 (CET)
Received: from localhost ([::1]:38428 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nDYDI-0003FF-Ur
	for lists+qemu-devel@lfdr.de; Fri, 28 Jan 2022 15:51:20 -0500
Received: from eggs.gnu.org ([209.51.188.92]:44362)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1nDY8X-00067j-98
 for qemu-devel@nongnu.org; Fri, 28 Jan 2022 15:46:26 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:50691)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1nDY8U-0003ow-P4
 for qemu-devel@nongnu.org; Fri, 28 Jan 2022 15:46:24 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1643402781;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=CwsQQ1VqtypAbelxcvdO04B1mM/IiOXrwrgEQzyXLxo=;
 b=CPpg4L0lRD9rUjC26NFlajpZbUQvlbIKV4uOxLHM8LBleBCQVr1oFDOhALZtLzmj+bm0xB
 fsl/TE5/QsFGzpLoB3rAXqPbwWYb3i3BU653czCu2NtNFdaKZ5FmMvef+mUm+ekQ6sM79c
 yl2lvqU74ipHgeiY73aP86qE0KEMtFE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-395-Z-V_RA8SP--w3YEYmKh8lg-1; Fri, 28 Jan 2022 15:46:17 -0500
X-MC-Unique: Z-V_RA8SP--w3YEYmKh8lg-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A420018397A7;
 Fri, 28 Jan 2022 20:46:16 +0000 (UTC)
Received: from redhat.com (unknown [10.22.32.61])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 9969B226E8;
 Fri, 28 Jan 2022 20:46:15 +0000 (UTC)
Date: Fri, 28 Jan 2022 14:46:13 -0600
From: Eric Blake <eblake@redhat.com>
To: Hanna Reitz <hreitz@redhat.com>
Subject: Re: [PATCH v2 1/2] block/io: Update BSC only if want_zero is true
Message-ID: <20220128204613.kij3kyw5vcvgx4qx@redhat.com>
References: <20220118170000.49423-1-hreitz@redhat.com>
 <20220118170000.49423-2-hreitz@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20220118170000.49423-2-hreitz@redhat.com>
User-Agent: NeoMutt/20211029-256-77b59a
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eblake@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.129.124; envelope-from=eblake@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) DKIMWL_WL_HIGH=-0.167, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001,
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
Cc: Kevin Wolf <kwolf@redhat.com>, Nir Soffer <nsoffer@redhat.com>,
 qemu-devel@nongnu.org, qemu-block@nongnu.org, qemu-stable@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Jan 18, 2022 at 05:59:59PM +0100, Hanna Reitz wrote:
> We update the block-status cache whenever we get new information from a
> bdrv_co_block_status() call to the block driver.  However, if we have
> passed want_zero=false to that call, it may flag areas containing zeroes
> as data, and so we would update the block-status cache with wrong
> information.
> 
> Therefore, we should not update the cache with want_zero=false.
> 
> Reported-by: Nir Soffer <nsoffer@redhat.com>
> Fixes: 0bc329fbb00 ("block: block-status cache for data regions")
> Reviewed-by: Nir Soffer <nsoffer@redhat.com>
> Cc: qemu-stable@nongnu.org
> Signed-off-by: Hanna Reitz <hreitz@redhat.com>
> ---
>  block/io.c | 6 +++++-
>  1 file changed, 5 insertions(+), 1 deletion(-)

Reviewed-by: Eric Blake <eblake@redhat.com>

-- 
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3266
Virtualization:  qemu.org | libvirt.org


