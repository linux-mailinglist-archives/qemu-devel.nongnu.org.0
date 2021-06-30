Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D51B3B875C
	for <lists+qemu-devel@lfdr.de>; Wed, 30 Jun 2021 19:04:58 +0200 (CEST)
Received: from localhost ([::1]:36662 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lyddw-0005Lb-UD
	for lists+qemu-devel@lfdr.de; Wed, 30 Jun 2021 13:04:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57328)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1lydbx-00043I-Oz
 for qemu-devel@nongnu.org; Wed, 30 Jun 2021 13:02:54 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:33735)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1lydbu-0002bj-F6
 for qemu-devel@nongnu.org; Wed, 30 Jun 2021 13:02:53 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1625072569;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=db2F93foCez317GPstWYHgqfYhg7NU7tVgZ6tqxkVZw=;
 b=gXVLmKzld/2m9fhqQLaKGWIVD7uRS1DOOQFOLFxKQ1WZU5PosdKXc/fS4qeASo/U5s/fNn
 kF3uUhBk27h07epEK1NZbbepVcH8JdFCwPxkuZcelM4syixmRRoQ5WkFVLyePzhJUiZV6S
 lZv5ooPUVeEEeAXxCk3h0UPdxvIzMOU=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-539-QqDESt_KOqu1OeGNdrgttg-1; Wed, 30 Jun 2021 13:02:46 -0400
X-MC-Unique: QqDESt_KOqu1OeGNdrgttg-1
Received: by mail-wr1-f69.google.com with SMTP id
 e13-20020a5d530d0000b0290126d989c76eso1201130wrv.18
 for <qemu-devel@nongnu.org>; Wed, 30 Jun 2021 10:02:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=db2F93foCez317GPstWYHgqfYhg7NU7tVgZ6tqxkVZw=;
 b=TWsgtbjd7/TdLZ5qHSvJeg2YcJgK2LtAb6smTE0ZFxf6qfqaSo5ZrALAkdVGNplZvZ
 KoopUp+PJdItxXkWpCD3+v7UdsOgW5pAG5w4qEHbNw8oU9fEmm7b2ZVh+5ESuvs6c7ov
 2SjreDNPSP4oPMLwrTAExpAwjLbFvL1easRvWURIestlZlgM+oQ6M2PvtULvyuh7kmfF
 aOH+TgbIK1oN8iqmkYrJgg74lKPYtOhz0EI8uq9YhDyAZb6lT+A7qcJXYJa2dsktarDm
 qizQVkHq/CC9DlRSlGrTaFm+qauOE3TQ0qzbkxDYn9cfdy1JjXXoSTfHN8Ubs97VbP9e
 pgyw==
X-Gm-Message-State: AOAM533h8lwGyfwJ+vjhPDuqvKtAa6KAeLNyPls+6a9DP+VTt/vW+QxJ
 aVGmYfwBUA2WiNV7hWG4ZHWJl3xFJsF9wmytLI4KlLd4z6GTTtrLWSAbzyJ2KOr22Dpvb+Libuh
 QrZHSDKLrt74fDmU=
X-Received: by 2002:a05:600c:3399:: with SMTP id
 o25mr40109046wmp.115.1625072565435; 
 Wed, 30 Jun 2021 10:02:45 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzeVAdumAr5ENMTjH3V1BoOnh4pv/g8CRFmkRYxlC6fQvQam8GLfZ6+tJhsSWxczuHKXFv6ZA==
X-Received: by 2002:a05:600c:3399:: with SMTP id
 o25mr40109032wmp.115.1625072565306; 
 Wed, 30 Jun 2021 10:02:45 -0700 (PDT)
Received: from work-vm (cpc109021-salf6-2-0-cust453.10-2.cable.virginm.net.
 [82.29.237.198])
 by smtp.gmail.com with ESMTPSA id z8sm23542589wrw.18.2021.06.30.10.02.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 30 Jun 2021 10:02:44 -0700 (PDT)
Date: Wed, 30 Jun 2021 18:02:42 +0100
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: Lin Feng <linfeng23@huawei.com>
Subject: Re: [v4] migration: fix the memory overwriting risk in add_to_iovec
Message-ID: <YNyjsmZU2gRGe0K3@work-vm>
References: <20210623015104.218-1-linfeng23@huawei.com>
 <20210625062138.1899-1-linfeng23@huawei.com>
MIME-Version: 1.0
In-Reply-To: <20210625062138.1899-1-linfeng23@huawei.com>
User-Agent: Mutt/2.0.7 (2021-05-04)
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
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.435,
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

Queued
> ---
>  migration/qemu-file.c | 5 +++++
>  1 file changed, 5 insertions(+)
> 
> diff --git a/migration/qemu-file.c b/migration/qemu-file.c
> index d6e03dbc0e..6879615197 100644
> --- a/migration/qemu-file.c
> +++ b/migration/qemu-file.c
> @@ -416,6 +416,11 @@ static int add_to_iovec(QEMUFile *f, const uint8_t *buf, size_t size,
>      {
>          f->iov[f->iovcnt - 1].iov_len += size;
>      } else {
> +        if (f->iovcnt >= MAX_IOV_SIZE) {
> +            /* Should only happen if a previous fflush failed */
> +            assert(f->shutdown || !qemu_file_is_writeable(f));
> +            return 1;
> +        }
>          if (may_free) {
>              set_bit(f->iovcnt, f->may_free);
>          }
> -- 
> 2.23.0
> 
> 
-- 
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK


