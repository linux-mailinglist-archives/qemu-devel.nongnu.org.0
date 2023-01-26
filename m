Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1935E67D34B
	for <lists+qemu-devel@lfdr.de>; Thu, 26 Jan 2023 18:35:23 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pL68i-0007cK-AN; Thu, 26 Jan 2023 12:34:20 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1pL68O-0007Xn-Gn
 for qemu-devel@nongnu.org; Thu, 26 Jan 2023 12:34:06 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1pL68M-0000mx-O5
 for qemu-devel@nongnu.org; Thu, 26 Jan 2023 12:34:00 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1674754438;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=6lD8liE7+e8XBPR3Oz/PosEXJFkNsJBsJ4BVP8xSPZQ=;
 b=R9VSw+5UebgTKSY8jSvXAEU2wpHaHJGivf+qgzOBA9bnlVCvhHnWqFaj4cPnry9pfbZufe
 WG83QJAOtECWq0Rd5DBuGMdBDzYM3euxUKmNtNMRzjAkkPQnx0Q+IE7lp1WGNalywQFqEG
 Fu2cdiB/7e3Y/4jtn3Hdi6qEO8nLHeY=
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com
 [209.85.219.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-178-g1ae9tVbNA6UrL7U-XHIXQ-1; Thu, 26 Jan 2023 12:33:56 -0500
X-MC-Unique: g1ae9tVbNA6UrL7U-XHIXQ-1
Received: by mail-qv1-f70.google.com with SMTP id
 i17-20020a0cfcd1000000b005377f5ce3baso1231002qvq.10
 for <qemu-devel@nongnu.org>; Thu, 26 Jan 2023 09:33:56 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=6lD8liE7+e8XBPR3Oz/PosEXJFkNsJBsJ4BVP8xSPZQ=;
 b=anps4MLUwB2xEGvEq6mGL/Ep82Ez1VwCLanfD3UwtC+R+0XGsUMNbscBJRSbPoXOS0
 jJUJr7qNA9qoLgx1no+Oi6DDhoTkz4itK+mgvcwVF+aC7EmVnXKWfXE0svNCTCMtPqWp
 UqcktCWxzejYzLlPdT1ednpVsCZ990G4dfQDoIhLTPFNyAHZueHNw1RqyyYAM/hxXrzE
 xv8oaRcD8Eedu++0yOd3zjirTVmaLuRMIJxAIcFlxDvjebkD5+jW9J2gsbj/rq7dxpDX
 8vo4USEK+J0UgzFNmeKoRk6av3rix7+MYRMgzHAr7jmcp5BaXBRhlfe0JX45e+h3UHmR
 HQwA==
X-Gm-Message-State: AO0yUKUtvmA6sUxIcMMEl/bP8w8MFqtpI4dbA/K9uEED13F3pZ1aCbDu
 D3nIvx4yTYnPp0DUpf+Zd8ddMSQaymzMdq9Sq/lL9pL6h4iGAQJEURzif2dX8cbDTdhomvC8mYg
 y+20sfIeHa/e+518=
X-Received: by 2002:ac8:4e85:0:b0:3b7:fafc:73e3 with SMTP id
 5-20020ac84e85000000b003b7fafc73e3mr17057755qtp.41.1674754435667; 
 Thu, 26 Jan 2023 09:33:55 -0800 (PST)
X-Google-Smtp-Source: AK7set9qUmirZM9tfUbilKT/hw2vElGNHIzj+Mr14E5YmijrmmKyby4Rsm5ijpT7oSW+fonopqfoVw==
X-Received: by 2002:ac8:4e85:0:b0:3b7:fafc:73e3 with SMTP id
 5-20020ac84e85000000b003b7fafc73e3mr17057724qtp.41.1674754435416; 
 Thu, 26 Jan 2023 09:33:55 -0800 (PST)
Received: from x1n (bras-base-aurron9127w-grc-56-70-30-145-63.dsl.bell.ca.
 [70.30.145.63]) by smtp.gmail.com with ESMTPSA id
 c33-20020a05620a26a100b00705975d0054sm1290729qkp.19.2023.01.26.09.33.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 26 Jan 2023 09:33:54 -0800 (PST)
Date: Thu, 26 Jan 2023 12:33:53 -0500
From: Peter Xu <peterx@redhat.com>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Cc: qemu-devel@nongnu.org, Leonardo Bras Soares Passos <lsoaresp@redhat.com>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>,
 Juan Quintela <quintela@redhat.com>
Subject: Re: [PATCH 3/3] util/userfaultfd: Support /dev/userfaultfd
Message-ID: <Y9K5gW/b2uyaPSvb@x1n>
References: <20230125224016.212529-1-peterx@redhat.com>
 <20230125224016.212529-4-peterx@redhat.com>
 <be81c4e3-960e-05a4-cdb1-192a9e7f33a4@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <be81c4e3-960e-05a4-cdb1-192a9e7f33a4@linaro.org>
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

On Thu, Jan 26, 2023 at 12:08:33AM +0100, Philippe Mathieu-Daudé wrote:
> On 25/1/23 23:40, Peter Xu wrote:
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
> >   util/trace-events  |  1 +
> >   util/userfaultfd.c | 36 ++++++++++++++++++++++++++++++++++++
> >   2 files changed, 37 insertions(+)
> > 
> > diff --git a/util/trace-events b/util/trace-events
> > index c8f53d7d9f..16f78d8fe5 100644
> > --- a/util/trace-events
> > +++ b/util/trace-events
> > @@ -93,6 +93,7 @@ qemu_vfio_region_info(const char *desc, uint64_t region_ofs, uint64_t region_siz
> >   qemu_vfio_pci_map_bar(int index, uint64_t region_ofs, uint64_t region_size, int ofs, void *host) "map region bar#%d addr 0x%"PRIx64" size 0x%"PRIx64" ofs 0x%x host %p"
> >   #userfaultfd.c
> > +uffd_detect_open_mode(int mode) "%d"
> >   uffd_query_features_nosys(int err) "errno: %i"
> >   uffd_query_features_api_failed(int err) "errno: %i"
> >   uffd_create_fd_nosys(int err) "errno: %i"
> > diff --git a/util/userfaultfd.c b/util/userfaultfd.c
> > index 9845a2ec81..360ecf8084 100644
> > --- a/util/userfaultfd.c
> > +++ b/util/userfaultfd.c
> > @@ -18,10 +18,46 @@
> >   #include <poll.h>
> >   #include <sys/syscall.h>
> >   #include <sys/ioctl.h>
> > +#include <fcntl.h>
> > +
> > +typedef enum {
> > +    UFFD_UNINITIALIZED = 0,
> > +    UFFD_USE_DEV_PATH,
> > +    UFFD_USE_SYSCALL,
> > +} uffd_open_mode;
> > +
> > +static uffd_open_mode open_mode;
> 
> 'open_mode' could be reduced to uffd_detect_open_mode()'s
> scope.

Yes, will do.

> 
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
> 
> If 'open_mode' isn't relevant, this function could return uffd_dev/-1
> instead. Not really an improvement :)

Logically I think the two variables can be squashed into one.  I kept that
for clearance just to easily identify e.g. uffd_dev is not chosen to be
used, or uffd_dev open failed.

> 
> Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>

Thanks, Phil.

-- 
Peter Xu


