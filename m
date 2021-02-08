Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8AAC7312A31
	for <lists+qemu-devel@lfdr.de>; Mon,  8 Feb 2021 06:47:09 +0100 (CET)
Received: from localhost ([::1]:34358 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l8zO7-00077s-VK
	for lists+qemu-devel@lfdr.de; Mon, 08 Feb 2021 00:47:08 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:55490)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1l8zLN-0006W9-UC
 for qemu-devel@nongnu.org; Mon, 08 Feb 2021 00:44:18 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:56258)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1l8zLK-0005Jy-KT
 for qemu-devel@nongnu.org; Mon, 08 Feb 2021 00:44:17 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1612763053;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=kek93R4Qa6xUidcbLZwoMmO8xTH5LZUqo9CuAfXv1Lg=;
 b=CufDhShHHkLxyVLRkfIinMugG4ekkjETeYclq6/bobXMt3LLxDHLyXMb6fMjWJJeXqbVw3
 pSgByOmZ5JuuWd5N8d20GTnMYkAA8bkNG1CuEH8vk9HDU+NFJPJLLwykjR9zjNCU1QZeSe
 2CU/FNqxjKSN3ucrirb4s5Ik1nK4jZY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-522-oz9XIvCiMrK8v2i7p7mAMA-1; Mon, 08 Feb 2021 00:44:09 -0500
X-MC-Unique: oz9XIvCiMrK8v2i7p7mAMA-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 953BE801965;
 Mon,  8 Feb 2021 05:44:07 +0000 (UTC)
Received: from thuth.remote.csb (ovpn-112-117.ams2.redhat.com [10.36.112.117])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 498981C947;
 Mon,  8 Feb 2021 05:43:50 +0000 (UTC)
Subject: Re: [PULL v3 11/27] multi-process: setup PCI host bridge for remote
 device
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>, qemu-devel@nongnu.org
References: <20210205164459.432714-1-stefanha@redhat.com>
 <20210205164459.432714-12-stefanha@redhat.com>
 <353e7615-4860-d0d0-1f52-b448559e7629@redhat.com>
From: Thomas Huth <thuth@redhat.com>
Message-ID: <3adfa0ad-1d85-b74c-d35b-edf15d83d48f@redhat.com>
Date: Mon, 8 Feb 2021 06:43:50 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <353e7615-4860-d0d0-1f52-b448559e7629@redhat.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -33
X-Spam_score: -3.4
X-Spam_bar: ---
X-Spam_report: (-3.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.569,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=-0.01,
 RCVD_IN_MSPIKE_WL=-0.01, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Fam Zheng <fam@euphon.net>, John G Johnson <john.g.johnson@oracle.com>,
 Jagannathan Raman <jag.raman@oracle.com>,
 Eduardo Habkost <ehabkost@redhat.com>, qemu-block@nongnu.org,
 "Michael S. Tsirkin" <mst@redhat.com>, "Denis V. Lunev" <den@openvz.org>,
 =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 Elena Ufimtseva <elena.ufimtseva@oracle.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Igor Mammedov <imammedo@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 06/02/2021 18.57, Philippe Mathieu-Daudé wrote:
> On 2/5/21 5:44 PM, Stefan Hajnoczi wrote:
>> From: Jagannathan Raman <jag.raman@oracle.com>
>>
>> PCI host bridge is setup for the remote device process. It is
>> implemented using remote-pcihost object. It is an extension of the PCI
>> host bridge setup by QEMU.
>> Remote-pcihost configures a PCI bus which could be used by the remote
>> PCI device to latch on to.
>>
>> Signed-off-by: Jagannathan Raman <jag.raman@oracle.com>
>> Signed-off-by: John G Johnson <john.g.johnson@oracle.com>
>> Signed-off-by: Elena Ufimtseva <elena.ufimtseva@oracle.com>
>> Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>
>> Message-id: 0871ba857abb2eafacde07e7fe66a3f12415bfb2.1611938319.git.jag.raman@oracle.com
>> Signed-off-by: Stefan Hajnoczi <stefanha@redhat.com>
>> ---
>>   MAINTAINERS                  |  2 +
>>   include/hw/pci-host/remote.h | 29 ++++++++++++++
>>   hw/pci-host/remote.c         | 75 ++++++++++++++++++++++++++++++++++++
>>   hw/pci-host/Kconfig          |  3 ++
>>   hw/pci-host/meson.build      |  1 +
>>   hw/remote/Kconfig            |  1 +
>>   6 files changed, 111 insertions(+)
>>   create mode 100644 include/hw/pci-host/remote.h
>>   create mode 100644 hw/pci-host/remote.c
> ...
> 
>> +static const TypeInfo remote_pcihost_info = {
>> +    .name = TYPE_REMOTE_PCIHOST,
>> +    .parent = TYPE_PCIE_HOST_BRIDGE,
> 
>                   ^^^^^^^^^^^^^^^^^^^^^
> 
>> +    .instance_size = sizeof(RemotePCIHost),
>> +    .class_init = remote_pcihost_class_init,
>> +};
>> +
>> +static void remote_pcihost_register(void)
>> +{
>> +    type_register_static(&remote_pcihost_info);
>> +}
>> +
>> +type_init(remote_pcihost_register)
>> diff --git a/hw/pci-host/Kconfig b/hw/pci-host/Kconfig
>> index eb03f0489d..8b8c763c28 100644
>> --- a/hw/pci-host/Kconfig
>> +++ b/hw/pci-host/Kconfig
>> @@ -65,3 +65,6 @@ config PCI_POWERNV
>>       select PCI_EXPRESS
>>       select MSI_NONBROKEN
>>       select PCIE_PORT
>> +
>> +config REMOTE_PCIHOST
>> +    bool
> 
>         select CONFIG_PCI_EXPRESS ?
> 
> (Reported by Peter Maydell on s390x)
> 
> Side question, does it make sense to enable this feature by
> default on all architectures?

Certainly not.

  Thomas


