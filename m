Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A8D096F0275
	for <lists+qemu-devel@lfdr.de>; Thu, 27 Apr 2023 10:23:37 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1prwu2-0000R8-KA; Thu, 27 Apr 2023 04:23:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1prwu0-0000Qz-LJ
 for qemu-devel@nongnu.org; Thu, 27 Apr 2023 04:22:56 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1prwty-0000ai-Cd
 for qemu-devel@nongnu.org; Thu, 27 Apr 2023 04:22:56 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1682583771;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=udF4JGUg6NgBe6ynHJAmrccMdX1ZlXQsSfyO6WtRQ6w=;
 b=evTTlmoSpsUJteqOqMAGkx9BEICCrLn516rw+0bsJTQyCauCuGD7ldZBWrZuKCCxjWMscA
 7HL4kUQ+gn8tXGBHFvqhWNnXcaB8UkgBYHs9BbQFq0xMdkyDuhLd01CoavjMkRAjCkO2vP
 +kAcKEeoiHVlxs4SbhqSmQ2wxCcGx8U=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-67-CwtHJA0PNva_txQ2TqLbCQ-1; Thu, 27 Apr 2023 04:22:50 -0400
X-MC-Unique: CwtHJA0PNva_txQ2TqLbCQ-1
Received: by mail-wr1-f71.google.com with SMTP id
 ffacd0b85a97d-30479b764f9so1740229f8f.0
 for <qemu-devel@nongnu.org>; Thu, 27 Apr 2023 01:22:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682583768; x=1685175768;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=udF4JGUg6NgBe6ynHJAmrccMdX1ZlXQsSfyO6WtRQ6w=;
 b=MlOweXixLlhIdUtR/7w4hc+0nRvfGHLJKTSc01oXOZ9SKa8ivbnPGXDwdpLohS+ad9
 hxUBD7biQhhbYXWI/tx/moGImk2JX4T0HUZqdiGFK284LLFB9nvOav3egtTdJrSP4yUz
 7YlyxkoNv2N6VWy7blve/vdtfgn6tmlYJBklvLWNG4vwcE83UutcNijGdMXJQ2Mt5zFp
 br8O8Us7jRQVvxucPa/HIeoVUWtoD9qo+NLkZyvbfhkf7qH8UWsAY8vGfnzH7io9BjFa
 QK8FjxMz48YgtaC9ZyyxVC4yLyc5u6AgF+mIZIqb1MoQNj+AhhtxmsqbzO7VtRmoq3rZ
 MkkQ==
X-Gm-Message-State: AC+VfDxNUl6zOxVMxcKrtdjZodO5HaCoJMJLhq146LdMo2wrHLPoewJ7
 P3/4lLXYrsP4Hj94HD/ad8wVwNIIrRIlLJhICp+4Vb+HdxZfYUCWkZqN/+cdcn/5ppaEJgt9p/P
 hAulsXWET7Qd7r94=
X-Received: by 2002:a5d:43c3:0:b0:2f2:c46b:1eb5 with SMTP id
 v3-20020a5d43c3000000b002f2c46b1eb5mr585794wrr.59.1682583768804; 
 Thu, 27 Apr 2023 01:22:48 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ6u9MQKjBkTessLmpJ3GDfvzOmvirMsNX/szYmXjhTE4DxVTTHAMN+LmqhVVspVp8/9Hv+1kA==
X-Received: by 2002:a5d:43c3:0:b0:2f2:c46b:1eb5 with SMTP id
 v3-20020a5d43c3000000b002f2c46b1eb5mr585772wrr.59.1682583768522; 
 Thu, 27 Apr 2023 01:22:48 -0700 (PDT)
Received: from [10.33.192.205] (nat-pool-str-t.redhat.com. [149.14.88.106])
 by smtp.gmail.com with ESMTPSA id
 i1-20020a05600011c100b002cff06039d7sm17755129wrx.39.2023.04.27.01.22.47
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 27 Apr 2023 01:22:47 -0700 (PDT)
Message-ID: <19584145-19d1-9e54-bb63-4bc0a06baea1@redhat.com>
Date: Thu, 27 Apr 2023 10:22:46 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [RFC PATCH v2] hw/pci-bridge: Fix release ordering by embedding
 PCIBridgeWindows within PCIBridge
Content-Language: en-US
To: Jonathan Cameron <Jonathan.Cameron@huawei.com>, qemu-devel@nongnu.org,
 Peter Maydell <peter.maydell@linaro.org>, Paolo Bonzini <pbonzini@redhat.com>
Cc: Igor Mammedov <imammedo@redhat.com>, "Michael S . Tsirkin"
 <mst@redhat.com>, Fan Ni <fan.ni@samsung.com>, linuxarm@huawei.com,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
References: <20230421122550.28234-1-Jonathan.Cameron@huawei.com>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <20230421122550.28234-1-Jonathan.Cameron@huawei.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -36
X-Spam_score: -3.7
X-Spam_bar: ---
X-Spam_report: (-3.7 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.171,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-1.422, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
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

On 21/04/2023 14.25, Jonathan Cameron wrote:
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

I'm pretty ignorant when it comes to flatviews etc., but from my distant 
point of view, this rather sounds like a workaround than a real fix ... 
anyway, embedding the structure instead of allocating it is certainly a good 
change anyway, and it fixes the problem for this rather obscure scenario, so 
I'm fine if we only go ahead with this patch.

Reviewed-by: Thomas Huth <thuth@redhat.com>


