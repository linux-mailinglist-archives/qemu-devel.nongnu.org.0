Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7638A68C8CF
	for <lists+qemu-devel@lfdr.de>; Mon,  6 Feb 2023 22:31:57 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pP956-0003vi-5z; Mon, 06 Feb 2023 16:31:20 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1pP950-0003vK-6X
 for qemu-devel@nongnu.org; Mon, 06 Feb 2023 16:31:14 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1pP94y-000117-Jv
 for qemu-devel@nongnu.org; Mon, 06 Feb 2023 16:31:13 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1675719072;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=NdnRbwWlooCL0zFFumc4wV1CRZU8huvC4QS3PBYR77k=;
 b=TLiim5a87dBZP/eVCCiAG5bO9+b2e/wZzfuSrZuruVWZTqzrziKaN/CtDMZPAVsb7eamWa
 Vk1XYPipsHGB2YyxapAatdRCTXLNNxwlwrnDOQILnJcCuHkr/xD7dYDuNf3vJk67A4WN2G
 UzWy8Br2hs9jhTNZ3qUgyVm+E0NDu2c=
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-439-_jL5k9njO9aEua5wQljwVA-1; Mon, 06 Feb 2023 16:31:03 -0500
X-MC-Unique: _jL5k9njO9aEua5wQljwVA-1
Received: by mail-qk1-f200.google.com with SMTP id
 x7-20020a05620a098700b007242aa494ddso8641877qkx.19
 for <qemu-devel@nongnu.org>; Mon, 06 Feb 2023 13:31:03 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=NdnRbwWlooCL0zFFumc4wV1CRZU8huvC4QS3PBYR77k=;
 b=STFQAdkFNaPRxEhTuAmbxE4Jo5bDTLW6d8Y8KNn2zHAclcFzbSnAbp9ifaPJyfj8j3
 DV7nyIu5s9NlKejLHI+dCX9s6v5r7qtjPaba1x8HauUHNJQ7y2rFKvbgTQscmaxwmWNc
 //vMwdm6gZh8pvRjAl01l+fy40FujGl+LeQMQRqFVmZGThkQVJT2ezWWEtVddkDdB9yO
 LgLl7FtpzdmG61rgJjHFC0hO27y0nv3yHeRscnri6k3L9az9XemmBfmg56/d1+c4fDUk
 VuJY5yEPccb9wP5Y5uQGjQ8mAYIGJyz2Yn1B+Ff2WUP3IXL6C+HivY8XZmTzOFzFbtvG
 x0cg==
X-Gm-Message-State: AO0yUKVZ7yABcV4VcSQAYg2KWNDRI0l4kFT8zChWyBguFGHAwe0b8LnT
 2Y9xW+XYcomyoTOKzIlS5g4WQ9zFHrRtj4B9LodSTIfr4T3YTkTQ1zexfNwpiJod8+2tOo/WbBS
 2dUTrL0d5x41CJls=
X-Received: by 2002:ac8:59c1:0:b0:3b8:6c6e:4949 with SMTP id
 f1-20020ac859c1000000b003b86c6e4949mr1815703qtf.4.1675719062715; 
 Mon, 06 Feb 2023 13:31:02 -0800 (PST)
X-Google-Smtp-Source: AK7set/NwYLF3AS13/KTMXCNAR/NiYbgm2/IlPYeYqKKioXYEzrSZhUvrn8DCcYxiaJhP+J2SZ1ZHA==
X-Received: by 2002:ac8:59c1:0:b0:3b8:6c6e:4949 with SMTP id
 f1-20020ac859c1000000b003b86c6e4949mr1815663qtf.4.1675719062384; 
 Mon, 06 Feb 2023 13:31:02 -0800 (PST)
Received: from x1n (bras-base-aurron9127w-grc-56-70-30-145-63.dsl.bell.ca.
 [70.30.145.63]) by smtp.gmail.com with ESMTPSA id
 bk42-20020a05620a1a2a00b006fa16fe93bbsm8367845qkb.15.2023.02.06.13.31.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 06 Feb 2023 13:31:01 -0800 (PST)
Date: Mon, 6 Feb 2023 16:31:00 -0500
From: Peter Xu <peterx@redhat.com>
To: Juan Quintela <quintela@redhat.com>
Cc: qemu-devel@nongnu.org, Leonardo Bras Soares Passos <lsoaresp@redhat.com>,
 Michal =?utf-8?B?UHLDrXZvem7DrWs=?= <mprivozn@redhat.com>,
 Daniel P =?utf-8?B?LiBCZXJyYW5nw6k=?= <berrange@redhat.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>
