Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 76A0763419F
	for <lists+qemu-devel@lfdr.de>; Tue, 22 Nov 2022 17:34:43 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1oxWDZ-0000Bf-B4; Tue, 22 Nov 2022 11:33:53 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1oxWDR-0000BK-5Y
 for qemu-devel@nongnu.org; Tue, 22 Nov 2022 11:33:51 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1oxWDO-000238-Uh
 for qemu-devel@nongnu.org; Tue, 22 Nov 2022 11:33:44 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1669134821;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=XBMWbVPUWNtsHKyCk0aGRt7TYrCi0JeLZakQSHc5vvU=;
 b=PusI+GwenVUbZJ3U+AIGJJSyy9iJAb7UeN3UGCVFdP9hXIm3F309R2c9rAh0IwJJT0y5Xt
 orWf/mJVAumsILWzJAWWV5H+yMMDpEFbBoUm3o9+apZOGh+anNG0eW6D9omwUfxWhtPVF1
 BbcWMGX+YJI8Pwtrmduszj79YC6dsYA=
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com
 [209.85.160.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-130-gXJyjVlfOPGd95vdI7FwQQ-1; Tue, 22 Nov 2022 11:33:40 -0500
X-MC-Unique: gXJyjVlfOPGd95vdI7FwQQ-1
Received: by mail-qt1-f199.google.com with SMTP id
 cd6-20020a05622a418600b003a54cb17ad9so14902009qtb.0
 for <qemu-devel@nongnu.org>; Tue, 22 Nov 2022 08:33:40 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=XBMWbVPUWNtsHKyCk0aGRt7TYrCi0JeLZakQSHc5vvU=;
 b=qQtbIvrP+h/iuMjksYUrPWVIWJSEq1R2jKFySElTWqOyWtOSEtX1obD0OLx5R2APIe
 dKoEXocSsOdU++Am9Di5wMq08WQE4r3lNvJ7m2Hac9dbH3AW5JhDsrWPLcOGqNnLdFNG
 UDYJDTxFNZFHYSKgp8ktjqU4niNvaHqHuwlV+nuF3ODnn60eVrxfX7+j1C+snTVpC7p1
 gnh/JKokuv3welJfj/QVhJSVn7LanyxmQeujErMHdvMmWbpZjgxPSFyW0cILevVWEjf5
 eJV1NAn0LgwQob36JZZ7/JLesqFwuOnWJetrlqEb/pLosJXj0QqsCkv5SuDJZ1oSYR7/
 hRhA==
X-Gm-Message-State: ANoB5pk+dJ+1Ie6UuLJ86PBWFxwgdCTkEUu8/VhsDFy8KbHJjQKABxrW
 wJlpMMYaEqXNQ8eHyOEQ7yOMU6kDFQJBo/Ge6HFe5Hx5QxUSkZK5ylkT1NeDUCSs8xXG9W2zIzi
 mjUuBndNDQka3RNQ=
X-Received: by 2002:a0c:cdc6:0:b0:4c6:9069:97d3 with SMTP id
 a6-20020a0ccdc6000000b004c6906997d3mr20776357qvn.106.1669134819638; 
 Tue, 22 Nov 2022 08:33:39 -0800 (PST)
X-Google-Smtp-Source: AA0mqf6XFKmY8s5ApJyiPHc2yeXrAdpYJW2yd/o+VV1W5FbVJbKRtZllT16cc1P6SvEcjHhPJykTfw==
X-Received: by 2002:a0c:cdc6:0:b0:4c6:9069:97d3 with SMTP id
 a6-20020a0ccdc6000000b004c6906997d3mr20776335qvn.106.1669134819367; 
 Tue, 22 Nov 2022 08:33:39 -0800 (PST)
Received: from x1n (bras-base-aurron9127w-grc-46-70-31-27-79.dsl.bell.ca.
 [70.31.27.79]) by smtp.gmail.com with ESMTPSA id
 bp34-20020a05620a45a200b006fb0e638f12sm10659730qkb.4.2022.11.22.08.33.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 22 Nov 2022 08:33:39 -0800 (PST)
Date: Tue, 22 Nov 2022 11:33:38 -0500
From: Peter Xu <peterx@redhat.com>
To: "manish.mishra" <manish.mishra@nutanix.com>
Cc: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>,
 qemu-devel@nongnu.org, prerna.saxena@nutanix.com,
 quintela@redhat.com, dgilbert@redhat.com, lsoaresp@redhat.com
Subject: Re: [PATCH v3 1/2] io: Add support for MSG_PEEK for socket channel
Message-ID: <Y3z54h+twgVKKZ2t@x1n>
References: <20221119093615.158072-1-manish.mishra@nutanix.com>
 <20221119093615.158072-4-manish.mishra@nutanix.com>
 <Y3yPoFAo5l/vmB/y@redhat.com>
 <d240734d-8301-ac4f-63de-89e9d2c2174c@nutanix.com>
 <Y3zffev6eOCl6JBy@x1n> <Y3zhcCCf49scoi9u@redhat.com>
 <12383abd-0495-a202-fee2-cce64c3d54b2@nutanix.com>
 <Y3z0auP3al5qYVIT@x1n> <Y3z40TBFLZDeahB4@x1n>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <Y3z40TBFLZDeahB4@x1n>
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

On Tue, Nov 22, 2022 at 11:29:05AM -0500, Peter Xu wrote:
> On Tue, Nov 22, 2022 at 11:10:18AM -0500, Peter Xu wrote:
> > On Tue, Nov 22, 2022 at 09:01:59PM +0530, manish.mishra wrote:
> > > 
> > > On 22/11/22 8:19 pm, Daniel P. Berrangé wrote:
> > > > On Tue, Nov 22, 2022 at 09:41:01AM -0500, Peter Xu wrote:
> > > > > On Tue, Nov 22, 2022 at 02:38:53PM +0530, manish.mishra wrote:
> > > > > > On 22/11/22 2:30 pm, Daniel P. Berrangé wrote:
> > > > > > > On Sat, Nov 19, 2022 at 09:36:14AM +0000, manish.mishra wrote:
> > > > > > > > MSG_PEEK reads from the peek of channel, The data is treated as
> > > > > > > > unread and the next read shall still return this data. This
> > > > > > > > support is currently added only for socket class. Extra parameter
> > > > > > > > 'flags' is added to io_readv calls to pass extra read flags like
> > > > > > > > MSG_PEEK.
> > > > > > > > 
> > > > > > > > Suggested-by: Daniel P. Berrangé <berrange@redhat.com
> > > > > > > > Signed-off-by: manish.mishra<manish.mishra@nutanix.com>
> > > > > > > > ---
> > > > > > > >    chardev/char-socket.c               |  4 +-
> > > > > > > >    include/io/channel.h                | 83 +++++++++++++++++++++++++++++
> > > > > > > >    io/channel-buffer.c                 |  1 +
> > > > > > > >    io/channel-command.c                |  1 +
> > > > > > > >    io/channel-file.c                   |  1 +
> > > > > > > >    io/channel-null.c                   |  1 +
> > > > > > > >    io/channel-socket.c                 | 16 +++++-
> > > > > > > >    io/channel-tls.c                    |  1 +
> > > > > > > >    io/channel-websock.c                |  1 +
> > > > > > > >    io/channel.c                        | 73 +++++++++++++++++++++++--
> > > > > > > >    migration/channel-block.c           |  1 +
> > > > > > > >    scsi/qemu-pr-helper.c               |  2 +-
> > > > > > > >    tests/qtest/tpm-emu.c               |  2 +-
> > > > > > > >    tests/unit/test-io-channel-socket.c |  1 +
> > > > > > > >    util/vhost-user-server.c            |  2 +-
> > > > > > > >    15 files changed, 179 insertions(+), 11 deletions(-)
> > > > > > > 
> > > > > > > > diff --git a/io/channel-socket.c b/io/channel-socket.c
> > > > > > > > index b76dca9cc1..a06b24766d 100644
> > > > > > > > --- a/io/channel-socket.c
> > > > > > > > +++ b/io/channel-socket.c
> > > > > > > > @@ -406,6 +406,8 @@ qio_channel_socket_accept(QIOChannelSocket *ioc,
> > > > > > > >        }
> > > > > > > >    #endif /* WIN32 */
> > > > > > > > +    qio_channel_set_feature(QIO_CHANNEL(cioc), QIO_CHANNEL_FEATURE_READ_MSG_PEEK);
> > > > > > > > +
> > > > > > > This covers the incoming server side socket.
> > > > > > > 
> > > > > > > This also needs to be set in outgoing client side socket in
> > > > > > > qio_channel_socket_connect_async
> > > > > > 
> > > > > > Yes sorry, i considered only current use-case, but as it is generic one both should be there. Thanks will update it.
> > > > > > 
> > > > > > > > @@ -705,7 +718,6 @@ static ssize_t qio_channel_socket_writev(QIOChannel *ioc,
> > > > > > > >    }
> > > > > > > >    #endif /* WIN32 */
> > > > > > > > -
> > > > > > > >    #ifdef QEMU_MSG_ZEROCOPY
> > > > > > > >    static int qio_channel_socket_flush(QIOChannel *ioc,
> > > > > > > >                                        Error **errp)
> > > > > > > Please remove this unrelated whitespace change.
> > > > > > > 
> > > > > > > 
> > > > > > > > @@ -109,6 +117,37 @@ int qio_channel_readv_all_eof(QIOChannel *ioc,
> > > > > > > >        return qio_channel_readv_full_all_eof(ioc, iov, niov, NULL, NULL, errp);
> > > > > > > >    }
> > > > > > > > +int qio_channel_readv_peek_all_eof(QIOChannel *ioc,
> > > > > > > > +                                   const struct iovec *iov,
> > > > > > > > +                                   size_t niov,
> > > > > > > > +                                   Error **errp)
> > > > > > > > +{
> > > > > > > > +   ssize_t len = 0;
> > > > > > > > +   ssize_t total = iov_size(iov, niov);
> > > > > > > > +
> > > > > > > > +   while (len < total) {
> > > > > > > > +       len = qio_channel_readv_full(ioc, iov, niov, NULL,
> > > > > > > > +                                    NULL, QIO_CHANNEL_READ_FLAG_MSG_PEEK, errp);
> > > > > > > > +
> > > > > > > > +       if (len == QIO_CHANNEL_ERR_BLOCK) {
> > > > > > > > +            if (qemu_in_coroutine()) {
> > > > > > > > +                qio_channel_yield(ioc, G_IO_IN);
> > > > > > > > +            } else {
> > > > > > > > +                qio_channel_wait(ioc, G_IO_IN);
> > > > > > > > +            }
> > > > > > > > +            continue;
> > > > > > > > +       }
> > > > > > > > +       if (len == 0) {
> > > > > > > > +           return 0;
> > > > > > > > +       }
> > > > > > > > +       if (len < 0) {
> > > > > > > > +           return -1;
> > > > > > > > +       }
> > > > > > > > +   }
> > > > > > > This will busy wait burning CPU where there is a read > 0 and < total.
> > > > > > > 
> > > > > > Daniel, i could use MSG_WAITALL too if that works but then we will lose opportunity to yield. Or if you have some other idea.
> > > > > How easy would this happen?
> > > > > 
> > > > > Another alternative is we could just return the partial len to caller then
> > > > > we fallback to the original channel orders if it happens.  And then if it
> > > > > mostly will never happen it'll behave merely the same as what we want.
> > > > Well we're trying to deal with a bug where the slow and/or unreliable
> > > > network causes channels to arrive in unexpected order. Given we know
> > > > we're having network trouble, I wouldn't want to make more assumptions
> > > > about things happening correctly.
> > > > 
> > > > 
> > > > With regards,
> > > > Daniel
> > > 
> > > 
> > > Peter, I have seen MSG_PEEK used in combination with MSG_WAITALL, but looks like even though chances are less it can still return partial data even with multiple retries for signal case, so is not full proof.
> > > 
> > > *MSG_WAITALL *(since Linux 2.2)
> > >               This flag requests that the operation block until the full
> > >               request is satisfied.  However, the call may still return
> > >               less data than requested if a signal is caught, an error
> > >               or disconnect occurs, or the next data to be received is
> > >               of a different type than that returned.  This flag has no
> > >               effect for datagram sockets.
> > > 
> > > Actual read ahead will be little hackish, so just confirming we all are in agreement to do actual read ahead and i can send patch? :)
> > 
> > Yet another option is the caller handles partial PEEK and then we can sleep
> > in the migration code before another PEEK attempt until it reaches the full
> > length.
> > 
> > Even with that explicit sleep code IMHO it is cleaner than the read-header
> > flag plus things like !tls check just to avoid the handshake dead lock
> > itself (and if to go with this route we'd better also have a full document
> > on why !tls, aka, how the dead lock can happen).
> 
> Nah, I forgot we're in the same condition as in the main thread.. sorry.
> 
> Then how about using qemu_co_sleep_ns_wakeable() to replace
> qio_channel_yield() either above, or in the caller?

A better one is qemu_co_sleep_ns().  Off-topic: I'd even think we should
have one qemu_co_sleep_realtime_ns() because currently all callers of
qemu_co_sleep_ns() is for the rt clock.

-- 
Peter Xu


