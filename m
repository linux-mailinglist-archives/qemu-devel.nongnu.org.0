Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D9BD952BEC1
	for <lists+qemu-devel@lfdr.de>; Wed, 18 May 2022 17:32:16 +0200 (CEST)
Received: from localhost ([::1]:34268 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nrLep-0007Qc-IJ
	for lists+qemu-devel@lfdr.de; Wed, 18 May 2022 11:32:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37648)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1nrLcu-0006Re-Ni
 for qemu-devel@nongnu.org; Wed, 18 May 2022 11:30:17 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:60999)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1nrLcr-0005Lc-9B
 for qemu-devel@nongnu.org; Wed, 18 May 2022 11:30:15 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1652887811;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=oN2DZ/hfqciT6WibnrdMT/yneo3r7MGe7GuQDqBEVtI=;
 b=A3EBMeF8hhNaqimr/7wLwStfmJvYnNgBTFqLMQ3KkTlDUwv3LMlHJUUjzrfcbnemLJPP3t
 gXLtFwPyLRXqX/YckW8wD2c8oifxByYd4r2pu3ZyW/eb361+E5jzvWm8SNMMLB4yHybFjj
 JdTPTCaJW7FHGmT+Y5FmM2asYot6q4U=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-189-suBNv9HCOZ-1sWNVPy2RCg-1; Wed, 18 May 2022 11:30:09 -0400
X-MC-Unique: suBNv9HCOZ-1sWNVPy2RCg-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
 [10.11.54.1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 486AA800B21;
 Wed, 18 May 2022 15:30:09 +0000 (UTC)
Received: from redhat.com (unknown [10.2.17.180])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id A0A9840CF8EE;
 Wed, 18 May 2022 15:30:08 +0000 (UTC)
Date: Wed, 18 May 2022 10:30:07 -0500
From: Eric Blake <eblake@redhat.com>
To: Vladimir Sementsov-Ogievskiy <v.sementsov-og@mail.ru>
Cc: qemu-block@nongnu.org, qemu-devel@nongnu.org, hreitz@redhat.com,
 kwolf@redhat.com, jsnow@redhat.com,
 Vladimir Sementsov-Ogievskiy <vsementsov@openvz.org>
Subject: Re: [PATCH v4 2/3] block: improve block_dirty_bitmap_merge(): don't
 allocate extra bitmap
Message-ID: <20220518153007.v2wfsflbrdminchs@redhat.com>
References: <20220517111206.23585-1-v.sementsov-og@mail.ru>
 <20220517111206.23585-3-v.sementsov-og@mail.ru>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220517111206.23585-3-v.sementsov-og@mail.ru>
User-Agent: NeoMutt/20220429-71-6f7d3e
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.1
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

On Tue, May 17, 2022 at 02:12:05PM +0300, Vladimir Sementsov-Ogievskiy wrote:
> From: Vladimir Sementsov-Ogievskiy <vsementsov@openvz.org>
> 
> We don't need extra bitmap. All we need is to backup the original
> bitmap when we do first merge. So, drop extra temporary bitmap and work
> directly with target and backup.
> 
> Still to keep old semantics, that on failure target is unchanged and
> user don't need to restore, we need a local_backup variable and do
> restore ourselves on failure path.
> 
> Signed-off-by: Vladimir Sementsov-Ogievskiy <v.sementsov-og@mail.ru>
> ---
>  block/monitor/bitmap-qmp-cmds.c | 41 +++++++++++++++++----------------
>  1 file changed, 21 insertions(+), 20 deletions(-)

Reviewed-by: Eric Blake <eblake@redhat.com>

> 
> diff --git a/block/monitor/bitmap-qmp-cmds.c b/block/monitor/bitmap-qmp-cmds.c
> index bd10468596..282363606f 100644
> --- a/block/monitor/bitmap-qmp-cmds.c
> +++ b/block/monitor/bitmap-qmp-cmds.c
> @@ -261,8 +261,9 @@ BdrvDirtyBitmap *block_dirty_bitmap_merge(const char *node, const char *target,
>                                            HBitmap **backup, Error **errp)
>  {
>      BlockDriverState *bs;
> -    BdrvDirtyBitmap *dst, *src, *anon;
> +    BdrvDirtyBitmap *dst, *src;
>      BlockDirtyBitmapOrStrList *lst;
> +    HBitmap *local_backup = NULL;

Basically, instead of tracking the backup via a full-featured
BdrvDirtyBitmap, we are instead tracking it via a lightweight HBitmap.

-- 
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3266
Virtualization:  qemu.org | libvirt.org


