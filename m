Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C7F8C61921C
	for <lists+qemu-devel@lfdr.de>; Fri,  4 Nov 2022 08:38:29 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1oqrEm-00086l-Sc; Fri, 04 Nov 2022 03:35:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1oqqrn-0005ZC-DI
 for qemu-devel@nongnu.org; Fri, 04 Nov 2022 03:11:51 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1oqqrl-0000nE-87
 for qemu-devel@nongnu.org; Fri, 04 Nov 2022 03:11:51 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1667545907;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=VU8Kjmih8OLoUuq0S8n8YDeaRgiQBrQ0MdEuP1JENMw=;
 b=IxvrSmlP0zh6mNB88CO2PygbpJiyYD58WoCH/w44bS1BAm/gwFR3BuGfe2hBwvhMe7jHE7
 kZ82McQXI4jea2yABPp8Q72YF2xPV0jZY7dz6x9V5BF0mCrwAijB8aVP8V4jZ1Z//ZwdNc
 VyqYj6FBkmnfWkJAHjEK0anDTGw+1YA=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-375-UW9WnXJUM6Oo3I3nFKhntw-1; Fri, 04 Nov 2022 03:11:46 -0400
X-MC-Unique: UW9WnXJUM6Oo3I3nFKhntw-1
Received: by mail-wr1-f70.google.com with SMTP id
 j20-20020adfb314000000b002366d9f67aaso946012wrd.3
 for <qemu-devel@nongnu.org>; Fri, 04 Nov 2022 00:11:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=VU8Kjmih8OLoUuq0S8n8YDeaRgiQBrQ0MdEuP1JENMw=;
 b=UKi5IO6WQJY3dztXz2ePf9+isImyzRqAApmRiqX+eX67eSGjCvgVluxC0hLScuwibi
 FwwbMVXZkwJdveq6rSq7+7axRWpyjg47fpt0iC+cJhmJHcXPz+UtvZH5146updpnxEOo
 qhqcOl9G73hvoMWgLvXuQ/h6o3ULT2zT8rgngWpmToXZbCyTbAfnUH3MUHrJidlb8KrU
 GYYfuxjunTom9RaJj/3tc2YPrA3HhvNujknoAdui4JdHtpzPT053YT4Z9UrfPrXKBRcY
 JF844uB2sBUiyIzJWm7dbvqG+TN8bwcvgbd3DH6Pj7qDXGmfWkNLwWZNIDjxiLOI8H+n
 XmLw==
X-Gm-Message-State: ACrzQf1V613X0gb7hfghLiQYVX1gkB57PWwPHH0p1NSIkQrt+uXYr+db
 iTAXh6+hwtLZwJP0dyUJlTgWg3/Rz2ebVJQQznTFE+0HSmiqK/aBue+bCq8Qm3oZa0axRa5EP9K
 epuUQEGGpvGylHtI=
X-Received: by 2002:adf:fbd0:0:b0:236:aad0:b357 with SMTP id
 d16-20020adffbd0000000b00236aad0b357mr21419746wrs.401.1667545904658; 
 Fri, 04 Nov 2022 00:11:44 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM675N3Bg/Xe0W9D/os7zl5drPJStpV0iek81Nayei1h9wx+QwIKUdVFwefawW2Rhj1vYtgneA==
X-Received: by 2002:adf:fbd0:0:b0:236:aad0:b357 with SMTP id
 d16-20020adffbd0000000b00236aad0b357mr21419732wrs.401.1667545904422; 
 Fri, 04 Nov 2022 00:11:44 -0700 (PDT)
Received: from redhat.com ([2.52.149.81]) by smtp.gmail.com with ESMTPSA id
 bj4-20020a0560001e0400b002322bff5b3bsm3350129wrb.54.2022.11.04.00.11.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 04 Nov 2022 00:11:43 -0700 (PDT)
Date: Fri, 4 Nov 2022 03:11:40 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Yajun Wu <yajunw@nvidia.com>
Cc: qemu-devel@nongnu.org, parav@nvidia.com
Subject: Re: [PATCH v3 0/2] vhost-user: Support vhost_dev_start
Message-ID: <20221104025833-mutt-send-email-mst@kernel.org>
References: <20220629022517.2600911-1-yajunw@nvidia.com>
 <20221017064452.1226514-1-yajunw@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221017064452.1226514-1-yajunw@nvidia.com>
Received-SPF: pass client-ip=170.10.129.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.047,
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Mon, Oct 17, 2022 at 02:44:50PM +0800, Yajun Wu wrote:
> The motivation of adding vhost-user vhost_dev_start support is to
> improve backend configuration speed and reduce live migration VM
> downtime.
> 
> Today VQ configuration is issued one by one. For virtio net with
> multi-queue support, backend needs to update RSS (Receive side
> scaling) on every rx queue enable. Updating RSS is time-consuming
> (typical time like 7ms).
> 
> Implement already defined vhost status and message in the vhost
> specification [1].
> (a) VHOST_USER_PROTOCOL_F_STATUS
> (b) VHOST_USER_SET_STATUS
> (c) VHOST_USER_GET_STATUS
> 
> Send message VHOST_USER_SET_STATUS with VIRTIO_CONFIG_S_DRIVER_OK for
> device start and reset(0) for device stop.
> 
> On reception of the DRIVER_OK message, backend can apply the needed setting
> only once (instead of incremental) and also utilize parallelism on enabling
> queues.
> 
> This improves QEMU's live migration downtime with vhost user backend
> implementation by great margin, specially for the large number of VQs of 64
> from 800 msec to 250 msec.
> 
> Another change is to move the device start routines after finishing all the
> necessary device and VQ configuration, further aligning to the virtio
> specification for "device initialization sequence".
> 
> [1] https://qemu-project.gitlab.io/qemu/interop/vhost-user.html#introduction


This patchset seems to trip up ubsan.
https://gitlab.com/mitsirkin/qemu/-/pipelines/684763327/failures


specifially:

passes before this patchset:
https://gitlab.com/mitsirkin/qemu/-/jobs/3269302594

fails with this patchset:
https://gitlab.com/mitsirkin/qemu/-/pipelines/684763327/failures

(there's one patch on top but it seems unrelated)


Seems hard to debug, only reproduced under gitlab though Stefan reports
reproducing this locally.
I'm thinking of dropping this patchset for now, deferring to next
release - thoughts?



> v3:
> - rebase
> 
> v2:
> - add setting status bit VIRTIO_CONFIG_S_FEATURES_OK
> - avoid adding status bits already set
> 
> Yajun Wu (2):
>   vhost: Change the sequence of device start
>   vhost-user: Support vhost_dev_start
> 
>  hw/block/vhost-user-blk.c | 18 ++++++----
>  hw/net/vhost_net.c        | 12 +++----
>  hw/virtio/vhost-user.c    | 74 ++++++++++++++++++++++++++++++++++++++-
>  3 files changed, 90 insertions(+), 14 deletions(-)
> 
> -- 
> 2.27.0


