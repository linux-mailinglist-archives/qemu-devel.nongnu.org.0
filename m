Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B590F42B774
	for <lists+qemu-devel@lfdr.de>; Wed, 13 Oct 2021 08:34:19 +0200 (CEST)
Received: from localhost ([::1]:56806 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1maXqE-0003qn-RL
	for lists+qemu-devel@lfdr.de; Wed, 13 Oct 2021 02:34:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35820)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1maXj6-0005Da-Lm
 for qemu-devel@nongnu.org; Wed, 13 Oct 2021 02:26:56 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:22741)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1maXj4-0003M9-6o
 for qemu-devel@nongnu.org; Wed, 13 Oct 2021 02:26:56 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1634106413;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=tw5ZhEhOcVs6b/Nwo3iFgSfkmYqcDGBx1kDOj7zPC/4=;
 b=PH4VXhSoJ5QNbQa8QlkfQQMRZcMZmbTC0fuC7LwsLnIiAFWyNe+evzmhbRCFpvw/o3i8DZ
 p+A3Eo3701YBgz4jBqwNBq9t95vY21wto6zTJvGJvHH4Y8L3/FDPDtMcmrzTYcIxSHExs7
 CHXiTlD0OWolDkuOqk46SaJQfjj9BMU=
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com
 [209.85.210.200]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-413-nabVfuQdOnWrpKclDgcYjQ-1; Wed, 13 Oct 2021 02:26:52 -0400
X-MC-Unique: nabVfuQdOnWrpKclDgcYjQ-1
Received: by mail-pf1-f200.google.com with SMTP id
 d10-20020a621d0a000000b0044ca56b97f5so1002022pfd.2
 for <qemu-devel@nongnu.org>; Tue, 12 Oct 2021 23:26:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=tw5ZhEhOcVs6b/Nwo3iFgSfkmYqcDGBx1kDOj7zPC/4=;
 b=e4pINuYkZ1c8oNKgjcs/A7KdUSpVBAdBGQpV+jMRlU9TCnj6thfJ8E4yn7j02DoOpK
 1OU4/5Uh2sGUvzsxzNzQRcWAKRW3KNwIq5ncjW2Jt0VVVojO5cGCMR38MNjduQhA5O44
 oofd0iaXC3mdjb3IGISeQ31xECeIjjNXIQ94+vwlTZh4cPYrcIXFMm7ISLqSitoFMf2d
 Wpkif4FsV2abCTm4dUYa+yI8YXxKtNwU+r7oG0cLkhVDSeaIrv0/GwIxh9CUgXvFpgw4
 6FTFUCx6Nm4rqzR0Lz2X5+KjEl7uMxT6qQjc2RtUIXVtiruIwwB/xqZW1c/SPArJJeYL
 +eqw==
X-Gm-Message-State: AOAM53089DR5kgsol6HwuGMNdMOQWvV7hFG9F/LLeKUW3mjeHYinQ4+g
 o8bLblfN+h6XlCq40RzEfSFZKS190QhvZ0cNfgycuVOOopwvp8SP7BpfCM2+qn/WKu8AWJtGgMe
 vYNfcIlsvTBkPmBU=
X-Received: by 2002:a63:950f:: with SMTP id p15mr26111206pgd.265.1634106411197; 
 Tue, 12 Oct 2021 23:26:51 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzibvgpJ6uRZcHnukNtjbmSme7GLeW8sP54DWLcWkE/nTKcXe2GdweVkPs0wV0VOjhCpge/wg==
X-Received: by 2002:a63:950f:: with SMTP id p15mr26111193pgd.265.1634106410941; 
 Tue, 12 Oct 2021 23:26:50 -0700 (PDT)
Received: from t490s ([209.132.188.80])
 by smtp.gmail.com with ESMTPSA id e22sm12738790pfn.101.2021.10.12.23.26.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 12 Oct 2021 23:26:50 -0700 (PDT)
Date: Wed, 13 Oct 2021 14:26:43 +0800
From: Peter Xu <peterx@redhat.com>
To: Leonardo Bras <leobras@redhat.com>
Subject: Re: [PATCH v4 3/3] multifd: Implement zerocopy write in multifd
 migration (multifd-zerocopy)
Message-ID: <YWZ8I8s62qyjTF/e@t490s>
References: <20211009075612.230283-1-leobras@redhat.com>
 <20211009075612.230283-4-leobras@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20211009075612.230283-4-leobras@redhat.com>
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

On Sat, Oct 09, 2021 at 04:56:13AM -0300, Leonardo Bras wrote:
> @@ -105,7 +105,13 @@ static int nocomp_send_prepare(MultiFDSendParams *p, uint32_t used,
>   */
>  static int nocomp_send_write(MultiFDSendParams *p, uint32_t used, Error **errp)
>  {
> -    return qio_channel_writev_all(p->c, p->pages->iov, used, errp);
> +    int flags = 0;
> +
> +    if (migrate_multifd_zerocopy()) {
> +        flags = QIO_CHANNEL_WRITE_FLAG_ZEROCOPY;
> +    }
> +
> +    return qio_channel_writev_all_flags(p->c, p->pages->iov, used, flags, errp);
>  }

What if the user specified ZEROCOPY+MULTIFD, but the kernel doesn't support it?

IIUC then the first call to qio_channel_writev_all_flags() above will fail,
then we fail the migration.

It seems fine, but since you've introduced QIO_CHANNEL_FEATURE_WRITE_ZEROCOPY
in the previous patch - I think the cleaner way is when start migration and
after we setup the ioc, we sanity check on the capability and the ioc to make
sure if ZEROCOPY+MULTIFD is specified, we should fail early if we're sure the
ioc doesn't have QIO_CHANNEL_FEATURE_WRITE_ZEROCOPY bit set?

-- 
Peter Xu


