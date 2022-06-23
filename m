Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E9E0B558B03
	for <lists+qemu-devel@lfdr.de>; Thu, 23 Jun 2022 23:58:40 +0200 (CEST)
Received: from localhost ([::1]:48676 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o4UqW-0005L8-1M
	for lists+qemu-devel@lfdr.de; Thu, 23 Jun 2022 17:58:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57094)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1o4UfV-0004Gl-Hm
 for qemu-devel@nongnu.org; Thu, 23 Jun 2022 17:47:17 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:58958)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1o4UfS-0008Up-Nb
 for qemu-devel@nongnu.org; Thu, 23 Jun 2022 17:47:16 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1656020833;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=h6sPSBXe/uG6jnbT7Gq1ooq5YebfDcf5W8ujJOLjoYQ=;
 b=SkaT6cJmxLZ3Q4500vvfRijz4xPSjUHE9iEWYz99LZ/F29QyV5aX7SciDvbiF5MDg6ojyn
 HkjrzMYE6739+XfvGxavgjaNB0kyugRhLR7i2OwT3dW8f9dFvw/jCsiq31LO0lT6e7LeXy
 lvZlkl3h5YPAQKk+5JtHHMAE1/MN0sY=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-43-TSU7JRvTOMaF3s4PcgU2AA-1; Thu, 23 Jun 2022 17:47:10 -0400
X-MC-Unique: TSU7JRvTOMaF3s4PcgU2AA-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
 [10.11.54.6])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id C570B85A589;
 Thu, 23 Jun 2022 21:47:09 +0000 (UTC)
Received: from redhat.com (unknown [10.2.17.73])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id A52262166B26;
 Thu, 23 Jun 2022 21:47:08 +0000 (UTC)
Date: Thu, 23 Jun 2022 16:47:06 -0500
From: Eric Blake <eblake@redhat.com>
To: Alberto Faria <afaria@redhat.com>
Cc: qemu-devel@nongnu.org, John Snow <jsnow@redhat.com>,
 Kevin Wolf <kwolf@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 Ari Sundholm <ari@tuxera.com>,
 Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>,
 "Denis V. Lunev" <den@openvz.org>, Fam Zheng <fam@euphon.net>,
 Jeff Cody <codyprime@gmail.com>, qemu-block@nongnu.org,
 Vladimir Sementsov-Ogievskiy <v.sementsov-og@mail.ru>,
 Hanna Reitz <hreitz@redhat.com>, Stefan Weil <sw@weilnetz.de>
Subject: Re: [PATCH v5 07/10] block: Implement
 bdrv_{pread,pwrite,pwrite_zeroes}() using generated_co_wrapper
Message-ID: <20220623214706.hxjpk4ub76w37g6t@redhat.com>
References: <20220609152744.3891847-1-afaria@redhat.com>
 <20220609152744.3891847-8-afaria@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220609152744.3891847-8-afaria@redhat.com>
User-Agent: NeoMutt/20220429-136-41baff
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
Received-SPF: pass client-ip=170.10.129.124; envelope-from=eblake@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Jun 09, 2022 at 04:27:41PM +0100, Alberto Faria wrote:
> bdrv_{pread,pwrite}() now return -EIO instead of -EINVAL when 'bytes' is
> negative, making them consistent with bdrv_{preadv,pwritev}() and
> bdrv_co_{pread,pwrite,preadv,pwritev}().
> 
> bdrv_pwrite_zeroes() now also calls trace_bdrv_co_pwrite_zeroes() and
> clears the BDRV_REQ_MAY_UNMAP flag when appropriate, which it didn't
> previously.
> 
> Signed-off-by: Alberto Faria <afaria@redhat.com>
> ---
> 
> I audited all bdrv_{pread,pwrite}() callers to make sure that changing
> the -EINVAL return code to -EIO wont't break things. However, there are
> about 140 call sites, so the probability of me having missed something
> isn't negligible. If someone more accustomed to the code base is able to
> double-check this, that would be very much appreciated.

I did not get through all of the callers (you are right, there ARE a
lot), but the ones I checked, particularly in block/qcow2-*.c, appear
to handle -EIO just fine.

I did notice, however, that qcow2-bitmap.c:free_bitmap_clusters()
returns an int failure, but none of its three callers
(qcow2_co_remove_persistent_dirty_bitmap, and twice in
qcow2_store_persistent_dirty_bitmaps) care about the return value.
That may be worth a separate cleanup patch.

> 
> As a precaution, I also dropped Paolo's R-b.
> 
>  block/io.c               | 41 ----------------------------------------
>  include/block/block-io.h | 15 +++++++++------
>  2 files changed, 9 insertions(+), 47 deletions(-)

Reviewed-by: Eric Blake <eblake@redhat.com>

-- 
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3266
Virtualization:  qemu.org | libvirt.org


