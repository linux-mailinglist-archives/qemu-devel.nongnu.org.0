Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E1424E4402
	for <lists+qemu-devel@lfdr.de>; Tue, 22 Mar 2022 17:14:32 +0100 (CET)
Received: from localhost ([::1]:50026 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nWh9T-0006Jt-5s
	for lists+qemu-devel@lfdr.de; Tue, 22 Mar 2022 12:14:31 -0400
Received: from eggs.gnu.org ([209.51.188.92]:47734)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1nWh8K-0004uw-5K
 for qemu-devel@nongnu.org; Tue, 22 Mar 2022 12:13:20 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:51948)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1nWh8H-0005ic-8u
 for qemu-devel@nongnu.org; Tue, 22 Mar 2022 12:13:18 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1647965596;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=tov/Yr3ez2NAiw2+nqJup4mfSEBDlgcTgQquvZ6kEdQ=;
 b=giBzSJSLXLtbbMjLcNMhkbEuqwAwawz61tq95TDPmJoSC00ojvtDckJ/Sz6fHP/oYuNAck
 ysOrEufkp5pX8LzSeLFVC2jxXAnGUVYPkHVKuQeGapjaHIYkbwIyfCCthdt8HPbZoGZJO5
 eFlsXhdmHfgv9k6hHti4Jo+AyxPYsL0=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-378-Go3UTU-oMMSQVQEdmZmLvg-1; Tue, 22 Mar 2022 12:13:12 -0400
X-MC-Unique: Go3UTU-oMMSQVQEdmZmLvg-1
Received: by mail-wr1-f71.google.com with SMTP id
 z1-20020adfec81000000b001f1f7e7ec99so3876737wrn.17
 for <qemu-devel@nongnu.org>; Tue, 22 Mar 2022 09:13:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=tov/Yr3ez2NAiw2+nqJup4mfSEBDlgcTgQquvZ6kEdQ=;
 b=EMp0YkWjUM1ubYn8geULtF4oV4VmqRtXlF6x8xjzR2pX7CDoLeAGzNnjx4dPofJ3cP
 rkH1D+ws/PZVXXKtnj4BLeyjBQ/bN9tBhpZP9yG+E15FfQD4M3MCOiJzp255xQEk5Crt
 9JxDGyOknSg6+hGXKWaXvFmTC4FZJ9gbA+8JQRaKDyecpPrJu9x6DhyxRppjoZJ9dnlz
 GRx7vjJXM8XLW4HowQARNKFP1x7B+HLlLwYo4nOzoQBRms5M9reSPoh54yljbcBJUL9t
 z8feOO5GZ0drSgDEeROJAgS5EEhkTWmEkHBmVIraS1SZDSggiqlR3JIORzYM/Sm8H5I0
 pmiw==
X-Gm-Message-State: AOAM530Xmc265zfJZfAVRKNj5BoYZvFiQJNUDHLu0dmoFexjblaRJ1Hw
 IqHUUmzBt9U+N+DsVQd0ujf8JDXMfc42RyTTAhViZ2wIOFgf4LKRKDkUle4XbLCLPeZ/cr3MRsJ
 D2ekl7nCi0MREjyM=
X-Received: by 2002:a05:6000:1549:b0:203:f11a:ac4c with SMTP id
 9-20020a056000154900b00203f11aac4cmr19407991wry.233.1647965591507; 
 Tue, 22 Mar 2022 09:13:11 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzVHY8W8r1RtPV/CX+O7iZCfkSRx+dnI9SSJpH+rL3WqBNKLkjW6S+n/tSMWcdR6XuGt3F0+w==
X-Received: by 2002:a05:6000:1549:b0:203:f11a:ac4c with SMTP id
 9-20020a056000154900b00203f11aac4cmr19407888wry.233.1647965590209; 
 Tue, 22 Mar 2022 09:13:10 -0700 (PDT)
Received: from redhat.com ([2.55.132.0]) by smtp.gmail.com with ESMTPSA id
 p18-20020adfba92000000b001e4ae791663sm16315622wrg.62.2022.03.22.09.13.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 22 Mar 2022 09:13:09 -0700 (PDT)
Date: Tue, 22 Mar 2022 12:13:05 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Alex =?iso-8859-1?Q?Benn=E9e?= <alex.bennee@linaro.org>
Subject: Re: [PATCH  v1 00/13] various virtio docs, fixes and tweaks
Message-ID: <20220322120733-mutt-send-email-mst@kernel.org>
References: <20220321153037.3622127-1-alex.bennee@linaro.org>
 <20220322094901-mutt-send-email-mst@kernel.org>
 <87v8w656g3.fsf@linaro.org>
MIME-Version: 1.0
In-Reply-To: <87v8w656g3.fsf@linaro.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: slp@redhat.com, mathieu.poirier@linaro.org, viresh.kumar@linaro.org,
 qemu-devel@nongnu.org, stefanha@redhat.com, marcandre.lureau@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Mar 22, 2022 at 03:50:28PM +0000, Alex Bennée wrote:
> 
> "Michael S. Tsirkin" <mst@redhat.com> writes:
> 
> > On Mon, Mar 21, 2022 at 03:30:24PM +0000, Alex Bennée wrote:
> >> Hi,
> >> 
> >> This series is a sub-set of patches while I was trying to re-rev my
> >> virtio-rpmb patches. It attempts to address a few things:
> >> 
> >>   - improve documentation for virtio/vhost/vhost-user
> >>   - document some of the API
> >>   - a hacky fix for F_CONFIG handling
> >>   - putting VhostUserState on a diet, make VhostUserHostNotifier dynamic
> >
> > So I think this is best deferred until after the release,
> > more of a cleanup than a bugfix.
> 
> Sorry I should have made it clearer - I wasn't intending this for 7.0
> but I also didn't want it bound up with the rpmb changes which will take
> longer to land.

Makes sense, I was just making sure.

> >
> > I will tag this series, but please do remind me after the release
> > to help make sure it does not get lost.
> >
> >
> >> In particular I've been trying to better understand how vhost-user
> >> interactions are meant to work and why there are two different methods
> >> for instantiating them. If my supposition is correct perhaps a number
> >> of devices that don't have in-kernel vhost equivalents could be converted?
> >
> > Hope I understand your question.  Well we started off with saying
> > vhost-user is just a backend, so should not affect the frontend device.
> > This is clean and makes migration work e.g. you can migrate between
> > different backends, but it makes adding features more work.
> 
> This is covered in the doc patch, specifically:
> 
>   vhost_ops vs TYPE_VHOST_USER_BACKEND

I guess I misunderstood then - what was the question again?

> >> hard to trigger the code. Is this rarely used code or just requires
> >> backends we don't see in the testing?
> >
> > Which function are you asking about exactly?
> 
>   vhost_user_slave_handle_vring_host_notifier
> 
> which is the only place where a mapping is set up AFAICT.

Well it's mostly for use with vdpa, but I think vhost user bridge
is supposed to support that with a special flag (-H use host notifier).
It's for debugging purposes as it wastes lots of CPU polling
the notification memory.

> >
> >> Alex Bennée (10):
> >>   hw/virtio: move virtio-pci.h into shared include space
> >>   virtio-pci: add notification trace points
> >>   hw/virtio: add vhost_user_[read|write] trace points
> >>   vhost-user.rst: add clarifying language about protocol negotiation
> >>   libvhost-user: expose vu_request_to_string
> >>   docs/devel: start documenting writing VirtIO devices
> >>   include/hw: start documenting the vhost API
> >>   contrib/vhost-user-blk: fix 32 bit build and enable
> >>   hw/virtio/vhost-user: don't suppress F_CONFIG when supported
> >>   virtio/vhost-user: dynamically assign VhostUserHostNotifiers
> >> 
> >> Paolo Bonzini (3):
> >>   docs: vhost-user: clean up request/reply description
> >>   docs: vhost-user: rewrite section on ring state machine
> >>   docs: vhost-user: replace master/slave with front-end/back-end
> >> 
> >>  docs/devel/index-internals.rst            |   1 +
> >>  docs/devel/virtio-backends.rst            | 214 +++++++++
> >>  docs/interop/vhost-user-gpu.rst           |  10 +-
> >>  docs/interop/vhost-user.rst               | 555 ++++++++++++----------
> >>  meson.build                               |   2 +-
> >>  include/hw/virtio/vhost-user.h            |  43 +-
> >>  include/hw/virtio/vhost.h                 | 132 ++++-
> >>  {hw => include/hw}/virtio/virtio-pci.h    |   0
> >>  subprojects/libvhost-user/libvhost-user.h |   9 +
> >>  contrib/vhost-user-blk/vhost-user-blk.c   |   6 +-
> >>  hw/scsi/vhost-user-scsi.c                 |   1 +
> >>  hw/virtio/vhost-scsi-pci.c                |   2 +-
> >>  hw/virtio/vhost-user-blk-pci.c            |   2 +-
> >>  hw/virtio/vhost-user-fs-pci.c             |   2 +-
> >>  hw/virtio/vhost-user-i2c-pci.c            |   2 +-
> >>  hw/virtio/vhost-user-input-pci.c          |   2 +-
> >>  hw/virtio/vhost-user-rng-pci.c            |   2 +-
> >>  hw/virtio/vhost-user-scsi-pci.c           |   2 +-
> >>  hw/virtio/vhost-user-vsock-pci.c          |   2 +-
> >>  hw/virtio/vhost-user.c                    | 133 ++++--
> >>  hw/virtio/vhost-vsock-pci.c               |   2 +-
> >>  hw/virtio/virtio-9p-pci.c                 |   2 +-
> >>  hw/virtio/virtio-balloon-pci.c            |   2 +-
> >>  hw/virtio/virtio-blk-pci.c                |   2 +-
> >>  hw/virtio/virtio-input-host-pci.c         |   2 +-
> >>  hw/virtio/virtio-input-pci.c              |   2 +-
> >>  hw/virtio/virtio-iommu-pci.c              |   2 +-
> >>  hw/virtio/virtio-net-pci.c                |   2 +-
> >>  hw/virtio/virtio-pci.c                    |   5 +-
> >>  hw/virtio/virtio-rng-pci.c                |   2 +-
> >>  hw/virtio/virtio-scsi-pci.c               |   2 +-
> >>  hw/virtio/virtio-serial-pci.c             |   2 +-
> >>  subprojects/libvhost-user/libvhost-user.c |   2 +-
> >>  contrib/vhost-user-blk/meson.build        |   3 +-
> >>  hw/virtio/trace-events                    |  10 +-
> >>  35 files changed, 831 insertions(+), 333 deletions(-)
> >>  create mode 100644 docs/devel/virtio-backends.rst
> >>  rename {hw => include/hw}/virtio/virtio-pci.h (100%)
> >> 
> >> -- 
> >> 2.30.2
> 
> 
> -- 
> Alex Bennée