Subject: Re: [PATCH v2 3/3] util/userfaultfd: Support /dev/userfaultfd
Message-ID: <Y+FxlKN2/DsCiCzC@x1n>
References: <20230201211055.649442-1-peterx@redhat.com>
 <20230201211055.649442-4-peterx@redhat.com>
 <87cz6stk4a.fsf@secure.mitica> <Y9wf5AI4xmHhNCTM@x1n>
 <87357mfoq7.fsf@secure.mitica>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <87357mfoq7.fsf@secure.mitica>
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

On Fri, Feb 03, 2023 at 10:01:04PM +0100, Juan Quintela wrote:
> Peter Xu <peterx@redhat.com> wrote:
> > On Thu, Feb 02, 2023 at 11:52:21AM +0100, Juan Quintela wrote:
> >> Peter Xu <peterx@redhat.com> wrote:
> >> > Teach QEMU to use /dev/userfaultfd when it existed and fallback to the
> >> > system call if either it's not there or doesn't have enough permission.
> >> >
> >> > Firstly, as long as the app has permission to access /dev/userfaultfd, it
> >> > always have the ability to trap kernel faults which QEMU mostly wants.
> >> > Meanwhile, in some context (e.g. containers) the userfaultfd syscall can be
> >> > forbidden, so it can be the major way to use postcopy in a restricted
> >> > environment with strict seccomp setup.
> >> >
> >> > Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
> >> > Signed-off-by: Peter Xu <peterx@redhat.com>
> >> 
> >> 
> >> Hi
> >
> > Hi, Juan,
> 
> 
> >> static int open_userfaultd(void)
> >> {
> >>     /*
> >>      * Make /dev/userfaultfd the default approach because it has better
> >>      * permission controls, meanwhile allows kernel faults without any
> >>      * privilege requirement (e.g. SYS_CAP_PTRACE).
> >>      */
> >>      int uffd = open("/dev/userfaultfd", O_RDWR | O_CLOEXEC);
> >>      if (uffd >= 0) {
> >>             return uffd;
> >>      }
> >>      return -1;
> >> }
> >> 
> >> int uffd_open(int flags)
> >> {
> >> #if defined(__linux__) && defined(__NR_userfaultfd)
> 
> Just an incise, checkpatch don't liue that you use __linux__
> 
> This file is compiled under CONFIG_LINUX, so you can drop it.

Yes indeed.  I'll drop it.

> 
> >>     static int uffd = -2;
> >>     if (uffd == -2) {
> >>         uffd = open_userfaultd();
> >>     }
> >>     if (uffd >= 0) {
> >>         return ioctl(uffd, USERFAULTFD_IOC_NEW, flags);
> >>     }
> >>     return syscall(__NR_userfaultfd, flags);
> >> #else
> >>      return -EINVAL;
> >> 
> >> 27 lines vs 42
> >> 
> >> No need for enum type
> >> No need for global variable
> >> 
> >> What do you think?
> >
> > Yes, as I used to reply to Phil I think it can be simplified.  I did this
> > major for (1) better readability, and (2) being crystal clear on which way
> > we used to open /dev/userfaultfd, then guarantee we're keeping using it. so
> > at least I prefer keeping things like trace_uffd_detect_open_mode().
> 
> The trace is ok for me.  I just forgot to copy it on the rework, sorry.
> 
> > I also plan to add another mode when fd-mode is there even if it'll reuse
> > the same USERFAULTFD_IOC_NEW; they can be useful information when a failure
> > happens.
> 
> The other fd mode will change the uffd.
> 
> What I *kind* of object is:
> - Using a global variable when it is not needed
>   i.e. for me using a global variable means that anything else is worse.
>   Not the case IMHO.

IMHO globals are evil when they're used in multiple places; that's bad to
readability.  Here it's not the case because it's set once and for all.  I
wanted to have an easy and clear way to peek what's the mode chosen even
without tracing enabled (e.g. from a dump or a live process).

> - Call uffd_open_mode() for every call, when we know that it can change,
>   it is going to return always the same value, so cache it.

uffd_detect_open_mode() caches the result already?  Or maybe you meant
something else?

> 
> > Though if you insist, I can switch to the simple version too.
> 
> I always told that the person who did the patch has the last word on
> style.  I preffer my version, but it is up to you to take it or not.

Thanks,

-- 
Peter Xu


