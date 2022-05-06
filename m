Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 056F051DC52
	for <lists+qemu-devel@lfdr.de>; Fri,  6 May 2022 17:41:40 +0200 (CEST)
Received: from localhost ([::1]:46248 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nn05I-0005RG-3c
	for lists+qemu-devel@lfdr.de; Fri, 06 May 2022 11:41:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58572)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1nn035-00041m-EF
 for qemu-devel@nongnu.org; Fri, 06 May 2022 11:39:20 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:39993)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1nn033-0006ws-W8
 for qemu-devel@nongnu.org; Fri, 06 May 2022 11:39:19 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1651851553;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=YKu6fLLsO54RoL7+fBIjIUL2xD1a16wTAITWebE/fsA=;
 b=YSvWggVyvkXaHU/qSJHr6hJslJl+FAh/ufzxWjpgYCIllk5xDnOmgEdNXfZIKgV9HtWlv/
 CsbguA9EhwEhwtS3+QIJbpnCLFeMwnLxa9tkQLph1Qcl7w8NlEwiqAIg7M1EUzUFakdicy
 EpPk7Ozlmy37n7lsovXMTPXE3TDkNoE=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-425-v8Q0mbRVOzuvBsIOnOyf5w-1; Fri, 06 May 2022 11:39:10 -0400
X-MC-Unique: v8Q0mbRVOzuvBsIOnOyf5w-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
 [10.11.54.1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 2FDC23C977C1;
 Fri,  6 May 2022 15:39:10 +0000 (UTC)
Received: from redhat.com (unknown [10.2.16.230])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 45F0740869CC;
 Fri,  6 May 2022 15:39:08 +0000 (UTC)
Date: Fri, 6 May 2022 10:39:06 -0500
From: Eric Blake <eblake@redhat.com>
To: Fabian Ebner <f.ebner@proxmox.com>
Cc: qemu-devel@nongnu.org, kwolf@redhat.com, hreitz@redhat.com,
 qemu-block@nongnu.org, integration@gluster.org,
 qemu-stable@nongnu.org, vsementsov@virtuozzo.com, v.sementsov-og@mail.ru
Subject: Re: [PATCH] block/gluster: correctly set max_pdiscard which is int64_t
Message-ID: <20220506153906.gyh6rty6kr7hkixs@redhat.com>
References: <20220505083124.163404-1-f.ebner@proxmox.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220505083124.163404-1-f.ebner@proxmox.com>
User-Agent: NeoMutt/20220429-35-ca2e7f
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.1
Received-SPF: pass client-ip=170.10.129.124; envelope-from=eblake@redhat.com;
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, May 05, 2022 at 10:31:24AM +0200, Fabian Ebner wrote:
> Previously, max_pdiscard would be zero in the following assertion:
> qemu-system-x86_64: ../block/io.c:3166: bdrv_co_pdiscard: Assertion
> `max_pdiscard >= bs->bl.request_alignment' failed.
> 
> Fixes: 0c8022876f ("block: use int64_t instead of int in driver discard handlers")
> Cc: qemu-stable@nongnu.org
> Signed-off-by: Fabian Ebner <f.ebner@proxmox.com>
> ---
>  block/gluster.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/block/gluster.c b/block/gluster.c
> index 398976bc66..592e71b22a 100644
> --- a/block/gluster.c
> +++ b/block/gluster.c
> @@ -891,7 +891,7 @@ out:
>  static void qemu_gluster_refresh_limits(BlockDriverState *bs, Error **errp)
>  {
>      bs->bl.max_transfer = GLUSTER_MAX_TRANSFER;
> -    bs->bl.max_pdiscard = SIZE_MAX;
> +    bs->bl.max_pdiscard = INT64_MAX;

SIZE_MAX is unsigned, but can differ between 32- and 64-bit platforms.
Blindly setting max_pdiscard to a signed 64-bit value seems wrong if
glfs_discard_async() takes a size_t and you are on a 32-bit platform.

Is the real issue that SIZE_MAX on a 64-bit platform is too large,
where we want min(SIZE_MAX,INT_MAX) as our real cap?

>  }
>  
>  static int qemu_gluster_reopen_prepare(BDRVReopenState *state,
> @@ -1304,7 +1304,7 @@ static coroutine_fn int qemu_gluster_co_pdiscard(BlockDriverState *bs,
>      GlusterAIOCB acb;
>      BDRVGlusterState *s = bs->opaque;
>  
> -    assert(bytes <= SIZE_MAX); /* rely on max_pdiscard */
> +    assert(bytes <= INT64_MAX); /* rely on max_pdiscard */
>  
>      acb.size = 0;
>      acb.ret = 0;
> -- 
> 2.30.2
> 
> 
> 

-- 
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3266
Virtualization:  qemu.org | libvirt.org


