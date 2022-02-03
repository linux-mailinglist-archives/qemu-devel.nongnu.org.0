Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B02DA4A83B6
	for <lists+qemu-devel@lfdr.de>; Thu,  3 Feb 2022 13:20:35 +0100 (CET)
Received: from localhost ([::1]:44328 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nFb6I-0001NC-S5
	for lists+qemu-devel@lfdr.de; Thu, 03 Feb 2022 07:20:34 -0500
Received: from eggs.gnu.org ([209.51.188.92]:54982)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.griffin@linaro.org>)
 id 1nFb2T-0007rh-W6
 for qemu-devel@nongnu.org; Thu, 03 Feb 2022 07:16:39 -0500
Received: from [2a00:1450:4864:20::135] (port=34359
 helo=mail-lf1-x135.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.griffin@linaro.org>)
 id 1nFb2R-0005w0-W7
 for qemu-devel@nongnu.org; Thu, 03 Feb 2022 07:16:37 -0500
Received: by mail-lf1-x135.google.com with SMTP id l27so792811lfe.1
 for <qemu-devel@nongnu.org>; Thu, 03 Feb 2022 04:16:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=z3yWA23Wk/CX8yaoqhwbF4+FNJGzxJeMIhw6Lpb5DuU=;
 b=XOnps5c9lGrD48g0ptJqr0nXOsGem2hXQ2Zqv57ECY+W2j97vvN4IbUSy+gJ+6mp7e
 m0gd6Dlku2ycuFFBvPdhFF2FCLMJKcy9PRWOsTNnOXJimKwMuCBTYTr30T0HxPiy8Sne
 3BMxZZby+3Vq8P7AlXrMINbbrstFEM8BNe4Ynj5Khufr+GxLw3JK6oEjqRjsbhVRHCOW
 fbji7Qn9tCPRh6N16PYlDIzPcCV78cf/02HV5qUov3kdq/myrOkTUBN6caCndlJzLu6B
 1DHV15iQGo+sQk8K+QvBsta24ZMqB4eO+XHdLvJPPOIeFV+TQ6Tkpt8s1UyDESVjnD2y
 C5JQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=z3yWA23Wk/CX8yaoqhwbF4+FNJGzxJeMIhw6Lpb5DuU=;
 b=kZpv0uJzU7kyOPTQEWit15hsRqCq7bCXJuEwgN9SVI41BJV3E2+sY7yRwSQhPzbf7G
 FmzOt1iJEegDwIkdX7xDZHuPgBeKBoulyu+af5g4HcQVUo8KUK3ppe4AFAxFiqPw98WV
 RNOQS5iUGIrylaV8XxVGCDJPcam/1n3ByuLQbzYBaeSi8rfR89R1lHfPV+a6VGFnVYHS
 LYjY8Aovoux/FeHv5rNXi2g3mXFdR3DYiVprUtlYznzgsiMx0DSxqQpjyMiSkb8KySIA
 G8bkfZkm1ZYknVag+lu8fNZxKt+YypittEAjbW129f1G29H1qRiapjHjQJ5+FbfSg29M
 U22w==
X-Gm-Message-State: AOAM5332r7ecS2FDe495FPCnWwg83J4Y+eb0Jf4btdBovYlQJ1+XGIzQ
 OruvRowHZx2OIx2Y3sNf7Odg0jyYDjTTQA==
X-Google-Smtp-Source: ABdhPJzrLHbjXIgBlf538ljKfNsyR2IJG11I6/aXfpJHn6I3yf7uotJAqz85KwBclpimqCPnWiNAPQ==
X-Received: by 2002:a5d:64a3:: with SMTP id m3mr27359607wrp.412.1643890223422; 
 Thu, 03 Feb 2022 04:10:23 -0800 (PST)
Received: from xps15-9570.lan ([85.210.223.90])
 by smtp.gmail.com with ESMTPSA id u14sm19512415wrm.58.2022.02.03.04.10.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 03 Feb 2022 04:10:22 -0800 (PST)
Date: Thu, 3 Feb 2022 12:10:17 +0000
From: Peter Griffin <peter.griffin@linaro.org>
To: "Michael S. Tsirkin" <mst@redhat.com>
Subject: Re: [PATCH 0/8] virtio: Add vhost-user based Video decode
Message-ID: <20220203121017.GA381135@xps15-9570.lan>
References: <20211209145601.331477-1-peter.griffin@linaro.org>
 <20220111103245-mutt-send-email-mst@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220111103245-mutt-send-email-mst@kernel.org>
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::135
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::135;
 envelope-from=peter.griffin@linaro.org; helo=mail-lf1-x135.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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

Hi Michael,

Apologies for the delaying in replying to you, I didn't see your email until now
whilst replying to Alex review feedback.

On Tue, 11 Jan 2022, Michael S. Tsirkin wrote:

