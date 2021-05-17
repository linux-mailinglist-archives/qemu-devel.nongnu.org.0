Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B1603825D0
	for <lists+qemu-devel@lfdr.de>; Mon, 17 May 2021 09:49:44 +0200 (CEST)
Received: from localhost ([::1]:34626 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1liY0V-0008F4-D1
	for lists+qemu-devel@lfdr.de; Mon, 17 May 2021 03:49:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44786)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <drjones@redhat.com>)
 id 1liXyq-0007Lt-LU
 for qemu-devel@nongnu.org; Mon, 17 May 2021 03:48:00 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:46490)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <drjones@redhat.com>)
 id 1liXyp-0007bz-0I
 for qemu-devel@nongnu.org; Mon, 17 May 2021 03:48:00 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1621237677;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=+igg/I3iudDo6B3PAWIxBrC8nxpEoLBCXED3IDJmsuk=;
 b=CgdPfIkO23UBh35SLKhWrMskn0PISNgDyerr1i62wZJ8YCeN3Lg3JHJtDHqFbvsBd0rS2r
 ZGkuMpDndQgXLCZ0NLI0PpmmZB5RGU4wTJ8UAyHxRM92f9vLdJm3hXnRBqIgmBkyJt2ii+
 2dBZ84hvsT54e3FfMzRenlVMnAEk4ZY=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-550-jVGTuqeBNsGSM6YNqRSWJg-1; Mon, 17 May 2021 03:47:55 -0400
X-MC-Unique: jVGTuqeBNsGSM6YNqRSWJg-1
Received: by mail-ej1-f71.google.com with SMTP id
 nd10-20020a170907628ab02903a324b229bfso709781ejc.7
 for <qemu-devel@nongnu.org>; Mon, 17 May 2021 00:47:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=+igg/I3iudDo6B3PAWIxBrC8nxpEoLBCXED3IDJmsuk=;
 b=QrI3da2vkAuLwrtm7VoT0qioZMC71JymWS1MNWLI0I9fTiv7XwfW6ovInDV5HDBS5H
 P8Ie4zRP6vrD6WKq7qQSc0gGsJ2D9XDW3HbQOWPqMVKSn3t9kmtcsyUo6ts4VQsYhs6E
 Ow/Qf6fTe4mAadcJ1ecZbT1/WtTBjZiMdA7RgYE0dkujxfiUYDX/DfklRuJ1qGDkd1zT
 Hx1mHX8WXuKN0z8hGjKGCeC/eaHyG56elfkIahqL26ZKJV/IWCl6l+1AJ7V5sU/dzFTm
 5K1PWqwqs/bCdEEjEVBENoVEfM2MXIB9eDwnWMz40AblU0VQSN8O8WI8ViU75zYxhK4D
 +ncQ==
X-Gm-Message-State: AOAM531B65ZuSqBBSNBCZgm9KY/h0Kcvz6E5MU4OHHWXXzxYvlQGa1uX
 zPKU/j8ZtPaJMyi7LMzaohrMF+pyAsQxwM/kF0UXD0m3DIxeMxxeQ1AXBIIShUt5e9wS9WYYYBq
 gJGwQxaGC4Gr94LQ=
X-Received: by 2002:a17:907:1002:: with SMTP id
 ox2mr6332360ejb.337.1621237674051; 
 Mon, 17 May 2021 00:47:54 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzAjtolFJWl4IyCl6hB7AXvCBtjuA8WyZmn05XEtbcOQ5rkK5+LmWz4gEr5/wa49veNPUsgMg==
X-Received: by 2002:a17:907:1002:: with SMTP id
 ox2mr6332340ejb.337.1621237673938; 
 Mon, 17 May 2021 00:47:53 -0700 (PDT)
Received: from gator.home (cst2-174-132.cust.vodafone.cz. [31.30.174.132])
 by smtp.gmail.com with ESMTPSA id w14sm10510484edj.6.2021.05.17.00.47.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 17 May 2021 00:47:53 -0700 (PDT)
Date: Mon, 17 May 2021 09:47:51 +0200
From: Andrew Jones <drjones@redhat.com>
To: Yanan Wang <wangyanan55@huawei.com>
Subject: Re: [RFC PATCH v3 7/9] hw/acpi/aml-build: Add Processor hierarchy
 node structure
Message-ID: <20210517074751.7kexuvcktazidlup@gator.home>
References: <20210516102900.28036-1-wangyanan55@huawei.com>
 <20210516102900.28036-8-wangyanan55@huawei.com>
MIME-Version: 1.0
In-Reply-To: <20210516102900.28036-8-wangyanan55@huawei.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=drjones@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=drjones@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.296,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
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
Cc: Barry Song <song.bao.hua@hisilicon.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 "Michael S . Tsirkin" <mst@redhat.com>, wanghaibin.wang@huawei.com,
 zhukeqian1@huawei.com, qemu-devel@nongnu.org, yangyicong@huawei.com,
 Shannon Zhao <shannon.zhaosl@gmail.com>, qemu-arm@nongnu.org,
 Alistair Francis <alistair.francis@wdc.com>, prime.zeng@hisilicon.com,
 Paolo Bonzini <pbonzini@redhat.com>, yuzenghui@huawei.com,
 Igor Mammedov <imammedo@redhat.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Sun, May 16, 2021 at 06:28:58PM +0800, Yanan Wang wrote:
> Add a generic API to build Processor hierarchy node structure (Type 0),
> which is strictly consistent with descriptions in ACPI 6.2: 5.2.29.1.
> 
> This function will be used to build ACPI PPTT table for cpu topology.
> 
> Co-developed-by: Ying Fang <fangying1@huawei.com>
> Signed-off-by: Ying Fang <fangying1@huawei.com>
> Co-developed-by: Henglong Fan <fanhenglong@huawei.com>
> Signed-off-by: Henglong Fan <fanhenglong@huawei.com>
> Co-developed-by: Yanan Wang <wangyanan55@huawei.com>
> Signed-off-by: Yanan Wang <wangyanan55@huawei.com>
> ---
>  hw/acpi/aml-build.c         | 26 ++++++++++++++++++++++++++
>  include/hw/acpi/aml-build.h |  4 ++++
>  2 files changed, 30 insertions(+)
>

Reviewed-by: Andrew Jones <drjones@redhat.com>


