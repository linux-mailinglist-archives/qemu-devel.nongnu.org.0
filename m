Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D04149FFC9
	for <lists+qemu-devel@lfdr.de>; Fri, 28 Jan 2022 18:52:52 +0100 (CET)
Received: from localhost ([::1]:38726 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nDVQZ-0006Sz-8K
	for lists+qemu-devel@lfdr.de; Fri, 28 Jan 2022 12:52:51 -0500
Received: from eggs.gnu.org ([209.51.188.92]:36496)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1nDVOd-0004dt-Ah
 for qemu-devel@nongnu.org; Fri, 28 Jan 2022 12:50:51 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:30040)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1nDVOU-0002n3-ME
 for qemu-devel@nongnu.org; Fri, 28 Jan 2022 12:50:45 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1643392240;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=Ta32Fp99Iaxk3XZ0bur54d2PCkTDXPczO2L/zcrgMgQ=;
 b=VaT0ouDG03AESSKtA0tZCljaB17Ky2Mk0IYo+wc9i33p9RyQbPiLe4b/8aiVMngPI9hVUR
 r+p27U9Eqtnbdw+6Ttc2DLu2xJao5eN1dH6Gb0bccRBL+lUGIVUpjjD0Z6L3V+YqpKseYt
 WdKXSdM8wu3P7yFjgwVEmj8mlY4MNkY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-554-fUIveLi6O8O94Df6LJZB1Q-1; Fri, 28 Jan 2022 12:50:32 -0500
X-MC-Unique: fUIveLi6O8O94Df6LJZB1Q-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B04EA343C9;
 Fri, 28 Jan 2022 17:50:31 +0000 (UTC)
Received: from redhat.com (unknown [10.33.37.9])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id CDAAA74EAD;
 Fri, 28 Jan 2022 17:50:20 +0000 (UTC)
Date: Fri, 28 Jan 2022 17:50:18 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>
Subject: Re: [PATCH] block/curl.c: Check error return from curl_easy_setopt()
Message-ID: <YfQs2qIew5UR6MCk@redhat.com>
References: <20220128165535.2550899-1-peter.maydell@linaro.org>
MIME-Version: 1.0
In-Reply-To: <20220128165535.2550899-1-peter.maydell@linaro.org>
User-Agent: Mutt/2.1.5 (2021-12-30)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) DKIMWL_WL_HIGH=-0.167, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001,
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
Cc: Kevin Wolf <kwolf@redhat.com>, Hanna Reitz <hreitz@redhat.com>,
 qemu-devel@nongnu.org, qemu-block@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, Jan 28, 2022 at 04:55:35PM +0000, Peter Maydell wrote:
> Coverity points out that we aren't checking the return value
> from curl_easy_setopt() for any of the calls to it we make
> in block/curl.c.
> 
> Fixes: Coverity CID 1459336, 1459482, 1460331
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
> Big fat disclaimer: tested only with 'make check', which I suspect
> may not be exercising this block backend. Hints on how to test
> more thoroughly are welcome.

yeah afaik, qemu-iotests don't have support for this. As a very
basic smoke test do

$ qemu-img info https://cloud.debian.org/images/cloud/buster/daily/latest/debian-10-nocloud-amd64-daily.qcow2
image: https://cloud.debian.org/images/cloud/buster/daily/latest/debian-10-nocloud-amd64-daily.qcow2
file format: qcow2
virtual size: 2 GiB (2147483648 bytes)
disk size: unavailable
cluster_size: 65536
Format specific information:
    compat: 1.1
    compression type: zlib
    lazy refcounts: false
    refcount bits: 16
    corrupt: false
    extended l2: false

and/or

$ qemu-img info --image-opts driver=qcow2,file.driver=https,file.url=https://cloud.debian.org/images/cloud/buster/daily/latest/debian-10-nocloud-amd64-daily.qcow2
image: https://cloud.debian.org/images/cloud/buster/daily/latest/debian-10-nocloud-amd64-daily.qcow2
file format: qcow2
virtual size: 2 GiB (2147483648 bytes)
disk size: unavailable
cluster_size: 65536
Format specific information:
    compat: 1.1
    compression type: zlib
    lazy refcounts: false
    refcount bits: 16
    corrupt: false
    extended l2: false


