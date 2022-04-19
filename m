Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BE685078B1
	for <lists+qemu-devel@lfdr.de>; Tue, 19 Apr 2022 20:27:23 +0200 (CEST)
Received: from localhost ([::1]:36996 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ngsZN-0005Lb-NX
	for lists+qemu-devel@lfdr.de; Tue, 19 Apr 2022 14:27:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48100)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1ngsY7-0004Ur-K2
 for qemu-devel@nongnu.org; Tue, 19 Apr 2022 14:26:03 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:60985)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1ngsY4-0008Mw-Ou
 for qemu-devel@nongnu.org; Tue, 19 Apr 2022 14:26:02 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1650392759;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=ULXEEnZ/y/XURZuXQd670kxr48Rdgcsyl52MV3yPaC8=;
 b=IZaDtFelhqO0XnVyhNT9TBwQH7205CNgkDAng+bYfzBF66xdWY17dknLenalTbwYjBVw9H
 1pWo7P8HbpHnwsSQV1p/oz8VwBqk/GhKjfqLk/nxQbEz6EFJkh906R4YXgPZw1ZhR+3I2u
 eoHpipWusOziQ8IU81K8MHLfwcozH84=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-175-ctZkvkWEMI2bidrdGvEt_A-1; Tue, 19 Apr 2022 14:25:58 -0400
X-MC-Unique: ctZkvkWEMI2bidrdGvEt_A-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 0E79E185A7BA;
 Tue, 19 Apr 2022 18:25:58 +0000 (UTC)
Received: from redhat.com (unknown [10.2.17.175])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 7893C40E80F4;
 Tue, 19 Apr 2022 18:25:57 +0000 (UTC)
Date: Tue, 19 Apr 2022 13:25:55 -0500
From: Eric Blake <eblake@redhat.com>
To: Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [PATCH 04/26] coroutine: remove incorrect coroutine_fn annotations
Message-ID: <20220419182535.4st6oxj6cgsm72h6@redhat.com>
References: <20220415131900.793161-1-pbonzini@redhat.com>
 <20220415131900.793161-5-pbonzini@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20220415131900.793161-5-pbonzini@redhat.com>
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

On Fri, Apr 15, 2022 at 03:18:38PM +0200, Paolo Bonzini wrote:
> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>

Again, a short summary why it is correct is helpful.

> ---
>  include/qemu/coroutine.h | 2 +-
>  util/qemu-coroutine.c    | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/include/qemu/coroutine.h b/include/qemu/coroutine.h
> index 284571badb..2d9211faff 100644
> --- a/include/qemu/coroutine.h
> +++ b/include/qemu/coroutine.h
> @@ -92,7 +92,7 @@ void coroutine_fn qemu_coroutine_yield(void);
>  /**
>   * Get the AioContext of the given coroutine
>   */
> -AioContext *coroutine_fn qemu_coroutine_get_aio_context(Coroutine *co);
> +AioContext *qemu_coroutine_get_aio_context(Coroutine *co);

Here, the intent is that this function is safe to call even when not
in a coroutine, and the annotation is only needed when it is required
that the caller already be in a coroutine.

Reviewed-by: Eric Blake <eblake@redhat.com>

-- 
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3266
Virtualization:  qemu.org | libvirt.org


