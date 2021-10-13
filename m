Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 52DFC42B684
	for <lists+qemu-devel@lfdr.de>; Wed, 13 Oct 2021 08:11:17 +0200 (CEST)
Received: from localhost ([::1]:39430 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1maXTw-0007kZ-D1
	for lists+qemu-devel@lfdr.de; Wed, 13 Oct 2021 02:11:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60878)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1maXQG-0002zj-9b
 for qemu-devel@nongnu.org; Wed, 13 Oct 2021 02:07:28 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:49312)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1maXQC-0003o0-HK
 for qemu-devel@nongnu.org; Wed, 13 Oct 2021 02:07:26 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1634105242;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=hjQu3i9Zp9ZR59RwOWlL8g9A/qBCnVKXVGKnskU1tWQ=;
 b=OqYPwTYoQvxZw8sg1+WP7IDhTUAhHCBRLr8hF491efHQCngRv3wxPY3z55kjyLmjdaGEvH
 o0HnI1oco9rRROKX88/wLi7CE+P0fzpmTPcLBFST5+8M0svuJ3qVZWNxKF8s1EOuAz2g3U
 6gIIrbSNzcz26UeaEl3U9M+Z3Btw1ps=
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com
 [209.85.215.199]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-78-aIZXGDt2PiiDN_5t3CAuzQ-1; Wed, 13 Oct 2021 02:07:21 -0400
X-MC-Unique: aIZXGDt2PiiDN_5t3CAuzQ-1
Received: by mail-pg1-f199.google.com with SMTP id
 m14-20020a63fd4e000000b00287791fb324so907415pgj.7
 for <qemu-devel@nongnu.org>; Tue, 12 Oct 2021 23:07:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=hjQu3i9Zp9ZR59RwOWlL8g9A/qBCnVKXVGKnskU1tWQ=;
 b=sgecFbyf4Nxz2QcpNRY1T3QaBjo82WiWZO49ax6nVgQoX/6ESgY0gr942PfbgkQTdS
 9GzfaP3OgK2ojI+FNW0zUJAsk8yU8Nh44ohgCwEBaosfu2fPcF6yHk4wYj8FWWk2onAb
 CbZBEM8Jnc6HtCI+7vfC5asKGn/dsGER0LdvB5XJ/plAkvpMbfkyOqp+AkTckckg1Pw2
 AwwCMWqbohpGPezVVcBCjP2w5tihHe7yOBI5s9Mlq7ovVqzdwkohkMUQLi/9HOqwb2jj
 MJeEAhZSQHRii90NW4F4RR2epMcLRnxU2lqKUFA9S5vEgB4t7xvzk6BHTSwqwerazjAK
 04ow==
X-Gm-Message-State: AOAM5325BIsiOSrx4IuOeJb2BDQFwXsdNfvtF5tCS7pX1ZLkkHHCfkLE
 NyTizkA+YblkGz7ujwEsjTFBWxZAiT93QdrTpZG9CEru4Ec4RFrOliwcbcAIaL9WXLRiL2ttQqO
 ZQ6pYC5J0QiDCzUw=
X-Received: by 2002:aa7:9563:0:b0:44c:9261:3d86 with SMTP id
 x3-20020aa79563000000b0044c92613d86mr36281690pfq.44.1634105240280; 
 Tue, 12 Oct 2021 23:07:20 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwO45U5qzSu5GSNx7GzrNQfuOSoUVZxlbdDMtZqSY+2YBHXCLWlezIvqnVHGoPfSTwA+EmYPw==
X-Received: by 2002:aa7:9563:0:b0:44c:9261:3d86 with SMTP id
 x3-20020aa79563000000b0044c92613d86mr36281665pfq.44.1634105239881; 
 Tue, 12 Oct 2021 23:07:19 -0700 (PDT)
Received: from t490s ([209.132.188.80])
 by smtp.gmail.com with ESMTPSA id g11sm13242440pgn.41.2021.10.12.23.07.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 12 Oct 2021 23:07:19 -0700 (PDT)
Date: Wed, 13 Oct 2021 14:07:13 +0800
From: Peter Xu <peterx@redhat.com>
To: Leonardo Bras <leobras@redhat.com>
Subject: Re: [PATCH v4 1/3] QIOChannel: Add io_writev_zerocopy &
 io_flush_zerocopy callbacks
Message-ID: <YWZ3kbsbUmCyr6Ot@t490s>
References: <20211009075612.230283-1-leobras@redhat.com>
 <20211009075612.230283-2-leobras@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20211009075612.230283-2-leobras@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=peterx@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=peterx@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.049,
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
Cc: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>,
 Juan Quintela <quintela@redhat.com>, qemu-devel@nongnu.org,
 Jason Wang <jasowang@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, Eric Blake <eblake@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Sat, Oct 09, 2021 at 04:56:11AM -0300, Leonardo Bras wrote:
> -int qio_channel_writev_full_all(QIOChannel *ioc,
> -                                const struct iovec *iov,
> -                                size_t niov,
> -                                int *fds, size_t nfds,
> -                                Error **errp)
> +int qio_channel_writev_full_all_flags(QIOChannel *ioc,
> +                                      const struct iovec *iov,
> +                                      size_t niov,
> +                                      int *fds, size_t nfds,
> +                                      int flags, Error **errp)
>  {
>      int ret = -1;
>      struct iovec *local_iov = g_new(struct iovec, niov);
> @@ -237,8 +250,8 @@ int qio_channel_writev_full_all(QIOChannel *ioc,
>  
>      while (nlocal_iov > 0) {
>          ssize_t len;
> -        len = qio_channel_writev_full(ioc, local_iov, nlocal_iov, fds, nfds,
> -                                      errp);
> +        len = qio_channel_writev_full_flags(ioc, local_iov, nlocal_iov, fds, nfds,
> +                                          flags, errp);

IMHO we can keep qio_channel_writev_full() untouched, as it is the wrapper for
io_writev() hook right now (and it allows taking fds).  Then here instead of
adding a new flags into it, we can introduce qio_channel_writev_zerocopy_full()
and directly call here:

           if (flags & ZEROCOPY) {
               assert(fds == NULL && nfds == 0);
               qio_channel_writev_zerocopy_full(...[no fds passing in]);
           } else {
               qio_channel_writev_full(...[with all parameters]);
           }

Then qio_channel_writev_zerocopy_full() should be simplely the wrapper for the
new io_writev_zerocopy() hook.

>          if (len == QIO_CHANNEL_ERR_BLOCK) {
>              if (qemu_in_coroutine()) {
>                  qio_channel_yield(ioc, G_IO_OUT);
> @@ -474,6 +487,31 @@ off_t qio_channel_io_seek(QIOChannel *ioc,
>  }
>  
>  
> +ssize_t qio_channel_writev_zerocopy(QIOChannel *ioc,
> +                                    const struct iovec *iov,
> +                                    size_t niov,
> +                                    Error **errp)
> +{
> +    return qio_channel_writev_full_flags(ioc, iov, niov, NULL, 0,
> +                                         QIO_CHANNEL_WRITE_FLAG_ZEROCOPY,
> +                                         errp);
> +}

This function is never used, right? qio_channel_writev_all_flags() is used in
patch 3, with proper flags passed in.  Then IMHO we can drop this one.

The rest looks good, as long as with Eric's comment addressed.

Thanks,

> +
> +
> +int qio_channel_flush_zerocopy(QIOChannel *ioc,
> +                               Error **errp)
> +{
> +    QIOChannelClass *klass = QIO_CHANNEL_GET_CLASS(ioc);
> +
> +    if (!klass->io_flush_zerocopy ||
> +        !qio_channel_has_feature(ioc, QIO_CHANNEL_FEATURE_WRITE_ZEROCOPY)) {
> +        return 0;
> +    }
> +
> +    return klass->io_flush_zerocopy(ioc, errp);
> +}
> +
> +
>  static void qio_channel_restart_read(void *opaque)
>  {
>      QIOChannel *ioc = opaque;
> -- 
> 2.33.0
> 

-- 
Peter Xu


