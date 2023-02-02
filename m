Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0EBB26887A3
	for <lists+qemu-devel@lfdr.de>; Thu,  2 Feb 2023 20:41:21 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pNfRC-0001t5-CB; Thu, 02 Feb 2023 14:40:02 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1pNfR8-0001s3-M3
 for qemu-devel@nongnu.org; Thu, 02 Feb 2023 14:39:58 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1pNfR6-0003GU-RQ
 for qemu-devel@nongnu.org; Thu, 02 Feb 2023 14:39:58 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1675366795;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=JPdyPXbmiSiuoMvW4klGMAOVeNjUicXr1yQf035dijM=;
 b=VQ9ZSz0JM/RNnHpKy1Uxwuw24voM9cJW6To+dWUwkezKHPARbjftdlImWw2OwiGkyf2hco
 +gOYosYptPm1p16K7WKByI9ZiV36LWtCJ2IqMb1dKh7hK4NOTc1cJqC31WL5ChWvFcoD1j
 vI/BkiwQDFZcc2h5R63A9kU6WGYp+VM=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-621-9MEtht4VMumzcgW-fzMhww-1; Thu, 02 Feb 2023 14:39:54 -0500
X-MC-Unique: 9MEtht4VMumzcgW-fzMhww-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
 [10.11.54.10])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id A31F880352D;
 Thu,  2 Feb 2023 19:39:53 +0000 (UTC)
Received: from redhat.com (unknown [10.2.16.100])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 8E8E1492B00;
 Thu,  2 Feb 2023 19:39:52 +0000 (UTC)
Date: Thu, 2 Feb 2023 13:39:44 -0600
From: Eric Blake <eblake@redhat.com>
To: Andrey Zhadchenko <andrey.zhadchenko@virtuozzo.com>
Cc: vsementsov@yandex-team.ru, hreitz@redhat.com, jsnow@redhat.com,
 qemu-block@nongnu.org, qemu-devel@nongnu.org
Subject: Re: [PATCH] hbitmap: fix hbitmap_status() return value for first
 dirty bit case
Message-ID: <20230202193944.63qcqpvklyoslode@redhat.com>
References: <20230202181523.423131-1-andrey.zhadchenko@virtuozzo.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230202181523.423131-1-andrey.zhadchenko@virtuozzo.com>
User-Agent: NeoMutt/20220429
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.10
Received-SPF: pass client-ip=170.10.129.124; envelope-from=eblake@redhat.com;
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

On Thu, Feb 02, 2023 at 09:15:23PM +0300, Andrey Zhadchenko via wrote:
> The last return statement should return true, as we already evaluated that
> start == next_dirty
> 
> Also, fix hbitmap_status() description in header
> 
> Cc: qemu-stable@nongnu.org
> Fixes: a6426475a75 ("block/dirty-bitmap: introduce bdrv_dirty_bitmap_status()")
> Signed-off-by: Andrey Zhadchenko <andrey.zhadchenko@virtuozzo.com>
> ---
>  include/qemu/hbitmap.h | 2 +-
>  util/hbitmap.c         | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)

Eww, nasty bug; looks like copy-before-write is the only curernt
client of this interface.

Reviewed-by: Eric Blake <eblake@redhat.com>

Is there any way to enhance an iotest to add coverage for this code?

-- 
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3266
Virtualization:  qemu.org | libvirt.org


