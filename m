Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E68363DAD7
	for <lists+qemu-devel@lfdr.de>; Wed, 30 Nov 2022 17:38:35 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p0Q6C-0006EI-6n; Wed, 30 Nov 2022 11:38:16 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1p0Q67-0006Bm-VF
 for qemu-devel@nongnu.org; Wed, 30 Nov 2022 11:38:11 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1p0Q66-0000gX-1W
 for qemu-devel@nongnu.org; Wed, 30 Nov 2022 11:38:11 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1669826285;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=hrR0CFSEeAWIPupyiwdz5I/YE0JUE/o31aqzs2IuacM=;
 b=D3zNMV9mw5uqDq3r91BGnoK0sCeGMk/kcZYwY8OyY9sF5lphrxqbsD2UVhHy/8gn3hIVYX
 yNLBT5FyNI+CmkGyeMiw0ReiTSFSZsfHQw6h8bUUTMl7Q1RaDwi4eJkLOcbmBqcC5rcBa8
 2109jxjLwiuII3abaCONcY1ASs3dVCs=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-361-H_DbUY09N3iF2b4IZQxbjQ-1; Wed, 30 Nov 2022 11:38:04 -0500
X-MC-Unique: H_DbUY09N3iF2b4IZQxbjQ-1
Received: by mail-wr1-f72.google.com with SMTP id
 o8-20020adfba08000000b00241e80f08e0so3743762wrg.12
 for <qemu-devel@nongnu.org>; Wed, 30 Nov 2022 08:38:03 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=hrR0CFSEeAWIPupyiwdz5I/YE0JUE/o31aqzs2IuacM=;
 b=sNln2Ef6hK81hnYobxn1oa9MDGedD9e8kJzUxQM3ElCaoUTZvG+g5KL93dhmz8XK+h
 TW8n1JBAqzIH6aJ27G9kj5/LY1pu/pvQQSz0pA9vrYtacyaIIg0F+69mR59ugYB6B6cB
 ymHm6UQRfnhXawmbL4uok66HZ+aMM/4QLh2f565pbSsQGE2taG4ZqYKICXfMtTRByc5x
 bjhBo83EFSRgIgs6wiVz43iZZXh0ixvCnfenka1HRFkXeWxh02NNMjOv2VmRIiE8MQek
 r7MgI7JMHHQ+bAW4+1XSg7aHR10n9h8n+3I2Z6mNdDHj3osyN3O19QydnqZbwotJVP9E
 uWSg==
X-Gm-Message-State: ANoB5plmvr6yGkfI0W1DRdbaKmHZFVXXSJpCc2+VAxZBgpq/B5TTSX6D
 eao6kzzfYd/ed2+FtTdNc18+MTFM8WXRMsYsaaKZoiEUNLi4pZq1V9XL824JTcGjZ3+7QcKzQ0c
 NVbGLq3GIC+Mu4os=
X-Received: by 2002:a1c:f015:0:b0:3cf:7818:b123 with SMTP id
 a21-20020a1cf015000000b003cf7818b123mr49234079wmb.8.1669826282822; 
 Wed, 30 Nov 2022 08:38:02 -0800 (PST)
X-Google-Smtp-Source: AA0mqf44MyWOwxkNE6+au81Yf4Wvy5HHY4uw0yZOItueSobDTLn0G3sbKq/+KUdwuu2YeXJ1GBZz9g==
X-Received: by 2002:a1c:f015:0:b0:3cf:7818:b123 with SMTP id
 a21-20020a1cf015000000b003cf7818b123mr49234068wmb.8.1669826282616; 
 Wed, 30 Nov 2022 08:38:02 -0800 (PST)
Received: from redhat.com ([2.52.19.245]) by smtp.gmail.com with ESMTPSA id
 j33-20020a05600c1c2100b003b4ff30e566sm5991958wms.3.2022.11.30.08.38.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 30 Nov 2022 08:38:01 -0800 (PST)
Date: Wed, 30 Nov 2022 11:37:58 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Jason Wang <jasowang@redhat.com>
Cc: peterx@redhat.com, qemu-devel@nongnu.org, eric.auger@redhat.com,
 viktor@daynix.com
Subject: Re: [PATCH 0/3] Fix UNMAP notifier for intel-iommu
Message-ID: <20221130113740-mutt-send-email-mst@kernel.org>
References: <20221129081037.12099-1-jasowang@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221129081037.12099-1-jasowang@redhat.com>
Received-SPF: pass client-ip=170.10.129.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Tue, Nov 29, 2022 at 04:10:34PM +0800, Jason Wang wrote:
> Hi All:
> 
> According to ATS, device should work if ATS is disabled. This is not
> correctly implemented in the current intel-iommu since it doesn't
> handle the UNMAP notifier correctly. This breaks the vhost-net +
> vIOMMU without dt.
> 
> The root casue is that the when there's a device IOTLB miss (note that
> it's not specific to PCI so it can work without ATS), Qemu doesn't
> build the IOVA tree, so when guest start an IOTLB invalidation, Qemu
> won't trigger the UNMAP notifier.
> 
> Fixing by build IOVA tree during IOMMU translsation.
> 
> Thanks

Any changes of Fixes tags? this is 8.0 yes?

> Jason Wang (3):
>   intel-iommu: fail MAP notifier without caching mode
>   intel-iommu: fail DEVIOTLB_UNMAP without dt mode
>   intel-iommu: build iova tree during IOMMU translation
> 
>  hw/i386/intel_iommu.c | 58 ++++++++++++++++++++++++-------------------
>  1 file changed, 33 insertions(+), 25 deletions(-)
> 
> -- 
> 2.25.1


