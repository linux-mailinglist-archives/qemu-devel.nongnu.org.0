Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3489F3B3698
	for <lists+qemu-devel@lfdr.de>; Thu, 24 Jun 2021 21:04:41 +0200 (CEST)
Received: from localhost ([::1]:45940 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lwUeV-0002Xu-T3
	for lists+qemu-devel@lfdr.de; Thu, 24 Jun 2021 15:04:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35178)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1lwUYq-00060l-8A
 for qemu-devel@nongnu.org; Thu, 24 Jun 2021 14:58:48 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:21815)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1lwUYo-00082l-3m
 for qemu-devel@nongnu.org; Thu, 24 Jun 2021 14:58:47 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1624561124;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Y8sZWiYiiFWi8EF6H/1gyeITzOYpfgeIjA3mZEUW6MY=;
 b=gvoB6UekIU/iTWukM1LhPA9ab7d570zcW28/l8irBth3pFnoivU3WnxR3Gn6UFV96oaR9E
 5wxeR17P4QoEVxVtS4zPOrqdf11VL1Ng9I0uaG65zcWd9LIncSd8ovgyS/+GrvQpKPammh
 DNDAV+TzNgkb2YhJs1UQ0794urR1bws=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-486-N0UamuvRPGGtBO_ZzXj2RQ-1; Thu, 24 Jun 2021 14:58:43 -0400
X-MC-Unique: N0UamuvRPGGtBO_ZzXj2RQ-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 5DF7F100CEC9;
 Thu, 24 Jun 2021 18:58:42 +0000 (UTC)
Received: from work-vm (ovpn-114-255.ams2.redhat.com [10.36.114.255])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 5C5B05D9F0;
 Thu, 24 Jun 2021 18:58:41 +0000 (UTC)
Date: Thu, 24 Jun 2021 19:58:38 +0100
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: Lin Feng <linfeng23@huawei.com>
Subject: Re: [v3] migration: fix the memory overwriting risk in add_to_iovec
Message-ID: <YNTV3lpfl4R8JQBi@work-vm>
References: <20210622111549.490-1-linfeng23@huawei.com>
 <20210623015104.218-1-linfeng23@huawei.com>
MIME-Version: 1.0
In-Reply-To: <20210623015104.218-1-linfeng23@huawei.com>
User-Agent: Mutt/2.0.7 (2021-05-04)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dgilbert@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=dgilbert@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.362,
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
Cc: wangxinxin.wang@huawei.com, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

* Lin Feng (linfeng23@huawei.com) wrote:
> From: Feng Lin <linfeng23@huawei.com>
> 
> When testing migration, a Segmentation fault qemu core is generated.
> 0  error_free (err=0x1)
> 1  0x00007f8b862df647 in qemu_fclose (f=f@entry=0x55e06c247640)
> 2  0x00007f8b8516d59a in migrate_fd_cleanup (s=s@entry=0x55e06c0e1ef0)
> 3  0x00007f8b8516d66c in migrate_fd_cleanup_bh (opaque=0x55e06c0e1ef0)
> 4  0x00007f8b8626a47f in aio_bh_poll (ctx=ctx@entry=0x55e06b5a16d0)
> 5  0x00007f8b8626e71f in aio_dispatch (ctx=0x55e06b5a16d0)
> 6  0x00007f8b8626a33d in aio_ctx_dispatch (source=<optimized out>, callback=<optimized out>, user_data=<optimized out>)
> 7  0x00007f8b866bdba4 in g_main_context_dispatch ()
> 8  0x00007f8b8626cde9 in glib_pollfds_poll ()
> 9  0x00007f8b8626ce62 in os_host_main_loop_wait (timeout=<optimized out>)
> 10 0x00007f8b8626cffd in main_loop_wait (nonblocking=nonblocking@entry=0)
> 11 0x00007f8b862ef01f in main_loop ()
> Using gdb print the struct QEMUFile f = {
>   ...,
>   iovcnt = 65, last_error = 21984,
>   last_error_obj = 0x1, shutdown = true
> }
> Well iovcnt is overflow, because the max size of MAX_IOV_SIZE is 64.
> struct QEMUFile {
>     ...;
>     struct iovec iov[MAX_IOV_SIZE];
>     unsigned int iovcnt;
>     int last_error;
>     Error *last_error_obj;
>     bool shutdown;
> };
> iovcnt and last_error is overwrited by add_to_iovec().
> Right now, add_to_iovec() increase iovcnt before check the limit.
> And it seems that add_to_iovec() assumes that iovcnt will set to zero
> in qemu_fflush(). But qemu_fflush() will directly return when f->shutdown
> is true.
> 
> The situation may occur when libvirtd restart during migration, after
> f->shutdown is set, before calling qemu_file_set_error() in
> qemu_file_shutdown().
> 
> So the safiest way is checking the iovcnt before increasing it.
> 
> Signed-off-by: Feng Lin <linfeng23@huawei.com>
> ---
>  migration/qemu-file.c | 13 ++++++++-----
>  1 file changed, 8 insertions(+), 5 deletions(-)
> 
> diff --git a/migration/qemu-file.c b/migration/qemu-file.c
> index d6e03dbc0e..f6486cf7bc 100644
> --- a/migration/qemu-file.c
> +++ b/migration/qemu-file.c
> @@ -416,6 +416,9 @@ static int add_to_iovec(QEMUFile *f, const uint8_t *buf, size_t size,
>      {
>          f->iov[f->iovcnt - 1].iov_len += size;
>      } else {
> +        if (f->iovcnt >= MAX_IOV_SIZE) {
> +            goto fflush;
> +        }

Why call qemu_fflush in this case?
If I understand what you're saying, then we only get to here if a
previous qemu_fflush has failed, so this should fail as well?

How about, something like:
    if (f->iovcnt >= MAX_IOV_SIZE) {
        /* Should only happen if a previous fflush failed */
        assert(f->shutdown || !qemu_file_is_writeable(f));
        return 1;
    }

?

Dave

>          if (may_free) {
>              set_bit(f->iovcnt, f->may_free);
>          }
> @@ -423,12 +426,12 @@ static int add_to_iovec(QEMUFile *f, const uint8_t *buf, size_t size,
>          f->iov[f->iovcnt++].iov_len = size;
>      }
>  
> -    if (f->iovcnt >= MAX_IOV_SIZE) {
> -        qemu_fflush(f);
> -        return 1;
> +    if (f->iovcnt < MAX_IOV_SIZE) {
> +        return 0;
>      }
> -
> -    return 0;
> +fflush:
> +    qemu_fflush(f);
> +    return 1;
>  }
>  
>  static void add_buf_to_iovec(QEMUFile *f, size_t len)
> -- 
> 2.23.0
> 
-- 
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK


