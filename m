Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 84FED6EAD62
	for <lists+qemu-devel@lfdr.de>; Fri, 21 Apr 2023 16:48:03 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pps2X-00030P-98; Fri, 21 Apr 2023 10:47:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pps2O-0002zg-NH
 for qemu-devel@nongnu.org; Fri, 21 Apr 2023 10:47:00 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pps2N-0003sJ-6N
 for qemu-devel@nongnu.org; Fri, 21 Apr 2023 10:47:00 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1682088417;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=szxJGko+yVNpGEUMZwXtBhu9rq+eZTxwBom3Qd9AaKI=;
 b=JlFfXTNZ58MCPPFHmhqKV8OjlvrVNVC/IakDR6Gjkw4JPndjslhrUzG4doccDCsbFj+6UH
 Vdd0RvNlKNE5rqew8rVXH9o3hVGOgOkGHfEyWl003UjGmHjUfRjqGM81ViO2me1wQT511a
 r49fBwYg0PNWOm0olXAw+ay0P9HWNDE=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-390-6Zj1cYLSMkq-RtHUCPCjpg-1; Fri, 21 Apr 2023 10:46:56 -0400
X-MC-Unique: 6Zj1cYLSMkq-RtHUCPCjpg-1
Received: by mail-wm1-f70.google.com with SMTP id
 5b1f17b1804b1-3f1912ed0daso3467425e9.1
 for <qemu-devel@nongnu.org>; Fri, 21 Apr 2023 07:46:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682088415; x=1684680415;
 h=content-transfer-encoding:in-reply-to:subject:from:references:cc:to
 :content-language:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=szxJGko+yVNpGEUMZwXtBhu9rq+eZTxwBom3Qd9AaKI=;
 b=bVsKfyFwrdDRjokI5HBsXMIYeDmElAzNlAffTFlFHlieYEHzhOJNpKh2FzvTJ1rKiT
 nTCivhVPHF/8QmIy6kTecShTBsXdE2tEreT1QZiGdOZVMlHS+mrILu2OSPQVBnMxHue7
 2Xj5MUwbloY/sWWkkj3d4xWztJoIKAXDNbr5O6gPY3y/LRh2LzXs4A0MZVTFRig2gamc
 nn7mqwc/KiMvWPgpg647d3SG2es3QuR7tk21wgCUZ9VIAeqRHRufZCk6DxST3psm6KRv
 l3eKMmIBeTBu7R5UFyiCovqg6A9XhmavgqQL4JE7X2dKUeT+zml/OdlqkA0zzON00nHR
 qZTw==
X-Gm-Message-State: AAQBX9e1gHq4EI8BpB9G0sYzUeiEvNiqvepR4eZTlzpcXxQ6sw7rO9OK
 vwSFlB/zSQsicVr589Fj10z27MxSd+Gc8L37o/essTxfvv1L5aEiCoEZ21ChzEYjNIl5iNDK5aO
 hUKmxl9921vCK+yM=
X-Received: by 2002:adf:ec8b:0:b0:2fb:a3e:7cba with SMTP id
 z11-20020adfec8b000000b002fb0a3e7cbamr3778176wrn.53.1682088415298; 
 Fri, 21 Apr 2023 07:46:55 -0700 (PDT)
X-Google-Smtp-Source: AKy350YcsJ1gDYvmTYMLSRe323bLldXOPVTB/dBFh3ml+jqe/9zfOC1r7HNyTNyv6v3d+w1sA1VXuQ==
X-Received: by 2002:adf:ec8b:0:b0:2fb:a3e:7cba with SMTP id
 z11-20020adfec8b000000b002fb0a3e7cbamr3778156wrn.53.1682088414999; 
 Fri, 21 Apr 2023 07:46:54 -0700 (PDT)
Received: from [192.168.0.3] (ip-109-43-178-20.web.vodafone.de.
 [109.43.178.20]) by smtp.gmail.com with ESMTPSA id
 r4-20020adfdc84000000b002f598008d50sm4559358wrj.34.2023.04.21.07.46.53
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 21 Apr 2023 07:46:54 -0700 (PDT)
Message-ID: <200b0bf4-2396-bdd9-ba8b-7efa5c9997fe@redhat.com>
Date: Fri, 21 Apr 2023 16:46:53 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Content-Language: en-US
To: Jonathan Cameron <Jonathan.Cameron@huawei.com>, qemu-devel@nongnu.org,
 Peter Maydell <peter.maydell@linaro.org>
Cc: "Michael S . Tsirkin" <mst@redhat.com>, Fan Ni <fan.ni@samsung.com>,
 linuxarm@huawei.com
References: <20230420142750.6950-1-Jonathan.Cameron@huawei.com>
 <20230420142750.6950-3-Jonathan.Cameron@huawei.com>
From: Thomas Huth <thuth@redhat.com>
Subject: Re: [PATCH 2/2] hw/pci-bridge: Make PCIe and CXL PXB Devices inherit
 from TYPE_PXB_DEV
In-Reply-To: <20230420142750.6950-3-Jonathan.Cameron@huawei.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -53
X-Spam_score: -5.4
X-Spam_bar: -----
X-Spam_report: (-5.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-3.297, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

On 20/04/2023 16.27, Jonathan Cameron via wrote:
> Previously, PXB_CXL_DEVICE, PXB_PCIE_DEVICE and PXB_DEVICE all
> have PCI_DEVICE as their direct parent but share a common state
> struct PXBDev. convert_to_pxb() is used to get the PXBDev
> instance from which ever of these types it is called on.
> 
> This patch switches to an explicit heirarchy based on shared
> functionality.  To allow use of OBJECT_DECLARE_SIMPLE_TYPE()
> whilst minimizing code changes, all types are renamed to have
> the postfix _DEV rather than _DEVICE.  The new heirarchy

s/heirarchy/hierarchy/

> has PXB_CXL_DEV with parent PXB_PCIE_DEV which in turn
> has parent PXB_DEV which continues to have parent PCI_DEVICE.
> 
> This allows simple use of PXB_DEV() etc rather than a custom function
> + removal of duplicated properties and moving the CXL specific
> elements out of struct PXBDev.
> 
> Signed-off-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>
> ---
>   hw/acpi/cxl.c                       | 11 +++---
>   hw/cxl/cxl-host.c                   |  4 +-
>   hw/pci-bridge/pci_expander_bridge.c | 59 ++++++++++-------------------
>   include/hw/cxl/cxl.h                |  4 +-
>   include/hw/pci/pci_bridge.h         | 28 ++++++++++----
>   5 files changed, 49 insertions(+), 57 deletions(-)

Reviewed-by: Thomas Huth <thuth@redhat.com>


