Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E14825803C7
	for <lists+qemu-devel@lfdr.de>; Mon, 25 Jul 2022 20:09:11 +0200 (CEST)
Received: from localhost ([::1]:51646 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oG2Vy-0003yO-Ld
	for lists+qemu-devel@lfdr.de; Mon, 25 Jul 2022 14:09:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45606)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1oG2UV-0002Jp-8o
 for qemu-devel@nongnu.org; Mon, 25 Jul 2022 14:07:39 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:56751)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1oG2UT-0004g5-9J
 for qemu-devel@nongnu.org; Mon, 25 Jul 2022 14:07:38 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1658772456;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=DevWWlgm6GlTpF6XqeS9krz79brtNqqQyHUWT5+mB7g=;
 b=bdwUmcBzkKVGMsFxnekeVAPGK4966JAXCpfRQj5EUuGkRquxvkGbvbdn4iFPs8lFkoWegY
 piag5VN8TSoT4aJlD8JO1s0SxTr1wWhpKiOMU9mq53vMgd8cAkmz80BeDGEjIkz21eWFOt
 TPJfezjRbMx1Z0x8aQJ+N1ya6ehATew=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-85-1wgT9EGEM_aScCklbwK00w-1; Mon, 25 Jul 2022 14:07:30 -0400
X-MC-Unique: 1wgT9EGEM_aScCklbwK00w-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
 [10.11.54.10])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 2B5D385A587;
 Mon, 25 Jul 2022 18:07:30 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.39.194.81])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 04517492C3B;
 Mon, 25 Jul 2022 18:07:30 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id D077121E6930; Mon, 25 Jul 2022 20:07:28 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: qemu-trivial@nongnu.org
Cc: qemu-devel@nongnu.org,  raphael.norwitz@nutanix.com,  mst@redhat.com
Subject: Re: [PATCH] contrib/vhost-user-blk: Clean up deallocation of
 VuVirtqElement
References: <20220630085219.1305519-1-armbru@redhat.com>
Date: Mon, 25 Jul 2022 20:07:28 +0200
In-Reply-To: <20220630085219.1305519-1-armbru@redhat.com> (Markus Armbruster's
 message of "Thu, 30 Jun 2022 10:52:19 +0200")
Message-ID: <87tu75nk0v.fsf@pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.10
Received-SPF: pass client-ip=170.10.129.124; envelope-from=armbru@redhat.com;
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

Could this go via qemu-trivial now?

Markus Armbruster <armbru@redhat.com> writes:

> We allocate VuVirtqElement with g_malloc() in
> virtqueue_alloc_element(), but free it with free() in
> vhost-user-blk.c.  Harmless, but use g_free() anyway.
>
> One of the calls is guarded by a "not null" condition.  Useless,
> because it cannot be null (it's dereferenced right before), and even
> it it could be, free() and g_free() do the right thing.  Drop the
> conditional.
>
> Fixes: Coverity CID 1490290
> Signed-off-by: Markus Armbruster <armbru@redhat.com>
> ---
> Not even compile-tested, because I can't figure out how this thing is
> supposed to be built.  Its initial commit message says "make
> vhost-user-blk", but that doesn't work anymore.
>
>  contrib/vhost-user-blk/vhost-user-blk.c | 9 +++------
>  1 file changed, 3 insertions(+), 6 deletions(-)
>
> diff --git a/contrib/vhost-user-blk/vhost-user-blk.c b/contrib/vhost-user-blk/vhost-user-blk.c
> index 9cb78ca1d0..d6932a2645 100644
> --- a/contrib/vhost-user-blk/vhost-user-blk.c
> +++ b/contrib/vhost-user-blk/vhost-user-blk.c
> @@ -106,10 +106,7 @@ static void vub_req_complete(VubReq *req)
>                    req->size + 1);
>      vu_queue_notify(vu_dev, req->vq);
>  
> -    if (req->elem) {
> -        free(req->elem);
> -    }
> -
> +    g_free(req->elem);
>      g_free(req);
>  }
>  
> @@ -243,7 +240,7 @@ static int vub_virtio_process_req(VubDev *vdev_blk,
>      /* refer to hw/block/virtio_blk.c */
>      if (elem->out_num < 1 || elem->in_num < 1) {
>          fprintf(stderr, "virtio-blk request missing headers\n");
> -        free(elem);
> +        g_free(elem);
>          return -1;
>      }
>  
> @@ -325,7 +322,7 @@ static int vub_virtio_process_req(VubDev *vdev_blk,
>      return 0;
>  
>  err:
> -    free(elem);
> +    g_free(elem);
>      g_free(req);
>      return -1;
>  }


