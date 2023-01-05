Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 80B1A65F63F
	for <lists+qemu-devel@lfdr.de>; Thu,  5 Jan 2023 22:53:40 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pDYAz-0005GS-H1; Thu, 05 Jan 2023 16:53:29 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1pDYAu-0005FL-D3
 for qemu-devel@nongnu.org; Thu, 05 Jan 2023 16:53:25 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1pDYAs-00027P-O3
 for qemu-devel@nongnu.org; Thu, 05 Jan 2023 16:53:24 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1672955601;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=lhXBsfrPt5H0sZlxQ3yhr631YYVMzbmutTM9G0X67/M=;
 b=E3zgW3/qHvL0ZzJudRxfXdKt8Kjcl4rdjsVv8NHNvjeVLqCeGLgFX+E0btgVlcgVbGK+MK
 UEd6EdlkFqkBFSmMRaI1ObzAviZ1QqdpCELV2UyOOAV0QhK3z6OhwoofbQgyz2k9tSmjp/
 DvJ9Dgt48V9w8G5STaaJE8Nzm3/e+mE=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-363-bzh8sDmFP8SDMZSZdvw8bw-1; Thu, 05 Jan 2023 16:53:20 -0500
X-MC-Unique: bzh8sDmFP8SDMZSZdvw8bw-1
Received: by mail-wm1-f70.google.com with SMTP id
 m38-20020a05600c3b2600b003d23f8c6ebdso1713906wms.0
 for <qemu-devel@nongnu.org>; Thu, 05 Jan 2023 13:53:20 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=lhXBsfrPt5H0sZlxQ3yhr631YYVMzbmutTM9G0X67/M=;
 b=7jE7rbHnLyhovs+PvEzA3tWk7FdMqo4enzxJbNZQIxxBnUgWfXnHNN+H8YhAzU0S3u
 bCiXELEqeU1AbXu22BVCfy8k7IaHVj66BeaXCGyCCRDj8lwzBbGeXdcjRTdwoDLrBv6J
 +M7DNWua+7YinJue1YdSROnjaqrbakgVW7MILVfjwp7tyapqNL3whrLDBvvtGn2GtBwc
 GSwJetoRPEtZCgKUxmEEiRpMf0m/kaeQMSICBzVYKmjrBqsr9enkbwj19itOdtFpEG2j
 ANJv+mXhm90aYLRBH/kV0LSgcWxBq7JRdm9F5Na9llEBJI0YqiLPs4lwGrBy/dmTDfcJ
 TdyQ==
X-Gm-Message-State: AFqh2kq5drgiHDhjUdqpESsDFBq3k6uoV4Hhu6S4DaALLmEbXIB3ykm4
 mCe+KfLpMGYLsv3QY4omaxptOlkuBsd2LIMhdzM3egBaDgSru5ImrhJ1B6IjICbii0pmtxrxX4c
 HAjeNqikLSPu6j/w=
X-Received: by 2002:a05:600c:3d12:b0:3d2:392b:3165 with SMTP id
 bh18-20020a05600c3d1200b003d2392b3165mr37085949wmb.12.1672955598936; 
 Thu, 05 Jan 2023 13:53:18 -0800 (PST)
X-Google-Smtp-Source: AMrXdXuHmJgcQFNQvlR7LMriaed5KXfRhf8lGa93M3vnTYgiMG5GQ2aIC+WTtCwR6cqEc49SboBgww==
X-Received: by 2002:a05:600c:3d12:b0:3d2:392b:3165 with SMTP id
 bh18-20020a05600c3d1200b003d2392b3165mr37085945wmb.12.1672955598740; 
 Thu, 05 Jan 2023 13:53:18 -0800 (PST)
Received: from redhat.com ([2.52.151.85]) by smtp.gmail.com with ESMTPSA id
 z12-20020a05600c0a0c00b003d9a86a13bfsm3738020wmp.28.2023.01.05.13.53.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 05 Jan 2023 13:53:18 -0800 (PST)
Date: Thu, 5 Jan 2023 16:53:15 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-devel@nongnu.org
Subject: Re: [PULL 00/51] virtio,pc,pci: features, cleanups, fixes
Message-ID: <20230105165242-mutt-send-email-mst@kernel.org>
References: <20230105091310.263867-1-mst@redhat.com>
 <20230105045619-mutt-send-email-mst@kernel.org>
 <20230105113111-mutt-send-email-mst@kernel.org>
 <CAFEAcA8Dr_vT2YrrrapL5vAtL5baGxPpk0busNPU-vutJcA10A@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAFEAcA8Dr_vT2YrrrapL5vAtL5baGxPpk0busNPU-vutJcA10A@mail.gmail.com>
Received-SPF: pass client-ip=170.10.129.124; envelope-from=mst@redhat.com;
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

On Thu, Jan 05, 2023 at 09:04:37PM +0000, Peter Maydell wrote:
> On Thu, 5 Jan 2023 at 16:32, Michael S. Tsirkin <mst@redhat.com> wrote:
> >
> > On Thu, Jan 05, 2023 at 04:56:39AM -0500, Michael S. Tsirkin wrote:
> > > On Thu, Jan 05, 2023 at 04:14:20AM -0500, Michael S. Tsirkin wrote:
> > > > The following changes since commit cb9c6a8e5ad6a1f0ce164d352e3102df46986e22:
> > > >
> > > >   .gitlab-ci.d/windows: Work-around timeout and OpenGL problems of the MSYS2 jobs (2023-01-04 18:58:33 +0000)
> > > >
> > > > are available in the Git repository at:
> > > >
> > > >   https://git.kernel.org/pub/scm/virt/kvm/mst/qemu.git tags/for_upstream
> > > >
> > > > for you to fetch changes up to 6529cb46fa76bb4b4f217d6fcc68b61b543062c4:
> > >
> > > 7c77271205339d3b161bdf925f5ead799b582e47 now - I dropped one patch
> > > as v2 is forthcoming.
> >
> > And now it's c46dcec9f699508e811cb6a140250d07486b0e41 as I replaced that
> > patch with it's v2. Sorry about the back and forth, but it seemed
> > important :(
> >
> > >
> > > >   vhost-scsi: fix memleak of vsc->inflight (2023-01-05 04:07:39 -0500)
> > > >
> > > > ----------------------------------------------------------------
> > > > virtio,pc,pci: features, cleanups, fixes
> > > >
> > > > mostly vhost-vdpa:
> > > >     guest announce feature emulation when using shadow virtqueue
> > > >     support for configure interrupt
> > > >     startup speed ups
> > > >
> > > > an acpi change to only generate cluster node in PPTT when specified for arm
> > > >
> > > > misc fixes, cleanups
> > > >
> > > > Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
> > > >
> > > > ----------------------------------------------------------------
> > > >
> > > > Note: linux-user build is failing for me on master, I just
> > > > disabled it for now as nothing I'm doing should affect linux-user.
> > > > Didn't debug yet.
> 
> Compile failures on freebsd in the bsd-user build:
> 
> https://gitlab.com/qemu-project/qemu/-/jobs/3561556072
> https://gitlab.com/qemu-project/qemu/-/jobs/3561556071
> 
> Probably something in Markus' include-file cleanup, I suspect
> some file is missing its osdep.h include.
> 
> thanks
> -- PMM


Pushed a fixup, commit 1df76fab679e9a673b71531925fe12ceb89eaecb now.
Pls let me know, thanks!

-- 
MST