> 
>  block/curl.c | 90 +++++++++++++++++++++++++++++++++-------------------
>  1 file changed, 58 insertions(+), 32 deletions(-)
> 
> diff --git a/block/curl.c b/block/curl.c
> index 6a6cd729758..aaee1b17bef 100644
> --- a/block/curl.c
> +++ b/block/curl.c
> @@ -458,38 +458,51 @@ static int curl_init_state(BDRVCURLState *s, CURLState *state)
>          if (!state->curl) {
>              return -EIO;
>          }
> -        curl_easy_setopt(state->curl, CURLOPT_URL, s->url);
> -        curl_easy_setopt(state->curl, CURLOPT_SSL_VERIFYPEER,
> -                         (long) s->sslverify);
> -        curl_easy_setopt(state->curl, CURLOPT_SSL_VERIFYHOST,
> -                         s->sslverify ? 2L : 0L);
> -        if (s->cookie) {
> -            curl_easy_setopt(state->curl, CURLOPT_COOKIE, s->cookie);
> +        if (curl_easy_setopt(state->curl, CURLOPT_URL, s->url) ||
> +            curl_easy_setopt(state->curl, CURLOPT_SSL_VERIFYPEER,
> +                             (long) s->sslverify) ||
> +            curl_easy_setopt(state->curl, CURLOPT_SSL_VERIFYHOST,
> +                             s->sslverify ? 2L : 0L)) {
> +            goto err;
> +        }
> +        if (s->cookie) {
> +            if (curl_easy_setopt(state->curl, CURLOPT_COOKIE, s->cookie)) {
> +                goto err;
> +            }
> +        }
> +        if (curl_easy_setopt(state->curl, CURLOPT_TIMEOUT, (long)s->timeout) ||
> +            curl_easy_setopt(state->curl, CURLOPT_WRITEFUNCTION,
> +                             (void *)curl_read_cb) ||
> +            curl_easy_setopt(state->curl, CURLOPT_WRITEDATA, (void *)state) ||
> +            curl_easy_setopt(state->curl, CURLOPT_PRIVATE, (void *)state) ||
> +            curl_easy_setopt(state->curl, CURLOPT_AUTOREFERER, 1) ||
> +            curl_easy_setopt(state->curl, CURLOPT_FOLLOWLOCATION, 1) ||
> +            curl_easy_setopt(state->curl, CURLOPT_NOSIGNAL, 1) ||
> +            curl_easy_setopt(state->curl, CURLOPT_ERRORBUFFER, state->errmsg) ||
> +            curl_easy_setopt(state->curl, CURLOPT_FAILONERROR, 1)) {
> +            goto err;
>          }
> -        curl_easy_setopt(state->curl, CURLOPT_TIMEOUT, (long)s->timeout);
> -        curl_easy_setopt(state->curl, CURLOPT_WRITEFUNCTION,
> -                         (void *)curl_read_cb);
> -        curl_easy_setopt(state->curl, CURLOPT_WRITEDATA, (void *)state);
> -        curl_easy_setopt(state->curl, CURLOPT_PRIVATE, (void *)state);
> -        curl_easy_setopt(state->curl, CURLOPT_AUTOREFERER, 1);
> -        curl_easy_setopt(state->curl, CURLOPT_FOLLOWLOCATION, 1);
> -        curl_easy_setopt(state->curl, CURLOPT_NOSIGNAL, 1);
> -        curl_easy_setopt(state->curl, CURLOPT_ERRORBUFFER, state->errmsg);
> -        curl_easy_setopt(state->curl, CURLOPT_FAILONERROR, 1);
> -
>          if (s->username) {
> -            curl_easy_setopt(state->curl, CURLOPT_USERNAME, s->username);
> +            if (curl_easy_setopt(state->curl, CURLOPT_USERNAME, s->username)) {
> +                goto err;
> +            }
>          }
>          if (s->password) {
> -            curl_easy_setopt(state->curl, CURLOPT_PASSWORD, s->password);
> +            if (curl_easy_setopt(state->curl, CURLOPT_PASSWORD, s->password)) {
> +                goto err;
> +            }
>          }
>          if (s->proxyusername) {
> -            curl_easy_setopt(state->curl,
> -                             CURLOPT_PROXYUSERNAME, s->proxyusername);
> +            if (curl_easy_setopt(state->curl,
> +                                 CURLOPT_PROXYUSERNAME, s->proxyusername)) {
> +                goto err;
> +            }
>          }
>          if (s->proxypassword) {
> -            curl_easy_setopt(state->curl,
> -                             CURLOPT_PROXYPASSWORD, s->proxypassword);
> +            if (curl_easy_setopt(state->curl,
> +                                 CURLOPT_PROXYPASSWORD, s->proxypassword)) {
> +                goto err;
> +            }
>          }
>  
>          /* Restrict supported protocols to avoid security issues in the more
> @@ -499,18 +512,27 @@ static int curl_init_state(BDRVCURLState *s, CURLState *state)
>           * Restricting protocols is only supported from 7.19.4 upwards.
>           */
>  #if LIBCURL_VERSION_NUM >= 0x071304
> -        curl_easy_setopt(state->curl, CURLOPT_PROTOCOLS, PROTOCOLS);
> -        curl_easy_setopt(state->curl, CURLOPT_REDIR_PROTOCOLS, PROTOCOLS);
> +        if (curl_easy_setopt(state->curl, CURLOPT_PROTOCOLS, PROTOCOLS) ||
> +            curl_easy_setopt(state->curl, CURLOPT_REDIR_PROTOCOLS, PROTOCOLS)) {
> +            goto err;
> +        }
>  #endif
>  
>  #ifdef DEBUG_VERBOSE
> -        curl_easy_setopt(state->curl, CURLOPT_VERBOSE, 1);
> +        if (curl_easy_setopt(state->curl, CURLOPT_VERBOSE, 1)) {
> +            goto err;
> +        }
>  #endif
>      }
>  
>      state->s = s;
>  
>      return 0;
> +
> +err:
> +    curl_easy_cleanup(state->curl);
> +    state->curl = NULL;
> +    return -EIO;
>  }
>  
>  /* Called with s->mutex held.  */
> @@ -763,10 +785,11 @@ static int curl_open(BlockDriverState *bs, QDict *options, int flags,
>      }
>  
>      s->accept_range = false;
> -    curl_easy_setopt(state->curl, CURLOPT_NOBODY, 1);
> -    curl_easy_setopt(state->curl, CURLOPT_HEADERFUNCTION,
> -                     curl_header_cb);
> -    curl_easy_setopt(state->curl, CURLOPT_HEADERDATA, s);
> +    if (curl_easy_setopt(state->curl, CURLOPT_NOBODY, 1) ||
> +        curl_easy_setopt(state->curl, CURLOPT_HEADERFUNCTION, curl_header_cb) ||
> +        curl_easy_setopt(state->curl, CURLOPT_HEADERDATA, s)) {
> +        goto out;
> +    }
>      if (curl_easy_perform(state->curl))
>          goto out;
>      if (curl_easy_getinfo(state->curl, CURLINFO_CONTENT_LENGTH_DOWNLOAD, &d)) {
> @@ -879,7 +902,10 @@ static void curl_setup_preadv(BlockDriverState *bs, CURLAIOCB *acb)
>  
>      snprintf(state->range, 127, "%" PRIu64 "-%" PRIu64, start, end);
>      trace_curl_setup_preadv(acb->bytes, start, state->range);
> -    curl_easy_setopt(state->curl, CURLOPT_RANGE, state->range);
> +    if (curl_easy_setopt(state->curl, CURLOPT_RANGE, state->range)) {
> +        curl_clean_state(state);
> +        goto out;
> +    }
>  
>      if (curl_multi_add_handle(s->multi, state->curl) != CURLM_OK) {
>          state->acb[0] = NULL;
> -- 
> 2.25.1
> 
> 

Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