> On Thu, Dec 09, 2021 at 02:55:53PM +0000, Peter Griffin wrote:
> > This series adds support for virtio-video decoder devices in Qemu
> > and also provides a vhost-user-video vmm implementation.
> > 
> > The vhost-user-video vmm currently parses virtio-vido v3 protocol
> > (as that is what the Linux frontend driver implements).
> > It then converts that to a v4l2 mem2mem stateful decoder device.
> > Currently this has been tested using v4l2 vicodec test driver in Linux
> > [1] but it is intended to be used with Arm SoCs which often implement
> > v4l2 stateful decoders/encoders drivers for their video accelerators.
> > 
> > The primary goal so far has been to allow continuing development
> > of virtio-video Linux frontend driver and testing with Qemu. Using
> > vicodec on the host allows a purely virtual dev env, and allows for
> > ci integration in the future by kernelci etc.
> > 
> > This series also adds the virtio_video.h header and adds the
> > FWHT format which is used by vicodec driver.
> > 
> > I have tested this VMM using v4l2-ctl from v4l2 utils in the guest
> > to do a video decode to a file. This can then be validated using ffplay
> > v4l2-compliance tool in the guest has also been run which stresses the
> > interface and issues lots of syscall level tests
> > 
> > See the README.md for example commands on how to configure guest kernel
> > and do a video decode using Qemu, vicodec using this VMM.
> > 
> > Linux virtio-video frontend driver code:
> > https://github.com/petegriffin/linux/commits/v5.10-virtio-video-latest
> 
> Are you going to post this btw?

Do you think there is much value in posting this version of the driver again?

As it is more or less the same as what Opensynergy folks posted to linux-media ml
plus a few fixups that have landed in the ChromeOS tree over time from using it
in their products and a few extra fixups from me to move it to a newer kernel
and fix a few bugs I found whilst working on the Qemu backend.

> 
> 
> > Qemu vmm code:
> > https://github.com/petegriffin/qemu/tree/vhost-virtio-video-master-v1
> > 
> > This is part of a wider initiative by Linaro called
> > "project Stratos" for which you can find information here:
> > 
> >   https://collaborate.linaro.org/display/STR/Stratos+Home
> > 
> > Applies cleanly to git://git.qemu.org/qemu.git master(a3607def89).
> > 
> > Thanks,
> > 
> > Peter.
> > 
> > [1] https://lwn.net/Articles/760650/
> 
> And the spec status?
> Does this match this spec:
> https://lore.kernel.org/linux-media/CAPBb6MUD_oYeUt8_bGRwAPCPam40Jtktz2F7+A3SO5PFRdUsiw@mail.gmail.com/T/
> ?
> A year ago a new revision was coming RSN ...
>

No unfortunately this VMM currently implements the v3 spec. The next task is to
update both the VMM and the frontend driver above to the v5 spec you linked to
above.

We would like to get the v5 spec voted on and integrated into the standard so
any advice you can give me as to the process for doing that would be appreciated :)

kind regards,

Peter.

> 
> > Peter Griffin (8):
> >   vhost-user-video: Add a README.md with cheat sheet of commands
> >   MAINTAINERS: Add virtio-video section
> >   vhost-user-video: boiler plate code for vhost-user-video device
> >   vhost-user-video: add meson subdir build logic
> >   standard-headers: Add virtio_video.h
> >   virtio_video: Add Fast Walsh-Hadamard Transform format
> >   hw/display: add vhost-user-video-pci
> >   tools/vhost-user-video: Add initial vhost-user-video vmm
> > 
> >  MAINTAINERS                                   |    8 +
> >  hw/display/Kconfig                            |    5 +
> >  hw/display/meson.build                        |    3 +
> >  hw/display/vhost-user-video-pci.c             |   82 +
> >  hw/display/vhost-user-video.c                 |  386 ++++
> >  include/hw/virtio/vhost-user-video.h          |   41 +
> >  include/standard-headers/linux/virtio_video.h |  484 +++++
> >  tools/meson.build                             |    9 +
> >  tools/vhost-user-video/50-qemu-rpmb.json.in   |    5 +
> >  tools/vhost-user-video/README.md              |   98 +
> >  tools/vhost-user-video/main.c                 | 1680 ++++++++++++++++
> >  tools/vhost-user-video/meson.build            |   10 +
> >  tools/vhost-user-video/v4l2_backend.c         | 1777 +++++++++++++++++
> >  tools/vhost-user-video/v4l2_backend.h         |   99 +
> >  tools/vhost-user-video/virtio_video_helpers.c |  462 +++++
> >  tools/vhost-user-video/virtio_video_helpers.h |  166 ++
> >  tools/vhost-user-video/vuvideo.h              |   43 +
> >  17 files changed, 5358 insertions(+)
> >  create mode 100644 hw/display/vhost-user-video-pci.c
> >  create mode 100644 hw/display/vhost-user-video.c
> >  create mode 100644 include/hw/virtio/vhost-user-video.h
> >  create mode 100644 include/standard-headers/linux/virtio_video.h
> >  create mode 100644 tools/vhost-user-video/50-qemu-rpmb.json.in
> >  create mode 100644 tools/vhost-user-video/README.md
> >  create mode 100644 tools/vhost-user-video/main.c
> >  create mode 100644 tools/vhost-user-video/meson.build
> >  create mode 100644 tools/vhost-user-video/v4l2_backend.c
> >  create mode 100644 tools/vhost-user-video/v4l2_backend.h
> >  create mode 100644 tools/vhost-user-video/virtio_video_helpers.c
> >  create mode 100644 tools/vhost-user-video/virtio_video_helpers.h
> >  create mode 100644 tools/vhost-user-video/vuvideo.h
> > 
> > -- 
> > 2.25.1
> 

