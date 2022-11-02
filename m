Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 52A3C61635F
	for <lists+qemu-devel@lfdr.de>; Wed,  2 Nov 2022 14:07:36 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1oqD1j-00058f-60; Wed, 02 Nov 2022 08:39:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.williamson@redhat.com>)
 id 1oqD1e-00058S-JM
 for qemu-devel@nongnu.org; Wed, 02 Nov 2022 08:39:22 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.williamson@redhat.com>)
 id 1oqD1Z-0008LB-W9
 for qemu-devel@nongnu.org; Wed, 02 Nov 2022 08:39:22 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1667392755;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=UCk/E3xWKqsbzhqfFTwmJsAKwTj7w4anm6FKXuJFojE=;
 b=ftQlN0iaXFpW1asSr325QOOweDvsUPOb2bhoOcvYFYdnnklVkiamY2+/2AhwrFSdJr+Tup
 kmgAPmNoQlD3Q8GwutXMBkqYBCNARertWT+wCO9L7L1A0NYan2OQnmmJ3m+ghewOpx96kV
 bzQvpRw3Zd2I9Z64qcUZtFdsfAhnR50=
Received: from mail-io1-f71.google.com (mail-io1-f71.google.com
 [209.85.166.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-98-UwpeVuadPS6DPrHvvBuLkA-1; Wed, 02 Nov 2022 08:39:14 -0400
X-MC-Unique: UwpeVuadPS6DPrHvvBuLkA-1
Received: by mail-io1-f71.google.com with SMTP id
 14-20020a05660220ce00b006c1bdc8ef72so14257459ioz.23
 for <qemu-devel@nongnu.org>; Wed, 02 Nov 2022 05:39:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:organization:references
 :in-reply-to:message-id:subject:cc:to:from:date:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=UCk/E3xWKqsbzhqfFTwmJsAKwTj7w4anm6FKXuJFojE=;
 b=ucpY1w7Xr6kZAKJc/wW+u2qE4NQcHNxTCOwId7G2hJ5mNI8fZyd4x/EjhB+LatwDDI
 mD0urRHQ+suiq+Qa6oMqFbpjzLIvzaHBQHvpTEitzWfu+dj3wJ7t6YVh+XPyhMKqBo1T
 wqXg0g02C4NDP8PiXZaXMA1vZZx4MMNK7uanh/xiTE/d/NyBN5TowkdjY609U8BRmY70
 o2M0U/eRF7MFCOvaeNkCU3AmcvG3AuTz2BTclTcP9ZIrJ/49nBgM0eFTqMXmiS0u+Uof
 9lRSEo9rgt+16SLYLqiom04PBZQ7HC60LW3D9BhonHYBX0Ql9/n+nGAf90wha8V3a4e2
 TYtg==
X-Gm-Message-State: ACrzQf1WKUhU1ZpzdkW9804DJPIgTvvGxbNgOjpKzEObE8mJKjnqx8qb
 W8tcrsjI3op7P9NBsoaC94FT8AYNpj155/O/1FoSlafLFtZramNg/PFKgAZD7nNp8Q2OCyyaZ/I
 +mTP67Ry8tWLWqyI=
X-Received: by 2002:a05:6638:eca:b0:375:5d65:ce6d with SMTP id
 q10-20020a0566380eca00b003755d65ce6dmr11551992jas.63.1667392753895; 
 Wed, 02 Nov 2022 05:39:13 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM7M2cY/4+oK2KAfUKrHZs3RDVLmdjEj9L9SCWrDmhXoX+PUckTuc8AtOsdxNSt7LAYSnNZz3Q==
X-Received: by 2002:a05:6638:eca:b0:375:5d65:ce6d with SMTP id
 q10-20020a0566380eca00b003755d65ce6dmr11551977jas.63.1667392753646; 
 Wed, 02 Nov 2022 05:39:13 -0700 (PDT)
Received: from redhat.com ([38.15.36.239]) by smtp.gmail.com with ESMTPSA id
 d6-20020a926806000000b002f9537986f3sm4498483ilc.24.2022.11.02.05.39.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 02 Nov 2022 05:39:12 -0700 (PDT)
Date: Wed, 2 Nov 2022 06:39:11 -0600
From: Alex Williamson <alex.williamson@redhat.com>
To: "Michael S. Tsirkin" <mst@redhat.com>
Cc: Cindy Lu <lulu@redhat.com>, jasowang@redhat.com, pbonzini@redhat.com,
 peterx@redhat.com, david@redhat.com, f4bug@amsat.org, sgarzare@redhat.com,
 qemu-devel@nongnu.org
Subject: Re: [PATCH v10 0/2] vhost-vdpa: add support for vIOMMU
Message-ID: <20221102063911.416a953f.alex.williamson@redhat.com>
In-Reply-To: <20221102065323-mutt-send-email-mst@kernel.org>
References: <20221031125702.1445168-1-lulu@redhat.com>
 <20221102065323-mutt-send-email-mst@kernel.org>
Organization: Red Hat
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124;
 envelope-from=alex.williamson@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.048,
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

On Wed, 2 Nov 2022 06:54:28 -0400
"Michael S. Tsirkin" <mst@redhat.com> wrote:

> On Mon, Oct 31, 2022 at 08:57:00PM +0800, Cindy Lu wrote:
> > changes in V3
> > 1. Move function vfio_get_xlat_addr to memory.c
> > 2. Use the existing memory listener, while the MR is
> > iommu MR then call the function iommu_region_add/
> > iommu_region_del
> > 
> > changes in V4
> > 1.make the comments in vfio_get_xlat_addr more general
> > 
> > changes in V5
> > 1. Address the comments in the last version
> > 2. Add a new arg in the function vfio_get_xlat_addr, which shows whether
> > the memory is backed by a discard manager. So the device can have its
> > own warning.
> > 
> > changes in V6
> > move the error_report for the unpopulated discard back to
> > memeory_get_xlat_addr
> > 
> > changes in V7
> > organize the error massage to avoid the duplicate information
> > 
> > changes in V8
> > Organize the code follow the comments in the last version
> > 
> > changes in V9
> > Organize the code follow the comments
> > 
> > changes in V10
> > Address the comments  
> 
> This missed this release unfortunately, as vfio changes didn't get
> Alex's ack yet. Tagged but pls ping me after the freeze is lifted
> to make sure I don't forget. Thanks!

I ack'd v9[1], which appears identical for the vfio related pieces.
Thanks,

Alex

[1]https://lore.kernel.org/all/20221030212011.45c3d924.alex.williamson@redhat.com/


