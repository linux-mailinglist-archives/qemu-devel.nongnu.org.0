Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1671B4A8568
	for <lists+qemu-devel@lfdr.de>; Thu,  3 Feb 2022 14:42:29 +0100 (CET)
Received: from localhost ([::1]:36112 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nFcNX-0005OC-It
	for lists+qemu-devel@lfdr.de; Thu, 03 Feb 2022 08:42:27 -0500
Received: from eggs.gnu.org ([209.51.188.92]:44196)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1nFc9u-00060T-C1
 for qemu-devel@nongnu.org; Thu, 03 Feb 2022 08:28:24 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:40493)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1nFc9a-0007ke-78
 for qemu-devel@nongnu.org; Thu, 03 Feb 2022 08:28:20 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1643894836;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=ZNWtvqMzOyGfPJa5ocaENDoMTH6E4TJsXSgIZsx6zok=;
 b=PQR2uDIQqA652r/NvzZkcNf/33E1RkPp/KaY4mcCynMo3jH0OTHI3iByHawuNTJ8fJ5FmQ
 CdnjGwxpTDPu+i1OoaP/GM9qhTJU+m9pZehCAGbiI2no7jajBhwe2dIr7rsfORa6lOk/Uu
 F8XYDGAWFruDPYqAyeFI/orWtiqlPTw=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-38-O4KYLdUdN-ex0qF0pbpfGQ-1; Thu, 03 Feb 2022 08:27:13 -0500
X-MC-Unique: O4KYLdUdN-ex0qF0pbpfGQ-1
Received: by mail-wr1-f70.google.com with SMTP id
 c9-20020adfa709000000b001dde29c3202so653158wrd.22
 for <qemu-devel@nongnu.org>; Thu, 03 Feb 2022 05:27:12 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=ZNWtvqMzOyGfPJa5ocaENDoMTH6E4TJsXSgIZsx6zok=;
 b=3Wi+KdIq+8ODns+Go7Ly89/ax5z8zkQjFeD3KlJ1jctNTmpuXxXO8XWkdZDZcj+lXG
 +ZmRTyUx8bBu0qBbK0olQtUe2E1hWdDVwl7ex45gWwkZqhs7rejkLiPsv6MiIofaXJ/P
 IbpZK9jw1gK4DicLaYJ1ZDA3KozWpr2ROsVFYVWnpV8R/eLaow4ekW04PtReSyzu4S+4
 8PeQdtYT6sg5FljkpdhPyiOq+qa7vOaeZPk/iv0lVPqrdqKmweOQ0uhJ2hsAcMCxlyMH
 awpDjSWC+cnFSs3V2Z7Te2xjFYDQWHeE41HtEDXCNhEzds5K0z2ufELYtuxZLJQmWE8l
 1cWQ==
X-Gm-Message-State: AOAM532Fc+GjJGJX+HAtlLJE0A7Iomb7I6wZbZwA0Q4P3820Avu0dtGD
 dfHMq9fazJ2rgzKv2IcSwsMz2cmRGfasnVvEkBOJD4GgPASjTNwnukzegwdxgDE9VeeAUOwrGa0
 g01Tpl1qSCVO0IYM=
X-Received: by 2002:a05:6000:388:: with SMTP id
 u8mr28427515wrf.688.1643894831865; 
 Thu, 03 Feb 2022 05:27:11 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwZE4UeiBuJbbZZd7DX7TuFDLDNfo9iOfgSqGJnWzY04GukwdjeRMNfaDl6YuwLfu6r+eqVZg==
X-Received: by 2002:a05:6000:388:: with SMTP id
 u8mr28427486wrf.688.1643894831497; 
 Thu, 03 Feb 2022 05:27:11 -0800 (PST)
Received: from redhat.com ([2.52.9.182])
 by smtp.gmail.com with ESMTPSA id d6sm19804667wrs.85.2022.02.03.05.27.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 03 Feb 2022 05:27:09 -0800 (PST)
Date: Thu, 3 Feb 2022 08:27:06 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Peter Griffin <peter.griffin@linaro.org>
Subject: Re: [PATCH 0/8] virtio: Add vhost-user based Video decode
Message-ID: <20220203082318-mutt-send-email-mst@kernel.org>
References: <20211209145601.331477-1-peter.griffin@linaro.org>
 <20220111103245-mutt-send-email-mst@kernel.org>
 <20220203121017.GA381135@xps15-9570.lan>
MIME-Version: 1.0
In-Reply-To: <20220203121017.GA381135@xps15-9570.lan>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.086,
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
Cc: marcandre.lureau@redhat.com, alex.bennee@linaro.org, qemu-devel@nongnu.org,
 stratos-dev@op-lists.linaro.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Feb 03, 2022 at 12:10:17PM +0000, Peter Griffin wrote:
> Hi Michael,
> 
> Apologies for the delaying in replying to you, I didn't see your email until now
> whilst replying to Alex review feedback.
> 
> On Tue, 11 Jan 2022, Michael S. Tsirkin wrote:
> 
> > On Thu, Dec 09, 2021 at 02:55:53PM +0000, Peter Griffin wrote:
> > > This series adds support for virtio-video decoder devices in Qemu
> > > and also provides a vhost-user-video vmm implementation.
> > > 
> > > The vhost-user-video vmm currently parses virtio-vido v3 protocol
> > > (as that is what the Linux frontend driver implements).
> > > It then converts that to a v4l2 mem2mem stateful decoder device.
> > > Currently this has been tested using v4l2 vicodec test driver in Linux
> > > [1] but it is intended to be used with Arm SoCs which often implement
> > > v4l2 stateful decoders/encoders drivers for their video accelerators.
> > > 
> > > The primary goal so far has been to allow continuing development
> > > of virtio-video Linux frontend driver and testing with Qemu. Using
> > > vicodec on the host allows a purely virtual dev env, and allows for
> > > ci integration in the future by kernelci etc.
> > > 
> > > This series also adds the virtio_video.h header and adds the
> > > FWHT format which is used by vicodec driver.
> > > 
> > > I have tested this VMM using v4l2-ctl from v4l2 utils in the guest
> > > to do a video decode to a file. This can then be validated using ffplay
> > > v4l2-compliance tool in the guest has also been run which stresses the
> > > interface and issues lots of syscall level tests
> > > 
> > > See the README.md for example commands on how to configure guest kernel
> > > and do a video decode using Qemu, vicodec using this VMM.
> > > 
> > > Linux virtio-video frontend driver code:
> > > https://github.com/petegriffin/linux/commits/v5.10-virtio-video-latest
> > 
> > Are you going to post this btw?
> 
> Do you think there is much value in posting this version of the driver again?
> 
> As it is more or less the same as what Opensynergy folks posted to linux-media ml
> plus a few fixups that have landed in the ChromeOS tree over time from using it
> in their products and a few extra fixups from me to move it to a newer kernel
> and fix a few bugs I found whilst working on the Qemu backend.


I guess it needs to be updated to v5 spec then?

> > 
> > 
> > > Qemu vmm code:
> > > https://github.com/petegriffin/qemu/tree/vhost-virtio-video-master-v1
> > > 
> > > This is part of a wider initiative by Linaro called
> > > "project Stratos" for which you can find information here:
> > > 
> > >   https://collaborate.linaro.org/display/STR/Stratos+Home
> > > 
> > > Applies cleanly to git://git.qemu.org/qemu.git master(a3607def89).
> > > 
> > > Thanks,
> > > 
> > > Peter.
> > > 
> > > [1] https://lwn.net/Articles/760650/
> > 
> > And the spec status?
> > Does this match this spec:
> > https://lore.kernel.org/linux-media/CAPBb6MUD_oYeUt8_bGRwAPCPam40Jtktz2F7+A3SO5PFRdUsiw@mail.gmail.com/T/
> > ?
> > A year ago a new revision was coming RSN ...
> >
> 
> No unfortunately this VMM currently implements the v3 spec. The next task is to
> update both the VMM and the frontend driver above to the v5 spec you linked to
> above.
> 
> We would like to get the v5 spec voted on and integrated into the standard so
> any advice you can give me as to the process for doing that would be appreciated :)
> 
> kind regards,
> 
> Peter.

I think as with most cases where the TC lacks experts in the specific
field, we'd like to get acks from experts, one way to do that
is by posting the driver and soliciting acks.
Ideally we'd like to see an open source driver and device
implementations alongside the spec (preferably qemu as it's still
more popular than rust vmm and more people read C than rust).

> > 
> > > Peter Griffin (8):
> > >   vhost-user-video: Add a README.md with cheat sheet of commands
> > >   MAINTAINERS: Add virtio-video section
> > >   vhost-user-video: boiler plate code for vhost-user-video device
> > >   vhost-user-video: add meson subdir build logic
> > >   standard-headers: Add virtio_video.h
> > >   virtio_video: Add Fast Walsh-Hadamard Transform format
> > >   hw/display: add vhost-user-video-pci
> > >   tools/vhost-user-video: Add initial vhost-user-video vmm
> > > 
> > >  MAINTAINERS                                   |    8 +
> > >  hw/display/Kconfig                            |    5 +
> > >  hw/display/meson.build                        |    3 +
> > >  hw/display/vhost-user-video-pci.c             |   82 +
> > >  hw/display/vhost-user-video.c                 |  386 ++++
> > >  include/hw/virtio/vhost-user-video.h          |   41 +
> > >  include/standard-headers/linux/virtio_video.h |  484 +++++
> > >  tools/meson.build                             |    9 +
> > >  tools/vhost-user-video/50-qemu-rpmb.json.in   |    5 +
> > >  tools/vhost-user-video/README.md              |   98 +
> > >  tools/vhost-user-video/main.c                 | 1680 ++++++++++++++++
> > >  tools/vhost-user-video/meson.build            |   10 +
> > >  tools/vhost-user-video/v4l2_backend.c         | 1777 +++++++++++++++++
> > >  tools/vhost-user-video/v4l2_backend.h         |   99 +
> > >  tools/vhost-user-video/virtio_video_helpers.c |  462 +++++
> > >  tools/vhost-user-video/virtio_video_helpers.h |  166 ++
> > >  tools/vhost-user-video/vuvideo.h              |   43 +
> > >  17 files changed, 5358 insertions(+)
> > >  create mode 100644 hw/display/vhost-user-video-pci.c
> > >  create mode 100644 hw/display/vhost-user-video.c
> > >  create mode 100644 include/hw/virtio/vhost-user-video.h
> > >  create mode 100644 include/standard-headers/linux/virtio_video.h
> > >  create mode 100644 tools/vhost-user-video/50-qemu-rpmb.json.in
> > >  create mode 100644 tools/vhost-user-video/README.md
> > >  create mode 100644 tools/vhost-user-video/main.c
> > >  create mode 100644 tools/vhost-user-video/meson.build
> > >  create mode 100644 tools/vhost-user-video/v4l2_backend.c
> > >  create mode 100644 tools/vhost-user-video/v4l2_backend.h
> > >  create mode 100644 tools/vhost-user-video/virtio_video_helpers.c
> > >  create mode 100644 tools/vhost-user-video/virtio_video_helpers.h
> > >  create mode 100644 tools/vhost-user-video/vuvideo.h
> > > 
> > > -- 
> > > 2.25.1
> > 


