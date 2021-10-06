Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DD834241DE
	for <lists+qemu-devel@lfdr.de>; Wed,  6 Oct 2021 17:53:23 +0200 (CEST)
Received: from localhost ([::1]:47996 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mY9EN-0006Oy-Nz
	for lists+qemu-devel@lfdr.de; Wed, 06 Oct 2021 11:53:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49124)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1mY8nR-0003Ux-P6
 for qemu-devel@nongnu.org; Wed, 06 Oct 2021 11:25:29 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:53949)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1mY8nQ-0003Ju-6m
 for qemu-devel@nongnu.org; Wed, 06 Oct 2021 11:25:29 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1633533926;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=6yFUaEDWl2L5ZZDVfxVMIe3qDi59mEQxFLMwAqn4YT0=;
 b=IDYXEkKF3l/TZD9M9wGN65C8RvDqcOtPRSok2sQiA7ytmv6OCxP05+O+ByVLVEE2+vXHYA
 MVqY7IGighVTHofHR6EsJaN0mXBDv8LfocU+gYuoolNq6Tcfzqq22cfV/LDnPc6nAAGH6a
 4h536Y2UxFbZMVVFc9iJlfCZJAY+nlc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-312-aVZNrCfuOv60Fr63VyINfw-1; Wed, 06 Oct 2021 11:25:21 -0400
X-MC-Unique: aVZNrCfuOv60Fr63VyINfw-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 163581006AA9;
 Wed,  6 Oct 2021 15:25:20 +0000 (UTC)
Received: from redhat.com (ovpn-113-79.phx2.redhat.com [10.3.113.79])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 741805F4E8;
 Wed,  6 Oct 2021 15:25:19 +0000 (UTC)
Date: Wed, 6 Oct 2021 10:25:17 -0500
From: Eric Blake <eblake@redhat.com>
To: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Subject: Re: [PATCH 03/12] block-backend: convert blk_co_pwritev_part to
 int64_t bytes
Message-ID: <20211006152517.pubo7bocf6encscy@redhat.com>
References: <20211006131718.214235-1-vsementsov@virtuozzo.com>
 <20211006131718.214235-4-vsementsov@virtuozzo.com>
MIME-Version: 1.0
In-Reply-To: <20211006131718.214235-4-vsementsov@virtuozzo.com>
User-Agent: NeoMutt/20210205-815-1dd940
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eblake@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=eblake@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.05,
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
Cc: kwolf@redhat.com, ehabkost@redhat.com, qemu-block@nongnu.org,
 qemu-devel@nongnu.org, hreitz@redhat.com, stefanha@redhat.com,
 crosa@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Oct 06, 2021 at 03:17:09PM +0200, Vladimir Sementsov-Ogievskiy wrote:
> We convert blk_do_pwritev_part() and some wrappers:
> blk_co_pwritev_part(), blk_co_pwritev(), blk_co_pwrite_zeroes().
> 
> All functions are converted so that parameter type becomes wider, so
> all callers should be OK with it.
> 
> Look at blk_do_pwritev_part() body:
> bytes is passed to:
> 
>  - trace_blk_co_pwritev (we update it here)
>  - blk_check_byte_request, throttle_group_co_io_limits_intercept,
>    bdrv_co_pwritev_part - all already has int64_t argument.
> 
> Note that requests exceeding INT_MAX are still restricted by
> blk_check_byte_request().
> 
> Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
> ---
>  include/sysemu/block-backend.h | 6 +++---
>  block/block-backend.c          | 8 ++++----
>  block/trace-events             | 2 +-
>  3 files changed, 8 insertions(+), 8 deletions(-)
>

Reviewed-by: Eric Blake <eblake@redhat.com>

-- 
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3266
Virtualization:  qemu.org | libvirt.org


