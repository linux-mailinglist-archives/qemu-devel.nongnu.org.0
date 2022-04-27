Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F18A4511830
	for <lists+qemu-devel@lfdr.de>; Wed, 27 Apr 2022 15:18:07 +0200 (CEST)
Received: from localhost ([::1]:42648 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1njhYU-00043b-Je
	for lists+qemu-devel@lfdr.de; Wed, 27 Apr 2022 09:18:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39368)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1njhVn-00035C-I7
 for qemu-devel@nongnu.org; Wed, 27 Apr 2022 09:15:20 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:43917)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1njhVd-0003jt-Tq
 for qemu-devel@nongnu.org; Wed, 27 Apr 2022 09:15:13 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1651065306;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=sADvgN9S8r12ZRvyJp46DL4RKSzg23WY1EcD1pAaRe8=;
 b=etPAZM0fuCYkvPhT7hZdxM7r4jmbHwAgKI3CgLRVvVkJzUEW1BVMkjsJBz6qRWO7WX93Pm
 idcUx/enXMp0NjXJ9IWVP8eaLaCewBGZFoeM7YtcJ99WFz8m9ilYOp/lIWkuVDdMAw+Q2W
 VB/QpFW31YtExdLBX0K0kFqMsXQcZkI=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-332-cVMNSSDuMBWIs8NyTi0GOQ-1; Wed, 27 Apr 2022 09:15:04 -0400
X-MC-Unique: cVMNSSDuMBWIs8NyTi0GOQ-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
 [10.11.54.6])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id ADF071014A6A;
 Wed, 27 Apr 2022 13:15:03 +0000 (UTC)
Received: from redhat.com (unknown [10.2.16.160])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id F1BD42166B4D;
 Wed, 27 Apr 2022 13:15:00 +0000 (UTC)
Date: Wed, 27 Apr 2022 08:14:59 -0500
From: Eric Blake <eblake@redhat.com>
To: Hanna Reitz <hreitz@redhat.com>
Subject: Re: [PATCH 1/4] block: Classify bdrv_get_flags() as I/O function
Message-ID: <20220427131459.ncb73rqtp47xluxx@redhat.com>
References: <20220427114057.36651-1-hreitz@redhat.com>
 <20220427114057.36651-2-hreitz@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220427114057.36651-2-hreitz@redhat.com>
User-Agent: NeoMutt/20220415-26-c08bba
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
Received-SPF: pass client-ip=170.10.133.124; envelope-from=eblake@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: Kevin Wolf <kwolf@redhat.com>,
 Emanuele Giuseppe Esposito <eesposit@redhat.com>, qemu-devel@nongnu.org,
 qemu-block@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Apr 27, 2022 at 01:40:54PM +0200, Hanna Reitz wrote:
> This function is safe to call in an I/O context, and qcow2_do_open()
> does so (invoked in an I/O context by qcow2_co_invalidate_cache()).
> 
> Signed-off-by: Hanna Reitz <hreitz@redhat.com>
> ---
>  include/block/block-global-state.h | 1 -
>  include/block/block-io.h           | 1 +
>  block.c                            | 2 +-
>  3 files changed, 2 insertions(+), 2 deletions(-)

Reviewed-by: Eric Blake <eblake@redhat.com>

-- 
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3266
Virtualization:  qemu.org | libvirt.org


