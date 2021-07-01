Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 06CCA3B9119
	for <lists+qemu-devel@lfdr.de>; Thu,  1 Jul 2021 13:24:14 +0200 (CEST)
Received: from localhost ([::1]:48464 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lyunk-0004IV-KF
	for lists+qemu-devel@lfdr.de; Thu, 01 Jul 2021 07:24:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43232)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1lyumk-0003dY-8Q
 for qemu-devel@nongnu.org; Thu, 01 Jul 2021 07:23:10 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:43095)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1lyumh-0007BB-IL
 for qemu-devel@nongnu.org; Thu, 01 Jul 2021 07:23:09 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1625138585;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=nLiBAGvv/hEKf8RrsqWw0vmKXZMOx4zmm6VxtZrQZmY=;
 b=ddiwTqxkItXAFwyaPkLu4KxZoAQiL3Tez+ZmdAEGmf8m/qeyMqHQRUSPgXnSdtfEOumqN2
 2nRhi4COt+Zum1DpeuBbsGRk2ijTaIhk2wJkEhxemVhBzRB0X5diAlQR6DM606QOFEJ+FO
 kua7y15JLWNI/q5Yvw1T2HH4qbGhmoY=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-451-pn57C1YEMnCAIqIOuBhA6w-1; Thu, 01 Jul 2021 07:23:04 -0400
X-MC-Unique: pn57C1YEMnCAIqIOuBhA6w-1
Received: by mail-wm1-f72.google.com with SMTP id
 a129-20020a1ce3870000b02901f050bc61d2so1993772wmh.8
 for <qemu-devel@nongnu.org>; Thu, 01 Jul 2021 04:23:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=nLiBAGvv/hEKf8RrsqWw0vmKXZMOx4zmm6VxtZrQZmY=;
 b=knAu0lVKUzJgw7p2RNLH/rcqnWqsU/x6oqgQ3VkTXjYMKFUyZBSOEBkQOmkhCtQ657
 +PddIOMY2g9yAbGW7whSdI2yeCtMeZuT9n4wdyYSOIVRHaQmvtAW1KPd/bdCrBqVEUaI
 M1H5KfNST0V3Vk8BxN5WAN5GaotOb7+z7Lejki7sppVHQHvPUFBllR9xLG24lJZV2/yE
 TdOsGRMErw6TP0VRFrf1yHZNZTLJbf2dIiwY2+SMeQJUJ7VXpmn/a9fUJOGqi+SHZRst
 Ac4SqDnX0EzDSnPLEpvqDhyFSpp4txbLML+tFsCb4cY8XkLz0iQ7h9pMhzTkEIBy0ToN
 N2iA==
X-Gm-Message-State: AOAM530nnnW3D2KWrNxrOOqdMhZ3E4uzzH2/Fzh9lAFjUJHupJVtOl6N
 QqHECwn8DSUM5sG+h5Dcyhgs2fFc2hmUIuDdtu7SZSOxkQRcDoF/vq8mqH5DbZfUG9yo1K2ArEy
 JmNJPu1HPW5wicho=
X-Received: by 2002:adf:f587:: with SMTP id f7mr46279594wro.253.1625138583034; 
 Thu, 01 Jul 2021 04:23:03 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxgXYXoMz1adF+kWSN/N7Y8uB4cyXnmc5uuS+O61nhezAWNDTyLz3av39HXrIoN7SsYE2LU3w==
X-Received: by 2002:adf:f587:: with SMTP id f7mr46279566wro.253.1625138582807; 
 Thu, 01 Jul 2021 04:23:02 -0700 (PDT)
Received: from work-vm (cpc109021-salf6-2-0-cust453.10-2.cable.virginm.net.
 [82.29.237.198])
 by smtp.gmail.com with ESMTPSA id n12sm16692905wrs.12.2021.07.01.04.23.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 01 Jul 2021 04:23:02 -0700 (PDT)
Date: Thu, 1 Jul 2021 12:23:00 +0100
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: Lin Feng <linfeng23@huawei.com>
Subject: Re: [v4] migration: fix the memory overwriting risk in add_to_iovec
Message-ID: <YN2llAABbktuLCUu@work-vm>
References: <20210623015104.218-1-linfeng23@huawei.com>
 <20210625062138.1899-1-linfeng23@huawei.com>
 <YNyjsmZU2gRGe0K3@work-vm>
MIME-Version: 1.0
In-Reply-To: <YNyjsmZU2gRGe0K3@work-vm>
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
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.402,
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

* Dr. David Alan Gilbert (dgilbert@redhat.com) wrote:
> * Lin Feng (linfeng23@huawei.com) wrote:
> > From: Feng Lin <linfeng23@huawei.com>
> > 
> > When testing migration, a Segmentation fault qemu core is generated.
> > 0  error_free (err=0x1)
> > 1  0x00007f8b862df647 in qemu_fclose (f=f@entry=0x55e06c247640)
> > 2  0x00007f8b8516d59a in migrate_fd_cleanup (s=s@entry=0x55e06c0e1ef0)
> > 3  0x00007f8b8516d66c in migrate_fd_cleanup_bh (opaque=0x55e06c0e1ef0)
> > 4  0x00007f8b8626a47f in aio_bh_poll (ctx=ctx@entry=0x55e06b5a16d0)
> > 5  0x00007f8b8626e71f in aio_dispatch (ctx=0x55e06b5a16d0)
> > 6  0x00007f8b8626a33d in aio_ctx_dispatch (source=<optimized out>, callback=<optimized out>, user_data=<optimized out>)
> > 7  0x00007f8b866bdba4 in g_main_context_dispatch ()
> > 8  0x00007f8b8626cde9 in glib_pollfds_poll ()
> > 9  0x00007f8b8626ce62 in os_host_main_loop_wait (timeout=<optimized out>)
> > 10 0x00007f8b8626cffd in main_loop_wait (nonblocking=nonblocking@entry=0)
> > 11 0x00007f8b862ef01f in main_loop ()
> > Using gdb print the struct QEMUFile f = {
> >   ...,
> >   iovcnt = 65, last_error = 21984,
> >   last_error_obj = 0x1, shutdown = true
> > }
> > Well iovcnt is overflow, because the max size of MAX_IOV_SIZE is 64.
> > struct QEMUFile {
> >     ...;
> >     struct iovec iov[MAX_IOV_SIZE];
> >     unsigned int iovcnt;
> >     int last_error;
> >     Error *last_error_obj;
> >     bool shutdown;
> > };
> > iovcnt and last_error is overwrited by add_to_iovec().
> > Right now, add_to_iovec() increase iovcnt before check the limit.
> > And it seems that add_to_iovec() assumes that iovcnt will set to zero
> > in qemu_fflush(). But qemu_fflush() will directly return when f->shutdown
> > is true.
> > 
> > The situation may occur when libvirtd restart during migration, after
> > f->shutdown is set, before calling qemu_file_set_error() in
> > qemu_file_shutdown().
> > 
> > So the safiest way is checking the iovcnt before increasing it.
> > 
> > Signed-off-by: Feng Lin <linfeng23@huawei.com>
> 
> Queued

Hmm this didn't actually build because that function is actually
misnamed 'qemu_file_is_writable' (no e!);  I've fixed that, but can you
just reconfirm that you've tested this fixes your original problem?

Dave

> > ---
> >  migration/qemu-file.c | 5 +++++
> >  1 file changed, 5 insertions(+)
> > 
> > diff --git a/migration/qemu-file.c b/migration/qemu-file.c
> > index d6e03dbc0e..6879615197 100644
> > --- a/migration/qemu-file.c
> > +++ b/migration/qemu-file.c
> > @@ -416,6 +416,11 @@ static int add_to_iovec(QEMUFile *f, const uint8_t *buf, size_t size,
> >      {
> >          f->iov[f->iovcnt - 1].iov_len += size;
> >      } else {
> > +        if (f->iovcnt >= MAX_IOV_SIZE) {
> > +            /* Should only happen if a previous fflush failed */
> > +            assert(f->shutdown || !qemu_file_is_writeable(f));
> > +            return 1;
> > +        }
> >          if (may_free) {
> >              set_bit(f->iovcnt, f->may_free);
> >          }
> > -- 
> > 2.23.0
> > 
> > 
> -- 
> Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK
-- 
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK


