Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C1D455575ED
	for <lists+qemu-devel@lfdr.de>; Thu, 23 Jun 2022 10:52:34 +0200 (CEST)
Received: from localhost ([::1]:40954 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o4IZl-00023m-Kg
	for lists+qemu-devel@lfdr.de; Thu, 23 Jun 2022 04:52:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36842)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1o4IVU-0000UI-3O
 for qemu-devel@nongnu.org; Thu, 23 Jun 2022 04:48:08 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:26241)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1o4IVR-00079j-UH
 for qemu-devel@nongnu.org; Thu, 23 Jun 2022 04:48:07 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1655974080;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=4RPpaCDKg285KZdr6RHR/AmtTiyy0p5CgUccYgaXUyU=;
 b=CuSnqaJsKbfJ9Ey/PYBTLtDNhzFiqcnolQswh17Nbw8x1xZ+JWFmWoExh1EsHSl3+PK13e
 3HaCqfis7fc6wLHJJ7u51hPPyf+UNKVBOufWlCgKwX3ShKlinu4R9amZh/wpveZEiySMXe
 olH6u8unbgKGm2xQYHkJ0J8sDlygYdI=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-173-clQZDuPXNtia8X3zPvNJgw-1; Thu, 23 Jun 2022 04:47:56 -0400
X-MC-Unique: clQZDuPXNtia8X3zPvNJgw-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
 [10.11.54.4])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 6BC743C01DA4;
 Thu, 23 Jun 2022 08:47:56 +0000 (UTC)
Received: from redhat.com (unknown [10.33.36.77])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 83CC42026D64;
 Thu, 23 Jun 2022 08:47:53 +0000 (UTC)
Date: Thu, 23 Jun 2022 09:47:51 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Peter Xu <peterx@redhat.com>
Cc: "Dr. David Alan Gilbert (git)" <dgilbert@redhat.com>,
 qemu-devel@nongnu.org, huangy81@chinatelecom.cn,
 quintela@redhat.com, leobras@redhat.com, jdenemar@redhat.com
Subject: Re: [PULL 22/33] migration: remove the QEMUFileOps 'get_buffer'
 callback
Message-ID: <YrQot90/2gzdh/gt@redhat.com>
References: <20220622183917.155308-1-dgilbert@redhat.com>
 <20220622183917.155308-23-dgilbert@redhat.com>
 <YrNu3KesFVVvoWVb@xz-m1.local> <YrN381XWrhTFStlp@xz-m1.local>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <YrN381XWrhTFStlp@xz-m1.local>
User-Agent: Mutt/2.2.1 (2022-02-19)
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
Received-SPF: pass client-ip=170.10.129.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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

On Wed, Jun 22, 2022 at 04:13:39PM -0400, Peter Xu wrote:
> On Wed, Jun 22, 2022 at 03:34:52PM -0400, Peter Xu wrote:
> > On Wed, Jun 22, 2022 at 07:39:06PM +0100, Dr. David Alan Gilbert (git) wrote:
> > > diff --git a/migration/qemu-file.c b/migration/qemu-file.c
> > > index 74f919de67..e206b05550 100644
> > > --- a/migration/qemu-file.c
> > > +++ b/migration/qemu-file.c
> > > @@ -377,8 +377,22 @@ static ssize_t qemu_fill_buffer(QEMUFile *f)
> > >          return 0;
> > >      }
> > >  
> > > -    len = f->ops->get_buffer(f->ioc, f->buf + pending, f->total_transferred,
> > > -                             IO_BUF_SIZE - pending, &local_error);
> > > +    do {
> > > +        len = qio_channel_read(f->ioc,
> > > +                               (char *)f->buf + pending,
> > > +                               IO_BUF_SIZE - pending,
> > > +                               &local_error);
> > > +        if (len == QIO_CHANNEL_ERR_BLOCK) {
> > > +            if (qemu_in_coroutine()) {
> > > +                qio_channel_yield(f->ioc, G_IO_IN);
> > > +            } else {
> > > +                qio_channel_wait(f->ioc, G_IO_IN);
> > > +            }
> > > +        } else if (len < 0) {
> > > +            len = EIO;
> > 
> > This should be -EIO.
> > 
> > > +        }
> > > +    } while (len == QIO_CHANNEL_ERR_BLOCK);
> > 
> > It's failing only with the new TLS test I added for postcopy somehow (at
> > least /x86_64/migration/postcopy/recovery/tls).. I also verified after the
> > change it'll work again.
> 
> Hmm, when I wanted to run the whole bunch of the migration-test again I
> found that precopy tls test hangs (/x86_64/migration/precopy/unix/tls/psk).
> Though for this time it also hangs for me even with the master branch, so
> maybe not anything wrong with this specific pull req but still something
> needs fixing..

That pre-existing test has been runnnig by default in CI for a while
now, under different OS builds, so I'm surprised. Is there anything
especially unusual / different about your setup that could explain
why you see hang that we don't get anywhere else ?


With regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


