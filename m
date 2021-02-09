Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DC4E3157AF
	for <lists+qemu-devel@lfdr.de>; Tue,  9 Feb 2021 21:26:55 +0100 (CET)
Received: from localhost ([::1]:46570 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l9Zb4-00061D-3E
	for lists+qemu-devel@lfdr.de; Tue, 09 Feb 2021 15:26:54 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:33394)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1l9Yyb-0006LR-Py
 for qemu-devel@nongnu.org; Tue, 09 Feb 2021 14:47:09 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:43573)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1l9YyY-0000Jc-MY
 for qemu-devel@nongnu.org; Tue, 09 Feb 2021 14:47:09 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1612900024;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=kmuGJWTTn51jD+ZLduwgQrnva6H6TDX1ZuYHq1PmDSc=;
 b=A9pGFWJtFVoQ+BAHGy+wBVKl6Qhwzzz644fztgnfVQLQ55snksvS08onkWcFEy7+CoDPut
 KTmtx6gWLfDVQ/4hNHGDZcWjxZPQbInAR0HUqZtBUZ5b6vVGZs8CICzggOU1OCVbidWW3N
 MAgApbTtXLl7UVJtBjXlj8p/VnDvdK4=
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-274-zPFWOhp_PN6AciHdCBp-vg-1; Tue, 09 Feb 2021 14:47:01 -0500
X-MC-Unique: zPFWOhp_PN6AciHdCBp-vg-1
Received: by mail-qk1-f200.google.com with SMTP id r15so7386670qke.5
 for <qemu-devel@nongnu.org>; Tue, 09 Feb 2021 11:47:01 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=kmuGJWTTn51jD+ZLduwgQrnva6H6TDX1ZuYHq1PmDSc=;
 b=ofWUh/CR+LIRFPeeeFXN+xUDFnwE1FstQQGYdvFmrMxRHv7j0H4Z2Q1CQhi8m5Hg9l
 Oljsuw7AYbykVIxdThcL2gvJmJ1Can9H7tp1G6EXQkm4pEUWvOwiPMyOZ8+qY+gFzRhp
 xsGjuE8BLe0s0quxwWn5gL1IgiO2LJ30kv8vVg6x6irYGsy/ZdA5x7VkHw/FHmEmcYSj
 u/8i/v8Aoi3Nk43OloX0QLQzQ920mfOdam19rqieQuNO56cyTaUgNRJJn6evKkrHngGr
 UPkD2RYaEdyM2nht7VJa9lY0y5wYdAffx6tk6Bw63OtQE3IvTsXh/7kIG+ChC0GgV1yl
 l/+w==
X-Gm-Message-State: AOAM531EgZpZ9lJGn5Tk1X6liRsmabbhJ/U1H6fFhrz0xXt5TgQs06T4
 +bMSNLBZOGrw5r9boVWAVXkvEhdd4hazhKTuLJTUIsnKH8ocxOZe9SsEnrVsPfwLfGMSXkFVHdl
 7vOltLUGGFIi5BW0=
X-Received: by 2002:a37:41d2:: with SMTP id o201mr6049711qka.204.1612900021034; 
 Tue, 09 Feb 2021 11:47:01 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwgjZvmTt1QrZUbtFy0fRSNB1jLl4a2ACUa9s3D/HG9jEV3BJtt97+UPWvRmqmv1dI/yRj3XA==
X-Received: by 2002:a37:41d2:: with SMTP id o201mr6049693qka.204.1612900020734; 
 Tue, 09 Feb 2021 11:47:00 -0800 (PST)
Received: from xz-x1
 (bras-vprn-toroon474qw-lp130-20-174-93-89-182.dsl.bell.ca. [174.93.89.182])
 by smtp.gmail.com with ESMTPSA id y26sm18654750qth.53.2021.02.09.11.46.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 09 Feb 2021 11:47:00 -0800 (PST)
Date: Tue, 9 Feb 2021 14:46:58 -0500
From: Peter Xu <peterx@redhat.com>
To: Auger Eric <eric.auger@redhat.com>
Subject: Re: [PATCH] vhost: Unbreak SMMU and virtio-iommu on dev-iotlb support
Message-ID: <20210209194658.GA103365@xz-x1>
References: <20210204191228.187550-1-peterx@redhat.com>
 <2382a93d-41c1-24fd-144f-87ee18171bc9@redhat.com>
 <213acf9a-d1c0-3a1d-4846-877d90fadc03@redhat.com>
 <20210205153107.GX6468@xz-x1>
 <a28ba439-758e-4b5b-86d9-5008b220b106@redhat.com>
 <20210208183721.GB68242@xz-x1>
 <a5e3c11e-fa31-3013-1e7e-3b2d6193bd7b@redhat.com>
 <6ddf3db5-552a-4984-5f52-836178e5f486@redhat.com>
MIME-Version: 1.0
In-Reply-To: <6ddf3db5-552a-4984-5f52-836178e5f486@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=peterx@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Received-SPF: pass client-ip=63.128.21.124; envelope-from=peterx@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -33
X-Spam_score: -3.4
X-Spam_bar: ---
X-Spam_report: (-3.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.57,
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
Cc: "Michael S . Tsirkin" <mst@redhat.com>,
 Jean-Philippe Brucker <Jean-Philippe.Brucker@arm.com>,
 Jason Wang <jasowang@redhat.com>, qemu-devel@nongnu.org,
 Eugenio Perez Martin <eperezma@redhat.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Feb 09, 2021 at 06:15:11PM +0100, Auger Eric wrote:
> I just noted that the vhost fix now breaks virtio-iommu/vfio integration
> because VFIO registers IOMMU_NOTIFIER_ALL which includes the DEV-IOTLB
> that is now rejected by virtio-iommu virtio_iommu_notify_flag_changed().
> Is it safe to replace IOMMU_NOTIFIER_ALL by IOMMU_NOTIFIER_IOTLB_EVENTS
> in vfio_listener_region_add (hw/vfio/common.c) or shall we also do the
> 2-step registration? After your confirmation, I can send the patch.

Thanks for noticing this, Eric.  Indeed there're a bunch of things that we'd
overlooked.

I think IOMMU_NOTIFIER_IOTLB_EVENTS should suffice with vfio.

If you post that patch, would you mind post a similar fix for PPC too which
will need the two-step thing?  Assuming they can be in the same series to fix
the breakage of that same patch.

CC Alex and David Gibson.

Thanks,

-- 
Peter Xu


