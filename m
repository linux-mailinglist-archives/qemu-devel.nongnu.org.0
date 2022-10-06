Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F28D5F6379
	for <lists+qemu-devel@lfdr.de>; Thu,  6 Oct 2022 11:19:56 +0200 (CEST)
Received: from localhost ([::1]:40050 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ogN2o-0004yu-Nx
	for lists+qemu-devel@lfdr.de; Thu, 06 Oct 2022 05:19:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39250)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1ogMI7-0004y3-FK
 for qemu-devel@nongnu.org; Thu, 06 Oct 2022 04:31:39 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:24085)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1ogMI4-0005mC-3L
 for qemu-devel@nongnu.org; Thu, 06 Oct 2022 04:31:37 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1665045095;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=1bholUNSPeHiYSLp4KyA7krIRbgpt/9QXS9n2TGiGgw=;
 b=bJyfdY08VSO2+vPEMAz/DPEFoTQkF9/WHum98LCIhok+XEauad3AllTD1IzslNqWK1MJX5
 8H+LclfwQk5obAQMsjptZqQihTLnJRrusMcMtMWVqgJEMQQ1ejPTgSDpYWRKYpx+/bu9R3
 5pQg6xE0+POtQuHCXoNiPzzCr+shIJs=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-576-ndbchlNKORSrtyth9REduw-1; Thu, 06 Oct 2022 04:31:34 -0400
X-MC-Unique: ndbchlNKORSrtyth9REduw-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 7A95F800186
 for <qemu-devel@nongnu.org>; Thu,  6 Oct 2022 08:31:33 +0000 (UTC)
Received: from redhat.com (unknown [10.33.36.96])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id E91ACC15BA4;
 Thu,  6 Oct 2022 08:31:32 +0000 (UTC)
Date: Thu, 6 Oct 2022 09:31:30 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: marcandre.lureau@redhat.com
Cc: qemu-devel@nongnu.org
Subject: Re: [PATCH v3 1/5] osdep: make readv_writev() work with partial
 read/write
Message-ID: <Yz6SYuq3nplb61/a@redhat.com>
References: <20221006081222.2606746-1-marcandre.lureau@redhat.com>
 <20221006081222.2606746-2-marcandre.lureau@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20221006081222.2606746-2-marcandre.lureau@redhat.com>
User-Agent: Mutt/2.2.7 (2022-08-07)
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.8
Received-SPF: pass client-ip=170.10.133.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
Reply-To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Oct 06, 2022 at 12:12:18PM +0400, marcandre.lureau@redhat.com wrote:
> From: Marc-André Lureau <marcandre.lureau@redhat.com>
> 
> With a pipe or other reasons, read/write may return less than the
> requested bytes. This happens with the test-io-channel-command test on
> Windows. glib spawn code uses a binary pipe of 4096 bytes, and the first
> read returns that much (although more are requested), for some unclear
> reason...

Wow, lucky this function isn't too widely used historically!

> 
> Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
> ---
>  util/osdep.c | 10 ++++++++--
>  1 file changed, 8 insertions(+), 2 deletions(-)

Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>

> 
> diff --git a/util/osdep.c b/util/osdep.c
> index 60fcbbaebe..b85715a743 100644
> --- a/util/osdep.c
> +++ b/util/osdep.c

There's a comment just above here that says

   helper function for iov_send_recv

which is not true, as iov_send_recv just calls send/recv instead,
again in a loop with the exact same logic flaw.  Care to fix the
comment and also fix iov_send_recv in the same way ?

> @@ -544,12 +544,17 @@ readv_writev(int fd, const struct iovec *iov, int iov_cnt, bool do_write)
>  {
>      unsigned i = 0;
>      ssize_t ret = 0;
> +    ssize_t off = 0;
>      while (i < iov_cnt) {
>          ssize_t r = do_write
> -            ? write(fd, iov[i].iov_base, iov[i].iov_len)
> -            : read(fd, iov[i].iov_base, iov[i].iov_len);
> +            ? write(fd, iov[i].iov_base + off, iov[i].iov_len - off)
> +            : read(fd, iov[i].iov_base + off, iov[i].iov_len - off);
>          if (r > 0) {
>              ret += r;
> +            off += r;
> +            if (off < iov[i].iov_len) {
> +                continue;
> +            }
>          } else if (!r) {
>              break;
>          } else if (errno == EINTR) {
> @@ -562,6 +567,7 @@ readv_writev(int fd, const struct iovec *iov, int iov_cnt, bool do_write)
>              }
>              break;
>          }
> +        off = 0;
>          i++;
>      }
>      return ret;
> -- 
> 2.37.3
> 

With regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


