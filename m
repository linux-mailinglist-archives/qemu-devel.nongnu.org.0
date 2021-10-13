Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B23A42B6F4
	for <lists+qemu-devel@lfdr.de>; Wed, 13 Oct 2021 08:19:20 +0200 (CEST)
Received: from localhost ([::1]:41778 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1maXbj-0001Hg-HC
	for lists+qemu-devel@lfdr.de; Wed, 13 Oct 2021 02:19:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34588)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1maXau-0000bP-6h
 for qemu-devel@nongnu.org; Wed, 13 Oct 2021 02:18:28 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:38632)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1maXas-0004Zm-0e
 for qemu-devel@nongnu.org; Wed, 13 Oct 2021 02:18:27 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1634105904;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=HKhY9JZDRh3WzQPK0qfR3A5A0MHn4ln9tM0nq/N/IeA=;
 b=A+BUyhEtnwoDgtr8cqYWYeOIPEvH/cx10Dok+Az+snXYpnGQUOw5RmzxQUX+fRqObAa0gM
 9vPQF74DQ4wby0GZ+eOlm39s/MbQtEd2Tt/A6MtJzCsOTW/H7LgDGVIQF7Me03PeEm5VLn
 qQIKqXYYj+ERL6r9GAtrmTG4NbPFnxI=
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com
 [209.85.214.200]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-311-zfhE8jnlNZawCkyWaSSrwA-1; Wed, 13 Oct 2021 02:18:21 -0400
X-MC-Unique: zfhE8jnlNZawCkyWaSSrwA-1
Received: by mail-pl1-f200.google.com with SMTP id
 o6-20020a170902bcc600b00138a9a5bc42so582580pls.17
 for <qemu-devel@nongnu.org>; Tue, 12 Oct 2021 23:18:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=HKhY9JZDRh3WzQPK0qfR3A5A0MHn4ln9tM0nq/N/IeA=;
 b=sFvExAEwVW2B25U1Z+JrZsibisvkSB3+7VU7m4hQza+FWlAJba7nt7h0Vo/3QZqzzp
 gDN4VYvCm2WFUDZpowRkusVISYpWFGYZIOgbpT82q3NW6C8w7+36xRaLkONkt/g4JQRr
 hFMBPzZo2wsZosrXavZEE65ksAdB6H36lcj2FHp3mexuTu3Y515w/hmkTy+OJsMsJmy7
 Tr2hV3W1R70lhL8qRTpYAx0dAvTs2ElQ478EXPrE8mKDZm+TJGNEdVMg3Vx2196wel35
 p+Cy4lj3QQjVnu3CoyFZ13dq9vvGSKqBEsuDuu/pRi3sex1oI2cx041gaDvUZap77X/E
 dBCQ==
X-Gm-Message-State: AOAM531uXdflDdfrHpHzTiexeZJFGlG9+y2ogdT3rhxtXydq4OHssD2f
 YqIkkzFBtfiNXW62kwOIldasvobSIr5mxFY6w3fBAeIRnSCsI2J+/43ZPm21e+UhkCty2c9xd9C
 /ykgeZBZXzmCEAo4=
X-Received: by 2002:a17:90a:17e1:: with SMTP id
 q88mr11280117pja.99.1634105899866; 
 Tue, 12 Oct 2021 23:18:19 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzhVfuw2WePJY8vvPZmlGKWts7eTZDeiTe3dpk2bTqbHdNuvpJDnLm6dR+ZfTpPjpSetw4koQ==
X-Received: by 2002:a17:90a:17e1:: with SMTP id
 q88mr11280088pja.99.1634105899532; 
 Tue, 12 Oct 2021 23:18:19 -0700 (PDT)
Received: from t490s ([209.132.188.80])
 by smtp.gmail.com with ESMTPSA id a15sm12592751pfl.182.2021.10.12.23.18.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 12 Oct 2021 23:18:18 -0700 (PDT)
Date: Wed, 13 Oct 2021 14:18:12 +0800
From: Peter Xu <peterx@redhat.com>
To: Leonardo Bras <leobras@redhat.com>
Subject: Re: [PATCH v4 2/3] QIOChannelSocket: Implement io_writev_zerocopy &
 io_flush_zerocopy for CONFIG_LINUX
Message-ID: <YWZ6JIstNuvuOWtt@t490s>
References: <20211009075612.230283-1-leobras@redhat.com>
 <20211009075612.230283-3-leobras@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20211009075612.230283-3-leobras@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=peterx@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=peterx@redhat.com;
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

On Sat, Oct 09, 2021 at 04:56:12AM -0300, Leonardo Bras wrote:
> @@ -154,6 +161,17 @@ int qio_channel_socket_connect_sync(QIOChannelSocket *ioc,
>          return -1;
>      }
>  
> +#ifdef CONFIG_LINUX
> +    ret = qemu_setsockopt(fd, SOL_SOCKET, SO_ZEROCOPY, &v, sizeof(v));
> +    if (ret < 0) {
> +        /* Zerocopy not available on host */
> +        return 0;
> +    }
> +
> +    qio_channel_set_feature(QIO_CHANNEL(ioc),
> +                            QIO_CHANNEL_FEATURE_WRITE_ZEROCOPY);

This is okay I think, but looks a bit weird.  Maybe nicer to be written as:

#if LINUX
      ret = setsockopt();
      if (ret == 0) {
          qio_channel_set_feature(...);
      }
#endif
      return 0;

?

> +#endif
> +
>      return 0;
>  }

[...]

> +static ssize_t qio_channel_socket_writev_zerocopy(QIOChannel *ioc,
> +                                                  const struct iovec *iov,
> +                                                  size_t niov,
> +                                                  Error **errp)
> +{
> +    QIOChannelSocket *sioc = QIO_CHANNEL_SOCKET(ioc);
> +    ssize_t ret;
> +
> +    ret = qio_channel_socket_writev_flags(ioc, iov, niov, NULL, 0,
> +                                          MSG_ZEROCOPY, errp);
> +    if (ret == QIO_CHANNEL_ERR_NOBUFS) {
> +        if (errp && *errp) {

Hmm this seems wrong, *errp should be NULL in most cases, meanwhile I think
error_setg*() takes care of errp==NULL too, so maybe we can drop this?

> +            error_setg_errno(errp, errno,
> +                             "Process can't lock enough memory for using MSG_ZEROCOPY");
> +        }
> +        return -1;
> +    }
> +
> +    sioc->zerocopy_queued++;
> +    return ret;
> +}

-- 
Peter Xu


