Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 439E7619165
	for <lists+qemu-devel@lfdr.de>; Fri,  4 Nov 2022 07:49:43 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1oqqUy-0003gf-9q; Fri, 04 Nov 2022 02:48:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1oqqUp-0003gP-1l
 for qemu-devel@nongnu.org; Fri, 04 Nov 2022 02:48:07 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1oqqUm-0006EY-SJ
 for qemu-devel@nongnu.org; Fri, 04 Nov 2022 02:48:06 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1667544483;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=29TVQ0AXgE0D1S2xTl17dBkYH38ygKaTwvkS7Y3yvwM=;
 b=hffpPcCLolxYRByFPOy3sgLHoaahzYXpKxwE3Rt99UZvp3rHC6bPzenFMIuLbCL/hHXpN8
 VKEyCArxePYy7i+81EuHp5ZAc+Qz0R21B3Lc4wAv4kFU86PX+y3JWVESGdnYDl3Ur7TMto
 S535kNdBsriT+5fIFyZqLYwbIB9PbdM=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-265-0PrKCzxdPZyuOLgaNMyPcQ-1; Fri, 04 Nov 2022 02:48:01 -0400
X-MC-Unique: 0PrKCzxdPZyuOLgaNMyPcQ-1
Received: by mail-wm1-f71.google.com with SMTP id
 f1-20020a1cc901000000b003cf703a4f08so1344853wmb.2
 for <qemu-devel@nongnu.org>; Thu, 03 Nov 2022 23:48:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=29TVQ0AXgE0D1S2xTl17dBkYH38ygKaTwvkS7Y3yvwM=;
 b=cRAv+rfvCGtgjw0L7vrN9dq74FGUDddriur6XoB1mCGsUBS8wNhrDh0U2lx059PRkL
 tyFipAwsY9KWgVn2NN5eKxlh3W3NC4Eq5I3jSVkWIHnl3gLf7cJCe9/Fd2ukYTdHV5tL
 4f8Ihss95UTrARJJImmu2vV78gNIWEt+BC04p+o+FGpLefdrH+t05nP+/aBrqPKFW8DG
 /I8/cNOPDZ1qTAiEPhKJLgseIrOs9sfxigqnzUa47vh5dDJ8LE4swxCr6drhht6ogfBq
 fj3qghAd+rPLJyBK8H2E5NAn7gpS1r05hv5YrUQGR0RBhI8qCr0jn+fwFzTL5PnHOYuD
 ewhg==
X-Gm-Message-State: ACrzQf0KXtX5q7rSe4D1DA4Bl4ICUDIW7FjjpYKtIioEP949+TLlIRG6
 hsqjajOSd/V0JtC1P8zJu7/XnHiMWxztMJDvwTW4lxGvomQdjRWxFdYy8Uisb/zqaM3yLW8UKEi
 rkzv6UpCxGbogrq0=
X-Received: by 2002:a5d:4a0c:0:b0:236:5d98:1be4 with SMTP id
 m12-20020a5d4a0c000000b002365d981be4mr21229650wrq.590.1667544480717; 
 Thu, 03 Nov 2022 23:48:00 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM7P+F+R/79Qkq13J0P0StG9q0RcWVkIxdQ4kRudwe8HRqZ/pRansNsq/3a/60bpuV8cXDa/Ng==
X-Received: by 2002:a5d:4a0c:0:b0:236:5d98:1be4 with SMTP id
 m12-20020a5d4a0c000000b002365d981be4mr21229633wrq.590.1667544480490; 
 Thu, 03 Nov 2022 23:48:00 -0700 (PDT)
Received: from [192.168.0.5] (ip-109-43-177-201.web.vodafone.de.
 [109.43.177.201]) by smtp.gmail.com with ESMTPSA id
 p25-20020a05600c1d9900b003cf77e6091bsm1937280wms.11.2022.11.03.23.47.58
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 03 Nov 2022 23:47:59 -0700 (PDT)
Message-ID: <4274de61-292d-b3e0-8f86-d7000122a715@redhat.com>
Date: Fri, 4 Nov 2022 07:47:57 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [PULL 02/10] pci-bridge/cxl_downstream: Add a CXL switch
 downstream port
Content-Language: en-US
To: "Michael S. Tsirkin" <mst@redhat.com>, qemu-devel@nongnu.org,
 Jonathan Cameron <Jonathan.Cameron@huawei.com>
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Ben Widawsky <ben.widawsky@intel.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>
References: <20220616165703.42226-1-mst@redhat.com>
 <20220616165703.42226-3-mst@redhat.com>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <20220616165703.42226-3-mst@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -37
X-Spam_score: -3.8
X-Spam_bar: ---
X-Spam_report: (-3.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.047,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 16/06/2022 18.57, Michael S. Tsirkin wrote:
> From: Jonathan Cameron <Jonathan.Cameron@huawei.com>
> 
> Emulation of a simple CXL Switch downstream port.
> The Device ID has been allocated for this use.
> 
> Signed-off-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>
> Message-Id: <20220616145126.8002-3-Jonathan.Cameron@huawei.com>
> Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
> Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
> Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
> ---
>   hw/cxl/cxl-host.c              |  43 +++++-
>   hw/pci-bridge/cxl_downstream.c | 249 +++++++++++++++++++++++++++++++++
>   hw/pci-bridge/meson.build      |   2 +-
>   3 files changed, 291 insertions(+), 3 deletions(-)
>   create mode 100644 hw/pci-bridge/cxl_downstream.c

  Hi!

There is a memory problem somewhere in this new device. I can make QEMU 
crash by running something like this:

$ MALLOC_PERTURB_=59 ./qemu-system-x86_64 -M x-remote \
     -display none -monitor stdio
QEMU 7.1.50 monitor - type 'help' for more information
(qemu) device_add cxl-downstream
./qemu/qom/object.c:1188:5: runtime error: member access within misaligned 
address 0x3b3b3b3b3b3b3b3b for type 'struct Object', which requires 8 byte 
alignment
0x3b3b3b3b3b3b3b3b: note: pointer points here
<memory cannot be printed>
Bus error (core dumped)

Could you have a look if you've got some spare minutes?

  Thomas


