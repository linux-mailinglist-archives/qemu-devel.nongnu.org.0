Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 97B9A6D64D8
	for <lists+qemu-devel@lfdr.de>; Tue,  4 Apr 2023 16:12:08 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pjhNb-0002TU-MI; Tue, 04 Apr 2023 10:11:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1pjd7W-0006Wz-7G
 for qemu-devel@nongnu.org; Tue, 04 Apr 2023 05:38:30 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1pjd7U-00005o-09
 for qemu-devel@nongnu.org; Tue, 04 Apr 2023 05:38:29 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1680601107;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=PrhRpuE5PfYdyTK6FnQG64gKAkt74Bkdl20J+vUSjAY=;
 b=NtmvImN32OsbSs22kKzgClg2Jc7VucFgD3PMrEWGqEImUQo1Bo4hV6VzmzIej8YBNpDOmP
 exD6UvchL+Nemr9DkAvwLxHgtk4d1nAWO2pJEfF7fspPXCm7pz8YtFQDtSVEiVKul3bB81
 Eeuw8rrUGsaZ+IXEkZw1Yald2VddguA=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-263-VPfJfaYSPjqQJIXYNFoA2A-1; Tue, 04 Apr 2023 05:38:25 -0400
X-MC-Unique: VPfJfaYSPjqQJIXYNFoA2A-1
Received: by mail-wm1-f72.google.com with SMTP id
 r11-20020a05600c458b00b003eea8d25f06so16044546wmo.1
 for <qemu-devel@nongnu.org>; Tue, 04 Apr 2023 02:38:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680601104; x=1683193104;
 h=user-agent:in-reply-to:content-disposition:mime-version:references
 :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=PrhRpuE5PfYdyTK6FnQG64gKAkt74Bkdl20J+vUSjAY=;
 b=Cv6igYACH/i+sc9AWxMFJW3tExLZYuFsCttJVll/TQwLm8w1q6GgotS8wSg0ax5TPM
 2WdQC/gKwpmoSk1HVa8MI8/bZcozqBjNjGqJ+dRxfGy/qn49J+u5KMLmolrlgHeoFaUk
 gawQ1T7EfV5ztqWWfUxKInrzFQ5X0aaM/hU/hurcZyzr1neGm843G39XUfEQRPataORT
 sQ5LO1IYwCv1orbdFXPEgEvAgrU9U/z0Ezl5NAu66aLb5Q49KWvXfuTFcaaWPMSIGc88
 uF8oJZC8/mauDKnP/YhGY8iDx2jx63ZhMSUd8iWlGCZDwQY30DxxpiT/QRhJl1OEf5Wk
 2lMQ==
X-Gm-Message-State: AAQBX9eZYeM6fOmcYG19wj7QAHX4EcOqHiabnFV+95T5uCkhbQKFpp+x
 EUMomM6k7em6hE50n7REetHzSaLgGrlTHEWVp1tVj+F4ZFkQ6yJowRRxcghz+hVCT096CgbIZxU
 KOslAWz+0M+pdU/I=
X-Received: by 2002:a7b:c38a:0:b0:3ed:e715:1784 with SMTP id
 s10-20020a7bc38a000000b003ede7151784mr1947187wmj.15.1680601104666; 
 Tue, 04 Apr 2023 02:38:24 -0700 (PDT)
X-Google-Smtp-Source: AKy350arlH3TpIuzppyhWEkgvJ11yISyREQNvnJp5gdw8zP6hTf84qhuHwXkNDKAhWVO4OJfBTXc1g==
X-Received: by 2002:a7b:c38a:0:b0:3ed:e715:1784 with SMTP id
 s10-20020a7bc38a000000b003ede7151784mr1947163wmj.15.1680601104292; 
 Tue, 04 Apr 2023 02:38:24 -0700 (PDT)
Received: from work-vm
 (ward-16-b2-v4wan-166627-cust863.vm18.cable.virginm.net. [81.97.203.96])
 by smtp.gmail.com with ESMTPSA id
 e5-20020a05600c218500b003ed243222adsm14539157wme.42.2023.04.04.02.38.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 04 Apr 2023 02:38:23 -0700 (PDT)
Date: Tue, 4 Apr 2023 10:38:21 +0100
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: Juan Quintela <quintela@redhat.com>
Cc: Stefan Hajnoczi <stefanha@redhat.com>, qemu-devel@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>,
 Julia Suvorova <jusual@redhat.com>, Kevin Wolf <kwolf@redhat.com>,
 Peter Lieven <pl@kamp.de>, Coiby Xu <Coiby.Xu@gmail.com>,
 xen-devel@lists.xenproject.org,
 Richard Henderson <richard.henderson@linaro.org>,
 Stefano Garzarella <sgarzare@redhat.com>, qemu-block@nongnu.org,
 Eduardo Habkost <eduardo@habkost.net>,
 Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@linaro.org>,
 Paul Durrant <paul@xen.org>, "Richard W.M. Jones" <rjones@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Aarushi Mehta <mehta.aaru20@gmail.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Fam Zheng <fam@euphon.net>, David Woodhouse <dwmw2@infradead.org>,
 Stefan Weil <sw@weilnetz.de>, Xie Yongji <xieyongji@bytedance.com>,
 Hanna Reitz <hreitz@redhat.com>,
 Ronnie Sahlberg <ronniesahlberg@gmail.com>, eesposit@redhat.com,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Daniel =?iso-8859-1?Q?P=2E_Berrang=E9?= <berrange@redhat.com>,
 Anthony Perard <anthony.perard@citrix.com>
