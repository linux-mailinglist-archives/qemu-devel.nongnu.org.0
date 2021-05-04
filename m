Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E17037278F
	for <lists+qemu-devel@lfdr.de>; Tue,  4 May 2021 10:49:51 +0200 (CEST)
Received: from localhost ([::1]:41854 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ldqkY-0002Ik-Hu
	for lists+qemu-devel@lfdr.de; Tue, 04 May 2021 04:49:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36306)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1ldqZi-0001Fy-5d
 for qemu-devel@nongnu.org; Tue, 04 May 2021 04:38:38 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:48244)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1ldqZe-00056C-6P
 for qemu-devel@nongnu.org; Tue, 04 May 2021 04:38:37 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1620117511;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Q16+Z0zwf8moJx8dG1Sr0x38B1On6CzUbEtN7YQ64io=;
 b=O1MAILz6rU+hyeBYPMOR4r7oJ40X3XxigHpnGSO8iCHslvN7NJSYDFZ1hykNsY8vey2+8R
 5J87OGW3LIde8W28YSv1/WIgXdiIbHeB9novpQbyerKHhNRgcOZLpIDT8cuMIglfCMxFq/
 YSz1E7pKn4MaV3oM6hwLFboI9dfmQuU=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-75-natFtK6wPzqa0AEnc3am6w-1; Tue, 04 May 2021 04:38:29 -0400
X-MC-Unique: natFtK6wPzqa0AEnc3am6w-1
Received: by mail-wr1-f71.google.com with SMTP id
 r12-20020adfc10c0000b029010d83323601so5428951wre.22
 for <qemu-devel@nongnu.org>; Tue, 04 May 2021 01:38:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=Q16+Z0zwf8moJx8dG1Sr0x38B1On6CzUbEtN7YQ64io=;
 b=lrmITjx0SXkm6rELn/eWEngwncQhNhiT1InDTRfQRT94PyHwgTrcunToYOmHxEzSMn
 6cyBfgQ+GiufH/hFh+R3Izbox0D+tlBQe0jcadj2cOwEpNQuQfQI6WenDDC/Nbkjctzg
 XWixuoT4GL0yakdvp+z5i/wDLmOmB/idCGI5niZUx2l5k6TPYhsH9MRQBphDelq5rNyq
 C3l1O0d/00X+4clrZ2QJi2BgDzgIo3DE/PFLS9/KU4oUKjyrtwZU9Md9BVfhvwIVwYG5
 8vioBHQqTUSApHb8Um8+PAh+wbMUUMDsk1dLzrAPutvga493dZSF2EgkNQuo4ja8GWe8
 aN+w==
X-Gm-Message-State: AOAM530nYblptfBqrOnfI8K1qbOfBE8UljPiIoEWdjIyuDs7RhghW5Hg
 PmA6JnCLNudMgGbigK1i9aB0Ly+5pXVigDH5RUg7cL7b7t5qLXB5z6azk7H5OIoAgClbjXcpGLW
 u1c4oP3s7ZW1DKIM=
X-Received: by 2002:adf:e40c:: with SMTP id g12mr29699122wrm.11.1620117508869; 
 Tue, 04 May 2021 01:38:28 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzmVoKGzU12vkOMJoZ90z6MpShGiAf9Hl5IsO9dAwilflt/pxFOVScXdo+y6Xhq+eFPlZKxdA==
X-Received: by 2002:adf:e40c:: with SMTP id g12mr29699108wrm.11.1620117508714; 
 Tue, 04 May 2021 01:38:28 -0700 (PDT)
Received: from redhat.com ([2a10:800a:cdef:0:114d:2085:61e4:7b41])
 by smtp.gmail.com with ESMTPSA id r7sm1829588wmq.18.2021.05.04.01.38.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 04 May 2021 01:38:28 -0700 (PDT)
Date: Tue, 4 May 2021 04:38:26 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Jason Wang <jasowang@redhat.com>
Subject: Re: [PATCH 0/2] vhost-vDPA: doorbell mapping support
Message-ID: <20210504043623-mutt-send-email-mst@kernel.org>
References: <20210415080444.44645-1-jasowang@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210415080444.44645-1-jasowang@redhat.com>
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
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.698,
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
Cc: elic@nvidia.com, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Apr 15, 2021 at 04:04:42PM +0800, Jason Wang wrote:
> Hi All:
> 
> This series tries to implement doorbell mapping support for
> vhost-vDPA. Tested with virtio-pci vDPA driver.

BTW I'd rather we used the kick/call terminology from the virtio
spec. doorbell terminology seems to be originating from e1000
which has a register named like this.

> Please review.
> 
> Jason Wang (2):
>   vhost-vdpa: skip ram device from the IOTLB mapping
>   vhost-vdpa: doorbell mapping support
> 
>  hw/virtio/vhost-vdpa.c         | 97 ++++++++++++++++++++++++++++++----
>  include/hw/virtio/vhost-vdpa.h |  7 +++
>  2 files changed, 94 insertions(+), 10 deletions(-)
> 
> -- 
> 2.25.1


