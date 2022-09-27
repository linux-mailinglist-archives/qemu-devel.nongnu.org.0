Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 623FC5EC96B
	for <lists+qemu-devel@lfdr.de>; Tue, 27 Sep 2022 18:26:03 +0200 (CEST)
Received: from localhost ([::1]:44638 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1odDPG-0003V9-Ae
	for lists+qemu-devel@lfdr.de; Tue, 27 Sep 2022 12:26:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51782)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eauger@redhat.com>) id 1odBqx-0001V9-4J
 for qemu-devel@nongnu.org; Tue, 27 Sep 2022 10:46:31 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:46257)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eauger@redhat.com>) id 1odBgJ-000155-7r
 for qemu-devel@nongnu.org; Tue, 27 Sep 2022 10:35:32 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1664289330;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Zbffyhg+549eqrF9+cFfl/7xv3PfCL4Z56gS3trm1Vs=;
 b=iQYNRnZZnaTI5Axwhmh8p32MZOSH5lR/wmiItI9vQ345+xzMEJrd+T2FN+6VAXixwqoLGV
 ecgKX246DG+AmcvNt+lK3VYZFTEK5F+nQvm2C9K2htC87Bnh3krL0arbQYU9z8Yux7lVZO
 HyqJyIVAuc0dspL4pjt6UEby8eUwYz8=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-330-hvqpFpiDPSqxFeWqKYihhQ-1; Tue, 27 Sep 2022 10:35:28 -0400
X-MC-Unique: hvqpFpiDPSqxFeWqKYihhQ-1
Received: by mail-ed1-f72.google.com with SMTP id
 w17-20020a056402269100b0045249bc17a9so7903855edd.9
 for <qemu-devel@nongnu.org>; Tue, 27 Sep 2022 07:35:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date;
 bh=Zbffyhg+549eqrF9+cFfl/7xv3PfCL4Z56gS3trm1Vs=;
 b=jrcNYD1CVTNH7PhhCOYBwK7Z0OyXQcihCkllPuSPudefF1HD+6V2p0W6VQLLil9nP1
 Re7yQVERufUs2K0badxw8WOYNxme6uoPpYq5tcehGMHA3WKmjZQBjgtE8UWE6oSErbDn
 uK1i9i17mfXW1OV3bWdPRrohFnPjN+DoYgDXWbpO0UVRW1T+gsWNyiY9zcESzBvQfRfH
 +n+eyvJnmgTc3xwWoexjh0nrbLSBNgLPViowT2eGlyvvJDubDBpnSkd6Zr6kTDl0Q9es
 r2IH0/1Eh5VPWSd92qbevP1k6S6HNGvrtoY5dWa5yZBIIoKBX11SKW/YBtbnpISLwme/
 s9jg==
X-Gm-Message-State: ACrzQf0Cca+A68d11Rnv0IYLv4FBztg8nSSnyJKsv6U77mFy/FIL4SXt
 aOKtjjB1jADaQSmNIGqsaqGJA2N6Srlq2rrl+8tYoT/M1V6cJ/o62F28eAoUPha3yg7cQGyKeZq
 cZkA3k38+TEqP258=
X-Received: by 2002:a50:aa99:0:b0:457:c7b4:6699 with SMTP id
 q25-20020a50aa99000000b00457c7b46699mr1984978edc.115.1664289327486; 
 Tue, 27 Sep 2022 07:35:27 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM56y9JZA8PQjnbNpqgimIiYn1VUYYadwFDMasIBY3JewSg2VB62H5efOgCX7A/9NPNmJ1OEXg==
X-Received: by 2002:a50:aa99:0:b0:457:c7b4:6699 with SMTP id
 q25-20020a50aa99000000b00457c7b46699mr1984949edc.115.1664289327133; 
 Tue, 27 Sep 2022 07:35:27 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:59e:9d80:527b:9dff:feef:3874?
 ([2a01:e0a:59e:9d80:527b:9dff:feef:3874])
 by smtp.gmail.com with ESMTPSA id
 a16-20020a50c310000000b00452e7ae2214sm1402417edb.42.2022.09.27.07.35.25
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 27 Sep 2022 07:35:26 -0700 (PDT)
Message-ID: <5641321a-4bec-2ca9-bb14-d5ed883a9ded@redhat.com>
Date: Tue, 27 Sep 2022 16:35:25 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v2 7/8] hw/arm/virt: Fix devicetree warnings about the
 virtio-iommu node
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>,
 Jean-Philippe Brucker <jean-philippe@linaro.org>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, robh+dt@kernel.org
