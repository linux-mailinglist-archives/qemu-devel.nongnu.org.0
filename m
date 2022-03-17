Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 622874DCC2C
	for <lists+qemu-devel@lfdr.de>; Thu, 17 Mar 2022 18:16:23 +0100 (CET)
Received: from localhost ([::1]:50824 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nUtja-0003bf-Gl
	for lists+qemu-devel@lfdr.de; Thu, 17 Mar 2022 13:16:22 -0400
Received: from eggs.gnu.org ([209.51.188.92]:43652)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1nUthw-0002fU-IZ
 for qemu-devel@nongnu.org; Thu, 17 Mar 2022 13:14:40 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:37409)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1nUthu-0003HY-PA
 for qemu-devel@nongnu.org; Thu, 17 Mar 2022 13:14:40 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1647537278;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=pdZHsv8NMNgKIwAWVsi5KOuNDBnQDEl9a2TRcsrbyS4=;
 b=JrfCvpkEodfJdFdjc3iIYs2fMF74JAUoi3ZX0sBPap3aOA6Cs5NY6eC2JPj5kB3eMTyRQa
 1pussQ6PacR8TL0KoEznoSSgGzvBXpohBh/0dsHwgmZ9U1MWxzu8eVPuEs3VkWXs5Dm0ar
 Runu50tUhJMjtToD4UILoGJ6U6jWvvI=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-622-O_u_jzBoMp2X2XyqFzeKKg-1; Thu, 17 Mar 2022 13:14:25 -0400
X-MC-Unique: O_u_jzBoMp2X2XyqFzeKKg-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
 [10.11.54.1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 277181C068CB;
 Thu, 17 Mar 2022 17:14:25 +0000 (UTC)
Received: from redhat.com (unknown [10.39.194.80])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 9D29441136F5;
 Thu, 17 Mar 2022 17:14:23 +0000 (UTC)
Date: Thu, 17 Mar 2022 17:14:20 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Stefan Hajnoczi <stefanha@redhat.com>
Subject: Re: [PULL for-7.0 1/2] aio-posix: fix build failure io_uring 2.2
Message-ID: <YjNsbJcTkoxdPE4P@redhat.com>
References: <20220317165743.238662-1-stefanha@redhat.com>
 <20220317165743.238662-2-stefanha@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20220317165743.238662-2-stefanha@redhat.com>
User-Agent: Mutt/2.1.5 (2021-12-30)
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.1
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Reply-To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
Cc: Fam Zheng <fam@euphon.net>, Peter Maydell <peter.maydell@linaro.org>,
 qemu-block@nongnu.org, qemu-devel@nongnu.org,
 Haiyue Wang <haiyue.wang@intel.com>, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Mar 17, 2022 at 04:57:42PM +0000, Stefan Hajnoczi wrote:
> From: Haiyue Wang <haiyue.wang@intel.com>
> 
> The io_uring fixed "Don't truncate addr fields to 32-bit on 32-bit":
> https://git.kernel.dk/cgit/liburing/commit/?id=d84c29b19ed0b130000619cff40141bb1fc3615b

Ewww, that changes the public ABI of the library on 32-bit
platforms, but failed to bump the soname version, except....

...investigating this I noticed a further change that happend
a few weeks earlier in liburing that actually dropped the
version from the soname entirely making it an unversioned
library.

This is the current shipping 2.1 version:

$ eu-readelf -a liburing.so.2.0.0  | grep SONAME
  SONAME            Library soname: [liburing.so.2]

and in git master:

$ eu-readelf -a src/liburing.so.2.2 | grep SONA
  SONAME            Library soname: [liburing.so]

Surely that's a mistake.

After the ABI incompatibility above, I would have expected
it to bump to liburing.so.3 


> 
> This leads to build failure:
> ../util/fdmon-io_uring.c: In function ‘add_poll_remove_sqe’:
> ../util/fdmon-io_uring.c:182:36: error: passing argument 2 of ‘io_uring_prep_poll_remove’ makes integer from pointer without a cast [-Werror=int-conversion]
>   182 |     io_uring_prep_poll_remove(sqe, node);
>       |                                    ^~~~
>       |                                    |
>       |                                    AioHandler *
> In file included from /root/io/qemu/include/block/aio.h:18,
>                  from ../util/aio-posix.h:20,
>                  from ../util/fdmon-io_uring.c:49:
> /usr/include/liburing.h:415:17: note: expected ‘__u64’ {aka ‘long long unsigned int’} but argument is of type ‘AioHandler *’
>   415 |           __u64 user_data)
>       |           ~~~~~~^~~~~~~~~
> cc1: all warnings being treated as errors
> 
> Use LIBURING_HAVE_DATA64 to check whether the io_uring supports 64-bit
> variants of the get/set userdata, to convert the paramter to the right
> data type.
> 
> Signed-off-by: Haiyue Wang <haiyue.wang@intel.com>
> Message-Id: <20220221162401.45415-1-haiyue.wang@intel.com>
> Signed-off-by: Stefan Hajnoczi <stefanha@redhat.com>
> ---
>  util/fdmon-io_uring.c | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/util/fdmon-io_uring.c b/util/fdmon-io_uring.c
> index 1461dfa407..ab43052dd7 100644
> --- a/util/fdmon-io_uring.c
> +++ b/util/fdmon-io_uring.c
> @@ -179,7 +179,11 @@ static void add_poll_remove_sqe(AioContext *ctx, AioHandler *node)
>  {
>      struct io_uring_sqe *sqe = get_sqe(ctx);
>  
> +#ifdef LIBURING_HAVE_DATA64
> +    io_uring_prep_poll_remove(sqe, (__u64)(uintptr_t)node);
> +#else
>      io_uring_prep_poll_remove(sqe, node);
> +#endif
>  }
>  
>  /* Add a timeout that self-cancels when another cqe becomes ready */
> -- 
> 2.35.1
> 
> 

With regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


