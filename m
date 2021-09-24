Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1757F417027
	for <lists+qemu-devel@lfdr.de>; Fri, 24 Sep 2021 12:16:05 +0200 (CEST)
Received: from localhost ([::1]:33264 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mTiFQ-0001s3-5E
	for lists+qemu-devel@lfdr.de; Fri, 24 Sep 2021 06:16:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44234)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1mThw2-0000Fk-JZ
 for qemu-devel@nongnu.org; Fri, 24 Sep 2021 05:56:02 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:35732)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1mThvz-0003Wt-GV
 for qemu-devel@nongnu.org; Fri, 24 Sep 2021 05:56:00 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1632477358;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=mHPyvTN2WsPm/vajElkeHZ9jKmh+Kq+DPuA1OylHVXk=;
 b=E3VMuK5qXC1ExE2OjJh/6MQrbOAlhLH25FOQW2IqvxMDmAhVsB6JfhOEzjmDnTIci90Mc0
 swr+//31SsMQQpEBWdYHa8F4ICqvtGyGgBoQ3yVTz2p86PxBcVTwY78IoozEx2mMB1iwf0
 e1nNC2h6XkQjtq7AVzbLTH8EidWvg0U=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-559-iuL3K8jzMYun7AC2pfNxPg-1; Fri, 24 Sep 2021 05:55:57 -0400
X-MC-Unique: iuL3K8jzMYun7AC2pfNxPg-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 2F266362F8;
 Fri, 24 Sep 2021 09:55:56 +0000 (UTC)
Received: from redhat.com (unknown [10.39.193.232])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 884AE5D9CA;
 Fri, 24 Sep 2021 09:55:52 +0000 (UTC)
Date: Fri, 24 Sep 2021 11:55:51 +0200
From: Kevin Wolf <kwolf@redhat.com>
To: Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [PATCH] block: introduce max_hw_iov for use in scsi-generic
Message-ID: <YU2gpzuM/HGO+1Kh@redhat.com>
References: <20210923130436.1187591-1-pbonzini@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210923130436.1187591-1-pbonzini@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kwolf@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -42
X-Spam_score: -4.3
X-Spam_bar: ----
X-Spam_report: (-4.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.473,
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
Cc: Halil Pasic <pasic@linux.ibm.com>, Hanna Reitz <hreitz@redhat.com>,
 qemu-devel@nongnu.org, qemu-block@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Am 23.09.2021 um 15:04 hat Paolo Bonzini geschrieben:
> Linux limits the size of iovecs to 1024 (UIO_MAXIOV in the kernel
> sources, IOV_MAX in POSIX).  Because of this, on some host adapters
> requests with many iovecs are rejected with -EINVAL by the
> io_submit() or readv()/writev() system calls.
> 
> In fact, the same limit applies to SG_IO as well.  To fix both the
> EINVAL and the possible performance issues from using fewer iovecs
> than allowed by Linux (some HBAs have max_segments as low as 128),
> introduce a separate entry in BlockLimits to hold the max_segments
> value from sysfs.  This new limit is used only for SG_IO and clamped
> to bs->bl.max_iov anyway, just like max_hw_transfer is clamped to
> bs->bl.max_transfer.
> 
> Reported-by: Halil Pasic <pasic@linux.ibm.com>
> Cc: Hanna Reitz <hreitz@redhat.com>
> Cc: Kevin Wolf <kwolf@redhat.com>
> Cc: qemu-block@nongnu.org
> Fixes: 18473467d5 ("file-posix: try BLKSECTGET on block devices too, do not round to power of 2", 2021-06-25)
> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>

Thanks, applied to the block branch.

Kevin


