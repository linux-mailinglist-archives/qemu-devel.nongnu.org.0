Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EB1B16EAAC7
	for <lists+qemu-devel@lfdr.de>; Fri, 21 Apr 2023 14:48:40 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ppqBD-0000nQ-Fp; Fri, 21 Apr 2023 08:47:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1ppqBB-0000mS-Sl
 for qemu-devel@nongnu.org; Fri, 21 Apr 2023 08:47:57 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1ppqB9-0004fn-LH
 for qemu-devel@nongnu.org; Fri, 21 Apr 2023 08:47:57 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1682081274;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=n2wumEyIrMp65YlUcNVMQql+XdLQLa473B/WTynm0Ko=;
 b=LzRfs0KeQcK5IqhLYHu8pDZFcedax5/eWeK9vOV3x+IPRsk5oONVun8cLRm7FGWJBLvoPm
 wZVX7J5bMwU/Nk/B/fmL8oS+vZCj4R/MNaO7s243iXmXi9inb6SYeo8el1nUcCc20XhKky
 H16Ml0VlckIJ5P3B2G3iLhfiLgtASSc=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-132-yMdn5VfUOwGmyFGXqB8HyQ-1; Fri, 21 Apr 2023 08:47:53 -0400
X-MC-Unique: yMdn5VfUOwGmyFGXqB8HyQ-1
Received: by mail-wm1-f71.google.com with SMTP id
 5b1f17b1804b1-3f080f53c49so9964455e9.0
 for <qemu-devel@nongnu.org>; Fri, 21 Apr 2023 05:47:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682081272; x=1684673272;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=n2wumEyIrMp65YlUcNVMQql+XdLQLa473B/WTynm0Ko=;
 b=DfpeH0dYY4Tm1OqxJDJedhk08p+XuMe/9TmkhpITkXQcCQPlEycinKt3qL6w9EA//2
 SDWUzTg8D52KtP/3MFxtyj27XjDP2792yBfJSKO5eP88soZJdaIWF8T7WakMFBbQyyVR
 j6kpILF7qsWOazz1TlXo14Q/XuU46sTWc1jhmemM8+DuN5wSZocRFB7CKvkM+K2RLrLm
 etcShx82/q4ENLZ4SMpeqcv4JOFSn9abCnZcYxc+aPACQoiG77Vf/ee58CcbBCP/yexb
 sVdM7C6aiWGntrj79y6J42X68OMKuEZJ52BgAGPCFybfuyWgY+ELKe121GGGlIO75c2g
 AM1Q==
X-Gm-Message-State: AAQBX9d9+YTW2N30yLgBM4+8KPYeCspvOOykATZCUaM5S34gTFrMm5ZH
 UvOpDHriRSf3ZOmahTviG8eTb5VTrE1Ryybm12Rv/lX3K4ChFhCQBC6lC9JjDWV4iS8z2WYC61A
 JdN0CmAG3DZDRNEE=
X-Received: by 2002:a7b:c004:0:b0:3f1:72d4:b271 with SMTP id
 c4-20020a7bc004000000b003f172d4b271mr2011934wmb.3.1682081271990; 
 Fri, 21 Apr 2023 05:47:51 -0700 (PDT)
X-Google-Smtp-Source: AKy350b9Rgb6fE0FOL8C58OrftPM7OfTkXs0qA53H8BhW1yKChfG3o0vvLGC5zGdvIC9hXiGUSIbCg==
X-Received: by 2002:a7b:c004:0:b0:3f1:72d4:b271 with SMTP id
 c4-20020a7bc004000000b003f172d4b271mr2011916wmb.3.1682081271687; 
 Fri, 21 Apr 2023 05:47:51 -0700 (PDT)
Received: from [192.168.0.3] (ip-109-43-178-20.web.vodafone.de.
 [109.43.178.20]) by smtp.gmail.com with ESMTPSA id
 o3-20020a05600c378300b003ef5f77901dsm4694648wmr.45.2023.04.21.05.47.50
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 21 Apr 2023 05:47:51 -0700 (PDT)
Message-ID: <68b3e79b-bd1a-406d-f974-8a824331dffd@redhat.com>
Date: Fri, 21 Apr 2023 14:47:50 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH 1/2] hw/pci-bridge: fix cast for pxb-cxl dev realization
Content-Language: en-US
To: =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 qemu-devel@nongnu.org
Cc: Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Beraldo Leal <bleal@redhat.com>, Eduardo Lima <elima@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Jonathan Cameron <jonathan.cameron@huawei.com>,
 Peter Maydell <peter.maydell@linaro.org>
References: <20230421124142.2640825-1-berrange@redhat.com>
 <20230421124142.2640825-2-berrange@redhat.com>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <20230421124142.2640825-2-berrange@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
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

On 21/04/2023 14.41, Daniel P. Berrangé wrote:
> Build QEMU --enable-qom-cast-debug and run a VM creating
> a pxb-cxl device:
> 
>   $ qemu-system-x86_64 -machine q35,cxl=on -device pxb-cxl,bus=pcie.0
>   hw/pci-bridge/pci_expander_bridge.c:54:PXB_DEV: Object 0x555558313760 is not an instance of type pxb
> 
> This is seen when running 'tests/qtest/cxl-test'
> 
> Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
> ---
>   hw/pci-bridge/pci_expander_bridge.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/hw/pci-bridge/pci_expander_bridge.c b/hw/pci-bridge/pci_expander_bridge.c
> index ead33f0c05..a78327b5f2 100644
> --- a/hw/pci-bridge/pci_expander_bridge.c
> +++ b/hw/pci-bridge/pci_expander_bridge.c
> @@ -311,7 +311,7 @@ static void pxb_cxl_dev_reset(DeviceState *dev)
>        * The CXL specification allows for host bridges with no HDM decoders
>        * if they only have a single root port.
>        */
> -    if (!PXB_DEV(dev)->hdm_for_passthrough) {
> +    if (!PXB_CXL_DEV(dev)->hdm_for_passthrough) {
>           dsp_count = pcie_count_ds_ports(hb->bus);
>       }
>       /* Initial reset will have 0 dsp so wait until > 0 */

The patch is already available here:

 
https://lore.kernel.org/qemu-devel/20230420142750.6950-2-Jonathan.Cameron@huawei.com/

  Thomas


