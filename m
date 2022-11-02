Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5684161614B
	for <lists+qemu-devel@lfdr.de>; Wed,  2 Nov 2022 11:56:27 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1oqBOK-0003DT-EC; Wed, 02 Nov 2022 06:54:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1oqBOI-0003D2-FT
 for qemu-devel@nongnu.org; Wed, 02 Nov 2022 06:54:38 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1oqBOG-0006xR-CV
 for qemu-devel@nongnu.org; Wed, 02 Nov 2022 06:54:38 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1667386474;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=ojkQNxLw36J2iScm6a3qbX99WVeBgI7phcpXGJqqLlo=;
 b=gi3gFZr+OuFE7UIyHXXu3t0YbhnBQ/DfrSU2McRrsbhVDqTAXcCx4J3W5ZyW2Pcq0RtWlm
 yEn8NV1aRttCJVSiCUrxRKo8Hbqu2awnq3j7CT90Ko+p7B8ov9Ad4r0q8gr5o2+EN7X3Un
 koY/ldK47xf2+ZPSq25pKIXUzuPm6FE=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-67-4Nh3trKuMISXsf23xJivQA-1; Wed, 02 Nov 2022 06:54:33 -0400
X-MC-Unique: 4Nh3trKuMISXsf23xJivQA-1
Received: by mail-wm1-f71.google.com with SMTP id
 r187-20020a1c44c4000000b003c41e9ae97dso923675wma.6
 for <qemu-devel@nongnu.org>; Wed, 02 Nov 2022 03:54:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ojkQNxLw36J2iScm6a3qbX99WVeBgI7phcpXGJqqLlo=;
 b=k7PrgJlJzhCzZ+eFvUhrSkn0mCP7UubAgSNk7ta5pglYxahk2fCuAINgBE525Azk8O
 R+MNTMwSdQB0mpnFu68WgN3D5AKn+UQeaCOilfA5LW2CHEQji2JQ6VWiPzhmR0bKd7nV
 xh3WE/thxkQLNrJNfaKPn7e9D8R+nmgqw6jh33Sblfsp/20CqEY9tGpuL9PSo+pf/Qmt
 JGvQFKNlyfXZPThZPZmgrb4lTjokmTNYybbyLJOcjOGt2a/He4Tv8rzhQ37NWqaSw/QA
 MGYhgoevwtGTLpSrU4hu2yMU9J1k7TGDS+HoqHyYreheWaAZfK7c9iB9tq2UpC1V1hh3
 dKzA==
X-Gm-Message-State: ACrzQf1geDOSgdlcI9KgqvYwVuYymKaS3r1y6/KdMTfO3d9ZbpIPMDPy
 6zPxSCqUM52VfHGGrGR9ce5E0t1ltFurNRpjviUjo30i5AWnLEWHEpNreEDLsDwu8JtO17+jqAc
 dVcba62d5a3E+M00=
X-Received: by 2002:a05:600c:6023:b0:3cf:7dc1:e08e with SMTP id
 az35-20020a05600c602300b003cf7dc1e08emr5716921wmb.154.1667386472611; 
 Wed, 02 Nov 2022 03:54:32 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM6RjymUx5O4mcDhldF1lSWbz4a1WbZszxbeB7T50jlp3JJs/dmAUTAPXLi1IC2xtdfr2WplgA==
X-Received: by 2002:a05:600c:6023:b0:3cf:7dc1:e08e with SMTP id
 az35-20020a05600c602300b003cf7dc1e08emr5716897wmb.154.1667386472320; 
 Wed, 02 Nov 2022 03:54:32 -0700 (PDT)
Received: from redhat.com ([2.52.15.189]) by smtp.gmail.com with ESMTPSA id
 fc19-20020a05600c525300b003cf57329221sm2235768wmb.14.2022.11.02.03.54.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 02 Nov 2022 03:54:31 -0700 (PDT)
Date: Wed, 2 Nov 2022 06:54:28 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Cindy Lu <lulu@redhat.com>
Cc: alex.williamson@redhat.com, jasowang@redhat.com, pbonzini@redhat.com,
 peterx@redhat.com, david@redhat.com, f4bug@amsat.org,
 sgarzare@redhat.com, qemu-devel@nongnu.org
Subject: Re: [PATCH v10 0/2] vhost-vdpa: add support for vIOMMU
Message-ID: <20221102065323-mutt-send-email-mst@kernel.org>
References: <20221031125702.1445168-1-lulu@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221031125702.1445168-1-lulu@redhat.com>
Received-SPF: pass client-ip=170.10.129.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -37
X-Spam_score: -3.8
X-Spam_bar: ---
X-Spam_report: (-3.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.048,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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

On Mon, Oct 31, 2022 at 08:57:00PM +0800, Cindy Lu wrote:
> changes in V3
> 1. Move function vfio_get_xlat_addr to memory.c
> 2. Use the existing memory listener, while the MR is
> iommu MR then call the function iommu_region_add/
> iommu_region_del
> 
> changes in V4
> 1.make the comments in vfio_get_xlat_addr more general
> 
> changes in V5
> 1. Address the comments in the last version
> 2. Add a new arg in the function vfio_get_xlat_addr, which shows whether
> the memory is backed by a discard manager. So the device can have its
> own warning.
> 
> changes in V6
> move the error_report for the unpopulated discard back to
> memeory_get_xlat_addr
> 
> changes in V7
> organize the error massage to avoid the duplicate information
> 
> changes in V8
> Organize the code follow the comments in the last version
> 
> changes in V9
> Organize the code follow the comments
> 
> changes in V10
> Address the comments

This missed this release unfortunately, as vfio changes didn't get
Alex's ack yet. Tagged but pls ping me after the freeze is lifted
to make sure I don't forget. Thanks!


> Cindy Lu (2):
>   vfio: move implement of vfio_get_xlat_addr() to memory.c
>   vhost-vdpa: add support for vIOMMU
> 
>  hw/vfio/common.c               |  66 ++----------------
>  hw/virtio/vhost-vdpa.c         | 122 ++++++++++++++++++++++++++++++---
>  include/exec/memory.h          |   4 ++
>  include/hw/virtio/vhost-vdpa.h |  10 +++
>  softmmu/memory.c               |  72 +++++++++++++++++++
>  5 files changed, 202 insertions(+), 72 deletions(-)
> 
> -- 
> 2.34.3


