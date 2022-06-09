Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A50995453B1
	for <lists+qemu-devel@lfdr.de>; Thu,  9 Jun 2022 20:08:26 +0200 (CEST)
Received: from localhost ([::1]:38516 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nzMa1-0004GD-74
	for lists+qemu-devel@lfdr.de; Thu, 09 Jun 2022 14:08:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39764)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1nzKoU-00083a-Nw
 for qemu-devel@nongnu.org; Thu, 09 Jun 2022 12:15:17 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:31001)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1nzKoR-0001Bx-Us
 for qemu-devel@nongnu.org; Thu, 09 Jun 2022 12:15:14 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1654791306;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=LncLNhOAOqU2EPrxxDlHqK9O+IVMbs4XQXpRqZN7ZEo=;
 b=NQTmtBPdSnkjeOO5vM18qA9bo96ZSmGZQnI2g9ZWm/H+7HJgbe4EWerHksFj48NUVMQPJG
 RTi8NgUCB/4cp4CtlEsulncwGbEc/wE0c2dqfdWTyU53ZrLLYlh8Y75yntYGtUpGCyp+wt
 3Vjl6WSy+Yq//QML4z5qxKi4LinjAAw=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-259-7ZIhleBpPre0i5GHdsKWWA-1; Thu, 09 Jun 2022 12:15:03 -0400
X-MC-Unique: 7ZIhleBpPre0i5GHdsKWWA-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
 [10.11.54.6])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 88C81101E165;
 Thu,  9 Jun 2022 16:15:02 +0000 (UTC)
Received: from redhat.com (unknown [10.33.36.61])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id A2D382166B26;
 Thu,  9 Jun 2022 16:15:00 +0000 (UTC)
Date: Thu, 9 Jun 2022 17:14:57 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
Cc: qemu-devel@nongnu.org, qemu-block@nongnu.org,
 Stefan Hajnoczi <stefanha@redhat.com>,
 Hailiang Zhang <zhang.zhanghailiang@huawei.com>,
 Juan Quintela <quintela@redhat.com>, Fam Zheng <fam@euphon.net>
Subject: Re: [PATCH 14/20] migration: remove the QEMUFileOps 'shut_down'
 callback
Message-ID: <YqIcgc7J9d/kLBOu@redhat.com>
References: <20220524110235.145079-1-berrange@redhat.com>
 <20220524110235.145079-15-berrange@redhat.com>
 <YqIb+S+UlgJMXkSa@work-vm>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <YqIb+S+UlgJMXkSa@work-vm>
User-Agent: Mutt/2.2.1 (2022-02-19)
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
Received-SPF: pass client-ip=170.10.129.124; envelope-from=berrange@redhat.com;
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

On Thu, Jun 09, 2022 at 05:12:41PM +0100, Dr. David Alan Gilbert wrote:
> * Daniel P. Berrangé (berrange@redhat.com) wrote:
> > This directly implements the shutdown logic using QIOChannel APIs.
> > 
> > Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
> > ---
> >  migration/qemu-file-channel.c | 27 ---------------------------
> >  migration/qemu-file.c         | 10 +++++++---
> >  migration/qemu-file.h         | 10 ----------
> >  3 files changed, 7 insertions(+), 40 deletions(-)
> > 
> > diff --git a/migration/qemu-file-channel.c b/migration/qemu-file-channel.c
> > index 5cb8ac93c0..80f05dc371 100644
> > --- a/migration/qemu-file-channel.c
> > +++ b/migration/qemu-file-channel.c
> > @@ -112,31 +112,6 @@ static int channel_close(void *opaque, Error **errp)
> >  }
> >  
> >  
> > -static int channel_shutdown(void *opaque,
> > -                            bool rd,
> > -                            bool wr,
> > -                            Error **errp)
> > -{
> > -    QIOChannel *ioc = QIO_CHANNEL(opaque);
> > -
> > -    if (qio_channel_has_feature(ioc,
> > -                                QIO_CHANNEL_FEATURE_SHUTDOWN)) {
> > -        QIOChannelShutdown mode;
> > -        if (rd && wr) {
> > -            mode = QIO_CHANNEL_SHUTDOWN_BOTH;
> > -        } else if (rd) {
> > -            mode = QIO_CHANNEL_SHUTDOWN_READ;
> > -        } else {
> > -            mode = QIO_CHANNEL_SHUTDOWN_WRITE;
> > -        }
> > -        if (qio_channel_shutdown(ioc, mode, errp) < 0) {
> > -            return -EIO;
> > -        }
> > -    }
> > -    return 0;
> > -}
> > -
> > -
> >  static int channel_set_blocking(void *opaque,
> >                                  bool enabled,
> >                                  Error **errp)
> > @@ -166,7 +141,6 @@ static QEMUFile *channel_get_output_return_path(void *opaque)
> >  static const QEMUFileOps channel_input_ops = {
> >      .get_buffer = channel_get_buffer,
> >      .close = channel_close,
> > -    .shut_down = channel_shutdown,
> >      .set_blocking = channel_set_blocking,
> >      .get_return_path = channel_get_input_return_path,
> >  };
> > @@ -175,7 +149,6 @@ static const QEMUFileOps channel_input_ops = {
> >  static const QEMUFileOps channel_output_ops = {
> >      .writev_buffer = channel_writev_buffer,
> >      .close = channel_close,
> > -    .shut_down = channel_shutdown,
> >      .set_blocking = channel_set_blocking,
> >      .get_return_path = channel_get_output_return_path,
> >  };
> > diff --git a/migration/qemu-file.c b/migration/qemu-file.c
> > index 5548e1abf3..fd9f060c02 100644
> > --- a/migration/qemu-file.c
> > +++ b/migration/qemu-file.c
> > @@ -74,13 +74,17 @@ struct QEMUFile {
> >   */
> >  int qemu_file_shutdown(QEMUFile *f)
> >  {
> > -    int ret;
> > +    int ret = 0;
> >  
> >      f->shutdown = true;
> > -    if (!f->ops->shut_down) {
> > +    if (!qio_channel_has_feature(f->ioc,
> > +                                 QIO_CHANNEL_FEATURE_SHUTDOWN)) {
> >          return -ENOSYS;
> >      }
> > -    ret = f->ops->shut_down(f->ioc, true, true, NULL);
> > +
> > +    if (qio_channel_shutdown(f->ioc, QIO_CHANNEL_SHUTDOWN_BOTH, NULL) < 0) {
> > +        ret = -EIO;
> > +    }
> 
> OK, so this is following the code you're flattening; so:
> 
> Reviewed-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
> 
>  I wonder if there's any reason it doesn't just pass the return value through to ret rather
> than flattening it to -EIO?

qio methods never return errno values just positive integer or -1.

Since qemu_file_shutdown seems to want an errno, I picked EIO

Better would be for qemu_file_shutdown to have an Error **errp
param instead but that could come later.


With regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


