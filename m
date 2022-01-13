Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 41DB448D259
	for <lists+qemu-devel@lfdr.de>; Thu, 13 Jan 2022 07:36:55 +0100 (CET)
Received: from localhost ([::1]:55524 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n7tjB-000255-Ku
	for lists+qemu-devel@lfdr.de; Thu, 13 Jan 2022 01:36:53 -0500
Received: from eggs.gnu.org ([209.51.188.92]:60124)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1n7tb8-0000QU-H1
 for qemu-devel@nongnu.org; Thu, 13 Jan 2022 01:28:34 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:51492)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1n7tb5-0005kh-9g
 for qemu-devel@nongnu.org; Thu, 13 Jan 2022 01:28:33 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1642055310;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=DJK8gEhfmm+MScuMj98Tc3X5SOLxL/kx/04MxgSAwR0=;
 b=GnipxiIzUFCivfmn9PkKWbo/nxOca5+nmDdn04j+ps3C060kVLkNubh5e8eyD+nTqAyqHb
 cJkuRAg5LXzYa3qiwRrYdHIfrFWt+ln7rBVywtXnVdeo4KnAgRnEO9K2x3nGdG42J4WbNm
 PacA41VzRdbq9kYR0usVBmaAGmFKWEY=
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com
 [209.85.214.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-402-2dm74P0TMkSjM819ccBdkw-1; Thu, 13 Jan 2022 01:28:28 -0500
X-MC-Unique: 2dm74P0TMkSjM819ccBdkw-1
Received: by mail-pl1-f199.google.com with SMTP id
 f2-20020a170902ce8200b0014a46161fd2so5108550plg.3
 for <qemu-devel@nongnu.org>; Wed, 12 Jan 2022 22:28:28 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=DJK8gEhfmm+MScuMj98Tc3X5SOLxL/kx/04MxgSAwR0=;
 b=KpiQn/ZZLWQtMDcm4HK/ZqkONbH7UUIabzY+KlM9kX3JnAmbFUsQsNvNPXmLHDGgWz
 +NkbPWQV+80JEHBwCbMXfAbTLtH/F4yJsx6mUtID4tV/eo4uMtJ8t7NrO5TKknemn7Jy
 0rn33TPN71Q1ei0pEuOj5QsxIPwc1r0LCMKBpUcav/znKUcsRO1TWLl323xlSfSnM0PM
 bjL6khX0/gC7npGRIC/M/AmqEGDHM6KAvnok82oToJw8Xq0m83IS2dody2Rf1ohHz4NY
 pYUHg6n4uz5aeoeKZIocQ7ujLT4xirCkoYVgkSZLaq8x9m28Jm5p22MswD+nyc03R5Ls
 ACJA==
X-Gm-Message-State: AOAM531wztKLf7icgU+KS6dVXFZ0prQAN/SiqEmCn6bezTO5pm6XMtPh
 JluB8Ba2Tm/aCLq0XDp0trHzrTu7zgBQvRH3pKjqc/79aw2AxPCP1+B2zxZfyPPYe+txo/po/PK
 7tzL41O9wrT35X0A=
X-Received: by 2002:a05:6a00:1783:b0:4c0:3de9:80d3 with SMTP id
 s3-20020a056a00178300b004c03de980d3mr2917569pfg.72.1642055307607; 
 Wed, 12 Jan 2022 22:28:27 -0800 (PST)
X-Google-Smtp-Source: ABdhPJye2csQz+QubKyBjFrljVRtP6S3x+Tqhz69ZvjGiH8LtSvfA6eZWg04DtKqPvCaNrmESXR4Tw==
X-Received: by 2002:a05:6a00:1783:b0:4c0:3de9:80d3 with SMTP id
 s3-20020a056a00178300b004c03de980d3mr2917560pfg.72.1642055307328; 
 Wed, 12 Jan 2022 22:28:27 -0800 (PST)
Received: from xz-m1.local ([191.101.132.233])
 by smtp.gmail.com with ESMTPSA id p11sm1351821pgh.23.2022.01.12.22.28.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 12 Jan 2022 22:28:26 -0800 (PST)
Date: Thu, 13 Jan 2022 14:28:20 +0800
From: Peter Xu <peterx@redhat.com>
To: Leonardo Bras <leobras@redhat.com>
Subject: Re: [PATCH v7 1/5] QIOChannel: Add flags on io_writev and introduce
 io_flush callback
Message-ID: <Yd/GhH1fExRgd4yA@xz-m1.local>
References: <20220106221341.8779-1-leobras@redhat.com>
 <20220106221341.8779-2-leobras@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20220106221341.8779-2-leobras@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=peterx@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=peterx@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -33
X-Spam_score: -3.4
X-Spam_bar: ---
X-Spam_report: (-3.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.594,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>,
 Juan Quintela <quintela@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 qemu-devel@nongnu.org, "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Eric Blake <eblake@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Jan 06, 2022 at 07:13:38PM -0300, Leonardo Bras wrote:
> diff --git a/io/channel.c b/io/channel.c
> index e8b019dc36..904855e16e 100644
> --- a/io/channel.c
> +++ b/io/channel.c
> @@ -67,12 +67,13 @@ ssize_t qio_channel_readv_full(QIOChannel *ioc,
>  }
>  
>  
> -ssize_t qio_channel_writev_full(QIOChannel *ioc,
> -                                const struct iovec *iov,
> -                                size_t niov,
> -                                int *fds,
> -                                size_t nfds,
> -                                Error **errp)
> +ssize_t qio_channel_writev_full_flags(QIOChannel *ioc,
> +                                      const struct iovec *iov,
> +                                      size_t niov,
> +                                      int *fds,
> +                                      size_t nfds,
> +                                      int flags,
> +                                      Error **errp)
>  {
>      QIOChannelClass *klass = QIO_CHANNEL_GET_CLASS(ioc);
>  
> @@ -83,7 +84,7 @@ ssize_t qio_channel_writev_full(QIOChannel *ioc,
>          return -1;
>      }

Should we better also check QIO_CHANNEL_FEATURE_WRITE_ZERO_COPY here when
QIO_CHANNEL_WRITE_FLAG_ZERO_COPY is set?  Just like what we do with:

    if ((fds || nfds) &&
        !qio_channel_has_feature(ioc, QIO_CHANNEL_FEATURE_FD_PASS)) {
        error_setg_errno(errp, EINVAL,
                         "Channel does not support file descriptor passing");
        return -1;
    }

I still think it's better to have the caller be crystal clear when to use
zero_copy feature because it has implication on buffer lifetime.

I might have commented similar things before, but I have missed a few versions
so I could also have missed some previous discussions..

>  
> -    return klass->io_writev(ioc, iov, niov, fds, nfds, errp);
> +    return klass->io_writev(ioc, iov, niov, fds, nfds, flags, errp);
>  }

-- 
Peter Xu


