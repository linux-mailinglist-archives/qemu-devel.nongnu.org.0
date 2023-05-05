Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 93F726F7DA9
	for <lists+qemu-devel@lfdr.de>; Fri,  5 May 2023 09:19:59 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pupio-0002aq-OV; Fri, 05 May 2023 03:19:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1pupil-0002a1-HB
 for qemu-devel@nongnu.org; Fri, 05 May 2023 03:19:16 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1pupij-0003x8-JK
 for qemu-devel@nongnu.org; Fri, 05 May 2023 03:19:15 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1683271151;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=RZntnz5WyXfqZSraaxuRb8+Sihb9+Z6wHXC5gCDecz0=;
 b=LcuCLnD7hdXeks3rMuo7SzjCfpIeRwtD2/1aM0HqEcnxvrgzjDv9NY+1wffQaGXArY8W90
 izKxy0z2gqx4BN0B/TbUNd49RWDDedAol+0XD1n3O0PbipC3iLFJU47jI6CCiUxLv6nATF
 8NBxMbMBgRz/bGzeCxyzlDW+rLNlXzY=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-435-tCntgJ84PQ6DtQM2pKAt_A-1; Fri, 05 May 2023 03:19:08 -0400
X-MC-Unique: tCntgJ84PQ6DtQM2pKAt_A-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 9A0AE1006E27;
 Fri,  5 May 2023 07:19:07 +0000 (UTC)
Received: from redhat.com (unknown [10.42.28.42])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 80EDBC15BA0;
 Fri,  5 May 2023 07:19:06 +0000 (UTC)
Date: Fri, 5 May 2023 08:19:04 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Juan Quintela <quintela@redhat.com>
Cc: qemu-devel@nongnu.org, qemu-block@nongnu.org,
 Stefan Hajnoczi <stefanha@redhat.com>,
 Leonardo Bras <leobras@redhat.com>, Fam Zheng <fam@euphon.net>,
 Peter Xu <peterx@redhat.com>
Subject: Re: [PATCH 9/9] qemu-file: Account for rate_limit usage on
 qemu_fflush()
Message-ID: <ZFSt6KBFOz48CIpt@redhat.com>
References: <20230504113841.23130-1-quintela@redhat.com>
 <20230504113841.23130-10-quintela@redhat.com>
 <ZFPkP58QSrkm6riX@redhat.com> <87h6ssovu6.fsf@secure.mitica>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <87h6ssovu6.fsf@secure.mitica>
User-Agent: Mutt/2.2.9 (2022-11-12)
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.8
Received-SPF: pass client-ip=170.10.129.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -22
X-Spam_score: -2.3
X-Spam_bar: --
X-Spam_report: (-2.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.161,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Thu, May 04, 2023 at 07:22:25PM +0200, Juan Quintela wrote:
> Daniel P. Berrangé <berrange@redhat.com> wrote:
> > On Thu, May 04, 2023 at 01:38:41PM +0200, Juan Quintela wrote:
> >> That is the moment we know we have transferred something.
> >> 
> >> Signed-off-by: Juan Quintela <quintela@redhat.com>
> >> ---
> >>  migration/qemu-file.c | 7 +++----
> >>  1 file changed, 3 insertions(+), 4 deletions(-)
> >> 
> >> diff --git a/migration/qemu-file.c b/migration/qemu-file.c
> >> index ddebfac847..309b4c56f4 100644
> >> --- a/migration/qemu-file.c
> >> +++ b/migration/qemu-file.c
> >> @@ -300,7 +300,9 @@ void qemu_fflush(QEMUFile *f)
> >>                                     &local_error) < 0) {
> >>              qemu_file_set_error_obj(f, -EIO, local_error);
> >>          } else {
> >> -            f->total_transferred += iov_size(f->iov, f->iovcnt);
> >> +            uint64_t size = iov_size(f->iov, f->iovcnt);
> >> +            qemu_file_acct_rate_limit(f, size);
> >> +            f->total_transferred += size;
> >>          }
> >>  
> >>          qemu_iovec_release_ram(f);
> >> @@ -527,7 +529,6 @@ void qemu_put_buffer_async(QEMUFile *f, const uint8_t *buf, size_t size,
> >>          return;
> >>      }
> >>  
> >> -    f->rate_limit_used += size;
> >>      add_to_iovec(f, buf, size, may_free);
> >>  }
> >>  
> >> @@ -545,7 +546,6 @@ void qemu_put_buffer(QEMUFile *f, const uint8_t *buf, size_t size)
> >>              l = size;
> >>          }
> >>          memcpy(f->buf + f->buf_index, buf, l);
> >> -        f->rate_limit_used += l;
> >>          add_buf_to_iovec(f, l);
> >>          if (qemu_file_get_error(f)) {
> >>              break;
> >> @@ -562,7 +562,6 @@ void qemu_put_byte(QEMUFile *f, int v)
> >>      }
> >>  
> >>      f->buf[f->buf_index] = v;
> >> -    f->rate_limit_used++;
> >>      add_buf_to_iovec(f, 1);
> >>  }
> >
> > This has a slight semantic behavioural change.
> 
> Yeap.
> 
> See the answer to Peter.  But three things came to mind:
> 
> a - the size of the buffer is small (between 32KB and 256KB depending
>     how you count it).  So we are going to call qemu_fflush() really
>     soon.
> 
> b - We are using this value to calculate how much we can send through
>     the wire.  Here we are saything how much we have accepted to send.
> 
> c - When using multifd the number of bytes that we send through the qemu
>     file is even smaller. migration-test multifd test send 300MB of data
>     through multifd channels and around 300KB on the qemu_file channel.
> 
> 
> >
> > By accounting for rate limit in the qemu_put functions, we ensure
> > that we stop growing the iovec when rate limiting activates.
> >
> > If we only apply rate limit in the the flush function, that will
> > let the  f->iov continue to accumulate buffers, while we have
> > rate limited the actual transfer.
> 
> 256KB maximum.  Our accounting has bigger errors than that.
> 
> 
> > This makes me uneasy - it feels like a bad idea to continue to
> > accumulate buffers if we're not ready to send them
> 
> I still think that the change is correct.  But as you and Peter have
> concerns about it, I will think a bit more about it.

If Peter's calculations are correct, then I don't have any objection,
as that's a small overhead.

With regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


