Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7294E544BF7
	for <lists+qemu-devel@lfdr.de>; Thu,  9 Jun 2022 14:28:41 +0200 (CEST)
Received: from localhost ([::1]:60044 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nzHHE-0005A8-GW
	for lists+qemu-devel@lfdr.de; Thu, 09 Jun 2022 08:28:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53870)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1nzEux-0003Wu-1m
 for qemu-devel@nongnu.org; Thu, 09 Jun 2022 05:57:31 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:43496)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1nzEuv-0005bU-4f
 for qemu-devel@nongnu.org; Thu, 09 Jun 2022 05:57:30 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1654768647;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=nUG8qfNoWcfhdOZShQgmSRqPTNXceL80M67a3IGV0Sc=;
 b=W+e3FwN8SlZz/lqHnXyNr+IPKeoLOU/z1i12OxDuSyXGNFQq4AI6iD3IJfOohh146bIA7A
 NsRnkYkUnbf/yrNut+fM609OyknLoqwNYWkkwKRITxw1K+kw5a5B/yE4xuweeTJL+g3MG0
 3RJdnOVn/8NhrdG0xzxerNxoaOrRM9U=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-227-oS_29dofMVObg2jorrbeCw-1; Thu, 09 Jun 2022 05:57:26 -0400
X-MC-Unique: oS_29dofMVObg2jorrbeCw-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
 [10.11.54.4])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 03368801E6B;
 Thu,  9 Jun 2022 09:57:26 +0000 (UTC)
Received: from redhat.com (unknown [10.33.36.61])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id C04D22026D64;
 Thu,  9 Jun 2022 09:57:24 +0000 (UTC)
Date: Thu, 9 Jun 2022 10:57:22 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
Cc: qemu-devel@nongnu.org, qemu-block@nongnu.org,
 Stefan Hajnoczi <stefanha@redhat.com>,
 Hailiang Zhang <zhang.zhanghailiang@huawei.com>,
 Juan Quintela <quintela@redhat.com>, Fam Zheng <fam@euphon.net>
Subject: Re: [PATCH 05/20] migration: rename 'pos' field in QEMUFile to
 'bytes_processed'
Message-ID: <YqHEApe61OJz/6TK@redhat.com>
References: <20220524110235.145079-1-berrange@redhat.com>
 <20220524110235.145079-6-berrange@redhat.com>
 <YqHCn9DRjczHs34a@work-vm>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <YqHCn9DRjczHs34a@work-vm>
User-Agent: Mutt/2.2.1 (2022-02-19)
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
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

On Thu, Jun 09, 2022 at 10:51:27AM +0100, Dr. David Alan Gilbert wrote:
> * Daniel P. Berrangé (berrange@redhat.com) wrote:
> > This makes the field name align with the newly introduced method
> > names in the previous commit.
> 
> I think that's the method in the following commits?

Opps, yeah, I did re-arrange this series a few times to get the
most attractive diffs.

> tbh I'm not sure about this; 'pos' is still passed to writev_buffer
> and get_buffer to say where the data is - and that makes it a 'pos'
> still rather than a simple stats counter.

Note every QIOChannel backed impl of QEMUFile is ignoring the
'pos' field.

The only QEMUFile impl using 'pos' is the one during I/O is
the block device vmstate. A later patch is introducing a
QIOChannel impl for the vmstate, and to handle this it is
tracking a file offset itself internally to the QIOChannel
impl. So when we eliminate the QEMUFileOps callbacks later,
this 'pos' goes away.

So I guess my description here is a little ahead of itself.


> > Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
> > ---
> >  migration/qemu-file.c | 19 ++++++++++---------
> >  1 file changed, 10 insertions(+), 9 deletions(-)
> > 
> > diff --git a/migration/qemu-file.c b/migration/qemu-file.c
> > index 03f0b13a55..b21da4c5bf 100644
> > --- a/migration/qemu-file.c
> > +++ b/migration/qemu-file.c
> > @@ -50,8 +50,9 @@ struct QEMUFile {
> >       */
> >      int64_t rate_limit_used;
> >  
> > -    int64_t pos; /* start of buffer when writing, end of buffer
> > -                    when reading */
> > +    /* The sum of bytes transferred on the wire */
> > +    int64_t total_transferred;
> > +
> >      int buf_index;
> >      int buf_size; /* 0 when writing */
> >      uint8_t buf[IO_BUF_SIZE];
> > @@ -241,14 +242,14 @@ void qemu_fflush(QEMUFile *f)
> >      }
> >      if (f->iovcnt > 0) {
> >          expect = iov_size(f->iov, f->iovcnt);
> > -        ret = f->ops->writev_buffer(f->opaque, f->iov, f->iovcnt, f->pos,
> > +        ret = f->ops->writev_buffer(f->opaque, f->iov, f->iovcnt, f->total_transferred,
> >                                      &local_error);
> >  
> >          qemu_iovec_release_ram(f);
> >      }
> >  
> >      if (ret >= 0) {
> > -        f->pos += ret;
> > +        f->total_transferred += ret;
> >      }
> >      /* We expect the QEMUFile write impl to send the full
> >       * data set we requested, so sanity check that.
> > @@ -357,11 +358,11 @@ static ssize_t qemu_fill_buffer(QEMUFile *f)
> >          return 0;
> >      }
> >  
> > -    len = f->ops->get_buffer(f->opaque, f->buf + pending, f->pos,
> > +    len = f->ops->get_buffer(f->opaque, f->buf + pending, f->total_transferred,
> >                               IO_BUF_SIZE - pending, &local_error);
> >      if (len > 0) {
> >          f->buf_size += len;
> > -        f->pos += len;
> > +        f->total_transferred += len;
> >      } else if (len == 0) {
> >          qemu_file_set_error_obj(f, -EIO, local_error);
> >      } else if (len != -EAGAIN) {
> > @@ -375,7 +376,7 @@ static ssize_t qemu_fill_buffer(QEMUFile *f)
> >  
> >  void qemu_update_position(QEMUFile *f, size_t size)
> >  {
> > -    f->pos += size;
> > +    f->total_transferred += size;
> >  }
> >  
> >  /** Closes the file
> > @@ -658,7 +659,7 @@ int qemu_get_byte(QEMUFile *f)
> >  
> >  int64_t qemu_ftell_fast(QEMUFile *f)
> >  {
> > -    int64_t ret = f->pos;
> > +    int64_t ret = f->total_transferred;
> >      int i;
> >  
> >      for (i = 0; i < f->iovcnt; i++) {
> > @@ -671,7 +672,7 @@ int64_t qemu_ftell_fast(QEMUFile *f)
> >  int64_t qemu_ftell(QEMUFile *f)
> >  {
> >      qemu_fflush(f);
> > -    return f->pos;
> > +    return f->total_transferred;
> >  }
> >  
> >  int qemu_file_rate_limit(QEMUFile *f)
> > -- 
> > 2.36.1
> > 
> -- 
> Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK
> 

With regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


