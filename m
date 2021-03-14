Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D47133A8DA
	for <lists+qemu-devel@lfdr.de>; Mon, 15 Mar 2021 00:37:41 +0100 (CET)
Received: from localhost ([::1]:35646 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lLaIm-0000Da-3D
	for lists+qemu-devel@lfdr.de; Sun, 14 Mar 2021 19:37:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44874)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lLaD3-0002ie-KE
 for qemu-devel@nongnu.org; Sun, 14 Mar 2021 19:31:45 -0400
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d]:41954)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lLaD2-0004f5-2M
 for qemu-devel@nongnu.org; Sun, 14 Mar 2021 19:31:45 -0400
Received: by mail-wr1-x42d.google.com with SMTP id b9so4818727wrt.8
 for <qemu-devel@nongnu.org>; Sun, 14 Mar 2021 16:31:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=klvomqH+zlcDQAFtx7QL3nkbSJYudjGmK/2ZctWu2ts=;
 b=GZmLB8aziv+crtEiwZYXlTmysjO90TeftiZrTHFjNPziDgznCsn3uNgTl+fyftt4Rv
 sDQOxiqKAGEjaHBY6VAypCBRknXNeS8i3CxBdrHKutbXqozcVeofC6Xkdr8GVCKpMHDj
 trmN7rpem4jxQai5p6PjuYRIBDVmBnFK0sW9x3IgmmRBf7SBvIWAydPT6fVJqV0C2uU0
 vlHpKDCqpIiLEjCndcJ76HjTH6h3KGquDJIy4YJ7FPV0aI+OWj8zQoGnntML0cFhj+tl
 p05RvqiZyTJF3pMTPmdBa1r1Bd6ufGBcGJ7AP9zxime56aOqtznIG9o7p5YbbIhnFDdj
 DrOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=klvomqH+zlcDQAFtx7QL3nkbSJYudjGmK/2ZctWu2ts=;
 b=PPea3SaIj/ls/XkAd90ReUgP/RkJANZUx1kAMpKJuXfI+/7TVn/mNkW8v/wUzpzH1J
 cpcpxBEqmR3IyZjGSkTvqU6cSjCSp/1IkRIm6qfG3LbwyvQWpXzbmqUaIM3MWOYJuaLk
 MZ/Qa/B8JHQczQ4PN9jZVJ1xESXzVsKbxfllqaG2JMK8xridCCQcAkiMecEHGkk+zSEa
 cvKT5/s33RqmGeMy2bsEMD6mo5pZtaaDOcfZJfqz9+JeyZADZxswxsRs3LOzy8MqXUq5
 Dt8ROlxdAwBybGOEQOnJs0iQtriNtewJwIu2Iq891cwVxJN9Ju+96eS9QEKdWCMmCFQ4
 tW2w==
X-Gm-Message-State: AOAM5315FGMdCcYmTBxTlkj/IvnfumPZVu5iN6gT1jBrTc0x1O+38Iz+
 Ro3oSrshte6as7Sj8lKzO1u0cRNBVue7Lw==
X-Google-Smtp-Source: ABdhPJy71S8X4hMumdL6RWL3dxdBMK0kfLO/2gNGPrqojTP/eKpGEHADEKBubfybvxP7KtYQZyLg1Q==
X-Received: by 2002:adf:f9d0:: with SMTP id w16mr25343317wrr.336.1615764702544; 
 Sun, 14 Mar 2021 16:31:42 -0700 (PDT)
Received: from [192.168.1.36] (17.red-88-21-201.staticip.rima-tde.net.
 [88.21.201.17])
 by smtp.gmail.com with ESMTPSA id p17sm9889383wmq.47.2021.03.14.16.31.41
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 14 Mar 2021 16:31:42 -0700 (PDT)
Subject: Re: [PATCH] fuzz: check machine, before PC-specific code
To: Alexander Bulekov <alxndr@bu.edu>, qemu-devel@nongnu.org
References: <20210314231015.29166-1-alxndr@bu.edu>
 <20210314231312.q7oykvk7ijoqj6oj@mozz.bu.edu>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <205d92e8-3a4d-ba81-ed84-c37ceec11b27@amsat.org>
Date: Mon, 15 Mar 2021 00:31:40 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <20210314231312.q7oykvk7ijoqj6oj@mozz.bu.edu>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42d;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x42d.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Laurent Vivier <lvivier@redhat.com>, Thomas Huth <thuth@redhat.com>,
 darren.kenny@oracle.com, Bandan Das <bsd@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 3/15/21 12:13 AM, Alexander Bulekov wrote:
> On 210314 1910, Alexander Bulekov wrote:
>> We enumerate PCI devices on PC machines, but this breaks the fuzzer for
>> non-PC machines and architectures. Add checks to avoid this.
>>
>> Reported-by: Philippe Mathieu-Daudé <philmd@redhat.com>
>> Signed-off-by: Alexander Bulekov <alxndr@bu.edu>
>> ---
>>  tests/qtest/fuzz/generic_fuzz.c | 11 ++++++++---
>>  1 file changed, 8 insertions(+), 3 deletions(-)
>>
>> diff --git a/tests/qtest/fuzz/generic_fuzz.c b/tests/qtest/fuzz/generic_fuzz.c
>> index ee8c17a04c..d2b74028fe 100644
>> --- a/tests/qtest/fuzz/generic_fuzz.c
>> +++ b/tests/qtest/fuzz/generic_fuzz.c
>> @@ -784,6 +784,7 @@ static void generic_pre_fuzz(QTestState *s)
>>      MemoryRegion *mr;
>>      QPCIBus *pcibus;
>>      char **result;
>> +    const char* machine_type;
>>  
>>      if (!getenv("QEMU_FUZZ_OBJECTS")) {
>>          usage();
>> @@ -827,9 +828,13 @@ static void generic_pre_fuzz(QTestState *s)
>>          exit(1);
>>      }
>>  
>> -    pcibus = qpci_new_pc(s, NULL);
>> -    g_ptr_array_foreach(fuzzable_pci_devices, pci_enum, pcibus);
>> -    qpci_free_pc(pcibus);
>> +    machine_type = object_get_typename(qdev_get_machine());
>> +    if(fuzzable_pci_devices->len && strstr(machine_type, "pc") == machine_type)
>                                   Should at least be "pc-" --^
> Maybe there's a more cannonical way to do this..

This doesn't scale with tests/qtest/libqos/pci-spapr.h :(

Maybe use the QOSOps structures?

> -Alex
> 
>> +    {
>> +        pcibus = qpci_new_pc(s, NULL);
>> +        g_ptr_array_foreach(fuzzable_pci_devices, pci_enum, pcibus);
>> +        qpci_free_pc(pcibus);
>> +    }
>>  
>>      counter_shm_init();
>>  }
>> -- 
>> 2.27.0
>>
> 

