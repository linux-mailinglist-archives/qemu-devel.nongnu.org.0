Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 46DAF6C43DD
	for <lists+qemu-devel@lfdr.de>; Wed, 22 Mar 2023 08:13:10 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pesdR-0007GW-Gw; Wed, 22 Mar 2023 03:11:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pesdP-0007G1-1p
 for qemu-devel@nongnu.org; Wed, 22 Mar 2023 03:11:47 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pesdM-0004CF-V3
 for qemu-devel@nongnu.org; Wed, 22 Mar 2023 03:11:46 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1679469103;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=q/lmMLAupyB3P1zJRfQPU0maaEdCPvmsmmD5XNkpAmw=;
 b=CSaq6gClw/gZ5aRE2h71gnPxXfmt26x/kPlSEy1Ua6Cdv78IjZqWaMqS/cUKKEaWjsXftR
 cKAWUx/RDBAOV2MWc/sHWIvaf0uKuKSHacPf77OaVzSRkdwVgdn/2KRQsA0EwcThmYxh8p
 mCRUSpx0D0H6Db+iLOOLqZ8Ta0v1Dww=
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com
 [209.85.222.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-139-LipUv6VEM1OQ3tjkieNG0A-1; Wed, 22 Mar 2023 03:11:41 -0400
X-MC-Unique: LipUv6VEM1OQ3tjkieNG0A-1
Received: by mail-qk1-f199.google.com with SMTP id
 ou5-20020a05620a620500b007423e532628so8197885qkn.5
 for <qemu-devel@nongnu.org>; Wed, 22 Mar 2023 00:11:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679469101;
 h=content-transfer-encoding:in-reply-to:subject:from:references:cc:to
 :content-language:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=q/lmMLAupyB3P1zJRfQPU0maaEdCPvmsmmD5XNkpAmw=;
 b=M6iJxIuG6D8xYzr26hZpRjfrSogX3Uh4lbCVrZFQHnoqdg489H8B0o6rsmNQz3el6k
 +GDVrSayWPS5ZYTGJzcsZfE+tR0PmATM0BJAnFbltiE9Oes8cJAEaBIeIkVb71wojYdx
 BGYQwvpMAuVOI5zUPiL4RiydTCz9mXlEVG0nhhvfgSG2hNYGVlOJmrgMdrdSsRwojxN5
 Kcac/XaE0kFf0vJObqQn1h/XCZuju4gs6q7Eg5PQouifVspUQh9O0IsumqUqdyn8N9Tm
 9DpBHHdJLC9zH7lxDXhEODOKEhDarYB72zWm04t27OZglkYpCr4p4mdFEIx5jmsVOuJ6
 yzGA==
X-Gm-Message-State: AO0yUKUFNVTA7gLGpateAq0q7ifccwkkP9tmRkiP2BOVIjvvIB3Ar1ri
 L5juirBiwOw26ZBkT+g8ZlY1M0pOde0JM/uacINKLycwpl6h1kpyCltL1taiOw0av4S5tNDy9zt
 2Xf0Z9BdFNbQ1pwE=
X-Received: by 2002:ad4:5cab:0:b0:5c5:471a:1e1e with SMTP id
 q11-20020ad45cab000000b005c5471a1e1emr5509499qvh.17.1679469101464; 
 Wed, 22 Mar 2023 00:11:41 -0700 (PDT)
X-Google-Smtp-Source: AK7set9EJVVJhXLCkRvtzL9CFyxqhrxLLu1EUPPH7ZSLtu85RiAxK5EURSlqFbB1Kl9nJ8S9Nt5XMQ==
X-Received: by 2002:ad4:5cab:0:b0:5c5:471a:1e1e with SMTP id
 q11-20020ad45cab000000b005c5471a1e1emr5509482qvh.17.1679469101231; 
 Wed, 22 Mar 2023 00:11:41 -0700 (PDT)
Received: from [192.168.8.106] (tmo-102-206.customers.d1-online.com.
 [80.187.102.206]) by smtp.gmail.com with ESMTPSA id
 a4-20020ae9e804000000b007467f8b76f0sm6288594qkg.41.2023.03.22.00.11.38
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 22 Mar 2023 00:11:40 -0700 (PDT)
Message-ID: <14e4785e-6d3c-0891-1d59-3be4cbd700cd@redhat.com>
Date: Wed, 22 Mar 2023 08:11:37 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Content-Language: en-US
To: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>, qemu-devel@nongnu.org
Cc: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?Q?Daniel_P_=2e_Berrang=c3=a9?= <berrange@redhat.com>
References: <20230321161609.716474-1-clg@kaod.org>
 <20230321161609.716474-2-clg@kaod.org>
From: Thomas Huth <thuth@redhat.com>
Subject: Re: [PATCH for-8.0 v2 1/3] async: Suppress GCC13 false positive in
 aio_bh_poll()
In-Reply-To: <20230321161609.716474-2-clg@kaod.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

On 21/03/2023 17.16, Cédric Le Goater wrote:
> From: Cédric Le Goater <clg@redhat.com>
> 
> GCC13 reports an error :
> 
> ../util/async.c: In function ‘aio_bh_poll’:
> include/qemu/queue.h:303:22: error: storing the address of local variable ‘slice’ in ‘*ctx.bh_slice_list.sqh_last’ [-Werror=dangling-pointer=]
>    303 |     (head)->sqh_last = &(elm)->field.sqe_next;                          \
>        |     ~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~
> ../util/async.c:169:5: note: in expansion of macro ‘QSIMPLEQ_INSERT_TAIL’
>    169 |     QSIMPLEQ_INSERT_TAIL(&ctx->bh_slice_list, &slice, next);
>        |     ^~~~~~~~~~~~~~~~~~~~
> ../util/async.c:161:17: note: ‘slice’ declared here
>    161 |     BHListSlice slice;
>        |                 ^~~~~
> ../util/async.c:161:17: note: ‘ctx’ declared here
> 
> But the local variable 'slice' is removed from the global context list
> in following loop of the same routine. Add a pragma to silent GCC.
> 
> Cc: Stefan Hajnoczi <stefanha@redhat.com>
> Cc: Paolo Bonzini <pbonzini@redhat.com>
> Cc: Daniel P. Berrangé <berrange@redhat.com>
> Signed-off-by: Cédric Le Goater <clg@redhat.com>
> ---
>   util/async.c | 13 +++++++++++++
>   1 file changed, 13 insertions(+)
> 
> diff --git a/util/async.c b/util/async.c
> index 21016a1ac7..de9b431236 100644
> --- a/util/async.c
> +++ b/util/async.c
> @@ -164,7 +164,20 @@ int aio_bh_poll(AioContext *ctx)
>   
>       /* Synchronizes with QSLIST_INSERT_HEAD_ATOMIC in aio_bh_enqueue().  */
>       QSLIST_MOVE_ATOMIC(&slice.bh_list, &ctx->bh_list);
> +
> +    /*
> +     * GCC13 [-Werror=dangling-pointer=] complains that the local variable
> +     * 'slice' is being stored in the global 'ctx->bh_slice_list' but the
> +     * list is emptied before this function returns.
> +     */
> +#if !defined(__clang__)
> +#pragma GCC diagnostic push
> +#pragma GCC diagnostic ignored "-Wdangling-pointer="

That warning parameter looks like a new one in GCC 13 ?
... so you have to check whether it's available before disabling
it, otherwise this will fail with older versions of GCC. I just
gave it a try with my GCC 8.5 and got this:

../../devel/qemu/util/async.c: In function ‘aio_bh_poll’:
../../devel/qemu/util/async.c:175:32: error: unknown option after ‘#pragma GCC diagnostic’ kind [-Werror=pragmas]
  #pragma GCC diagnostic ignored "-Wdangling-pointer="
                                 ^~~~~~~~~~~~~~~~~~~~~
cc1: all warnings being treated as errors

  Thomas

What about reworking the code like this:

diff --git a/util/async.c b/util/async.c
index 21016a1ac7..b236bdfbd8 100644
--- a/util/async.c
+++ b/util/async.c
@@ -156,15 +156,14 @@ void aio_bh_call(QEMUBH *bh)
  }
  
  /* Multiple occurrences of aio_bh_poll cannot be called concurrently. */
