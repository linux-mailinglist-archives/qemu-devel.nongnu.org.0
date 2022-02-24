Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CABF4C3499
	for <lists+qemu-devel@lfdr.de>; Thu, 24 Feb 2022 19:23:13 +0100 (CET)
Received: from localhost ([::1]:36964 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nNIlj-0008Ak-V6
	for lists+qemu-devel@lfdr.de; Thu, 24 Feb 2022 13:23:11 -0500
Received: from eggs.gnu.org ([209.51.188.92]:48794)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1nNIkV-0007Ub-1o
 for qemu-devel@nongnu.org; Thu, 24 Feb 2022 13:21:55 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:59297)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1nNIkR-0000eH-F0
 for qemu-devel@nongnu.org; Thu, 24 Feb 2022 13:21:53 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1645726910;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=v+Qn807+I2UP3CWuYgSk/ni9WfA/jR3oLsZ9nqToy3Y=;
 b=GlETcsEONbBXZeNZwmEP0Lc496eYuRUHbeNpICc20Bdb3PEzd54RL70adrAn6VFKmU6hwe
 JqDIaLdnqF919ZWCocHoqkWdkMxmSYWtNVf5aRAZPA6kBpcPo7aFC+p+PAxYwuKAvO/Czj
 Y9n/MDJRkhfXuNmgJJ0JknUEwb/KNPk=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-332-Xrlk6fq6MZ-Kyk6BnWbkCA-1; Thu, 24 Feb 2022 13:21:48 -0500
X-MC-Unique: Xrlk6fq6MZ-Kyk6BnWbkCA-1
Received: by mail-wm1-f69.google.com with SMTP id
 10-20020a1c020a000000b0037fae68fcc2so207568wmc.8
 for <qemu-devel@nongnu.org>; Thu, 24 Feb 2022 10:21:46 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=v+Qn807+I2UP3CWuYgSk/ni9WfA/jR3oLsZ9nqToy3Y=;
 b=b3BYQqEI6Nln+UA/lPJGvKHhkJn1smxuVpZyyUB6/KZwMEl+VwDj0E24uuUEb8CnkJ
 x0DvohpNFdHMR6TqiyjL/Ruo73ZZV5rGwgQP39hg/0rhkEqnnYYrntbvAR12au1F0zZH
 Zcu7u7xzGtAl0+MONJ5VRIiJQJTPyEbPas5mEuptRrvqPnapG0Nhx+FpxYhMUEHcnB7l
 zz6iJooKNJSj2j9FuB8aVGSwKff82svPQgOcWsmn/R0XDWaxGPwocVYN8dFWjtTZlRFN
 29q1C5GUb210NEuBsSDSirJ1KBQ9iKehsOs210oqUSIwiJObWQWaJFZOi85jHvRgXkRN
 8Ezg==
X-Gm-Message-State: AOAM533Qh1UVdpEl16tzpZWOvsU/4IwRPSbWwxd4mAmjfQu3jYqxtLIj
 VGZ4yoBkh06RMCIxthK8UoB/BOY4w1jO4hVWbBqjGqBqrCe+5LY0cGVXfpweUYIS2Wmc8V4HPNC
 oid12+j3rqVbKQcc=
X-Received: by 2002:a05:6000:2a2:b0:1e8:6dd5:767b with SMTP id
 l2-20020a05600002a200b001e86dd5767bmr3133160wry.444.1645726905732; 
 Thu, 24 Feb 2022 10:21:45 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwOvQB2qUjElVYJJNcOY7Eehbu4JZBnkqe73KHss74z2I2ql/MNsFB9MN9aiP5eWDxEWa03/Q==
X-Received: by 2002:a05:6000:2a2:b0:1e8:6dd5:767b with SMTP id
 l2-20020a05600002a200b001e86dd5767bmr3133143wry.444.1645726905458; 
 Thu, 24 Feb 2022 10:21:45 -0800 (PST)
Received: from work-vm (cpc109025-salf6-2-0-cust480.10-2.cable.virginm.net.
 [82.30.61.225]) by smtp.gmail.com with ESMTPSA id
 t14-20020a5d460e000000b001edc107e4f7sm96345wrq.81.2022.02.24.10.21.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 24 Feb 2022 10:21:44 -0800 (PST)
Date: Thu, 24 Feb 2022 18:21:42 +0000
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: Steve Sistare <steven.sistare@oracle.com>
Subject: Re: [PATCH V7 03/29] migration: qemu file wrappers
Message-ID: <YhfMtliUYxGDsDwx@work-vm>
References: <1640199934-455149-1-git-send-email-steven.sistare@oracle.com>
 <1640199934-455149-4-git-send-email-steven.sistare@oracle.com>
