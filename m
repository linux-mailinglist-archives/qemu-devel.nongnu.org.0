Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 594B257DB78
	for <lists+qemu-devel@lfdr.de>; Fri, 22 Jul 2022 09:44:06 +0200 (CEST)
Received: from localhost ([::1]:33350 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oEnKO-0001fB-TD
	for lists+qemu-devel@lfdr.de; Fri, 22 Jul 2022 03:44:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52576)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1oEn64-0001Vb-KU
 for qemu-devel@nongnu.org; Fri, 22 Jul 2022 03:29:16 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:30380)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1oEn60-0003jn-9S
 for qemu-devel@nongnu.org; Fri, 22 Jul 2022 03:29:14 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1658474951;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=GU0ainywiAqDpCYcz3/XhSR6JnBrizZS7EI4BATV8/c=;
 b=GdW++bmeKEWMZ/Kn0BLZWLKr/hGP8J9pjtLPCmgCAh27Rb6phwvJhm2v22BfYjQ5j43Eiw
 lItk7Fn5HsKPfIQe7b2A0vcqazOp3FhkFV0PaHyQUV3BP79DHagfgR4jR+GdZwELPASlA2
 ZI7yw1ND8LF40jl+uJ3XSxfLrwpqLiU=
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-606-Tc0rTMCRPBy3Na6QrQNP4w-1; Fri, 22 Jul 2022 03:29:08 -0400
X-MC-Unique: Tc0rTMCRPBy3Na6QrQNP4w-1
Received: by mail-qk1-f197.google.com with SMTP id
 w22-20020a05620a425600b006b5f48556cbso3144692qko.17
 for <qemu-devel@nongnu.org>; Fri, 22 Jul 2022 00:29:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent
 :content-language:to:cc:references:from:subject:in-reply-to
 :content-transfer-encoding;
 bh=GU0ainywiAqDpCYcz3/XhSR6JnBrizZS7EI4BATV8/c=;
 b=Gk0i+Xem9vsI3IrMjDZD8uzbbs/XFBC5tksvQJ+FTQNVwFwsNam1IEXB8LcNBmlEbe
 hLUqQlDTQlJzrTaXdrsT0622C86V9+AkOrnVMSrkoo+YoCxHWZ9C8IuJHjscVM0Dc0qL
 ikedLmUefLofT0T3r2/w7siz5+7/JLM4e8hBtXnJr1XYzmDwgv3dpqlRkngn5o9acmVt
 DmImuotgC47sAmQXS7U4KmLxWlsO10hpZ/BB8Es7gIwowNMtraoP8NLUTDi+sTGNcUWG
 uBFE6BgIFlhf+aqrH6ExXNYO2iS6btEulmNsz9otyYGWxg2yS5EubWXlZy21YXvy52Hv
 RS8w==
X-Gm-Message-State: AJIora8OJqmxT1wn0byTvs/BXlitG6nNvjTc1TLO2jDn0hM/BhaHZyzp
 ywb+0IRk48R4dRGxA7HIgpdhvvR0OkcM9F6IYeYRjMSHNqKsFO6/6xjBmiheRwU4Llp0HFQnRjO
 fqnXJHMmU6zlTJLg=
X-Received: by 2002:ac8:5f08:0:b0:31f:1a4e:2727 with SMTP id
 x8-20020ac85f08000000b0031f1a4e2727mr1938600qta.414.1658474948451; 
 Fri, 22 Jul 2022 00:29:08 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1uIWIfF+AYladgPnZPBjcTAqFOcdbf0jrhVz4x7m/Xou1bSJsDeXH+q3plMJmbnGJwuqTPRzw==
X-Received: by 2002:ac8:5f08:0:b0:31f:1a4e:2727 with SMTP id
 x8-20020ac85f08000000b0031f1a4e2727mr1938586qta.414.1658474948215; 
 Fri, 22 Jul 2022 00:29:08 -0700 (PDT)
Received: from [192.168.0.5] (ip-109-43-176-42.web.vodafone.de.
 [109.43.176.42]) by smtp.gmail.com with ESMTPSA id
 j8-20020ac84408000000b0031ee2080c73sm2477000qtn.54.2022.07.22.00.29.04
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 22 Jul 2022 00:29:07 -0700 (PDT)
Message-ID: <670414db-8d17-63d4-5b20-fcfcd0590553@redhat.com>
Date: Fri, 22 Jul 2022 09:28:57 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Content-Language: en-US
To: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>
Cc: Roman Kagan <rvkagan@yandex-team.ru>, qemu-devel@nongnu.org,
 Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>,
 Laurent Vivier <lvivier@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>, yc-core@yandex-team.ru,
 Paolo Bonzini <pbonzini@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Gonglei <arei.gonglei@huawei.com>
References: <20220720102555.874394-1-rvkagan@yandex-team.ru>
 <Ytfcivbtj8+JnLfz@redhat.com> <YtfgQN+BQ8Egn0ha@rvkaganb>
 <5bc2fcee-2c5d-c400-5992-e2b4ce828477@ilande.co.uk>
 <Ytlii7t0rERVJBXo@rvkaganb>
 <f85ae904-4a31-141d-17dd-43c5a27d9b07@ilande.co.uk>
 <Ytl3SKpbnp8Twtkq@redhat.com>
 <9a3f311e-398e-c36f-a1d2-33c23aa163dc@ilande.co.uk>
From: Thomas Huth <thuth@redhat.com>
Subject: Re: [PATCH v3] hw/pci/pci_bridge: ensure PCIe slots have only one slot
In-Reply-To: <9a3f311e-398e-c36f-a1d2-33c23aa163dc@ilande.co.uk>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

On 21/07/2022 18.05, Mark Cave-Ayland wrote:
> On 21/07/2022 16:56, Daniel P. Berrangé wrote:
> 
>> On Thu, Jul 21, 2022 at 04:51:51PM +0100, Mark Cave-Ayland wrote:
>>> On 21/07/2022 15:28, Roman Kagan wrote:
>>>
>>> (lots cut)
>>>
>>>> In the guest (Fedora 34):
>>>>
>>>> [root@test ~]# lspci -tv
>>>> -[0000:00]-+-00.0  Intel Corporation 82G33/G31/P35/P31 Express DRAM 
>>>> Controller
>>>>              +-01.0  Device 1234:1111
>>>>              +-02.0  Red Hat, Inc. QEMU XHCI Host Controller
>>>>              +-05.0-[01]----00.0  Red Hat, Inc. Virtio block device
>>>>              +-05.1-[02]----00.0  Red Hat, Inc. Virtio network device
>>>>              +-05.2-[03]--
>>>>              +-05.3-[04]--
>>>>              +-1f.0  Intel Corporation 82801IB (ICH9) LPC Interface 
>>>> Controller
>>>>              \-1f.3  Intel Corporation 82801I (ICH9 Family) SMBus 
>>>> Controller
>>>>
>>>> Changing addr of the second disk from 4 to 0 makes it appear in the
>>>> guest.
>>>>
>>>> What exactly do you find odd?
>>>
>>> Thanks for this, the part I wasn't sure about was whether the device ids in
>>> the command line matched the primary PCI bus or the secondary PCI bus.
>>>
>>> In that case I suspect that the enumeration of non-zero PCIe devices fails
>>> in Linux because of the logic here:
>>> https://github.com/torvalds/linux/blob/master/drivers/pci/probe.c#L2622.
>>
>> Just above that though is logic that handles 'pci=pcie_scan_all'
>> kernel parameter, to make it look for non-zero devices.
>>
>>> I don't have a copy of the PCIe specification, but assuming the comment is
>>> true then your patch looks correct to me. I think it would be worth adding a
>>> similar comment and reference to your patch to explain why the logic is
>>> required, which should also help the PCI maintainers during review.
>>
>> The docs above with the pci=pcie_scan_all suggest it is unusual but not
>> forbidden.
> 
> That's interesting as I read it completely the other way around, i.e. PCIe 
> downstream ports should only have device 0 and the PCI_SCAN_ALL_PCIE_DEVS 
> flag is there for broken/exotic hardware :)
> 
> Perhaps if someone has a copy of the PCIe specification they can check the 
> wording in section 7.3.1 to see exactly what the correct behaviour should be?

I've got an older version here... it talks about the "Alternative Routing-ID 
Interpretation" (ARI) there:

"With non-ARI Devices, PCI Express components are restricted to implementing 
a single Device Number on their primary interface (Upstream Port), but are 
permitted to implement up to eight
independent Functions within that Device Number. [...] Downstream Ports that 
do not have ARI Forwarding enabled must associate only Device 0 with the 
device [...].
With an ARI Device, its Device Number is implied to be 0 rather than 
specified by a field within an ID. The traditional 5-bit Device Number and 
3-bit Function Number fields in its associated
Routing IDs, Requester IDs, and Completer IDs are interpreted as a single 
8-bit Function Number."

There was also an older patch similar to yours here:

 
https://lore.kernel.org/all/33183CC9F5247A488A2544077AF1902086D6B3F5@SZXEMA503-MBS.china.huawei.com/T/

... but if I've got that right, it has never been merged?

  HTH,
   Thomas


