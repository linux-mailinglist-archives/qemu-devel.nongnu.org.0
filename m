Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CF9E3FE9A1
	for <lists+qemu-devel@lfdr.de>; Thu,  2 Sep 2021 09:02:25 +0200 (CEST)
Received: from localhost ([::1]:53768 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mLgjt-0001dS-4T
	for lists+qemu-devel@lfdr.de; Thu, 02 Sep 2021 03:02:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52678)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lsoaresp@redhat.com>)
 id 1mLgh0-0007li-3b
 for qemu-devel@nongnu.org; Thu, 02 Sep 2021 02:59:22 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:21586)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lsoaresp@redhat.com>)
 id 1mLggw-0006oi-O2
 for qemu-devel@nongnu.org; Thu, 02 Sep 2021 02:59:20 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1630565956;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=0ADNp+MCOhKpmtZUPNZlyxPjlMmWnQ0gaJud9s3DhNQ=;
 b=Jet+CISetjPtMkce32qwCwDaoMVUoTn9+f/xnd7SMo/qOW28CZ58IC5z7TpFpJKp7pLeIV
 SJLDoSpyrHwfPSDi4VH0XA7oWfR0rejiRVIgC3wS8dJLqKz/6tg+7c5Xkq8SWdF6xudZ3f
 siJ43nDKg5l4Um4tL8hC41nyGR/38sU=
Received: from mail-lj1-f199.google.com (mail-lj1-f199.google.com
 [209.85.208.199]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-122-_82gLDMvNBeYGL3Ug27S8g-1; Thu, 02 Sep 2021 02:59:16 -0400
X-MC-Unique: _82gLDMvNBeYGL3Ug27S8g-1
Received: by mail-lj1-f199.google.com with SMTP id
 y6-20020a05651c154600b001c30dac7e87so271477ljp.8
 for <qemu-devel@nongnu.org>; Wed, 01 Sep 2021 23:59:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=0ADNp+MCOhKpmtZUPNZlyxPjlMmWnQ0gaJud9s3DhNQ=;
 b=hdw8YNei1ci8HuufWe/z7KebYs9Nwptn5ON2N/ZFLqkVbMxKZAqC54CHaGCxqBrQKS
 8evqpJD+R98TeVgHOsJZGv4rA9ERqqw4TqUQCM8eUvA+YrspNnO4qdMOMJt1DeLN9oHE
 nF65ATcBwD108r5X/Um2uXjqegDrZMAoQPTXIFJXIHo4CL//ttD7Oaf3avF3zgdOUC4x
 5A82Z+SErxkONzThf8zgzwt56UPIMH71Z5GJtYEtxqMkP3tOju5Nd8KwGiP9dvoPYSIW
 ElmjNbXdeY/g/2l0NKF8PG13/XOlNNwoLKGWP5U0ucMFu9hdWTVxrJ521LYcTZ7Yvvr+
 8m/g==
X-Gm-Message-State: AOAM533KYvaiRhFtHQfgjplUd1grMzVnSFxKKu2c8KEu2IRyWfc6mTvo
 A1gnY0S+ICv1ivr24aucsNFNHos5bidWiGMBS+nNqe/5Z6go8bDig2JumXf6DceErHnLL4TWtlk
 jMMqdMCK+/y5+6AKDmp8Ze7WbsbMoMk0=
X-Received: by 2002:a2e:b4a1:: with SMTP id q1mr1264442ljm.221.1630565954532; 
 Wed, 01 Sep 2021 23:59:14 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxVxPVlD61gQINhEapzpnCVCrCOQO7erVKRYzolDxvCBJMJ7+DrZkq+7EVzOjh6Uiq0ViIRupvlbPhrfPXXs/c=
X-Received: by 2002:a2e:b4a1:: with SMTP id q1mr1264409ljm.221.1630565954084; 
 Wed, 01 Sep 2021 23:59:14 -0700 (PDT)
MIME-Version: 1.0
References: <20210831110238.299458-1-leobras@redhat.com>
 <20210831110238.299458-3-leobras@redhat.com>
 <YS4nPfEBCy9IC3rd@redhat.com> <YS6QmOrN4qr055vR@t490s>
In-Reply-To: <YS6QmOrN4qr055vR@t490s>
From: Leonardo Bras Soares Passos <leobras@redhat.com>
Date: Thu, 2 Sep 2021 03:59:25 -0300
Message-ID: <CAJ6HWG72311UK9Nvh+JDw-zo1Days0u8N_QHbeGGdfKR+hALCA@mail.gmail.com>
Subject: Re: [PATCH v1 2/3] io: Add zerocopy and errqueue
To: Peter Xu <peterx@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=lsoaresp@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=lsoaresp@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.392,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Elena Ufimtseva <elena.ufimtseva@oracle.com>,
 John G Johnson <john.g.johnson@oracle.com>,
 Jagannathan Raman <jag.raman@oracle.com>, qemu-block@nongnu.org,
 Juan Quintela <quintela@redhat.com>, qemu-devel <qemu-devel@nongnu.org>,
 =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>,
 Fam Zheng <fam@euphon.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Thanks for this feedback Peter!

I ended up reading/replying the e-mails in thread order, so I may have
been redundant
with your argument, sorry about that.

I will add my comments inline, but I will add references to the
previous mail I sent
Daniel, so please read it too.

On Tue, Aug 31, 2021 at 5:27 PM Peter Xu <peterx@redhat.com> wrote:
[snip]
> >
> > I can't see how we can introduce MSG_ZEROCOPY in any seemless
> > way. The buffer lifetime requirements imply need for an API
> > design that is fundamentally different for asynchronous usage,
> > with a callback to notify when the write has finished/failed.
>
> Regarding buffer reuse - it indeed has a very deep implication on the buffer
> being available and it's not obvious at all.  Just to mention that the initial
> user of this work will make sure all zero copy buffers will be guest pages only
> (as it's only used in multi-fd), so they should always be there during the
> process.

Thanks for pointing that out, what's what I had in mind at the time.

>
> I think asking for a complete design still makes sense.

Agree, since I am touching QIOChannel, it makes sense to make it work for
other code that uses it too, not only our case.

>  E.g., for precopy
> before we flush device states and completes the migration, we may want to at
> least have a final ack on all the zero-copies of guest pages to guarantee they
> are flushed.
>
> IOW, we need to make sure the last piece of migration stream lands after the
> guest pages so that the dest VM will always contain the latest page data when
> dest VM starts.  So far I don't see how current code guaranteed that.
>
> In short, we may just want to at least having a way to make sure all zero
> copied buffers are finished using and they're sent after some function returns
> (e.g., qio_channel_flush()).  That may require us to do some accounting on when
> we called sendmsg(MSG_ZEROCOPY), meanwhile we should need to read out the
> ee_data field within SO_EE_ORIGIN_ZEROCOPY msg when we do recvmsg() for the
> error queue and keep those information somewhere too.

Yeah, that's correct.
I haven't fully studied what the returned data represents, but I
suppose this could be
a way to fix that. In my previous reply to Daniel I pointed out a way
we may achieve
a flush behavior with poll() too, but it could be a little hacky.

>
> Some other side notes that reached my mind..
>
> The qio_channel_writev_full() may not be suitable for async operations, as the
> name "full" implies synchronous to me.  So maybe we can add a new helper for
> zero copy on the channel?
>
> We may also want a new QIOChannelFeature as QIO_CHANNEL_FEATURE_ZEROCOPY, then
> we fail qio_channel_writv_zerocopy() (or whatever name we come up with) if that
> bit is not set in qio channel features.

I also suggested something like that, but I thought it could be good if we could
fall back to io_writev() if we didn't have the zerocopy feature (or
the async feature).

What do you think?

>
> Thanks,
>
> --
> Peter Xu
>

I really appreciate your suggestions, thanks Peter!

Best regards,
Leonardo


