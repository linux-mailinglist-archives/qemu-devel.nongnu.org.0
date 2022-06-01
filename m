Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DC44153A7B5
	for <lists+qemu-devel@lfdr.de>; Wed,  1 Jun 2022 16:03:10 +0200 (CEST)
Received: from localhost ([::1]:55292 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nwOwI-0004ZR-0A
	for lists+qemu-devel@lfdr.de; Wed, 01 Jun 2022 10:03:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40176)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1nwOrd-0001WG-Qv
 for qemu-devel@nongnu.org; Wed, 01 Jun 2022 09:58:21 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:24295)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1nwOrX-0005eB-FL
 for qemu-devel@nongnu.org; Wed, 01 Jun 2022 09:58:16 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1654091894;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=JqdnPVvlS3aXddE/MoykgsZrPmdQS3f5KA1vvhCxnNA=;
 b=TkEZxR6K9AkdPBnuHbVdZ1fuqL+XVN2l/mFcAxER3O8ZFTtfUMiFYq8ExiDXOA9CYaAkOC
 suxRsKUxVAUPwRdsCWECnXvspYzicAHM7iggUFdYJeNVEP40sDFoA+7ABdi4RgNimd1gdf
 L0gOslRUWzJJ3+owBTG9IAyFMy6AJ8U=
Received: from mail-il1-f200.google.com (mail-il1-f200.google.com
 [209.85.166.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-528-NOa1--6_NA6veDdOuprMaA-1; Wed, 01 Jun 2022 09:58:13 -0400
X-MC-Unique: NOa1--6_NA6veDdOuprMaA-1
Received: by mail-il1-f200.google.com with SMTP id
 x5-20020a923005000000b002d1a91c4d13so1238562ile.4
 for <qemu-devel@nongnu.org>; Wed, 01 Jun 2022 06:58:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=JqdnPVvlS3aXddE/MoykgsZrPmdQS3f5KA1vvhCxnNA=;
 b=t0pMbLIcoHIdTEe45fCkb6k/MibqAp+CR7/NDgLIWWLjGjqkjRXyUbkaxl4B+uE7iF
 H85QP7twDgV5IOGx11bl0U6xExUbHgdxnjmG43NJHof6lst7sPb5OgoZX6s5wBJmTpNJ
 0EwE6ApF1Cze0/Qttbkc5Ni7yUqRayrEPobDqObd96V84+NXZADvZu8fi6ngx/18//dt
 w9pHOeqHGX1LqtVfoEHn08ugLTpDObS7QX0G5V6fSdhhK2e+/15BijvrPmHFisVNtMKj
 aO3dJlMKgOGoQdfm/8tEST3Ed6ZY3ZW6rlG+N5rDkmKmV15FtB115IWgE7tTo6Fn2Rbo
 la7g==
X-Gm-Message-State: AOAM530GizkSEstWGHvxYI1v9d6gcyX6xSioC039sHY5wQsc2YH+hIQs
 d1Bb/lp05bGiDnrCeF2ayoY2QXtHa6t0cAzLokP+UUeiZy7f8dq8bg0Vl9g5I6Olru934L13qNe
 14a+7nwOYletKSCQ=
X-Received: by 2002:a02:cb51:0:b0:32e:b80e:d40a with SMTP id
 k17-20020a02cb51000000b0032eb80ed40amr1147jap.241.1654091892074; 
 Wed, 01 Jun 2022 06:58:12 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwTFpr4zJVr1KH2KLojhxz1WAI6i3JGwubUvnruGLzhDw7X6SFSln4dCLIHxlSfw7IUFYqdsw==
X-Received: by 2002:a02:cb51:0:b0:32e:b80e:d40a with SMTP id
 k17-20020a02cb51000000b0032eb80ed40amr1128jap.241.1654091891754; 
 Wed, 01 Jun 2022 06:58:11 -0700 (PDT)
Received: from xz-m1.local
 (cpec09435e3e0ee-cmc09435e3e0ec.cpe.net.cable.rogers.com. [99.241.198.116])
 by smtp.gmail.com with ESMTPSA id
 n12-20020a02cc0c000000b0032e42cd4274sm480168jap.89.2022.06.01.06.58.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 01 Jun 2022 06:58:11 -0700 (PDT)
Date: Wed, 1 Jun 2022 09:58:08 -0400
From: Peter Xu <peterx@redhat.com>
To: =?utf-8?B?5b6Q6Zev?= <xuchuangxclwt@bytedance.com>,
 Leonardo Bras Soares Passos <lsoaresp@redhat.com>
Cc: Leonardo Bras <leobras@redhat.com>, qemu-devel@nongnu.org,
 qemu-block@nongnu.org, Fam Zheng <fam@euphon.net>,
 Markus Armbruster <armbru@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Eric Blake <eblake@redhat.com>, Juan Quintela <quintela@redhat.com>,
 Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>,
 John G Johnson <john.g.johnson@oracle.com>,
 Jagannathan Raman <jag.raman@oracle.com>,
 Elena Ufimtseva <elena.ufimtseva@oracle.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?utf-8?Q?Marc-Andr=C3=A9?= Lureau <marcandre.lureau@redhat.com>,
 lizefan.x@bytedance.com, zhouyibo@bytedance.com
Subject: Re: [External] [PATCH v13 3/8] QIOChannelSocket: Implement io_writev
 zero copy flag & io_flush for CONFIG_LINUX
Message-ID: <YpdwcHu7I8dGDimt@xz-m1.local>
References: <20220513062836.965425-1-leobras@redhat.com>
 <20220513062836.965425-4-leobras@redhat.com>
 <b2fae41c-7f47-9bf1-21b9-1b123818a262@bytedance.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <b2fae41c-7f47-9bf1-21b9-1b123818a262@bytedance.com>
Received-SPF: pass client-ip=170.10.133.124; envelope-from=peterx@redhat.com;
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Jun 01, 2022 at 05:37:10PM +0800, 徐闯 wrote:
> 
> On 2022/5/13 下午2:28, Leonardo Bras wrote:
> > For CONFIG_LINUX, implement the new zero copy flag and the optional callback
> > io_flush on QIOChannelSocket, but enables it only when MSG_ZEROCOPY
> > feature is available in the host kernel, which is checked on
> > qio_channel_socket_connect_sync()
> > 
> > qio_channel_socket_flush() was implemented by counting how many times
> > sendmsg(...,MSG_ZEROCOPY) was successfully called, and then reading the
> > socket's error queue, in order to find how many of them finished sending.
> > Flush will loop until those counters are the same, or until some error occurs.
> > 
> > Notes on using writev() with QIO_CHANNEL_WRITE_FLAG_ZERO_COPY:
> > 1: Buffer
> > - As MSG_ZEROCOPY tells the kernel to use the same user buffer to avoid copying,
> > some caution is necessary to avoid overwriting any buffer before it's sent.
> > If something like this happen, a newer version of the buffer may be sent instead.
> > - If this is a problem, it's recommended to call qio_channel_flush() before freeing
> > or re-using the buffer.
> > 
> > 2: Locked memory
> > - When using MSG_ZERCOCOPY, the buffer memory will be locked after queued, and
> > unlocked after it's sent.
> > - Depending on the size of each buffer, and how often it's sent, it may require
> > a larger amount of locked memory than usually available to non-root user.
> > - If the required amount of locked memory is not available, writev_zero_copy
> > will return an error, which can abort an operation like migration,
> > - Because of this, when an user code wants to add zero copy as a feature, it
> > requires a mechanism to disable it, so it can still be accessible to less
> > privileged users.
> > 
> > Signed-off-by: Leonardo Bras <leobras@redhat.com>
> > Reviewed-by: Peter Xu <peterx@redhat.com>
> > Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>
> > Reviewed-by: Juan Quintela <quintela@redhat.com>
> > ---
> >   include/io/channel-socket.h |   2 +
> >   io/channel-socket.c         | 116 ++++++++++++++++++++++++++++++++++--
> >   2 files changed, 114 insertions(+), 4 deletions(-)
> > 
> > diff --git a/include/io/channel-socket.h b/include/io/channel-socket.h
> > index e747e63514..513c428fe4 100644
> > --- a/include/io/channel-socket.h
> > +++ b/include/io/channel-socket.h
> > @@ -47,6 +47,8 @@ struct QIOChannelSocket {
> >       socklen_t localAddrLen;
> >       struct sockaddr_storage remoteAddr;
> >       socklen_t remoteAddrLen;
> > +    ssize_t zero_copy_queued;
> > +    ssize_t zero_copy_sent;
> >   };
> Hi, Leonardo. I'm also paying attention to the application of MSG_ZEROCOPY
> in live migration recently. I noticed that you defined a member
> `zero_copy_queued` in the struct QIOChannelSocket, but I can't find out
> where the value of this member has been changed in your patch. Can you
> answer it for me?
> 

Good point.. it should probably be increased when queuing the pages. We'd
better fix it up or it seems the flush() will be literally an no-op..

Two things in qio_channel_socket_flush() we can do to make sure it'll work
as expected, imo:

  1) make ret=-1 as initial value, rather than 1 - we only check negative
     errors in the caller so we could have missed a positive "1"

  2) add a tracepoint into the loop of updating zero_copy_sent

Leo, what's your take?

Thanks,

-- 
Peter Xu


