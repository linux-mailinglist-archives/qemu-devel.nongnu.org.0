Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 76E7A46D4D6
	for <lists+qemu-devel@lfdr.de>; Wed,  8 Dec 2021 14:52:50 +0100 (CET)
Received: from localhost ([::1]:53848 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1muxNJ-0005cU-6P
	for lists+qemu-devel@lfdr.de; Wed, 08 Dec 2021 08:52:49 -0500
Received: from eggs.gnu.org ([209.51.188.92]:54340)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1muxK8-0003du-6N
 for qemu-devel@nongnu.org; Wed, 08 Dec 2021 08:49:32 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:34591)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1muxK4-00064X-Q2
 for qemu-devel@nongnu.org; Wed, 08 Dec 2021 08:49:31 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1638971367;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=e+usbWFBKzTrZ/NWYAXck7e+4FA+lKSUI4CBL5D8l8s=;
 b=f96XAzh5dEogD8O8F95vlgVXe3aJg4H2wngcpl+AOB+AYmG3fyVgrqBStoGLk93aoyGnrl
 fWpZgr7I9osbDdynFfHk+DCAn6t3y2LMwcaHkaT8QtqUk98JGOc4G0vj+O31/TYaA4TIwY
 IsDEBvUXirH1FoClphAbFXqNmVmLj8U=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-594-d-hVgS2PNQ-aYnKV2nPGBg-1; Wed, 08 Dec 2021 08:49:26 -0500
X-MC-Unique: d-hVgS2PNQ-aYnKV2nPGBg-1
Received: by mail-wm1-f71.google.com with SMTP id
 ay34-20020a05600c1e2200b00337fd217772so1434592wmb.4
 for <qemu-devel@nongnu.org>; Wed, 08 Dec 2021 05:49:26 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=e+usbWFBKzTrZ/NWYAXck7e+4FA+lKSUI4CBL5D8l8s=;
 b=lmHNaZDnC+qkachufopQ7OkMi0bIBO/A2AOPiOEV+dg6gH1hHgJCTUXSobp0oBICxG
 NvvnqzvoCvapc2lZmQs2PcIdiR8GUOaJ4bT4SPuX7YzAIJ4+zQcdkfUA1+sa42IXVSCA
 H2m177sxDkEbchjaVCpRDVfAyeWRDWQ8CJFUuq69ubqxhNqPxUGMMC36lSTB16RUT20q
 kYsgNuDrQ052MWa2VNRlI5wNxIkEmfEzNcKlwNSxWgiURXK47YnWuSpyO8Y0O2RnmEGy
 spIqM02OY10HBGZH47daLvAytrNaB+czzldbENo1NOzk0ilY3l3w3+JhJFuu0Pt+bn8Q
 W22g==
X-Gm-Message-State: AOAM532IdsKxj2PHFreCGyRDXKhj1ha7xjUgyjjU2MyZowF0p7NwH4i4
 MCpwMExQtyKDjz/Bh1s5AS+vBuKfWDQNcwTg9K6N97kc50jNsIZ/rZSeOseOg3CDA21xziGPEuY
 WIqjs1fBqNRl8Be8=
X-Received: by 2002:a7b:c157:: with SMTP id z23mr16107790wmi.113.1638971365762; 
 Wed, 08 Dec 2021 05:49:25 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzI6TqQnfrf1bL1QygeMJHKrYOiC8ItPpy9lGAkkYtBWjRwZyGA/KXUb7Xj/p+8Qtmg37cnEQ==
X-Received: by 2002:a7b:c157:: with SMTP id z23mr16107755wmi.113.1638971365430; 
 Wed, 08 Dec 2021 05:49:25 -0800 (PST)
Received: from [10.33.192.183] (nat-pool-str-t.redhat.com. [149.14.88.106])
 by smtp.gmail.com with ESMTPSA id q123sm5610519wma.30.2021.12.08.05.49.24
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 08 Dec 2021 05:49:24 -0800 (PST)
Message-ID: <ce687dcc-273a-34a6-a0d8-9c1c67b7fe21@redhat.com>
Date: Wed, 8 Dec 2021 14:49:23 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: [PATCH v6 4/4] tests: qtest: Add virtio-iommu test
To: Eric Auger <eric.auger@redhat.com>, eric.auger.pro@gmail.com,
 qemu-arm@nongnu.org, qemu-devel@nongnu.org, jean-philippe@linaro.org,
 peter.maydell@linaro.org
References: <20211127072910.1261824-1-eric.auger@redhat.com>
 <20211127072910.1261824-5-eric.auger@redhat.com>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <20211127072910.1261824-5-eric.auger@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -58
X-Spam_score: -5.9
X-Spam_bar: -----
X-Spam_report: (-5.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.619,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-2.44, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: lvivier@redhat.com, pbonzini@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 27/11/2021 08.29, Eric Auger wrote:
> Add the framework to test the virtio-iommu-pci device
> and tests exercising the attach/detach, map/unmap API.
> 
> Signed-off-by: Eric Auger <eric.auger@redhat.com>
> Tested-by: Jean-Philippe Brucker <jean-philippe@linaro.org>
> Reviewed-by: Jean-Philippe Brucker <jean-philippe@linaro.org>
> 
> ---
> 
> v5 -> v6:
> - changed the expected value for domain.end (32 -> MAX_UINT32)
> ---
>   tests/qtest/libqos/meson.build    |   1 +
>   tests/qtest/libqos/virtio-iommu.c | 126 ++++++++++++
>   tests/qtest/libqos/virtio-iommu.h |  40 ++++
>   tests/qtest/meson.build           |   1 +
>   tests/qtest/virtio-iommu-test.c   | 326 ++++++++++++++++++++++++++++++
>   5 files changed, 494 insertions(+)
>   create mode 100644 tests/qtest/libqos/virtio-iommu.c
>   create mode 100644 tests/qtest/libqos/virtio-iommu.h
>   create mode 100644 tests/qtest/virtio-iommu-test.c

Acked-by: Thomas Huth <thuth@redhat.com>


