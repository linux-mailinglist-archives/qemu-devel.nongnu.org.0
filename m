Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0365D442EF3
	for <lists+qemu-devel@lfdr.de>; Tue,  2 Nov 2021 14:15:32 +0100 (CET)
Received: from localhost ([::1]:44852 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mhtdS-0002xT-S8
	for lists+qemu-devel@lfdr.de; Tue, 02 Nov 2021 09:15:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52204)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1mhtbR-0000hy-9i
 for qemu-devel@nongnu.org; Tue, 02 Nov 2021 09:13:25 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:33461)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1mhtbM-0000nm-7A
 for qemu-devel@nongnu.org; Tue, 02 Nov 2021 09:13:21 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1635858798;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=NbZlonIEVXaiiv7ng77jnWb9CCM4PXuPvIsJJLnSGRY=;
 b=BXGgW8JcXKxRHBuL75apWhzqm60Gvdk2kzJRuZrOiCW/2bFK/ZN6x+EFKKZ+nyxznIr+tD
 2AGLgmN0AaZq+9PDSbjcM1z4iKg4pfkHkY30BX+4lHmomuu97kkpBS6aIN34icTPfIsKba
 lobVbm/5cmo7uKWcUc1rCtKfM1GNTf8=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-464-zlauypLeNQ-pztjUDoqYAg-1; Tue, 02 Nov 2021 09:13:17 -0400
X-MC-Unique: zlauypLeNQ-pztjUDoqYAg-1
Received: by mail-wm1-f69.google.com with SMTP id
 k5-20020a7bc3050000b02901e081f69d80so6932963wmj.8
 for <qemu-devel@nongnu.org>; Tue, 02 Nov 2021 06:13:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:in-reply-to:references
 :user-agent:reply-to:date:message-id:mime-version;
 bh=NbZlonIEVXaiiv7ng77jnWb9CCM4PXuPvIsJJLnSGRY=;
 b=60SA2fpiGd+oEBJlohuzoOMNHqIVBMeRHMC+q8FjJVPIrYv3U+Eeyr8wSs++C/MJWg
 XZAHiYvacJV90TFFG6M3jqWM0wuzFM+ggZeSMXJbCqMRO0RrgusHkssDUGviyVBCZRRa
 AC1Uh6MyAZi4ewFy43qtFlvn/Ri0OArbKKVc81rj0mZmX3OOzivaw81S7qOpZFlunIIq
 ubmNdVCrQp+ItbMznB0xcfuSb3w2hXxJy8SbWs0q7tGwwPWuBX21GWVkyexJSCgHYQN7
 san+aYEcwyhxfVEM/qtyp4NWC7MiFIRyI2ASrAWrtcr2+D65TqYk/teHt0+LI210sINl
 EjZg==
X-Gm-Message-State: AOAM531kriZFf7CIv+2WEBtSw62CU3yFx1ECGqeZItrHfdNn5U8VIO4e
 em9L/NW7kOIsF/niWmnRFw8E3EB5YCOV3G1rw9PzEK0b1j0ytf6FxmJrw8tmsbBxfyEgsBpztHG
 3TosrvCTyFMTvyb4=
X-Received: by 2002:a05:600c:6d2:: with SMTP id
 b18mr7254206wmn.98.1635858796624; 
 Tue, 02 Nov 2021 06:13:16 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJw1dSxgM8Nwgu9foQ61zjZmJbwuvKmhcTGvjYG/9YoM9FLS1T12yQuBXBjO37EkSD5SI8LXAQ==
X-Received: by 2002:a05:600c:6d2:: with SMTP id
 b18mr7254149wmn.98.1635858796317; 
 Tue, 02 Nov 2021 06:13:16 -0700 (PDT)
Received: from localhost ([188.26.219.212])
 by smtp.gmail.com with ESMTPSA id c15sm16692204wrs.19.2021.11.02.06.13.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 02 Nov 2021 06:13:15 -0700 (PDT)
From: Juan Quintela <quintela@redhat.com>
To: Leonardo Bras <leobras@redhat.com>
Subject: Re: [PATCH v4 2/3] QIOChannelSocket: Implement io_writev_zerocopy &
 io_flush_zerocopy for CONFIG_LINUX
In-Reply-To: <20211009075612.230283-3-leobras@redhat.com> (Leonardo Bras's
 message of "Sat, 9 Oct 2021 04:56:12 -0300")
