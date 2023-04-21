Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A1726EAD86
	for <lists+qemu-devel@lfdr.de>; Fri, 21 Apr 2023 16:57:08 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ppsB3-0005a4-Qd; Fri, 21 Apr 2023 10:55:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1ppsB1-0005ZX-0Z
 for qemu-devel@nongnu.org; Fri, 21 Apr 2023 10:55:55 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1ppsAy-0006dT-MV
 for qemu-devel@nongnu.org; Fri, 21 Apr 2023 10:55:54 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1682088951;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=jQCB/pBxzy5dqE1XBMf3u5nzFMp+cSm/1jExe9lRziQ=;
 b=eF+7ubm8qIaLiBMIeGQsgaKTTuuNAV39KfeBqjMjAOwWHPut7ypHIXBWd42S+5fOaY+G9o
 zkWoECNUIZGEdniPo/jO4nNHyYS7JGaVHoJOkHlhVrOUjXYD+qqhBjDJp7gLjT6SEny39/
 r42gc7RUM6IX2MQ7acUHMazPXXYx/gQ=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-137-avRQPY6iPc2iqRzthsGiqQ-1; Fri, 21 Apr 2023 10:55:50 -0400
X-MC-Unique: avRQPY6iPc2iqRzthsGiqQ-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 11ABD29A9D46;
 Fri, 21 Apr 2023 14:55:50 +0000 (UTC)
Received: from redhat.com (unknown [10.2.16.177])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 34DCA492C13;
 Fri, 21 Apr 2023 14:55:49 +0000 (UTC)
Date: Fri, 21 Apr 2023 09:55:47 -0500
From: Eric Blake <eblake@redhat.com>
To: Paolo Bonzini <pbonzini@redhat.com>
Cc: qemu-devel@nongnu.org, qemu-block@nongnu.org
Subject: Re: [PATCH 1/4] block: rename the bdrv_co_block_status static function
Message-ID: <zt3hpfhj45jplvf5qazvjuxhot5dgevlgvzhlxem43yxpi2fby@ibuw2wmhyveq>
References: <20230405103216.128103-1-pbonzini@redhat.com>
 <20230405103216.128103-2-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230405103216.128103-2-pbonzini@redhat.com>
User-Agent: NeoMutt/20230407
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.9
Received-SPF: pass client-ip=170.10.129.124; envelope-from=eblake@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

On Wed, Apr 05, 2023 at 12:32:13PM +0200, Paolo Bonzini wrote:
> bdrv_block_status exists as a wrapper for bdrv_block_status_above,
> but the name of the (hypothetical) coroutine version, bdrv_co_block_status,
> is squatted by a random static function.  Rename it to bdrv_do_block_status.
> 
> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
> ---
>  block/io.c | 10 +++++-----
>  1 file changed, 5 insertions(+), 5 deletions(-)

[Hmm - I notice I have a local branch that tries to address an issue
where a 4k-sector overlay backed by a 512-byte backing image can
report unaligned block status, and touches this maze of functions to
support a way to get block status forced to a given alignment.  I
should try and revive that once this series lands...]

> 
> diff --git a/block/io.c b/block/io.c
> index db438c765757..e86090b7692b 100644
> --- a/block/io.c
> +++ b/block/io.c
> @@ -2230,7 +2230,7 @@ int bdrv_flush_all(void)
>   * set to the host mapping and BDS corresponding to the guest offset.
>   */
>  static int coroutine_fn GRAPH_RDLOCK
> -bdrv_co_block_status(BlockDriverState *bs, bool want_zero,
> +bdrv_do_block_status(BlockDriverState *bs, bool want_zero,

This is still marked coroutine.  Do we want to go with the longer name
bdrv_co_do_block_status, to make it obvious that it is both coroutine
and a local helper?  Or is the fact that it is static to this file
enough to elide the _co?

-- 
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3266
Virtualization:  qemu.org | libvirt.org