Subject: Re: [PATCH 13/13] aio: remove aio_disable_external() API
Message-ID: <ZCvwDVPTNS8VUtVb@work-vm>
References: <20230403183004.347205-1-stefanha@redhat.com>
 <20230403183004.347205-14-stefanha@redhat.com>
 <877cusroqp.fsf@secure.mitica>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <877cusroqp.fsf@secure.mitica>
User-Agent: Mutt/2.2.9 (2022-11-12)
Received-SPF: pass client-ip=170.10.129.124; envelope-from=dgilbert@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Tue, 04 Apr 2023 10:11:21 -0400
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

* Juan Quintela (quintela@redhat.com) wrote:
> Stefan Hajnoczi <stefanha@redhat.com> wrote:
> > All callers now pass is_external=false to aio_set_fd_handler() and
> > aio_set_event_notifier(). The aio_disable_external() API that
> > temporarily disables fd handlers that were registered is_external=true
> > is therefore dead code.
> >
> > Remove aio_disable_external(), aio_enable_external(), and the
> > is_external arguments to aio_set_fd_handler() and
> > aio_set_event_notifier().
> >
> > The entire test-fdmon-epoll test is removed because its sole purpose was
> > testing aio_disable_external().
> >
> > Parts of this patch were generated using the following coccinelle
> > (https://coccinelle.lip6.fr/) semantic patch:
> >
> >   @@
> >   expression ctx, fd, is_external, io_read, io_write, io_poll, io_poll_ready, opaque;
> >   @@
> >   - aio_set_fd_handler(ctx, fd, is_external, io_read, io_write, io_poll, io_poll_ready, opaque)
> >   + aio_set_fd_handler(ctx, fd, io_read, io_write, io_poll, io_poll_ready, opaque)
> >
> >   @@
> >   expression ctx, notifier, is_external, io_read, io_poll, io_poll_ready;
> >   @@
> >   - aio_set_event_notifier(ctx, notifier, is_external, io_read, io_poll, io_poll_ready)
> >   + aio_set_event_notifier(ctx, notifier, io_read, io_poll, io_poll_ready)
> >
> > Signed-off-by: Stefan Hajnoczi <stefanha@redhat.com>
> 
> [....]
> 
> > diff --git a/migration/rdma.c b/migration/rdma.c
> > index df646be35e..aee41ca43e 100644
> > --- a/migration/rdma.c
> > +++ b/migration/rdma.c
> > @@ -3104,15 +3104,15 @@ static void qio_channel_rdma_set_aio_fd_handler(QIOChannel *ioc,
> >  {
> >      QIOChannelRDMA *rioc = QIO_CHANNEL_RDMA(ioc);
> >      if (io_read) {
> > -        aio_set_fd_handler(ctx, rioc->rdmain->recv_comp_channel->fd,
> > -                           false, io_read, io_write, NULL, NULL, opaque);
> > -        aio_set_fd_handler(ctx, rioc->rdmain->send_comp_channel->fd,
> > -                           false, io_read, io_write, NULL, NULL, opaque);
> > +        aio_set_fd_handler(ctx, rioc->rdmain->recv_comp_channel->fd, io_read,
> > +                           io_write, NULL, NULL, opaque);
> > +        aio_set_fd_handler(ctx, rioc->rdmain->send_comp_channel->fd, io_read,
> > +                           io_write, NULL, NULL, opaque);
> >      } else {
> > -        aio_set_fd_handler(ctx, rioc->rdmaout->recv_comp_channel->fd,
> > -                           false, io_read, io_write, NULL, NULL, opaque);
> > -        aio_set_fd_handler(ctx, rioc->rdmaout->send_comp_channel->fd,
> > -                           false, io_read, io_write, NULL, NULL, opaque);
> > +        aio_set_fd_handler(ctx, rioc->rdmaout->recv_comp_channel->fd, io_read,
> > +                           io_write, NULL, NULL, opaque);
> > +        aio_set_fd_handler(ctx, rioc->rdmaout->send_comp_channel->fd, io_read,
> > +                           io_write, NULL, NULL, opaque);
> >      }
> >  }
> 
> Reviewed-by: Juan Quintela <quintela@redhat.com>
> 
> For the migration bits.
> I don't even want to know why the RDMA code uses a low level block layer API.

I don't think it's block specific.
It looks like it's because qio_channel uses aio in the case where
something QIO_CHANNEL_ERR_BLOCK and then waits for the recovery; see
4d9f675 that added it.

Dave
-- 
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK


