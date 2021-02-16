Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C0B3A31CFB7
	for <lists+qemu-devel@lfdr.de>; Tue, 16 Feb 2021 18:57:45 +0100 (CET)
Received: from localhost ([::1]:50370 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lC4bX-0005nj-Fm
	for lists+qemu-devel@lfdr.de; Tue, 16 Feb 2021 12:57:44 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:52926)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1lC4ZW-0004uf-EG
 for qemu-devel@nongnu.org; Tue, 16 Feb 2021 12:55:38 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:32484)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1lC4ZU-0003a2-Ua
 for qemu-devel@nongnu.org; Tue, 16 Feb 2021 12:55:38 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1613498136;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=jYG1pogPeorXiNbGkjpg4X6ddLmVfeeGhcxb8D4tEcY=;
 b=P87/FYNw3iuQYC5gmE0ct8Y2OHuOZpAMFkZ7bK7ZcM8NE2M31YwrxQvy94CpTdgaLEdBw4
 E6nQcSrdOunlLXAzXmU48qVbd9qMUbNhIlLE84g8yTdZX8wF7Vam4trkYk77hWGVAvZTWf
 T276Bz5WVqq+kOn7k3+9vcYRkCoaKd4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-472-hYmhFWk8P4mz0GiWVQLHRA-1; Tue, 16 Feb 2021 12:55:34 -0500
X-MC-Unique: hYmhFWk8P4mz0GiWVQLHRA-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 523368799F1
 for <qemu-devel@nongnu.org>; Tue, 16 Feb 2021 17:55:33 +0000 (UTC)
Received: from work-vm (ovpn-115-109.ams2.redhat.com [10.36.115.109])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 7726360C15;
 Tue, 16 Feb 2021 17:55:29 +0000 (UTC)
Date: Tue, 16 Feb 2021 17:55:26 +0000
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: Vivek Goyal <vgoyal@redhat.com>
Subject: Re: [Virtio-fs] [PATCH 1/1] virtiofsd: Do not use a thread pool by
 default
Message-ID: <YCwHDvMDDYMy+4de@work-vm>
References: <20210210182744.27324-1-vgoyal@redhat.com>
 <20210210182744.27324-2-vgoyal@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210210182744.27324-2-vgoyal@redhat.com>
User-Agent: Mutt/2.0.5 (2021-01-21)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dgilbert@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=63.128.21.124; envelope-from=dgilbert@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: virtio-fs@redhat.com, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

* Vivek Goyal (vgoyal@redhat.com) wrote:
> Currently we created a thread pool (With 64 max threads per pool) for
> each virtqueue. We hoped that this will provide us with better scalability
> and performance.
> 
> But in practice, we are getting better numbers in most of the cases
> when we don't create a thread pool at all and a single thread per
> virtqueue receives the request and processes it.
> 
> Hence, I am proposing that we switch to no thread pool by default
> (equivalent of --thread-pool-size=0). This will provide out of
> box better performance to most of the users. In fact other users
> have confirmed that not using a thread pool gives them better
> numbers. So why not use this as default. It can be changed when
> somebody can fix the issues with thread pool performance.
> 
> Signed-off-by: Vivek Goyal <vgoyal@redhat.com>

OK, lets try it - I still worry it really means we're missing something
silly about them, you'd really think eventually the threads should help.



Reviewed-by: Dr. David Alan Gilbert <dgilbert@redhat.com>

> ---
>  tools/virtiofsd/fuse_lowlevel.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/tools/virtiofsd/fuse_lowlevel.c b/tools/virtiofsd/fuse_lowlevel.c
> index e94b71110b..fbdf62ee9b 100644
> --- a/tools/virtiofsd/fuse_lowlevel.c
> +++ b/tools/virtiofsd/fuse_lowlevel.c
> @@ -18,7 +18,7 @@
>  
>  #include <sys/file.h>
>  
> -#define THREAD_POOL_SIZE 64
> +#define THREAD_POOL_SIZE 0
>  
>  #define OFFSET_MAX 0x7fffffffffffffffLL
>  
> -- 
> 2.25.4
-- 
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK


