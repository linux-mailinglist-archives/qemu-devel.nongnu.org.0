Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EA4363C438F
	for <lists+qemu-devel@lfdr.de>; Mon, 12 Jul 2021 07:47:05 +0200 (CEST)
Received: from localhost ([::1]:44000 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m2omX-0003U4-1t
	for lists+qemu-devel@lfdr.de; Mon, 12 Jul 2021 01:47:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48632)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1m2okQ-0002Hb-VX
 for qemu-devel@nongnu.org; Mon, 12 Jul 2021 01:44:55 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:29150)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1m2okO-000305-Vq
 for qemu-devel@nongnu.org; Mon, 12 Jul 2021 01:44:54 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1626068692;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=7PW37pTVScCwsTqHTcBYOA+aW8kcS0pqtjf2P3/KHXI=;
 b=U/4JNUmAhE45ffQfs4TUcLAblfTvBduyNWQJxLXujz2+wE3jwj2+K8/BX2R/e2P9WshPqr
 GuAKY3qCYMjbT6MXrNTSipNt5OkpN7Y5RIxMDvcogMyvjXQkxfAo1vNeSzGds7D6pAiRTN
 jymfHK3dPy25/ghqQimMGw6F5TGnnOM=
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com
 [209.85.215.198]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-582-6GKgRDNFNpymtRXftM8HUw-1; Mon, 12 Jul 2021 01:44:50 -0400
X-MC-Unique: 6GKgRDNFNpymtRXftM8HUw-1
Received: by mail-pg1-f198.google.com with SMTP id
 k3-20020a6568c30000b029022887377adeso13680563pgt.15
 for <qemu-devel@nongnu.org>; Sun, 11 Jul 2021 22:44:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=7PW37pTVScCwsTqHTcBYOA+aW8kcS0pqtjf2P3/KHXI=;
 b=mWIhFzCKfKEeRnA+xBpETg4TeNT2zPDf/FK0/DDmIdA0rLpGrVZyRtHbuRIlgPzTB8
 TT6Brz0OURD5v65yeUN021R0+pnI9GAYtFcHitkW6Y/cF3Det9QLDiif5/zHkf2jVwre
 Ofibw03wiHQGepU+weSuLQ/Bljo26xGxYRNvmaN6bVZRcbiXkZjpvLAb9HG6fzu+l2aN
 aKNZhtaPnlV/SlclVmBCTqQygq7YenrAuA6voVQ0Sqaaxd/ELqkQ81yowsBXLmmyR0Zu
 gpXPNhD63ZXxVItzmQ6bQ/XZ9Nx/Iqk0i3bMRlhMsrS6G7mPUd79c+G+QFO0HdbWPu4x
 R0Mw==
X-Gm-Message-State: AOAM5306QqZkVxb7PsQWzyHXcmfjGyn6QG/V9xasWuucsEap7JAovYdx
 fn08o/E9fmge9Ncjt2bi4OM6oiM+sW2tcEeYuU154nyOabEc4NA9sKKPudMBnqOUyxAU6xje14u
 2wn5yGHR13eac+28=
X-Received: by 2002:a65:5086:: with SMTP id r6mr51410572pgp.237.1626068689561; 
 Sun, 11 Jul 2021 22:44:49 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzmXzhL9uIWV7dVrIx08BXT5ZwQWMzEc9kzWeA53aqdc1SaXJl4nLvLkqxtBgZF/R9MEUcDmg==
X-Received: by 2002:a65:5086:: with SMTP id r6mr51410553pgp.237.1626068689317; 
 Sun, 11 Jul 2021 22:44:49 -0700 (PDT)
