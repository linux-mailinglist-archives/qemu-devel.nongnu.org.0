Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3019C4449C5
	for <lists+qemu-devel@lfdr.de>; Wed,  3 Nov 2021 21:51:07 +0100 (CET)
Received: from localhost ([::1]:53866 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1miNDr-00078y-Se
	for lists+qemu-devel@lfdr.de; Wed, 03 Nov 2021 16:51:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37492)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lsoaresp@redhat.com>)
 id 1miND1-0006Uj-Ne
 for qemu-devel@nongnu.org; Wed, 03 Nov 2021 16:50:11 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:43607)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lsoaresp@redhat.com>)
 id 1miNCy-0007Q9-O5
 for qemu-devel@nongnu.org; Wed, 03 Nov 2021 16:50:10 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1635972606;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=yFqPw+kNaj7RLZ3O/hTwrIaECNfdkpXDmTVpqhqP+6A=;
 b=iMtty0yTFZzeaaAbuSwbNBYFukN8y1wCZdPAY/TtyFgmu1Hj/achdOcmwwYG8zEN5arVES
 ZQo8caj+7w12ESDWLxSr5klCBamA0TuaA/Kqane8OkxAAuXQXFevV0MvwAY5TrO0I4MlTe
 njLIGtI1uQ2YlTOsdtDP+LQfAsgsmw0=
