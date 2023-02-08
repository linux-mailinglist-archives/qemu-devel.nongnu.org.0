Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C6EF68F7D3
	for <lists+qemu-devel@lfdr.de>; Wed,  8 Feb 2023 20:07:07 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pPpmG-00069V-Ky; Wed, 08 Feb 2023 14:06:44 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1pPpmE-00068y-2N
 for qemu-devel@nongnu.org; Wed, 08 Feb 2023 14:06:42 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1pPpmC-0002Qm-KC
 for qemu-devel@nongnu.org; Wed, 08 Feb 2023 14:06:41 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1675883199;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=x2eEPwwUPiMK0MEbN1ye2EeZ7QgJsoE/HwGjrBJQVwA=;
 b=XdIe88QBE8KhxHSBAmUSUmES+KgxLGRtZobN0cJYsaWWn3eUyI3E6thykFvbLizjpkOdr1
 +xckr9in8QbJ9Wt0U+JqXv33kU2vcOSkO2WvolOX69D66dGofx5J2Ld+QwJkk6i6UbmZcV
 1xZP/fPrbkAPcfXmYhFkZeovGY3a2jg=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-377-7Dpcg5IQNUCrMpzD9DUlTg-1; Wed, 08 Feb 2023 14:06:38 -0500
X-MC-Unique: 7Dpcg5IQNUCrMpzD9DUlTg-1
Received: by mail-wm1-f69.google.com with SMTP id
 d14-20020a05600c34ce00b003dd07ce79c8so1477581wmq.1
 for <qemu-devel@nongnu.org>; Wed, 08 Feb 2023 11:06:37 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=mime-version:message-id:date:reply-to:user-agent:references
 :in-reply-to:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=x2eEPwwUPiMK0MEbN1ye2EeZ7QgJsoE/HwGjrBJQVwA=;
 b=jJR9HH5x+lFKpvH5eTg6q/wTwkLtT77p9iiY/HMeKmt2nytn53adoi2EbFDd5diZh1
 gcuVHqZue5M9WeaT4fG4k9PXOIic8BhER+PcMlTb90CvWn1wsCUReb9bP9EhEC7v4e89
 VpO6tzC6M3VBfnLxl16786XlvfG1UZj6gvpWA+/r6fWd6CXd5Y4rElZm7CDJSz+3k9nF
 IDN0h6O5+b0wFLBSdw9KfceCTrpkB2IP68S4u5R9ndaSvsBFcgqiYY7HZ1GoXpsBl44M
 O+iot5HdQq7oDN6/QkiEPh5JRa5m9jLrLzATWFxuEjWufcfV4rYWi/HH0ePk+38xBCVb
 2kYA==
X-Gm-Message-State: AO0yUKUfamGBKC7jVhRRv3aHMaZwuH1l4Ur6mqX0vRkK6C698q7n2UoW
 VHtwG1F9sY6U4apv3/rKprhSlc8o8lmeIz+ljcMNC57/A28FfZ4cKA2ULkjv7ksumjZoZTzgMvN
 PCpf94Bq22D7OkF8=
X-Received: by 2002:a05:600c:3b92:b0:3df:eedf:df1c with SMTP id
 n18-20020a05600c3b9200b003dfeedfdf1cmr9932813wms.38.1675883196740; 
 Wed, 08 Feb 2023 11:06:36 -0800 (PST)
X-Google-Smtp-Source: AK7set8qQj/C8zhJOKn3QXmQUUFJJbpb82oGTsJLrqg+OLbUAZ8/LSG3o0KuE+TuOVm9qRF1z861yw==
X-Received: by 2002:a05:600c:3b92:b0:3df:eedf:df1c with SMTP id
 n18-20020a05600c3b9200b003dfeedfdf1cmr9932801wms.38.1675883196569; 
 Wed, 08 Feb 2023 11:06:36 -0800 (PST)
Received: from redhat.com ([46.136.252.173]) by smtp.gmail.com with ESMTPSA id
 i12-20020a1c540c000000b003dc5b59ed7asm2746662wmb.11.2023.02.08.11.06.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 08 Feb 2023 11:06:35 -0800 (PST)
