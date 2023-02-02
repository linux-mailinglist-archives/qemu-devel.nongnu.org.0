Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 93C4668885C
	for <lists+qemu-devel@lfdr.de>; Thu,  2 Feb 2023 21:42:51 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pNgOY-0002CI-Ej; Thu, 02 Feb 2023 15:41:22 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1pNgOR-00029J-ME
 for qemu-devel@nongnu.org; Thu, 02 Feb 2023 15:41:17 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1pNgOP-00057f-RP
 for qemu-devel@nongnu.org; Thu, 02 Feb 2023 15:41:15 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1675370472;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=A4gaRVl/oNfCE7tR1em2hTusouheblB3fnB0T0WOuVg=;
 b=b5/LT+Mjs/Vb8LKwiB1X82J1lxT+W+B8uw1GXeQi3UZK0MAAI0DB3KBWtWDq+SF3OwhEsT
 nOqmvAFh6SVZW5jKNIk04l4qDw0cxCQF6LGvORFEogMy1hnYn7XZI9Ai4aSMxE5pLidzX0
 2qEe2t/Jffz3JPTvRgm7XMo+HwfaAnY=
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com
 [209.85.160.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-593-SpF5jNZjP3eVXXyLiv-GJw-1; Thu, 02 Feb 2023 15:41:11 -0500
X-MC-Unique: SpF5jNZjP3eVXXyLiv-GJw-1
Received: by mail-qt1-f198.google.com with SMTP id
 bz17-20020a05622a1e9100b003b9c1013018so1564163qtb.18
 for <qemu-devel@nongnu.org>; Thu, 02 Feb 2023 12:41:10 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=A4gaRVl/oNfCE7tR1em2hTusouheblB3fnB0T0WOuVg=;
 b=6tZJPLZdFQ6hVCsKs0xDoZjaluI9Gu8xQrn5H5ICgnahLQ03kPmalM3VCUyi9UepJ2
 oKdAO2VEiIvkSvC64ewmAesqz2RlrKPA1oUekSE2Lg+eX61Gngtn84A5dFdNhIf/BNOE
 gDgr32nsi6+wdmQY/CEobL9R8yh8Yf/mzUiPvIDxFJGA5ElZMeLpgFR/CS9n8fnN1WgI
 Or7M6Uf1RwqjBNgAex1VLmwQ3xMrIYwWizOz6BnO91hOoxlREBR8CEv3pL520CtRZ/jc
 /5LA9ltpHSfSIQnwRRuTRCZINGHEafhyYxmaWSAAb114I4rKSCKKwU2wgUdEvXO1WKbN
 hajw==
X-Gm-Message-State: AO0yUKWn00N84kVlq/P3CV+4Ko0Gt4ApeUBir7j3oPcOnPP3QhU5C7IJ
 PZmKUPM/MrT/AhDFdPg09gGYE4F1fnZ4PzEMN1cUJF4FYX351UczhsRB5dzCUFXccAKn1qwZluh
 8dTNHf3Nlt24WHZM=
X-Received: by 2002:a0c:ef05:0:b0:537:6e4c:ac60 with SMTP id
 t5-20020a0cef05000000b005376e4cac60mr11973390qvr.2.1675370470411; 
 Thu, 02 Feb 2023 12:41:10 -0800 (PST)
X-Google-Smtp-Source: AK7set9DE7MQthQ9zkKdFZfWmWZvni3JNVCQCgYD3z5Ui1HkfWXTnlGM4wpLh6cr7Rebn/xWzFjSNg==
X-Received: by 2002:a0c:ef05:0:b0:537:6e4c:ac60 with SMTP id
 t5-20020a0cef05000000b005376e4cac60mr11973363qvr.2.1675370470142; 
 Thu, 02 Feb 2023 12:41:10 -0800 (PST)
Received: from x1n (bras-base-aurron9127w-grc-56-70-30-145-63.dsl.bell.ca.
 [70.30.145.63]) by smtp.gmail.com with ESMTPSA id
 g12-20020a05620a278c00b0070531c5d655sm408481qkp.90.2023.02.02.12.41.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 02 Feb 2023 12:41:09 -0800 (PST)
Date: Thu, 2 Feb 2023 15:41:08 -0500
From: Peter Xu <peterx@redhat.com>
To: Juan Quintela <quintela@redhat.com>
Cc: qemu-devel@nongnu.org, Leonardo Bras Soares Passos <lsoaresp@redhat.com>,
 Michal =?utf-8?B?UHLDrXZvem7DrWs=?= <mprivozn@redhat.com>,
 Daniel P =?utf-8?B?LiBCZXJyYW5nw6k=?= <berrange@redhat.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>
Subject: Re: [PATCH v2 3/3] util/userfaultfd: Support /dev/userfaultfd
Message-ID: <Y9wf5AI4xmHhNCTM@x1n>
References: <20230201211055.649442-1-peterx@redhat.com>
 <20230201211055.649442-4-peterx@redhat.com>
 <87cz6stk4a.fsf@secure.mitica>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <87cz6stk4a.fsf@secure.mitica>
Received-SPF: pass client-ip=170.10.129.124; envelope-from=peterx@redhat.com;
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Thu, Feb 02, 2023 at 11:52:21AM +0100, Juan Quintela wrote:
> Peter Xu <peterx@redhat.com> wrote:
> > Teach QEMU to use /dev/userfaultfd when it existed and fallback to the
> > system call if either it's not there or doesn't have enough permission.
> >
> > Firstly, as long as the app has permission to access /dev/userfaultfd, it
> > always have the ability to trap kernel faults which QEMU mostly wants.
> > Meanwhile, in some context (e.g. containers) the userfaultfd syscall can be
> > forbidden, so it can be the major way to use postcopy in a restricted
> > environment with strict seccomp setup.
> >
> > Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
> > Signed-off-by: Peter Xu <peterx@redhat.com>
> 
> 
> Hi

Hi, Juan,

> 
> Can we change this code to not use the global variable.
> 
> > ---
> >  util/trace-events  |  1 +
> >  util/userfaultfd.c | 37 +++++++++++++++++++++++++++++++++++++
> >  2 files changed, 38 insertions(+)
> >
> > diff --git a/util/trace-events b/util/trace-events
> > index c8f53d7d9f..16f78d8fe5 100644
> > --- a/util/trace-events
> > +++ b/util/trace-events
> > @@ -93,6 +93,7 @@ qemu_vfio_region_info(const char *desc, uint64_t region_ofs, uint64_t region_siz
> >  qemu_vfio_pci_map_bar(int index, uint64_t region_ofs, uint64_t region_size, int ofs, void *host) "map region bar#%d addr 0x%"PRIx64" size 0x%"PRIx64" ofs 0x%x host %p"
> >  
> >  #userfaultfd.c
> > +uffd_detect_open_mode(int mode) "%d"
> >  uffd_query_features_nosys(int err) "errno: %i"
> >  uffd_query_features_api_failed(int err) "errno: %i"
> >  uffd_create_fd_nosys(int err) "errno: %i"
> > diff --git a/util/userfaultfd.c b/util/userfaultfd.c
> > index 9845a2ec81..7dceab51d6 100644
> > --- a/util/userfaultfd.c
> > +++ b/util/userfaultfd.c
> > @@ -18,10 +18,47 @@
> >  #include <poll.h>
> >  #include <sys/syscall.h>
> >  #include <sys/ioctl.h>
> > +#include <fcntl.h>
> > +
> > +typedef enum {
> > +    UFFD_UNINITIALIZED = 0,
> > +    UFFD_USE_DEV_PATH,
> > +    UFFD_USE_SYSCALL,
> > +} uffd_open_mode;
> > +
> > +static int uffd_dev;
> > +
> > +static uffd_open_mode uffd_detect_open_mode(void)
> > +{
> > +    static uffd_open_mode open_mode;
> > +
> > +    if (open_mode == UFFD_UNINITIALIZED) {
> > +        /*
> > +         * Make /dev/userfaultfd the default approach because it has better
> > +         * permission controls, meanwhile allows kernel faults without any
> > +         * privilege requirement (e.g. SYS_CAP_PTRACE).
> > +         */
> > +        uffd_dev = open("/dev/userfaultfd", O_RDWR | O_CLOEXEC);
> > +        if (uffd_dev >= 0) {
> > +            open_mode = UFFD_USE_DEV_PATH;
> > +        } else {
> > +            /* Fallback to the system call */
> > +            open_mode = UFFD_USE_SYSCALL;
> > +        }
> > +        trace_uffd_detect_open_mode(open_mode);
> > +    }
> > +
> > +    return open_mode;
> > +}
> >  
> >  int uffd_open(int flags)
> >  {
> >  #if defined(__linux__) && defined(__NR_userfaultfd)
> > +    if (uffd_detect_open_mode() == UFFD_USE_DEV_PATH) {
> > +        assert(uffd_dev >= 0);
> > +        return ioctl(uffd_dev, USERFAULTFD_IOC_NEW, flags);
> > +    }
> > +
> >      return syscall(__NR_userfaultfd, flags);
> >  #else
> >      return -EINVAL;
> 
> static int open_userfaultd(void)
> {
>     /*
>      * Make /dev/userfaultfd the default approach because it has better
>      * permission controls, meanwhile allows kernel faults without any
>      * privilege requirement (e.g. SYS_CAP_PTRACE).
>      */
>      int uffd = open("/dev/userfaultfd", O_RDWR | O_CLOEXEC);
>      if (uffd >= 0) {
>             return uffd;
>      }
>      return -1;
> }
> 
> int uffd_open(int flags)
> {
> #if defined(__linux__) && defined(__NR_userfaultfd)
>     static int uffd = -2;
>     if (uffd == -2) {
>         uffd = open_userfaultd();
>     }
>     if (uffd >= 0) {
>         return ioctl(uffd, USERFAULTFD_IOC_NEW, flags);
>     }
>     return syscall(__NR_userfaultfd, flags);
> #else
>      return -EINVAL;
> 
> 27 lines vs 42
> 
> No need for enum type
> No need for global variable
> 
> What do you think?

Yes, as I used to reply to Phil I think it can be simplified.  I did this
major for (1) better readability, and (2) being crystal clear on which way
we used to open /dev/userfaultfd, then guarantee we're keeping using it. so
at least I prefer keeping things like trace_uffd_detect_open_mode().

I also plan to add another mode when fd-mode is there even if it'll reuse
the same USERFAULTFD_IOC_NEW; they can be useful information when a failure
happens.

Though if you insist, I can switch to the simple version too.

-- 
Peter Xu


