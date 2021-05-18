Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BB883878FB
	for <lists+qemu-devel@lfdr.de>; Tue, 18 May 2021 14:39:46 +0200 (CEST)
Received: from localhost ([::1]:57424 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1liz0j-0001Te-8u
	for lists+qemu-devel@lfdr.de; Tue, 18 May 2021 08:39:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48188)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1liysR-0001F2-L9
 for qemu-devel@nongnu.org; Tue, 18 May 2021 08:31:11 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:21451)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1liysP-00075B-QO
 for qemu-devel@nongnu.org; Tue, 18 May 2021 08:31:11 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1621341068;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=6qu5LCbrfgXwgK43LhTSJnjgO7E9nGgP7sZgNbzhpqk=;
 b=RArR1uFS4LD7JG0DhtNj5fFtpMFMoyvOmm9wZAbHcsLUhnKqTk5jv4pBt1t5V9IO3fBttr
 LEdbKvTWpbLW8Gk2GWvwSuR5JjQhbMLXu+dj9KP7+XBaR7U3UWvBsNn1RqK7nATrUdwhc8
 MLOeX59WY6f7Mvao4a8C3VnVzOcqZD0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-343-JHeGaat9MYS0C9CtttIThg-1; Tue, 18 May 2021 08:31:06 -0400
X-MC-Unique: JHeGaat9MYS0C9CtttIThg-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 766596D249
 for <qemu-devel@nongnu.org>; Tue, 18 May 2021 12:31:05 +0000 (UTC)
Received: from work-vm (ovpn-115-45.ams2.redhat.com [10.36.115.45])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 89B005D9C0;
 Tue, 18 May 2021 12:31:04 +0000 (UTC)
Date: Tue, 18 May 2021 13:31:02 +0100
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: Vivek Goyal <vgoyal@redhat.com>
Subject: Re: [PATCH 6/7] virtiofsd: Check EOF before short read
Message-ID: <YKOzhol+5jCuZBKn@work-vm>
References: <20210511213736.281016-1-vgoyal@redhat.com>
 <20210511213736.281016-7-vgoyal@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210511213736.281016-7-vgoyal@redhat.com>
User-Agent: Mutt/2.0.7 (2021-05-04)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dgilbert@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=dgilbert@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.374,
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
> In virtio_send_data_iov() we are checking first for short read and then
> EOF condition. Change the order. Basically check for error and EOF first
> and last remaining piece is short ready which will lead to retry
> automatically at the end of while loop.
> 
> Just that it is little simpler to read to the code. There is no need
> to call "continue" and also one less call of "len-=ret".
> 
> Signed-off-by: Vivek Goyal <vgoyal@redhat.com>

Reviewed-by: Dr. David Alan Gilbert <dgilbert@redhat.com>

> ---
>  tools/virtiofsd/fuse_virtio.c | 21 ++++++++++-----------
>  1 file changed, 10 insertions(+), 11 deletions(-)
> 
> diff --git a/tools/virtiofsd/fuse_virtio.c b/tools/virtiofsd/fuse_virtio.c
> index 434fe401cf..aa53808ef9 100644
> --- a/tools/virtiofsd/fuse_virtio.c
> +++ b/tools/virtiofsd/fuse_virtio.c
> @@ -410,25 +410,24 @@ int virtio_send_data_iov(struct fuse_session *se, struct fuse_chan *ch,
>                       __func__, len);
>              goto err;
>          }
> -        fuse_log(FUSE_LOG_DEBUG, "%s: preadv ret=%d len=%zd\n", __func__,
> -                 ret, len);
> -        if (ret < len && ret) {
> -            fuse_log(FUSE_LOG_DEBUG, "%s: ret < len\n", __func__);
> -            /* Skip over this much next time around */
> -            iov_discard_front(&in_sg_ptr, &in_sg_cpy_count, ret);
> -            buf->buf[0].pos += ret;
> -            len -= ret;
>  
> -            /* Lets do another read */
> -            continue;
> -        }
>          if (!ret) {
>              /* EOF case? */
>              fuse_log(FUSE_LOG_DEBUG, "%s: !ret len remaining=%zd\n", __func__,
>                       len);
>              break;
>          }
> +        fuse_log(FUSE_LOG_DEBUG, "%s: preadv ret=%d len=%zd\n", __func__,
> +                 ret, len);
> +
>          len -= ret;
> +        /* Short read. Retry reading remaining bytes */
> +        if (len) {
> +            fuse_log(FUSE_LOG_DEBUG, "%s: ret < len\n", __func__);
> +            /* Skip over this much next time around */
> +            iov_discard_front(&in_sg_ptr, &in_sg_cpy_count, ret);
> +            buf->buf[0].pos += ret;
> +        }
>      } while (len);
>  
>      /* Need to fix out->len on EOF */
> -- 
> 2.25.4
> 
-- 
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK


