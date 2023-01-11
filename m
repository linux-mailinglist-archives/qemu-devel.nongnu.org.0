Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 51158665E3D
	for <lists+qemu-devel@lfdr.de>; Wed, 11 Jan 2023 15:45:45 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pFcLq-0003q8-FB; Wed, 11 Jan 2023 09:45:14 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pFcLl-0003mW-N5
 for qemu-devel@nongnu.org; Wed, 11 Jan 2023 09:45:11 -0500
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pFcLj-0004Ql-KD
 for qemu-devel@nongnu.org; Wed, 11 Jan 2023 09:45:09 -0500
Received: by mail-wm1-x332.google.com with SMTP id o15so11240891wmr.4
 for <qemu-devel@nongnu.org>; Wed, 11 Jan 2023 06:45:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=1hT0yCUFuOaktmsLkadVbzQZN/eHEXE/9G8TjF0C1TM=;
 b=j1eadlbl5tD/uJy5yKiJ7JPH5yraYt8R2qs8QEItEOvCZUVBMvV6dtqAHLq/X8D7SG
 AelZxX3wM8MfxEoUiS6cKiAmiQg+/5Y2zVJ1uQZmyUMM1W1OLDsAoOX4DyqWVEBqc+YU
 sJchtflIJs+wtl8TbYqXyc8pms0iTAiIL+BDeieA8u2GcEUGKiz8rXI8FGJVrjjryhmN
 mc16+rS7lFbr+lKn5I9oDP8X9rBjyBKDuQMpI6nKpGDpMEYQ+WBNVNWpnCFzqH7WBBCt
 fAQ+HwumABHL7AmfNZK5DWBTCfEeKIu6nZw/DztRJ0HlxLnMZQ1/RITRAa/nKdGHnQeG
 NZ1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=1hT0yCUFuOaktmsLkadVbzQZN/eHEXE/9G8TjF0C1TM=;
 b=Awcv/k8T8jsTL6tNMCmLNsz6WPeQ/tFSWqEcZZ7+sgTufMeTfUTfvUxD2waV23iXKq
 RsySi2TGtSF+BDh9LsvS8ICJPasf26FHvCyo2/4b4zCbxHVT65K/zkFActG6p+LXEzUF
 08Rof/Eg5YbCXeyI3ZPcF/Es6ZC+W+W0jZQZgRxnjoGRqYdB/sF1K8nZVPsE0FA46IO9
 /g1ulJOQekEEPqXTk0pNMS9XQHr1oZihxAf1ylmp8LIxlooTm/+ng9Vs3SenlIMajh7s
 z4i42ETkjWqxXOYVDG8vyGHHFtFYFUg8F9Qdyuv5s9c1L7QQVLYuZSmF0Fbbq7aOqAZ1
 WmiQ==
X-Gm-Message-State: AFqh2krc0aOD4OPyIHeGa5Swuqeg4kDula6Hv+vZl9foMiK7r7hqzJ3y
 tFZsMsHKk7IL0iVQdwkauE8WeQ==
X-Google-Smtp-Source: AMrXdXuT1Bvxl0IOjCQJ2HhE2XnVrmFMhS/YISpxYe4t2a8mZkC8xfkv3a2fMFU18flgIHPLTpWOHA==
X-Received: by 2002:a05:600c:556f:b0:3d2:2a74:3a90 with SMTP id
 ja15-20020a05600c556f00b003d22a743a90mr55013398wmb.22.1673448305603; 
 Wed, 11 Jan 2023 06:45:05 -0800 (PST)
Received: from [192.168.30.216] ([81.0.6.76]) by smtp.gmail.com with ESMTPSA id
 e2-20020a5d65c2000000b0027b35baf811sm13725966wrw.57.2023.01.11.06.45.04
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 11 Jan 2023 06:45:04 -0800 (PST)
Message-ID: <517cfe71-8803-3fbf-265c-e13f32f3bd76@linaro.org>
Date: Wed, 11 Jan 2023 15:45:03 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.6.1
Subject: Re: [PATCH 2/8] hw/pci-bridge/cxl_downstream: Fix type naming mismatch
Content-Language: en-US
To: Jonathan Cameron <Jonathan.Cameron@huawei.com>, qemu-devel@nongnu.org,
 Michael Tsirkin <mst@redhat.com>
Cc: Ben Widawsky <bwidawsk@kernel.org>, linux-cxl@vger.kernel.org,
 linuxarm@huawei.com, Ira Weiny <ira.weiny@intel.com>,
 Gregory Price <gourry.memverge@gmail.com>
References: <20230111142440.24771-1-Jonathan.Cameron@huawei.com>
 <20230111142440.24771-3-Jonathan.Cameron@huawei.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230111142440.24771-3-Jonathan.Cameron@huawei.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::332;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x332.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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

On 11/1/23 15:24, Jonathan Cameron via wrote:
> Fix capitalization difference between struct name and typedef.
> 
> Signed-off-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>
> ---
>   hw/pci-bridge/cxl_downstream.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/hw/pci-bridge/cxl_downstream.c b/hw/pci-bridge/cxl_downstream.c
> index 3d4e6b59cd..54f507318f 100644
> --- a/hw/pci-bridge/cxl_downstream.c
> +++ b/hw/pci-bridge/cxl_downstream.c
> @@ -15,7 +15,7 @@
>   #include "hw/pci/pcie_port.h"
>   #include "qapi/error.h"
>   
> -typedef struct CXLDownStreamPort {
> +typedef struct CXLDownstreamPort {
>       /*< private >*/
>       PCIESlot parent_obj;
>   

I was going to post the same patch because when reworking some QOM
definitions I'm getting:

     ../../hw/pci-bridge/cxl_downstream.c:27:26: error: typedef 
redefinition with different types ('struct CXLDownstreamPort' vs 'struct 
CXLDownStreamPort')
     DECLARE_INSTANCE_CHECKER(CXLDownstreamPort, CXL_DSP, TYPE_CXL_DSP)
                              ^
     ../../hw/pci-bridge/cxl_downstream.c:24:3: note: previous 
definition is here
     } CXLDownstreamPort;
       ^

So thanks!

Tested-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>


