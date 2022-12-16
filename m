Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EC15D64E8C2
	for <lists+qemu-devel@lfdr.de>; Fri, 16 Dec 2022 10:42:45 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p67Dg-0003lr-VA; Fri, 16 Dec 2022 04:41:33 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1p67DY-0003jo-Lj
 for qemu-devel@nongnu.org; Fri, 16 Dec 2022 04:41:24 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1p67DW-0002a5-LS
 for qemu-devel@nongnu.org; Fri, 16 Dec 2022 04:41:24 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1671183681;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=k9+jiPpaZWmBBlPFPnbEbSvfotYw+WjSeCrihJyjWu8=;
 b=WxmNMhWs35qB65vru/v7T/j8dTYAwLJlw4OAYYp2EIhXTzDR4TOFRxSckfAdgL4DbVTkI4
 XLzYfw9N1QaLVEHWonJlz0lAf160z9j9fUlu8fyY6OiaMCKv5+OBFjYVSNAGwqSvvZdoYY
 VQRlfG1cVRUATPER/U2USQB933eGXzI=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-5-bZIFpoPbNeC5ujpwiVFf9A-1; Fri, 16 Dec 2022 04:41:17 -0500
X-MC-Unique: bZIFpoPbNeC5ujpwiVFf9A-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
 [10.11.54.10])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 20BF818A6461;
 Fri, 16 Dec 2022 09:41:17 +0000 (UTC)
Received: from redhat.com (unknown [10.39.192.171])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 52FDB483EC4;
 Fri, 16 Dec 2022 09:41:16 +0000 (UTC)
Date: Fri, 16 Dec 2022 10:41:14 +0100
From: Kevin Wolf <kwolf@redhat.com>
To: Paolo Bonzini <pbonzini@redhat.com>
Cc: qemu-devel@nongnu.org, afaria@redhat.com, qemu-block@nongnu.org
Subject: Re: [PATCH 2/2] block: Add no_coroutine_fn and coroutine_mixed_fn
 marker
Message-ID: <Y5w9OoGutN1YaW4J@redhat.com>
References: <20221215174407.500414-1-pbonzini@redhat.com>
 <20221215174407.500414-3-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221215174407.500414-3-pbonzini@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.10
Received-SPF: pass client-ip=170.10.129.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

Am 15.12.2022 um 18:44 hat Paolo Bonzini geschrieben:
> From: Alberto Faria <afaria@redhat.com>
> 
> Add more annotations to functions, describing valid and invalid
> calls from coroutine to non-coroutine context.
> 
> When applied to a function, no_coroutine_fn advertises that it should
> not be called from coroutine_fn functions.  This can be because the
> function blocks or, in the case of generated_co_wrapper, to enforce
> that coroutine_fn functions directly call the coroutine_fn that backs
> the generated_co_wrapper.
> 
> coroutine_mixed_fn instead is for function that can be called in
> both coroutine and non-coroutine context, but will suspend when
> called in coroutine context.  Annotating them is a first step
> towards enforcing that non-annotated functions are absolutely
> not going to suspend.
> 
> These can be used for example with the vrc tool from
> https://github.com/bonzini/vrc:
> 
>     # find functions that *really* cannot be called from no_coroutine_fn
>     (vrc) load --loader clang libblock.fa.p/meson-generated_.._block_block-gen.c.o
>     # The comma is an "AND".  The "path" here consists of a single node
>     (vrc) paths [no_coroutine_fn,!coroutine_mixed_fn]
>     bdrv_remove_persistent_dirty_bitmap
>     bdrv_create
>     bdrv_can_store_new_dirty_bitmap
> 
>     # find how coroutine_fns end up calling a mixed function
>     (vrc) load --loader clang --force libblock.fa.p/*.c.o
>     # regular expression search
>     (vrc) paths [coroutine_fn] [!no_coroutine_fn]* [coroutine_mixed_fn]
>     ...
>     bdrv_pread <- vhdx_log_write <- vhdx_log_write_and_flush <- vhdx_co_writev
>     ...
> 
> Signed-off-by: Alberto Faria <afaria@redhat.com>
> [Rebase, add coroutine_mixed_fn. - Paolo]
> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
> ---
>  include/block/block-common.h | 11 +++++++----
>  include/qemu/coroutine.h     | 33 +++++++++++++++++++++++++++++++++
>  2 files changed, 40 insertions(+), 4 deletions(-)
> 
> diff --git a/include/block/block-common.h b/include/block/block-common.h
> index 4749c46a5e7e..cce79bd00135 100644
> --- a/include/block/block-common.h
> +++ b/include/block/block-common.h
> @@ -50,11 +50,14 @@
>   * - co_wrapper_mixed_bdrv_rdlock are co_wrapper_mixed functions but
>   *   automatically take and release the graph rdlock when creating a new
>   *   coroutine.
> + *
> + * These functions should not be called from a coroutine_fn; instead,
> + * call the wrapped function directly.
>   */
> -#define co_wrapper
> -#define co_wrapper_mixed
> -#define co_wrapper_bdrv_rdlock
> -#define co_wrapper_mixed_bdrv_rdlock
> +#define co_wrapper                     no_coroutine_fn
> +#define co_wrapper_mixed               no_coroutine_fn coroutine_mixed_fn
> +#define co_wrapper_bdrv_rdlock         no_coroutine_fn
> +#define co_wrapper_mixed_bdrv_rdlock   no_coroutine_fn coroutine_mixed_fn
>  
>  #include "block/dirty-bitmap.h"
>  #include "block/blockjob.h"
> diff --git a/include/qemu/coroutine.h b/include/qemu/coroutine.h
> index b0c97f6fb7ad..5f5ab8136a3a 100644
> --- a/include/qemu/coroutine.h
> +++ b/include/qemu/coroutine.h
> @@ -28,6 +28,27 @@
>   * These functions are re-entrant and may be used outside the global mutex.
>   */
>  
> +/**
> + * Mark a function that can suspend when executed in coroutine context,
> + * but can handle running in non-coroutine context too.
> + *
> + * Functions that execute in coroutine context cannot be called directly from
> + * normal functions.  In the future it would be nice to enable compiler or
> + * static checker support for catching such errors.  This annotation might make
> + * it possible and in the meantime it serves as documentation.
> + *
> + * For example:
> + *
> + *   static void coroutine_fn foo(void) {

s/coroutine_fn/coroutine_mixed_fn/

> + *       ....
> + *   }
> + */
> +#ifdef __clang__
> +#define coroutine_mixed_fn __attribute__((__annotate__("coroutine_mixed_fn")))
> +#else
> +#define coroutine_mixed_fn
> +#endif
> +
>  /**
>   * Mark a function that executes in coroutine context
>   *
> @@ -48,6 +69,18 @@
>  #define coroutine_fn
>  #endif
>  
> +/**
> + * Mark a function that should never be called from a coroutine context

Maybe this could be phrased better, because coroutine_mixed_fn are
functions that are specifically meant to be called from ambiguous
context, which of course includes coroutine context.

Something like "...when the caller knows that it is in coroutine
context"?

> + * This typically means that there is an analogous, coroutine_fn function that
> + * should be used instead.
> + */
> +#ifdef __clang__
> +#define no_coroutine_fn __attribute__((__annotate__("no_coroutine_fn")))
> +#else
> +#define no_coroutine_fn
> +#endif
> +

Kevin


