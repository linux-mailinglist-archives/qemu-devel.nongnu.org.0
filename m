Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E710C4055B5
	for <lists+qemu-devel@lfdr.de>; Thu,  9 Sep 2021 15:34:48 +0200 (CEST)
Received: from localhost ([::1]:49378 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mOKCW-0000jW-1m
	for lists+qemu-devel@lfdr.de; Thu, 09 Sep 2021 09:34:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45112)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mOKBC-00080e-FG
 for qemu-devel@nongnu.org; Thu, 09 Sep 2021 09:33:26 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:58371)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mOKB9-0001Dc-TQ
 for qemu-devel@nongnu.org; Thu, 09 Sep 2021 09:33:26 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1631194403;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=G2KU1mNVKb0Wx/MrZntkVbBKPr6EYJoOv0hNcHd86Hg=;
 b=H+affORhlJTw1NfzMTInPdiPBTHvV7K8RxypeBvJfO3ZfoFQzMlwRxeYbs6Y0yxTgQcaLw
 i/t/kd6cO2YZNAAs+isj5IiMdRD/4lZIlV+IbS68ZlY8meP+Oy1XgcrHJpXth29bYzIp4i
 wJPu+TsdWWGH39E9Sr841chB35rReOg=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-139-EAulhvy1NrSpt18QS5wPEg-1; Thu, 09 Sep 2021 09:33:21 -0400
X-MC-Unique: EAulhvy1NrSpt18QS5wPEg-1
Received: by mail-wr1-f72.google.com with SMTP id
 p10-20020adfce0a000000b001572d05c970so510905wrn.21
 for <qemu-devel@nongnu.org>; Thu, 09 Sep 2021 06:33:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:from:to:cc:references:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=G2KU1mNVKb0Wx/MrZntkVbBKPr6EYJoOv0hNcHd86Hg=;
 b=nExGRLIGlb3coNhojqJNh2fQCBaPsXlph5IpCmiiAi5RJixw3Jb4QsySNigH5b4Br7
 nV8TfeqVcV2cvfCR6OG9KPzmjAyhYo0kFmMm87tYjLt4f9teyDhg17GZlC0tLHDlr4n6
 j2UwZltzX2c+qSPSg+u19D7VmFFBT1rvPuOmvolaFbKRz9YoV+lnbpnBmuLanmCiklwq
 yKbDNsSw0cEHJiXYpVqa8tscKHOmv7AWhPwEGRwjHXBj0G5uXc4p8hOaoomuaUPuY4MH
 MWUwNnq2cXLgK0k5/jZYebLezn7Y9z22yp/TGJBiHv+Pdu2TZzXOYSnRPQVYJF+RpaQx
 Lsag==
X-Gm-Message-State: AOAM531Ge6+f93svjFzj8clgkZ7MtqnkfoCsGG04hMgt3zM+jQ49jtZe
 xTngivDEPosd5l5hPRc5n4HqD2naF5JVZbtOoIGcpygK8Z2eolMo0/hP6fjecEIVkbYK11H+jMH
 Umude2asWs/hR6Gk=
X-Received: by 2002:adf:db07:: with SMTP id s7mr3784052wri.106.1631194399835; 
 Thu, 09 Sep 2021 06:33:19 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJy2lXjJLkcXxbaV3KMlmXJ9eHl4aUJ3Kwu2Y8rc4Da5Ey9q88YxYwa2lSsw8mitxOJBVbHckg==
X-Received: by 2002:adf:db07:: with SMTP id s7mr3784022wri.106.1631194399614; 
 Thu, 09 Sep 2021 06:33:19 -0700 (PDT)
Received: from [192.168.1.36] (21.red-83-52-55.dynamicip.rima-tde.net.
 [83.52.55.21])
 by smtp.gmail.com with ESMTPSA id q13sm1777650wrv.79.2021.09.09.06.33.18
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 09 Sep 2021 06:33:19 -0700 (PDT)
Subject: Re: [PULL v4 35/43] Kconfig: Add CONFIG_SGX support
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org, Yang Zhong <yang.zhong@intel.com>
References: <20210908100426.264356-1-pbonzini@redhat.com>
 <20210908100426.264356-36-pbonzini@redhat.com>
 <e76efd92-dad7-12e2-d5ca-08609f641baa@redhat.com>
Message-ID: <f8078ddf-a71a-4e17-bb45-0c04c0b509e8@redhat.com>
Date: Thu, 9 Sep 2021 15:33:18 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <e76efd92-dad7-12e2-d5ca-08609f641baa@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -51
X-Spam_score: -5.2
X-Spam_bar: -----
X-Spam_report: (-5.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.393,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-1.975, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, Markus Armbruster <armbru@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 9/9/21 3:16 PM, Philippe Mathieu-Daudé wrote:
> On 9/8/21 12:04 PM, Paolo Bonzini wrote:
>> From: Yang Zhong <yang.zhong@intel.com>
>>
>> Add new CONFIG_SGX for sgx support in the Qemu, and the Kconfig
>> default enable sgx in the i386 platform.
>>
>> Signed-off-by: Yang Zhong <yang.zhong@intel.com>
>> Message-Id: <20210719112136.57018-32-yang.zhong@intel.com>
>> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
>> ---
>>  backends/meson.build                     |  2 +-
>>  configs/devices/i386-softmmu/default.mak |  1 +
>>  hw/i386/Kconfig                          |  5 +++++
>>  hw/i386/meson.build                      |  4 ++--
>>  hw/i386/sgx-stub.c                       | 13 +++++++++++++
>>  5 files changed, 22 insertions(+), 3 deletions(-)
>>  create mode 100644 hw/i386/sgx-stub.c

>> diff --git a/hw/i386/sgx-stub.c b/hw/i386/sgx-stub.c
>> new file mode 100644
>> index 0000000000..edf17c3309
>> --- /dev/null
>> +++ b/hw/i386/sgx-stub.c
> 
> Ah, here comes the stub.
> 
>> @@ -0,0 +1,13 @@
>> +#include "qemu/osdep.h"
>> +#include "hw/i386/pc.h"
>> +#include "hw/i386/sgx-epc.h"
>> +
>> +void pc_machine_init_sgx_epc(PCMachineState *pcms)
>> +{
>> +    return;
> 
> Nack.
> 
> If an user tries to use sgx-epc.0.memdev=memid with a build with SGX
> not built in, you silently ignore the security request and keep booting
> the machine... Use something like:
> 
>     error_report("Support for SGX EPC not built-in");
>     exit(EXIT_FAILURE);
> 
> Or better pass an Error* argument to pc_machine_init_sgx_epc() to
> propagate the error.

If this get merged, please send a follow up patch to clean that.

>> +}
>> +
>> +int sgx_epc_get_section(int section_nr, uint64_t *addr, uint64_t *size)
>> +{
>> +    return 1;
> 
> No, this code is unreachable:
> 
>        g_assert_not_reached();
> 
>> +}
>>
> 


