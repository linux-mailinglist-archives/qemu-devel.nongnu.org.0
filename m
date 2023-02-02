Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 41815687AE0
	for <lists+qemu-devel@lfdr.de>; Thu,  2 Feb 2023 11:52:48 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pNXCn-0005WR-QE; Thu, 02 Feb 2023 05:52:37 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1pNXCf-0005Tt-04
 for qemu-devel@nongnu.org; Thu, 02 Feb 2023 05:52:31 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1pNXCd-00035l-0c
 for qemu-devel@nongnu.org; Thu, 02 Feb 2023 05:52:28 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1675335146;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=qVfyrwwAUX4OZfMPxT4ryhG/9BPzqZcqJYMbwybzl7s=;
 b=dHpsxUfhMFOADHRRMmO/IQ3+Pee1N6NYVaLqffiIXXMC2XxGbC1xM+5hWxf8lNLHJZRhmB
 t8EVGIf+6DROwvGH26Z/fZs5xnxXh9YveuYbguXy5H09qUZnGcbhi+0OmkIOsTz/cc/ahe
 eWjOafSYr13qbnf9N4bXJ4lK1wGkrM0=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-668-S1_pdVCcOx6O8YPuhMDPRg-1; Thu, 02 Feb 2023 05:52:24 -0500
X-MC-Unique: S1_pdVCcOx6O8YPuhMDPRg-1
Received: by mail-wm1-f69.google.com with SMTP id
 k17-20020a05600c1c9100b003dd41ad974bso758139wms.3
 for <qemu-devel@nongnu.org>; Thu, 02 Feb 2023 02:52:24 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:reply-to
 :user-agent:references:in-reply-to:subject:cc:to:from
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=qVfyrwwAUX4OZfMPxT4ryhG/9BPzqZcqJYMbwybzl7s=;
 b=52bEoUkr7/FL7tMGraPQlWkcuA2U+EFdtI65X81rQdqB78Y9yM033pFnRYDeaXgLXX
 YHqzX1O32EgSb1oEmGbsPAfa/cave7v0tGOUBbj1k+4i/pIP+VAJYoGW8uE+/VwDhYdU
 YSo2TryG/K1jIAaub0avze1EcpTdSyjLfl2coxNYBbzN+blaBqnp76XlkKuCrG1NCI5u
 gyKNgYnE89zc10AkddvcZLZOb15kc49h83GiPamydPe9dW5aTFdQ237hFB+qVRv5LUuG
 KiQbLnG+0v418T8gaZ3zfEqre0jFhCU87liLmAu6KiMstv7TYVer+M7xqEmOm6unECFU
 pEWw==
X-Gm-Message-State: AO0yUKUeKzqW1X9koXymC0+r/Vy96GooqWhQFtnztQnlhosIO+Y4jb9m
 +Cj+wpJ7GTAXE/zTIqO739U+nsVxDHBCduVgdad0P9xfDoSuGMSVYccmzPrhBIz0Y+RnUY54Kb4
 gzDvRQ4ywlfaSnGQ=
X-Received: by 2002:a05:600c:3795:b0:3c6:e61e:ae71 with SMTP id
 o21-20020a05600c379500b003c6e61eae71mr5756592wmr.1.1675335143664; 
 Thu, 02 Feb 2023 02:52:23 -0800 (PST)
X-Google-Smtp-Source: AK7set+T7/tytnK6QYPUx7vK2qfwNb6wCMD4sYxQ0pev7+b1jPpqfx2/Vo5a6blGdNwQw32gqC8NIQ==
X-Received: by 2002:a05:600c:3795:b0:3c6:e61e:ae71 with SMTP id
 o21-20020a05600c379500b003c6e61eae71mr5756572wmr.1.1675335143423; 
 Thu, 02 Feb 2023 02:52:23 -0800 (PST)
Received: from redhat.com ([46.136.252.173]) by smtp.gmail.com with ESMTPSA id
 m17-20020a7bce11000000b003dc492e4430sm4475844wmc.28.2023.02.02.02.52.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 02 Feb 2023 02:52:22 -0800 (PST)
From: Juan Quintela <quintela@redhat.com>
To: Peter Xu <peterx@redhat.com>
Cc: qemu-devel@nongnu.org,  Leonardo Bras Soares Passos
 <lsoaresp@redhat.com>,  Michal =?utf-8?B?UHLDrXZvem7DrWs=?=
 <mprivozn@redhat.com>,  Daniel P
 . =?utf-8?Q?Berrang=C3=A9?= <berrange@redhat.com>,  Philippe =?utf-8?Q?Ma?=
 =?utf-8?Q?thieu-Daud=C3=A9?=
 <philmd@linaro.org>,  "Dr . David Alan Gilbert" <dgilbert@redhat.com>
Subject: Re: [PATCH v2 3/3] util/userfaultfd: Support /dev/userfaultfd
In-Reply-To: <20230201211055.649442-4-peterx@redhat.com> (Peter Xu's message
 of "Wed, 1 Feb 2023 16:10:55 -0500")
