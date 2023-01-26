Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C44C67C69C
	for <lists+qemu-devel@lfdr.de>; Thu, 26 Jan 2023 10:05:59 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pKyCH-0006Ni-AK; Thu, 26 Jan 2023 04:05:29 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1pKyC1-0006Kv-A8
 for qemu-devel@nongnu.org; Thu, 26 Jan 2023 04:05:16 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1pKyBz-0002eq-4f
 for qemu-devel@nongnu.org; Thu, 26 Jan 2023 04:05:12 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1674723910;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Sk/P3+aolYSM7wqiy6Q1sB+Z8gVR2GczXfaFE5XeCfo=;
 b=Enq4BxgORosBRIIUzFaMh/qbmBIr7paRZTy5bW+tWF7OcdiSCl7h4GYv0TXh5PZZkBbcGa
 xyKdG/nFRvqVF2dpeZb7KhhfjnOuvPQmK1KG6Ir710YVJzG7e+w5kVkge/pBa8SnmlYKx7
 9gZ9rJeGCVDTW+BID91MXNiniNU8kwU=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-631-O2wyvsVROqyHx-lLBqEKWQ-1; Thu, 26 Jan 2023 04:05:08 -0500
X-MC-Unique: O2wyvsVROqyHx-lLBqEKWQ-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
 [10.11.54.5])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 66776280604B
 for <qemu-devel@nongnu.org>; Thu, 26 Jan 2023 09:05:08 +0000 (UTC)
Received: from redhat.com (unknown [10.33.36.108])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 88C6A51E5;
 Thu, 26 Jan 2023 09:05:07 +0000 (UTC)
Date: Thu, 26 Jan 2023 09:05:01 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Peter Xu <peterx@redhat.com>, qemu-devel@nongnu.org,
 Leonardo Bras Soares Passos <lsoaresp@redhat.com>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>,
 Juan Quintela <quintela@redhat.com>
Subject: Re: [PATCH 3/3] util/userfaultfd: Support /dev/userfaultfd
Message-ID: <Y9JCPTHLuLKwz2Ge@redhat.com>
References: <20230125224016.212529-1-peterx@redhat.com>
 <20230125224016.212529-4-peterx@redhat.com>
 <Y9JBkR5xDHZEAN6p@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <Y9JBkR5xDHZEAN6p@redhat.com>
User-Agent: Mutt/2.2.9 (2022-11-12)
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.5
Received-SPF: pass client-ip=170.10.129.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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
Reply-To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Thu, Jan 26, 2023 at 09:02:09AM +0000, Daniel P. Berrangé wrote:
> On Wed, Jan 25, 2023 at 05:40:16PM -0500, Peter Xu wrote:
> > Teach QEMU to use /dev/userfaultfd when it existed and fallback to the
> > system call if either it's not there or doesn't have enough permission.
> > 
> > Firstly, as long as the app has permission to access /dev/userfaultfd, it
> > always have the ability to trap kernel faults which QEMU mostly wants.
> > Meanwhile, in some context (e.g. containers) the userfaultfd syscall can be
> > forbidden, so it can be the major way to use postcopy in a restricted
> > environment with strict seccomp setup.
> > 
> > Signed-off-by: Peter Xu <peterx@redhat.com>
> > ---
> >  util/trace-events  |  1 +
> >  util/userfaultfd.c | 36 ++++++++++++++++++++++++++++++++++++
> >  2 files changed, 37 insertions(+)
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
> > index 9845a2ec81..360ecf8084 100644
> > --- a/util/userfaultfd.c
> > +++ b/util/userfaultfd.c
> > @@ -18,10 +18,46 @@
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
> > +static uffd_open_mode open_mode;
> > +static int uffd_dev;
> > +
> > +static uffd_open_mode uffd_detect_open_mode(void)
> > +{
> > +    if (open_mode == UFFD_UNINITIALIZED) {
> > +        /*
> > +         * Make /dev/userfaultfd the default approach because it has better
> > +         * permission controls, meanwhile allows kernel faults without any
> > +         * privilege requirement (e.g. SYS_CAP_PTRACE).
> > +         */
> > +        uffd_dev = open("/dev/userfaultfd", O_RDWR | O_CLOEXEC);
> 
> qemu_open(), otherwise FD passing from the mgmt app won't work.
> 
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
> 
> This leaves the /dev/userfaultfd FD open forever once it has been used
> once. Is this really needed ? IIUC, the place where we call this is
> not going to be impacted if we open + close it every time we need to
> create a new FD, and it'll simplify this code right down.

Having said that, if we want to support passing the FD in from the
mgmt app, we need to keep it open persistently.

> 
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
> > -- 
> > 2.37.3
> > 
> > 
> 
> With regards,
> Daniel
> -- 
> |: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
> |: https://libvirt.org         -o-            https://fstop138.berrange.com :|
> |: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|
> 
> 

With regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