Received: from mail-lf1-f69.google.com (mail-lf1-f69.google.com
 [209.85.167.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-481-n9Tx0eciP-CHZU43YQYUCw-1; Wed, 03 Nov 2021 16:50:05 -0400
X-MC-Unique: n9Tx0eciP-CHZU43YQYUCw-1
Received: by mail-lf1-f69.google.com with SMTP id
 r10-20020ac25c0a000000b004017ded5edeso764627lfp.17
 for <qemu-devel@nongnu.org>; Wed, 03 Nov 2021 13:50:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=yFqPw+kNaj7RLZ3O/hTwrIaECNfdkpXDmTVpqhqP+6A=;
 b=Xu9fVMCI8KqrpOoKY03LbjAXZMKPo+khS1EV4tWTxe50u5oRBrINkwMd4Nf8Dwha/G
 swZrZE8PJxPZ2pxoXF/eFemArfZSeSiC3OCekLMAyNGxj7JxZEG3jQByrd+PEBVCVSee
 qehIWTNAUPK9z5yDYLAMo97qrfyFpl9q1OqiMGePJorUDslEIWnFlO5h4cYROCnPDV2t
 wtJ4/0vV27X9f/BE6Ngk2tnbj14hLpI7Nfd3cgYQXeGVY8boLSOJIINdC5ciBuxIZoY1
 WcoGIPDtqvAIowgDFTXH9o8ZD/q05kNS2SP11pNy26X/YpwRKBYOCN413xv3glxmv+kB
 4sog==
X-Gm-Message-State: AOAM533RQvcWkPhDijsssfhseyntzfZZ75XqxF3mQA51OfQJTR3Cbtda
 7cB3zt+l2zXihrlVK3QYFxPWf3WF6z289mbB2Dl3DdZRtyMdlRMKdXMDgD96kjjpWgG+w7R5BL8
 9diU6R0qb+W3oAtjpAKlCqi1lsmU8AfM=
X-Received: by 2002:a2e:9a55:: with SMTP id k21mr47461421ljj.318.1635972604301; 
 Wed, 03 Nov 2021 13:50:04 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJz43lVzHCT12dhMcCnAhRnK3RYIi8ySLC4l1j+PR1aKV5fc9+7Zw2+UFFdZ4336uUX6rHvI449gn3+jRU/59oc=
X-Received: by 2002:a2e:9a55:: with SMTP id k21mr47461385ljj.318.1635972603996; 
 Wed, 03 Nov 2021 13:50:03 -0700 (PDT)
MIME-Version: 1.0
References: <20211009075612.230283-1-leobras@redhat.com>
 <20211009075612.230283-3-leobras@redhat.com>
 <87o872k8et.fsf@secure.mitica>
In-Reply-To: <87o872k8et.fsf@secure.mitica>
From: Leonardo Bras Soares Passos <leobras@redhat.com>
Date: Wed, 3 Nov 2021 17:50:13 -0300
Message-ID: <CAJ6HWG7g+5vEZGPLDCBLGqgSbaDmeS6MAeYwZfnJNXsqmhgA6Q@mail.gmail.com>
Subject: Re: [PATCH v4 2/3] QIOChannelSocket: Implement io_writev_zerocopy &
 io_flush_zerocopy for CONFIG_LINUX
To: Juan Quintela <quintela@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=lsoaresp@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=lsoaresp@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.717,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>,
 qemu-devel <qemu-devel@nongnu.org>, Jason Wang <jasowang@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>, Peter Xu <peterx@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, Eric Blake <eblake@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Nov 2, 2021 at 10:13 AM Juan Quintela <quintela@redhat.com> wrote:
>
> Leonardo Bras <leobras@redhat.com> wrote:
> > For CONFIG_LINUX, implement the new optional callbacks io_write_zerocopy and
> > io_flush_zerocopy on QIOChannelSocket, but enables it only when MSG_ZEROCOPY
> > feature is available in the host kernel, which is checked on
> > qio_channel_socket_connect_sync()
> >
> > qio_channel_socket_writev() contents were moved to a helper function
> > qio_channel_socket_writev_flags() which accepts an extra argument for flags.
> > (This argument is passed directly to sendmsg().
> >
> > The above helper function is used to implement qio_channel_socket_writev(),
> > with flags = 0, keeping it's behavior unchanged, and
> > qio_channel_socket_writev_zerocopy() with flags = MSG_ZEROCOPY.
> >
> > qio_channel_socket_flush_zerocopy() was implemented by counting how many times
> > sendmsg(...,MSG_ZEROCOPY) was sucessfully called, and then reading the
> > socket's error queue, in order to find how many of them finished sending.
> > Flush will loop until those counters are the same, or until some error ocurs.
> >
> > A new function qio_channel_socket_poll() was also created in order to avoid
> > busy-looping recvmsg() in qio_channel_socket_flush_zerocopy() while waiting for
> > updates in socket's error queue.
> >
> > Notes on using writev_zerocopy():
> > 1: Buffer
> > - As MSG_ZEROCOPY tells the kernel to use the same user buffer to avoid copying,
> > some caution is necessary to avoid overwriting any buffer before it's sent.
> > If something like this happen, a newer version of the buffer may be sent instead.
> > - If this is a problem, it's recommended to call flush_zerocopy() before freeing
> > or re-using the buffer.
> >
> > 2: Locked memory
> > - When using MSG_ZERCOCOPY, the buffer memory will be locked after queued, and
> > unlocked after it's sent.
> > - Depending on the size of each buffer, and how often it's sent, it may require
> > a larger amount of locked memory than usually available to non-root user.
> > - If the required amount of locked memory is not available, writev_zerocopy
> > will return an error, which can abort an operation like migration,
> > - Because of this, when an user code wants to add zerocopy as a feature, it
> > requires a mechanism to disable it, so it can still be acessible to less
> > privileged users.
> >
> > Signed-off-by: Leonardo Bras <leobras@redhat.com>
>
> I think this patch would be easier to review if you split in:
> - add the flags parameter left and right
> - add the meat of what you do with the flags.

ok, I will try to split it like this.

>
> > +++ b/include/io/channel-socket.h
> > @@ -47,6 +47,8 @@ struct QIOChannelSocket {
> >      socklen_t localAddrLen;
> >      struct sockaddr_storage remoteAddr;
> >      socklen_t remoteAddrLen;
> > +    ssize_t zerocopy_queued;
> > +    ssize_t zerocopy_sent;
>
> I am not sure if this is good/bad to put it inside
>
> #ifdef CONFIG_LINUX
>
> basically everything else uses it.

I think it makes sense that zerocopy_{sent,queued} is inside
CONFIG_LINUX as no one else is using zerocopy.

>
> > +#ifdef CONFIG_LINUX
> > +    ret = qemu_setsockopt(fd, SOL_SOCKET, SO_ZEROCOPY, &v, sizeof(v));
> > +    if (ret < 0) {
> > +        /* Zerocopy not available on host */
> > +        return 0;
> > +    }
> > +
> > +    qio_channel_set_feature(QIO_CHANNEL(ioc),
> > +                            QIO_CHANNEL_FEATURE_WRITE_ZEROCOPY);
>
> As Peter said, you shouldn't fail if the feature is not there.
>
> But on the other hand, on patch 3, you don't check that this feature
> exist when you allow to enable multifd_zerocopy.

This had a major rework on v5, but I will make sure this suggestion is
addressed before releasing it.

>
> > +#endif
> > +
> >      return 0;
> >  }
>
>
> >          error_setg_errno(errp, errno,
> >                           "Unable to write to socket");
>
> Why do you split this in two lines?
>
> Yes, I know that this file is not consistent either on how the do with
> this, sometimes one line, otherwise more.

IIUC, this lines have no '+' in them, so they are not my addition.

>
> I don't know how ZEROCPY works at kernel level to comment on rest of the
> patch.
>
> Later, Juan.

Thanks for reviewing Juan.

Best regards,
Leo