References: <20230201211055.649442-1-peterx@redhat.com>
 <20230201211055.649442-4-peterx@redhat.com>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
Date: Thu, 02 Feb 2023 11:52:21 +0100
Message-ID: <87cz6stk4a.fsf@secure.mitica>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.133.124; envelope-from=quintela@redhat.com;
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
> Meanwhile, in some context (e.g. containers) the userfaultfd syscall can =
be
> forbidden, so it can be the major way to use postcopy in a restricted
> environment with strict seccomp setup.
>
> Reviewed-by: Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org>
> Signed-off-by: Peter Xu <peterx@redhat.com>


Hi

Can we change this code to not use the global variable.

> ---
>  util/trace-events  |  1 +
>  util/userfaultfd.c | 37 +++++++++++++++++++++++++++++++++++++
>  2 files changed, 38 insertions(+)
>
> diff --git a/util/trace-events b/util/trace-events
> index c8f53d7d9f..16f78d8fe5 100644
> --- a/util/trace-events
> +++ b/util/trace-events
> @@ -93,6 +93,7 @@ qemu_vfio_region_info(const char *desc, uint64_t region=
_ofs, uint64_t region_siz
>  qemu_vfio_pci_map_bar(int index, uint64_t region_ofs, uint64_t region_si=
ze, int ofs, void *host) "map region bar#%d addr 0x%"PRIx64" size 0x%"PRIx6=
4" ofs 0x%x host %p"
>=20=20
>  #userfaultfd.c
> +uffd_detect_open_mode(int mode) "%d"
>  uffd_query_features_nosys(int err) "errno: %i"
>  uffd_query_features_api_failed(int err) "errno: %i"
>  uffd_create_fd_nosys(int err) "errno: %i"
> diff --git a/util/userfaultfd.c b/util/userfaultfd.c
> index 9845a2ec81..7dceab51d6 100644
> --- a/util/userfaultfd.c
> +++ b/util/userfaultfd.c
> @@ -18,10 +18,47 @@
>  #include <poll.h>
>  #include <sys/syscall.h>
>  #include <sys/ioctl.h>
> +#include <fcntl.h>
> +
> +typedef enum {
> +    UFFD_UNINITIALIZED =3D 0,
> +    UFFD_USE_DEV_PATH,
> +    UFFD_USE_SYSCALL,
> +} uffd_open_mode;
> +
> +static int uffd_dev;
> +
> +static uffd_open_mode uffd_detect_open_mode(void)
> +{
> +    static uffd_open_mode open_mode;
> +
> +    if (open_mode =3D=3D UFFD_UNINITIALIZED) {
> +        /*
> +         * Make /dev/userfaultfd the default approach because it has bet=
ter
> +         * permission controls, meanwhile allows kernel faults without a=
ny
> +         * privilege requirement (e.g. SYS_CAP_PTRACE).
> +         */
> +        uffd_dev =3D open("/dev/userfaultfd", O_RDWR | O_CLOEXEC);
> +        if (uffd_dev >=3D 0) {
> +            open_mode =3D UFFD_USE_DEV_PATH;
> +        } else {
> +            /* Fallback to the system call */
> +            open_mode =3D UFFD_USE_SYSCALL;
> +        }
> +        trace_uffd_detect_open_mode(open_mode);
> +    }
> +
> +    return open_mode;
> +}
>=20=20
>  int uffd_open(int flags)
>  {
>  #if defined(__linux__) && defined(__NR_userfaultfd)
> +    if (uffd_detect_open_mode() =3D=3D UFFD_USE_DEV_PATH) {
> +        assert(uffd_dev >=3D 0);
> +        return ioctl(uffd_dev, USERFAULTFD_IOC_NEW, flags);
> +    }
> +
>      return syscall(__NR_userfaultfd, flags);
>  #else
>      return -EINVAL;

static int open_userfaultd(void)
{
    /*
     * Make /dev/userfaultfd the default approach because it has better
     * permission controls, meanwhile allows kernel faults without any
     * privilege requirement (e.g. SYS_CAP_PTRACE).
     */
     int uffd =3D open("/dev/userfaultfd", O_RDWR | O_CLOEXEC);
     if (uffd >=3D 0) {
            return uffd;
     }
     return -1;
}

int uffd_open(int flags)
{
#if defined(__linux__) && defined(__NR_userfaultfd)
    static int uffd =3D -2;
    if (uffd =3D=3D -2) {
        uffd =3D open_userfaultd();
    }
    if (uffd >=3D 0) {
        return ioctl(uffd, USERFAULTFD_IOC_NEW, flags);
    }
    return syscall(__NR_userfaultfd, flags);
#else
     return -EINVAL;

27 lines vs 42

No need for enum type
No need for global variable

What do you think?

Later, Juan.


