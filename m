Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D9C25633F26
	for <lists+qemu-devel@lfdr.de>; Tue, 22 Nov 2022 15:42:44 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1oxUSV-0000QA-9T; Tue, 22 Nov 2022 09:41:11 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1oxUST-0000Q2-RG
 for qemu-devel@nongnu.org; Tue, 22 Nov 2022 09:41:09 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1oxUSQ-0002du-Um
 for qemu-devel@nongnu.org; Tue, 22 Nov 2022 09:41:09 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1669128065;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=t7iJ4EoNThhOXtKf78A9uEvRy4GipRbD5KpUX6e0l40=;
 b=TFcgPfthVj9iNwUDQeTrhB6LCdkdGeUzRLxOJe4E2+NCZv6D9akFhXe/lati4OnLEPxZcs
 GSvUpmC7oDAhu/XYkQG/hOENKocN6mfICmKyo+9rpO7qCkRTPYSLXkgowJQlWMAChgGDQk
 c9CwG3/xwMTKA+d6N5NXk7OryT1TI4Y=
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com
 [209.85.160.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-494-LlzatU0wNLuY1D4zb98FmA-1; Tue, 22 Nov 2022 09:41:04 -0500
X-MC-Unique: LlzatU0wNLuY1D4zb98FmA-1
Received: by mail-qt1-f197.google.com with SMTP id
 fz10-20020a05622a5a8a00b003a4f466998cso14770786qtb.16
 for <qemu-devel@nongnu.org>; Tue, 22 Nov 2022 06:41:03 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=t7iJ4EoNThhOXtKf78A9uEvRy4GipRbD5KpUX6e0l40=;
 b=WExgAn3TxXysJ3cg6ZUCfNpW3QIPVviWbttIIEfsboY84E+9wxFUNpeUvNHAM902kA
 Vgm8hesaLvW/fBHszFuFexQuG1oxTGYJrvNXOzqHouNqyI6eHl0+ogeSvDzA/wq9WnoD
 tJ4uumBbqaKzon5Ctrso65WxM4qQdvetHiJmXCeEPqB4rOW/kEjm9FKhEv/ZW7e1L5x5
 05lZQE3zv3EnihkIEpkonJ1MvVufJgkyUFYYeBpS0tDEEORHwls7uEqiymOQAid3wK2a
 noZntSaUGAc57QFzZnejxekcErl0Zif1CnyUEZEZpQNn3ASn4DJ6uC/NPZqQnU+XlKSl
 WchA==
X-Gm-Message-State: ANoB5pn4znLiVjStmzypGma9cvUzCFYpANhm6kPWJAoTIuwFbMJSazv7
 UOGDUN9idVB1nEYdgVhEAZRFRIFconNTSN3FQ6se9xNRpO91NHHYWFCG2FmwfwFTzwosS6vqtI1
 40LlwlNkxyvyH9i4=
X-Received: by 2002:a37:4655:0:b0:6ee:6fb0:c4ef with SMTP id
 t82-20020a374655000000b006ee6fb0c4efmr4170447qka.173.1669128063562; 
 Tue, 22 Nov 2022 06:41:03 -0800 (PST)
X-Google-Smtp-Source: AA0mqf78FLqOKjErOiSSQy9KaULUSWjWXTQFQU5jG0P5tcEgASyCSZgrz4kNA8VUfKqL6m6MMpdxjQ==
X-Received: by 2002:a37:4655:0:b0:6ee:6fb0:c4ef with SMTP id
 t82-20020a374655000000b006ee6fb0c4efmr4170415qka.173.1669128063262; 
 Tue, 22 Nov 2022 06:41:03 -0800 (PST)
Received: from x1n (bras-base-aurron9127w-grc-46-70-31-27-79.dsl.bell.ca.
 [70.31.27.79]) by smtp.gmail.com with ESMTPSA id
 t8-20020a37ea08000000b006b9c9b7db8bsm10231789qkj.82.2022.11.22.06.41.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 22 Nov 2022 06:41:02 -0800 (PST)
Date: Tue, 22 Nov 2022 09:41:01 -0500
From: Peter Xu <peterx@redhat.com>
To: "manish.mishra" <manish.mishra@nutanix.com>
Cc: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>,
 qemu-devel@nongnu.org, prerna.saxena@nutanix.com,
 quintela@redhat.com, dgilbert@redhat.com, lsoaresp@redhat.com
Subject: Re: [PATCH v3 1/2] io: Add support for MSG_PEEK for socket channel
Message-ID: <Y3zffev6eOCl6JBy@x1n>
References: <20221119093615.158072-1-manish.mishra@nutanix.com>
 <20221119093615.158072-4-manish.mishra@nutanix.com>
 <Y3yPoFAo5l/vmB/y@redhat.com>
 <d240734d-8301-ac4f-63de-89e9d2c2174c@nutanix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <d240734d-8301-ac4f-63de-89e9d2c2174c@nutanix.com>
Received-SPF: pass client-ip=170.10.133.124; envelope-from=peterx@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Tue, Nov 22, 2022 at 02:38:53PM +0530, manish.mishra wrote:
> 
> On 22/11/22 2:30 pm, Daniel P. Berrangé wrote:
> > On Sat, Nov 19, 2022 at 09:36:14AM +0000, manish.mishra wrote:
> > > MSG_PEEK reads from the peek of channel, The data is treated as
> > > unread and the next read shall still return this data. This
> > > support is currently added only for socket class. Extra parameter
> > > 'flags' is added to io_readv calls to pass extra read flags like
> > > MSG_PEEK.
> > > 
> > > Suggested-by: Daniel P. Berrangé <berrange@redhat.com
> > > Signed-off-by: manish.mishra <manish.mishra@nutanix.com>
> > > ---
> > >   chardev/char-socket.c               |  4 +-
> > >   include/io/channel.h                | 83 +++++++++++++++++++++++++++++
> > >   io/channel-buffer.c                 |  1 +
> > >   io/channel-command.c                |  1 +
> > >   io/channel-file.c                   |  1 +
> > >   io/channel-null.c                   |  1 +
> > >   io/channel-socket.c                 | 16 +++++-
> > >   io/channel-tls.c                    |  1 +
> > >   io/channel-websock.c                |  1 +
> > >   io/channel.c                        | 73 +++++++++++++++++++++++--
> > >   migration/channel-block.c           |  1 +
> > >   scsi/qemu-pr-helper.c               |  2 +-
> > >   tests/qtest/tpm-emu.c               |  2 +-
> > >   tests/unit/test-io-channel-socket.c |  1 +
> > >   util/vhost-user-server.c            |  2 +-
> > >   15 files changed, 179 insertions(+), 11 deletions(-)
> > 
> > 
> > > diff --git a/io/channel-socket.c b/io/channel-socket.c
> > > index b76dca9cc1..a06b24766d 100644
> > > --- a/io/channel-socket.c
> > > +++ b/io/channel-socket.c
> > > @@ -406,6 +406,8 @@ qio_channel_socket_accept(QIOChannelSocket *ioc,
> > >       }
> > >   #endif /* WIN32 */
> > > +    qio_channel_set_feature(QIO_CHANNEL(cioc), QIO_CHANNEL_FEATURE_READ_MSG_PEEK);
> > > +
> > This covers the incoming server side socket.
> > 
> > This also needs to be set in outgoing client side socket in
> > qio_channel_socket_connect_async
> 
> 
> Yes sorry, i considered only current use-case, but as it is generic one both should be there. Thanks will update it.
> 
> > 
> > > @@ -705,7 +718,6 @@ static ssize_t qio_channel_socket_writev(QIOChannel *ioc,
> > >   }
> > >   #endif /* WIN32 */
> > > -
> > >   #ifdef QEMU_MSG_ZEROCOPY
> > >   static int qio_channel_socket_flush(QIOChannel *ioc,
> > >                                       Error **errp)
> > Please remove this unrelated whitespace change.
> > 
> > 
> > > @@ -109,6 +117,37 @@ int qio_channel_readv_all_eof(QIOChannel *ioc,
> > >       return qio_channel_readv_full_all_eof(ioc, iov, niov, NULL, NULL, errp);
> > >   }
> > > +int qio_channel_readv_peek_all_eof(QIOChannel *ioc,
> > > +                                   const struct iovec *iov,
> > > +                                   size_t niov,
> > > +                                   Error **errp)
> > > +{
> > > +   ssize_t len = 0;
> > > +   ssize_t total = iov_size(iov, niov);
> > > +
> > > +   while (len < total) {
> > > +       len = qio_channel_readv_full(ioc, iov, niov, NULL,
> > > +                                    NULL, QIO_CHANNEL_READ_FLAG_MSG_PEEK, errp);
> > > +
> > > +       if (len == QIO_CHANNEL_ERR_BLOCK) {
> > > +            if (qemu_in_coroutine()) {
> > > +                qio_channel_yield(ioc, G_IO_IN);
> > > +            } else {
> > > +                qio_channel_wait(ioc, G_IO_IN);
> > > +            }
> > > +            continue;
> > > +       }
> > > +       if (len == 0) {
> > > +           return 0;
> > > +       }
> > > +       if (len < 0) {
> > > +           return -1;
> > > +       }
> > > +   }
> > This will busy wait burning CPU where there is a read > 0 and < total.
> > 
> 
> Daniel, i could use MSG_WAITALL too if that works but then we will lose opportunity to yield. Or if you have some other idea.

How easy would this happen?

Another alternative is we could just return the partial len to caller then
we fallback to the original channel orders if it happens.  And then if it
mostly will never happen it'll behave merely the same as what we want.

The thing is the other approach will be hacky in another way (have a flag
migration_consumed_4_bytes_header to either main and multifd channels),
then if it'll solve 99.99% cases I'd think it's good enough.  Anyway we're
working on a corner case already on unreliable network, and even if failure
triggered it's not so bad - we just redo the migration.

-- 
Peter Xu


