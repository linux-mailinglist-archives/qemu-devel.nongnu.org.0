Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5EAAB37683A
	for <lists+qemu-devel@lfdr.de>; Fri,  7 May 2021 17:43:59 +0200 (CEST)
Received: from localhost ([::1]:49358 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lf2dy-0000rZ-GL
	for lists+qemu-devel@lfdr.de; Fri, 07 May 2021 11:43:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52282)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.williamson@redhat.com>)
 id 1lf2cI-0000LF-Fs
 for qemu-devel@nongnu.org; Fri, 07 May 2021 11:42:14 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:46918)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.williamson@redhat.com>)
 id 1lf2cD-0003h9-Po
 for qemu-devel@nongnu.org; Fri, 07 May 2021 11:42:14 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1620402129;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=LFljFZbrZ+d/UWCXFCOrc8jwPFQoRBUcCXfBtEcz6Sk=;
 b=ADGvwVhZIQnGJrYFNf9iowmbgCNIaAqWxkUqxXWbqw9uHtLqnSNDYsDQ+ll9DyY1wAUDm8
 o5hXrxmLszPwmuKyqkJmwUdEjwwB74pscY+65y9EYimNwuZtU8XKtLxFcdXrvFSFjAoOiS
 GwrsjHXHDKbEf8/7eV5ovuAsiJwPH0o=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-324-pxmLVF9YNqOmPvTnSuLXOg-1; Fri, 07 May 2021 11:42:07 -0400
X-MC-Unique: pxmLVF9YNqOmPvTnSuLXOg-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 4272E10066E6;
 Fri,  7 May 2021 15:42:06 +0000 (UTC)
Received: from redhat.com (ovpn-113-225.phx2.redhat.com [10.3.113.225])
 by smtp.corp.redhat.com (Postfix) with ESMTP id E5BFF5D9CC;
 Fri,  7 May 2021 15:42:05 +0000 (UTC)
Date: Fri, 7 May 2021 09:42:05 -0600
From: Alex Williamson <alex.williamson@redhat.com>
To: Thanos Makatos <thanos.makatos@nutanix.com>
Subject: Re: question regarding QEMU adding overlapping memory regions to VFIO
Message-ID: <20210507094205.43adae95@redhat.com>
In-Reply-To: <MW2PR02MB3723B94416375A06F6F69BB08B579@MW2PR02MB3723.namprd02.prod.outlook.com>
References: <MW2PR02MB3723B94416375A06F6F69BB08B579@MW2PR02MB3723.namprd02.prod.outlook.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=alex.williamson@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124;
 envelope-from=alex.williamson@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.699,
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
Cc: "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 Raphael Norwitz <raphael.norwitz@nutanix.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, 7 May 2021 13:51:52 +0000
Thanos Makatos <thanos.makatos@nutanix.com> wrote:

> I've noticed that QEMU adds overlapping memory regions to VFIO, e.g.:
> 
> vfio_listener_region_add_ram region_add [ram] 0xc0000 - 0xc0fff [0x7f6702c00000]
> vfio_listener_region_del region_del 0xc4000 - 0xdffff
> vfio_listener_region_add_ram region_add [ram] 0xc1000 - 0xc3fff [0x7f66406c1000]
> vfio_listener_region_del region_del 0xe0000 - 0xfffff
> vfio_listener_region_add_ram region_add [ram] 0xc4000 - 0xdffff [0x7f6702c04000]
> vfio_listener_region_add_ram region_add [ram] 0xc0000 - 0xc0fff [0x7f66406c0000]
> 2021-05-05T09:38:16.158864Z qemu-system-x86_64: vfio_dma_map(0x557b8fd281b0, 0xc0000, 0x1000, 0x7f66406c0000) = -22 (Resource temporarily unavailable)
> 
> Region 0xc0000 - 0xc0fff is added first and then region 0xc0000 -
> 0xc0fff is added again? Is this legitimate? What is the implication
> of this? Is the previous region replaced by the more recent one?

This might be where the hack we have in hw/vfio/common.c:vfio_dma_map()
comes from:

    /*
     * Try the mapping, if it fails with EBUSY, unmap the region and try
     * again.  This shouldn't be necessary, but we sometimes see it in
     * the VGA ROM space.
     */
    if (ioctl(container->fd, VFIO_IOMMU_MAP_DMA, &map) == 0 ||
        (errno == EBUSY && vfio_dma_unmap(container, iova, size, NULL) == 0 &&
         ioctl(container->fd, VFIO_IOMMU_MAP_DMA, &map) == 0)) {
        return 0;
    }

Clearly that's only triggered with -EBUSY and you're getting -EINVAL,
did we unintentionally change the errno for this?  What's the host
kernel version?

It's my expectation that this really shouldn't happen, the above is a
lazy workaround, but a listener being told to map two different things
at the same address range without an unmap in between seems like it
should violate the MemoryListener protocol.  Thanks,

Alex


