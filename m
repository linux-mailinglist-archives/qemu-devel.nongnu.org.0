Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C89163CC643
	for <lists+qemu-devel@lfdr.de>; Sat, 17 Jul 2021 22:33:30 +0200 (CEST)
Received: from localhost ([::1]:37722 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m4r05-0000iH-85
	for lists+qemu-devel@lfdr.de; Sat, 17 Jul 2021 16:33:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44634)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1m4qzJ-0008TG-3j
 for qemu-devel@nongnu.org; Sat, 17 Jul 2021 16:32:41 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:20585)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1m4qzF-0006N6-Ut
 for qemu-devel@nongnu.org; Sat, 17 Jul 2021 16:32:39 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1626553955;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=ka3dyUDiw15N3k9H7abNPaNF4GYJm5hz/FG022DTn5A=;
 b=IoKhu01tj2swf6fYRzXYCKpQncgXUotHREQ902Smb8zpWwXZBJzjUMxFbxysraGSPj4Xyq
 bTHnaudlvh1NQP4kDXSuH1XdAQH4R4LgLOUd3PHwegz5i6RAMAOa1weG56pIcxgJMO5+aH
 i41w8TC3M2dmcu9V3ZobLenypwS4SAA=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-341-q5N7a-VhPMyXDxdKGwtMkA-1; Sat, 17 Jul 2021 16:32:34 -0400
X-MC-Unique: q5N7a-VhPMyXDxdKGwtMkA-1
Received: by mail-ed1-f72.google.com with SMTP id
 x16-20020aa7d6d00000b02903a2e0d2acb7so6736607edr.16
 for <qemu-devel@nongnu.org>; Sat, 17 Jul 2021 13:32:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=ka3dyUDiw15N3k9H7abNPaNF4GYJm5hz/FG022DTn5A=;
 b=O0vxIH6beRaGkA4eJHXa4zCi9hgdzAYL84Oc1yAUYSXg/D72AeSEWTMKtVopx5Fr5C
 2F1xGgoPeaL5f3xxvnGcrrPQtElw/OONUBD6Lgf3DE4F/4mzdBc/JjayZgoApgZPfd9u
 cr7VQ+Mv6ppajMOZQ9z/bQK9za2RambSGSOZm+Yd2GASuBqaBralNoJAclvGS0AxItnB
 DvuNnC1oLTgkqTHt3cWRmDBRawEeOMYnGdm17t1hR+8NYgmsUPws+dy/S6x8hdM00h6p
 iNMicLTcGMp1kRN08T2bns52mxuWNikMceWwQZyA5xXzHT3mBj+vQguRI/YpRx0VC5C9
 1rgw==
X-Gm-Message-State: AOAM531MA/eqEu7R2tJqf2Yj63HgWrk2HiwpdLgM6pA6Z5AB7BtMIAly
 LUnMJsZDFIOKsL+xE72SD354OjJB6rmekBneydsnz+uXNLgLVL0ldbEgXetacvS/Rv1iLXXIxBc
 rHuG46BlR0TSAd48=
X-Received: by 2002:a05:6402:1a3c:: with SMTP id
 be28mr23704785edb.15.1626553953301; 
 Sat, 17 Jul 2021 13:32:33 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJx9N8Bi3VDxXwlP4V+clO/r5cGQqnlu8S9Fm8E9y/0CD4OVarLdjDAfbkrDQ8oOhKvIzvvFDA==
X-Received: by 2002:a05:6402:1a3c:: with SMTP id
 be28mr23704755edb.15.1626553953014; 
 Sat, 17 Jul 2021 13:32:33 -0700 (PDT)
Received: from redhat.com ([2.55.29.175])
 by smtp.gmail.com with ESMTPSA id g8sm5590481eds.25.2021.07.17.13.32.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 17 Jul 2021 13:32:31 -0700 (PDT)
Date: Sat, 17 Jul 2021 16:32:28 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Mathieu Poirier <mathieu.poirier@linaro.org>
Subject: Re: [PATCH v3 0/4] virtio: Add vhost-user based RNG
Message-ID: <20210717163118-mutt-send-email-mst@kernel.org>
References: <20210710005929.1702431-1-mathieu.poirier@linaro.org>
MIME-Version: 1.0
In-Reply-To: <20210710005929.1702431-1-mathieu.poirier@linaro.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.7,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: alex.bennee@linaro.org, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, Jul 09, 2021 at 06:59:25PM -0600, Mathieu Poirier wrote:
> This sets adds a vhost-user based random number generator (RNG),
> similar to what has been done for i2c and virtiofsd, with the
> implementation following the patterns already set forth in those.
> 
> Applies cleanly to git://git.qemu.org/qemu.git master(05de778b5b8a).

There were several meson-related issues related to this patchset,
so I dropped it from the pull request for now.
Please work to resolve, and re-submit, preferably after the release.



> Thanks,
> Mathieu
> 
> Mathieu Poirier (4):
>   vhost-user-rng: Add vhost-user-rng implementation
>   vhost-user-rng-pci: Add vhost-user-rng-pci implementation
>   vhost-user-rng: backend: Add RNG vhost-user daemon implementation
>   docs: Add documentation for vhost based RNG implementation
> 
> ----
> New for V3:
> - Rebased to latest master branch.
> - Fixed documentation warning.
> - Updated call to vhost_dev_init() to match new signature.
> - Dropped MAINTAINERS patch since it was already applied. 
> 
>  docs/tools/index.rst                     |   1 +
>  docs/tools/vhost-user-rng.rst            |  74 +++++
>  hw/virtio/Kconfig                        |   5 +
>  hw/virtio/meson.build                    |   2 +
>  hw/virtio/vhost-user-rng-pci.c           |  79 +++++
>  hw/virtio/vhost-user-rng.c               | 294 +++++++++++++++++
>  include/hw/virtio/vhost-user-rng.h       |  33 ++
>  tools/meson.build                        |   8 +
>  tools/vhost-user-rng/50-qemu-rng.json.in |   5 +
>  tools/vhost-user-rng/main.c              | 403 +++++++++++++++++++++++
>  tools/vhost-user-rng/meson.build         |  10 +
>  11 files changed, 914 insertions(+)
>  create mode 100644 docs/tools/vhost-user-rng.rst
>  create mode 100644 hw/virtio/vhost-user-rng-pci.c
>  create mode 100644 hw/virtio/vhost-user-rng.c
>  create mode 100644 include/hw/virtio/vhost-user-rng.h
>  create mode 100644 tools/vhost-user-rng/50-qemu-rng.json.in
>  create mode 100644 tools/vhost-user-rng/main.c
>  create mode 100644 tools/vhost-user-rng/meson.build
> 
> -- 
> 2.25.1


