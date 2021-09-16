Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0555340D68D
	for <lists+qemu-devel@lfdr.de>; Thu, 16 Sep 2021 11:47:01 +0200 (CEST)
Received: from localhost ([::1]:33922 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mQnys-0007d7-MF
	for lists+qemu-devel@lfdr.de; Thu, 16 Sep 2021 05:46:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34622)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1mQnxQ-0006X8-0m
 for qemu-devel@nongnu.org; Thu, 16 Sep 2021 05:45:30 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:34509)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1mQnxK-0000ly-T9
 for qemu-devel@nongnu.org; Thu, 16 Sep 2021 05:45:26 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1631785521;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=ZGGshJIvgqZSfOfN7MsfLJTW29Ohob9tN5zKnbmmZjI=;
 b=PYlgxNGaqHe8ap5D6okdvjgcvFOGWeU/Kkp9cCsUmTTPQbpgpSC8DFv6BUxwq6MwYT1E6Q
 RZzvg0vowOXgXzYXGsPdRxU3Y5v0ZmU1ovsNUWys4pLIdvB3nJ6Mjwb9iiJj5a6p0FOHCj
 MlRyThYSewr8lGGdzXOTGFjyf3JrbWs=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-28-Ehdfc9MdMl2jO0ui-koKWg-1; Thu, 16 Sep 2021 05:44:39 -0400
X-MC-Unique: Ehdfc9MdMl2jO0ui-koKWg-1
Received: by mail-wm1-f70.google.com with SMTP id
 5-20020a1c00050000b02902e67111d9f0so2894943wma.4
 for <qemu-devel@nongnu.org>; Thu, 16 Sep 2021 02:44:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=ZGGshJIvgqZSfOfN7MsfLJTW29Ohob9tN5zKnbmmZjI=;
 b=093KLAxfRMk87TMH6vSOk3w6+WQ08p0V84n9VUPXV9r6/fg1aBU3h1ef3+6uNQywYi
 jhtLtPvJWrNCg94dlhyLxowrWUhaLPVknIyLLtQjjWFhO/WGKYOjdIBC0zSW+OV4Zrp/
 kmpr6FQI1CDp60woZZetdPIQBUZoezoZthGGOx2rbU4HafyNx9DTFJbSAdUDUZEOfmJT
 3Ie2TioKrBVoQ4SMGGzBwN+RAdm1KIc100h8G/S+zJcJz52uwV/0R1sjWULY3bd5RLTy
 bmIvWo6HuHHiChDg79vAKZYSBg/Z0PsAlxYlhKRv8RYgBl/g3HzQ9ShEbStsCuY8En2b
 G9GQ==
X-Gm-Message-State: AOAM532AzLNdAJL+VDtOaCKsRbMVhb9ydrIxWI7KGixzOeTwJqom2f2L
 inYckkFnrD9Ihn4UPIcPKIR1jVKiCVpUpF4Evlai4so5cjFRJEV7JUTf2o8uoUC47cgbYpRfP/h
 LCyiJjxWDWqihEvc=
X-Received: by 2002:a1c:2587:: with SMTP id l129mr9165740wml.109.1631785478632; 
 Thu, 16 Sep 2021 02:44:38 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyf96GEnYSWdEYKv7zFbUSzDr+y8QZMVv+s77s9TswCtiSnZdu1svh6/r9FBhQI3w06Ftxtog==
X-Received: by 2002:a1c:2587:: with SMTP id l129mr9165729wml.109.1631785478454; 
 Thu, 16 Sep 2021 02:44:38 -0700 (PDT)
Received: from work-vm (cpc109021-salf6-2-0-cust453.10-2.cable.virginm.net.
 [82.29.237.198])
 by smtp.gmail.com with ESMTPSA id r25sm2968929wrc.26.2021.09.16.02.44.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 16 Sep 2021 02:44:37 -0700 (PDT)
Date: Thu, 16 Sep 2021 10:44:35 +0100
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: Thomas Huth <thuth@redhat.com>
Subject: Re: [PATCH] tools/virtiofsd: Add fstatfs64 syscall to the seccomp
 allowlist
Message-ID: <YUMSA0vPS0Kj8Hzn@work-vm>
References: <20210914123214.181885-1-thuth@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210914123214.181885-1-thuth@redhat.com>
User-Agent: Mutt/2.0.7 (2021-05-04)
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dgilbert@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=dgilbert@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.39,
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
Cc: virtio-fs@redhat.com, qemu-s390x@nongnu.org, qemu-devel@nongnu.org,
 Stefan Hajnoczi <stefanha@redhat.com>, Vivek Goyal <vgoyal@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

* Thomas Huth (thuth@redhat.com) wrote:
> The virtiofsd currently crashes on s390x when doing something like
> this in the guest:
> 
>  mkdir -p /mnt/myfs
>  mount -t virtiofs myfs /mnt/myfs
>  touch /mnt/myfs/foo.txt
>  stat -f /mnt/myfs/foo.txt
> 
> The problem is that the fstatfs64 syscall is called in this case
> from the virtiofsd. We have to put it on the seccomp allowlist to
> avoid that the daemon gets killed in this case.
> 
> Buglink: https://bugzilla.redhat.com/show_bug.cgi?id=2001728
> Suggested-by: Vivek Goyal <vgoyal@redhat.com>
> Signed-off-by: Thomas Huth <thuth@redhat.com>

Thanks, and queued.

> ---
>  tools/virtiofsd/passthrough_seccomp.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/tools/virtiofsd/passthrough_seccomp.c b/tools/virtiofsd/passthrough_seccomp.c
> index f49ed94b5e..a3ce9f898d 100644
> --- a/tools/virtiofsd/passthrough_seccomp.c
> +++ b/tools/virtiofsd/passthrough_seccomp.c
> @@ -51,6 +51,7 @@ static const int syscall_allowlist[] = {
>      SCMP_SYS(fsetxattr),
>      SCMP_SYS(fstat),
>      SCMP_SYS(fstatfs),
> +    SCMP_SYS(fstatfs64),
>      SCMP_SYS(fsync),
>      SCMP_SYS(ftruncate),
>      SCMP_SYS(futex),
> -- 
> 2.27.0
> 
-- 
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK


