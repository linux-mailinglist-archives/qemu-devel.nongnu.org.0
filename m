Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A5486EA3CE
	for <lists+qemu-devel@lfdr.de>; Fri, 21 Apr 2023 08:27:42 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ppkEV-0002mG-BO; Fri, 21 Apr 2023 02:26:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1ppkEM-0002li-LZ
 for qemu-devel@nongnu.org; Fri, 21 Apr 2023 02:26:51 -0400
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1ppkEK-0003Wo-KI
 for qemu-devel@nongnu.org; Fri, 21 Apr 2023 02:26:50 -0400
Received: by mail-wm1-x336.google.com with SMTP id
 5b1f17b1804b1-3f0a0c4e505so8938435e9.0
 for <qemu-devel@nongnu.org>; Thu, 20 Apr 2023 23:26:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1682058406; x=1684650406;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=M0hd61OI4UW3TmrzQkAjHMoSJj5ZcwJ7VbTRL7zW/s4=;
 b=Q1VBQqzSezsTKT1L4OnpbvsC4AzdqQ70qKrsQDG+1y5dom9W6ef0X4NjqXs2i9iye/
 a0XWN7nULrH/e5sAX7fbTh5ZMDnVQYZySjXzojt//PuSwckQcEEW3Op07dCJUbj2ZJMN
 TLe8Wjcbk3uPnqClpFuVNhEvkhPTvl0aJLfWL3GW1koh2XyCuoR4IZn11hG8obLJSacc
 ys3AhXUZgZSrkfdOrn5ecnu12eZ1spUwkKYLHrVSBs/alk5b+nA3Xg2bmcbGBZBv5QWJ
 9aByVhQPxlmZvS4j+86YqJXsemIT4LN5OCGo26qIlJucwoox46c+9AokFguB6OvHuzAn
 cHig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682058406; x=1684650406;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=M0hd61OI4UW3TmrzQkAjHMoSJj5ZcwJ7VbTRL7zW/s4=;
 b=P4oq9r/GMchkpVfk9K1dDFarwX8A0NgPqemAF4oWxSsr3KAOXas9lZkyiyddZyFaHQ
 050hYEP6rltnfqspKAWkuocaHy2ySaZDDWxpoblCiTSVcGzecih+kIbFy4r0uElSyE7o
 7hNWnMtjgDLc3Pgd8oXy9fsHWLjUY4JYxcPp30BoHmRB0rqAiatOCu2WZ8brMt44gQga
 iR67jxgSSi5iULNcFYa+t13rOp1r/ULGDm277t0XwFZR6BtWqC/TseDHOAfLFJaewXX+
 UemzE01oLDKZob3fUyMMJRRVgXLUVXxQO13W58Zd+nXm095Y3TJFTWgVYZ25S+pVpwNf
 26Pg==
X-Gm-Message-State: AAQBX9d0wG8tO474YV3tj2vP8afDFxCV12VqvHfYFnMhR+gudotQNU8H
 lvUeJphObVM0n0V8xMI+Le0tAA==
X-Google-Smtp-Source: AKy350YDAOORGdIAkeCWSWC/QQ0MlYY3u6kW6OTT1BPvsWbapBHQv4vku7vutcO6Kw1S0etRpu+uDQ==
X-Received: by 2002:a7b:c845:0:b0:3f1:9540:d5fe with SMTP id
 c5-20020a7bc845000000b003f19540d5femr8646wml.21.1682058406521; 
 Thu, 20 Apr 2023 23:26:46 -0700 (PDT)
Received: from [192.168.69.115] (min31-h02-176-184-28-119.dsl.sta.abo.bbox.fr.
 [176.184.28.119]) by smtp.gmail.com with ESMTPSA id
 y32-20020a05600c342000b003f173956a82sm7176689wmp.21.2023.04.20.23.26.45
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 20 Apr 2023 23:26:46 -0700 (PDT)
Message-ID: <b797ee27-2182-e391-9f39-dce51db7e07d@linaro.org>
Date: Fri, 21 Apr 2023 08:26:43 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.10.0
Subject: Re: [RFC PATCH] hw/pci-bridge: Fix release ordering by embedding
 PCIBridgeWindows within PCIBridge
Content-Language: en-US
To: Jonathan Cameron <Jonathan.Cameron@huawei.com>, qemu-devel@nongnu.org,
 Peter Maydell <peter.maydell@linaro.org>
Cc: Igor Mammedov <imammedo@redhat.com>, "Michael S . Tsirkin"
 <mst@redhat.com>, Fan Ni <fan.ni@samsung.com>, linuxarm@huawei.com
References: <20230420145937.17152-1-Jonathan.Cameron@huawei.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230420145937.17152-1-Jonathan.Cameron@huawei.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::336;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x336.google.com
X-Spam_score_int: -37
X-Spam_score: -3.8
X-Spam_bar: ---
X-Spam_report: (-3.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.669,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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

Hi Jonathan,

On 20/4/23 16:59, Jonathan Cameron via wrote:
> The lifetime of the PCIBridgeWindows instance accessed via the windows pointer
> in struct PCIBridge is managed separately from the PCIBridge itself.
> 
> Triggered by ./qemu-system-x86_64 -M x-remote -display none -monitor stdio
> QEMU monitor: device_add cxl-downstream
> 
> In some error handling paths (such as the above due to attaching a cxl-downstream
> port anything other than a cxl-upstream port) the g_free() of the PCIBridge
> windows in pci_bridge_region_cleanup() is called before the final call of
> flatview_uref() in address_space_set_flatview() ultimately from
> drain_call_rcu()
> 
> At one stage this resulted in a crash, currently can still be observed using
> valgrind which records a use after free.
> 
> When present, only one instance is allocated. pci_bridge_update_mappings()
> can operate directly on an instance rather than creating a new one and
> swapping it in.  Thus there appears to be no reason to not directly
> couple the lifetimes of the two structures by embedding the PCIBridgeWindows
> within the PCIBridge removing the need for the problematic separate free.
> 
> Patch is same as was posted deep in the discussion.
> https://lore.kernel.org/qemu-devel/20230403171232.000020bb@huawei.com/
> 
> Posted as an RFC as only lightly tested and I'm not sure what the reasoning
> behind the separation of lifetimes originally was. As such perhaps this is
> not the best route to fixing the issue.
> 
> Reported-by: Thomas Huth <thuth@redhat.com>
> Signed-off-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>
> ---
>   hw/pci/pci_bridge.c         | 20 ++++++++------------
>   include/hw/pci/pci_bridge.h |  3 ++-
>   2 files changed, 10 insertions(+), 13 deletions(-)


> diff --git a/include/hw/pci/pci_bridge.h b/include/hw/pci/pci_bridge.h
> index 01670e9e65..ac75ec0c1b 100644
> --- a/include/hw/pci/pci_bridge.h
> +++ b/include/hw/pci/pci_bridge.h
> @@ -30,6 +30,7 @@
>   #include "hw/pci/pci_bus.h"
>   #include "hw/cxl/cxl.h"
>   #include "qom/object.h"
> +#include "qemu/rcu.h"

Where is this header is used?

>   typedef struct PCIBridgeWindows PCIBridgeWindows;
>   
> @@ -73,7 +74,7 @@ struct PCIBridge {
>       MemoryRegion address_space_mem;
>       MemoryRegion address_space_io;
>   
> -    PCIBridgeWindows *windows;
> +    PCIBridgeWindows windows;
>   
>       pci_map_irq_fn map_irq;
>       const char *bus_name;


