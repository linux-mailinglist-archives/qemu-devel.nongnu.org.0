Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 10F91490471
	for <lists+qemu-devel@lfdr.de>; Mon, 17 Jan 2022 09:54:24 +0100 (CET)
Received: from localhost ([::1]:52596 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n9NmO-0003h9-Ix
	for lists+qemu-devel@lfdr.de; Mon, 17 Jan 2022 03:54:21 -0500
Received: from eggs.gnu.org ([209.51.188.92]:35840)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1n9Nff-0006wT-TY
 for qemu-devel@nongnu.org; Mon, 17 Jan 2022 03:47:24 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:41388)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1n9Nfe-0006UU-82
 for qemu-devel@nongnu.org; Mon, 17 Jan 2022 03:47:23 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1642409241;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=cJPlj4TcOGFPeZ+j56DgVnySG9Ye8oWCxU1JkVQOhTE=;
 b=Pq+sXfo4LVC4dgZ0QuEZUeoa57Cu0OUjL70D2M2NdqrhS4b0tvc3VmQZdLppRbRkSVNid8
 CSWxsJQfTHqO/3H0dQAmLhwDlbBk1rfL/rr/SbZeJnH3W51B+V6sajZt9U3Kc7xUk8PYN6
 LC3MPVmVCN8cXFFLVS+JQ8RE4wE2VcU=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-516-tCtzcw00MOuLV72HcdaJjg-1; Mon, 17 Jan 2022 03:47:18 -0500
X-MC-Unique: tCtzcw00MOuLV72HcdaJjg-1
Received: by mail-wm1-f69.google.com with SMTP id
 bg16-20020a05600c3c9000b0034bea12c043so4121526wmb.7
 for <qemu-devel@nongnu.org>; Mon, 17 Jan 2022 00:47:17 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=cJPlj4TcOGFPeZ+j56DgVnySG9Ye8oWCxU1JkVQOhTE=;
 b=BbP/jLkDCWd/Tch0w5dPRASrXk8x9WQYcQirZF5//VqAw5Mfn9/b27EzhOCq0aqTTg
 65mRULB6HktjMRqAj9Xc9eE+qeokXtlWdyQ6KHcIBDOqfXEyU5AV5YHE2uCmv7iY2hWb
 2UZBoEEO6mU/wdSsjLii5ynZlQDTp70EMZqseeRISf8bFLrb8UB+x5AkkAGBdQgXIyrw
 ul477eL+7By+acVkZOK3U7juVVFGgRxYcnLU8OxliY9FEQjI07kB+Crie3J5uU6ELyrF
 UhXq7vfCRkfa1Quj4CDzDWQWUFcUd30TLLaVT0A7c11VYas1oBS2hDczDag1MGGfbqVt
 Vzeg==
X-Gm-Message-State: AOAM533/95sTuLjgNtDv9AbV9uBfVgN20cxK8u1kXiPTQBkrjDl09VjQ
 f56eAHb06h2EDn4wbgs2u0SM8NZ/QG6u8vhyGajcJjGNoZ/+4abyJ5+JCt/YhuSd9CWpR1/kHDB
 AMrVxWRxDNIBgPGc=
X-Received: by 2002:adf:ffcd:: with SMTP id x13mr17995909wrs.672.1642409236913; 
 Mon, 17 Jan 2022 00:47:16 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzONZE57OJ+htmPwx/Wj75PKQN4QA78wF7wQesySd8lQrLvDPgYoRH6eJaYIuptZa4kjyVLGg==
X-Received: by 2002:adf:ffcd:: with SMTP id x13mr17995899wrs.672.1642409236725; 
 Mon, 17 Jan 2022 00:47:16 -0800 (PST)
Received: from redhat.com ([2.55.154.241])
 by smtp.gmail.com with ESMTPSA id 204sm6382078wmc.29.2022.01.17.00.47.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 17 Jan 2022 00:47:15 -0800 (PST)
Date: Mon, 17 Jan 2022 03:47:08 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Viresh Kumar <viresh.kumar@linaro.org>
Subject: Re: [PATCH 0/2] virtio: Add vhost-user-gpio device's support
Message-ID: <20220117034606-mutt-send-email-mst@kernel.org>
References: <cover.1641987128.git.viresh.kumar@linaro.org>
MIME-Version: 1.0
In-Reply-To: <cover.1641987128.git.viresh.kumar@linaro.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.699,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Vincent Guittot <vincent.guittot@linaro.org>,
 Alex =?iso-8859-1?Q?Benn=E9e?= <alex.bennee@linaro.org>, qemu-devel@nongnu.org,
 stratos-dev@op-lists.linaro.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Jan 12, 2022 at 05:04:57PM +0530, Viresh Kumar wrote:
> Hello,
> 
> This patchset adds vhost-user-gpio device's support in Qemu. The support for the
> same has already been added to virtio specification and Linux Kernel.
> 
> A Rust based backend is also in progress and is tested against this patchset:
> 
> https://github.com/rust-vmm/vhost-device/pull/76


I'm reluctant to add this with no tests in tree.
Want to write a minimal libhost-user based backend?
We also need some maintainers to step up.


> --
> Viresh
> 
> Viresh Kumar (2):
>   hw/virtio: add boilerplate for vhost-user-gpio device
>   hw/virtio: add vhost-user-gpio-pci boilerplate
> 
>  hw/virtio/Kconfig                   |   5 +
>  hw/virtio/meson.build               |   2 +
>  hw/virtio/vhost-user-gpio-pci.c     |  69 ++++++
>  hw/virtio/vhost-user-gpio.c         | 343 ++++++++++++++++++++++++++++
>  include/hw/virtio/vhost-user-gpio.h |  35 +++
>  5 files changed, 454 insertions(+)
>  create mode 100644 hw/virtio/vhost-user-gpio-pci.c
>  create mode 100644 hw/virtio/vhost-user-gpio.c
>  create mode 100644 include/hw/virtio/vhost-user-gpio.h
> 
> -- 
> 2.31.1.272.g89b43f80a514


