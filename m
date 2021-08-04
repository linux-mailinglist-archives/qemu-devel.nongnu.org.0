Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D35723E0752
	for <lists+qemu-devel@lfdr.de>; Wed,  4 Aug 2021 20:13:57 +0200 (CEST)
Received: from localhost ([::1]:47990 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mBLOp-0003vi-MS
	for lists+qemu-devel@lfdr.de; Wed, 04 Aug 2021 14:13:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52640)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1mBJRv-0003Kr-20
 for qemu-devel@nongnu.org; Wed, 04 Aug 2021 12:08:56 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:29069)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1mBJRp-00010l-4z
 for qemu-devel@nongnu.org; Wed, 04 Aug 2021 12:08:54 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1628093324;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=lnIrMH0EL7yQaBYc10AprCzxqenbq/EcZ2gw0TyO8R4=;
 b=ILlVkOZVXleLcCe/ujSTXQHCxG58Yq/NxiLFeVJqjzzdyTCwmOUrLFUd3wCbYsp+poU3+Y
 gOpmu+8R7am8Z00/PX53npbwu77f9L3xK6zZzmO1PHALv2Y6Py12DKlWLql3Kt3QczHxqe
 6X4qylrF/xYVTQp4qy9cw2pghV+Dvcs=
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com
 [209.85.160.199]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-569-HIak_w0VPOqOBS021KYsYA-1; Wed, 04 Aug 2021 12:08:42 -0400
X-MC-Unique: HIak_w0VPOqOBS021KYsYA-1
Received: by mail-qt1-f199.google.com with SMTP id
 o7-20020ac87c470000b029025f8084df09so1257391qtv.6
 for <qemu-devel@nongnu.org>; Wed, 04 Aug 2021 09:08:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=lnIrMH0EL7yQaBYc10AprCzxqenbq/EcZ2gw0TyO8R4=;
 b=FHt37l46qkdGvsUqAk1iutzjNPg13i49ISfv6clP2K6SCSrx0K/2lM+0RHEt3rNB+/
 6J1tTGM6XhI5Q7mdum/0B9DS2godeWPG/XEuX5EMpH+4iaJhO0wcYB5YuMTyVeUf4MDU
 bMELQM3kYfyw/f8CxTZ0vv/hGtIYPnnypErRGh1lmc26QMScn1tRP2MhtremxpcEI9Sx
 eGMl5Y6mYR5img4F0AUA2PM6J/Ghkz+VzcG3xgNuYdIaFqtunOL0CxuxN5X47LHgI2Sd
 9bklbdDaSGVP+ivgg8/9Cuoh3+9illMDIdpePmPmV+4UGolv/q2ANga5ebjPMbd+udol
 cr3A==
X-Gm-Message-State: AOAM533cHgo3PqE3L/6qyuRKf0WzOGOcw2SXDk8xMDds10qJzAlZ6YN+
 vV0EvLXIUnu+J4QgOvSNFjIa/0BpoGu19LiJkxtJ8u5Qp2l+TN3mygRTrRPogZLyrzTumMHYY6z
 UzzL1eqMusaQz59g=
X-Received: by 2002:a05:620a:f91:: with SMTP id
 b17mr144886qkn.107.1628093321920; 
 Wed, 04 Aug 2021 09:08:41 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzSbThOH9pw89AndcmL2CZdYVYA0P0I+4t317XVeC6bXVEyFEP1Lmz5eaNI6kMdfIVwT/zqeA==
X-Received: by 2002:a05:620a:f91:: with SMTP id
 b17mr144861qkn.107.1628093321727; 
 Wed, 04 Aug 2021 09:08:41 -0700 (PDT)
Received: from t490s (bras-base-toroon474qw-grc-92-76-70-75-133.dsl.bell.ca.
 [76.70.75.133])
 by smtp.gmail.com with ESMTPSA id a5sm1490357qkk.92.2021.08.04.09.08.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 04 Aug 2021 09:08:40 -0700 (PDT)
Date: Wed, 4 Aug 2021 12:08:39 -0400
From: Peter Xu <peterx@redhat.com>
To: Jason Wang <jasowang@redhat.com>
Subject: Re: [PATCH 0/3] Disable vhost device IOTLB is IOMMU is not enabled
Message-ID: <YQq7h0OWlmQ+mX8z@t490s>
References: <20210804034803.1644-1-jasowang@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210804034803.1644-1-jasowang@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=peterx@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=peterx@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.699,
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
Cc: mst@redhat.com, Wei.Huang2@amd.com, qemu-devel@nongnu.org,
 dgilbert@redhat.com, Sriyash.Caculo@amd.com, pbonzini@redhat.com,
 chao.gao@intel.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Aug 04, 2021 at 11:48:00AM +0800, Jason Wang wrote:
> Hi:
> 
> We currently try to enable device IOTLB when iommu_platform is
> set. This may lead unnecessary trasnsactions between qemu and vhost
> when vIOMMU is not used (which is the typical case for the encrypted
> VM).
> 
> So patch tries to use transport specific method to detect the enalbing
> of vIOMMU and enable the device IOTLB only if vIOMMU is enalbed.

Just to mention that there's also the ordering requirement for e.g. vfio-pci
and the iommu device so far because vfio_realize() depends on vIOMMU being
realized too, so specifying "-device vfio-pci" before "-device intel-iommu"
will stop working, I think (see the similar pci_device_iommu_address_space()
call in vfio_realize()).

Do you think vhost can do the same to assume vIOMMU must be specified before
vhost?  Then vhost can call pci_device_iommu_address_space() freely.  It'll be
more gentle for vhost even when it's used wrong: instead of not working at all
(vfio-pci), vhost runs slower.

Currently libvirt should be able to guarantee that ordering so libvirt users
shouldn't need to bother.  I think libvirt should also guarantee the vIOMMU
device to be created before all the rest devices, including virtio/vhost.  But
need to check.  If that's the case libvirt will naturally work for vhost too.

For the long term we may need to think about making device creation to be not
ordered by user cmdline input but still has a priority specified in the code
itself.  Migration has something like that (MigrationPriority).  I think we
just need something similar for general device realizations.  Since vhost
raised the same need, I think that priority should bump up too.

The other concern is right now vhost has vhost_dev.dma_as but now we're not
using it for vhost_dev_has_iommu().  It's just a bit confusing as when to use
which.

What do you think?

Thanks,

-- 
Peter Xu


