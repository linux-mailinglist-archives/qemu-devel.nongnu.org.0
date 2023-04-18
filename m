Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EE4776E5CA8
	for <lists+qemu-devel@lfdr.de>; Tue, 18 Apr 2023 10:56:04 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1poh7u-0002kL-Jv; Tue, 18 Apr 2023 04:55:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1poh7s-0002jC-BX
 for qemu-devel@nongnu.org; Tue, 18 Apr 2023 04:55:48 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1poh7q-0003xk-Mi
 for qemu-devel@nongnu.org; Tue, 18 Apr 2023 04:55:48 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1681808144;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=Fax/XzDKkCw9nqBNDOZ0a6KOQzd1j5upHyzEU4KFFlw=;
 b=gG38PsI2Bv+pwoIwOGMa3bvs2pt9ZgQsIkkvftwazz2PPqBKmI8h7uNr1rVfV7H4fdpkGE
 7sa8PNw5cbtsvzuPp4/GCxKR5qXur4BtZZfYQdGNQP5o3EuTtNRgvi5QU9vEoiUYYYMRfD
 0pvzI/M1oQhQ/yFo2+w8mMHXZq4l74A=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-222-7ejcou7CMGCLUGqLtRP1ig-1; Tue, 18 Apr 2023 04:55:37 -0400
X-MC-Unique: 7ejcou7CMGCLUGqLtRP1ig-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id C01EE280D583;
 Tue, 18 Apr 2023 08:55:36 +0000 (UTC)
Received: from redhat.com (unknown [10.42.28.65])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 254C340C6E6F;
 Tue, 18 Apr 2023 08:55:35 +0000 (UTC)
Date: Tue, 18 Apr 2023 09:55:34 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Bin Meng <bmeng@tinylab.org>
Cc: Jason Wang <jasowang@redhat.com>, qemu-devel@nongnu.org,
 Zhangjin Wu <falcon@tinylab.org>
Subject: Re: [PATCH] net: tap: Drop the close of fds for child process
Message-ID: <ZD5bBp4Liv4YZcnb@redhat.com>
References: <20230406112041.798585-1-bmeng@tinylab.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20230406112041.798585-1-bmeng@tinylab.org>
User-Agent: Mutt/2.2.9 (2022-11-12)
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.2
Received-SPF: pass client-ip=170.10.133.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Thu, Apr 06, 2023 at 07:20:41PM +0800, Bin Meng wrote:
> Current codes using a brute-force traversal of all file descriptors
> do not scale on a system where the maximum number of file descriptors
> are set to a very large value (e.g.: in a Docker container of Manjaro
> distribution it is set to 1073741816). QEMU just looks freezed during
> start-up.
> 
> The close-on-exec flag was introduced since a faily old Linux kernel
> (2.6.23). With recent newer kernels that QEMU supports, we don't need
> to manually close the fds for child process as the proper O_CLOEXEC
> flag should have been set properly on files that we don't want child
> process to see.

Even though O_CLOEXEC has existed for a long time, there is plenty
of code that doesn't use it reliably. While QEMU can control its
own code, we use a huge number of 3rd party libraries and we don't
trust them to reliably be using O_CLOEXEC on everything they open.

> Reported-by: Zhangjin Wu <falcon@tinylab.org>
> Signed-off-by: Bin Meng <bmeng@tinylab.org>
> ---
> 
>  net/tap.c | 14 --------------
>  1 file changed, 14 deletions(-)
> 
> diff --git a/net/tap.c b/net/tap.c
> index 1bf085d422..49e1915484 100644
> --- a/net/tap.c
> +++ b/net/tap.c
> @@ -446,13 +446,6 @@ static void launch_script(const char *setup_script, const char *ifname,
>          return;
>      }
>      if (pid == 0) {
> -        int open_max = sysconf(_SC_OPEN_MAX), i;
> -
> -        for (i = 3; i < open_max; i++) {
> -            if (i != fd) {
> -                close(i);
> -            }
> -        }
>          parg = args;
>          *parg++ = (char *)setup_script;
>          *parg++ = (char *)ifname;
> @@ -536,17 +529,10 @@ static int net_bridge_run_helper(const char *helper, const char *bridge,
>          return -1;
>      }
>      if (pid == 0) {
> -        int open_max = sysconf(_SC_OPEN_MAX), i;
>          char *fd_buf = NULL;
>          char *br_buf = NULL;
>          char *helper_cmd = NULL;
>  
> -        for (i = 3; i < open_max; i++) {
> -            if (i != sv[1]) {
> -                close(i);
> -            }
> -        }

BSD has closefrom(3) we could use here, while modern Linux has
close_range(3, open_max)

We should probe for those two funtions and use them preferentially,
only falling back to the current manual loop where they don't exist.


> -
>          fd_buf = g_strdup_printf("%s%d", "--fd=", sv[1]);
>  
>          if (strrchr(helper, ' ') || strrchr(helper, '\t')) {
> -- 
> 2.34.1
> 
> 

With regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