-int aio_bh_poll(AioContext *ctx)
+static int aio_bh_poll_slice(AioContext *ctx, BHListSlice *slice)
  {
-    BHListSlice slice;
      BHListSlice *s;
      int ret = 0;
  
      /* Synchronizes with QSLIST_INSERT_HEAD_ATOMIC in aio_bh_enqueue().  */
-    QSLIST_MOVE_ATOMIC(&slice.bh_list, &ctx->bh_list);
-    QSIMPLEQ_INSERT_TAIL(&ctx->bh_slice_list, &slice, next);
+    QSLIST_MOVE_ATOMIC(&slice->bh_list, &ctx->bh_list);
+    QSIMPLEQ_INSERT_TAIL(&ctx->bh_slice_list, slice, next);
  
      while ((s = QSIMPLEQ_FIRST(&ctx->bh_slice_list))) {
          QEMUBH *bh;
@@ -191,6 +190,13 @@ int aio_bh_poll(AioContext *ctx)
      return ret;
  }
  
+int aio_bh_poll(AioContext *ctx)
+{
+    BHListSlice slice;
+
+    return aio_bh_poll_slice(ctx, &slice);
+}
+
  void qemu_bh_schedule_idle(QEMUBH *bh)
  {
      aio_bh_enqueue(bh, BH_SCHEDULED | BH_IDLE);

Would that work with GCC 13 and be acceptable?

  Thomas


