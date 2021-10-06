Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 752844239DA
	for <lists+qemu-devel@lfdr.de>; Wed,  6 Oct 2021 10:38:24 +0200 (CEST)
Received: from localhost ([::1]:44498 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mY2RT-0007RH-ID
	for lists+qemu-devel@lfdr.de; Wed, 06 Oct 2021 04:38:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59358)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1mY2PV-0005RU-Rn
 for qemu-devel@nongnu.org; Wed, 06 Oct 2021 04:36:21 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:21908)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1mY2PR-00010x-TR
 for qemu-devel@nongnu.org; Wed, 06 Oct 2021 04:36:20 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1633509376;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=JCeUjgknZkofaA/EJsKOW1oSQGlpctH3Esp8sWNbQvA=;
 b=UO1PiMjwWAoJh9pMgy1wIkpSIdzuuRwqHio3zUw1uSixRs+AQU9y7cMyhE0Mlhb5BROIB9
 it0a5skFOFf8XA6Z09BMfmbo63h9zctgdIRHZ1rSjH0OeUffDzqRmjywKePFPHnp0osYtY
 Thvx0HxmFuaih2WjTrNUOxB0rvHdXOI=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-343-_b5VlaNrO42a4AN2s3ysQQ-1; Wed, 06 Oct 2021 04:36:15 -0400
X-MC-Unique: _b5VlaNrO42a4AN2s3ysQQ-1
Received: by mail-wr1-f70.google.com with SMTP id
 d13-20020adfa34d000000b00160aa1cc5f1so1401929wrb.14
 for <qemu-devel@nongnu.org>; Wed, 06 Oct 2021 01:36:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=JCeUjgknZkofaA/EJsKOW1oSQGlpctH3Esp8sWNbQvA=;
 b=k4yy8Eiv0k35RipphqZ13Z/BFJ/xyRnEn/4O9PfVEnIqrWhzKlrzJw5KGxvkKuJqQP
 NjyhOKhrkixNSEfkCj2Pe8eLc+lk1lssO7f8HV0qSMpBvJZ4cnwiabnTCoVT80R8Tci3
 X1AojHHdd6kFlAiVb4BjRtSxSHy9l7tDxEwAou/LAUAV83uDkW2bDBKEitirhYh9jZYI
 KBXBce4rvg9OJTBFAr7u3kEhhZV0qwtwGV9XOV9FhHdtYLZ30q92GMH6KvByZl9wBXDj
 fYwIfPBqJebt9uoeKauOog5IY6B069gTfls54F8LUxCpijC1X8nAk28BoRl8Wbv2CRlS
 aS4Q==
X-Gm-Message-State: AOAM532JkayZbXELsOXTkkgR7A0yOC/4lrec6pEKDJw1cHWs88Qux+M0
 EaqCCKi+jJJMNTxoBa2tUPCCvs+6nWOIdfcc+x134Pdza7PeQD3DejgCSyH87GNx7aS4l9aAPH0
 xR+zFeVda9BgVh3c=
X-Received: by 2002:a1c:f703:: with SMTP id v3mr8100555wmh.177.1633509374293; 
 Wed, 06 Oct 2021 01:36:14 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJy0kGwmKYWvSZ9yVe0xrPz0xeWrh7GvzAGzN87BTmj7cu5Zcd++DO991UOi3w5EDev7dad7VA==
X-Received: by 2002:a1c:f703:: with SMTP id v3mr8100525wmh.177.1633509374011; 
 Wed, 06 Oct 2021 01:36:14 -0700 (PDT)
Received: from redhat.com ([2a02:ed0:53a2:ce00:a3d7:784f:9060:9de4])
 by smtp.gmail.com with ESMTPSA id z5sm5842729wmp.26.2021.10.06.01.36.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 06 Oct 2021 01:36:13 -0700 (PDT)
Date: Wed, 6 Oct 2021 04:36:10 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
Subject: Re: [PATCH v0 0/2] virtio-blk and vhost-user-blk cross-device
 migration
Message-ID: <20211006043314-mutt-send-email-mst@kernel.org>
References: <20211004150731.191270-1-den-plotnikov@yandex-team.ru>
 <20211004110855-mutt-send-email-mst@kernel.org>
 <YVuL0FRN5ilRN2Pd@rvkaganb.lan>
 <20211005024754-mutt-send-email-mst@kernel.org>
 <YVxaodahFBOvANL0@work-vm>
 <20211005161008.iq5ao7t2sdqeo6kc@habkost.net>
 <20211005175503-mutt-send-email-mst@kernel.org>
 <YV1ZuizhQ5gO9nd6@work-vm>
 <20211006041419-mutt-send-email-mst@kernel.org>
 <YV1eQmM/+HXZy06C@work-vm>
MIME-Version: 1.0
In-Reply-To: <YV1eQmM/+HXZy06C@work-vm>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.066,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: kwolf@redhat.com, Denis Plotnikov <den-plotnikov@yandex-team.ru>,
 Eduardo Habkost <ehabkost@redhat.com>, qemu-block@nongnu.org,
 qemu-devel@nongnu.org, raphael.norwitz@nutanix.com,
 Roman Kagan <rvkagan@yandex-team.ru>, yc-core@yandex-team.ru,
 pbonzini@redhat.com,
 Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Oct 06, 2021 at 09:28:50AM +0100, Dr. David Alan Gilbert wrote:
> To me it feels the same as the distinction between vhost-kernel and qemu
> backended virtio that we get in net and others - in principal it's just 
> another implementation.

In net it's actually like this. Same -device, a different netdev.

> A tricky part is guaranteeing the set of visible virtio features between
> implementations; we have that problem when we use vhost-kernel and run
> on a newer/older kernel and gain virtio features; the same will be true
> with vhost-user implementations.

That's not new but yes we need to work on this.

> But this would make the structure of a vhost-user implementation quite
> different.
> 
> Dave

Right. That's why I'm reluctant to just add a new device type that
has special compatibility requirements.

> > 
> > > > -- 
> > > > MST
> > > > 
> > > -- 
> > > Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK
> > 
> -- 
> Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK


