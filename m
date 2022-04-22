Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A5FF650B68E
	for <lists+qemu-devel@lfdr.de>; Fri, 22 Apr 2022 13:51:50 +0200 (CEST)
Received: from localhost ([::1]:43670 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nhrpF-00045N-Pm
	for lists+qemu-devel@lfdr.de; Fri, 22 Apr 2022 07:51:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60070)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1nhqDg-0000w6-6a
 for qemu-devel@nongnu.org; Fri, 22 Apr 2022 06:08:56 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:59023)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1nhqDb-0003Sx-VL
 for qemu-devel@nongnu.org; Fri, 22 Apr 2022 06:08:54 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1650622126;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=MRbwBgdxcEBnL1RNITAu3Mwkn0I4vCjaq/KWbQFgBM4=;
 b=InT1BZlBnaIJ2FBeqT8fPa20XglHv3VHJlyTb8HF8XHyoSEZmoZl9RA7rqs2hleybv1Byo
 YsBVw64bPF4XzIzOJKalIepSepqW+Oxtx3IEpUZw2XfW1tWk7L/xZB0CysDZ8OxMquiSTz
 0tUtmn3wCm726Jdd0QX21z2J7fXwzBI=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-466-eFCLI5lhO2eT3XxBjktNKw-1; Fri, 22 Apr 2022 06:08:43 -0400
X-MC-Unique: eFCLI5lhO2eT3XxBjktNKw-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 50C07811E81;
 Fri, 22 Apr 2022 10:08:43 +0000 (UTC)
Received: from redhat.com (unknown [10.39.194.218])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id D0E9346519B;
 Fri, 22 Apr 2022 10:08:41 +0000 (UTC)
Date: Fri, 22 Apr 2022 11:08:39 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Fam Zheng <fam@euphon.net>
Subject: Re: [PATCH v4] Use io_uring_register_ring_fd() to skip fd operations
Message-ID: <YmJ+p1axke5dcSw8@redhat.com>
References: <20220421163648.4205-1-faithilikerun@gmail.com>
 <20220422083428.GA61339@fam-dell> <YmJs3gzZ9S1+cPmD@redhat.com>
 <20220422100047.GB61339@fam-dell>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220422100047.GB61339@fam-dell>
User-Agent: Mutt/2.1.5 (2021-12-30)
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.9
Received-SPF: pass client-ip=170.10.133.124; envelope-from=berrange@redhat.com;
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
Cc: Damien Le Moal <Damien.LeMoal@wdc.com>,
 Dmitry Fomichev <Dmitry.Fomichev@wdc.com>,
 Stefan Hajnoczi <stefanha@gmail.com>, Sam Li <faithilikerun@gmail.com>,
 qemu-devel <qemu-devel@nongnu.org>, Hannes Reinecke <hare@suse.de>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, Apr 22, 2022 at 11:00:47AM +0100, Fam Zheng wrote:
> On 2022-04-22 09:52, Daniel P. Berrangé wrote:
> > On Fri, Apr 22, 2022 at 09:34:28AM +0100, Fam Zheng wrote:
> > > On 2022-04-22 00:36, Sam Li wrote:
> > > > Linux recently added a new io_uring(7) optimization API that QEMU
> > > > doesn't take advantage of yet. The liburing library that QEMU uses
> > > > has added a corresponding new API calling io_uring_register_ring_fd().
> > > > When this API is called after creating the ring, the io_uring_submit()
> > > > library function passes a flag to the io_uring_enter(2) syscall
> > > > allowing it to skip the ring file descriptor fdget()/fdput()
> > > > operations. This saves some CPU cycles.
> > > > 
> > > > Signed-off-by: Sam Li <faithilikerun@gmail.com>
> > > > ---
> > > >  block/io_uring.c | 10 +++++++++-
> > > >  1 file changed, 9 insertions(+), 1 deletion(-)
> > > > 
> > > > diff --git a/block/io_uring.c b/block/io_uring.c
> > > > index 782afdb433..5247fb79e2 100644
> > > > --- a/block/io_uring.c
> > > > +++ b/block/io_uring.c
> > > > @@ -435,8 +435,16 @@ LuringState *luring_init(Error **errp)
> > > >      }
> > > >  
> > > >      ioq_init(&s->io_q);
> > > > -    return s;
> > > > +    if (io_uring_register_ring_fd(&s->ring) < 0) {
> > > > +        /*
> > > > +         * Only warn about this error: we will fallback to the non-optimized
> > > > +         * io_uring operations.
> > > > +         */
> > > > +        error_reportf_err(*errp,
> > > > +                         "failed to register linux io_uring ring file descriptor");
> > > 
> > > IIUC errp can be NULL, so let's not dereference it without checking. So, just
> > > use error_report?
> > 
> > Plenty of people will be running kernels that lack the new feature,
> > so this "failure" will be an expected scenario. We shouldn't be
> > spamming the logs with any error or warning message. Assuming  QEMU
> > remains fully functional, merely not as optimized, we should be
> > totally silent.
> 
> Functionally, that's a very valid point. But performance wise, is it good to
> have some visibility of this? Since people use io_uring instead of other
> options almost certainly for performance, and here the issue does matter quite
> a bit.

IMHO what you describe is largely a documentation issue, and/or something
for OS vendors to worry about if they want to maximise their users'
performance. As long as io_uring is fully functional we shouldn't print
errors on every QEMU startup, as it leads to pointless bug reports/support
escalations about something that is operating normally, wasting users and
vendors' time.

With regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


