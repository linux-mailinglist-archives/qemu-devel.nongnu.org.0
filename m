Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2EDA45454DE
	for <lists+qemu-devel@lfdr.de>; Thu,  9 Jun 2022 21:23:30 +0200 (CEST)
Received: from localhost ([::1]:35922 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nzNke-0000xo-Oq
	for lists+qemu-devel@lfdr.de; Thu, 09 Jun 2022 15:23:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52690)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1nzLf3-0007ZN-Pd
 for qemu-devel@nongnu.org; Thu, 09 Jun 2022 13:09:33 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:40110)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1nzLf0-0001UX-Ib
 for qemu-devel@nongnu.org; Thu, 09 Jun 2022 13:09:32 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1654794569;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ec8u2xcrZ/h/jGLWlI0scUh2/qfuPXMmkYPxrh/17zo=;
 b=KCtJpuunBgK8gku4SApyjb26mWKH/aUtJ7hbcN8OI9LmCBof38ZrDUd+u/GFMuXcAI25mQ
 z215dD6a7ElLMtJLRrbH4b+gTiGiZ2qvcY4YD8Ks3NjnEhBdpOCNFJlrhLlvYsVmKH30xU
 rBrDsvy6e8XxDp2oVji6r9B4Fg63w5g=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-532-Nqy19-6APGqTGHzPs_0BoA-1; Thu, 09 Jun 2022 13:09:28 -0400
X-MC-Unique: Nqy19-6APGqTGHzPs_0BoA-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
 [10.11.54.6])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id AA2911C00131;
 Thu,  9 Jun 2022 17:09:27 +0000 (UTC)
Received: from redhat.com (unknown [10.33.36.61])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 7C1D02166B26;
 Thu,  9 Jun 2022 17:09:26 +0000 (UTC)
Date: Thu, 9 Jun 2022 18:09:23 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
Cc: qemu-devel@nongnu.org, qemu-block@nongnu.org,
 Stefan Hajnoczi <stefanha@redhat.com>,
 Hailiang Zhang <zhang.zhanghailiang@huawei.com>,
 Juan Quintela <quintela@redhat.com>, Fam Zheng <fam@euphon.net>
Subject: Re: [PATCH 17/20] migration: remove the QEMUFileOps 'get_buffer'
 callback
Message-ID: <YqIpQ/+TiryqSB0+@redhat.com>
References: <20220524110235.145079-1-berrange@redhat.com>
 <20220524110235.145079-18-berrange@redhat.com>
 <YqIj5YNn0XZZqyIw@work-vm>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <YqIj5YNn0XZZqyIw@work-vm>
User-Agent: Mutt/2.2.1 (2022-02-19)
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
Received-SPF: pass client-ip=170.10.133.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

On Thu, Jun 09, 2022 at 05:46:29PM +0100, Dr. David Alan Gilbert wrote:
> * Daniel P. Berrangé (berrange@redhat.com) wrote:
> > This directly implements the get_buffer logic using QIOChannel APIs.
> > 
> > Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
> > ---
> >  migration/qemu-file-channel.c | 29 -----------------------------
> >  migration/qemu-file.c         | 18 ++++++++++++++++--
> >  migration/qemu-file.h         |  9 ---------
> >  3 files changed, 16 insertions(+), 40 deletions(-)
> > 
> > diff --git a/migration/qemu-file-channel.c b/migration/qemu-file-channel.c
> > index 8ff58e81f9..7b32831752 100644
> > --- a/migration/qemu-file-channel.c
> > +++ b/migration/qemu-file-channel.c
> > @@ -74,34 +74,6 @@ static ssize_t channel_writev_buffer(void *opaque,
> >  }
> >  
> >  
> > -static ssize_t channel_get_buffer(void *opaque,
> > -                                  uint8_t *buf,
> > -                                  int64_t pos,
> > -                                  size_t size,
> > -                                  Error **errp)
> > -{
> > -    QIOChannel *ioc = QIO_CHANNEL(opaque);
> > -    ssize_t ret;
> > -
> > -    do {
> > -        ret = qio_channel_read(ioc, (char *)buf, size, errp);
> > -        if (ret < 0) {
> > -            if (ret == QIO_CHANNEL_ERR_BLOCK) {
> > -                if (qemu_in_coroutine()) {
> > -                    qio_channel_yield(ioc, G_IO_IN);
> > -                } else {
> > -                    qio_channel_wait(ioc, G_IO_IN);
> > -                }
> > -            } else {
> > -                return -EIO;
> > -            }
> > -        }
> > -    } while (ret == QIO_CHANNEL_ERR_BLOCK);
> > -
> > -    return ret;
> > -}
> > -
> > -
> >  static QEMUFile *channel_get_input_return_path(void *opaque)
> >  {
> >      QIOChannel *ioc = QIO_CHANNEL(opaque);
> > @@ -117,7 +89,6 @@ static QEMUFile *channel_get_output_return_path(void *opaque)
> >  }
> >  
> >  static const QEMUFileOps channel_input_ops = {
> > -    .get_buffer = channel_get_buffer,
> >      .get_return_path = channel_get_input_return_path,
> >  };
> >  
> > diff --git a/migration/qemu-file.c b/migration/qemu-file.c
> > index a855ce33dc..e024b43851 100644
> > --- a/migration/qemu-file.c
> > +++ b/migration/qemu-file.c
> > @@ -374,8 +374,22 @@ static ssize_t qemu_fill_buffer(QEMUFile *f)
> >          return 0;
> >      }
> >  
> > -    len = f->ops->get_buffer(f->ioc, f->buf + pending, f->total_transferred,
> > -                             IO_BUF_SIZE - pending, &local_error);
> > +    do {
> > +        len = qio_channel_read(f->ioc,
> 
> Yes, I think that's OK - not that 'len' is an int where 'ret'
> was a ssize_t; but I think our buffers are guranteed to be 'small'.

There are a few places in qemu-file.c where we're fast & loose
with int rather than size_t, that are probably worth cleaning.

> Reviewed-by: Dr. David Alan Gilbert <dgilbert@redhat.com>

With regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


