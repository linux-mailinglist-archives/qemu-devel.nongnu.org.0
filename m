Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 663366B8B36
	for <lists+qemu-devel@lfdr.de>; Tue, 14 Mar 2023 07:28:26 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pby8g-0000Xv-VA; Tue, 14 Mar 2023 02:28:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pby8e-0000Xm-To
 for qemu-devel@nongnu.org; Tue, 14 Mar 2023 02:28:00 -0400
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pby8d-00008O-Bb
 for qemu-devel@nongnu.org; Tue, 14 Mar 2023 02:28:00 -0400
Received: by mail-wm1-x335.google.com with SMTP id
 o38-20020a05600c512600b003e8320d1c11so171586wms.1
 for <qemu-devel@nongnu.org>; Mon, 13 Mar 2023 23:27:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1678775277;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=qYns6uzT2QxbBcCa0vS4G5/3NPd0+7JxpjBnyynmpEI=;
 b=JJB5HQtsj1ZsHRO5TJfcq+imgp+ogT/jaIbiVkM/AbGfNtHTHz+JMv8xZzpZ3gXU7M
 IJPQd6sAXBprY0FMcyK39V8zBLi7U/p9UyoggUB9xlr/SARSsvbE6UHc2ZLMexnb5mKr
 4X2MMbbjtSxzA9NYbupghcBAdn5ZdnelpfE+5G0ZWbaSLCth4pUEx21KEjkP90i3a7T+
 XD7xlGvdya/c8tlqEvS1Ft9id+mO4EUzlIOcdTijArLRJ0dRxZIaKrAmqaKhrD2Frx+x
 YfHjte+sLaXlPAXibi08WD27iVKR3wzr4twkD4uNnzcEBTwpAKaeN72hgRtYDBtvByPf
 jYiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678775277;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=qYns6uzT2QxbBcCa0vS4G5/3NPd0+7JxpjBnyynmpEI=;
 b=I4qbCq7yOehz/s+U7jKln6bMsI6Zfjp/sncielSlUJs1ZK3nWbE5mKpU18zrnGyVuq
 PhT+l2QS61Qer+NF9OJSuFWOl6deMfclu+HtvZh5FwbdP/JgKGYUDNb9o7oBKv3bKJde
 mLz41Cba7tUAm5hAAH+INm8eNcmYe7kOKyjWCMCbSt5jsuN1A50q06qEY1VYRRVyHwEN
 qLeU27H8WzyCEEOM04hnQ1ZONFSVjk0BFv4CnVG30Ega/YCa6gVwjkUg6Aw4Y/S5eHcx
 2W3cq3PhGP2GauQ02DXsveAgdAZLi+1JRy0puVuMo1y8CnZQWNxIeMUX/5z6WLzO4LVk
 Al5w==
X-Gm-Message-State: AO0yUKUVn2ExUhO6dYrcFF68wRUYZPOMHqlPbCmxP2DGsKiCV3JcdsyK
 rAbA6GpdWKHxuvqCI3J7HebdSQ==
X-Google-Smtp-Source: AK7set/2WV9vLrL2lxn/B2smMYJWPlqkYBtHU+khuGwNoQ8U9m4vKGkBS5HSDjLCmRiTkJDYudjifg==
X-Received: by 2002:a05:600c:3ac9:b0:3eb:966f:5811 with SMTP id
 d9-20020a05600c3ac900b003eb966f5811mr13273971wms.3.1678775276901; 
 Mon, 13 Mar 2023 23:27:56 -0700 (PDT)
Received: from [192.168.150.175] (180.red-88-28-30.dynamicip.rima-tde.net.
 [88.28.30.180]) by smtp.gmail.com with ESMTPSA id
 20-20020a05600c021400b003e20970175dsm1765992wmi.32.2023.03.13.23.27.53
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 13 Mar 2023 23:27:56 -0700 (PDT)
Message-ID: <c5332793-f062-e4e7-9579-8eeb416e57ab@linaro.org>
Date: Tue, 14 Mar 2023 07:27:52 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.8.0
Subject: Re: [PATCH v4 5/6] hw/cxl: Add poison injection via the mailbox.
Content-Language: en-US
To: Jonathan Cameron <Jonathan.Cameron@huawei.com>, qemu-devel@nongnu.org,
 Michael Tsirkin <mst@redhat.com>, Fan Ni <fan.ni@samsung.com>
Cc: linux-cxl@vger.kernel.org, linuxarm@huawei.com,
 Ira Weiny <ira.weiny@intel.com>,
 Alison Schofield <alison.schofield@intel.com>,
 Michael Roth <michael.roth@amd.com>, Dave Jiang <dave.jiang@intel.com>,
 Markus Armbruster <armbru@redhat.com>,
 =?UTF-8?Q?Daniel_P_=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 Eric Blake <eblake@redhat.com>, Mike Maslenkin <mike.maslenkin@gmail.com>,
 =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>,
 Thomas Huth <thuth@redhat.com>
References: <20230303150908.27889-1-Jonathan.Cameron@huawei.com>
 <20230303150908.27889-6-Jonathan.Cameron@huawei.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230303150908.27889-6-Jonathan.Cameron@huawei.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::335;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x335.google.com
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

On 3/3/23 16:09, Jonathan Cameron wrote:
> Very simple implementation to allow testing of corresponding
> kernel code. Note that for now we track each 64 byte section
> independently.  Whilst a valid implementation choice, it may
> make sense to fuse entries so as to prove out more complex
> corners of the kernel code.
> 
> Reviewed-by: Ira Weiny <ira.weiny@intel.com>
> Signed-off-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>
> ---
> v4: No change
> ---
>   hw/cxl/cxl-mailbox-utils.c | 41 ++++++++++++++++++++++++++++++++++++++
>   1 file changed, 41 insertions(+)


> +static CXLRetCode cmd_media_inject_poison(struct cxl_cmd *cmd,
> +                                          CXLDeviceState *cxl_dstate,
> +                                          uint16_t *len)
> +{
> +    CXLType3Dev *ct3d = container_of(cxl_dstate, CXLType3Dev, cxl_dstate);

This makes me wonder why CXLDeviceState isn't QDev based.

(Also, why include/hw/cxl/cxl_device.h is under GPL-2.0-only license?)

