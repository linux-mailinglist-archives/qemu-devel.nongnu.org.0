Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 74F4A67D5E5
	for <lists+qemu-devel@lfdr.de>; Thu, 26 Jan 2023 21:05:14 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pL8Tb-0004bd-4F; Thu, 26 Jan 2023 15:04:03 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1pL8TA-0004Yj-An
 for qemu-devel@nongnu.org; Thu, 26 Jan 2023 15:03:47 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1pL8T5-0007A3-VF
 for qemu-devel@nongnu.org; Thu, 26 Jan 2023 15:03:35 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1674763409;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=8oL9C3EstdMjPMlhICGX4tXbYnWz1GrnYWGfFjzvpI4=;
 b=jEUG9icyHSH1e3UM4O+nz49QHQOxLZI3C1gNz6FTRNNPUNtBaQaEOcMtA54gIhCl3RGyuH
 JjKAM6caJQWTRTloXa06XEjfn8BnZKK0BiebvW2vxdKiPvTlStrpgNokzVdZ/y+XZwXRbY
 /Ydj8yPk/QC+scF6P0LW6A3XiL0PH/4=
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com
 [209.85.219.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-170-RjSWcmSYON6qru6JJthzSQ-1; Thu, 26 Jan 2023 15:03:28 -0500
X-MC-Unique: RjSWcmSYON6qru6JJthzSQ-1
Received: by mail-qv1-f71.google.com with SMTP id
 jy13-20020a0562142b4d00b00535302dd1b8so1642686qvb.18
 for <qemu-devel@nongnu.org>; Thu, 26 Jan 2023 12:03:28 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=8oL9C3EstdMjPMlhICGX4tXbYnWz1GrnYWGfFjzvpI4=;
 b=dENJUeBI6TxcF281k/R+Iv7EnFZlH4D0A6aN2YlNkMGpOt7dE6Hxiy65R6ilQzN2CN
 PaLvwPrLTu4vSD+P1jwYKA0PxgyVNhtkl4Eg73s1b3aIbyr+K4p9fw596ehEl7+iTPqq
 tuPWGGExfWvj4uBDNcvW9FhRSkNXiWYSJ+mKBjGLUOl0LUhpSD+IxAj2qaekIxwmUaiI
 M84r+GLD78Zt1rEI0NVaunO6hCK+QGHyscfg9yH1lxPE5/q/lLXgU7aGwJtXc1TZQSrL
 5RAEfZwG8c4m6aIw4jx5ZbIBdBSbJApuybtEOk/vcAXkYyDm3LCkE+SvBUdxjFnH3uVc
 yZyA==
X-Gm-Message-State: AO0yUKWrx/49ui4HpXGe2S46OPreZsY73vvJAgUZ7fRW6cw00UIrMeeC
 dJlCFH5z1vxj9rvLpCzJFFYoWQRG1ZL7kKCtVoE6Fe93oa1WkLE3AGtLyVkBgBo4IjGorRzyqa9
 TPQUK9q9r5JKUf7g=
X-Received: by 2002:ac8:7f8a:0:b0:3a9:7f1d:11f with SMTP id
 z10-20020ac87f8a000000b003a97f1d011fmr13205892qtj.36.1674763406631; 
 Thu, 26 Jan 2023 12:03:26 -0800 (PST)
X-Google-Smtp-Source: AK7set9DD1C+Idj86fc/ZvRj23WGaQKak8SIyx6wj3B5eVnn9TyeDO/Oz3MfVqFZxjWXffDptQUjyg==
X-Received: by 2002:ac8:7f8a:0:b0:3a9:7f1d:11f with SMTP id
 z10-20020ac87f8a000000b003a97f1d011fmr13205856qtj.36.1674763406281; 
 Thu, 26 Jan 2023 12:03:26 -0800 (PST)
Received: from x1n (bras-base-aurron9127w-grc-56-70-30-145-63.dsl.bell.ca.
 [70.30.145.63]) by smtp.gmail.com with ESMTPSA id
 r17-20020ae9d611000000b006f9e103260dsm1500114qkk.91.2023.01.26.12.03.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 26 Jan 2023 12:03:25 -0800 (PST)
Date: Thu, 26 Jan 2023 15:03:22 -0500
From: Peter Xu <peterx@redhat.com>
To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
Cc: qemu-devel@nongnu.org, Leonardo Bras Soares Passos <lsoaresp@redhat.com>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>,
 Juan Quintela <quintela@redhat.com>
Subject: Re: [PATCH 3/3] util/userfaultfd: Support /dev/userfaultfd
Message-ID: <Y9LcijsWQE4cJch/@x1n>
References: <20230125224016.212529-1-peterx@redhat.com>
 <20230125224016.212529-4-peterx@redhat.com>
 <Y9JBkR5xDHZEAN6p@redhat.com> <Y9JCPTHLuLKwz2Ge@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <Y9JCPTHLuLKwz2Ge@redhat.com>
Received-SPF: pass client-ip=170.10.133.124; envelope-from=peterx@redhat.com;
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

On Thu, Jan 26, 2023 at 09:05:01AM +0000, Daniel P. Berrangé wrote:
> On Thu, Jan 26, 2023 at 09:02:09AM +0000, Daniel P. Berrangé wrote:
> > On Wed, Jan 25, 2023 at 05:40:16PM -0500, Peter Xu wrote:
> > > Teach QEMU to use /dev/userfaultfd when it existed and fallback to the
> > > system call if either it's not there or doesn't have enough permission.
> > > 
> > > Firstly, as long as the app has permission to access /dev/userfaultfd, it
> > > always have the ability to trap kernel faults which QEMU mostly wants.
> > > Meanwhile, in some context (e.g. containers) the userfaultfd syscall can be
> > > forbidden, so it can be the major way to use postcopy in a restricted
> > > environment with strict seccomp setup.
> > > 
> > > Signed-off-by: Peter Xu <peterx@redhat.com>
> > > ---
> > >  util/trace-events  |  1 +
> > >  util/userfaultfd.c | 36 ++++++++++++++++++++++++++++++++++++
> > >  2 files changed, 37 insertions(+)
> > > 
> > > diff --git a/util/trace-events b/util/trace-events
> > > index c8f53d7d9f..16f78d8fe5 100644
> > > --- a/util/trace-events
> > > +++ b/util/trace-events
> > > @@ -93,6 +93,7 @@ qemu_vfio_region_info(const char *desc, uint64_t region_ofs, uint64_t region_siz
> > >  qemu_vfio_pci_map_bar(int index, uint64_t region_ofs, uint64_t region_size, int ofs, void *host) "map region bar#%d addr 0x%"PRIx64" size 0x%"PRIx64" ofs 0x%x host %p"
> > >  
> > >  #userfaultfd.c
> > > +uffd_detect_open_mode(int mode) "%d"
> > >  uffd_query_features_nosys(int err) "errno: %i"
> > >  uffd_query_features_api_failed(int err) "errno: %i"
> > >  uffd_create_fd_nosys(int err) "errno: %i"
> > > diff --git a/util/userfaultfd.c b/util/userfaultfd.c
> > > index 9845a2ec81..360ecf8084 100644
> > > --- a/util/userfaultfd.c
> > > +++ b/util/userfaultfd.c
> > > @@ -18,10 +18,46 @@
> > >  #include <poll.h>
> > >  #include <sys/syscall.h>
> > >  #include <sys/ioctl.h>
> > > +#include <fcntl.h>
> > > +
> > > +typedef enum {
> > > +    UFFD_UNINITIALIZED = 0,
> > > +    UFFD_USE_DEV_PATH,
> > > +    UFFD_USE_SYSCALL,
> > > +} uffd_open_mode;
> > > +
> > > +static uffd_open_mode open_mode;
> > > +static int uffd_dev;
> > > +
> > > +static uffd_open_mode uffd_detect_open_mode(void)
> > > +{
> > > +    if (open_mode == UFFD_UNINITIALIZED) {
> > > +        /*
> > > +         * Make /dev/userfaultfd the default approach because it has better
> > > +         * permission controls, meanwhile allows kernel faults without any
> > > +         * privilege requirement (e.g. SYS_CAP_PTRACE).
> > > +         */
> > > +        uffd_dev = open("/dev/userfaultfd", O_RDWR | O_CLOEXEC);
> > 
> > qemu_open(), otherwise FD passing from the mgmt app won't work.

[I've followed this up in the other thread on interfacing libvirt, so will
 skip here] 

> > 
> > > +        if (uffd_dev >= 0) {
> > > +            open_mode = UFFD_USE_DEV_PATH;
> > > +        } else {
> > > +            /* Fallback to the system call */
> > > +            open_mode = UFFD_USE_SYSCALL;
> > > +        }
> > > +        trace_uffd_detect_open_mode(open_mode);
> > > +    }
> > > +
> > > +    return open_mode;
> > > +}
> > 
> > This leaves the /dev/userfaultfd FD open forever once it has been used
> > once. Is this really needed ? IIUC, the place where we call this is
> > not going to be impacted if we open + close it every time we need to
> > create a new FD, and it'll simplify this code right down.
> 
> Having said that, if we want to support passing the FD in from the
> mgmt app, we need to keep it open persistently.

Right, since the plan is to further support libvirt, I'll keep it as is.

Meanwhile, right now QEMU detects uffd features by creating an uffd and
quickly close it, it's also efficient to keep it when it's firstly opened.
IIRC for each postcopy procedure we'll open uffd at least three times
during different phases.

Thanks,

-- 
Peter Xu


