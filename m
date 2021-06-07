Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4AEEB39DE20
	for <lists+qemu-devel@lfdr.de>; Mon,  7 Jun 2021 15:54:28 +0200 (CEST)
Received: from localhost ([::1]:49738 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lqFhz-00066F-Bz
	for lists+qemu-devel@lfdr.de; Mon, 07 Jun 2021 09:54:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51164)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mlevitsk@redhat.com>)
 id 1lqFgO-0004iQ-Il
 for qemu-devel@nongnu.org; Mon, 07 Jun 2021 09:52:48 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:59677)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mlevitsk@redhat.com>)
 id 1lqFgJ-0000cB-E9
 for qemu-devel@nongnu.org; Mon, 07 Jun 2021 09:52:48 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1623073962;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=IFjWPx+24W56GHbLdW69c+fgZQBZ03BBGSa/oWkKmZk=;
 b=PmnCjraEdG/kg6sG6h6amKA/t6p9wsKoWbHxHpviSdV5DNiI14C57Tscpjja5LvYsWdfdp
 Jc+YX4lt86qhAEuS0Otvf0AVr0HDoxyugZHsIRg/WvqIat42vQn0nLGCVwyS58Q53rOfCk
 J8CraeXp4sVafryOqIj8h6+EydLqhUc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-472-Ijx2WJsePHG9W3O4AqmNqQ-1; Mon, 07 Jun 2021 09:52:40 -0400
X-MC-Unique: Ijx2WJsePHG9W3O4AqmNqQ-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 3C0C1100945F;
 Mon,  7 Jun 2021 13:52:39 +0000 (UTC)
Received: from starship (unknown [10.40.194.6])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 8A3565D6D3;
 Mon,  7 Jun 2021 13:52:37 +0000 (UTC)
Message-ID: <fd152c25cea259da55f10e984391d3dd5381ab18.camel@redhat.com>
Subject: Re: [PATCH v3 0/7] block: file-posix queue
From: Maxim Levitsky <mlevitsk@redhat.com>
To: Paolo Bonzini <pbonzini@redhat.com>, qemu-devel@nongnu.org
Date: Mon, 07 Jun 2021 16:52:36 +0300
In-Reply-To: <20210603133722.218465-1-pbonzini@redhat.com>
References: <20210603133722.218465-1-pbonzini@redhat.com>
User-Agent: Evolution 3.36.5 (3.36.5-2.fc32)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mlevitsk@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mlevitsk@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.2,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: kwolf@redhat.com, qemu-block@nongnu.org, Max Reitz <mreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, 2021-06-03 at 15:37 +0200, Paolo Bonzini wrote:
> Hi Kevin,
> 
> this is a combination of two series that both affect host block device
> support in block/file-posix.c.  Joelle's series is unchanged, while
> mine was adjusted according to your review of v2.
> 
> v1->v2: add missing patch
> 
> v2->v3: add max_hw_transfer to BlockLimits
> 
> 
> Joelle van Dyne (3):
>   block: feature detection for host block support
>   block: check for sys/disk.h
>   block: detect DKIOCGETBLOCKCOUNT/SIZE before use
> 
> Paolo Bonzini (4):
>   file-posix: fix max_iov for /dev/sg devices
>   scsi-generic: pass max_segments via max_iov field in BlockLimits
>   block: add max_hw_transfer to BlockLimits
>   file-posix: try BLKSECTGET on block devices too, do not round to power
>     of 2
> 
>  block.c                        |   2 +-
>  block/block-backend.c          |  12 ++++
>  block/file-posix.c             | 104 ++++++++++++++++++++-------------
>  block/io.c                     |   1 +
>  hw/scsi/scsi-generic.c         |   6 +-
>  include/block/block_int.h      |   7 +++
>  include/sysemu/block-backend.h |   1 +
>  meson.build                    |   7 ++-
>  qapi/block-core.json           |  10 +++-
>  9 files changed, 102 insertions(+), 48 deletions(-)
> 
Hi Paolo and everyone!
 
I used to have a patch series that was about to fix the block limits of the scsi-block,
which I think is similar to this patch series.
 
Sorry that I kind of forgot about it for too much time.
 
https://www.mail-archive.com/qemu-devel@nongnu.org/msg768261.html
 
I'll need some time to swap-in this area so that I could compare our
patches to see if we missed something.
 
Best regards,
	Maxim Levitsky
 


