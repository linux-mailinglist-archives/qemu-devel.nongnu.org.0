Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CA27262BBF2
	for <lists+qemu-devel@lfdr.de>; Wed, 16 Nov 2022 12:29:03 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ovGaI-0001z0-5u; Wed, 16 Nov 2022 06:28:02 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1ovGaF-0001yo-Lj
 for qemu-devel@nongnu.org; Wed, 16 Nov 2022 06:27:59 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1ovGaD-0001A6-5v
 for qemu-devel@nongnu.org; Wed, 16 Nov 2022 06:27:59 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1668598076;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=prWJVNrtdnQmExpy4Q79NlkkRUIXmPwZ6liRVvVGjIM=;
 b=FERZOgDXmS9t9lK31DGP9oXi/HCJ8D3VROSOCLUnw9GQpUnUFl2N57+hT+hcw3igf/jST9
 1kdIVTodcoyabp2Pd8pziJh6Iz+DPEAi+3/St6DAz2o0ShJUjYHTl3Hr6cRSSLljjmQo8C
 /otNLvxWW0q9PYnihHdBkOnnA8KP1c0=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-221-UcLreBl2MXKBkbFoXdRh3g-1; Wed, 16 Nov 2022 06:27:52 -0500
X-MC-Unique: UcLreBl2MXKBkbFoXdRh3g-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
 [10.11.54.10])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 69F963810D56;
 Wed, 16 Nov 2022 11:27:52 +0000 (UTC)
Received: from redhat.com (unknown [10.33.36.81])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 7D327492B1A;
 Wed, 16 Nov 2022 11:27:51 +0000 (UTC)
Date: Wed, 16 Nov 2022 11:27:48 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: "manish.mishra" <manish.mishra@nutanix.com>
Cc: qemu-devel@nongnu.org, peterx@redhat.com, prerna.saxena@nutanix.com,
 quintela@redhat.com
Subject: Re: [PATCH v2] migration: check magic value for deciding the mapping
 of channels
Message-ID: <Y3TJNBBCMD4lHMqa@redhat.com>
References: <20221107165159.49534-1-manish.mishra@nutanix.com>
 <Y3PWUoHxcswxTrF8@redhat.com> <Y3Pffa0WD+xgFPCI@redhat.com>
 <7a01e23c-3148-4a7d-4fa8-85ca9c0be6d3@nutanix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <7a01e23c-3148-4a7d-4fa8-85ca9c0be6d3@nutanix.com>
User-Agent: Mutt/2.2.7 (2022-08-07)
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.10
Received-SPF: pass client-ip=170.10.129.124; envelope-from=berrange@redhat.com;
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
Reply-To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Wed, Nov 16, 2022 at 04:49:18PM +0530, manish.mishra wrote:
> 
> On 16/11/22 12:20 am, Daniel P. Berrangé wrote:
> > On Tue, Nov 15, 2022 at 06:11:30PM +0000, Daniel P. Berrangé wrote:
> > > On Mon, Nov 07, 2022 at 04:51:59PM +0000, manish.mishra wrote:
> > > > Current logic assumes that channel connections on the destination side are
> > > > always established in the same order as the source and the first one will
> > > > always be the main channel followed by the multifid or post-copy
> > > > preemption channel. This may not be always true, as even if a channel has a
> > > > connection established on the source side it can be in the pending state on
> > > > the destination side and a newer connection can be established first.
> > > > Basically causing out of order mapping of channels on the destination side.
> > > > Currently, all channels except post-copy preempt send a magic number, this
> > > > patch uses that magic number to decide the type of channel. This logic is
> > > > applicable only for precopy(multifd) live migration, as mentioned, the
> > > > post-copy preempt channel does not send any magic number. Also, tls live
> > > > migrations already does tls handshake before creating other channels, so
> > > > this issue is not possible with tls, hence this logic is avoided for tls
> > > > live migrations. This patch uses MSG_PEEK to check the magic number of
> > > > channels so that current data/control stream management remains
> > > > un-effected.
> > > > 
> > > > Suggested-by: Daniel P. Berrangé<berrange@redhat.com>
> > > > Signed-off-by: manish.mishra<manish.mishra@nutanix.com>
> > > > 
> > > > v2:
> > > >    TLS does not support MSG_PEEK, so V1 was broken for tls live
> > > >    migrations. For tls live migration, while initializing main channel
> > > >    tls handshake is done before we can create other channels, so this
> > > >    issue is not possible for tls live migrations. In V2 added a check
> > > >    to avoid checking magic number for tls live migration and fallback
> > > >    to older method to decide mapping of channels on destination side.
> > > > ---
> > > >   include/io/channel.h     | 25 +++++++++++++++++++++++
> > > >   io/channel-socket.c      | 27 ++++++++++++++++++++++++
> > > >   io/channel.c             | 39 +++++++++++++++++++++++++++++++++++
> > > >   migration/migration.c    | 44 +++++++++++++++++++++++++++++-----------
> > > >   migration/multifd.c      | 12 ++++-------
> > > >   migration/multifd.h      |  2 +-
> > > >   migration/postcopy-ram.c |  5 +----
> > > >   migration/postcopy-ram.h |  2 +-
> > > >   8 files changed, 130 insertions(+), 26 deletions(-)
> > > This should be two commits, because the 'io' and 'migration'
> > > code are two separate subsystems in QEMU.
> > > 
> > > > diff --git a/include/io/channel.h b/include/io/channel.h
> > > > index c680ee7480..74177aeeea 100644
> > > > --- a/include/io/channel.h
> > > > +++ b/include/io/channel.h
> > > > @@ -115,6 +115,10 @@ struct QIOChannelClass {
> > > >                           int **fds,
> > > >                           size_t *nfds,
> > > >                           Error **errp);
> > > > +    ssize_t (*io_read_peek)(QIOChannel *ioc,
> > > > +                            void *buf,
> > > > +                            size_t nbytes,
> > > > +                            Error **errp);
> > > This API should be called "io_read_peekv" and use
> > > "const struct iovec *iov", such that is matches the
> > > design of 'io_readv'.
> > > 
> > > There should also be a QIOChannelFeature flag
> > > registered to indicate whether a given channel
> > > impl supports peeking at data.
> > > 
> > > 
> > > > @@ -475,6 +479,27 @@ int qio_channel_write_all(QIOChannel *ioc,
> > > >                             size_t buflen,
> > > >                             Error **errp);
> > > > +/**
> > > > + * qio_channel_read_peek_all:
> > > > + * @ioc: the channel object
> > > > + * @buf: the memory region to read in data
> > > > + * @nbytes: the number of bytes to read
> > > > + * @errp: pointer to a NULL-initialized error object
> > > > + *
> > > > + * Read given @nbytes data from peek of channel into
> > > > + * memory region @buf.
> > > > + *
> > > > + * The function will be blocked until read size is
> > > > + * equal to requested size.
> > > > + *
> > > > + * Returns: 1 if all bytes were read, 0 if end-of-file
> > > > + *          occurs without data, or -1 on error
> > > > + */
> > > > +int qio_channel_read_peek_all(QIOChannel *ioc,
> > > > +                              void* buf,
> > > > +                              size_t nbytes,
> > > > +                              Error **errp);
> > > There should be qio_channel_read_peek, qio_channel_read_peekv,
> > > qio_channel_read_peek_all and qio_channel_read_peekv_all.
> > Actually ignore that.  We should not add any new APIs at
> > all.  Instead the io_readv callback, and the qio_channel_read*all()
> > methods should gain a 'int flags' parameter, in the same way that
> > the write methods have one. Then there should be as
> > QIO_CHANNEL_READ_FLAG_PEEK constant defined.
> 
> Hi Daniel, As MSG_PEEK always reads from top even if there were
> previos partial reads, so current |qio_channel_readv_all_eofmay
> not work? I can keep things upto ||qio_channel_readv as common
> for both with flags parameters but have separate
> ||qio_channel_readv_peek_all_eof? Does something like that works.|||

Simplest is probably to just not add 'flags' to the 'all' variants,
just the non-'all' varants.

With regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


