Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 55A4B543D91
	for <lists+qemu-devel@lfdr.de>; Wed,  8 Jun 2022 22:26:47 +0200 (CEST)
Received: from localhost ([::1]:52608 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nz2GM-0000Kj-Du
	for lists+qemu-devel@lfdr.de; Wed, 08 Jun 2022 16:26:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48606)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1nz2Eu-00075Z-Iv
 for qemu-devel@nongnu.org; Wed, 08 Jun 2022 16:25:17 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:57896)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1nz2Es-0006r7-Uj
 for qemu-devel@nongnu.org; Wed, 08 Jun 2022 16:25:16 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1654719914;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=zGfL9ny4RiCmnlA12CHYHFv+SWQjk5YKMrSISL+6Lk8=;
 b=fGTbl+5qIOsY4h9dIsWNgCNoAdC1jGi7Tw0y5ol/lbRfs+QZRUl7vIjSNneLq1FS+afBV+
 quSNsGvru1K4W44WW/UTdsXJqe8RUY6tifp7Lc+vR8K13OfE0Q6TaEkyf8s7igNu2q2LtR
 CLq8RaSDqJGPFFxW+0mFEuocSV31osE=
Received: from mail-il1-f200.google.com (mail-il1-f200.google.com
 [209.85.166.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-401-F36hlKYBNY6bdbrR--Q4Mw-1; Wed, 08 Jun 2022 16:25:13 -0400
X-MC-Unique: F36hlKYBNY6bdbrR--Q4Mw-1
Received: by mail-il1-f200.google.com with SMTP id
 p12-20020a056e02144c00b002d196a4d73eso16358715ilo.18
 for <qemu-devel@nongnu.org>; Wed, 08 Jun 2022 13:25:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=zGfL9ny4RiCmnlA12CHYHFv+SWQjk5YKMrSISL+6Lk8=;
 b=V0b32a27pKKZjI/FgbL/6ZaqH1j5b1CPBy9ig7v+G8C9JZzEPbYlodKC5ZMIsy13cm
 TLbYTrR8U/FfrkafuNQMqlqLBWVMsXVzt/KRH0NMi3YCP1dy3VA45HGyC6tmXX+Ouxqd
 D17GUYnOzvu1wr+TqK/7cglg+mIs2bUNcUwOKG5KQySCtrhDXBk48Is8cjIhi2TueFA9
 zorHb0iUYiiYiJ19mh5p0fvoOskm1t0laPs3iZDjp/7Bx0rCcVHNfJebE+lFpb6BseMl
 EOA0V/5VlGq3kfbbzwgsd8lufXSnnDUUtD85X/oj+mIbVqLguZDxJ8SDdL87AdKW05nd
 BGdw==
X-Gm-Message-State: AOAM531QXunuL3kEqGtUjdSDvHJCL6HPBmnizTsNfIY0YBddcuIp9Ui1
 wi7Pza25wSsbM2ya5Q5UBACQZrnjr3JABmtLwrDd4YfUGe+j7JPcwvV3E9mrthVisp1mUKg+iy2
 YIgzb+5Xxas00AOo=
X-Received: by 2002:a05:6e02:194d:b0:2d5:ef3:999e with SMTP id
 x13-20020a056e02194d00b002d50ef3999emr14182541ilu.192.1654719911956; 
 Wed, 08 Jun 2022 13:25:11 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzOrqR+OBfyBEUCwxew+zbF6nMisYszw2BZLz1aiQiXs0eEO9cx6TPexdKJhIR19giqKDCdrg==
X-Received: by 2002:a05:6e02:194d:b0:2d5:ef3:999e with SMTP id
 x13-20020a056e02194d00b002d50ef3999emr14182525ilu.192.1654719911712; 
 Wed, 08 Jun 2022 13:25:11 -0700 (PDT)
Received: from xz-m1.local
 (cpec09435e3e0ee-cmc09435e3e0ec.cpe.net.cable.rogers.com. [99.241.198.116])
 by smtp.gmail.com with ESMTPSA id
 j21-20020a5e9b15000000b006657621fecesm8266836iok.55.2022.06.08.13.25.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 08 Jun 2022 13:25:11 -0700 (PDT)
Date: Wed, 8 Jun 2022 16:25:09 -0400
From: Peter Xu <peterx@redhat.com>
To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
Cc: Leonardo Bras <leobras@redhat.com>, qemu-devel@nongnu.org,
 =?utf-8?B?5b6Q6Zev?= <xuchuangxclwt@bytedance.com>
Subject: Re: [PATCH v1 1/1] QIOChannelSocket: Fix zero-copy send so socket
 flush works
Message-ID: <YqEFpYdnDoIiQdz/@xz-m1.local>
References: <20220608181808.79364-1-leobras@redhat.com>
 <YqDuk+ZCwMdXRXBH@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <YqDuk+ZCwMdXRXBH@redhat.com>
Received-SPF: pass client-ip=170.10.129.124; envelope-from=peterx@redhat.com;
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

On Wed, Jun 08, 2022 at 07:46:43PM +0100, Daniel P. Berrangé wrote:
> On Wed, Jun 08, 2022 at 03:18:09PM -0300, Leonardo Bras wrote:
> > Somewhere between v6 and v7 the of the zero-copy-send patchset a crucial
> > part of the flushing mechanism got missing: incrementing zero_copy_queued.
> > 
> > Without that, the flushing interface becomes a no-op, and there is no
> > garantee the buffer is really sent.
> > 
> > This can go as bad as causing a corruption in RAM during migration.
> > 
> > Fixes: 2bc58ffc2926 ("QIOChannelSocket: Implement io_writev zero copy flag & io_flush for CONFIG_LINUX")
> > Reported-by: 徐闯 <xuchuangxclwt@bytedance.com>
> > Signed-off-by: Leonardo Bras <leobras@redhat.com>
> > ---
> >  io/channel-socket.c | 11 ++++++++---
> >  1 file changed, 8 insertions(+), 3 deletions(-)
> > 
> > diff --git a/io/channel-socket.c b/io/channel-socket.c
> > index dc9c165de1..ca4cae930f 100644
> > --- a/io/channel-socket.c
> > +++ b/io/channel-socket.c
> > @@ -554,6 +554,7 @@ static ssize_t qio_channel_socket_writev(QIOChannel *ioc,
> >      size_t fdsize = sizeof(int) * nfds;
> >      struct cmsghdr *cmsg;
> >      int sflags = 0;
> > +    bool zero_copy_enabled = false;
> >  
> >      memset(control, 0, CMSG_SPACE(sizeof(int) * SOCKET_MAX_FDS));
> >  
> > @@ -581,6 +582,7 @@ static ssize_t qio_channel_socket_writev(QIOChannel *ioc,
> >  #ifdef QEMU_MSG_ZEROCOPY
> >      if (flags & QIO_CHANNEL_WRITE_FLAG_ZERO_COPY) {
> >          sflags = MSG_ZEROCOPY;
> > +        zero_copy_enabled = true;
> >      }
> >  #endif
> >  
> > @@ -592,21 +594,24 @@ static ssize_t qio_channel_socket_writev(QIOChannel *ioc,
> >              return QIO_CHANNEL_ERR_BLOCK;
> >          case EINTR:
> >              goto retry;
> > -#ifdef QEMU_MSG_ZEROCOPY
> 
> Removing this ifdef appears incidental to the change. If this is
> redundant just remove it in its own patch.
> 
> >          case ENOBUFS:
> > -            if (sflags & MSG_ZEROCOPY) {
> > +            if (zero_copy_enabled) {
> >                  error_setg_errno(errp, errno,
> >                                   "Process can't lock enough memory for using MSG_ZEROCOPY");
> >                  return -1;
> >              }
> >              break;
> > -#endif
> >          }
> >  
> >          error_setg_errno(errp, errno,
> >                           "Unable to write to socket");
> >          return -1;
> >      }
> > +
> > +    if (zero_copy_enabled) {
> 
> What's wrong with
> 
>    if (flags & QIO_CHANNEL_WRITE_FLAG_ZERO_COPY) {
>         sioc->zero_copy_queued++;
>     }
> 
> 
> Introducing another local variable doesn't really add value IMHO.

One benefit of having that variable is we setup zero_copy_enabled once in
the #ifdef and the rest code can avoid wrapping with the macro.  From that
pov the patch looks okay to me.  Thanks,

-- 
Peter Xu


