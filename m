Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DB2F54E73F
	for <lists+qemu-devel@lfdr.de>; Thu, 16 Jun 2022 18:28:34 +0200 (CEST)
Received: from localhost ([::1]:55640 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o1sMC-0000nh-LO
	for lists+qemu-devel@lfdr.de; Thu, 16 Jun 2022 12:28:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41126)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1o1sKT-0008N7-Lx
 for qemu-devel@nongnu.org; Thu, 16 Jun 2022 12:26:48 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:51675)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1o1sKR-0003P3-BU
 for qemu-devel@nongnu.org; Thu, 16 Jun 2022 12:26:45 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1655396802;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ylM5BznvGLbBpRU4m7Tua2iw+9moxZ/yPZSJOOvtPyc=;
 b=Sn4cO+KY8kLApl8NcRjq5Mkurw/OF9lLmcJQ4uNeGvlYzyqrS1+TTpbZDCBSR6R+IpDKff
 LkIJLyh1znWTSytblVs8aR4/C3J4v3ZUOgn+E8hZPhHf3p1x+b2wnsN8u5sRtuAKAdT6VR
 9bq0kYdWNOjnR22kNzWRvIgJGDYCIOo=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-512-BHPe_AdxOD2_ODG589eYLA-1; Thu, 16 Jun 2022 12:26:39 -0400
X-MC-Unique: BHPe_AdxOD2_ODG589eYLA-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
 [10.11.54.6])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 2DC6D83395D;
 Thu, 16 Jun 2022 16:26:39 +0000 (UTC)
Received: from redhat.com (unknown [10.33.36.111])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id C7DB72166B26;
 Thu, 16 Jun 2022 16:26:37 +0000 (UTC)
Date: Thu, 16 Jun 2022 17:26:35 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Eric Blake <eblake@redhat.com>
Cc: qemu-devel@nongnu.org, "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 qemu-block@nongnu.org, Stefan Hajnoczi <stefanha@redhat.com>,
 Hailiang Zhang <zhang.zhanghailiang@huawei.com>,
 Juan Quintela <quintela@redhat.com>, Fam Zheng <fam@euphon.net>
Subject: Re: [PATCH 01/20] io: add a QIOChannelNull equivalent to /dev/null
Message-ID: <YqtZu5pX4uUGfz4G@redhat.com>
References: <20220524110235.145079-1-berrange@redhat.com>
 <20220524110235.145079-2-berrange@redhat.com>
 <20220524211406.hskzsft3qezuepfp@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220524211406.hskzsft3qezuepfp@redhat.com>
User-Agent: Mutt/2.2.1 (2022-02-19)
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
Received-SPF: pass client-ip=170.10.133.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, May 24, 2022 at 04:14:31PM -0500, Eric Blake wrote:
> On Tue, May 24, 2022 at 12:02:16PM +0100, Daniel P. Berrangé wrote:
> > This is for code which needs a portable equivalent to a QIOChannelFile
> > connected to /dev/null.
> > 
> > Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
> > ---
> >  include/io/channel-null.h         |  55 +++++++
> >  io/channel-null.c                 | 237 ++++++++++++++++++++++++++++++
> >  io/meson.build                    |   1 +
> >  io/trace-events                   |   3 +
> >  tests/unit/meson.build            |   1 +
> >  tests/unit/test-io-channel-null.c |  95 ++++++++++++
> >  6 files changed, 392 insertions(+)
> >  create mode 100644 include/io/channel-null.h
> >  create mode 100644 io/channel-null.c
> >  create mode 100644 tests/unit/test-io-channel-null.c
> 
> > +/**
> > + * QIOChannelNull:
> > + *
> > + * The QIOChannelNull object provides a channel implementation
> > + * that discards all writes and returns zero bytes for all reads.
> 
> That describes the behavior of /dev/zero, not /dev/null, where reads
> always fail with EOF.

Nb, I wrote 'zero bytes' (as in "byte count equal to zero")  not
'zeroed bytes' (as in "set all bytes to the value zero").

I'll reword it to make it less confusing though.

> 
> > + */
> > +
> > +struct QIOChannelNull {
> > +    QIOChannel parent;
> > +    bool closed;
> > +};
> > +
> 
> > diff --git a/io/channel-null.c b/io/channel-null.c
> 
> > +
> > +static ssize_t
> > +qio_channel_null_readv(QIOChannel *ioc,
> > +                       const struct iovec *iov,
> > +                       size_t niov,
> > +                       int **fds G_GNUC_UNUSED,
> > +                       size_t *nfds G_GNUC_UNUSED,
> > +                       Error **errp)
> > +{
> > +    QIOChannelNull *nioc = QIO_CHANNEL_NULL(ioc);
> > +
> > +    if (nioc->closed) {
> > +        error_setg_errno(errp, EINVAL,
> > +                         "Channel is closed");
> > +        return -1;
> > +    }
> > +
> > +    return 0;
> > +}
> 
> But this behavior is returning early EOF instead of using iov_memset()
> to read all zeroes the way /dev/zero would.
> 
> > +++ b/tests/unit/test-io-channel-null.c
> 
> > +static void test_io_channel_null_io(void)
> > +{
> > +    g_autoptr(QIOChannelNull) null = qio_channel_null_new();
> > +    char buf[1024];
> > +    GIOCondition gotcond = 0;
> > +    Error *local_err = NULL;
> > +
> > +    g_assert(qio_channel_write(QIO_CHANNEL(null),
> > +                               "Hello World", 11,
> > +                               &error_abort) == 11);
> 
> I still cringe seeing tests inside g_assert(), but this is not the
> first instance of it.
> 
> > +
> > +    g_assert(qio_channel_read(QIO_CHANNEL(null),
> > +                              buf, sizeof(buf),
> > +                              &error_abort) == 0);
> 
> Okay, you're testing for /dev/null behavior of early EOF.
> 
> Other than misleading comments, this looks reasonable.  But those
> comments are core enough as to what this channel does that I don't
> feel comfortable giving R-b yet.
> 
> -- 
> Eric Blake, Principal Software Engineer
> Red Hat, Inc.           +1-919-301-3266
> Virtualization:  qemu.org | libvirt.org
> 

With regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


