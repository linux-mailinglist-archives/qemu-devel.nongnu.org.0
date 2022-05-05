Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D96F951C47A
	for <lists+qemu-devel@lfdr.de>; Thu,  5 May 2022 18:03:21 +0200 (CEST)
Received: from localhost ([::1]:35752 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nmdwm-00024J-Kv
	for lists+qemu-devel@lfdr.de; Thu, 05 May 2022 12:03:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57224)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1nmdpK-0005GQ-OT
 for qemu-devel@nongnu.org; Thu, 05 May 2022 11:55:45 -0400
Received: from us-smtp-delivery-74.mimecast.com ([170.10.133.74]:34979)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1nmdpI-00081U-7x
 for qemu-devel@nongnu.org; Thu, 05 May 2022 11:55:37 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1651766135;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=279GpwOeFsT/jeRWhwmoMyT0d+ig3T2wfB1DWHZiZYs=;
 b=XFJBktduMEBm2x22G9i+1j51Z143DOzpoMGZlaf0QuwEmvacqIYiyr4EYwZH5diHSYN9jl
 mKc/YczdbtyyxHdwBrbfT+TfTdnOh0Qxr8kKFKoQuOlyc2XtDTImYrzK2wezlFjhNz/NNm
 mSoDTRQfdsBdvsvNpDNoLgDzfswO+Uc=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-270-56vjFH6SM-iatShYanMVWw-1; Thu, 05 May 2022 11:55:32 -0400
X-MC-Unique: 56vjFH6SM-iatShYanMVWw-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
 [10.11.54.1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id EDFAB803B42;
 Thu,  5 May 2022 15:55:31 +0000 (UTC)
Received: from redhat.com (unknown [10.33.36.128])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id C42E740CF8F5;
 Thu,  5 May 2022 15:55:29 +0000 (UTC)
Date: Thu, 5 May 2022 16:55:27 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Leonardo Bras Soares Passos <leobras@redhat.com>
Cc: =?utf-8?Q?Marc-Andr=C3=A9?= Lureau <marcandre.lureau@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Elena Ufimtseva <elena.ufimtseva@oracle.com>,
 Jagannathan Raman <jag.raman@oracle.com>,
 John G Johnson <john.g.johnson@oracle.com>,
 Juan Quintela <quintela@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Eric Blake <eblake@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, Fam Zheng <fam@euphon.net>,
 Peter Xu <peterx@redhat.com>, qemu-devel <qemu-devel@nongnu.org>,
 qemu-block@nongnu.org
Subject: Re: [PATCH v11 2/7] QIOChannelSocket: Implement io_writev zero copy
 flag & io_flush for CONFIG_LINUX
Message-ID: <YnPzb3PG0bff7AXG@redhat.com>
References: <20220504191835.791580-1-leobras@redhat.com>
 <20220504191835.791580-3-leobras@redhat.com>
 <YnOFUnA439GftKyQ@redhat.com>
 <CAJ6HWG7ZAPqyszS_ZGA_JH3jvQUpsZD=zQ8ismHtgq_PiSYRgw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <CAJ6HWG7ZAPqyszS_ZGA_JH3jvQUpsZD=zQ8ismHtgq_PiSYRgw@mail.gmail.com>
User-Agent: Mutt/2.1.5 (2021-12-30)
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.1
Received-SPF: pass client-ip=170.10.133.74; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-74.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, May 05, 2022 at 12:42:47PM -0300, Leonardo Bras Soares Passos wrote:
> 
> Hello Daniel,
> 
> But what if this gets compiled in a Linux system without MSG_ZEROCOPY support?
> As qapi will have zero-copy-send as an option we could have this scenario:
> 
> - User request migration using zero-copy-send
> - multifd_save_setup() will set write_flags = QIO_CHANNEL_WRITE_FLAG_ZERO_COPY
> - In qio_channel_socket_connect_sync(): setsockopt() part will be
> compiled-out, so no error here
> - above part in qio_channel_socket_writev() will be commented-out,
> which means write_flags will be ignored
> - sflags will not contain MSG_ZEROCOPY, so sendmsg() will use copy-mode
> - migration will succeed
> 
> In the above case, the user has all the reason to think migration is
> using MSG_ZEROCOPY, but in fact it's quietly falling back to
> copy-mode.

I think we're ok because qio_channel_writev_full() does

    if ((flags & QIO_CHANNEL_WRITE_FLAG_ZERO_COPY) &&
        !qio_channel_has_feature(ioc, QIO_CHANNEL_FEATURE_WRITE_ZERO_COPY)) {
        error_setg_errno(errp, EINVAL,
                         "Requested Zero Copy feature is not available");
        return -1;
    }

and since there's no way for QIO_CHANNEL_FEATURE_WRITE_ZERO_COPY to
get set when MSG_ZEROCOPY is compiled out, we'll trigger the error
condition.

> That's why I suggested creating a 'global' config usiing SO_ZEROCOPY &
> MSG_ZEROCOPY & CONFIG_LINUX so we can use in qapi and have no chance
> of even offering zero-copy-send if we don't have it.
> 
> Another local option is to do implement your suggestions, and also
> change qio_channel_socket_connect_sync() so it returns an error if
> MSG_ZEROCOPY && SO_ZEROCOPY is not present, such as:
> 
> +#ifdef CONFIG_LINUX
> +#if defined(MSG_ZEROCOPY)  && defined(SO_ZEROCOPY)
> +    int ret, v = 1;
> +    ret = setsockopt(fd, SOL_SOCKET, SO_ZEROCOPY, &v, sizeof(v));
> +    if (ret == 0) {
> +        /* Zero copy available on host */
> +        qio_channel_set_feature(QIO_CHANNEL(ioc),
> +                                QIO_CHANNEL_FEATURE_WRITE_ZERO_COPY);
> +    }
> +#else
> +    error_setg_errno(errp, errno,"MSG_ZEROCOPY not available");
> +    return -1;
> +#endif
> +#endif

Do we actually need the ifdef CONFIG_LINUX bit at all ?

Sufficient to just have the check for MSG_ZEROCOPY + SO_ZEROCOPY,
which will fail on non-Linux anyway.


With regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