Received: from wangxiaodeMacBook-Air.local ([209.132.188.80])
 by smtp.gmail.com with ESMTPSA id y6sm15670958pgk.79.2021.07.11.22.44.46
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 11 Jul 2021 22:44:48 -0700 (PDT)
Subject: Re: [PATCH V2 00/18] vhost-vDPA multiqueue
To: qemu-devel@nongnu.org, mst@redhat.com
References: <20210706082717.37730-1-jasowang@redhat.com>
From: Jason Wang <jasowang@redhat.com>
Message-ID: <ce31242d-08a9-b1e4-f260-8c31ca4b49c0@redhat.com>
Date: Mon, 12 Jul 2021 13:44:45 +0800
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210706082717.37730-1-jasowang@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jasowang@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=gbk; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Received-SPF: pass client-ip=170.10.133.124; envelope-from=jasowang@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -16
X-Spam_score: -1.7
X-Spam_bar: -
X-Spam_report: (-1.7 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.7,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 MIME_CHARSET_FARAWAY=2.45, NICE_REPLY_A=-0.631, RCVD_IN_DNSWL_LOW=-0.7,
 RCVD_IN_MSPIKE_H4=-0.01, RCVD_IN_MSPIKE_WL=-0.01, SPF_HELO_NONE=0.001,
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
Cc: eperezma@redhat.com, elic@nvidia.com, lingshan.zhu@intel.com,
 lulu@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


ÔÚ 2021/7/6 ÏÂÎç4:26, Jason Wang Ð´µÀ:
> Hi All:
>
> This patch implements the multiqueue support for vhost-vDPA. The most
> important requirement the control virtqueue support. The virtio-net
> and vhost-net core are tweak to support control virtqueue as if what
> data queue pairs are done: a dedicated vhost_net device which is
> coupled with the NetClientState is intrdouced so most of the existing
> vhost codes could be reused with minor changes. With the control
> virtqueue, vhost-vDPA are extend to support creating and destroying
> multiqueue queue pairs plus the control virtqueue.
>
> Tests are done via the vp_vdpa driver in L1 guest plus vdpa simulator
> on L0.
>
> Please reivew.


If no objection, I will queue this for 6.1.

Thanks


>
> Changes since V1:
>
> - validating all features that depends on ctrl vq
> - typo fixes and commit log tweaks
> - fix build errors because max_qps is used before it is introduced
>
> Thanks
>
> Jason Wang (18):
>    vhost_net: remove the meaningless assignment in vhost_net_start_one()
>    vhost: use unsigned int for nvqs
>    vhost_net: do not assume nvqs is always 2
>    vhost-vdpa: remove the unnecessary check in vhost_vdpa_add()
>    vhost-vdpa: don't cleanup twice in vhost_vdpa_add()
>    vhost-vdpa: fix leaking of vhost_net in vhost_vdpa_add()
>    vhost-vdpa: tweak the error label in vhost_vdpa_add()
>    vhost-vdpa: fix the wrong assertion in vhost_vdpa_init()
>    vhost-vdpa: remove the unncessary queue_index assignment
>    vhost-vdpa: open device fd in net_init_vhost_vdpa()
>    vhost-vdpa: classify one time request
>    vhost-vdpa: prepare for the multiqueue support
>    vhost-vdpa: let net_vhost_vdpa_init() returns NetClientState *
>    net: introduce control client
>    vhost-net: control virtqueue support
>    virito-net: use "qps" instead of "queues" when possible
>    virtio-net: vhost control virtqueue support
>    vhost-vdpa: multiqueue support
>
>   hw/net/vhost_net.c             |  48 +++++++---
>   hw/net/virtio-net.c            | 165 ++++++++++++++++++---------------
>   hw/virtio/vhost-vdpa.c         |  55 ++++++++++-
>   include/hw/virtio/vhost-vdpa.h |   1 +
>   include/hw/virtio/vhost.h      |   2 +-
>   include/hw/virtio/virtio-net.h |   5 +-
>   include/net/net.h              |   5 +
>   include/net/vhost_net.h        |   7 +-
>   net/net.c                      |  24 ++++-
>   net/tap.c                      |   1 +
>   net/vhost-user.c               |   1 +
>   net/vhost-vdpa.c               | 156 ++++++++++++++++++++++++-------
>   12 files changed, 332 insertions(+), 138 deletions(-)
>