References: <20211009075612.230283-1-leobras@redhat.com>
 <20211009075612.230283-3-leobras@redhat.com>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
Date: Tue, 02 Nov 2021 14:13:14 +0100
Message-ID: <87o872k8et.fsf@secure.mitica>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=quintela@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
Received-SPF: pass client-ip=170.10.133.124; envelope-from=quintela@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.702,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Reply-To: quintela@redhat.com
Cc: "Daniel P. =?utf-8?Q?Berrang=C3=A9?=" <berrange@redhat.com>,
 qemu-devel@nongnu.org, Jason Wang <jasowang@redhat.com>, "Dr. David
 Alan Gilbert" <dgilbert@redhat.com>, Peter Xu <peterx@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, Eric Blake <eblake@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Leonardo Bras <leobras@redhat.com> wrote:
> For CONFIG_LINUX, implement the new optional callbacks io_write_zerocopy and
> io_flush_zerocopy on QIOChannelSocket, but enables it only when MSG_ZEROCOPY
> feature is available in the host kernel, which is checked on
> qio_channel_socket_connect_sync()
>
> qio_channel_socket_writev() contents were moved to a helper function
> qio_channel_socket_writev_flags() which accepts an extra argument for flags.
> (This argument is passed directly to sendmsg().
>
> The above helper function is used to implement qio_channel_socket_writev(),
> with flags = 0, keeping it's behavior unchanged, and
> qio_channel_socket_writev_zerocopy() with flags = MSG_ZEROCOPY.
>
> qio_channel_socket_flush_zerocopy() was implemented by counting how many times
> sendmsg(...,MSG_ZEROCOPY) was sucessfully called, and then reading the
> socket's error queue, in order to find how many of them finished sending.
> Flush will loop until those counters are the same, or until some error ocurs.
>
> A new function qio_channel_socket_poll() was also created in order to avoid
> busy-looping recvmsg() in qio_channel_socket_flush_zerocopy() while waiting for
> updates in socket's error queue.
>
> Notes on using writev_zerocopy():
> 1: Buffer
> - As MSG_ZEROCOPY tells the kernel to use the same user buffer to avoid copying,
> some caution is necessary to avoid overwriting any buffer before it's sent.
> If something like this happen, a newer version of the buffer may be sent instead.
> - If this is a problem, it's recommended to call flush_zerocopy() before freeing
> or re-using the buffer.
>
> 2: Locked memory
> - When using MSG_ZERCOCOPY, the buffer memory will be locked after queued, and
> unlocked after it's sent.
> - Depending on the size of each buffer, and how often it's sent, it may require
> a larger amount of locked memory than usually available to non-root user.
> - If the required amount of locked memory is not available, writev_zerocopy
> will return an error, which can abort an operation like migration,
> - Because of this, when an user code wants to add zerocopy as a feature, it
> requires a mechanism to disable it, so it can still be acessible to less
> privileged users.
>
> Signed-off-by: Leonardo Bras <leobras@redhat.com>

I think this patch would be easier to review if you split in:
- add the flags parameter left and right
- add the meat of what you do with the flags.

> +++ b/include/io/channel-socket.h
> @@ -47,6 +47,8 @@ struct QIOChannelSocket {
>      socklen_t localAddrLen;
>      struct sockaddr_storage remoteAddr;
>      socklen_t remoteAddrLen;
> +    ssize_t zerocopy_queued;
> +    ssize_t zerocopy_sent;

I am not sure if this is good/bad to put it inside

#ifdef CONFIG_LINUX

basically everything else uses it.

> +#ifdef CONFIG_LINUX
> +    ret = qemu_setsockopt(fd, SOL_SOCKET, SO_ZEROCOPY, &v, sizeof(v));
> +    if (ret < 0) {
> +        /* Zerocopy not available on host */
> +        return 0;
> +    }
> +
> +    qio_channel_set_feature(QIO_CHANNEL(ioc),
> +                            QIO_CHANNEL_FEATURE_WRITE_ZEROCOPY);

As Peter said, you shouldn't fail if the feature is not there.

But on the other hand, on patch 3, you don't check that this feature
exist when you allow to enable multifd_zerocopy.

> +#endif
> +
>      return 0;
>  }


>          error_setg_errno(errp, errno,
>                           "Unable to write to socket");

Why do you split this in two lines?

Yes, I know that this file is not consistent either on how the do with
this, sometimes one line, otherwise more.

I don't know how ZEROCPY works at kernel level to comment on rest of the
patch.

Later, Juan.


