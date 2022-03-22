Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 59E954E3FF0
	for <lists+qemu-devel@lfdr.de>; Tue, 22 Mar 2022 14:58:27 +0100 (CET)
Received: from localhost ([::1]:59096 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nWf1m-0006sO-Dq
	for lists+qemu-devel@lfdr.de; Tue, 22 Mar 2022 09:58:26 -0400
Received: from eggs.gnu.org ([209.51.188.92]:38190)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1nWf05-0005Nq-Qh
 for qemu-devel@nongnu.org; Tue, 22 Mar 2022 09:56:41 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:46736)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1nWf04-0000OC-A5
 for qemu-devel@nongnu.org; Tue, 22 Mar 2022 09:56:41 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1647957399;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=jU3sZZRNuS/wjkqMvhgaYbUSqnhkPbWny02pJowxsxo=;
 b=GTVaSLowwhbG207D8ypU/FekSRYpL/bF0TXW8eHnMfYHmjxMh3E5Gt2rd0hOramjjyNX4V
 9121xMmQmAi7buks2LJuBlBT0Q67WmkyD4SCc8C9Vllk92JnF5FHd+TOLpvt0io3nNBaur
 Jpw7YwTPj0RyMzx8ZjDuqmeFIkPD/EA=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-78-Cm4nF0dAN12_HGvzFxDyjQ-1; Tue, 22 Mar 2022 09:56:34 -0400
X-MC-Unique: Cm4nF0dAN12_HGvzFxDyjQ-1
Received: by mail-wm1-f69.google.com with SMTP id
 v2-20020a05600c214200b0038c7c02deceso957867wml.8
 for <qemu-devel@nongnu.org>; Tue, 22 Mar 2022 06:56:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=jU3sZZRNuS/wjkqMvhgaYbUSqnhkPbWny02pJowxsxo=;
 b=vD5Y7OBI6GydSddShBsDGt/YS9TNuzBfQ9ViacMU5DSfPZgnDvYGocBRBblUSwfMoo
 8DYUsbCwlb+viwFf6FKrXNKF3xx17JvErCx9sDYYfNJPElsm/To48x0BNjVBWtmuXoX9
 ZeQy1QkOPi1Prnn5GAAHPmavtZxPYWRGWJnbgeTnY2neqAAJrE+AjyhCU3S4LKTqOIcB
 LyS6SdUqxWC4N31i9KbsGuo+9j34H7HD8Cj5ukdEQlzAGllFLhvc2wSywuwSIAlBaOI6
 Fs0xDpCnkLnP4eO95PUYxvwrpaAN0YiYUTweIqDXXIFFvOnMsIZd7xviAkknYX/Hgla8
 wyyg==
X-Gm-Message-State: AOAM532FE1kLJ9bt7q6OxZ4X/eqcuoUtk6RrMqHly2XiVQcKrcpnrtOk
 aob0pItAzjzOupdUc3ybWrno9SUEbWGQy2dirFt9lDoSyoUWnJ/zQWzhRdhMSGropg5kGBXV3qh
 2FeOSGeyDN+dTDSU=
X-Received: by 2002:adf:e58a:0:b0:203:f3c8:4cfe with SMTP id
 l10-20020adfe58a000000b00203f3c84cfemr17796432wrm.475.1647957393469; 
 Tue, 22 Mar 2022 06:56:33 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJz4S1paSuCTeILDTipSKzHk6iY3+KHQ6y5LdfdvOmFRL+9b2oo2tYbM36b7EPKUtO29aQIGQw==
X-Received: by 2002:adf:e58a:0:b0:203:f3c8:4cfe with SMTP id
 l10-20020adfe58a000000b00203f3c84cfemr17796405wrm.475.1647957393177; 
 Tue, 22 Mar 2022 06:56:33 -0700 (PDT)
Received: from redhat.com ([2.55.132.0]) by smtp.gmail.com with ESMTPSA id
 l20-20020a05600c1d1400b0038cba2f88c0sm1582601wms.26.2022.03.22.06.56.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 22 Mar 2022 06:56:32 -0700 (PDT)
Date: Tue, 22 Mar 2022 09:56:28 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Alex =?iso-8859-1?Q?Benn=E9e?= <alex.bennee@linaro.org>
Subject: Re: [PATCH  v1 00/13] various virtio docs, fixes and tweaks
Message-ID: <20220322094901-mutt-send-email-mst@kernel.org>
References: <20220321153037.3622127-1-alex.bennee@linaro.org>
MIME-Version: 1.0
In-Reply-To: <20220321153037.3622127-1-alex.bennee@linaro.org>
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