From: Juan Quintela <quintela@redhat.com>
To: Peter Xu <peterx@redhat.com>
Cc: qemu-devel@nongnu.org,  Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?=
 <philmd@linaro.org>,
 Michal =?utf-8?B?UHLDrXZvem7DrWs=?= <mprivozn@redhat.com>,  Leonardo Bras
 Soares Passos
 <lsoaresp@redhat.com>,  "Dr . David Alan Gilbert" <dgilbert@redhat.com>,
 Daniel P . =?utf-8?Q?Berrang=C3=A9?= <berrange@redhat.com>
Subject: Re: [PATCH v3 2/2] util/userfaultfd: Support /dev/userfaultfd
In-Reply-To: <20230207205711.1187216-3-peterx@redhat.com> (Peter Xu's message
 of "Tue, 7 Feb 2023 15:57:11 -0500")
References: <20230207205711.1187216-1-peterx@redhat.com>
 <20230207205711.1187216-3-peterx@redhat.com>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
Date: Wed, 08 Feb 2023 20:06:35 +0100
Message-ID: <87wn4s9dtw.fsf@secure.mitica>
MIME-Version: 1.0
Content-Type: text/plain
Received-SPF: pass client-ip=170.10.129.124; envelope-from=quintela@redhat.com;
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
Reply-To: quintela@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Peter Xu <peterx@redhat.com> wrote:
> Teach QEMU to use /dev/userfaultfd when it existed and fallback to the
> system call if either it's not there or doesn't have enough permission.
>
> Firstly, as long as the app has permission to access /dev/userfaultfd, it
> always have the ability to trap kernel faults which QEMU mostly wants.
> Meanwhile, in some context (e.g. containers) the userfaultfd syscall can be
> forbidden, so it can be the major way to use postcopy in a restricted
> environment with strict seccomp setup.
>
> Signed-off-by: Peter Xu <peterx@redhat.com>

Reviewed-by: Juan Quintela <quintela@redhat.com>

> diff --git a/util/userfaultfd.c b/util/userfaultfd.c
> index 4953b3137d..fdff4867e8 100644
> --- a/util/userfaultfd.c
> +++ b/util/userfaultfd.c
> @@ -18,10 +18,42 @@
>  #include <poll.h>
>  #include <sys/syscall.h>
>  #include <sys/ioctl.h>
> +#include <fcntl.h>
> +
> +typedef enum {
> +    UFFD_UNINITIALIZED = 0,
> +    UFFD_USE_DEV_PATH,
> +    UFFD_USE_SYSCALL,
> +} uffd_open_mode;

Having an enum or a magic -2 value, better the enum O:-)

>  int uffd_open(int flags)
>  {
>  #if defined(__NR_userfaultfd)
> +    static uffd_open_mode open_mode;
> +    static int uffd_dev;
> +
> +    /* Detect how to generate uffd desc when run the 1st time */
> +    if (open_mode == UFFD_UNINITIALIZED) {
> +        /*
> +         * Make /dev/userfaultfd the default approach because it has better
> +         * permission controls, meanwhile allows kernel faults without any
> +         * privilege requirement (e.g. SYS_CAP_PTRACE).
> +         */
> +        uffd_dev = open("/dev/userfaultfd", O_RDWR | O_CLOEXEC);
> +        if (uffd_dev >= 0) {
> +            open_mode = UFFD_USE_DEV_PATH;
> +        } else {
> +            /* Fallback to the system call */
> +            open_mode = UFFD_USE_SYSCALL;
> +        }
> +        trace_uffd_detect_open_mode(open_mode);
> +    }
> +
> +    if (open_mode == UFFD_USE_DEV_PATH) {
> +        assert(uffd_dev >= 0);
> +        return ioctl(uffd_dev, USERFAULTFD_IOC_NEW, flags);
> +    }
> +
>      return syscall(__NR_userfaultfd, flags);
>  #else
>      return -EINVAL;

The rest is ok, thanks.

queued.


