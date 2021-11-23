Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A47C45A0A0
	for <lists+qemu-devel@lfdr.de>; Tue, 23 Nov 2021 11:48:58 +0100 (CET)
Received: from localhost ([::1]:57860 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mpTM9-0006oE-6D
	for lists+qemu-devel@lfdr.de; Tue, 23 Nov 2021 05:48:57 -0500
Received: from eggs.gnu.org ([209.51.188.92]:34256)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mpTJA-0004dF-Vp
 for qemu-devel@nongnu.org; Tue, 23 Nov 2021 05:45:53 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:23396)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mpTJ8-0002EF-Ag
 for qemu-devel@nongnu.org; Tue, 23 Nov 2021 05:45:52 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1637664349;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=rDohJsa3SI4NSEp80jeoyNtaxqfaV30ZFqgm91yTkyY=;
 b=bb0Czv8ahmxQW29wRBW3Hy+a4qP8kvmndeQ+KUui99S+9jMgSQ07JmbZyheEMn4/b/2k+d
 LPrZsfeNTxXRVDqxCx0b/JQjwrSbA0rpVpFMucYOqp0GYUPVeOf+Zio/+VK8Let7bpGTmQ
 6PhVhWLPiJL+3njkhZYrGpVh9r8EKTg=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-515-Z2NJG-W3MGGuZy3EnAf-XA-1; Tue, 23 Nov 2021 05:45:47 -0500
X-MC-Unique: Z2NJG-W3MGGuZy3EnAf-XA-1
Received: by mail-wm1-f72.google.com with SMTP id
 m14-20020a05600c3b0e00b0033308dcc933so1306338wms.7
 for <qemu-devel@nongnu.org>; Tue, 23 Nov 2021 02:45:47 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=rDohJsa3SI4NSEp80jeoyNtaxqfaV30ZFqgm91yTkyY=;
 b=umdYVsWJ5Cfhlj0XtUyujI4hJ2jq/BRMEZdXzIc+HJXiND1T0K0aRdAgo/2d3ZtbMo
 yQlPWnGr7wI+kzBRBNloO/GTyhgKfTXp4ohnTEEiCgivfR19hDsp0pRVkwEl+qrzlBjt
 +xRy5HvOGc+5VqSCPlZpwm4QGtuzVBXrhYv3XCrAZ60HRI36JbP7Aeuly8OsIswaEP6H
 JwR04GlHODfIVx3F17VZFRBNClXm++jI92LUurgIKbHcmcg3KCMWSjKwUjUEzKUd8q2q
 UL/LeOK/qtBXZOGOQ4lSV2xWF93VGgxD/g379ILgV93KFTBm/CcWlaGAdfyMySKF22AA
 BE1g==
X-Gm-Message-State: AOAM531UvW4vcnExJUkvmoFzDLvkCE+49Dws7ETQjNWvw36/nsavKnwR
 W4g1oY0dV4yKKHuAl3a4UGFbGjVrGfGKjzQngMfAdSKkW3ZXRSdqKQlLkzNG4i33jxwA1AV4TIk
 bzGmEHs8jj+JFjkI=
X-Received: by 2002:a05:600c:2046:: with SMTP id
 p6mr1792113wmg.87.1637664346735; 
 Tue, 23 Nov 2021 02:45:46 -0800 (PST)
X-Google-Smtp-Source: ABdhPJy3GrSAiG2U+gjoeg0A9xshybK4B4YBoTtUTXEx+ln9tjfh8/bf8UFrM/u3BvoHmrLuz2xbIg==
X-Received: by 2002:a05:600c:2046:: with SMTP id
 p6mr1792082wmg.87.1637664346549; 
 Tue, 23 Nov 2021 02:45:46 -0800 (PST)
Received: from [192.168.1.36] (62.red-83-57-168.dynamicip.rima-tde.net.
 [83.57.168.62])
 by smtp.gmail.com with ESMTPSA id k27sm881659wms.41.2021.11.23.02.45.45
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 23 Nov 2021 02:45:45 -0800 (PST)
Message-ID: <2a1e363c-a4f2-91d3-9ae7-971a7249335c@redhat.com>
Date: Tue, 23 Nov 2021 11:45:45 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: [PATCH v2 03/10] include/hw/dma/xlnx_csu_dma: Include ptimer.h
 and stream.h in the header
To: Francisco Iglesias <francisco.iglesias@xilinx.com>, qemu-devel@nongnu.org
References: <20211123103428.8765-1-francisco.iglesias@xilinx.com>
 <20211123103428.8765-4-francisco.iglesias@xilinx.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
In-Reply-To: <20211123103428.8765-4-francisco.iglesias@xilinx.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -69
X-Spam_score: -7.0
X-Spam_bar: -------
X-Spam_report: (-7.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.7,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-3.515, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
Cc: edgar.iglesias@xilinx.com, frasse.iglesias@gmail.com,
 alistair@alistair23.me, alistair23@gmail.com, peter.maydell@linaro.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 11/23/21 11:34, Francisco Iglesias wrote:
> Include ptimer.h and stream.h in the header for being able to build and
> reuse the DMA model (the first usage of StreamSink, StreamCanPushNotifyFn
> and ptimer_state is in the header).
> 
> Signed-off-by: Francisco Iglesias <francisco.iglesias@xilinx.com>
> ---
>  include/hw/dma/xlnx_csu_dma.h | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/include/hw/dma/xlnx_csu_dma.h b/include/hw/dma/xlnx_csu_dma.h
> index 9e9dc551e9..8c39e46f58 100644
> --- a/include/hw/dma/xlnx_csu_dma.h
> +++ b/include/hw/dma/xlnx_csu_dma.h
> @@ -21,6 +21,9 @@
>  #ifndef XLNX_CSU_DMA_H
>  #define XLNX_CSU_DMA_H
>  
> +#include "hw/ptimer.h"

Yes, but arguably ptimer_state should be forward
declared in "include/qemu/typedefs.h" IMO.

> +#include "hw/stream.h"

OK but you forgot these:

include/hw/sysbus.h (SysBusDevice)
include/exec/memory.h (MemoryRegion)
include/exec/memattrs.h (MemTxAttrs)
include/exec/memory.h (AddressSpace)
include/hw/register.h (RegisterInfo)