On Mon, Mar 21, 2022 at 03:30:24PM +0000, Alex Bennée wrote:
> Hi,
> 
> This series is a sub-set of patches while I was trying to re-rev my
> virtio-rpmb patches. It attempts to address a few things:
> 
>   - improve documentation for virtio/vhost/vhost-user
>   - document some of the API
>   - a hacky fix for F_CONFIG handling
>   - putting VhostUserState on a diet, make VhostUserHostNotifier dynamic

So I think this is best deferred until after the release,
more of a cleanup than a bugfix.

I will tag this series, but please do remind me after the release
to help make sure it does not get lost.


> In particular I've been trying to better understand how vhost-user
> interactions are meant to work and why there are two different methods
> for instantiating them. If my supposition is correct perhaps a number
> of devices that don't have in-kernel vhost equivalents could be converted?

Hope I understand your question.  Well we started off with saying
vhost-user is just a backend, so should not affect the frontend device.
This is clean and makes migration work e.g. you can migrate between
different backends, but it makes adding features more work.


> While working onthe VhostUserHostNotifier changes I found it quite
> hard to trigger the code. Is this rarely used code or just requires
> backends we don't see in the testing?

Which function are you asking about exactly?

> Alex Bennée (10):
>   hw/virtio: move virtio-pci.h into shared include space
>   virtio-pci: add notification trace points
>   hw/virtio: add vhost_user_[read|write] trace points
>   vhost-user.rst: add clarifying language about protocol negotiation
>   libvhost-user: expose vu_request_to_string
>   docs/devel: start documenting writing VirtIO devices
>   include/hw: start documenting the vhost API
>   contrib/vhost-user-blk: fix 32 bit build and enable
>   hw/virtio/vhost-user: don't suppress F_CONFIG when supported
>   virtio/vhost-user: dynamically assign VhostUserHostNotifiers
> 
> Paolo Bonzini (3):
>   docs: vhost-user: clean up request/reply description
>   docs: vhost-user: rewrite section on ring state machine
>   docs: vhost-user: replace master/slave with front-end/back-end
> 
>  docs/devel/index-internals.rst            |   1 +
>  docs/devel/virtio-backends.rst            | 214 +++++++++
>  docs/interop/vhost-user-gpu.rst           |  10 +-
>  docs/interop/vhost-user.rst               | 555 ++++++++++++----------
>  meson.build                               |   2 +-
>  include/hw/virtio/vhost-user.h            |  43 +-
>  include/hw/virtio/vhost.h                 | 132 ++++-
>  {hw => include/hw}/virtio/virtio-pci.h    |   0
>  subprojects/libvhost-user/libvhost-user.h |   9 +
>  contrib/vhost-user-blk/vhost-user-blk.c   |   6 +-
>  hw/scsi/vhost-user-scsi.c                 |   1 +
>  hw/virtio/vhost-scsi-pci.c                |   2 +-
>  hw/virtio/vhost-user-blk-pci.c            |   2 +-
>  hw/virtio/vhost-user-fs-pci.c             |   2 +-
>  hw/virtio/vhost-user-i2c-pci.c            |   2 +-
>  hw/virtio/vhost-user-input-pci.c          |   2 +-
>  hw/virtio/vhost-user-rng-pci.c            |   2 +-
>  hw/virtio/vhost-user-scsi-pci.c           |   2 +-
>  hw/virtio/vhost-user-vsock-pci.c          |   2 +-
>  hw/virtio/vhost-user.c                    | 133 ++++--
>  hw/virtio/vhost-vsock-pci.c               |   2 +-
>  hw/virtio/virtio-9p-pci.c                 |   2 +-
>  hw/virtio/virtio-balloon-pci.c            |   2 +-
>  hw/virtio/virtio-blk-pci.c                |   2 +-
>  hw/virtio/virtio-input-host-pci.c         |   2 +-
>  hw/virtio/virtio-input-pci.c              |   2 +-
>  hw/virtio/virtio-iommu-pci.c              |   2 +-
>  hw/virtio/virtio-net-pci.c                |   2 +-
>  hw/virtio/virtio-pci.c                    |   5 +-
>  hw/virtio/virtio-rng-pci.c                |   2 +-
>  hw/virtio/virtio-scsi-pci.c               |   2 +-
>  hw/virtio/virtio-serial-pci.c             |   2 +-
>  subprojects/libvhost-user/libvhost-user.c |   2 +-
>  contrib/vhost-user-blk/meson.build        |   3 +-
>  hw/virtio/trace-events                    |  10 +-
>  35 files changed, 831 insertions(+), 333 deletions(-)
>  create mode 100644 docs/devel/virtio-backends.rst
>  rename {hw => include/hw}/virtio/virtio-pci.h (100%)
> 
> -- 
> 2.30.2


