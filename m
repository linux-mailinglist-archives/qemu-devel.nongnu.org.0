Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C5A93AE75B
	for <lists+qemu-devel@lfdr.de>; Mon, 21 Jun 2021 12:41:04 +0200 (CEST)
Received: from localhost ([::1]:60742 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lvHMV-0001lp-Do
	for lists+qemu-devel@lfdr.de; Mon, 21 Jun 2021 06:41:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37092)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lvGoc-0000Cr-KO; Mon, 21 Jun 2021 06:06:05 -0400
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335]:37859)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lvGoa-0002fm-S4; Mon, 21 Jun 2021 06:06:02 -0400
Received: by mail-wm1-x335.google.com with SMTP id
 f16-20020a05600c1550b02901b00c1be4abso13444004wmg.2; 
 Mon, 21 Jun 2021 03:06:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:from:to:cc:references:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=Ln0QXmGpg6stuNlBs4M18obb60C2r8Os+RELZeetFmg=;
 b=G24gOisJZGczuQU+y3FTvu8Af5NnxNZn+gMjpuwjJlcWc3d86hDhsbsW3RvCyKbkj0
 zOLMmYvFz7V1VTibxmEcOKHY/Lfd39yOTbNBjHks0VhtYvMrmsnkymotBsvPsY0BEqC+
 X11u7VtONyOrRb+ur1PZehHU6xj3482f23BuZsuxE6cqGz83t8huVFqWJ7BerCjgxZiM
 hfrE1TUABtaWVg3FKvbCTa83+j7HjYODJ4mOtooXYG9jz/DfuQHFoDyHLMoXOETT/hM5
 4uG8f3FGoTqqbpALbrKKefgvn15TU2yxSq2g2n8wgkNVWP0WpbZ7siluBHmV0/Bwt4fi
 OWoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:from:to:cc:references:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=Ln0QXmGpg6stuNlBs4M18obb60C2r8Os+RELZeetFmg=;
 b=jr//+RMqAWf55kx6tsb29HTeHPlluDLN/U3anSmub7jUP53ul6Y6XgencbmoZ61jKr
 FKdqv7sMGwYqhXlgHX348MUAbuUYOMCgzr8WySjlS0a22PvTxJ16WnSyp8JGbrszAPLY
 fGlYTmFlhTIfb+/K2pmU3KZ7kL3QnxUDLKriAmpwbHoPoGKw3sS/fD4ahqNxl7Okgcvt
 mMqwQGso/a1NeD/BrlQM5kc1evVaQ8l9I46S9BUY+2WUfpXWBJZZXNfxm5uwGV+/NuO4
 m3dMUyIGAy5yoDT3GgTCrZrlVshkbn68Og1e5EpMH8wa76pvLfYCGTnoYjeJf6cu5Eoq
 AnQg==
X-Gm-Message-State: AOAM5331OiKiLf+Y2emT9GzwVHbMG9Zs8m9C5/4waNtwoboAAVlYz4YB
 bkT/+DepT/YHnHagejqcks0=
X-Google-Smtp-Source: ABdhPJxOKyPR6T1IvVzH0qml71am9wYdPLj3kRL767Kv/k74uA+cknXJImyOJSN8xhGx8YsGQujBOw==
X-Received: by 2002:a05:600c:4f0c:: with SMTP id
 l12mr26234584wmq.93.1624269959210; 
 Mon, 21 Jun 2021 03:05:59 -0700 (PDT)
Received: from [192.168.1.36] (93.red-83-35-24.dynamicip.rima-tde.net.
 [83.35.24.93])
 by smtp.gmail.com with ESMTPSA id 197sm766945wmb.20.2021.06.21.03.05.57
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 21 Jun 2021 03:05:58 -0700 (PDT)
Subject: Re: [PATCH v2] hw/pci-host/q35: Ignore write of reserved PCIEXBAR
 LENGTH field
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
References: <20210526142438.281477-1-f4bug@amsat.org>
 <602ced9a-757d-f7f5-0ec8-1f8e8cab9a72@amsat.org>
Message-ID: <0f31c5b1-4d3d-75de-eb41-0fa2f0456615@amsat.org>
Date: Mon, 21 Jun 2021 12:05:57 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <602ced9a-757d-f7f5-0ec8-1f8e8cab9a72@amsat.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::335;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x335.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
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
Cc: Alexander Bulekov <alxndr@bu.edu>, Thomas Huth <thuth@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-stable@nongnu.org,
 "Michael S. Tsirkin" <mst@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

ping?

On 6/14/21 1:14 PM, Philippe Mathieu-Daudé wrote:
> ping?
> 
> On 5/26/21 4:24 PM, Philippe Mathieu-Daudé wrote:
>> libFuzzer triggered the following assertion:
>>
>>   cat << EOF | qemu-system-i386 -M pc-q35-5.0 \
>>     -nographic -monitor none -serial none \
>>     -qtest stdio -d guest_errors -trace pci\*
>>   outl 0xcf8 0xf2000060
>>   outl 0xcfc 0x8400056e
>>   EOF
>>   pci_cfg_write mch 00:0 @0x60 <- 0x8400056e
>>   Aborted (core dumped)
>>
>> This is because guest wrote MCH_HOST_BRIDGE_PCIEXBAR_LENGTH_RVD
>> (reserved value) to the PCIE XBAR register.
>>
>> There is no indication on the datasheet about what occurs when
>> this value is written. Simply ignore it on QEMU (and report an
>> guest error):
>>
>>   pci_cfg_write mch 00:0 @0x60 <- 0x8400056e
>>   Q35: Reserved PCIEXBAR LENGTH
>>   pci_cfg_read mch 00:0 @0x0 -> 0x8086
>>   pci_cfg_read mch 00:0 @0x0 -> 0x29c08086
>>   ...
>>
>> Cc: qemu-stable@nongnu.org
>> Reported-by: Alexander Bulekov <alxndr@bu.edu>
>> BugLink: https://bugs.launchpad.net/qemu/+bug/1878641
>> Fixes: df2d8b3ed4 ("q35: Introduce q35 pc based chipset emulator")
>> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
>> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
>> ---
>> v2: Do not remove default case (rth)
>> ---
>>  hw/pci-host/q35.c | 3 +++
>>  1 file changed, 3 insertions(+)
>>
>> diff --git a/hw/pci-host/q35.c b/hw/pci-host/q35.c
>> index 2eb729dff58..0f37cf056a9 100644
>> --- a/hw/pci-host/q35.c
>> +++ b/hw/pci-host/q35.c
>> @@ -29,6 +29,7 @@
>>   */
>>  
>>  #include "qemu/osdep.h"
>> +#include "qemu/log.h"
>>  #include "hw/i386/pc.h"
>>  #include "hw/pci-host/q35.h"
>>  #include "hw/qdev-properties.h"
>> @@ -318,6 +319,8 @@ static void mch_update_pciexbar(MCHPCIState *mch)
>>          addr_mask |= MCH_HOST_BRIDGE_PCIEXBAR_64ADMSK;
>>          break;
>>      case MCH_HOST_BRIDGE_PCIEXBAR_LENGTH_RVD:
>> +        qemu_log_mask(LOG_GUEST_ERROR, "Q35: Reserved PCIEXBAR LENGTH\n");
>> +        return;
>>      default:
>>          abort();
>>      }
>>
> 

