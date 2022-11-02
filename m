Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C70FF616375
	for <lists+qemu-devel@lfdr.de>; Wed,  2 Nov 2022 14:12:04 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1oqD6a-0005rh-JR; Wed, 02 Nov 2022 08:44:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1oqD6Y-0005rX-Ev
 for qemu-devel@nongnu.org; Wed, 02 Nov 2022 08:44:26 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1oqD6W-0002Ms-JP
 for qemu-devel@nongnu.org; Wed, 02 Nov 2022 08:44:26 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1667393064;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=gm8gg39TPHNCq9p91BzOqZKF/eGU/JJjB29Ad+Hht88=;
 b=af9+nV2AbBcdoSc0s8ZjhRg04r3F8Q0e5n5OoXGIOULnwjS6Hb2hvKJP5P8960yez3oH5k
 w2VHDwSFnLQl0Z+St88qHj4J5ApGNvBe4RMxvtAgiE+XWdWtju9OF5fGQBVdIpLBo77waE
 nI/Qij16gWdMenrFwllcewYl1EqNQqE=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-106-V5enDfGGNR-wmhwTj045tA-1; Wed, 02 Nov 2022 08:44:22 -0400
X-MC-Unique: V5enDfGGNR-wmhwTj045tA-1
Received: by mail-wm1-f70.google.com with SMTP id
 v191-20020a1cacc8000000b003bdf7b78dccso7890766wme.3
 for <qemu-devel@nongnu.org>; Wed, 02 Nov 2022 05:44:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=gm8gg39TPHNCq9p91BzOqZKF/eGU/JJjB29Ad+Hht88=;
 b=D2T5YsFWMsG9c38Dq/CzJRtIXDrkhJVkOQtpGAdUkU0JTJx/MCsqiC9IiS3uJQtiqz
 +ufmfFKqVYEEkvjRsv+RWRxdZqco6EPQDxf+kLACwsGR8rXsE7IRef46IOy+7dBjK0eS
 i122P4msNCpQG8zyFkUSRoaVa5HUDbdznNDyCPgGg+qN5VEKC5xAezcXrj/VV24BLejo
 4muHLnvOIX/lRnFMw8/laWxfUjrO9uDiOWR1vRbaixu4T8qMdLfqLN/hc3L224bL4tPT
 h+jBgk9tgF6K010Z/xFl+l+ALF4AFmLxZ13khYEThrkANIFRKYLgLgFOV9Ut0Yy+o/eA
 PL1w==
X-Gm-Message-State: ACrzQf1ryHdPEXlMJ7GAFFTPk0R9T0qMn3r7vhgciqDFeut1mulueaV+
 NOLEyay0GHIeg9q+yix5P3aEceR58KFy+4IngmBbVOLCTlnkpepg6LVR7fpyoMxf8EqkETBBCj0
 aZDojLJKGhBLAm70=
X-Received: by 2002:a05:600c:4f15:b0:3cf:84ea:307d with SMTP id
 l21-20020a05600c4f1500b003cf84ea307dmr2518304wmq.200.1667393061775; 
 Wed, 02 Nov 2022 05:44:21 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM7vVsOZAB7MXN3ai0gbD2iDV1Oi4yan5ObV8iZi2MePFKvRv/URTnvlIwk7sQHSDip/h5X8mg==
X-Received: by 2002:a05:600c:4f15:b0:3cf:84ea:307d with SMTP id
 l21-20020a05600c4f1500b003cf84ea307dmr2518288wmq.200.1667393061599; 
 Wed, 02 Nov 2022 05:44:21 -0700 (PDT)
Received: from redhat.com ([2.52.15.189]) by smtp.gmail.com with ESMTPSA id
 h5-20020adff185000000b00236863c02f5sm12802644wro.96.2022.11.02.05.44.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 02 Nov 2022 05:44:21 -0700 (PDT)
Date: Wed, 2 Nov 2022 08:44:18 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Alex Williamson <alex.williamson@redhat.com>
Cc: Cindy Lu <lulu@redhat.com>, jasowang@redhat.com, pbonzini@redhat.com,
 peterx@redhat.com, david@redhat.com, f4bug@amsat.org,
 sgarzare@redhat.com, qemu-devel@nongnu.org
Subject: Re: [PATCH v10 0/2] vhost-vdpa: add support for vIOMMU
Message-ID: <20221102084341-mutt-send-email-mst@kernel.org>
References: <20221031125702.1445168-1-lulu@redhat.com>
 <20221102065323-mutt-send-email-mst@kernel.org>
 <20221102063911.416a953f.alex.williamson@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221102063911.416a953f.alex.williamson@redhat.com>
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mst@redhat.com;
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

On Wed, Nov 02, 2022 at 06:39:11AM -0600, Alex Williamson wrote:
> On Wed, 2 Nov 2022 06:54:28 -0400
> "Michael S. Tsirkin" <mst@redhat.com> wrote:
> 
> > On Mon, Oct 31, 2022 at 08:57:00PM +0800, Cindy Lu wrote:
> > > changes in V3
> > > 1. Move function vfio_get_xlat_addr to memory.c
> > > 2. Use the existing memory listener, while the MR is
> > > iommu MR then call the function iommu_region_add/
> > > iommu_region_del
> > > 
> > > changes in V4
> > > 1.make the comments in vfio_get_xlat_addr more general
> > > 
> > > changes in V5
> > > 1. Address the comments in the last version
> > > 2. Add a new arg in the function vfio_get_xlat_addr, which shows whether
> > > the memory is backed by a discard manager. So the device can have its
> > > own warning.
> > > 
> > > changes in V6
> > > move the error_report for the unpopulated discard back to
> > > memeory_get_xlat_addr
> > > 
> > > changes in V7
> > > organize the error massage to avoid the duplicate information
> > > 
> > > changes in V8
> > > Organize the code follow the comments in the last version
> > > 
> > > changes in V9
> > > Organize the code follow the comments
> > > 
> > > changes in V10
> > > Address the comments  
> > 
> > This missed this release unfortunately, as vfio changes didn't get
> > Alex's ack yet. Tagged but pls ping me after the freeze is lifted
> > to make sure I don't forget. Thanks!
> 
> I ack'd v9[1], which appears identical for the vfio related pieces.
> Thanks,
> 
> Alex
> 
> [1]https://lore.kernel.org/all/20221030212011.45c3d924.alex.williamson@redhat.com/


Oh sorry I was confused. It was actually me who had some comments.
And I'm not sure they have been addressed yet ;)
Will reply.


