Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E2C653FE8DD
	for <lists+qemu-devel@lfdr.de>; Thu,  2 Sep 2021 07:48:25 +0200 (CEST)
Received: from localhost ([::1]:44434 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mLfaK-0004Nh-Vv
	for lists+qemu-devel@lfdr.de; Thu, 02 Sep 2021 01:48:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39778)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1mLfYs-0003gq-UK
 for qemu-devel@nongnu.org; Thu, 02 Sep 2021 01:46:56 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:20112)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1mLfYr-0003oF-HF
 for qemu-devel@nongnu.org; Thu, 02 Sep 2021 01:46:54 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1630561613;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Lp8zDTJKyGCrWdFXcXqoPSMRyeJwWLuOFaoyCJEf/8c=;
 b=VdOQE1ANgm8pJjis5OCJwwPuzO61qK87kWx5f0iSIOLBq1YWGP7961wnDYDq7+AZq7RoKL
 1VsMBtZYuiiJl6IvDr1buigfZN2SFbs4bZon5D8Boe/yhYp26gp1kKLWDSfNgAkI644m1o
 HrdimEZER2XPoI+5YMv1MfTHFVuIgV8=
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com
 [209.85.216.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-429-4o4Y9W0YPquRsigSVFWa0Q-1; Thu, 02 Sep 2021 01:46:49 -0400
X-MC-Unique: 4o4Y9W0YPquRsigSVFWa0Q-1
Received: by mail-pj1-f72.google.com with SMTP id
 y3-20020a17090a8b03b02901787416b139so598816pjn.4
 for <qemu-devel@nongnu.org>; Wed, 01 Sep 2021 22:46:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=Lp8zDTJKyGCrWdFXcXqoPSMRyeJwWLuOFaoyCJEf/8c=;
 b=gzt0zbUQjra7mHe9mZWg2UtcP4F8PZ9nk0TZ25P+R4RDoDWEerta80sc1MB5vMd76E
 m/dNvd6liY2yB7JtK6cV4iTa6zXhPXbOOwZQiDt64rWgh007QddccwzswyJsJGrS0D6H
 Wbd/hXFBoWT7C9duEoWhkcrLt8ZdwDb/bXKZN1kW1K+7TH3CkI+8pt5p+ipwWayAuKxw
 eR1FTi6Ye/EjzZ7xJN84J9bybv5d/uFUXMs3hk2QEV2FL0ubn9+rC7i6j5+haBrQiaH5
 hRPOZmegCrTLQaFmITQvOHYLUj8NJCoEmjGo9XExJ8+/QiFT2TlXxuZ59Pg9vwrjWtpl
 RtQQ==
X-Gm-Message-State: AOAM5310e3FOckRlHFA0koUvpE7tH5sSLVPcnWDV8y8lqXWEa8/DjzcD
 uhMVOi9Ep+0sfqlHHH2bKnaTWbASlii0gUyED71P5skXHWfn8MwOpUdVO9ytKGhX+JbW6Ch02fu
 zlkME9/LoBbte1do=
X-Received: by 2002:a17:90a:cb83:: with SMTP id
 a3mr1913220pju.91.1630561608298; 
 Wed, 01 Sep 2021 22:46:48 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyIj7flDheYkmrkaPyJjLbucufXFfikcqP68fP+wv06qHjHcACu8VqMHa3yP/joh7qIDBnMsg==
X-Received: by 2002:a17:90a:cb83:: with SMTP id
 a3mr1913202pju.91.1630561608080; 
 Wed, 01 Sep 2021 22:46:48 -0700 (PDT)
Received: from wangxiaodeMacBook-Air.local ([209.132.188.80])
 by smtp.gmail.com with ESMTPSA id h4sm951780pgn.6.2021.09.01.22.46.44
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 01 Sep 2021 22:46:47 -0700 (PDT)
Subject: Re: [PATCH 0/3] Disable vhost device IOTLB is IOMMU is not enabled
To: qemu-devel@nongnu.org, mst@redhat.com
References: <20210804034803.1644-1-jasowang@redhat.com>
From: Jason Wang <jasowang@redhat.com>
Message-ID: <db9fde9b-2d93-7eb8-003e-9cccb07e8276@redhat.com>
Date: Thu, 2 Sep 2021 13:46:34 +0800
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20210804034803.1644-1-jasowang@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jasowang@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=gbk; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Received-SPF: pass client-ip=216.205.24.124; envelope-from=jasowang@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.392,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 MIME_CHARSET_FARAWAY=2.45, NICE_REPLY_A=-1.029, RCVD_IN_DNSWL_LOW=-0.7,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: Wei.Huang2@amd.com, dgilbert@redhat.com, peterx@redhat.com,
 Sriyash.Caculo@amd.com, pbonzini@redhat.com, chao.gao@intel.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


ÔÚ 2021/8/4 ÉÏÎç11:48, Jason Wang Ð´µÀ:
> Hi:
>
> We currently try to enable device IOTLB when iommu_platform is
> set. This may lead unnecessary trasnsactions between qemu and vhost
> when vIOMMU is not used (which is the typical case for the encrypted
> VM).
>
> So patch tries to use transport specific method to detect the enalbing
> of vIOMMU and enable the device IOTLB only if vIOMMU is enalbed.
>
> Please review.


Hi Michael:

Does this looks good for you? If yes, would you like to pick this series?

Thanks


>
> Thanks
>
> Jason Wang (3):
>    virtio-bus: introduce iommu_enabled()
>    virtio-pci: implement iommu_enabled()
>    vhost: correctly detect the enabling IOMMU
>
>   hw/virtio/vhost.c              |  2 +-
>   hw/virtio/virtio-bus.c         | 14 ++++++++++++++
>   hw/virtio/virtio-pci.c         | 14 ++++++++++++++
>   include/hw/virtio/virtio-bus.h |  4 +++-
>   4 files changed, 32 insertions(+), 2 deletions(-)
>


