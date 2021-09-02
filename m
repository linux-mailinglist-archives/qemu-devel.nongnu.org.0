Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 596813FEB77
	for <lists+qemu-devel@lfdr.de>; Thu,  2 Sep 2021 11:41:50 +0200 (CEST)
Received: from localhost ([::1]:49902 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mLjED-0001Ub-43
	for lists+qemu-devel@lfdr.de; Thu, 02 Sep 2021 05:41:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54362)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1mLj9F-0002bT-Pm
 for qemu-devel@nongnu.org; Thu, 02 Sep 2021 05:36:42 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:49283)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1mLj9E-0005CS-Bp
 for qemu-devel@nongnu.org; Thu, 02 Sep 2021 05:36:41 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1630575398;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=h5E4aoy6GDYyHU2HoBN+ICe1KrCcbGlyC3yCmM84624=;
 b=dwjzolyUibPwSFXIKc0UPpxkJNyNdgf5n+74855Wh8fl+K+93OEWYVmIMxmfgYlm9Peqvv
 Z4FPhasswmH+LGfperEX9OovzOHbKgsyVlGH5rwGdpx7Bd1RzK/r/nUVTHaKXnWatrA9gC
 8vxiLYgTO6XRmTkP3IB2U3TDmS7yDQk=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-35-HND0PEv6O3KXioHS7TUeAQ-1; Thu, 02 Sep 2021 05:36:37 -0400
X-MC-Unique: HND0PEv6O3KXioHS7TUeAQ-1
Received: by mail-wr1-f70.google.com with SMTP id
 z15-20020adff74f000000b001577d70c98dso340467wrp.12
 for <qemu-devel@nongnu.org>; Thu, 02 Sep 2021 02:36:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:reply-to:subject:to:cc:references:from
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-transfer-encoding:content-language;
 bh=h5E4aoy6GDYyHU2HoBN+ICe1KrCcbGlyC3yCmM84624=;
 b=EEpmzaIRSKfgH6N0takz7ruBfjtY4HOJlkTie4gJZ7oqEBLD0DbxOFdlc7MaWLrUkq
 6cmfnM/kmko0pjZh0Zqg8f5zS613a5Nmg3JMytcI9TFhXnM3dBGPVvUqyU6qiVrrh1Af
 z0YeAdeCc1ugFE77WmEgw5PJ7HWFX8WL0+CzqWxI0e/v+jmzTrRllXSsMTmqhbc2NGGC
 mlrrJ8k5BKJidFhLjiVO2wv39Y2UbuboVwVN3rj4W3t9kwGSsD64fpBnhob0BuIyzInA
 yCVAcklivNBJVq2xyQsrLehES39zuHbOveBZXmSo3Gw5aK4O5gRITyUz3GHJw9LBbChg
 QtKw==
X-Gm-Message-State: AOAM5325+2ozyS1EjuXHvPwDxd2Kh5vpVh+S1lb6V83d19EI/Nj7lQr1
 dPiTc3M9nUpdBJrC+YadN0sObmK9Tt/N8mavVACH0acsCMCHPW7/eweNSJzjptljw/WE+hctNSs
 u1j7EbTdcuQyzRmQ=
X-Received: by 2002:a5d:6352:: with SMTP id b18mr2528889wrw.116.1630575396546; 
 Thu, 02 Sep 2021 02:36:36 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwCna7QYSI91ultBmfik2JIREcMQxJcv1snyKuYJ6fl35+JWeY+XTWwV7JPX3+6JCIFUHnOsg==
X-Received: by 2002:a5d:6352:: with SMTP id b18mr2528865wrw.116.1630575396305; 
 Thu, 02 Sep 2021 02:36:36 -0700 (PDT)
Received: from ?IPv6:2a01:e0a:59e:9d80:527b:9dff:feef:3874?
 ([2a01:e0a:59e:9d80:527b:9dff:feef:3874])
 by smtp.gmail.com with ESMTPSA id x21sm1132426wmi.15.2021.09.02.02.36.35
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 02 Sep 2021 02:36:35 -0700 (PDT)
Subject: Re: [PATCH 6/6] pc: Allow instantiating a virtio-iommu device
To: Jean-Philippe Brucker <jean-philippe@linaro.org>
References: <20210810084505.2257983-1-jean-philippe@linaro.org>
 <20210810084505.2257983-7-jean-philippe@linaro.org>
 <41720de5-ce29-dd79-2911-d974408af544@redhat.com> <YSjoCW5z1xbYL4Gp@larix>
From: Eric Auger <eric.auger@redhat.com>
Message-ID: <a6d02a90-4991-4577-909b-3cc38c49f71e@redhat.com>
Date: Thu, 2 Sep 2021 11:36:34 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <YSjoCW5z1xbYL4Gp@larix>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eric.auger@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Received-SPF: pass client-ip=170.10.129.124;
 envelope-from=eric.auger@redhat.com; helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.392,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-1.029, RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Reply-To: eric.auger@redhat.com
Cc: peter.maydell@linaro.org, ehabkost@redhat.com, mst@redhat.com,
 richard.henderson@linaro.org, qemu-devel@nongnu.org, shannon.zhaosl@gmail.com,
 qemu-arm@nongnu.org, pbonzini@redhat.com, imammedo@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi Jean,

On 8/27/21 3:26 PM, Jean-Philippe Brucker wrote:
> On Tue, Aug 17, 2021 at 04:11:49PM +0200, Eric Auger wrote:
>> Hi Jean,
>>
>> On 8/10/21 10:45 AM, Jean-Philippe Brucker wrote:
>>> From: Eric Auger <eric.auger@redhat.com>
>>>
>>> Add a hotplug handler for virtio-iommu on x86 and set the necessary
>>> reserved region property. On x86, the [0xfee00000, 0xfeefffff] DMA
>>> region is reserved for MSIs. DMA transactions to this range either
>>> trigger IRQ remapping in the IOMMU or bypasses IOMMU translation.
>>>
>>> Although virtio-iommu does not support IRQ remapping it must be informed
>>> of the reserved region so that it can forward DMA transactions targeting
>>> this region.
>>>
>>> Signed-off-by: Eric Auger <eric.auger@redhat.com>
>>> Signed-off-by: Jean-Philippe Brucker <jean-philippe@linaro.org>
>> I think we need to handle the case where the end-user gets lost with
>> iommu options and use an invalid combination such as
>>
>> -M q35,iommu=on,int_remap=on,kernel_irqchip=off -device -device virtio-iommu-pci
> I guess that would be
> "-M q35,kernel_irqchip=off -device intel-iommu,intremap=on -device virtio-iommu-pci"
>
> I'll add the checks, similar to the one in x86_iommu_set_default().
yes that what I meant sorry.
>
>> We may also document somewhere that the virtio-iommu-pci
>> does not support irq remapping as this may be an important limitation on x86.
> I'll mention it in the commit message, unless you had another place in
> mind?

you may add an entry in qemu-options.hx too as Peter did for the intel
iommu in
7395b3e3e7  docs: Add '-device intel-iommu' entry (7 weeks ago) <Peter Xu>

Thanks

Eric
>
> Thanks,
> Jean
>