MIME-Version: 1.0
In-Reply-To: <1640199934-455149-4-git-send-email-steven.sistare@oracle.com>
User-Agent: Mutt/2.1.5 (2021-12-30)
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dgilbert@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=dgilbert@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: Jason Zeng <jason.zeng@linux.intel.com>,
 Juan Quintela <quintela@redhat.com>, Eric Blake <eblake@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, qemu-devel@nongnu.org,
 Markus Armbruster <armbru@redhat.com>, Zheng Chuan <zhengchuan@huawei.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 =?iso-8859-1?Q?Marc-Andr=E9?= Lureau <marcandre.lureau@redhat.com>,
 "Daniel P. Berrange" <berrange@redhat.com>,
 Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@redhat.com>,
 Alex =?iso-8859-1?Q?Benn=E9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

* Steve Sistare (steven.sistare@oracle.com) wrote:
> Add qemu_file_open and qemu_fd_open to create QEMUFile objects for unix
> files and file descriptors.
> 
> Signed-off-by: Steve Sistare <steven.sistare@oracle.com>
> ---
>  migration/qemu-file-channel.c | 36 ++++++++++++++++++++++++++++++++++++
>  migration/qemu-file-channel.h |  6 ++++++
>  2 files changed, 42 insertions(+)
> 
> diff --git a/migration/qemu-file-channel.c b/migration/qemu-file-channel.c
> index bb5a575..afb16d7 100644
> --- a/migration/qemu-file-channel.c
> +++ b/migration/qemu-file-channel.c
> @@ -27,8 +27,10 @@
>  #include "qemu-file.h"
>  #include "io/channel-socket.h"
>  #include "io/channel-tls.h"
> +#include "io/channel-file.h"
>  #include "qemu/iov.h"
>  #include "qemu/yank.h"
> +#include "qapi/error.h"
>  #include "yank_functions.h"
>  
>  
> @@ -192,3 +194,37 @@ QEMUFile *qemu_fopen_channel_output(QIOChannel *ioc)
>      object_ref(OBJECT(ioc));
>      return qemu_fopen_ops(ioc, &channel_output_ops, true);
>  }
> +
> +QEMUFile *qemu_file_open(const char *path, int flags, int mode,
> +                         const char *name, Error **errp)

Can you please make that qemu_fopen_file

> +{
> +    g_autoptr(QIOChannelFile) fioc = NULL;
> +    QIOChannel *ioc;
> +    QEMUFile *f;
> +
> +    if (flags & O_RDWR) {
> +        error_setg(errp, "qemu_file_open %s: O_RDWR not supported", path);
> +        return NULL;
> +    }
> +
> +    fioc = qio_channel_file_new_path(path, flags, mode, errp);
> +    if (!fioc) {
> +        return NULL;
> +    }
> +
> +    ioc = QIO_CHANNEL(fioc);
> +    qio_channel_set_name(ioc, name);
> +    f = (flags & O_WRONLY) ? qemu_fopen_channel_output(ioc) :
> +                             qemu_fopen_channel_input(ioc);
> +    return f;
> +}
> +
> +QEMUFile *qemu_fd_open(int fd, bool writable, const char *name)
> +{

Can you please make that qemu_fopen_fd

> +    g_autoptr(QIOChannelFile) fioc = qio_channel_file_new_fd(fd);

Can you use qio_channel_new_fd for that? Then it creates either
a socket or file subclass depending what type of fd is passed
(and gives you a QIOChannel without needing to cast).

> +    QIOChannel *ioc = QIO_CHANNEL(fioc);
> +    QEMUFile *f = writable ? qemu_fopen_channel_output(ioc) :
> +                             qemu_fopen_channel_input(ioc);
> +    qio_channel_set_name(ioc, name);
> +    return f;
> +}
> diff --git a/migration/qemu-file-channel.h b/migration/qemu-file-channel.h
> index 0028a09..324ae2d 100644
> --- a/migration/qemu-file-channel.h
> +++ b/migration/qemu-file-channel.h
> @@ -29,4 +29,10 @@
>  
>  QEMUFile *qemu_fopen_channel_input(QIOChannel *ioc);
>  QEMUFile *qemu_fopen_channel_output(QIOChannel *ioc);
> +
> +QEMUFile *qemu_file_open(const char *path, int flags, int mode,
> +                         const char *name, Error **errp);
> +
> +QEMUFile *qemu_fd_open(int fd, bool writable, const char *name);
> +
>  #endif
> -- 
> 1.8.3.1
> 
> 
-- 
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK


