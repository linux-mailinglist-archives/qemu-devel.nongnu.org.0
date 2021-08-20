Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D012F3F27AF
	for <lists+qemu-devel@lfdr.de>; Fri, 20 Aug 2021 09:35:17 +0200 (CEST)
Received: from localhost ([::1]:45356 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mGz3c-0005Hs-Ll
	for lists+qemu-devel@lfdr.de; Fri, 20 Aug 2021 03:35:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44512)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mGz1i-0002Qv-Ju
 for qemu-devel@nongnu.org; Fri, 20 Aug 2021 03:33:18 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:25185)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mGz1f-00059w-Pe
 for qemu-devel@nongnu.org; Fri, 20 Aug 2021 03:33:18 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1629444794;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=kPSVcZubVCqBQR/tc8m+zDBWBDed9HrkkhFEUxx4BUk=;
 b=X2OJ1XWX/bnd383rGD01Wn8qfippHAWTQ3kGXDl/Wd22y9rsNR5jIliJvwAoafFp7EZ/cc
 jTyKE6lkXvTovRmpy7mf6y5i3Gq//jdImMf9jGKQ5HAQWAKicdwzBwM0/jJQ77bc70OfYl
 AqIH5qjtL06nWrwRuUpraE+8xJfgPZs=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-440-ZmA0EA3COPiqa_NiwDAfXw-1; Fri, 20 Aug 2021 03:33:11 -0400
X-MC-Unique: ZmA0EA3COPiqa_NiwDAfXw-1
Received: by mail-wm1-f72.google.com with SMTP id
 f19-20020a1c1f13000000b002e6bd83c344so2169050wmf.3
 for <qemu-devel@nongnu.org>; Fri, 20 Aug 2021 00:33:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=kPSVcZubVCqBQR/tc8m+zDBWBDed9HrkkhFEUxx4BUk=;
 b=Dnbxb3oidvRi6/pXAfQcZGDup5u0qtGJm3esLtPjFNXxarZP06KEqOeEIPI13YTj1Y
 J/FLHNeTOQViptqVGAtxBNc+bKX4szZDTNlyOPUv5tRxR0qXuqErgcpOyLbowC6ABu5m
 VPt2eN5nc6vhEUKwXFi8eN+xUX2p8YfXc1J1JqEb7ydeP2MT+1YaUselkElMaJDLKggK
 tCP4ifMgsnFqMJYNvMZOFV10qPc+JBwAczm8no0XkVCvfnaAj/i+2VEB7IE1kS/ItZoR
 CkLhIUPNS3zpBYpKUeqUX6KsJYWbt7rcMHVsnnP7Zxrj5CE1N8RE1wrkCV/gxsDh36na
 lL8Q==
X-Gm-Message-State: AOAM530OfjGwUrdRdmXgiSGC0H9KHUOx7HoGJGYTHpHfHDsqgbtMsMON
 /jqihJZP+rwJLw5NdNpvlzQrwWrPm4EspS8zxLaA+SUzBQv+1g7v2ezNUgyfb5QcjligiOuH/3b
 Q1Sq6mLohRYywhJAr7Jq0UzMLMg1lt7sVpL1lZBEqmUmZIEYwU5C0F6/ETKGln1iE
X-Received: by 2002:adf:d1c8:: with SMTP id b8mr2631875wrd.278.1629444790082; 
 Fri, 20 Aug 2021 00:33:10 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJw/EA5ErNh91kaYLN2+cLvzS59sz4NgVdDGRfdPOcSmiebsTI7DwkAQqVlFUYdqte50WcsBoQ==
X-Received: by 2002:adf:d1c8:: with SMTP id b8mr2631853wrd.278.1629444789920; 
 Fri, 20 Aug 2021 00:33:09 -0700 (PDT)
Received: from [192.168.1.36] (163.red-83-52-55.dynamicip.rima-tde.net.
 [83.52.55.163])
 by smtp.gmail.com with ESMTPSA id g12sm5240671wru.85.2021.08.20.00.33.09
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 20 Aug 2021 00:33:09 -0700 (PDT)
Subject: Re: [PATCH] hw/arm/smmuv3: Support non-PCI/PCIe devices connection
To: "Li, Chunming" <Chunming.Li@verisilicon.com>,
 "eric.auger@redhat.com" <eric.auger@redhat.com>,
 "peter.maydell@linaro.org" <peter.maydell@linaro.org>
References: <49C79B700B5D8F45B8EF0861B4EF3B3B01142F5748@SHASXM03.verisilicon.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <b212add7-f36b-98ce-ccf5-c5209afea3b6@redhat.com>
Date: Fri, 20 Aug 2021 09:33:08 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <49C79B700B5D8F45B8EF0861B4EF3B3B01142F5748@SHASXM03.verisilicon.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -60
X-Spam_score: -6.1
X-Spam_bar: ------
X-Spam_report: (-6.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.7,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-2.591, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: "Wen, Jianxian" <Jianxian.Wen@verisilicon.com>,
 "qemu-arm@nongnu.org" <qemu-arm@nongnu.org>, "Liu,
 Renwei" <Renwei.Liu@verisilicon.com>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 8/20/21 4:36 AM, Li, Chunming wrote:
> The current SMMU V3 device model only support PCI/PCIe devices,
> so we update it to support non-PCI/PCIe devices.
> 
>     hw/arm/smmuv3:
>         . Create IOMMU memory regions for non-PCI/PCIe devices based on their SID
>         . Add sid-map property to store non-PCI/PCIe devices SID
>         . Update implementation of CFGI commands based on device SID
>     hw/arm/smmu-common:
>         . Differentiate PCI/PCIe and non-PCI/PCIe devices SID getting strategy
>     hw/arm/virt:
>         . Add PL330 DMA controller and connect with SMMUv3 for testing
>         . Add smmuv3_sidmap for non-PCI/PCIe devices SID setting
> 
> Signed-off-by: Chunming Li <chunming.li@verisilicon.com>
> Signed-off-by: Renwei Liu <renwei.liu@verisilicon.com>
> ---
> This patch depends on PL330 memory region connection patch:
> https://patchew.org/QEMU/4C23C17B8E87E74E906A25A3254A03F4FA1FEC31@SHASXM03.verisilicon.com/
> 
>  hw/arm/smmuv3.c              |  75 ++++++++++++++++++------
>  hw/arm/virt.c                | 110 ++++++++++++++++++++++++++++++++++-
>  include/hw/arm/smmu-common.h |  12 +++-
>  include/hw/arm/smmuv3.h      |   2 +
>  include/hw/arm/virt.h        |   3 +
>  5 files changed, 181 insertions(+), 21 deletions(-)
> 
> diff --git a/hw/arm/smmuv3.c b/hw/arm/smmuv3.c
> index 01b60bee4..c4da05d8b 100644
> --- a/hw/arm/smmuv3.c
> +++ b/hw/arm/smmuv3.c
> @@ -32,6 +32,7 @@
>  #include "hw/arm/smmuv3.h"
>  #include "smmuv3-internal.h"
>  #include "smmu-internal.h"
> +#include "hw/qdev-properties.h"
>  
>  /**
>   * smmuv3_trigger_irq - pulse @irq if enabled and update
> @@ -612,7 +613,7 @@ static SMMUTransCfg *smmuv3_get_config(SMMUDevice *sdev, SMMUEventInfo *event)
>      return cfg;
>  }
>  
> -static void smmuv3_flush_config(SMMUDevice *sdev)
> +static void __attribute__((unused)) smmuv3_flush_config(SMMUDevice *sdev)
>  {

Why keep this function if unused?


