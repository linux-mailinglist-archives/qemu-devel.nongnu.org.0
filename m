Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 944D32D5BFE
	for <lists+qemu-devel@lfdr.de>; Thu, 10 Dec 2020 14:38:21 +0100 (CET)
Received: from localhost ([::1]:36906 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1knM9E-0008JU-Ib
	for lists+qemu-devel@lfdr.de; Thu, 10 Dec 2020 08:38:20 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:42064)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1knLjr-0002Ow-DZ
 for qemu-devel@nongnu.org; Thu, 10 Dec 2020 08:12:07 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:53924)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1knLjn-0007dC-90
 for qemu-devel@nongnu.org; Thu, 10 Dec 2020 08:12:06 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1607605922;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=xnmCe49j2JVqxIbLsFO/spJP9MaEnOzKqAmwbMjZ5GM=;
 b=DyhB6WzXyRB8Fvl8sEscSDIAnmD3Wz1gkjjYl5kO+yGiGdRPdEeIF4Dyu0AbBS4Av031cP
 7vb9u4vksP4E5RTCLe77Z/xQw3ilLo3GNlDtvfDeQKYdalSGFtN81RjsQRQWDByeWGPG0B
 YKJZDRld/K58EWZHEim9akJzG1IITvE=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-11-YhG3fb3cO7uToDnRMrUh9Q-1; Thu, 10 Dec 2020 08:12:00 -0500
X-MC-Unique: YhG3fb3cO7uToDnRMrUh9Q-1
Received: by mail-wr1-f72.google.com with SMTP id b8so1915254wrv.14
 for <qemu-devel@nongnu.org>; Thu, 10 Dec 2020 05:12:00 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=xnmCe49j2JVqxIbLsFO/spJP9MaEnOzKqAmwbMjZ5GM=;
 b=KO9s9NKkzYS73zbVbR+yb98aa+5Cc07HuBivcW+2gioFLTlsLxuEDJ/3OhXn3LeaAe
 3BHzQbJz5YWxEgQOVSMVtYGxnwBqgX0kW26NoCXGOFQ8kVwSOPP/07bMPM+vDb0iSWl6
 EAFX/gTCQXTjOfxlA/gwgAZ2BqRUlwb2HhZ5Y9WAu3FXIvEIrC4pkuV+xK5E5Q8Sqwh7
 KZaLpWfCoBTEm4k8xkN9OMJnoK1Gz8z7NeIuIQCYLzjhZPibe2AruJLkMaJd+DHHR7Tf
 Gpslp9Hjmcm0qYd1CSqenYCb0dMuqqpwy5pidwan9OYgKuJgQW+V8Gmi+/VUfZ/37fNG
 tsFA==
X-Gm-Message-State: AOAM531OeOfS9ngUOZpcRWe/Mp83/1ygPOqD7wic41nJdebW6nrSha/m
 ycjPo3b+AYTFSpibY+X0OHJ7lo1M7cZhXiCpGaRa9FDWAH5ylvYYSNSEB3uCTDY9zopMI0Qh96F
 WXKN8LFB3GyFkhVQ=
X-Received: by 2002:a1c:7dd8:: with SMTP id y207mr8282287wmc.181.1607605919337; 
 Thu, 10 Dec 2020 05:11:59 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxPhuVjbaPgRDXOB72vfgwdy3SQvaeUvATFI++mkflaRNRlbxMYDmad2o1uk/3peIT9AzkMvA==
X-Received: by 2002:a1c:7dd8:: with SMTP id y207mr8282259wmc.181.1607605919090; 
 Thu, 10 Dec 2020 05:11:59 -0800 (PST)
Received: from [192.168.1.36] (101.red-88-21-206.staticip.rima-tde.net.
 [88.21.206.101])
 by smtp.gmail.com with ESMTPSA id a144sm9171350wmd.47.2020.12.10.05.11.57
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 10 Dec 2020 05:11:58 -0800 (PST)
Subject: Re: [PATCH] fuzz: map all BARs and enable PCI devices
To: Darren Kenny <darren.kenny@oracle.com>, Alexander Bulekov
 <alxndr@bu.edu>, qemu-devel@nongnu.org, Thomas Huth <thuth@redhat.com>
References: <20201209201054.391408-1-alxndr@bu.edu> <m2im99ao4m.fsf@oracle.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <114d98b5-5c4e-6315-d91d-92c6baf49d09@redhat.com>
Date: Thu, 10 Dec 2020 14:11:57 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.0
MIME-Version: 1.0
In-Reply-To: <m2im99ao4m.fsf@oracle.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
Cc: Laurent Vivier <lvivier@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Bandan Das <bsd@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 12/10/20 12:36 PM, Darren Kenny wrote:
> Hi Alex,
> 
> On Wednesday, 2020-12-09 at 15:10:54 -05, Alexander Bulekov wrote:
>> Prior to this patch, the fuzzer found inputs to map PCI device BARs and
>> enable the device. While it is nice that the fuzzer can do this, it
>> added significant overhead, since the fuzzer needs to map all the
>> BARs (regenerating the memory topology), at the start of each input.
>> With this patch, we do this once, before fuzzing, mitigating some of
>> this overhead.
>>
>> Signed-off-by: Alexander Bulekov <alxndr@bu.edu>
> 
> In general this looks good, I've a small comment/nit below, but nothing
> serious, so:
> 
> Reviewed-by: Darren Kenny <darren.kenny@oracle.com>
> 
>> ---
>>  tests/qtest/fuzz/generic_fuzz.c | 23 +++++++++++++++++++++++
>>  1 file changed, 23 insertions(+)
>>
>> diff --git a/tests/qtest/fuzz/generic_fuzz.c b/tests/qtest/fuzz/generic_fuzz.c
>> index 07ad690683..d95093ee53 100644
>> --- a/tests/qtest/fuzz/generic_fuzz.c
>> +++ b/tests/qtest/fuzz/generic_fuzz.c
>> @@ -16,6 +16,7 @@
>>  
>>  #include "hw/core/cpu.h"
>>  #include "tests/qtest/libqos/libqtest.h"
>> +#include "tests/qtest/libqos/pci-pc.h"
>>  #include "fuzz.h"
>>  #include "fork_fuzz.h"
>>  #include "exec/address-spaces.h"
>> @@ -762,6 +763,22 @@ static int locate_fuzz_objects(Object *child, void *opaque)
>>      return 0;
>>  }
>>  
>> +
>> +static void pci_enum(gpointer pcidev, gpointer bus)
>> +{
>> +    PCIDevice *dev = pcidev;
>> +    QPCIDevice *qdev;
>> +
>> +    qdev = qpci_device_find(bus, dev->devfn);
>> +    g_assert(qdev != NULL);
>> +    for (int i = 0; i < 6; i++) {
>> +        if (dev->io_regions[i].size) {
>> +            qpci_iomap(qdev, i, NULL);
>> +        }
>> +    }
>> +    qpci_device_enable(qdev);
>> +}
>> +
>>  static void generic_pre_fuzz(QTestState *s)
>>  {
>>      GHashTableIter iter;
>> @@ -810,6 +827,12 @@ static void generic_pre_fuzz(QTestState *s)
>>          exit(1);
>>      }
>>  
>> +    QPCIBus *pcibus;
> 
> NIT: I'm not a huge fan of defining variables in the middle of code,
>      call me old-fashioned if you will, but I tend to prefer them at the
>      top of the function, or block ;)

This is barely tolerated in for(;;) loops.

See commit 7be41675f7c ("configure: Force the C standard to gnu99")
and QEMU CODING_STYLE.rst:

 Declarations
 ============

 Mixed declarations (interleaving statements and declarations within
 blocks) are generally not allowed; declarations should be at the
 beginning of blocks.

 Every now and then, an exception is made for declarations inside a
 #ifdef or #ifndef block: if the code looks nicer, such declarations can
 be placed at the top of the block even if there are statements above.
 On the other hand, however, it's often best to move that #ifdef/#ifndef
 block to a separate function altogether.

Regards,

Phil.