References: <20220927100347.176606-1-jean-philippe@linaro.org>
 <20220927100347.176606-8-jean-philippe@linaro.org>
 <CAFEAcA8_mLVgvorF12qBMAW5NoZT2mXAzjfavCbDtcZjzcprow@mail.gmail.com>
From: Eric Auger <eauger@redhat.com>
In-Reply-To: <CAFEAcA8_mLVgvorF12qBMAW5NoZT2mXAzjfavCbDtcZjzcprow@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=eauger@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -44
X-Spam_score: -4.5
X-Spam_bar: ----
X-Spam_report: (-4.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-2.319, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi,

On 9/27/22 13:46, Peter Maydell wrote:
> On Tue, 27 Sept 2022 at 11:12, Jean-Philippe Brucker
> <jean-philippe@linaro.org> wrote:
>>
>> The "PCI Bus Binding to: IEEE Std 1275-1994" defines the compatible
>> string for a PCIe bus or endpoint as "pci<vendorid>,<deviceid>" or
>> similar. Since the initial binding for PCI virtio-iommu didn't follow
>> this rule, it was modified to accept both strings and ensure backward
>> compatibility. Also, the unit-name for the node should be
>> "device,function".
>>
>> Fix corresponding dt-validate and dtc warnings:
>>
>>   pcie@10000000: virtio_iommu@16:compatible: ['virtio,pci-iommu'] does not contain items matching the given schema
>>   pcie@10000000: Unevaluated properties are not allowed (... 'virtio_iommu@16' were unexpected)
>>   From schema: linux/Documentation/devicetree/bindings/pci/host-generic-pci.yaml
>>   virtio_iommu@16: compatible: 'oneOf' conditional failed, one must be fixed:
>>         ['virtio,pci-iommu'] is too short
>>         'pci1af4,1057' was expected
>>   From schema: dtschema/schemas/pci/pci-bus.yaml
>>
>>   Warning (pci_device_reg): /pcie@10000000/virtio_iommu@16: PCI unit address format error, expected "2,0"
>>
>> Signed-off-by: Jean-Philippe Brucker <jean-philippe@linaro.org>
>> ---
>>  hw/arm/virt.c | 5 +++--
>>  1 file changed, 3 insertions(+), 2 deletions(-)
>>
>> diff --git a/hw/arm/virt.c b/hw/arm/virt.c
>> index 2de16f6324..5e16d54bbb 100644
>> --- a/hw/arm/virt.c
>> +++ b/hw/arm/virt.c
>> @@ -1372,14 +1372,15 @@ static void create_smmu(const VirtMachineState *vms,
>>
>>  static void create_virtio_iommu_dt_bindings(VirtMachineState *vms)
>>  {
>> -    const char compat[] = "virtio,pci-iommu";
>> +    const char compat[] = "virtio,pci-iommu\0pci1af4,1057";
>>      uint16_t bdf = vms->virtio_iommu_bdf;
> 
> PCI_DEVICE_ID_VIRTIO_IOMMU is listed in include/hw/pci/pci.h
> as 0x1014, so where does 1057 come from? (This is a hex value,
> right?)
the virtio spec states:
The PCI Device ID is calculated by adding 0x1040 to the Virtio Device ID
(this IOMMU device ID is 0d23 = 0x17 for the virtio-iommu device, also
found in include/uapi/linux/virtio_ids.h) so 0x1057 above looks correct

note that in docs/specs/pci-ids.txt there are a bunch of other device
ids not documented (virtio-mem, pmem)

What I don't get anymore is the device id in qemu include/hw/pci/pci.h

Thanks

Eric
> 
> docs/specs/pci-ids.txt doesn't list either 1014 or 1057, so
> I guess we forgot to update that...
> 
> thanks
> -- PMM
> 


