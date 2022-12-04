Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 56803641B4D
	for <lists+qemu-devel@lfdr.de>; Sun,  4 Dec 2022 08:25:47 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p1jM9-0007Ga-0h; Sun, 04 Dec 2022 02:24:09 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1p1jM3-0007FR-Qh
 for qemu-devel@nongnu.org; Sun, 04 Dec 2022 02:24:04 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1p1jM2-0006ru-8g
 for qemu-devel@nongnu.org; Sun, 04 Dec 2022 02:24:03 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1670138640;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=TZHMrIdpbpXrrX3N0RKr0QqqNPx8NkuTyDK8In45LHA=;
 b=IwprYMnvks9F/UR8RYkWbKA+McLEXAglAqzkL4ZjVPv6d/rbZaWzw5HsHJmxAumBL3uC7U
 nBpk2pWZ+mk25c4hqIOARkxPPguFnFijL1e+za1BRKOvrqSn4+/um1vQDRK3c4T0B6gAqW
 AY7AtbGwmQivjkVIznOdvlGHJgXYl80=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-376-pLWeUTsINaasW24wfahj8w-1; Sun, 04 Dec 2022 02:23:59 -0500
X-MC-Unique: pLWeUTsINaasW24wfahj8w-1
Received: by mail-wm1-f72.google.com with SMTP id
 bg25-20020a05600c3c9900b003cf3ed7e27bso5032804wmb.4
 for <qemu-devel@nongnu.org>; Sat, 03 Dec 2022 23:23:58 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:references:cc:to:from
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=TZHMrIdpbpXrrX3N0RKr0QqqNPx8NkuTyDK8In45LHA=;
 b=QnSffAyl3+IRBTAMOFkeGsKx5Se73wu98AQ5bz1gaLK4WX8dYpSQe0N3y7y6gIolRw
 dReNAs7UUDI5rPXxnLfKwyvrP0lxUcf5VJR5dac8ZnTvYBWCDRgBP/r8S+CceUMfCA6O
 y9fy+M1pXa2VBQrjNL/MDGsZJrGQJ62EnIpGFOeTbdF85e9A3IdHAwcTeGC2BjLhsQUg
 fpZhfDH7zOH5skCnxKgdOGaq2WvlU/6omVb7pIrSbOT/qv6M04xqcTW7R+Hmlr2UGT/E
 RAr7qKN1sOU07fe+LSUbKAJ5JsyO6pWlUZXzlWJU4Z1PAVGRSfq3gGEtDlEQwo/UYadw
 90eQ==
X-Gm-Message-State: ANoB5pnqiRY4Ko70sJUmOI4jTlFsDFGDTWkauE1Zq2xQp7bR1DE5K9xM
 tt/WZEQQm9Y3eKDHTHYsIVmv9OnYtkgjDghHi/vqHyrfPjNNQKRE11eVxth9VqOKlUlyCN4W8Th
 +Qngb3ghKFRYCyk0=
X-Received: by 2002:adf:ee12:0:b0:242:4903:3caa with SMTP id
 y18-20020adfee12000000b0024249033caamr4874068wrn.347.1670138638009; 
 Sat, 03 Dec 2022 23:23:58 -0800 (PST)
X-Google-Smtp-Source: AA0mqf6BBlTbaN4RuqIN8zI+HGXI6Awby0+YvE1TZn98LArCaM5jF3aIMtV0DnZlGKQvk+0zRAwOQA==
X-Received: by 2002:adf:ee12:0:b0:242:4903:3caa with SMTP id
 y18-20020adfee12000000b0024249033caamr4874059wrn.347.1670138637738; 
 Sat, 03 Dec 2022 23:23:57 -0800 (PST)
Received: from [192.168.8.102] (tmo-067-197.customers.d1-online.com.
 [80.187.67.197]) by smtp.gmail.com with ESMTPSA id
 j1-20020a05600c1c0100b003cfd4e6400csm15487364wms.19.2022.12.03.23.23.56
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 03 Dec 2022 23:23:56 -0800 (PST)
Message-ID: <06f4e22c-1c30-42a6-6f80-1f04e9d55c96@redhat.com>
Date: Sun, 4 Dec 2022 08:23:55 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [PULL 02/10] pci-bridge/cxl_downstream: Add a CXL switch
 downstream port
Content-Language: en-US
From: Thomas Huth <thuth@redhat.com>
To: "Michael S. Tsirkin" <mst@redhat.com>, qemu-devel@nongnu.org,
 Jonathan Cameron <Jonathan.Cameron@huawei.com>
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Ben Widawsky <ben.widawsky@intel.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>
References: <20220616165703.42226-1-mst@redhat.com>
 <20220616165703.42226-3-mst@redhat.com>
 <4274de61-292d-b3e0-8f86-d7000122a715@redhat.com>
In-Reply-To: <4274de61-292d-b3e0-8f86-d7000122a715@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -23
X-Spam_score: -2.4
X-Spam_bar: --
X-Spam_report: (-2.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.265, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

On 04/11/2022 07.47, Thomas Huth wrote:
> On 16/06/2022 18.57, Michael S. Tsirkin wrote:
>> From: Jonathan Cameron <Jonathan.Cameron@huawei.com>
>>
>> Emulation of a simple CXL Switch downstream port.
>> The Device ID has been allocated for this use.
>>
>> Signed-off-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>
>> Message-Id: <20220616145126.8002-3-Jonathan.Cameron@huawei.com>
>> Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
>> Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
>> Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
>> ---
>>   hw/cxl/cxl-host.c              |  43 +++++-
>>   hw/pci-bridge/cxl_downstream.c | 249 +++++++++++++++++++++++++++++++++
>>   hw/pci-bridge/meson.build      |   2 +-
>>   3 files changed, 291 insertions(+), 3 deletions(-)
>>   create mode 100644 hw/pci-bridge/cxl_downstream.c
> 
>   Hi!
> 
> There is a memory problem somewhere in this new device. I can make QEMU 
> crash by running something like this:
> 
> $ MALLOC_PERTURB_=59 ./qemu-system-x86_64 -M x-remote \
>      -display none -monitor stdio
> QEMU 7.1.50 monitor - type 'help' for more information
> (qemu) device_add cxl-downstream
> ./qemu/qom/object.c:1188:5: runtime error: member access within misaligned 
> address 0x3b3b3b3b3b3b3b3b for type 'struct Object', which requires 8 byte 
> alignment
> 0x3b3b3b3b3b3b3b3b: note: pointer points here
> <memory cannot be printed>
> Bus error (core dumped)
> 
> Could you have a look if you've got some spare minutes?

Ping! Jonathan, Michael, any news on this bug?

(this breaks one of my local tests, that's why it's annoying for me)

  Thomas


