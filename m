Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0744A3BB8FC
	for <lists+qemu-devel@lfdr.de>; Mon,  5 Jul 2021 10:21:16 +0200 (CEST)
Received: from localhost ([::1]:42004 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m0Jqt-0002f3-2N
	for lists+qemu-devel@lfdr.de; Mon, 05 Jul 2021 04:21:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42330)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1m0JpY-0008Cb-9O
 for qemu-devel@nongnu.org; Mon, 05 Jul 2021 04:19:52 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:23878)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1m0JpU-0006SO-A2
 for qemu-devel@nongnu.org; Mon, 05 Jul 2021 04:19:50 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1625473185;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=GtNAes7SgQo1JWEuDtoYmJd3LSmBPwvevqDtY0+H7VA=;
 b=d0JhZXuPXnEQx0TXgCCgTagS4YTX/sn5fUjxIvaFY1CRZmf+ukx3i60A76vPmlpleRIaxs
 R815Ba21d0kz1Gf4D+jn6kpAhPRlslbkq1wCjs/BCRs7UFe1eXXWJBfFexnwMNK3kSQBbN
 MsxC936rfzqIP2j6S3LMm/77eE+HIYs=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-438-LIuabwH8Om2PhbopQVYWlA-1; Mon, 05 Jul 2021 04:19:44 -0400
X-MC-Unique: LIuabwH8Om2PhbopQVYWlA-1
Received: by mail-wm1-f71.google.com with SMTP id
 13-20020a1c010d0000b02901eca51685daso9578360wmb.3
 for <qemu-devel@nongnu.org>; Mon, 05 Jul 2021 01:19:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=GtNAes7SgQo1JWEuDtoYmJd3LSmBPwvevqDtY0+H7VA=;
 b=U+v+4DlePuEHDUS1lGm5ZjPu3DJX4As7RK2gnCrXHW8jB3IKO3G0/TeGuGSYHdDsmz
 XjtWYDD/vr8qPxu7wstqQ7cyPFruX0qD80Gft4wHht3tCHPDjzfPUgXZie6/IAwawnxh
 UBwSo/LgmQbIV7rJ3soGXkXLUO6o0SpOd65RrxHMT2I4TNS/XV/LjSW5JcJREIDqHSIm
 KcR4nM7tcEQK4scMm+MCR3GSOWrD0gL8n+MBTBwrnrIPtMgjvRIeiaHEUWdeM9zD6tgj
 xreeFmg075nFju3hNKOrrXWLcdyeee3fPhFoW0WFww0o03Oer1MKjeN4zHZSkKe15gcX
 ZSpw==
X-Gm-Message-State: AOAM531MQy0FYZb6YBIp0u3UyvJ8q2PDX2mCiSE/H5VgkNYqErhFglTX
 tYVyYKb382QlWnqroO1rVkBzwUcX2cYxIB/Z7oij0plGH6YkgCgIbygfOEg/VtH3bhOE6wAUAXn
 aHDGqH3BeGZKvKS8=
X-Received: by 2002:a7b:c94b:: with SMTP id i11mr13830678wml.79.1625473182955; 
 Mon, 05 Jul 2021 01:19:42 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzk4VZyAtgKo3Todt4gNV1saN5na8oRiWPHAroEQxNdKZMoit07+Igd3Jk6DRThykRVYlvJxA==
X-Received: by 2002:a7b:c94b:: with SMTP id i11mr13830659wml.79.1625473182789; 
 Mon, 05 Jul 2021 01:19:42 -0700 (PDT)
Received: from work-vm (cpc109021-salf6-2-0-cust453.10-2.cable.virginm.net.
 [82.29.237.198])
 by smtp.gmail.com with ESMTPSA id g125sm14169069wmg.27.2021.07.05.01.19.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 05 Jul 2021 01:19:42 -0700 (PDT)
Date: Mon, 5 Jul 2021 09:19:40 +0100
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: "linfeng (M)" <linfeng23@huawei.com>
Subject: Re: [v4] migration: fix the memory overwriting risk in add_to_iovec
Message-ID: <YOLAnGzQBICY9UyB@work-vm>
References: <20210623015104.218-1-linfeng23@huawei.com>
 <20210625062138.1899-1-linfeng23@huawei.com>
 <YNyjsmZU2gRGe0K3@work-vm> <YN2llAABbktuLCUu@work-vm>
 <5f1fb1932dd84d42afba844346b6594a@huawei.com>
