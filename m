Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D89D62563C
	for <lists+qemu-devel@lfdr.de>; Fri, 11 Nov 2022 10:08:31 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1otQ0n-0000hh-31; Fri, 11 Nov 2022 04:07:45 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1otQ0g-0000eO-T9
 for qemu-devel@nongnu.org; Fri, 11 Nov 2022 04:07:39 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1otQ0f-0001fd-9G
 for qemu-devel@nongnu.org; Fri, 11 Nov 2022 04:07:38 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1668157652;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=Cny6pv8CGjdKYnVj7yg2ef1nKmeSf/chQBx45+Qoi0A=;
 b=OUtz64GP0y6ZQrB3BJfJTx00dSsLBkEsO1f0dEdDBn/k3t4Sr26MPe71g/6BL7pbMqT4j5
 6T+2YQVbztq2LrfjnAWQIAn65brRMuWGYMB7WON7VIrIM0fa8XHL96bkbhEAxutVZvQMUI
 OxBrCYUVDQXx5+Vb+oI9t/TkZIs0YbU=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-198-cGfqzRFDONCfwxyv5Q5KCg-1; Fri, 11 Nov 2022 04:07:31 -0500
X-MC-Unique: cGfqzRFDONCfwxyv5Q5KCg-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
 [10.11.54.4])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id A58373C0F670;
 Fri, 11 Nov 2022 09:07:30 +0000 (UTC)
Received: from redhat.com (unknown [10.33.36.113])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 2F62F200C0DD;
 Fri, 11 Nov 2022 09:07:28 +0000 (UTC)
Date: Fri, 11 Nov 2022 09:07:26 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Bin Meng <bin.meng@windriver.com>
Cc: qemu-devel@nongnu.org,
 =?utf-8?Q?Marc-Andr=C3=A9?= Lureau <marcandre.lureau@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>
Subject: Re: [PATCH v2 04/19] osdep.h: Introduce a QEMU file descriptor type
Message-ID: <Y24QzpMDpcLnAsPH@redhat.com>
References: <20221111042225.1115931-1-bin.meng@windriver.com>
 <20221111042225.1115931-5-bin.meng@windriver.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20221111042225.1115931-5-bin.meng@windriver.com>
User-Agent: Mutt/2.2.7 (2022-08-07)
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.4
Received-SPF: pass client-ip=170.10.133.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Reply-To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Fri, Nov 11, 2022 at 12:22:10PM +0800, Bin Meng wrote:
> Introduce a new QemuFd_t type to represent a file descriptor for
> different platforms. On POSIX platforms, this is a file descriptor
> On Windows, this is a file handle.

Can we not use  _open_osfhandle() to obtain a C runtime
file descriptor from the Windows HANDLE.  We do this in
QEMU's socket code, so we don't have to work wit different
types and APIs on Windows, and I think that's much nicer
in general.

> 
> Changes in v2:
> - Change to introduce QemuFd_t in osdep.h
> 
>  include/qemu/osdep.h | 26 ++++++++++++++++++++++++++
>  1 file changed, 26 insertions(+)
> 
> diff --git a/include/qemu/osdep.h b/include/qemu/osdep.h
> index b9c4307779..45fc8bb5d9 100644
> --- a/include/qemu/osdep.h
> +++ b/include/qemu/osdep.h
> @@ -705,6 +705,32 @@ static inline int platform_does_not_support_system(const char *command)
>  }
>  #endif /* !HAVE_SYSTEM_FUNCTION */
>  
> +/*
> + * QEMU file descriptor type
> + *
> + * On POSIX platforms, this is a file descriptor (int).
> + * On Windows, this is a file handle (HANDLE).
> + */
> +#ifndef _WIN32
> +typedef int QemuFd_t;
> +#define QEMU_FD_INVALID -1
> +#else
> +typedef HANDLE QemuFd_t;
> +#define QEMU_FD_INVALID INVALID_HANDLE_VALUE
> +#endif
> +
> +/**
> + * qemu_fd_invalid - determine if a given QEMU file descriptor is invalid
> + *
> + * @fd: the value of a QEMU file descriptor
> + *
> + * Returns true if a given QEMU file descriptor is invalid, otherwise false.
> + */
> +static inline bool qemu_fd_invalid(QemuFd_t fd)
> +{
> +    return (fd == QEMU_FD_INVALID);
> +}
> +
>  #ifdef __cplusplus
>  }
>  #endif
> -- 
> 2.25.1
> 

With regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


