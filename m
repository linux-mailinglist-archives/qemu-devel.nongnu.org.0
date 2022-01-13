Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 72B3348D296
	for <lists+qemu-devel@lfdr.de>; Thu, 13 Jan 2022 08:06:12 +0100 (CET)
Received: from localhost ([::1]:43248 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n7uBX-0007Of-Ae
	for lists+qemu-devel@lfdr.de; Thu, 13 Jan 2022 02:06:11 -0500
Received: from eggs.gnu.org ([209.51.188.92]:34430)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1n7tuP-0007ok-JE
 for qemu-devel@nongnu.org; Thu, 13 Jan 2022 01:48:30 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:56256)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1n7tuM-00005j-84
 for qemu-devel@nongnu.org; Thu, 13 Jan 2022 01:48:28 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1642056504;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=t9N4YmIpbXzQpkvCxQmCdinrj/XlHajnhkdKDW2duDg=;
 b=N8eJvaV09ndDiphPRZxjpWicaQQGj/hoF4RQOUVzeOqD9K/0ij7yw80kzrOicjLo1jgjsR
 P34CVXHyUXKaHkhlsEVTVbAo9GPyiCQM16azo5o+O4Pd3FhYyKEG4MAQhKfiBHWkZ1s1l6
 BV6PXlz2dHYgnlruFXXs0aFS/kJpF2s=
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com
 [209.85.214.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-7-G9vqzC2JP46zJGIQKndLAg-1; Thu, 13 Jan 2022 01:48:23 -0500
X-MC-Unique: G9vqzC2JP46zJGIQKndLAg-1
Received: by mail-pl1-f198.google.com with SMTP id
 ik6-20020a170902ab0600b0014a1e5aab34so5073163plb.21
 for <qemu-devel@nongnu.org>; Wed, 12 Jan 2022 22:48:23 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=t9N4YmIpbXzQpkvCxQmCdinrj/XlHajnhkdKDW2duDg=;
 b=jRyYr2/+kCFXFqJIrAG3AYQvBlxPcQiXWBiB9kwJP3MJk1f7+2l13dVpPVAok+Slyj
 oTvGXx2vJSBkWKC7v22oCnrCaozehU8bxYD5ZCSe99A649GfqXParCPG8fCUYBkqqVhP
 hz0JAo88yGt70rsxY/PQrRcEhEnRhg0ARLFkIA/Hg3qlv5zKLK7Nw39tcGoBBdGaXgZX
 3K9b6E19Bf9xxOcQHRN6hHdFfBZPnninExqCUaVsyKOY1VRilIDut78eu4EaPM+kNbmr
 +gqxcWwqVzzksa1DMVVUdgJoCl41GaXMhQBrsKOsSeNnHoq9FBX8yvgZWwNzbVoA0Xo+
 0gpw==
X-Gm-Message-State: AOAM532fRmIOSrJKQdzPP83Rt1vDFhjJHJZPF+RWMLGAipoaG3btcuCX
 AlzqVuQ1lrF7xfIVeLFd2ruSWGPHccTQMbPDZc3kqnlCy/oWkWXTkfHKf5rNa1ZX/4SzIGY/om9
 dc78dXoGFA+jmCcU=
X-Received: by 2002:a17:902:c406:b0:14a:52e4:3e5e with SMTP id
 k6-20020a170902c40600b0014a52e43e5emr3168736plk.4.1642056502398; 
 Wed, 12 Jan 2022 22:48:22 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyDS1vqq7d3rCbi8UCIdzYeIx8fZ4yYztmUPOBqiUZzfnRgMeuAz0RSqGByHZWpi4oEVuYBzw==
X-Received: by 2002:a17:902:c406:b0:14a:52e4:3e5e with SMTP id
 k6-20020a170902c40600b0014a52e43e5emr3168717plk.4.1642056502042; 
 Wed, 12 Jan 2022 22:48:22 -0800 (PST)
Received: from xz-m1.local ([191.101.132.233])
 by smtp.gmail.com with ESMTPSA id s24sm1499357pfm.100.2022.01.12.22.48.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 12 Jan 2022 22:48:21 -0800 (PST)
Date: Thu, 13 Jan 2022 14:48:15 +0800
From: Peter Xu <peterx@redhat.com>
To: Leonardo Bras <leobras@redhat.com>
Subject: Re: [PATCH v7 2/5] QIOChannelSocket: Implement io_writev zero copy
 flag & io_flush for CONFIG_LINUX
Message-ID: <Yd/LLxNCItAIX3eN@xz-m1.local>
References: <20220106221341.8779-1-leobras@redhat.com>
 <20220106221341.8779-3-leobras@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20220106221341.8779-3-leobras@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=peterx@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.129.124; envelope-from=peterx@redhat.com;
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

On Thu, Jan 06, 2022 at 07:13:39PM -0300, Leonardo Bras wrote:
> @@ -558,15 +575,26 @@ static ssize_t qio_channel_socket_writev(QIOChannel *ioc,
>          memcpy(CMSG_DATA(cmsg), fds, fdsize);
>      }
>  
> +    if (flags & QIO_CHANNEL_WRITE_FLAG_ZERO_COPY) {
> +        sflags = MSG_ZEROCOPY;
> +    }
> +
>   retry:
> -    ret = sendmsg(sioc->fd, &msg, 0);
> +    ret = sendmsg(sioc->fd, &msg, sflags);
>      if (ret <= 0) {
> -        if (errno == EAGAIN) {
> +        switch (errno) {
> +        case EAGAIN:
>              return QIO_CHANNEL_ERR_BLOCK;
> -        }
> -        if (errno == EINTR) {
> +        case EINTR:
>              goto retry;
> +        case ENOBUFS:
> +            if (sflags & MSG_ZEROCOPY) {
> +                error_setg_errno(errp, errno,
> +                                 "Process can't lock enough memory for using MSG_ZEROCOPY");
> +                return -1;
> +            }

I have no idea whether it'll make a real differnece, but - should we better add
a "break" here?  If you agree and with that fixed, feel free to add:

Reviewed-by: Peter Xu <peterx@redhat.com>

I also wonder whether you hit ENOBUFS in any of the environments.  On Fedora
here it's by default unlimited, but just curious when we should keep an eye.

Thanks,

-- 
Peter Xu


