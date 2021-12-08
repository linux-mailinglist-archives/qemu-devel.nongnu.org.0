Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A50246DBAA
	for <lists+qemu-devel@lfdr.de>; Wed,  8 Dec 2021 19:57:49 +0100 (CET)
Received: from localhost ([::1]:40028 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mv28S-0001oP-GH
	for lists+qemu-devel@lfdr.de; Wed, 08 Dec 2021 13:57:48 -0500
Received: from eggs.gnu.org ([209.51.188.92]:57282)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1mv27D-00014j-L7
 for qemu-devel@nongnu.org; Wed, 08 Dec 2021 13:56:31 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:26250)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1mv27B-0001T8-0m
 for qemu-devel@nongnu.org; Wed, 08 Dec 2021 13:56:30 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1638989787;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Vr98I6dKovcNS/YQ4umOjpLpwa3BSEOjUS5qtG0TZvI=;
 b=QB8vSwNv0KMFejoTE7+uV8CociQYI119piu/qiATP0DNEXqDcz/j0fbH4GQuG7JxNPwmyM
 xgSwy+UTQrNUbBZkQXlirBDG6p47LlO/WKoheKf+WiiXKGi/+DGtVZKNQoHq+1BLIuxS8T
 eFXyCFEF02l0/6aghSkAuj3Gb0OTjAs=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-53-wSSEC9-hNzWSZurkyg3bSw-1; Wed, 08 Dec 2021 13:56:26 -0500
X-MC-Unique: wSSEC9-hNzWSZurkyg3bSw-1
Received: by mail-wm1-f70.google.com with SMTP id
 m14-20020a05600c3b0e00b0033308dcc933so1689955wms.7
 for <qemu-devel@nongnu.org>; Wed, 08 Dec 2021 10:56:25 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=Vr98I6dKovcNS/YQ4umOjpLpwa3BSEOjUS5qtG0TZvI=;
 b=eIGlkxoXtadg6wHX657k+Sbi/v5Xp82p310jVggdTnKt0V5S/4BuwVEZnvXGz+Kt/0
 k6Hxb/UiyolHpLdpiawB99ItjdQ9YrNW03Bawh9uY7MHPNw7N6rOgV62+EY7padC35ue
 RJw9YoMpyRHmB85Iccy11MXeOY+r1FKL66ROZ2aRcGKbd5ER5UwK4wEhFQtsyh5jYg2E
 QNTFBIqvTToM0SJQXvbF2sbdM6/FPh1pP9jZnJLQIFXbkxY7tiq3n+GRpY5uXcM80uC2
 8J18St7oRk/CFcWo3yEA4EJqZWqsEHcjyJ8usykE3Jl+RLx0jkCXlfFvsS0/Wc3wDaUp
 nHzg==
X-Gm-Message-State: AOAM533HkV9xLycfeWJpaOG0BVFoTXfx8gw38phkhlhBBPgyqlXf8oVP
 OzIqC/opDj4zTAyj9m/Wnt7hdfMdAuEuFPFu+DYVXZnFO2UWykIWx380XmuGKWyFNbNtADRIveU
 zQ6m5Ai22s8iAjic=
X-Received: by 2002:a7b:c934:: with SMTP id h20mr577725wml.94.1638989784963;
 Wed, 08 Dec 2021 10:56:24 -0800 (PST)
X-Google-Smtp-Source: ABdhPJy9rQtlNGSsdZ2VksrCZMPDHACPLZA2pLupoX2AzoddN6GZDWiooSwvgl1XgiCCzC9xWx1eLw==
X-Received: by 2002:a7b:c934:: with SMTP id h20mr577697wml.94.1638989784761;
 Wed, 08 Dec 2021 10:56:24 -0800 (PST)
Received: from redhat.com ([2.55.18.120])
 by smtp.gmail.com with ESMTPSA id p8sm3399764wrx.25.2021.12.08.10.56.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 08 Dec 2021 10:56:23 -0800 (PST)
Date: Wed, 8 Dec 2021 13:56:19 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Halil Pasic <pasic@linux.ibm.com>
Subject: Re: [RFC PATCH v2 0/5] virtio: early detect 'modern' virtio
Message-ID: <20211208135456-mutt-send-email-mst@kernel.org>
References: <20211112145749.618157-1-pasic@linux.ibm.com>
MIME-Version: 1.0
In-Reply-To: <20211112145749.618157-1-pasic@linux.ibm.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.129.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -33
X-Spam_score: -3.4
X-Spam_bar: ---
X-Spam_report: (-3.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.619,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Thomas Huth <thuth@redhat.com>, David Hildenbrand <david@redhat.com>,
 Cornelia Huck <cohuck@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org,
 Christian Borntraeger <borntraeger@de.ibm.com>, qemu-s390x@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, Nov 12, 2021 at 03:57:44PM +0100, Halil Pasic wrote:
> This is an early RFC for a transport specific early detecton of
> modern virtio, which is most relevant for transitional devices on big
> endian platforms, when drivers access the config space before
> FEATURES_OK is set.
> 
> The most important part that is missing here is fixing all the problems
> that arise in the situation described in the previous paragraph, when
> the config is managed by a vhost device (and thus outside QEMU. This
> series tackles this problem only for virtio_net+vhost as an example. If
> this approach is deemed good, we need to do something very similar for
> every single affected device.
> 
> This series was only lightly tested. The vhost stuff is entirely
> untested, unfortunately I don't have a working setup where this
> handling would be needed (because the config space is handled in the
> device). DPDK is not supported on s390x so at the moment I can't test
> DPDK based setups. 

So this looks sane to me. Cornelia requested some name tweaks and we
need to add vhost-user things and more devices, but otherwise we are
good.

> v1 -> v2:
> 
> * add callback
> * tweak feature manipulation
> * add generic handling for vhost that needs to be called by devices
> * add handling for virtio
> 
> Halil Pasic (5):
>   virtio: introduce virtio_force_modern()
>   virtio-ccw: use virtio_force_modern()
>   virtio-pci: use virtio_force_modern()
>   vhost: push features to backend on force_modern
>   virtio-net: handle force_modern for vhost
> 
>  hw/net/virtio-net.c        | 20 ++++++++++++++++++++
>  hw/s390x/virtio-ccw.c      |  3 +++
>  hw/virtio/vhost.c          | 17 +++++++++++++++++
>  hw/virtio/virtio-pci.c     |  1 +
>  hw/virtio/virtio.c         | 13 +++++++++++++
>  include/hw/virtio/vhost.h  |  2 ++
>  include/hw/virtio/virtio.h |  2 ++
>  7 files changed, 58 insertions(+)
> 
> 
> base-commit: 2c3e83f92d93fbab071b8a96b8ab769b01902475
> -- 
> 2.25.1


