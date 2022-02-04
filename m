Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A7D124A9B07
	for <lists+qemu-devel@lfdr.de>; Fri,  4 Feb 2022 15:32:25 +0100 (CET)
Received: from localhost ([::1]:45458 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nFzdP-0000dm-JL
	for lists+qemu-devel@lfdr.de; Fri, 04 Feb 2022 09:32:23 -0500
Received: from eggs.gnu.org ([209.51.188.92]:36438)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1nFzFJ-0007sK-6T
 for qemu-devel@nongnu.org; Fri, 04 Feb 2022 09:07:32 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:51371)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1nFzF7-0005WQ-8D
 for qemu-devel@nongnu.org; Fri, 04 Feb 2022 09:07:28 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1643983627;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=KHwzSjcvTqXmGbshWtKVjCMRZJU6sjTCOuEqSUyG60U=;
 b=iVLa2elXKeezhYX7g2xdc5QmN2YQgRVhySuDAb8YVeL35fx2hYd8uXinbEoVFFG/4UaGt/
 vR2m8+9BbgwXd0hKCd6mPr+n3CDIJ6JB2mgEgQb7rTF5QvJn5zPDInb0m0C1QfnU/qhrAR
 C7K5CLdpPGJjONleMZh+2gLVKAQkHW0=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-362-c96HU9EIMiqUhD0J_6vp-Q-1; Fri, 04 Feb 2022 09:07:04 -0500
X-MC-Unique: c96HU9EIMiqUhD0J_6vp-Q-1
Received: by mail-wm1-f70.google.com with SMTP id
 bg32-20020a05600c3ca000b00349f2aca1beso2418643wmb.9
 for <qemu-devel@nongnu.org>; Fri, 04 Feb 2022 06:07:04 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=KHwzSjcvTqXmGbshWtKVjCMRZJU6sjTCOuEqSUyG60U=;
 b=kHFdcpBd+lgsekzqdxeaLoJ8jDJt0/fGKGUplRIlI0XwZ/QLZ16MY2XtuJAgci8/CQ
 T0M5xdodns8ofy3RX/oNst0tHCN9MtfxedRWkDJeQ7TMBmAs5Gu8hIA5YH3mPTyYj+ue
 kNZ+Ga6ce8I1PtlTumFpUF6AmKOcVNZSxX4fnjD41ZIxbWNNaCay+b4xI4+qozIkGZ4O
 ZH+kGNV+K1rRNe4Q5u4TLGfHvZaMkvfGct7XDTdEQsadqs7dtIWHnGSHrZA+5r0/gxAH
 Zhi1sEh04U40GqC0lcxPmmT0HEtqTGKhrVrpubNsm1IdrKfwzHEQrBka9EMF/iFJ7qOv
 e4dQ==
X-Gm-Message-State: AOAM530TI4z9qAi26NFuG/dLCGpDQrZUN4k+mV/C+qcyCGBO3wCX/jHB
 k25vdj2kGz9bxnfYz0cK0Yn+iFnt0UYaZ/w/RkI3Gl+lgMwrsvMjluDVwpHTjhTKW/xW/efEWbQ
 KC03UBqXw4WpnJZU=
X-Received: by 2002:adf:f306:: with SMTP id i6mr2650528wro.421.1643983623745; 
 Fri, 04 Feb 2022 06:07:03 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxaKQ//uSS1t3DBG34M3ZVsVdA4jPkjoWEuTB6GJl+uwe58ddpHrwTHCEJZajQFs28pYtx00A==
X-Received: by 2002:adf:f306:: with SMTP id i6mr2650506wro.421.1643983623477; 
 Fri, 04 Feb 2022 06:07:03 -0800 (PST)
Received: from redhat.com ([2a10:8005:331d:0:5c51:c095:613e:277c])
 by smtp.gmail.com with ESMTPSA id m14sm2693377wrp.4.2022.02.04.06.06.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 04 Feb 2022 06:06:59 -0800 (PST)
Date: Fri, 4 Feb 2022 09:06:57 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Alex =?iso-8859-1?Q?Benn=E9e?= <alex.bennee@linaro.org>
Subject: Re: [PATCH 0/2] virtio: Add vhost-user-gpio device's support
Message-ID: <20220204090512-mutt-send-email-mst@kernel.org>
References: <cover.1641987128.git.viresh.kumar@linaro.org>
 <20220204072104-mutt-send-email-mst@kernel.org>
 <874k5espp1.fsf@linaro.org>
MIME-Version: 1.0
In-Reply-To: <874k5espp1.fsf@linaro.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.092,
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
Cc: Viresh Kumar <viresh.kumar@linaro.org>,
 Vincent Guittot <vincent.guittot@linaro.org>, qemu-devel@nongnu.org,
 stratos-dev@op-lists.linaro.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, Feb 04, 2022 at 01:52:47PM +0000, Alex Bennée wrote:
> 
> "Michael S. Tsirkin" <mst@redhat.com> writes:
> 
> > On Wed, Jan 12, 2022 at 05:04:57PM +0530, Viresh Kumar wrote:
> >> Hello,
> >> 
> >> This patchset adds vhost-user-gpio device's support in Qemu. The support for the
> >> same has already been added to virtio specification and Linux Kernel.
> >> 
> >> A Rust based backend is also in progress and is tested against this patchset:
> >> 
> >> https://github.com/rust-vmm/vhost-device/pull/76
> >
> > So I'm waiting for v2 of this, right?
> 
> If you can give any pointers for how to properly instantiate the stub in
> qtest then we can spin v2 pretty quickly. I tried but it didn't work:
> 
>   Subject: [RFC PATCH] tests/qtest: attempt to enable tests for virtio-gpio (!working)
>   Date: Fri, 21 Jan 2022 15:15:34 +0000
>   Message-Id: <20220121151534.3654562-1-alex.bennee@linaro.org>
>   X-Mailer: git-send-email 2.30.2
>   In-Reply-To: <20220120040234.ehcjcdr6wrvlz3yc@vireshk-i7>
>   References: <20220120040234.ehcjcdr6wrvlz3yc@vireshk-i7>
> 
> it's all a bit opaque as to why it didn't.

A bit rushed short term, it this isn't resolved soon I'll try to help.
Maybe try CC other vhost-user maintainers (for blk,gpu etc) meanwhile.

> >
> >> --
> >> Viresh
> >> 
> >> Viresh Kumar (2):
> >>   hw/virtio: add boilerplate for vhost-user-gpio device
> >>   hw/virtio: add vhost-user-gpio-pci boilerplate
> >> 
> >>  hw/virtio/Kconfig                   |   5 +
> >>  hw/virtio/meson.build               |   2 +
> >>  hw/virtio/vhost-user-gpio-pci.c     |  69 ++++++
> >>  hw/virtio/vhost-user-gpio.c         | 343 ++++++++++++++++++++++++++++
> >>  include/hw/virtio/vhost-user-gpio.h |  35 +++
> >>  5 files changed, 454 insertions(+)
> >>  create mode 100644 hw/virtio/vhost-user-gpio-pci.c
> >>  create mode 100644 hw/virtio/vhost-user-gpio.c
> >>  create mode 100644 include/hw/virtio/vhost-user-gpio.h
> >> 
> >> -- 
> >> 2.31.1.272.g89b43f80a514
> 
> 
> -- 
> Alex Bennée


