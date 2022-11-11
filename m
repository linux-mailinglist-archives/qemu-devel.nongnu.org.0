Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 70B36625542
	for <lists+qemu-devel@lfdr.de>; Fri, 11 Nov 2022 09:28:36 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1otPLH-0003n5-LV; Fri, 11 Nov 2022 03:24:51 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1otPLF-0003jB-Sn
 for qemu-devel@nongnu.org; Fri, 11 Nov 2022 03:24:49 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1otPLE-0000e0-3g
 for qemu-devel@nongnu.org; Fri, 11 Nov 2022 03:24:49 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1668155087;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=khR7LBLZxLsDMTigqjxaJirmDpWh4RieDwn2RD3iyDU=;
 b=jD9r+aeFgb9szGc4v9G6XSQphnrUBEfjGwHLa5fkVrhmffL4TnudofgG5N2lbYei0/3fw+
 x+I53DM/ftd+XrHHm6a0W+qKCafJxBAM2yPrHz8cIwEDa6uyYQelh9LTvFOg3pqvopgXhL
 ohYzC6xtgKvYTxKjCJcG7mPNd4WbFBA=
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com
 [209.85.160.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-575-KXGxnRf-NxGNZiQHKVlbEQ-1; Fri, 11 Nov 2022 03:24:45 -0500
X-MC-Unique: KXGxnRf-NxGNZiQHKVlbEQ-1
Received: by mail-qt1-f198.google.com with SMTP id
 z11-20020a05622a028b00b003a550fa8989so3190421qtw.12
 for <qemu-devel@nongnu.org>; Fri, 11 Nov 2022 00:24:45 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=khR7LBLZxLsDMTigqjxaJirmDpWh4RieDwn2RD3iyDU=;
 b=Ahf0/ANiHCZAg3WFXxvXGc8CR8+46017XoYbseWKVBZTQIXup0n5LxRjeApJ0nVAin
 Yd4VuWUwKcIoVxI3zajXQqgdYsFWbR418LuXZcqnGueDZ93kZ6V2/AJYIKOtPByQPjN0
 /tw0GPRonpuWFFFfanu1oK25Ldv8ewufJEctTQfMg4UNb6S5hF4Qo2GJVrMkBafAhgLk
 7y3lYBUdQuXLo0cXuSXhS1q2K9AhYKFjTz8zkmjpj6GvVWedQFDdkDklrgYxZ8X4HnV5
 gCbjBcELH70c99hCDnoESRcX1jm4Ad8GTs4PbBaozAN/x9pbkD7xPLtcsCtftLO34QU2
 P+sw==
X-Gm-Message-State: ANoB5pl4UpecOWGPuF9Jv6IUWqzB5mFSMRGMCp0LO7Sg5HXGR+P0sWQw
 NCvCHtwsi7VAhfZ/+KPB/srRSWDK8A+mDutNM95QuSmzwvPzCA4vdi+GrDc/zQhOv8z/WYmq2rF
 zEDTHttkVknJzrSk=
X-Received: by 2002:a37:752:0:b0:6ec:5262:42ef with SMTP id
 79-20020a370752000000b006ec526242efmr250026qkh.318.1668155085341; 
 Fri, 11 Nov 2022 00:24:45 -0800 (PST)
X-Google-Smtp-Source: AA0mqf6JwrCAaqV/t0WIer9Je0FExmLgZmgqtDOI60ux0A3qF0V+Yfz73qB+4ibVrem99hS4Lft0+A==
X-Received: by 2002:a37:752:0:b0:6ec:5262:42ef with SMTP id
 79-20020a370752000000b006ec526242efmr250015qkh.318.1668155085093; 
 Fri, 11 Nov 2022 00:24:45 -0800 (PST)
Received: from [10.33.192.232] (nat-pool-str-t.redhat.com. [149.14.88.106])
 by smtp.gmail.com with ESMTPSA id
 l19-20020a05620a28d300b006cfaee39ccesm1074097qkp.114.2022.11.11.00.24.43
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 11 Nov 2022 00:24:44 -0800 (PST)
Message-ID: <60bec893-c0eb-d0a3-eee7-bcd7bc482361@redhat.com>
Date: Fri, 11 Nov 2022 09:24:42 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [PATCH for-7.2] Fix several typos in documentation (found by
 codespell)
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>, Stefan Weil <sw@weilnetz.de>
Cc: qemu-trivial@nongnu.org, qemu-devel@nongnu.org,
 Ani Sinha <ani@anisinha.ca>, Fam Zheng <fam@euphon.net>,
 Laurent Vivier <lvivier@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 David Hildenbrand <david@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 Eric Blake <eblake@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 "Michael S . Tsirkin" <mst@redhat.com>
References: <20221110190825.879620-1-sw@weilnetz.de>
 <CAFEAcA_BC8yK8LSPkJ=whtg3K6-zgSCxjOgkwhFMAVdk04Pv2w@mail.gmail.com>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <CAFEAcA_BC8yK8LSPkJ=whtg3K6-zgSCxjOgkwhFMAVdk04Pv2w@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
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

On 10/11/2022 21.10, Peter Maydell wrote:
> On Thu, 10 Nov 2022 at 19:09, Stefan Weil via <qemu-devel@nongnu.org> wrote:
>>
>> Those typos are in files which are used to generate the QEMU manual.
>>
>> Signed-off-by: Stefan Weil <sw@weilnetz.de>
>> ---
>>
>> I did not fix memory_region_init_resizeable_ram. That might be done after 7.2.
>>
>> Stefan
>>
>>   docs/devel/acpi-bits.rst       | 2 +-
>>   docs/system/devices/can.rst    | 2 +-
>>   hw/scsi/esp.c                  | 6 +++---
>>   include/exec/memory.h          | 6 +++---
>>   qapi/virtio.json               | 4 ++--
>>   qemu-options.hx                | 6 +++---
>>   tests/qtest/libqos/qgraph.h    | 2 +-
>>   tests/qtest/libqos/virtio-9p.c | 2 +-
>>   8 files changed, 15 insertions(+), 15 deletions(-)
>>
>> diff --git a/docs/devel/acpi-bits.rst b/docs/devel/acpi-bits.rst
>> index c9564d871a..5e22be8ef6 100644
>> --- a/docs/devel/acpi-bits.rst
>> +++ b/docs/devel/acpi-bits.rst
>> @@ -132,7 +132,7 @@ Under ``tests/avocado/`` as the root we have:
>>
>>      (a) They are python2.7 based scripts and not python 3 scripts.
>>      (b) They are run from within the bios bits VM and is not subjected to QEMU
>> -       build/test python script maintainance and dependency resolutions.
>> +       build/test python script maintenance and dependency resolutions.
>>      (c) They need not be loaded by avocado framework when running tests.
>>
>>
>> diff --git a/docs/system/devices/can.rst b/docs/system/devices/can.rst
>> index fe37af8223..24b0d4cf41 100644
>> --- a/docs/system/devices/can.rst
>> +++ b/docs/system/devices/can.rst
>> @@ -169,7 +169,7 @@ and with bitrate switch::
>>
>>     cangen can0 -b
>>
>> -The test can be run viceversa, generate messages in the guest system and capture them
>> +The test can be run vice-versa, generate messages in the guest system and capture them
>>   in the host one and much more combinations.
> 
> This isn't a grammatical use of vice-versa, so if we're touching it
> then I think the sentence should be recast, eg:
> "The test can also be run the other way around, generating
> messages in the guest system and capturing them in the host system.
> Other combinations are also possible."

Sounds reasonable! ... I'm currently assembling a pull request for misc 
fixes - I can add the patch there and fix the sentence while picking it up.

  Thomas