MIME-Version: 1.0
In-Reply-To: <5f1fb1932dd84d42afba844346b6594a@huawei.com>
User-Agent: Mutt/2.0.7 (2021-05-04)
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dgilbert@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=dgilbert@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -42
X-Spam_score: -4.3
X-Spam_bar: ----
X-Spam_report: (-4.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.441,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
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
Cc: "Wangxin \(Alexander\)" <wangxinxin.wang@huawei.com>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

* linfeng (M) (linfeng23@huawei.com) wrote:
> 
> * Dr. David Alan Gilbert (dgilbert@redhat.com) wrote:
> > Subject: Re: [v4] migration: fix the memory overwriting risk in add_to_iovec
> > 
> > * Dr. David Alan Gilbert (dgilbert@redhat.com) wrote:
> > > * Lin Feng (linfeng23@huawei.com) wrote:
> > > > From: Feng Lin <linfeng23@huawei.com>
> > > >
> > > > When testing migration, a Segmentation fault qemu core is generated.
> > > > 0  error_free (err=0x1)
> > > > 1  0x00007f8b862df647 in qemu_fclose (f=f@entry=0x55e06c247640)
> > > > 2  0x00007f8b8516d59a in migrate_fd_cleanup
> > > > (s=s@entry=0x55e06c0e1ef0)
> > > > 3  0x00007f8b8516d66c in migrate_fd_cleanup_bh
> > > > (opaque=0x55e06c0e1ef0)
> > > > 4  0x00007f8b8626a47f in aio_bh_poll (ctx=ctx@entry=0x55e06b5a16d0)
> > > > 5  0x00007f8b8626e71f in aio_dispatch (ctx=0x55e06b5a16d0)
> > > > 6  0x00007f8b8626a33d in aio_ctx_dispatch (source=<optimized out>,
> > > > callback=<optimized out>, user_data=<optimized out>)
> > > > 7  0x00007f8b866bdba4 in g_main_context_dispatch ()
> > > > 8  0x00007f8b8626cde9 in glib_pollfds_poll ()
> > > > 9  0x00007f8b8626ce62 in os_host_main_loop_wait (timeout=<optimized
> > > > out>)
> > > > 10 0x00007f8b8626cffd in main_loop_wait
> > > > (nonblocking=nonblocking@entry=0)
> > > > 11 0x00007f8b862ef01f in main_loop () Using gdb print the struct
> > > > QEMUFile f = {
> > > >   ...,
> > > >   iovcnt = 65, last_error = 21984,
> > > >   last_error_obj = 0x1, shutdown = true } Well iovcnt is overflow,
> > > > because the max size of MAX_IOV_SIZE is 64.
> > > > struct QEMUFile {
> > > >     ...;
> > > >     struct iovec iov[MAX_IOV_SIZE];
> > > >     unsigned int iovcnt;
> > > >     int last_error;
> > > >     Error *last_error_obj;
> > > >     bool shutdown;
> > > > };
> > > > iovcnt and last_error is overwrited by add_to_iovec().
> > > > Right now, add_to_iovec() increase iovcnt before check the limit.
> > > > And it seems that add_to_iovec() assumes that iovcnt will set to
> > > > zero in qemu_fflush(). But qemu_fflush() will directly return when
> > > > f->shutdown is true.
> > > >
> > > > The situation may occur when libvirtd restart during migration,
> > > > after
> > > > f->shutdown is set, before calling qemu_file_set_error() in
> > > > qemu_file_shutdown().
> > > >
> > > > So the safiest way is checking the iovcnt before increasing it.
> > > >
> > > > Signed-off-by: Feng Lin <linfeng23@huawei.com>
> > >
> > > Queued
> > 
> > Hmm this didn't actually build because that function is actually misnamed 'qemu_file_is_writable' (no e!);
> > I've fixed that, but can you just reconfirm that you've tested this fixes your original problem?
> Sorry for that rookie mistake. I have tested it again with gdb-fault injection. It can fix my original problem.
> Thanks for helping me complete my first qemu patch submission. Really helped a lot.

Thanks for retesting.

Dave

> > 
> > Dave
> > 
> > > > ---
> > > >  migration/qemu-file.c | 5 +++++
> > > >  1 file changed, 5 insertions(+)
> > > >
> > > > diff --git a/migration/qemu-file.c b/migration/qemu-file.c index
> > > > d6e03dbc0e..6879615197 100644
> > > > --- a/migration/qemu-file.c
> > > > +++ b/migration/qemu-file.c
> > > > @@ -416,6 +416,11 @@ static int add_to_iovec(QEMUFile *f, const uint8_t *buf, size_t size,
> > > >      {
> > > >          f->iov[f->iovcnt - 1].iov_len += size;
> > > >      } else {
> > > > +        if (f->iovcnt >= MAX_IOV_SIZE) {
> > > > +            /* Should only happen if a previous fflush failed */
> > > > +            assert(f->shutdown || !qemu_file_is_writeable(f));
> > > > +            return 1;
> > > > +        }
> > > >          if (may_free) {
> > > >              set_bit(f->iovcnt, f->may_free);
> > > >          }
> > > > --
> > > > 2.23.0
> > > >
> > > >
> > > --
> > > Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK
> > --
> > Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK
> 
-- 
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK


