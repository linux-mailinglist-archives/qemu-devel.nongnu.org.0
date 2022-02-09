Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 831A84AF282
	for <lists+qemu-devel@lfdr.de>; Wed,  9 Feb 2022 14:18:58 +0100 (CET)
Received: from localhost ([::1]:58988 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nHms5-0006vi-J1
	for lists+qemu-devel@lfdr.de; Wed, 09 Feb 2022 08:18:57 -0500
Received: from eggs.gnu.org ([209.51.188.92]:47010)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1nHmPy-0002dd-CF
 for qemu-devel@nongnu.org; Wed, 09 Feb 2022 07:49:55 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:52744)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1nHmPv-0001cU-IF
 for qemu-devel@nongnu.org; Wed, 09 Feb 2022 07:49:53 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1644410989;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=IJF7EW64LhDxzjHF1y+77XxTI2YgzIC8yeuKSel82Z0=;
 b=J6HDf8yloA4V9mbAGu89BqqWae3NDYvVLC+2sMXaGcXdeQ3NkkQAKVa390Kaqk5UUXARW+
 3JP55o2TpWt92nxFJkrUs59N/7ux5Ys1gICvhThAuTfSipx2XsaW9SRDzZ22gCDrffmEBb
 1ARXX9Ea4WJJxLlxIypHwNOpwvZ/bxI=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-272-7V_1C7msPOWA7PIPedssTw-1; Wed, 09 Feb 2022 07:49:47 -0500
X-MC-Unique: 7V_1C7msPOWA7PIPedssTw-1
Received: by mail-wm1-f69.google.com with SMTP id
 n3-20020a05600c294300b0037bc685b717so447437wmd.8
 for <qemu-devel@nongnu.org>; Wed, 09 Feb 2022 04:49:46 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=IJF7EW64LhDxzjHF1y+77XxTI2YgzIC8yeuKSel82Z0=;
 b=GDL+1Uh63//+a5gK85SDPVKvxuyy6NkZSGUysp39VUN5JK/U5lijb0Tr88kcLuWqzn
 ABO0zlef0ChmOEehMaEjx6cuAHa3WrGEu+MYzDTOuukCTc6bm6pYwCsHDD8/FjNuGkUd
 1UM32uBCfO/TOcpQQJf/ZjLFtoGJZMdZAvZPqbjBpZmtyyPAy0qFz7wPDRXBhyk84SKt
 Qc+pK2rRW4O9/LksihUq2pcTEYqTWIoUUMc/y959Wi6zFvFY+zIUYR+//UBJnJcEZOtI
 O5b3vYUbQ7ZCNkJ3L0xs/GbcwoJmBNRX33oi0VPbbBsWBAf5dMjOpMfCFsSPQJCmE682
 Rv7Q==
X-Gm-Message-State: AOAM532NhTxYXuMgn643SihVaSG5VDbY3S4yPRv8RW6kEN0CgblILNyJ
 R4/cl0ziQ/xFJL/d7ZaFfFPCkgI4AVa4hEsDBKpHAvlbta4anl9aINbA1Wlwm18vOO8UfDVdIN0
 X3hAZkmj5yUieHPA=
X-Received: by 2002:a05:600c:19d0:: with SMTP id
 u16mr2457166wmq.35.1644410985318; 
 Wed, 09 Feb 2022 04:49:45 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyLHKcYS9UtTKROvjD8UmwYzbg13uPEIbEYh9qKTE5zvjS2SUl/bRqon/0bL0JUn7xvK1mnow==
X-Received: by 2002:a05:600c:19d0:: with SMTP id
 u16mr2457156wmq.35.1644410985129; 
 Wed, 09 Feb 2022 04:49:45 -0800 (PST)
Received: from work-vm (cpc109025-salf6-2-0-cust480.10-2.cable.virginm.net.
 [82.30.61.225])
 by smtp.gmail.com with ESMTPSA id t4sm15221138wro.71.2022.02.09.04.49.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 09 Feb 2022 04:49:44 -0800 (PST)
Date: Wed, 9 Feb 2022 12:49:42 +0000
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: christian.ehrhardt@canonical.com
Subject: Re: [PATCH] tools/virtiofsd: Add rseq syscall to the seccomp allowlist
Message-ID: <YgO4ZrshcZAXP9z6@work-vm>
References: <20220209111456.3328420-1-christian.ehrhardt@canonical.com>
MIME-Version: 1.0
In-Reply-To: <20220209111456.3328420-1-christian.ehrhardt@canonical.com>
User-Agent: Mutt/2.1.5 (2021-12-30)
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dgilbert@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=dgilbert@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: qemu-devel <qemu-devel@nongnu.org>, Stefan Hajnoczi <stefanha@redhat.com>,
 Michael Hudson-Doyle <michael.hudson@canonical.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

* christian.ehrhardt@canonical.com (christian.ehrhardt@canonical.com) wrote:
> From: Christian Ehrhardt <christian.ehrhardt@canonical.com>
> 
> The virtiofsd currently crashes when used with glibc 2.35.
> That is due to the rseq system call being added to every thread
> creation [1][2].
> 
> [1]: https://www.efficios.com/blog/2019/02/08/linux-restartable-sequences/
> [2]: https://sourceware.org/pipermail/libc-alpha/2022-February/136040.html
> 
> This happens not at daemon start, but when a guest connects
> 
>     /usr/lib/qemu/virtiofsd -f --socket-path=/tmp/testvfsd -o sandbox=chroot \
>         -o source=/var/guests/j-virtiofs --socket-group=kvm
>     virtio_session_mount: Waiting for vhost-user socket connection...
>     # start ok, now guest will connect
>     virtio_session_mount: Received vhost-user socket connection
>     virtio_loop: Entry
>     fv_queue_set_started: qidx=0 started=1
>     fv_queue_set_started: qidx=1 started=1
>     Bad system call (core dumped)
> 
> We have to put rseq on the seccomp allowlist to avoid that the daemon
> is crashing in this case.
> 
> Reported-by: Michael Hudson-Doyle <michael.hudson@canonical.com>
> Signed-off-by: Christian Ehrhardt <christian.ehrhardt@canonical.com>

Thanks! I bet this is going to pop up in zillions of programs.

Reviewed-by: Dr. David Alan Gilbert <dgilbert@redhat.com>

> ---
>  tools/virtiofsd/passthrough_seccomp.c | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/tools/virtiofsd/passthrough_seccomp.c b/tools/virtiofsd/passthrough_seccomp.c
> index a3ce9f898d..21b8f53bd9 100644
> --- a/tools/virtiofsd/passthrough_seccomp.c
> +++ b/tools/virtiofsd/passthrough_seccomp.c
> @@ -116,6 +116,9 @@ static const int syscall_allowlist[] = {
>      SCMP_SYS(write),
>      SCMP_SYS(writev),
>      SCMP_SYS(umask),
> +#ifdef __NR_rseq
> +    SCMP_SYS(rseq), /* required since glibc 2.35 */
> +#endif
>  };
>  
>  /* Syscalls used when --syslog is enabled */
> -- 
> 2.35.0
> 
> 
-- 
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK


