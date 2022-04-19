Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A221850771B
	for <lists+qemu-devel@lfdr.de>; Tue, 19 Apr 2022 20:09:36 +0200 (CEST)
Received: from localhost ([::1]:54612 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ngsIB-0005oW-Ee
	for lists+qemu-devel@lfdr.de; Tue, 19 Apr 2022 14:09:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45292)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1ngsG6-0004yQ-Vs
 for qemu-devel@nongnu.org; Tue, 19 Apr 2022 14:07:26 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:29578)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1ngsG4-0005kJ-IY
 for qemu-devel@nongnu.org; Tue, 19 Apr 2022 14:07:25 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1650391643;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=i6kBphklwC/W+CNI/5JgnARtunJIfg83YFgYtES0zT8=;
 b=ZQ0XCUPr6130RR0mgFnQrdpZenWiKs5eZD3fjSyYDFRRxf/tenLNYoOY7HIz9UJPHQncx0
 p6qMTKOQX9hk9CJm5/NSrD6RkE9BkOMqZfdvP0AqULf37ZrFYTYPCnf0xa+Sun0GpwTjYj
 uMiHcxEHkvpr9veuk8djJ3p2+qRIu8Q=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-495-DQyTssYOONimFmXceyo7jw-1; Tue, 19 Apr 2022 14:07:22 -0400
X-MC-Unique: DQyTssYOONimFmXceyo7jw-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id C0EDD3802132;
 Tue, 19 Apr 2022 18:07:21 +0000 (UTC)
Received: from redhat.com (unknown [10.2.17.175])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 36B6540D282A;
 Tue, 19 Apr 2022 18:07:21 +0000 (UTC)
Date: Tue, 19 Apr 2022 13:07:19 -0500
From: Eric Blake <eblake@redhat.com>
To: Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [PATCH 02/26] qcow2: remove incorrect coroutine_fn annotations
Message-ID: <20220419180643.hhzredj3qfazd4a3@redhat.com>
References: <20220415131900.793161-1-pbonzini@redhat.com>
 <20220415131900.793161-3-pbonzini@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20220415131900.793161-3-pbonzini@redhat.com>
User-Agent: NeoMutt/20211029-35-db88c3
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.2
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eblake@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.129.124; envelope-from=eblake@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: kwolf@redhat.com, hreitz@redhat.com, qemu-block@nongnu.org,
 qemu-devel@nongnu.org, stefanha@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, Apr 15, 2022 at 03:18:36PM +0200, Paolo Bonzini wrote:
> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
> ---

Again, a sentence on why this is correct would be helpful.

>  block/qcow2-refcount.c | 4 ++--
>  block/qcow2.h          | 4 ++--
>  2 files changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/block/qcow2-refcount.c b/block/qcow2-refcount.c
> index b91499410c..b6f90b2702 100644
> --- a/block/qcow2-refcount.c
> +++ b/block/qcow2-refcount.c
> @@ -1206,7 +1206,7 @@ void qcow2_free_any_cluster(BlockDriverState *bs, uint64_t l2_entry,
>      }
>  }
>  
> -int coroutine_fn qcow2_write_caches(BlockDriverState *bs)
> +int qcow2_write_caches(BlockDriverState *bs)
>  {
>      BDRVQcow2State *s = bs->opaque;
>      int ret;
> @@ -1226,7 +1226,7 @@ int coroutine_fn qcow2_write_caches(BlockDriverState *bs)
>      return 0;
>  }
>  
> -int coroutine_fn qcow2_flush_caches(BlockDriverState *bs)
> +int qcow2_flush_caches(BlockDriverState *bs)
>  {
>      int ret = qcow2_write_caches(bs);

Both of these eventually hit qcow2_cache_write, which is not marked
coroutine, so these should not be either.

Reviewed-by: Eric Blake <eblake@redhat.com>

-- 
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3266
Virtualization:  qemu.org | libvirt.org


